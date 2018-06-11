create or replace package body text_random

as

  function r_syllable (
    r_country         varchar2        default core_random_v.g_default_country_code
  )
  return varchar2

  as

    l_ret_var               varchar2(30);
    l_syllable_length       number := core_random.r_natural(2,3);
    l_syllable_onset        varchar2(10);
    l_syllable_nucleus      varchar2(10);
    l_syllable_coda         varchar2(10);


  begin

    dbms_application_info.set_action('r_syllable');

    if r_country = 'CN' then
      l_ret_var := core_random.r_character(r_country => r_country);
    else
      -- For now we are building the syllable really easy, and only with "English" tonation.
      l_syllable_onset := core_random.r_character(core_random_v.g_easy_consonants);
      l_syllable_nucleus := core_random.r_character(core_random_v.g_vowels);
      -- In case we have "3" length syllable add the coda
      if l_syllable_length = 3 then
        l_syllable_coda := core_random.r_character(core_random_v.g_easy_consonants);
      end if;
      l_ret_var := l_syllable_onset || l_syllable_nucleus || l_syllable_coda;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_syllable;

  function r_word (
    r_syllables       number          default null
    , r_length        number          default null
    , r_capitalize    boolean         default false
    , r_country       varchar2        default core_random_v.g_default_country_code
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_syllables             number := r_syllables;

  begin

    dbms_application_info.set_action('r_word');

    -- Special case for chinese, else ignore country variable.
    if r_country = 'CN' then
      l_syllables := core_random.r_natural(1,3);
      l_ret_var := core_random.r_string(r_length => l_syllables, r_country => r_country);
    else
      if l_syllables is null then
        l_syllables := core_random.r_natural(1,3);
      end if;

      for i in 1..l_syllables loop
        l_ret_var := l_ret_var || r_syllable;
      end loop;

      if r_length is not null and r_length < length(l_ret_var) then
        l_ret_var := substr(l_ret_var, 1, r_length);
      end if;

      if r_capitalize then
        l_ret_var := initcap(l_ret_var);
      end if;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_word;

  function r_sentence (
    r_words           number          default null
    , r_country       varchar2        default core_random_v.g_default_country_code
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_sentence_words        number := r_words;
    l_country               varchar2(10) := r_sentence.r_country;

  begin

    dbms_application_info.set_action('r_sentence');

    if r_words is null then
      l_sentence_words := core_random.r_natural(7,15);
    end if;

    if l_country is not null and l_country != 'CN' then
      l_ret_var := text_data.markov_sentence(l_sentence_words, l_country);
    else
      for i in 1..l_sentence_words loop
        if i = 1 then
          l_ret_var := initcap(r_word(r_country => r_country));
        elsif i = l_sentence_words then
          l_ret_var := l_ret_var || ' ' || r_word(r_country => r_country) || '.';
        else
          l_ret_var := l_ret_var || ' ' || r_word(r_country => r_country);
        end if;
      end loop;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_sentence;

  function r_paragraph (
    r_sentences       number          default null
    , r_country       varchar2        default core_random_v.g_default_country_code
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_paragraph_sentences   number := r_sentences;
    l_country               varchar2(10) := r_paragraph.r_country;

  begin

    dbms_application_info.set_action('r_paragraph');

    if l_paragraph_sentences is null then
      l_paragraph_sentences := core_random.r_natural(3,7);
    end if;

    -- Special case for chinese
    if l_country = 'CN' then
      for i in 1..l_paragraph_sentences loop
        if i = 1 then
          l_ret_var := r_sentence(r_country => l_country);
        else
          l_ret_var := l_ret_var || ' ' || r_sentence(r_country => l_country);
        end if;
      end loop;
    else
      if l_country is not null then
        if not util_random.ru_inlist(core_random_v.g_markov_text_implemented, l_country) then
          l_country := util_random.ru_pickone(core_random_v.g_markov_text_implemented);
        end if;
        for i in 1..l_paragraph_sentences loop
          if i = 1 then
            l_ret_var := r_sentence(null, l_country);
          else
            l_ret_var := l_ret_var || ' ' || r_sentence(null, l_country);
          end if;
        end loop;
      else
        for i in 1..l_paragraph_sentences loop
          if i = 1 then
            l_ret_var := r_sentence;
          else
            l_ret_var := l_ret_var || ' ' || r_sentence;
          end if;
        end loop;
      end if;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_paragraph;

  function r_textgenre (
    r_texttype        varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(500);
    l_texttype              varchar2(100) := r_texttype;

  begin

    dbms_application_info.set_action('r_textgenre');

    if l_texttype = 'Book' then
      l_ret_var := util_random.ru_pickone(text_data.g_book_genres);
    elsif l_texttype = 'News' then
      l_ret_var := util_random.ru_pickone(text_data.g_news_genres);
    else
      if core_random.r_bool then
        l_ret_var := util_random.ru_pickone(text_data.g_book_genres);
      else
        l_ret_var := util_random.ru_pickone(text_data.g_news_genres);
      end if;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_textgenre;

  function r_adjective
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_adjective');

    l_ret_var := util_random.ru_pickone(text_data.g_adj_positive_people || ',' || text_data.g_adj_positive_company || ',' || text_data.g_adj_descriptive_company);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_adjective;

begin

  dbms_application_info.set_client_info('text_random');
  dbms_session.set_identifier('text_random');

end text_random;
/
