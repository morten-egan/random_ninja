create or replace package science_data_trees

as

    npg_version         varchar2(250) := '0.0.1';

    type tree_rec is record (
        scientific_name             varchar2(150)
        , common_name               varchar2(150)
    );
    type tree_tab is table of tree_rec;
    g_trees         tree_tab;

end science_data_trees;
/