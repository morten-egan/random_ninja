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
+ **web_random** - Generate random web/internet related data.
    + **r_tld** - Random top level domain. Generic and country inclusion can be specified.
    + **r_domain** - Random domain name. TLD can be specified.
    + **r_email** - Random email address. Specify if you want to use real name.
    + **r_ipv4** - Random <u><i>valid</i></u> ipv4 ip address.
    + **r_url** - Random URL. Specify if you want to use https and if you want to add query parameter.
    + **r_ipv6** - Random <u><i>valid</i></u> ipv6 ip address.
+ **consumer_random** - Generate random consumer related data.
    + **r_category** - Random consumer category. You can choose between all, food ro non-food categories.
    + **r_food_item** - Random food item. Category can be specified.
    + **r_nonfood_item** - Random non-food item. Category can be specified.
    + **r_service_item** - Random service related item. Category can be specified.

## Examples
