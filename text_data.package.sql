create or replace package text_data

as

  /** Create the data strcutures for random text generation.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  type text_list is table of clob index by varchar2(10);
  markov_sources    text_list;

  type mc_key_rec is record (
    markov_prefix1          varchar2(150)
    , markov_prefix2        varchar2(150)
    , markov_suffix         varchar2(150)
  );
  type mc_key_rec_list is table of mc_key_rec;
  type markov_map_t is table of varchar2(4000) index by varchar2(150);

  init_data     varchar2(250);

  -- Genres for pieces of text
  g_book_genres             varchar2(4000) := 'Fiction,Comedy,Drama,Horror,Non-Fiction,Realistic Fiction,Romance Novel,Satire,Tragedy,Fantasy';
  g_news_genres             varchar2(4000) := 'Tabloid,Gonzo,Investigative,Science,Sports,Finance,Culture,Classified,Politics,Economy,World News,News';

  /** Generate the triplets for markov map.
  * @author Morten Egan
  * @return mc_key_rec_list The list of triplets.
  */
  function markov_triples (
    r_country         varchar2        default null
  )
  return mc_key_rec_list
  pipelined;

  /** Generate the sentence based on the markov data.
  * @author Morten Egan
  * @return varchar2 The sentence generated.
  */
  function markov_sentence (
    r_words           number          default null
    , r_country       varchar2        default null
  )
  return varchar2;

end text_data;
/
