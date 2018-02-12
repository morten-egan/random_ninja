create or replace package web_data

as

  /** Data elements to support web_random functions.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  -- BEM domains
  g_bem_domains                 varchar2(4000) := 'CSS';
  -- BEM block, elements and mofifiers.
  g_css_bem_block_names         varchar2(4000) := 'header,auth,menu,search,content,ads,footer,sidenote,paragraph,footnote';
  g_css_bem_element_names       varchar2(4000) := 'item,tab,link,inner,button,text,title,headline,icon,picture';
  g_css_bem_modifier_names      varchar2(4000) := 'hidden,visible,type_radio,type_input,type_select,size_s,size_m,size_l';

end web_data;
/
