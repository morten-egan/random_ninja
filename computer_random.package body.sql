create or replace package body computer_random

as

  function r_os_flavor
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_os_flavor');

    if core_random.r_bool then
      l_ret_var := 'Unix';
    else
      l_ret_var := 'Windows';
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_os_flavor;

  function r_mountpoint (
    r_os_flavor         varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(1000);
    l_os_flavor             varchar2(100) := r_mountpoint.r_os_flavor;

  begin

    dbms_application_info.set_action('r_mountpoint');

    if l_os_flavor is null then
      l_os_flavor := computer_random.r_os_flavor;
    elsif l_os_flavor != 'Unix' and l_os_flavor != 'Windows' then
      l_os_flavor := computer_random.r_os_flavor;
    end if;

    for i in 1..computer_data.mountpoints.count loop
      if computer_data.mountpoints(i).c_category = l_os_flavor then
        l_ret_var := util_random.ru_pickone(computer_data.mountpoints(i).c_types);
      end if;
    end loop;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_mountpoint;

  function r_extension (
    r_extension_cat     varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_extension_cat         varchar2(150) := r_extension_cat;

  begin

    dbms_application_info.set_action('r_extension');

    if l_extension_cat is null then
      l_ret_var := util_random.ru_pickone(computer_data.filetypes(core_random.r_natural(1, computer_data.filetypes.count)).c_types);
    else
      for i in 1..computer_data.filetypes.count loop
        if computer_data.filetypes(i).c_category = l_extension_cat then
          l_ret_var := util_random.ru_pickone(computer_data.filetypes(i).c_types);
        end if;
      end loop;
      if l_ret_var is null then
        l_ret_var := util_random.ru_pickone(computer_data.filetypes(core_random.r_natural(1, computer_data.filetypes.count)).c_types);
      end if;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_extension;

  function r_filename (
    r_extension         varchar2        default null
    , r_extension_cat   varchar2        default null
    , r_safemode        boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(200);
    l_extension             varchar2(50) := r_filename.r_extension;
    l_extension_cat         varchar2(150) := r_filename.r_extension_cat;

  begin

    dbms_application_info.set_action('r_filename');

    if l_extension_cat is null and l_extension is null then
      l_extension := computer_random.r_extension;
    elsif l_extension_cat is not null and l_extension is null then
      l_extension := computer_random.r_extension(l_extension_cat);
    end if;

    l_ret_var := text_random.r_word(null, core_random.r_natural(1,15)) || '.' || l_extension;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_filename;

  function r_path (
    r_level             number          default null
    , r_os_flavor       varchar2        default null
    , r_include_file    boolean         default true
  )
  return varchar2

  as

    l_ret_var               varchar2(1000);
    l_level                 number := r_path.r_level;
    l_os_flavor             varchar2(50) := r_path.r_os_flavor;
    l_separator             varchar2(1);

  begin

    dbms_application_info.set_action('r_path');

    if l_level is null then
      l_level := core_random.r_natural(1,5);
    end if;

    if l_os_flavor is null then
      l_os_flavor := computer_random.r_os_flavor;
    elsif l_os_flavor != 'Windows' or l_os_flavor != 'Unix' then
      l_os_flavor := computer_random.r_os_flavor;
    end if;

    if l_os_flavor = 'Windows' then
      l_separator := '\';
    else
      l_separator := '/';
    end if;

    -- First get mountpoint.
    l_ret_var := computer_random.r_mountpoint(l_os_flavor);

    -- The for each level, we add a directory name.
    for i in 1..l_level loop
      -- For every level add a directory to the path.
      l_ret_var := l_ret_var || l_separator || text_random.r_word(null, core_random.r_natural(3,15));
    end loop;

    -- Then if we need to add a filename we do that
    if r_include_file then
      l_ret_var := l_ret_var || l_separator || computer_random.r_filename;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_path;

  function r_semver (
    r_major             number          default null
    , r_minor           number          default null
    , r_patch           number          default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_major                 number := r_major;
    l_minor                 number := r_minor;
    l_patch                 number := r_patch;

  begin

    dbms_application_info.set_action('r_semver');

    if l_major is null then
      l_major := core_random.r_natural(0,50,0,4);
    end if;

    if l_minor is null then
      l_minor := core_random.r_natural(0,50,1,10);
    end if;

    if l_patch is null then
      l_patch := core_random.r_natural(0,50,1,25);
    end if;

    l_ret_var := l_major || '.' || l_minor || '.' || l_patch;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_semver;

  function r_mimetype (
    r_category          varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_category              varchar2(100) := r_mimetype.r_category;

  begin

    dbms_application_info.set_action('r_mimetype');

    if l_category is not null then
      for i in 1..computer_data.mimetypes.count loop
        if computer_data.mimetypes(i).c_category = l_category then
          l_ret_var := util_random.ru_pickone(computer_data.mimetypes(i).c_types);
        end if;
      end loop;
      if l_ret_var is null then
        l_ret_var := util_random.ru_pickone(computer_data.mimetypes(core_random.r_natural(1, computer_data.mimetypes.count)).c_types);
      end if;
    else
      l_ret_var := util_random.ru_pickone(computer_data.mimetypes(core_random.r_natural(1, computer_data.mimetypes.count)).c_types);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_mimetype;

  function r_servername (
    r_environment       varchar2        default null
    , r_servertype      varchar2        default null
    , r_number          number          default null
    , r_withdomain      boolean         default true
  )
  return varchar2

  as

    l_ret_var               varchar2(500);
    l_environment           varchar2(50) := r_servername.r_environment;
    l_servertype            varchar2(50) := r_servername.r_servertype;
    l_number                number := r_servername.r_number;
    l_char_number           varchar2(2);

  begin

    dbms_application_info.set_action('r_servername');

    if core_random.r_bool then
      if l_environment is null then
        l_environment := util_random.ru_pickone(computer_data.g_computer_environments);
      end if;

      if l_servertype is null then
        l_servertype := util_random.ru_pickone(computer_data.g_computer_functions);
      end if;

      if l_number is null then
        l_number := core_random.r_natural(1,30);
        l_char_number := lpad(to_char(l_number), 2, '0');
      end if;
      l_ret_var := l_servertype || l_char_number || '.' || l_environment;
    else
      l_ret_var := lower(location_random.r_country(true)) || core_random.r_character('tdup') || util_random.ru_pickone(computer_data.g_computer_functions) || lpad(to_char(core_random.r_natural(1,30)), 2, '0') || core_random.r_character('ab');
    end if;

    if r_withdomain then
      l_ret_var := l_ret_var || '.' || web_random.r_domain;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_servername;

  function r_useragent
  return varchar2

  as

    l_ret_var               varchar2(500);

  begin

    dbms_application_info.set_action('r_useragent');

    l_ret_var := computer_data.useragents(core_random.r_natural(1, computer_data.useragents.count));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_useragent;

  function r_error
  return varchar2

  as

    l_ret_var               varchar2(512);

  begin

    dbms_application_info.set_action('r_error');

    l_ret_var := computer_data.errors(core_random.r_natural(1, computer_data.errors.count)).c_types;

    l_ret_var := util_random.ru_numcharfy(l_ret_var);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_error;

  function r_md5
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_md5');

    l_ret_var := core_random.r_hex(32);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_md5;

  function r_password (
    r_passwordlength    number          default null
    , r_includenumbers  boolean         default true
    , r_includespecial  boolean         default true
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_passwordlength        number := r_passwordlength;

  begin

    dbms_application_info.set_action('r_password');

    if l_passwordlength is null then
      l_passwordlength := core_random.r_natural(5,20);
    end if;

    if r_includenumbers and r_includespecial then
      l_ret_var := core_random.r_string(l_passwordlength, 'abcdefghijklmnopqrstuvxyzABCDEFGHIJKLMNOPQRTUVXYZ0123456789!"#¤%&/()@£$"');
    elsif r_includenumbers and not r_includespecial then
      l_ret_var := core_random.r_string(l_passwordlength, 'abcdefghijklmnopqrstuvxyzABCDEFGHIJKLMNOPQRTUVXYZ0123456789');
    elsif not r_includenumbers and r_includespecial then
      l_ret_var := core_random.r_string(l_passwordlength, 'abcdefghijklmnopqrstuvxyzABCDEFGHIJKLMNOPQRTUVXYZ!"#¤%&/()@£$"');
    else
      l_ret_var := core_random.r_string(l_passwordlength, 'abcdefghijklmnopqrstuvxyzABCDEFGHIJKLMNOPQRTUVXYZ');
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_password;

begin

  dbms_application_info.set_client_info('computer_random');
  dbms_session.set_identifier('computer_random');

end computer_random;
/
