  random_ninja
=====================
Morten Egan <morten@plsql.ninja>

This is the initial readme of the project. More will be added later. Like a description of what this is

## Summary

## Pre-requisites

Please see the NPG page for the package requisites: [random_ninja](http://plsql.ninja/npg/package/random_ninja)

## Installation

Please see the NPG page for the installation: [random_ninja](http://plsql.ninja/npg/package/random_ninja)

## Procedures and Functions

+ **core_random** - The basic random functionalities required.
    + **r_bool** - Random true/false values. Chance of true can be specified.
    + **r_natural** - Random natural numbers. Range can be specified.
    + **r_character** - Random character. Casing, Choice pool and Symbols can be specified.
    + **r_float** - Random float number. Range and precision can be specified.
    + **r_integer** - Random integer number. Range can be specified.
    + **r_string** - Random string. Length and character pool can be defined.
    + **r_hex** - Random hex string. Length can be defined.
+ **text_random** - Generate random pieces of text, to simulate comments, descriptions, articles and more.
    + **r_syllable** - Random syllables.
    + **r_word** - Random word. Number of syllables, length and capitalizon can be specified.
    + **r_sentence** - Random sentence. The number of words in the sentence can be specified.
    + **r_paragraph** - Random paragraph. Number of sentences can be specified.
    + **r_markovsentence** - Use this to generate random text that looks real.
    + **r_textgenre** - Use this to get a text genre. Specify text type (Book, News) to get domain specific genres
+ **time_random** - Generate random time and date components.
    + **r_second** - Random second.
    + **r_minute** - Random minute.
    + **r_hour** - Random hour. am/pm format can be specified.
    + **r_ampm** - Random am or pm.
    + **r_millisecond** - Random millisecond.
    + **r_year** - Random year. Min and max can be specified, as well as two digits result if needed.
    + **r_month** - Random month. Season can be specified.
    + **r_day** - Random day. Month can be specified.
    + **r_date** - Random date. Any component of the date format can be fixed if defined.
    + **r_epoch** - Random epoch date.
    + **r_timestamp** - Random timestamp. Any component of the timestamp can be fixed if defined.
    + **r_datebetween** - Create a random date between 2 set dates.
    + **r_timebetween** - Create a random timestamp between 2 set timestamps.
    + **r_datereference** - Generate a random date based on human readable definitions, such as "soon", "future", "past", "recent" and more.
+ **location_random** - A wide variety of random location related data.
    + **r_country** - Random country. Either full name, or short ISO form can be specified.
    + **r_height** - Random height. Result in feet and livable height can be specified.
    + **r_depth** - Random depth. Result in feet, and depth on land and not ocean can be specified.
    + **r_latitude** - Random latitude angle. Precision can be specified.
    + **r_longtitude** - Random longtitude. Precision can be specified.
    + **r_coordinate** - Random coordinates as a pair of latitude and longtitude points.
    + **r_altitude** - Random altitude, from 0 to upper atmosphere. Result in feet can be specified.
    + **r_state** - Random state name. Shortform option available. Country can also be specified.
    + **r_zipcode** - Random zip code. Country can specified for country specfic formats.
    + **r_street** - Random street name. Country and shortform can be specified.
    + **r_address** - Random address. Country and max numbering of street location can be specified.
    + **r_city** - Random city name. Country and state can be specified.
    + **r_address2** - Random address 2 line, such as apartment or name of building. Country can be specified.
    + **r_level** - Random building level.
    + **r_floor_space** - Size of a building. You can specify continent and choose feet instead of meters.
    + **r_continent** - Return a random continent.
    + **r_room_count** - Return a room count for a building. Specify continent for more precise values.
+ **person_random** - Random personal related data.
    + **r_age** - Random age. Type (child, teen, adult, senior) can be specified.
    + **r_birthday** - Random birthday date. As with age, type can be specified.
    + **r_firstname** - Random first name. Both country and gender can be specified.
    + **r_middlename** - Random middle name. Country and gender can be specified.
    + **r_lastname** - Random last name. Country and gender can be specified
    + **r_name** - Random name. Country, Gender, Include middlename, Middle initial and prefix can be specified.
    + **r_gender** - Random gender.
    + **r_prefix** - Random prefix. Gender and country can be specified.
    + **r_identification** - Random valid identification number, based on the country specified.
    + **r_suffix** - Random suffix. Country and shortform can be specified.
    + **r_jobsector** - Get a random job sector or industry.
    + **r_jobtitle** - Get a random job title. Specify job sector for a specific industry.
    + **r_salary** - Generate a salary for a person. Specify country and job sector for more realistic values.
+ **phone_random** - Generate random data related to phones.
    + **r_imei** - Random valid IMEI number. IMEISV version can be specified.
    + **r_meid** - Random valid MEID number.
    + **r_country_calling_code** - Random valid international code. + or 00 can be specified.
    + **r_phonenumber** - Random valid phone number. Generates valid landline or mobile numbers. Country and country code can be specified.
    + **r_mcc** - Random valid MCC code. Country can be specified.
    + **r_mnc** - Random valid MNC code. Country can be specified.
    + **r_imsi** - Random valid IMSI number. Country can be specified.
    + **r_call_type** - Random call type, for CDR data.
    + **r_call_type_service** - Random call type service, for CDR data.
    + **r_operator_code** - Random and valid operator code (pmnl) for CDR records. Country can be specified.
+ **finance_random** - Generate random financial data.
    + **r_currency** - Random valid ISO currency. ISO shortform can be specified.
    + **r_currencypair** - Random base and quote currencies. Both can be specified.
    + **r_creditcard** - Random valid credit card name. Shortform can be specified.
    + **r_creditcardnum** - Random valid creditcard number. Creditcard type can be specified.
    + **r_expirydate** - Random credit card expiry date. Future data can be specified.
    + **r_amount** - Random amount. Range and precision can be specified.
    + **r_accountnumber** - Create a valid random account number. By default IBAN compatible format.
    + **r_accounttype** - A random account type, such as savings, credit or investment account.
    + **r_accounttransaction** - Return a random transaction type. Specify account type for more realistic values.
    + **r_accountbalance** - Create a random balance for an account. Specify account type for more real values.
    + **r_exchange** - Return a random stock exchange. Both full name and trading ID.
    + **r_bitcoin** - Generate a random compatible bitcoin address.
+ **web_random** - Generate random web/internet related data.
    + **r_tld** - Random top level domain. Generic and country inclusion can be specified.
    + **r_domain** - Random domain name. TLD can be specified.
    + **r_email** - Random email address. Specify if you want to use real name.
    + **r_ipv4** - Random <u><i>valid</i></u> ipv4 ip address.
    + **r_url** - Random URL. Specify if you want to use https and if you want to add query parameter.
    + **r_ipv6** - Random <u><i>valid</i></u> ipv6 ip address.
    + **r_useragent** - Create random real looking useragents.
    + **r_protocol** - Randomly choose between http or https.
    + **r_color** - Generate random colors in the RGB scheme.
    + **r_mac** - Create random valid MAC addresses.
    + **r_password** - Create random valid SHA256 like password hashes.
+ **computer_random** - Generate random computer related data.
    + **r_os_flavor** - Randomize between Windows and Unix.
    + **r_mountpoint** - Generate a mountpoint. Specify OS flavor, to get OS specific mountpoints.
    + **r_extension** - Create a file extension. Specify category (Archive, Image, Finance, Graphics, Script etc.).
    + **r_filename** - Create a random filename. Can specify extension, extension category as well as safemode.
    + **r_path** - Create a full OS specific path. Can include number of directory levels and you can specify to include file also.
    + **r_semver** - Random semver version. Both Major, Minor and Patch can be specified if needed.
    + **r_mimetype** - Generate a random and valid mime type. Specify category if needed.
    + **r_servername** - Generate a random server name. Environment, type, number and domain can be specified or added.
+ **consumer_random** - Generate random consumer related data.
    + **r_category** - Random consumer category. You can choose between all, food ro non-food categories.
    + **r_food_item** - Random food item. Category can be specified.
    + **r_nonfood_item** - Random non-food item. Category can be specified.
    + **r_service_item** - Random service related item. Category can be specified.
    + **r_additive** - Return a random regulated and apporved additive such as E104 etc.

## Examples
