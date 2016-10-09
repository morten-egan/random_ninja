create or replace package core_random_v

as

  /** Core variables used throughout the project.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  -- Symbols used for random characters.
  g_symbols_pool                  varchar2(4000) := '!@#$%^&*()[]';

  -- Pool of characters for hex strings
  g_hex_search_space              varchar2(250) := '0123456789abcdef';

  -- Globals for language sensitive functions if no language specified.
  g_vowels                        varchar2(50) := 'aeiou';
  g_easy_consonants               varchar2(50) := 'bcdfghjklmnprstvwz';

  -- Height globals.
  g_highest_point                 number := 8152;
  g_highest_livable_point         number := 4870;

  -- Depth globals.
  g_lowest_point_land             number := -418;
  g_lowest_point_underground      number := -2191;
  g_lowest_point_ocean            number := -11034;

  -- tld list
  g_tld_orig_list                 varchar2(32000) := '.com,.net,.org,.gov,.mil,.int,.edu';
  g_tld_country_list              varchar2(32000) := '.ac,.ad,.ae,.af,.ag,.ai,.al,.am,.an,.ao,.aq,.ar,.as,.at,.au,.aw,.ax,.az,.ba,.bb,.bd,.be,.bf,.bg,.bh,.bi,.bj,.bm,.bn,.bo,.bq,.br,.bs,.bt,.bv,.bw,.by,.bz,.ca,.cc,.cd,.cf,.cg,.ch,.ci,.ck,.cl,.cm,.cn,.co,.cr,.cu,.cv,.cw,.cx,.cy,.cz,.de,.dj,.dk,.dm,.do,.dz,.ec,.ee,.eg,.eh,.er,.es,.et,.eu,.fi,.fj,.fk,.fm,.fo,.fr,.ga,.gb,.gd,.ge,.gf,.gg,.gh,.gi,.gl,.gm,.gn,.gp,.gq,.gr,.gs,.gt,.gu,.gw,.gy,.hk,.hm,.hn,.hr,.ht,.hu,.id,.ie,.il,.im,.in,.io,.iq,.ir,.is,.it,.je,.jm,.jo,.jp,.ke,.kg,.kh,.ki,.km,.kn,.kp,.kr,.kw,.ky,.kz,.la,.lb,.lc,.li,.lk,.lr,.ls,.lt,.lu,.lv,.ly,.ma,.mc,.md,.me,.mg,.mh,.mk,.ml,.mm,.mn,.mo,.mp,.mq,.mr,.ms,.mt,.mu,.mv,.mw,.mx,.my,.mz,.na,.nc,.ne,.nf,.ng,.ni,.nl,.no,.np,.nr,.nu,.nz,.om,.pa,.pe,.pf,.pg,.ph,.pk,.pl,.pm,.pn,.pr,.ps,.pt,.pw,.py,.qa,.re,.ro,.rs,.ru,.rw,.sa,.sb,.sc,.sd,.se,.sg,.sh,.si,.sj,.sk,.sl,.sm,.sn,.so,.sr,.ss,.st,.su,.sv,.sx,.sy,.sz,.tc,.td,.tf,.tg,.th,.tj,.tk,.tl,.tm,.tn,.to,.tp,.tr,.tt,.tv,.tw,.tz,.ua,.ug,.uk,.us,.uy,.uz,.va,.vc,.ve,.vg,.vi,.vn,.vu,.wf,.ws,.ye,.yt,.za,.zm,.zw';
  g_tld_generic1                  varchar2(32000) := '.academy,.accountant,.accountants,.active,.actor,.adult,.aero,.agency,.airforce,.apartments,.app,.archi,.army,.associates,.attorney,.auction,.audio,.autos,.band,.bar,.bargains,.beer,.best,.bid,.bike,.bingo,.bio,.biz,.black,.blackfriday,.blog,.blue,.boo,.boutique,.build,.builders,.business,.buzz,.cab,.cam,.camera,.camp,.cancerresearch,.capital,.cards,.care,.career,.careers,.cars,.cash,.casino,.catering,.center,.ceo,.channel,.chat,.cheap,.christmas,.church,.city,.claims,.cleaning,.click,.clinic,.clothing,.cloud,.club,.coach,.codes,.coffee,.college,.community,.company,.computer,.condos,.construction,.consulting,.contractors,.cooking,.cool,.coop,.country,.coupons,.credit,.creditcard,.cricket,.cruises,.dad,.dance,.date,.dating,.day,.deals,.degree,.delivery,.democrat,.dental,.dentist,.design,.diamonds,.diet,.digital,.direct,.directory,.discount,.dog,.domains,.download,.eat,.education,.email,.energy,.engineer,.engineering,.equipment,.esq,.estate,.events,.exchange,.expert,.exposed,.express,.fail,.faith,.family,.fans,.farm,.fashion';
  g_tld_generic2                  varchar2(32000) := '.feedback,.finance,.financial,.fish,.fishing,.fit,.fitness,.flights,.florist,.flowers,.fly,.foo,.football,.forsale,.foundation,.fund,.furniture,.fyi,.gallery,.garden,.gift,.gifts,.gives,.glass,.global,.gold,.golf,.gop,.graphics,.green,.gripe,.guide,.guitars,.guru,.healthcare,.help,.here,.hiphop,.hiv,.hockey,.holdings,.holiday,.homes,.horse,.host,.hosting,.house,.how,.info,.ing,.ink,.institute,.insure,.international,.investments,.jewelry,.jobs,.kim,.kitchen,.land,.lawyer,.lease,.legal,.lgbt,.life,.lighting,.limited,.limo,.link,.loan,.loans,.lol,.lotto,.love,.luxe,.luxury,.management,.market,.marketing,.markets,.mba,.media,.meet,.meme,.memorial,.men,.menu,.mobi,.moe,.money,.mortgage,.motorcycles,.mov,.movie,.museum,.name,.navy,.network,.new,.news,.ngo,.ninja,.one,.ong,.onl,.online,.ooo,.organic,.partners,.parts,.party,.pharmacy,.photo,.photography,.photos,.physio,.pics,.pictures,.pid,.pink,.pizza,.place,.plumbing,.plus,.poker,.porn,.post,.press,.pro,.productions,.prof,.properties,.property,.qpon,.racing,.recipes,.red,.rehab,.ren,.rent,.rentals,.repair,.report,.republican,.rest,.review,.reviews,.rich,.rip,.rocks,.rodeo,.rsvp,.run,.sale,.school,.science,.services,.sex,.sexy,.shoes,.show,.singles,.site,.soccer,.social,.software,.solar,.solutions,.space,.studio,.style,.sucks,.supplies,.supply,.support,.surf,.surgery,.systems,.tattoo,.tax,.taxi,.team,.store,.tech,.technology,.tel,.tennis,.theater,.tips,.tires,.today,.tools,.top,.tours,.town,.toys,.trade,.training,.travel,.university,.vacations,.vet,.video,.villas,.vision,.vodka,.vote,.voting,.voyage,.wang,.watch,.webcam,.website,.wed,.wedding,.whoswho,.wiki,.win,.wine,.work,.works,.world,.wtf,.xxx,.xyz,.yoga,.zone';

  -- Local implmentation variables.
  -- Person name languages implemented. Remember to update this in case a new country is added.
  g_name_countries_implemented    varchar2(4000) := ('US');
  -- Identification number countries implemented.
  g_id_countries_implemented      varchar2(4000) := ('US');
  -- State data countries implemented
  g_state_countries_implemented   varchar2(4000) := ('US');
  -- Road names implemented
  g_road_countries_implemented    varchar2(4000) := ('US');

end core_random_v;
/
