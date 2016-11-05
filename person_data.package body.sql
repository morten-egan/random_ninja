create or replace package body person_data

as

begin

  dbms_application_info.set_client_info('person_data');
  dbms_session.set_identifier('person_data');

  -- Init data objects.
  country_jobs('US') := job_list(null);
  country_jobs('US').extend(16);

  -- Country personal identification numbers and formats.
  country_ids('US').id_format := '#########';
  country_ids('US').id_add_checksum := null;
  country_ids('US').id_display_format := '###-##-####';
  country_ids('US').id_format_male := '#########';
  country_ids('US').id_format_female := '#########';

  -- US Jobs data.
  country_jobs('US')(1).job_sector := 'Construction';
  country_jobs('US')(1).job_titles := 'Boilermaker,Construction Operator,Electrician,Ironworker,Woodworker,Masonry Worker,Plumber,Roofer,Building Inspector,Carpenter,Construction Manager,Painter,Welder';
  country_jobs('US')(1).salary_range_min := 30000;
  country_jobs('US')(1).salary_range_max := 80000;
  country_jobs('US')(1).pct_workforce := 4.9;

  country_jobs('US')(2).job_sector := 'Manufactoring';
  country_jobs('US')(2).job_titles := 'Aircraft Mechanic,CNC Machinist,Plant Operator,Controller,Distribution Manager,Engineer,General Laborer,Inspector,Machinist,Quality Inspector,Technician';
  country_jobs('US')(2).salary_range_min := 25000;
  country_jobs('US')(2).salary_range_max := 85000;
  country_jobs('US')(2).pct_workforce := 7.1;

  country_jobs('US')(3).job_sector := 'Utilities';
  country_jobs('US')(3).job_titles := 'Bit Operator,Cable Technician,Energy Analyst,Exploration Manager,Gas Line Technician,GIS Analyst,Meter Technician,Pipeline Engineer,Power Engineer,Refinery Operator,Sanitation Worker,Telecommunications Equipment Installer/Repairer,Wind Turbine Technician';
  country_jobs('US')(3).salary_range_min := 30000;
  country_jobs('US')(3).salary_range_max := 115000;
  country_jobs('US')(3).pct_workforce := 0.3;

  country_jobs('US')(4).job_sector := 'Transportation and Warehousing';
  country_jobs('US')(4).job_titles := 'Bus Driver,Delivery Driver,Mechanic,Dispatcher,Driver,Forklift Operator,Logistics,Truck Driver,Shipping Clerk,Warehouse Worker';
  country_jobs('US')(4).salary_range_min := 22500;
  country_jobs('US')(4).salary_range_max := 55000;
  country_jobs('US')(4).pct_workforce := 3;

  country_jobs('US')(5).job_sector := 'Information Technology';
  country_jobs('US')(5).job_titles := 'Architect,Business Analyst,Database Administrator,Security Specialist,Network Administrator,Programmer,Quality Assurance,Software Engineer,System Analyst,Web Developer,Developer';
  country_jobs('US')(5).salary_range_min := 45000;
  country_jobs('US')(5).salary_range_max := 250000;
  country_jobs('US')(5).pct_workforce := 1.7;

  country_jobs('US')(6).job_sector := 'Finance';
  country_jobs('US')(6).job_titles := 'Accountant,Auditor,Billing,Controller,Credit Analyst,Financial Analyst,Payroll,Trader,Financial Advisor,Investment Advisor';
  country_jobs('US')(6).salary_range_min := 40000;
  country_jobs('US')(6).salary_range_max := 350000;
  country_jobs('US')(6).pct_workforce := 5.3;

  country_jobs('US')(7).job_sector := 'Sales and Service';
  country_jobs('US')(7).job_titles := 'Customer Service Representative,Cashier,Sales Assistant,Order Entry Clerk,Telemarketing';
  country_jobs('US')(7).salary_range_min := 25000;
  country_jobs('US')(7).salary_range_max := 60000;
  country_jobs('US')(7).pct_workforce := 4.2;

  country_jobs('US')(8).job_sector := 'Healthcare';
  country_jobs('US')(8).job_titles := 'Acupuncturist,Audiologist,Health Therapist,Dentist,Doctor,Laboratory Technician,Paramedic,Nurse,Physical Therapist,Radiologist,Dietitian,Surgeon';
  country_jobs('US')(8).salary_range_min := 30000;
  country_jobs('US')(8).salary_range_max := 250000;
  country_jobs('US')(8).pct_workforce := 13.6;

  country_jobs('US')(9).job_sector := 'Educational Services';
  country_jobs('US')(9).job_titles := 'Teacher,Professor,Dean,Decan,Curator';
  country_jobs('US')(9).salary_range_min := 20000;
  country_jobs('US')(9).salary_range_max := 120000;
  country_jobs('US')(9).pct_workforce := 7.2;

  country_jobs('US')(10).job_sector := 'Hospitality and Leisure';
  country_jobs('US')(10).job_titles := 'Barista,Bartender,Bell Person,Chef,Concierge,Dealer,Dishwasher,Door Attendant,Fitness Instructor,Green Keeper,Hair Stylist,Life Guard,Massage Therapist,Server,Waiter,Usher';
  country_jobs('US')(10).salary_range_min := 15000;
  country_jobs('US')(10).salary_range_max := 75000;
  country_jobs('US')(10).pct_workforce := 9.8;

  country_jobs('US')(11).job_sector := 'Professional and Business Services';
  country_jobs('US')(11).job_titles := 'Attorney,Case Manager,Legal Analyst,Paralegal,Judge,Associate,Business Analyst,Project Manager,Consultant,Analyst,Editor,Lobbyist,Public Relations,Account Manager,Marketing Director';
  country_jobs('US')(11).salary_range_min := 45000;
  country_jobs('US')(11).salary_range_max := 250000;
  country_jobs('US')(11).pct_workforce := 13.2;

  country_jobs('US')(12).job_sector := 'Federal Government';
  country_jobs('US')(12).job_titles := 'Administrative Clerk,Computer Operator,Receptionist,Data Transcriber,Messenger,Patent Examiner,Patent Advisor,Border Officer,Customs Officer,Corrections Officer,Guard,Park Ranger,Firefighter,Police Officer';
  country_jobs('US')(12).salary_range_min := 15000;
  country_jobs('US')(12).salary_range_max := 65000;
  country_jobs('US')(12).pct_workforce := 1.5;

  country_jobs('US')(13).job_sector := 'Agriculture';
  country_jobs('US')(13).job_titles := 'Farmer,Forester,Gardener,Groundskeeper,Landscaper,Dairy Farmer';
  country_jobs('US')(13).salary_range_min := 15000;
  country_jobs('US')(13).salary_range_max := 55000;
  country_jobs('US')(13).pct_workforce := 1.3;

  country_jobs('US')(14).job_sector := 'Local Government';
  country_jobs('US')(14).job_titles := 'Social Worker,Police Officer,Firefighter,Councilman,Postal Worker,Government Services';
  country_jobs('US')(14).salary_range_min := 15000;
  country_jobs('US')(14).salary_range_max := 55000;
  country_jobs('US')(14).pct_workforce := 12.4;

  country_jobs('US')(15).job_sector := 'Management';
  country_jobs('US')(15).job_titles := 'President,Managing Director,CFO,CEO,COO,CIO,CCO,CMO,Board Member,Chariman of the Board';
  country_jobs('US')(15).salary_range_min := 125000;
  country_jobs('US')(15).salary_range_max := 750000;
  country_jobs('US')(15).pct_workforce := 0.04;

  country_jobs('US')(16).job_sector := 'Self Employed';
  country_jobs('US')(16).job_titles := 'Founder,Consultant,Entrepreneur,Freelancer,Artist,Photographer';
  country_jobs('US')(16).salary_range_min := 10000;
  country_jobs('US')(16).salary_range_max := 500000;
  country_jobs('US')(16).pct_workforce := 5.7;

end person_data;
/
