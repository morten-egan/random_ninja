create or replace package core_random_v

as

  /** Core variables used throughout the project.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  -- Generic country to be used in all r_country inputs
  g_default_country_code          varchar2(10) := 'US';

  -- Symbols used for random characters.
  g_symbols_pool                  varchar2(4000) := '!@#$%^&*()[]';

  -- Pool of characters for hex strings
  g_hex_search_space              varchar2(250) := '0123456789abcdef';

  -- Globals for language sensitive functions if no language specified.
  g_vowels                        varchar2(50) := 'aeiou';
  g_easy_consonants               varchar2(50) := 'bcdfghjklmnprstvwz';

  -- Globals for time.
  g_datereference_options         varchar2(4000) := 'recent,future,past,soon';

  -- Chinese characters
  g_most_used_chinese_characters  varchar2(4000) := '一丁世丂七丌丘不且丙丑业並中丰㐄乃久乇乍丸丹主了予莫水氵木林束未東果本相桼朿朩枼手扌才品古各同吉台召咅啇員司單告句史可呂后合右善吳周呆心忄思必虫車石二亘井云于五亏亞亍白百竹厶去禸禺彡 足回囟囪因匹亼从俞僉介今令余倉來全彳行金女妻婁妾肉肖能肙朋有朝多夗舛堯垂坴堇壴声壽糸糹言䜌炎馬鳥岡昔早是旨星易昜旬曰曷曾會曲曹更阝耳玉目眉直网安它寅宗冥犬犮豸乙乚九乞也乡颉角羽矛魚色衣袁襄禾委夂夌复夆攴敝攸敖又及取叚隹雚刀刃刂分㓞前田由甲申电異男畐畺广庚庶厂貝責力加大天夭夬央奄夫夷夸矢酉酋頁巾市帝帛十千卅卒半午卑卓卉門亠文亡交享亶㐬京亢亥示礻祭寸專尃雨需欠次穴革斤尸尹工左巨巫皿監羊韺八共兼公具其典父米食弓弗殳子舟孛方毛歹死弋戈戔我戊或戉戠立匕北比見爪爭爰走牛豕骨勹勺勻包勿干儿兀光元兌兄先免几幺幾風飛彐彔鹿非鬼冂冉再冊冏用甫甬韋豆豈青音黑臼舁廾廿开缶艮皮辛辡辟至齒卜龍生高瓦舌止此正戶气虎耒小少尞尚尗而卩㔾卯卬里重甘己巳巴巽襾西辰玄瓜谷鼠齊支牙巛巠川巤黃斗臣爿片聿鬲氏民氐麻尢自面老凵出凶赤身鼻髟長釆采无疋毋每屮屰癶隶粦';

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

  -- User agent components.
  g_user_agent_products           varchar2(32000) := 'Mozilla,Dalvik';
  g_user_agent_layout_engine      varchar2(32000) := 'AppleWebKit,Gecko';

  -- Phone globals.
  g_phone_tacs                    varchar2(32000) := '01-180800,01-181200,01-193400,01-194800,01-215800,01-215900,01-216100,01-226800,01-233600,01-233700,01-233800,01-241700,01-242000,01-243000,01-253600,01-254200,01-300600,01-326300,01-332700,01-388300,35-875105,35-875205,35-875305,35-875405,35-875505,35-875605,35-875705,35-875805,35-875905,35-201906,35-925406,35-325807,35-089080,35-099480,35-148420,35-148820,35-151304,35-154900,35-171005,35-174605,35-191405,35-226005,35-238402,35-274901,35-291402,35-316004,35-316605,35-332705,35-328504,35-351200,35-357800,35-376800,35-391805,35-405600,35-421803,35-433004,35-450502,35-511405,35-524803,35-566600,35-569500,35-679404,35-685702,35-693803,35-694603,35-699601,35-700804,35-714904,35-733104,35-739804,35-744105,35-765206,35-788104,35-803106,35-824005,35-828103,35-836800,35-837501,35-837800,35-838706,35-850000,35-851004,35-853704,35-869205,35-876105,35-896704,35-902803,35-909205,35-918804,35-920605,35-929005,35-933005,35-935003,35-972100,35-974101,35-979504,86-107402,86-217001,86-723902,86-813001,01-333200,35-808005';
  g_meid_prefix1                  varchar2(32000) := 'A0000001,A0000002,A0000003,A0000004,A0000005,A0000006,A0000007,A0000008,A0000009,A000000A,A000000B,A000000C,A000000D,A000000E,A000000F,A0000010,A0000011,A0000012,A0000013,A0000014,A0000015,A0000016,A0000017,A0000018,A0000019,A000001A,A000001B,A000001C,A000001D,A000001E,A000001F,A0000020,A0000021,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000000,A1000001,A1000001,A1000001,A1000001,A1000001,A1000001,A1000001,A1000001,A1000001,A1000001,A1000001,A1000001,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000002,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000003,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000004,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000005,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000006,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000007,A1000008,A1000008,A1000008,A1000008,A1000008,A1000008,A1000008,A1000008,A1000008,A1000008,A1000008';
  g_meid_prefix2                  varchar2(32000) := 'A1000008,A1000008,A1000008,A1000008,A1000008,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A1000009,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000B,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000C,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000D,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000E,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A100000F,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000010,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000011,A1000012,A1000012,A1000012,A1000012,A1000012,A1000013,A1000013,A1000012,A1000012,A1000012,A1000012,A1000012,A1000012,A1000012,A1000012,A1000012,A1000012,A1000012,A1000013,A1000013,A1000013,A1000013,A1000013,A1000013,A1000013,A1000013,A1000013,A1000013,A1000013,A1000013,A1000013,99000001,99000002,99000003,99000004,99000005,99000006,99000007,99000008,99000009,99000010,99000011,99000012,99000013';

  -- Local implmentation variables.
  -- Person name languages implemented. Remember to update this in case a new country is added.
  g_name_countries_implemented    varchar2(4000) := ('US,DK,CN');
  -- Identification number countries implemented.
  g_id_countries_implemented      varchar2(4000) := ('US,DK,CN');
  -- State data countries implemented
  g_state_countries_implemented   varchar2(4000) := ('US,DK,CN');
  -- City data countries implemented
  g_cities_countries_implemented  varchar2(4000) := ('US,DK,CN');
  -- Road names implemented
  g_road_countries_implemented    varchar2(4000) := ('US,DK,CN');
  -- Job sector and title countries implemented.
  g_job_data_implemented          varchar2(4000) := ('US');
  -- Markov text generation implemented.
  g_markov_text_implemented       varchar2(4000) := ('US');
  -- Tax number countries implemented
  g_tax_id_implemented            varchar2(4000) := ('US,CN');

end core_random_v;
/
