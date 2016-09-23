create or replace package text_random

as

  /** Generate random pieces of text.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Generate a random syllable.
  * @author Morten Egan
  * @return varchar2 The syllable generated
  */
  function r_syllable
  return varchar2;

  /** Generate a random word based on random syllables.
  * @author Morten Egan
  * @return varchar2 Random word generated from a random number of syllables.
  */
  function r_word (
    r_syllables       number          default null
    , r_length        number          default null
    , r_capitalize    boolean         default false
  )
  return varchar2;

  /** Generate a random sentence based on random syllables.
  * @author Morten Egan
  * @return varchar2 The generated sentence generated from random words.
  */
  function r_sentence (
    r_words           number          default null
  )
  return varchar2;

  /** Generate a random paragraph based on random sentences.
  * @author Morten Egan
  * @return varchar2 The generated paragraph.
  */
  function r_paragraph (
    r_sentences       number          default null
  )
  return varchar2;

end text_random;
/
