create or replace package body text_data

as

  function markov_triples (
    r_country         varchar2        default null
  )
  return mc_key_rec_list
  pipelined

  as

    l_ret_var               mc_key_rec;
    l_country               varchar2(10) := markov_triples.r_country;

    cursor get_triplets(text_source varchar2) is
      select
        lag(elem,2,'') over (order by wnum) as dprev_word
        , lag(elem,1,'') over (order by wnum) as prev_word
        , elem
      from (
        select
          rownum as wnum
          , regexp_substr(text_source,'[^ ]+', 1, level) elem
        from
          dual
        connect by
          regexp_substr(text_source, '[^ ]+', 1, level) is not null
      );

  begin

    dbms_application_info.set_action('markov_triples');

    for x in get_triplets(text_data.markov_sources(l_country)) loop
      l_ret_var.markov_prefix1 := x.dprev_word;
      l_ret_var.markov_prefix2 := x.prev_word;
      l_ret_var.markov_suffix := x.elem;

      pipe row(l_ret_var);
      l_ret_var := null;
    end loop;

    dbms_application_info.set_action(null);

    return;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end markov_triples;

  function markov_sentence (
    r_words           number          default null
    , r_country       varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_country               varchar2(10) := markov_sentence.r_country;
    l_markov_map            markov_map_t;
    l_key                   varchar2(150);
    l_words                 number := markov_sentence.r_words;
    l_word_count            number;
    l_seed                  number;
    l_seed_count            number;
    l_seed_idx              varchar2(150);
    l_seed_word1            varchar2(150);
    l_seed_word2            varchar2(150);

  begin

    dbms_application_info.set_action('markov_sentence');

    if l_words is null then
      l_words := core_random.r_natural(7,15);
    end if;

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_markov_text_implemented);
    elsif not util_random.ru_inlist(core_random_v.g_markov_text_implemented, l_country) then
      l_country := util_random.ru_pickone(core_random_v.g_markov_text_implemented);
    end if;

    -- Build markov map.
    for x in (select rownum, markov_prefix1, markov_prefix2, markov_suffix from table(text_data.markov_triples(l_country))) loop
      l_key := x.markov_prefix1 || ' ' || x.markov_prefix2;
      if l_markov_map.exists(l_key) then
        l_markov_map(l_key) := l_markov_map(l_key) || ',' || x.markov_suffix;
      else
        l_markov_map(l_key) := x.markov_suffix;
      end if;
      l_word_count := x.rownum;
    end loop;

    -- We initiate the seed.
    l_seed := core_random.r_natural(1, l_markov_map.count);
    l_seed_idx := l_markov_map.first;
    l_seed_count := 1;
    while l_seed_idx is not null loop
      if l_seed_count = l_seed then
        -- l_seed_word := initcap(util_random.ru_pickone(l_markov_map(l_seed_idx)));
        -- l_seed_word := l_seed_word || ' ' || util_random.ru_pickone(l_markov_map(l_markov_map.next(l_seed_idx)));
        l_seed_word1 := substr(l_seed_idx, 1, instr(l_seed_idx, ' ') - 1);
        l_seed_word2 := substr(l_seed_idx, instr(l_seed_idx, ' ') + 1);
        l_seed_idx := null;
      elsif l_seed_count < l_seed then
        l_seed_idx := l_markov_map.next(l_seed_idx);
        l_seed_count := l_seed_count + 1;
      else
        l_seed_idx := null;
      end if;
    end loop;
    -- Set the first word.
    l_ret_var := initcap(l_seed_word1);

    -- Now we just follow the trail until the sentence is the length we want.
    while (regexp_count(l_ret_var, ' ') + 1) < l_words loop
      l_seed_idx := util_random.ru_pickone(l_markov_map(l_seed_word1 || ' ' || l_seed_word2));
      l_seed_word1 := l_seed_word2;
      l_seed_word2 := l_seed_idx;
      l_ret_var := l_ret_var || ' ' || l_seed_idx;
    end loop;

    -- Finalize the sentence.
    l_ret_var := l_ret_var || '.';

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end markov_sentence;

begin

  dbms_application_info.set_client_info('text_data');
  dbms_session.set_identifier('text_data');

  -- Init markov sources.
  init_data := text_data_us.npg_version;

end text_data;
/
