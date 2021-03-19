create or replace package body science_data_trees

as

begin

    g_trees := tree_tab();
    g_trees.extend(27);

    --g_trees(1).scientific_name := '';
    --g_trees(1).common_name := '';


    g_trees(1).scientific_name := 'Agathis australis';
    g_trees(1).common_name := 'kauri pine';
    g_trees(2).scientific_name := 'Agathis lanceolata';
    g_trees(2).common_name := 'red kauri';
    g_trees(3).scientific_name := 'Agathis robusta';
    g_trees(3).common_name := 'Queensland kauri';
    g_trees(4).scientific_name := 'Araucaria angustifolia';
    g_trees(4).common_name := 'Paraná pine';
    g_trees(5).scientific_name := 'Araucaria araucana';
    g_trees(5).common_name := 'monkey-puzzle tree';
    g_trees(6).scientific_name := 'Araucaria bidwillii';
    g_trees(6).common_name := 'bunya-bunya';
    g_trees(7).scientific_name := 'Araucaria columnaris';
    g_trees(7).common_name := 'Cook pine';
    g_trees(8).scientific_name := 'Araucaria cunninghamii';
    g_trees(8).common_name := 'Moreton Bay pine';
    g_trees(9).scientific_name := 'Araucaria heterophylla';
    g_trees(9).common_name := 'Norfolk Island pine';
    g_trees(10).scientific_name := 'Araucaria hunsteinii';
    g_trees(10).common_name := 'klinki';
    g_trees(11).scientific_name := 'Athrotaxis cupressoides';
    g_trees(11).common_name := 'pencil pine';
    g_trees(12).scientific_name := 'Athrotaxis selaginoides';
    g_trees(12).common_name := 'King Billy pine';
    g_trees(13).scientific_name := 'Callitris columellaris';
    g_trees(13).common_name := 'white cypress-pine';
    g_trees(14).scientific_name := 'Callitris preissii';
    g_trees(14).common_name := 'Rottnest Island pine';
    g_trees(15).scientific_name := 'Callitris verrucosa';
    g_trees(15).common_name := 'mallee pine';
    g_trees(16).scientific_name := 'Calocedrus decurrens';
    g_trees(16).common_name := 'California incense cedar';
    g_trees(17).scientific_name := 'Chamaecyparis lawsoniana';
    g_trees(17).common_name := 'Lawson false cypress';
    g_trees(18).scientific_name := 'Chamaecyparis nootkatensis';
    g_trees(18).common_name := 'Nootka false cypress';
    g_trees(19).scientific_name := 'Chamaecyparis obtusa';
    g_trees(19).common_name := 'hinoki false cypress';
    g_trees(20).scientific_name := 'Chamaecyparis pisifera';
    g_trees(20).common_name := 'sawara false cypress';
    g_trees(21).scientific_name := 'Chamaecyparis thyoides';
    g_trees(21).common_name := 'Atlantic white cedar';
    g_trees(22).scientific_name := 'Cryptomeria japonica';
    g_trees(22).common_name := 'Japanese cedar';
    g_trees(23).scientific_name := 'Cunninghamia lanceolata';
    g_trees(23).common_name := 'China fir';
    g_trees(24).scientific_name := 'Cupressus arizonica stephensonii';
    g_trees(24).common_name := 'Cuyamaca cypress';
    g_trees(25).scientific_name := 'Cupressus forbesii';
    g_trees(25).common_name := 'Tecate cypress';
    g_trees(26).scientific_name := 'Cupressus leylandii';
    g_trees(26).common_name := 'Leyland cypress';
    g_trees(27).scientific_name := 'Cupressus macrocarpa';
    g_trees(27).common_name := 'Monterey cypress';

end science_data_trees;
/