create or replace package body text_data_us

as

begin

  dbms_application_info.set_client_info('text_data_us');
  dbms_session.set_identifier('text_data_us');

  text_data.markov_sources('US') := q'[BUILDING DEADFALLS.
  During the centuries that trapping has been carried on, not only in
  America, but thruout the entire world, various kinds of traps and
  snares have been in use and taken by all classes of trappers and in
  all sections the home-made traps are of great numbers. The number of
  furs caught each year is large.
  The above was said by a trapper some years ago who has spent upwards
  of forty years in the forests and is well acquainted with traps,
  trappers and fur-bearing animals. Whether the statement is true or
  not, matters but little, altho one thing is certain and that is that
  many of the men who have spent years in trapping and have been
  successful use the deadfalls and snares as well as steel traps.
  Another trapper says: In my opinion trapping is an art and any
  trapper that is not able to make and set a deadfall, when occasion
  demands, does not belong to the profession. I will give a few of the
  many reasons why dead falls are good.
  There is no weight to carry.
  Many of the best trappers use them.
  It requires no capital to set a line of deadfalls.
  There is no loss of traps by trap thieves, but the fur is in as
  much danger.
  Deadfalls do not mangle animals or injure their fur.
  It is a humane way of killing animals.
  There is no loss by animals twisting off a foot or leg and getting
  away.
  Animals are killed outright, having no chance to warn others of
  their kind by their cries from being caught.
  Trappers always have the necessary outfit (axe and knife) with
  them to make and set a deadfall that will kill the largest animals.
  The largest deadfalls can be made to spring easy and catch small
  game if required.
  Deadfalls will kill skunk without leaving any scent.
  Deadfalls are cheap and trappers should be familiar with them.
  It is a safe proposition, however, that not one-half of the trappers
  of today can build a deadfall properly or know how to make snares,
  and many of them have not so much as seen one.
  First a little pen about a foot square is built of stones, chunks, or
  by driving stakes close together, leaving one side open. The stakes
  should be cut about thirty inches long and driven into the ground
  some fourteen inches, leaving sixteen or thereabout above the ground.
  Of course if the earth is very solid, stakes need not be so long, but
  should be so driven that only about sixteen inches remain above
  ground. A sapling say four inches in diameter and four feet long is
  laid across the end that is open. A sapling that is four, five or six
  inches in diameter, owing to what you are trapping for, and about
  twelve feet long, is now cut for the "fall." ]';

  text_data.markov_sources('US') := replace(text_data.markov_sources('US'),'. ',' . ');
  text_data.markov_sources('US') := replace(text_data.markov_sources('US'),',');
  text_data.markov_sources('US') := replace(text_data.markov_sources('US'),chr(10));
  text_data.markov_sources('US') := replace(text_data.markov_sources('US'),chr(13));

end text_data_us;
/
