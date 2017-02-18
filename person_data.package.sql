create or replace package person_data

as

  /** Domain data for the person_random package.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.1.0';

  type job_rec is record (
    job_sector          varchar2(150)
    , job_titles        varchar2(4000)
    , salary_range_min  number
    , salary_range_max  number
    , pct_workforce     number
  );
  type job_list is table of job_rec;
  type country_job_list is table of job_list index by varchar2(10);
  country_jobs    country_job_list;

  type country_id_rec is record (
    id_format           varchar2(50)
    , id_add_checksum   varchar2(50)
    , id_display_format varchar2(150)
    , id_format_male    varchar2(50)
    , id_format_female  varchar2(50)
  );
  type country_id_list is table of country_id_rec index by varchar2(10);
  country_ids     country_id_list;

end person_data;
/
