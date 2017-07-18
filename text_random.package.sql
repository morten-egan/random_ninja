create or replace package text_random

as

  /** Generate random pieces of text.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.1.0';

  /** Generate a random syllable.
  * https://en.wikipedia.org/wiki/Syllable
  * @author Morten Egan
  * @return varchar2 The syllable generated
  */
  function r_syllable (
    r_country         varchar2        default null
  )
  return varchar2;

  /** Generate a random word based on random syllables.
  * @author Morten Egan
  * @return varchar2 Random word generated from a random number of syllables.
  */
  function r_word (
    r_syllables       number          default null
    , r_length        number          default null
    , r_capitalize    boolean         default false
    , r_country       varchar2        default null
  )
  return varchar2;

  /** Generate a random sentence based on random syllables.
  * @author Morten Egan
  * @return varchar2 The generated sentence generated from random words.
  */
  function r_sentence (
    r_words           number          default null
    , r_country       varchar2        default null
  )
  return varchar2;

  /** Generate a random paragraph based on random sentences.
  * @author Morten Egan
  * @return varchar2 The generated paragraph.
  */
  function r_paragraph (
    r_sentences       number          default null
    , r_country       varchar2        default null
  )
  return varchar2;

  /** Text genres.
  * @author Morten Egan
  * @return varchar2 The specific text genre generated.
  */
  function r_textgenre (
    r_texttype        varchar2        default null
  )
  return varchar2;

  /** Get Adjective
  * @author Morten Egan
  * @return varchar2 The adjective returned.
  */
  function r_adjective
  return varchar2;

end text_random;
/
