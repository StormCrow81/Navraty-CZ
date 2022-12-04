
/* -------------------- CZ CHANGELOG -------------------- */

/*
v1.01a:
(4x) CZ_Settings_Diff_Init - sloučeno s CZ_Settings_Diff_Save
v1.01:
(4x) CZ_Settings_Diff_Init, CZ_Settings_Diff_Save - added difficulty settings in the .ini file
(2x) Hero_Hunger - adjusted initial hunger values
(2x) Hero_Thirst - adjusted initial thirst values
(2x) Hero_Fatigue - modified initial fatigue values
(4x) CanLearnMagicCircleNext_ABCZ - adjusted the conditions of learning magic circles (at the request of players)
func void dia_xardas_canbenecromok_yes - the conditions of admission to necromancers have been unified
v1.00:
func void dia_xardas_runen_6 - fixed name
func int DIA_NONE_100_Xardas_WhyHere_condition - modified dialog conditions
*/



var int XarKnowHLH;

func void xardas_firstlock()
{
	Wld_InsertNpc(Ghost,"NW_CASTLEMINE_GHOST_01");
	Wld_InsertNpc(Ghost,"NW_TROLLAREA_TROLLROCKCAVE_02");
	Wld_InsertNpc(Ghost,"NW_FARM2_TAVERNCAVE1_02");
	Wld_InsertNpc(Ghost,"NW_RITUALFOREST_CAVE_05");
	Wld_InsertNpc(Troll_Rug,"NW_BROTHERTROLL");
	Wld_InsertNpc(Troll_Trag,"NW_BROTHERTROLL");
	Wld_InsertNpc(Troll_Brog,"NW_BROTHERTROLL");
	Wld_InsertNpc(Firewaran_Uniq,"FP_ROAM_NW_TROLLAREA_RUINS_29");
	Wld_InsertNpc(gobbo_mage_gr4,"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc(gobbo_mage_gr5,"NW_FARM1_CITYWALL_FOREST_16");
	Wld_InsertNpc(BDT_1000_Bandit_L,"NW_FARM1_BANDITS_CAVE_06");
	Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_SECRET_23");
	Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_08");
	Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_15");
	Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_04");
	Wld_InsertNpc(gobbo_green1,"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_05");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_VALLEY_04");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_VALLEY_06");
	Wld_InsertNpc(YGiant_Rat,"NW_XARDAS_TOWER_SECRET_CAVE_01");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_TOWER_SECRET_CAVE_01");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_TOWER_SECRET_CAVE_01");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM_FELDREUBER4");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_MONSTERMILL_11");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_01");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_02");
	Wld_InsertNpc(Wolf,"NW_TAVERNE_TROLLAREA_MONSTER_04_01");
	Wld_InsertNpc(Gobbo_Green,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
	Wld_InsertNpc(Warg,"NW_FARM4_WOOD_MONSTER_01");
	Wld_InsertNpc(Warg,"NW_FARM4_WOOD_MONSTER_01");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_MONSTER_02");
	Wld_InsertNpc(Wolf,"NW_FARM4_WOOD_MONSTER_03");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_MONSTER_06");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_MONSTER_07");
	Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE2_02");
	Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE2_03");
	Wld_InsertNpc(Skeleton,"FP_ROAM_CASTLEMINE2_06");
	Wld_InsertNpc(Zombie02,"FP_ROAM_CASTLEMINE2_10");
	Wld_InsertNpc(Zombie04,"FP_ROAM_CASTLEMINE2_12");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_BIGFARMFORESTCAVE_03");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_10");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_BIGFARM_LAKE_CAVE_11");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_BIGFARMFORESTCAVE_07");
	Wld_InsertNpc(gobbo_mage,"FP_ROAM_NW_BIGFARMFORESTCAVE_08");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_BIGFARM_LAKE_CAVE_05");
	Wld_InsertNpc(Wolf, " NW_SAGITTA_MOREMONSTER_01 " );
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_NEARPEASANT7");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_NEARPEASANT2_14");
	Wld_InsertNpc(Bloodfly,"NW_FARM4_WOOD_NEARPEASANT2_8");
	Wld_InsertNpc(Scavenger,"NW_FARM4_WOOD_NEARPEASANT2_7");
	Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_NEARPEASANT2_12");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_FARM4_WOOD_MONSTER_MORE_02");
	Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_3");
	Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_2");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_CRYPT_MONSTER08");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_CRYPT_MONSTER02");
	Wld_InsertNpc(Lesser_Skeleton,"NW_CRYPT_MONSTER04");
	Wld_InsertNpc(Lesser_Skeleton,"NW_CRYPT_MONSTER06");
	Wld_InsertNpc(Boar, " NW_FARM4_WOOD_NAVIGATION_09 " );
	Wld_InsertNpc(Wolf,"NW_CASTLEMINE_TROLL_05");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM_ALLEE_08_N_2");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM_ALLEE_08_N_5");
	Wld_InsertNpc(Scavenger,"NW_FARM3_BIGWOOD_02");
	Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_02");
	Wld_InsertNpc(Scavenger,"NW_FARM3_PATH_11_SMALLRIVER_10");
	Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVER_17");
	Wld_InsertNpc(Lurker,"NW_FARM3_PATH_11_SMALLRIVERMID_03");
	Wld_InsertNpc(Boar, " NW_FARM3_PATH_12_MONSTER_01 " );
	Wld_InsertNpc(Lurker,"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
	Wld_InsertNpc(Keiler,"NW_BIGFARM_LAKE_03_MOVEMENT");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM_LAKE_03_MOVEMENT3");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_BIGFARM_LAKE_03_MOVEMENT5");
	Wld_InsertNpc(Wolf,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
	Wld_InsertNpc(BDT_1065_Bandit_L,"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc(BDT_1066_Bandit_L,"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc(BDT_1067_Bandit_L,"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc(BDT_10313_Addon_RangerBandit_L,"NW_FARM4_WOOD_RANGERBANDITS_04");
	Wld_InsertNpc(BDT_10310_Addon_RangerBandit_M,"NW_BIGMILL_FARM3_RANGERBANDITS_04");
	Wld_InsertNpc(Warg,"NW_PASS_06");
	Wld_InsertNpc(orcdog,"NW_PASS_11");
	Wld_InsertNpc(Snapper,"NW_PASS_SECRET_16");
	Wld_InsertNpc(Gobbo_Green,"NW_PASS_GRAT_05");
	Wld_InsertNpc(skeleton_warrior,"FP_ROAM_MEDIUMFOREST_KAP3_05");
	Wld_InsertNpc(Zombie02,"FP_ROAM_MEDIUMFOREST_KAP3_02");
	Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_09");
	Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_11");
	Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_28");
	Wld_InsertNpc(Warg,"FP_ROAM_MEDIUMFOREST_KAP3_29");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_CITYFOREST_KAP3_28");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_CITYFOREST_KAP3_06");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_10");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_11");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_12");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_14");
	Wld_InsertNpc(Warg,"FP_ROAM_CITYFOREST_KAP3_15");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_MONSTER");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_FARM2_TO_TAVERN_09_MONSTER2");
	Wld_InsertNpc(Giant_Bug,"NW_FARM2_TO_TAVERN_09_MONSTER3");
	Wld_InsertNpc(Keiler,"NW_FOREST_PATH_79");
	Wld_InsertNpc(Keiler,"NW_FOREST_PATH_80_1");
	Wld_InsertNpc(Waran,"NW_FOREST_PATH_82");
	Wld_InsertNpc(Waran,"NW_FOREST_PATH_82_M");
	Wld_InsertNpc(Wolf,"NW_FOREST_PATH_66_M");
	Wld_InsertNpc(Gobbo_Skeleton,"NW_FOREST_PATH_62_M");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_80_1_MOVEMENT8_M");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_80_1_MOVEMENTF");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_31_NAVIGATION10");
	Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT6");
	Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT15");
	Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT15");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_NAVIGATION16");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_NAVIGATION16");
	Wld_InsertNpc(Snapper,"NW_FOREST_PATH_80_1_MOVEMENT8_M3");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_04_16_MONSTER");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_04_16_MONSTER");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_04_16_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_FOREST_PATH_04_4");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_31_NAVIGATION_M");
	Wld_InsertNpc(orcwarrior2,"NW_FOREST_PATH_31_NAVIGATION19");
	Wld_InsertNpc(orcdog,"NW_FOREST_PATH_18_MONSTER");
	Wld_InsertNpc(orcdog,"NW_FOREST_PATH_72_MONSTER23");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_66_MONSTER");
	Wld_InsertNpc(Warg,"NW_FOREST_PATH_66_MONSTER");
	Wld_InsertNpc(Keiler,"NW_FOREST_PATH_04_14_MONSTER");
	Wld_InsertNpc(Molerat,"NW_CITY_SMFOREST_03_M");
	Wld_InsertNpc(Minecrawler,"NW_MAGECAVE_27");
	Wld_InsertNpc(gobbo_mage,"NW_TROLLAREA_PATH_56");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_03");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_05");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_PORTALTEMPEL_08");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_PORTALTEMPEL_06");
	Wld_InsertNpc(Wolf,"NW_TROLLAREA_PATH_66_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_07");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PATH_71_MONSTER2");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PATH_15_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_RITUALPATH_04");
	Wld_InsertNpc(Skeleton,"NW_TROLLAREA_TROLLROCKCAVE_03");
	Wld_InsertNpc(Skeleton_Lord,"NW_TROLLAREA_TROLLROCKCAVE_07");
	Wld_InsertNpc(Gobbo_Black,"NW_TROLLAREA_TROLLLAKECAVE_08");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_TROLLLAKECAVE_08");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_06");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_04");
	Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_11");
	Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_72");
	Wld_InsertNpc(Waran,"NW_TROLLAREA_PATH_22_MONSTER");
	Wld_InsertNpc(Wolf,"NW_SHRINE_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_PATH_TO_MONASTER_AREA_01");
	Wld_InsertNpc(Gobbo_Green,"NW_BIGFARM_LAKE_MONSTER_05_01");
	Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_1_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1");
	Wld_InsertNpc(Snapper,"NW_TROLLAREA_RUINS_36");
	Wld_InsertNpc(Zombie01,"NW_FARM4_WOOD_MONSTER_MORE_02");
	Wld_InsertNpc(skeleton_warrior,"NW_FARM4_WOOD_MONSTER_MORE_01");
	Wld_InsertNpc(Snapper,"NW_FARM4_WOOD_MONSTER_05");
	Wld_InsertNpc(Snapper,"NW_CASTLEMINE_TROLL_02");
	Wld_InsertNpc(Snapper,"NW_FARM3_PATH_11_SMALLRIVER_10");
	Wld_InsertNpc(Snapper,"NW_FARM3_BIGWOOD_03_C");
	Wld_InsertNpc(xardas_skeleton_guard_03,"NW_XARDAS_TOWER_IN1_19");
	Wld_InsertNpc(xardas_skeleton_guard_03,"NW_XARDAS_TOWER_IN1_22");
	Wld_InsertNpc(xardas_skeleton_guard_03,"NW_XARDAS_TOWER_IN1_23");
	Wld_InsertNpc(skeleton_dark,"NW_CITY_SMFOREST_BANDIT_04");
	Wld_InsertNpc(skeleton_dark,"NW_CRYPT_IN_03");
	Wld_InsertNpc(skeleton_dark,"NW_CRYPT_IN_01");
	Wld_InsertNpc(XARDAS_SKELETON_GUARD_05,"NW_XARDAS_TOWER_IN1_01");
	Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_08");
	Wld_InsertNpc(skeleton_dark,"NW_TROLLAREA_TROLLROCKCAVE_07");
	Wld_InsertNpc(Shadowbeast,"NW_FOREST_VINOSKELLEREL_01");
	Wld_InsertNpc(zombie_mod,"NW_CRYPT_IN_03");
	Wld_InsertNpc(zombie_mod,"NW_CRYPT_IN_03");
	Wld_InsertNpc(skeleton_dark,"NW_CRYPT_IN_03");
	Wld_InsertNpc(SkeletonMage,"NW_CRYPT_IN_03");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_01");
	Wld_InsertNpc(Shadowbeast,"NW_FOREST_PATH_62_ORNA");
	Wld_InsertNpc(SkeletonMage,"NW_FOREST_VINOSKELLEREL_01");
	Wld_InsertNpc(WoodGolem,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(Skeleton,"NW_TROLLAREA_RUINS_28");
	Wld_InsertNpc(Shadowbeast,"FP_MAGICGOLEM");
	Wld_InsertNpc(bloodfly1,"FP_MAGICGOLEM");
	Wld_InsertNpc(bloodfly1,"FP_MAGICGOLEM");
	Wld_InsertNpc(bloodfly1,"FP_MAGICGOLEM");
	Wld_InsertNpc(Skeleton,"NW_FARM_WOOD_MPNSTER_MIRE_01");
	Wld_InsertNpc(zombie_mod,"NW_FARM_WOOD_MPNSTER_MIRE_01");
	Wld_InsertNpc(Skeleton,"NW_FARM_WOOD_MPNSTER_MIRE_01");
	Wld_InsertNpc(SkeletonMage,"NW_CRYPT_MONSTER08");
	Wld_InsertNpc(Skeleton,"NW_BIGMILL_MALAKSVERSTECK_02");
	Wld_InsertNpc(Skeleton,"NW_FARM2_TO_TAVERNCAVE1_02");
	Wld_InsertNpc(Skeleton,"NW_FARM2_TO_TAVERNCAVE1_03");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_TOWER_VALLEY_06_C");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_TOWER_VALLEY_06_B");
	Wld_InsertNpc(bloodfly1,"NW_FARM1_CONNECT_XARDAS");
	Wld_InsertNpc(Scavenger,"NW_FARM1_PATH_SPAWN_03");
	Wld_InsertNpc(SkeletonMage,"FP_ROAM_RITUALFOREST_CAVE_02");
	Wld_InsertNpc(Skeleton,"FP_ROAM_RITUALFOREST_CAVE_01");
	Wld_InsertNpc(Skeleton,"FP_ROAM_RITUALFOREST_CAVE_06");
	Wld_InsertNpc(Snapper,"FP_CAMPFIRE_NW_ATC_ORC_48");
	Wld_InsertNpc(Snapper,"FP_CAMPFIRE_NW_ATC_ORC_48");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_TROLLAREA_RUINS_32");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_TROLLAREA_RUINS_32");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_TROLLAREA_BRIDGE_05_04");
	Wld_InsertNpc(Shadowbeast,"FP_ROAM_NW_TROLLAREA_RIVERSIDECAVE_07_02");
	Wld_InsertNpc(Warg,"FP_ROAM_NW_TROLLAREA_RIVERSIDECAVE_01_02");
	Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_04");
	Wld_InsertNpc(scavenger_old,"FP_ROAM_NW_TROLLAREA_PLANE_11_01");
	Wld_InsertNpc(scavenger_old,"FP_ROAM_NW_TROLLAREA_PLANE_11_01");
	Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_03");
	Wld_InsertNpc(SkeletonMage,"EVT_CRYPT_ROOM_FINAL_SPAWN_05");
	Wld_InsertNpc(Troll,"FP_ROAM_CASTLEMILL_TROLL_05");
	Wld_InsertNpc(zombie_mod,"FP_GREATPEASANT_STPLATE_05");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_FARMS_PATH_11_SMALLRIVER_23");
	Wld_InsertNpc(FireWaran,"FP_ROAM_NW_FARMS_PATH_11_SMALLRIVER_23");
	Wld_InsertNpc(Warg,"FP_ROAM_PASS_WOLF_12");
	Wld_InsertNpc(Snapper,"FP_STAND_NW_ATC_DJG_04");
	Wld_InsertNpc(Warg,"FP_START_NW_ABANDONEMINE_OW");
};

instance DIA_Xardas_FirstEXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_FirstEXIT_Condition;
	information = DIA_Xardas_FirstEXIT_Info;
	permanent = FALSE;
	description = "Vyrazím hned, jak budu moci!";
};

func int DIA_Xardas_FirstEXIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstEXIT_Info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//Vyrazím hned, jak budu moci!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//Dobrá. A ještě jedna věc: nikomu neříkej, že jsme spolu mluvili. Hlavně žádnému mágovi.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//Co jsem odešel, považují mě mágové Ohně za mrtvého - a to se může docela hodit.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_03");	//Také pamatuj, že to bude vyžadovat veliké úsilí.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_04");	//Tvé síly jsou přirozeně o hodně menší, než před tvým bojem se Spáčem.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_05");	//Takže se tě musím zeptat, zvládneš to?
	Mob_CreateItems("NW_CHEST_49",ItMw_Rapier,1);
	REALPROTMAGIC = 0;
	REALPROTFIRE = 0;
	Wld_InsertNpc(dmt_1212_dagot,"NW_XARDAS_TOWER_IN1_28");
	Info_ClearChoices(DIA_Xardas_FirstEXIT);
	Info_AddChoice(DIA_Xardas_FirstEXIT,"Jen mě zdržuješ. (Obtížnost: legendární)",DIA_Xardas_FirstEXIT_Legend);
	Info_AddChoice(DIA_Xardas_FirstEXIT,"Nemusíš, nikdo mě nezastaví. (Obtížnost: těžká)",DIA_Xardas_FirstEXIT_CantStopMe);
	Info_AddChoice(DIA_Xardas_FirstEXIT,"No, mám trochu obavy... (Obtížnost: střední)",DIA_Xardas_FirstEXIT_DontKnow);
	Info_AddChoice(DIA_Xardas_FirstEXIT,"Ano, ale hodila by se mi nějaká pomoc. (Obtížnost: lehká)",DIA_Xardas_FirstEXIT_NeedHelp);
};

func void DIA_Xardas_FirstEXIT_Legend()
{
	Snd_Play("DRAGON_WRATH_01");
	Wld_SendTrigger("EVT_START_CAM");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_01");	//Jen mě zdržuješ.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_02");	//Oba dva víme, že jen já mohu uspět. Jinak bys mě určitě nezachraňoval. 
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_03");	//Vím, že to nebude snadné, ale já jsem já.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_04");	//Takže ustup a sleduj mistra!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_05");	//(opovrživně) Blázne! Tak moc chceš zemřít? Ani netušíš co číhá venku!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_06");	//Jen překročíš práh mé věže, tak tě něco sežere!
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_07");	//Nepoučuj! Už jdu...
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_08");	//Velká škoda! Ten, kdo nezná strach, je odsouzen ke zkáze!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_09");	//Nemáš představu o moci nepřítele!
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_Legend_01_10");	//Přestaň s těmi přednáškami. Zvládnu to. Nech to na mě.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_Legend_01_11");	//No dobře! Sám uvidíš...
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_09");	//A ještě jedna věc.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_10");	//Je tu někdo, kdo si s tebou přeje mluvit.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_11");	//Co? Kdo je to?
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_12");	//To se dozvíš, jakmile si s ním promluvíš a budeš pozorně poslouchat.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_LastWordsMe_01_01");	//Pamatuj! Nesejde na tom, co jsi už vykonal předtím nebo kým jsi byl. Jde o to, co máš nyní před sebou...
	GivePack = TRUE;
	AI_StopProcessInfos(self);
	XP_PER_VICTORY = 10;	// deprecated
	NoHPForLevel = TRUE;	// deprecated
	SURPRISE = 0;
	SBMODE = 1;
	SLEEPDIS = 9;	// deprecated
	CheckStatusHero[0] = SBMODE;
	CheckLevelOption[CH_XP_PER_VICTORY] = XP_PER_VICTORY;
	CheckLevelOption[CH_SURPRISE] = SURPRISE;
	CheckLevelOption[CH_SLEEPDIS] = SLEEPDIS;
	TrapStatus = TRUE;	// deprecated
	CanChangeItem = TRUE;
	Hero_Hunger = 10;
	Hero_Thirst = 5;
	Hero_Fatigue = 10;
	StatusDayNow = Wld_GetDay();
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
	RealMode[2] = TRUE;

	if(CheckRealMode[1] == FALSE)
	{
		CheckRealMode[1] = TRUE;
	};

	CZ_Settings_Diff_Init();

	Wld_InsertNpc(Oster,"NW_XARDAS_TOWER_WATERFALL_01");
	Wld_InsertNpc(Oster,"NW_XARDAS_VALLEY_08");
	Wld_InsertNpc(Oster,"NW_XARDAS_VALLEY_04");
	xardas_firstlock();
};

func void DIA_Xardas_FirstEXIT_CantStopMe()
{
	Snd_Play("DEM_AMBIENT");
	Wld_SendTrigger("EVT_START_CAM");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_01");	//Nemusíš, nikdo mě nezastaví.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_02");	//Čím déle tady stojím, tím méně času mám na lov draků!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_03");	//Tvé sebevědomí mne těší a děsí zároveň.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_04");	//Doufám, že chápeš jejich moc. Pokud selžeš, všichni na tomto ostrově zaplatí životem.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_05");	//Neboj se. Vím, co dělám.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_09");	//A ještě jedna věc.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_10");	//Je tu někdo, kdo si s tebou přeje mluvit.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_CantStopMe_01_11");	//Co? Kdo je to?
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_CantStopMe_01_12");	//To se dozvíš, jakmile si s ním promluvíš a budeš pozorně poslouchat.
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_LastWordsMe_01_01");	//Pamatuj! Nesejde na tom, co jsi už vykonal předtím nebo kým jsi byl. Jde o to, co máš nyní před sebou...
	GivePack = TRUE;
	AI_StopProcessInfos(self);
	Mob_CreateItems("XAR_CHEST",ItFo_Apple,3);
	Mob_CreateItems("XAR_CHEST",ItMi_Gold,20);
	XP_PER_VICTORY = 15;	// deprecated
	NoHPForLevel = TRUE;	// deprecated
	SURPRISE = 0;
	SBMODE = 1;
	SLEEPDIS = 9;	// deprecated
	CheckStatusHero[0] = SBMODE;
	CheckLevelOption[CH_XP_PER_VICTORY] = XP_PER_VICTORY;
	CheckLevelOption[CH_SURPRISE] = SURPRISE;
	CheckLevelOption[CH_SLEEPDIS] = SLEEPDIS;
	TrapStatus = TRUE;	// deprecated
	CanChangeItem = TRUE;
	Hero_Hunger = 10;
	Hero_Thirst = 5;
	Hero_Fatigue = 10;
	StatusDayNow = Wld_GetDay();
	hero.attribute[ATR_MANA_MAX] = 20;
	hero.aivar[REAL_MANA_MAX] = 20;
	HeroRealMaxMana = 20;
	hero.attribute[ATR_MANA] = 20;
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_1H,4);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_2H,4);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_BOW,4);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_CROSSBOW,4);
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");

	CZ_Settings_Diff_Init();

	Wld_InsertNpc(Scavenger,"NW_XARDAS_PATH_FARM1_08_01");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_TOWER_WATERFALL_01");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_VALLEY_08");
	Wld_InsertNpc(Scavenger,"NW_XARDAS_VALLEY_04");
	xardas_firstlock();
};

func void DIA_Xardas_FirstEXIT_DontKnow()
{
	Snd_Play("TRO_WARN");
	Wld_SendTrigger("EVT_START_CAM");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_DontKnow_01_00");	//No, mám trochu obavy...
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_DontKnow_01_02");	//Dobře. Pomohu ti obnovit část tvých sil.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_DontKnow_01_03 " );	// However, my supply of magic potions is somewhat limited. But all that I have is at your disposal.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_DontKnow_01_04 " );	// Here, put them to good use.
	CreateInvItems(other,ItPo_Perm_Health,1);
	CreateInvItems(other,ItPo_Health_02,2);
	GivePack = TRUE;
	AI_Print( " Several potions received... " );
	AI_Output(other,self, " DIA_Xardas_FirstEXIT_DontKnow_01_05 " );	// How about some armor?
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_DontKnow_01_06 " );	// Here, take these kick pants. Unfortunately, I don't have anything better.
	B_GiveInvItems(self,other,ITAR_PRISONEL,1);
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_DontKnow_01_08 " );	// And one more thing.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_DontKnow_01_09 " );	// There is someone who wishes to speak with you.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_DontKnow_01_10");	//Co? Kdo je to?
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_DontKnow_01_11 " );	// You'll find out once you talk to him and listen carefully.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_LastWordsMe_01_01 " );	// Remember! It's not about what you've done before or who you've been. It's about what's in front of you now...
	AI_Print(concatText);
	AI_StopProcessInfos(self);
	XP_PER_VICTORY = 20;	// deprecated
	SBMODE = 2;
	SLEEPDIS = 24;	// deprecated
	SURPRISE = 10;
	CheckStatusHero[0] = SBMODE;
	CheckLevelOption[CH_XP_PER_VICTORY] = XP_PER_VICTORY;
	CheckLevelOption[CH_SURPRISE] = SURPRISE;
	CheckLevelOption[CH_SLEEPDIS] = SLEEPDIS;
	TrapStatus = TRUE;	// deprecated
	CanChangeItem = TRUE ;
	Mob_CreateItems("XAR_CHEST",ItFo_Apple,5);
	Mob_CreateItems("XAR_CHEST",ItMi_Gold,200);
	hero.attribute[ATR_STRENGTH] = 20;
	hero.aivar[REAL_STRENGTH] = 20;
	HeroRealStr = 20;
	hero.attribute[ATR_DEXTERITY] = 20;
	hero.aivar[REAL_DEXTERITY] = 20;
	HeroRealDex = 20;
	hero.attribute[ATR_MANA_MAX] = 30;
	hero.aivar[ REAL_MANA_MAX ] = 30 ;
	HeroRealMaxMana = 30;
	hero.attribute[ATR_MANA] = 30;
	hero.attribute[ATR_HITPOINTS_MAX] = 200;
	hero.attribute[ATR_HITPOINTS] = 200;
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_1H,9);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_2H,9);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_BOW,9);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_CROSSBOW,9);
	AI_StopProcessInfos(self);
	B_Chapter Change( 1 , NEWWORLD_ZEN );
	Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");

	CZ_Settings_Diff_Init();

	Wld_InsertNpc(Molerat,"NW_XARDAS_PATH_FARM1_08_01");
	Wld_InsertNpc(Molerat,"NW_XARDAS_TOWER_WATERFALL_01");
	Wld_InsertNpc(Molerat,"NW_XARDAS_VALLEY_08");
	Wld_InsertNpc(Molerat,"NW_XARDAS_VALLEY_04");
};

func void DIA_Xardas_FirstEXIT_NeedHelp()
{
	Snd_Play("SHP_AMBIENT");
	Wld_SendTrigger("EVT_START_CAM");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self, " DIA_Xardas_FirstEXIT_NeedHelp_01_00 " );	// Yes, but I could use some help.
	AI_Output(other,self, " DIA_Xardas_FirstEXIT_NeedHelp_01_01 " );	// I'm not sure I'll even make it to town.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_02 " );	// Yes, that's the most important thing.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_03 " );	// In town you get equipment and get stronger.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_06 " );	// Here, take these potions and magic scrolls.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_07 " );	// Use them on your way.
	CreateInvItems(other,ItPo_Health_02,5);
	CreateInvItems(other,ItPo_Perm_Health,1);
	CreateInvItems(other,ItPo_Mana_02,5);
	CreateInvItems(other,ItSc_Firebolt,2);
	CreateInvItems(other,ItSc_Zap,2);
	GivePack = TRUE;
	AI_Print( " Several potions and magic scrolls received... " );
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_08 " );	// And don't try to save them for worse times! Your life is too precious!
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_09 " );	// Take some more gold. This may be useful for you.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self, " DIA_Xardas_FirstEXIT_NeedHelp_01_10 " );	// How about some armor?
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_11 " );	// Here, take these kick pants. Unfortunately, I don't have anything better.
	B_GiveInvItems(self,other,ITAR_Prisoner,1);
	AI_Output(other,self, " DIA_Xardas_FirstEXIT_NeedHelp_01_12 " );	// Thanks! And now I will go.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_13 " );	// Sure... - And one more thing.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_14 " );	// There is someone who wishes to speak with you.
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_NeedHelp_01_15");	//Co? Kdo je to?
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_NeedHelp_01_16 " );	// You'll find out once you talk to him and listen carefully.
	AI_Output(self,other, " DIA_Xardas_FirstEXIT_LastWordsMe_01_01 " );	// Remember! It's not about what you've done before or who you've been. It's about what's in front of you now...
	AI_StopProcessInfos(self);
	XP_PER_VICTORY = 25;	// deprecated
	SBMODE = 4;
	SLEEPDIS = 24;	// deprecated
	SURPRISE = 10;
	CheckStatusHero[0] = SBMODE;
	CheckLevelOption[CH_XP_PER_VICTORY] = XP_PER_VICTORY;
	CheckLevelOption[CH_SURPRISE] = SURPRISE;
	CheckLevelOption[CH_SLEEPDIS] = SLEEPDIS;
	TrapStatus = FALSE;	// deprecated
	CanChangeItem = TRUE ;
	Mob_CreateItems("XAR_CHEST",ItMi_Gold,200);
	hero.attribute[ATR_STRENGTH] = 30;
	hero.aivar[REAL_STRENGTH] = 30;
	HeroRealStr = 30;
	hero.attribute[ATR_DEXTERITY] = 30;
	HeroRealDex = 30;
	hero.aivar[REAL_DEXTERITY] = 30;
	hero.attribute[ATR_MANA_MAX] = 40;
	hero.aivar[ REAL_MANA_MAX ] = 40 ;
	HeroRealMaxMana = 40;
	hero.attribute[ATR_MANA] = 40;
	hero.attribute[ATR_HITPOINTS_MAX] = 300;
	hero.attribute[ATR_HITPOINTS] = 300;
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_1H,14);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_2H,14);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_BOW,14);
	B_TeachFightTalentPercent_Quiet(self,other,NPC_TALENT_CROSSBOW,14);
	AI_StopProcessInfos(self);
	B_Chapter Change( 1 , NEWWORLD_ZEN );
	Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");

	CZ_Settings_Diff_Init();

	Wld_InsertNpc(Rabbit,"NW_XARDAS_PATH_FARM1_08_01");
	Wld_InsertNpc(Rabbit,"NW_XARDAS_TOWER_WATERFALL_01");
	Wld_InsertNpc(Rabbit,"NW_XARDAS_VALLEY_08");
	Wld_InsertNpc(Rabbit,"NW_XARDAS_VALLEY_04");
};

instance DIA_Xardas_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_EXIT_Condition;
	information = DIA_Xardas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_EXIT_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Xardas_FirstEXIT ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Xardas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_XARDAS_NO_TALK(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_no_talk_condition;
	information = dia_xardas_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_xardas_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xardas_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};

DIA_XARDAS_DAGOT (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_dagot_condition;
	information = dia_xardas_dagot_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_xardas_dagot_condition()
{
	if((DAGOT_MEET == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xardas_dagot_info()
{
	if(GUARDIAN_WAY == TRUE)
	{
		XARDAS_SPEAKDAGOT = TRUE;
		AI_Output(self,other, " DIA_Xardas_Dagot_01_00 " );	// So you accepted the Rangers' offer...
		AI_Output(self,other, " DIA_Xardas_Dagot_01_01 " );	// Your decision was rushed, but you can't change it now.
		AI_Output(self,other, " DIA_Xardas_Dagot_01_02 " );	// You can't just leave their path.
		AI_Output(other,self, " DIA_Xardas_Dagot_01_03 " );	// The guards expect me to follow her.
		AI_Output(self,other,"DIA_Xardas_Dagot_01_04");	//Ano, tak to je.
		AI_Output(self,other, " DIA_Xardas_Dagot_01_05 " );	// You know, it was the Guardians - they asked me to banish the Sleeper and destroy the barrier.
		AI_Output(self,other, " DIA_Xardas_Dagot_01_06 " );	// You fulfilled their wish, and this is your reward, as you yourself have received it.
		AI_Output(self,other, " DIA_Xardas_Dagot_01_07 " );	// If you refused, I don't know what would happen.
		AI_Output(other,self, " DIA_Xardas_Dagot_01_08 " );	// Dagoth just said something to me and then disappeared!
		AI_Output(self,other, " DIA_Xardas_Dagot_01_09 " );	// Don't take it like that... It's a great honor to perform a task for a Guardian.
		AI_Output(self,other, " DIA_Xardas_Dagot_01_09A " );	// You deserve this honor for banishing the Sleeper.
		AI_Output(self,other, " DIA_Xardas_Dagot_01_10 " );	// What he said can mean anything - maybe you'll meet him once and then you'll understand.
		AI_Output(self,other, " DIA_Xardas_Dagot_01_11 " );	// But you should drop ideals and focus on more important things now.
		B_LogEntry( TOPIC_GUARDIANS , " Xardas told me that I will meet the Guardians again, but when the time is right. " );
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Xar");
	}
	else if(GUARDIAN_WAY == FALSE)
	{
		AI_Output(self,other, " DIA_Xardas_Dagot_01_13 " );	// So you turned down the Rangers' offer...
		AI_Output(self,other, " DIA_Xardas_Dagot_01_14 " );	// Your action was rash, but it won't change anything now.
		AI_Output(other,self, " DIA_Xardas_Dagot_01_15 " );	// The guard said I should follow the path.
		AI_Output(self,other, " DIA_Xardas_Dagot_01_16 " );	// Sorry, but I can't tell you more.
		AI_Output(self,other, " DIA_Xardas_Dagot_01_17 " );	// You should drop ideals and focus on more important things.
		B_LogEntry( TOPIC_GUARDIANS , " Xardas told me to forget about it. " );
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Xar");
	};
};


var int Addon_zuerst;
var int modcheckv;

instance DIA_Xardas_Hello(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Hello_Condition;
	information = DIA_Xardas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Xardas_Hello_Condition()
{
	if(PrologCredits == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Xardas_Hello_Info()
{
	self.name[0] = "Xardas";
	self.noFocus = FALSE;
	Mdl_ApplyOverlayMds(other,"PRE_START.MDS");
	Wld_SendTrigger("EVT_START_CAM");
	Snd_Play("RAVENS_EARTHQUAKE1");
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_01,StartHelpBug_01,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_02,StartHelpBug_02,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_03,StartHelpBug_03,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_04,StartHelpBug_04,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",StartHelpBug_05,StartHelpBug_05,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_01,StartHelpBug_01,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_02,StartHelpBug_02,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_03,StartHelpBug_03,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_04,StartHelpBug_04,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_BELIARSRAGE",StartHelpBug_05,StartHelpBug_05,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	AI_PlayAni(hero,"T_STAND_2_HEROSUMMON");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Wait(hero,1);
	AI_UnequipArmor(hero);
	CreateInvItems(other,ITAR_Her_M,1);
	AI_EquipArmor(other,ITAR_Her_M);
	AI_PlayAni(hero,"T_HEROSUMMON_2_STAND");
	AI_Wait(self,2);
	MODCHECKV = 201 ;
	FalkHunters = 3;
	CaptureCheat = TRUE;
	CrushBonus2HOn = TRUE ;
	DPSMeterOn = TRUE;
	CinemaMod = FALSE;
	CinemaModOneTime = FALSE;
	AI_Output(self,other, " DIA_Addon_Xardas_Hello_14_00 " );	// So here we have you! I didn't think we would meet again.
	AI_Output(other,self, " DIA_Addon_Xardas_Hello_15_01 " );	// I feel like I've been lying under a pile of rocks for three weeks.
	AI_Output(self,other, " DIA_Addon_Xardas_Hello_14_02 " );	// Well, yes, too. Only the magic in your armor saved you.
	Mob_CreateItems("XAR_CHEST",itpo_anpois,1);
	AI_Output(self,other, " DIA_Addon_Xardas_Hello_14_03 " );	// I was afraid that I would no longer be able to free you from the ruins of the temple.
	AI_Output(self,other, " DIA_Addon_Xardas_Hello_14_04 " );	// But enough of that. You are here now.
	AI_Output(self,other, " DIA_Addon_Xardas_Hello_14_05 " );	// There's a NEW danger to take care of.
	Npc_ExchangeRoutine(self,"START");
	Info_ClearChoices(DIA_Xardas_Hello);
	Info_AddChoice(DIA_Xardas_Hello, " At least we have enough time now. I took care of it. Sleep... " ,DIA_Addon_Xardas_Hello_Dragons);
	Info_AddChoice(DIA_Xardas_Hello, " What NEW danger are you talking about? " ,DIA_Addon_Xardas_Hello_Man);
};

func void DIA_Addon_Xardas_Hello_Man()
{
	Npc_RemoveInvItems(hero,ITAR_OLDOREARMOR,1);
	B_RemoveNpcKill(StartHelpBug_01);
	B_RemoveNpcKill(StartHelpBug_02);
	B_RemoveNpcKill(StartHelpBug_03);
	B_RemoveNpcKill(StartHelpBug_04);
	B_RemoveNpcKill(StartHelpBug_05);
	AI_Output(other,self, " DIA_Addon_Xardas_AddonIntro_Add_01_01 " );	// What NEW danger are you talking about?
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_02 " );	// One of the oldest artifacts of evil has reappeared!
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_03 " );	// It's called Beliar's Claw. If my information is accurate, it can be used to control legions of the undead.
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_04 " );	// Perhaps I don't need to explain that such a weapon must not fall into the hands of the Dark Lord's servants.
	AI_Output(other,self, " DIA_Addon_Xardas_AddonIntro_Add_01_05 " );	// And where is he now?
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_06 " );	// Ancient records show that the last owner of the weapon belonged to the Builder civilization. These people lived on this island several thousand years ago.
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_07 " );	// All were loyal admirers and followers of Adan. God of water and balance.
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_08 " );	// I have no doubt he is here on the island in some forgotten temple.
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_09 " );	// You have to find him!
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_10 " );	// (thoughtfully) The Water mages have recently begun to investigate this forgotten culture.
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_11 " );	// They even do something like an expedition to their temples.
	AI_Output(self,other, " DIA_Addon_Xardas_AddonIntro_Add_01_12 " );	// Join them! The claw must be found!
	addon_first = TRUE ;
};

func void DIA_Addon_Xardas_Hello_Dragons()
{
	AI_Output(other,self, " DIA_Xardas_Hello_15_03 " );	// At least we have enough time now. I took care of it. Sleeper...
	AI_Output(self,other, " DIA_Xardas_Hello_14_04 " );	// ... was banned. You defeated him, that is absolutely true - but it is not in our power to stop the war that will now ensue.
	AI_Output(self,other, " DIA_Xardas_Hello_14_07 " );	// With one last frantic scream, the Sleeper sent the army of darkness on its way.
	AI_Output(self,other, " DIA_Xardas_Hello_14_08 " );	// It was an order addressed to all evil creatures. A powerful spell they cannot disobey.
	AI_Output(self,other, " DIA_Xardas_Hello_14_09 " );	// His last order was: GO! And they went. All. Even dragons.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//(užasle) ... draci?!
	AI_Output(self,other, " DIA_Xardas_Hello_14_11 " );	// They are ancient creatures of unprecedented power. I can feel their presence - even here.
	AI_Output(self,other, " DIA_Xardas_Hello_14_12 " );	// They gathered around them an entire army of lesser creatures to serve them.
	AI_Output(other,self, " DIA_Xardas_Hello_15_13 " );	// Where is the army now?
	AI_Output(self,other, " DIA_Xardas_Hello_14_14 " );	// She camped not far from here, in Mining Valley near Khorinis. He slowly prepares to attack.

	if(Addon_zuerst == TRUE)
	{
		AI_Output(self,other, " DIA_Xardas_Hello_14_15 " );	// (thoughtfully) We don't have much time left.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Xardas_Hello_Dragons_14_06 " );	// But that's not all. There is ANOTHER threat that I just learned about.
		Info_ClearChoices(DIA_Xardas_Hello);
		Info_AddChoice(DIA_Xardas_Hello, " What OTHER danger are you talking about? " ,DIA_Addon_Xardas_Hello_Man);
	};
};

instance DIA_Xardas_OtherGreatWeapon(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_OtherGreatWeapon_Condition;
	information = DIA_Xardas_OtherGreatWeapon_Info;
	permanent = FALSE;
	description = " Which weapon besides Uriziel can kill dragons? " ;
};

func int DIA_Xardas_OtherGreatWeapon_Condition()
{
	if ((Npc_KnowsInfo(other,DAY_Xardas_ALL) ==  TRUE ) && (Capital >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Xardas_OtherGreatWeapon_Info()
{
	AI_Output(other,self, " DIA_Xardas_OtherGreatWeapon_01_00 " );	// Which weapon besides Uriziel can kill dragons?
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_01 " );	// In this world, there are many artifacts comparable to sword power.
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_02 " );	// But little is known about them.
	AI_Output(other,self, " DIA_Xardas_OtherGreatWeapon_01_03 " );	// Can you think of anything?
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_05 " );	// Well, one of them is a magic wand. it is called the Staff of Eternity.
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_06 " );	// Has indescribable power. It can match any force. Dragons for sure.
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_07 " );	// Of course, it takes a very powerful mage to master it.
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_08 " );	// Otherwise it just becomes a regular stick.
	AI_Output(other,self, " DIA_Xardas_OtherGreatWeapon_01_09 " );	// Okay. Where can I find her?
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_10 " );	// If I knew, I use it myself. Such things do not lie by the wayside.
	AI_Output(other,self, " DIA_Xardas_OtherGreatWeapon_01_13 " );	// Ah. And something else?
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_14 " );	// I've also heard of an artifact called Er'Hazir. That means Star of Rage.
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_15 " );	// According to legend, this bow was created by Adanos himself. So that his chosen one could resist their enemy who was chasing them through the whole world.
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_16 " );	// Arrows from it are said to have penetrated any armor or magical protection.
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_17 " );	// Such a weapon is perfect for fighting dragons!
	AI_Output(self,other, " DIA_Xardas_OtherGreatWeapon_01_19 " );	// Unfortunately, it's a legend. I have no idea if the weapon actually exists.
	AI_Output(other,self,"DIA_Xardas_OtherGreatWeapon_01_21");	//Tak uvidíme.
};

instance DIA_Xardas_AWAY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_AWAY_Condition;
	information = DIA_Xardas_AWAY_Info;
	permanent = FALSE;
	description = " So let's hurry to be gone as quickly as possible! " ;
};

func int DIA_Xardas_AWAY_Condition()
{
	if ( ! Npc_KnowsInfo(other,DAY_Xardas_ALL) &&  ! Npc_KnowsInfo(other,DAY_Xardas_FirstEXIT) && (Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info()
{
	Snd_Play("LevelUp");
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Xardas_AWAY_15_00 " );	// So let's hurry to get out as fast as possible!
	AI_Output(self,other, " DIA_Xardas_AWAY_14_01 " );	// Running away now will only mean we'll have to face the dragons later.
	AI_Output(self,other, " DIA_Xardas_AWAY_14_02 " );	// With the help of the soldiers and mages that live in these parts, we could stop their army before it is fully formed.
	AI_Output(self,other, " DIA_Xardas_AWAY_14_03 " );	// We'll never have a better chance.
	AI_NoticePrint(3000,4098,NAME_Addon_ScareBonus);
	RankPoints = RankPoints + 1;
	ScareBonus = TRUE;
};

instance DIA_Xardas_TODO (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_TODO_Condition;
	information = DIA_Xardas_TODO_Info;
	permanent = FALSE;
	description = " What are we going to do? " ;
};

func int DIA_Xardas_TODO_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DAY_Xardas_TODO_Info()
{
	AI_Output(other,self, " DIA_Xardas_TODO_15_00 " );	// What are we going to do?
	AI_Output(self,other, " DIA_Xardas_TODO_14_01 " );	// We can't do it ourselves this time. Only Innos' power can help us against those dragons.
	AI_Output(self,other, " DIA_Xardas_TODO_14_02 " );	// There is a group of paladins based in Khorinis city, it's not far from here.
	AI_Output(self,other, " DIA_Xardas_TODO_14_03 " );	// They have a powerful artifact that could help us a lot in the fight against the dragons.
	AI_Output(self,other, " DIA_Xardas_TODO_14_04 " );	// They call it the Eye of Innos. You must get the artifact at all costs.
	AI_Output(self,other, " DIA_Xardas_TODO_14_05 " );	// Tell the paladins about the danger that lies ahead. You MUST convince their leader to help us!
	AI_Output(self,other, " DIA_Xardas_TODO_14_09 " );	// But there's one more thing we could really use to defeat the dragons...
	AI_Output(self,other, " DIA_Xardas_TODO_14_11 " );	// The sword that defeated the Sleeper! The eye will protect you from the dragon's flames, but you'll need a really deadly weapon to defeat them!
	AI_Output(other,self,"DIA_Xardas_TODO_14_12");	//Uriziel?!
	AI_Output(self,other, " DIA_Xardas_TODO_14_13 " );	// The one!... (seriously)
	AI_Output(other,self, " DIA_Xardas_TODO_14_14 " );	// But he stayed in the Sleeper's Temple!
	AI_Output(self,other, " DIA_Xardas_TODO_14_15 " );	// So you'll have to go back there again.
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_Running);
	B_LogEntry( TOPIC_INNOSEYE , " A group of paladins have settled in Khorinis, guarding a powerful artifact called the Eye of Innos that can help us ward off the dragon threat. I must somehow convince the holy warriors to join us. " );
	Log_CreateTopic(TOPIC_ORCTEMPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCTEMPLE,LOG_Running);
	B_LogEntry_Quiet( TOPIC_ORCTEMPLE , " Xardas informed me that in addition to the Eye of Innos, I will also need the ancient blade called Uriziel, which I used to banish the Sleepers... If I want to have any advantage against the dragons, I will have to go to the Temple of the Sleeper again and find Uriziel. " ) ;
	Info_ClearChoices(DIA_Xardas_TODO);
};

instance DIA_Addon_Xardas_StonePlate(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Addon_Xardas_StonePlate_Condition;
	information = DIA_Addon_Xardas_StonePlate_Info;
	description = " Can you tell me something about this stone slab? " ;
};

func int DIA_Addon_Xardas_StonePlate_Condition()
{
	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_StonePlate_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Addon_Xardas_StonePlate_15_00 " );	// Can you tell me something about this stone slab?
	AI_Output(self,other, " DIA_Addon_Xardas_StonePlate_14_03 " );	// At first I thought it was some kind of magical artifact, but I've come to the conclusion that it's not important.
	AI_Output(self,other, " DIA_Addon_Xardas_StonePlate_14_04 " );	// I haven't been able to translate the record completely, but it looks like it's a story of a very old culture.
	AI_Output(self,other, " DIA_Addon_Xardas_StonePlate_14_05 " );	// If you want her, feel free to take her. I have no further use for her.
};

instance DIA_XARDAS_ORCTEMPLE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_orctemple_condition;
	information = dia_xardas_orctemple_info;
	permanent = FALSE;
	description = " I found a lot of strange things at the entrance to the Sleeper's Temple... " ;
};

func int dia_xardas_orctemple_condition()
{
	if((MIS_ORCTEMPLE == LOG_Running) && (ORCTEMPLEONETIME == TRUE) && (ORCTEMPLEGATEOPENED == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_orctemple_info()
{
	AI_Output(other,self, " DIA_Xardas_OrcTemple_15_00 " );	// I found some very strange things at the entrance to the Sleeper's Temple...
	AI_Output(other,self, " DIA_Xardas_OrcTemple_15_01 " );	// Goblin spirits that do not respond to anything and a stone slab covers the entrance to the temple.
	AI_Output(self,other, " DIA_Xardas_OrcTemple_14_02 " );	// Yes, you came in time, I already solved it.
	AI_Output(self,other, " DIA_Xardas_OrcTemple_14_03 " );	// That slab covers the tunnel - it's the work of the goblins who covered it right after the barrier fell.
	AI_Output(self,other, " DIA_Xardas_OrcTemple_14_04 " );	// I have not yet found out the reason why they were in such a hurry and why they left the city.
	AI_Output(self,other, " DIA_Xardas_OrcTemple_14_05 " );	// But then I understood all of Beliar's jokes...
	AI_Output(self,other, " DIA_Xardas_OrcTemple_14_06 " );	// The Dark Lord greatly enjoys seeing his servants fight each other for his favor.
	AI_Output(self,other, " DIA_Xardas_OrcTemple_14_07 " );	// Apparently we have one more serious enemy to deal with.
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry( TOPIC_ORCTEMPLE , " I found the entrance to the Temple of the Sleeper blocked by a stone slab. " );
};


instance DIA_XARDAS_ORCTEMPLE2(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_orctemple2_condition;
	information = dia_xardas_orctemple2_info;
	permanent = FALSE;
	description = " Who are you talking about? " ;
};


func int dia_xardas_orctemple2_condition()
{
	if ( Npc_KnowsInfo ( other , dia_xardas_orctemple ) && ( MY_ORCTEMPLE  == LOG_Running ))
	{
		return TRUE;
	};
};

func void dia_xardas_orctemple2_info()
{
	AI_Output(other,self, " DIA_Xardas_OrcTemple2_15_00 " );	// Who are you talking about?
	AI_Output(self,other, " DIA_Xardas_OrcTemple2_14_01 " );	// I believe he is one of Beliar's chosen ones. I don't think he's weaker than dragons because Beliar doesn't like weak servants.
	AI_Output(self,other, " DIA_Xardas_OrcTemple2_14_02 " );	// I also understand why he went to the temple - he wants to find the most valuable thing left there - Uriziel.
	AI_Output(self,other, " DIA_Xardas_OrcTemple2_14_03 " );	// The temple is a convenient place to draw his demonic powers.
	AI_Output(self,other, " DIA_Xardas_OrcTemple2_14_04 " );	// Apparently the goblins were afraid, so they left and closed the temple.
	AI_Output(self,other, " DIA_Xardas_OrcTemple2_14_05 " );	// And those ghosts you saw probably serve to scare away uninvited guests.
	AI_Output(self,other, " DIA_Xardas_OrcTemple2_14_06 " );	// Looks like we have no other choice. You must return to the temple and find out what is behind this evil.
	B_LogEntry( TOPIC_ORCTEMPLE , " I should return to the Temple of the Sleeper and find out what evil lurks there. " );
};


instance DIA_XARDAS_ORCTEMPLEDOOR(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_orctempledoor_condition;
	information = dia_xardas_orctempledoor_info;
	permanent = FALSE;
	description = " How do I get to the temple? " ;
};


func int dia_xardas_orctempledoor_condition()
{
	if ( Npc_KnowsInfo ( other , dia_xardas_orctemple ) && ( ORCTEMPLEGATEOPEN  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_xardas_orctempledoor_info()
{
	AI_Output(other,self, " DIA_Xardas_OrcTempleDoor_15_00 " );	// How do I get to the temple?
	AI_Output(other,self, " DIA_Xardas_OrcTempleDoor_15_01 " );	// There are no levers or switches visible at the entrance...
	AI_Output(self,other, " DIA_Xardas_OrcTempleDoor_14_02 " );	// The goblins probably used a spell to keep anyone out.
	AI_Output(self,other, " DIA_Xardas_OrcTempleDoor_14_03 " );	// I'm afraid I can't help you. You will have to find a solution yourself.
	AI_Output(self,other, " DIA_Xardas_OrcTempleDoor_14_04 " );	// I think only goblins can help you.
	B_LogEntry( TOPIC_ORCTEMPLE , " Xardas has no idea how to get over the stone slab at the entrance. I should ask the orcs... " );
	ORCTEMPLEGATEINFO = TRUE;
};


instance DIA_XARDAS_DMST_DEAD(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_dmst_dead_condition;
	information = dia_xardas_dmst_dead_info;
	permanent = FALSE;
	description = " I was in the Temple of the Sleeper. " ;
};


func int dia_xardas_dmst_dead_condition()
{
	if (( DARKMAGE_ISDEAD  ==  TRUE ) && ( XARDASKNOWSDEADMAGE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_xardas_dmst_dead_info()
{
	AI_Output(other,self, " DIA_Xardas_DMST_Dead_15_00 " );	// I was in the Temple of the Sleeper.
	AI_Output(self,other, " DIA_Xardas_DMST_Dead_14_03 " );	// Really?! And who was there?
	AI_Output(other,self, " DIA_Xardas_DMST_Dead_15_04 " );	// Some mage. He looked like you and was dressed the same.
	AI_Output(other,self, " DIA_Xardas_DMST_Dead_15_04A " );	// And he had a sword with him - you know which one I mean?
	AI_Output(self,other, " DIA_Xardas_DMST_Dead_14_05 " );	// Uriziel? Great! You'll still need it. So the necromancer... hmm... thanks to you, Beliar lost another loyal servant.
	AI_Output(self,other, " DIA_Xardas_DMST_Dead_14_06 " );	// That mage could become Beliar's chosen one. This fact may open up some other opportunities for us... (thinks)
	AI_Output(self,other, " DIA_Xardas_DMST_Dead_14_07 " );	// Well, okay... that's not the point now. (laughs cleverly)
	B_GivePlayerXP(200);
	XARDASKNOWSDEADMAGE = TRUE;
};


instances of DIA_XARDAS_MAKERUNE (C_Info)
{
	npc = NONE_100_Xardas;
	condition = dia_xardas_makerune_condition;
	information = dia_xardas_makerune_info;
	important = FALSE;
	permanent = FALSE;
	description = " You said even a mage can use this sword. " ;
};


func int dia_xardas_makerune_condition()
{
	if ((Npc_HasItems(other,itmw_2h_urizel) >=  1 ) && ( XARDASKNOWSDEADMAGE  ==  TRUE ) && ( KNOWINFOURIZELRUNE  ==  FALSE ) && ((other.guild ==  GIL_KDF ) || (other.guild ==  GIL_GUR ) || ( other.guild ==  GIL_KDW ) || (other.guild ==  GIL_KDM )))
	{
		return TRUE;
	};
};

func void dia_xardas_makerune_info()
{
	AI_Output(other,self, " DIA_Xardas_MAKERUNE_15_01 " );	// You said even a mage can use this sword.
	AI_Output(self,other, " DIA_Xardas_MAKERUNE_14_02 " );	// Take a closer look at him. See that blue stone on the blade?
	AI_Output(self,other, " DIA_Xardas_MAKERUNE_14_03 " );	// It is he who hides all the magical power of Uriziel.
	AI_Output(self,other, " DIA_Xardas_MAKERUNE_14_04 " );	// If I remove it from here, I can create a magic rune that will have the same properties.
	AI_Output(other,self, " DIA_Xardas_MAKERUNE_15_05 " );	// Make a sword a magic rune?
	AI_Output(self,other, " DIA_Xardas_MAKERUNE_14_06 " );	// In battle, her strength will be no less than that of Uriziel himself!
	AI_Output(self,other, " DIA_Xardas_MAKERUNE_14_07 " );	// I can do it for you, but you have to be absolutely sure you really want it.
	AI_Output(self,other, " DIA_Xardas_MAKERUNE_14_08 " );	// Think carefully, because then I won't be able to restore the sword's power!
	AI_Output(self,other,"DIA_Xardas_MAKERUNE_14_09");	//Tak co sis vybral?
	KNOWINFOURIZELRUNE = TRUE;
};


instance DIA_XARDAS_MAKERUNEDOIT(C_Info)
{
	npc = NONE_100_Xardas;
	condition = dia_xardas_makerunedoit_condition;
	information = dia_xardas_makerunedoit_info;
	important = FALSE;
	permanent = TRUE;
	description = " Remove the stone from Uriziel! " ;
};


func int dia_xardas_makerunedoit_condition()
{
	if((Npc_HasItems(other,itmw_2h_urizel) >= 1) && (XARDASKNOWSDEADMAGE == TRUE) && (KNOWINFOURIZELRUNE == TRUE) && ((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM)))
	{
		return TRUE;
	};
};

func void dia_xardas_makerunedoit_info()
{
	AI_Output(other,self, " DIA_Xardas_MAKERUNEDOIT_15_01 " );	// Take the stone from Uriziel!
	AI_Output(self,other, " DIA_Xardas_MAKERUNEDOIT_14_03 " );	// Is this your final decision? Are you sure you want me to take the stone out?
	Info_ClearChoices(dia_xardas_makerunedoit);
	Info_AddChoice(dia_xardas_makerunedoit, " Yes, do it! " ,dia_xardas_makerune_yes);
	Info_AddChoice(dia_xardas_makerunedoit, " No, don't do that! " ,dia_xardas_makerune_no);
};

func void dia_xardas_makerune_yes()
{
	AI_Output(other,self, " DIA_Xardas_MAKERUNEDOIT_15_04 " );	// Yes, do it!
	AI_Output(self,other, " DIA_Xardas_MAKERUNEDOIT_14_05 " );	// What do you mean... Here's an empty sword and a rune!
	AI_Output(self,other, " DIA_Xardas_MAKERUNEDOIT_14_06 " );	// But keep in mind that you will only be able to use the true power of this rune in the fight against dragons.
	Npc_RemoveInvItem(other,itmw_2h_urizel);
	CreateInvItems(other,itmw_2h_urizel_nomagic,1);
	CreateInvItems(other,ItRu_BreathOfDeath,1);
	Info_ClearChoices(dia_xardas_makerunedoit);
};

func void dia_xardas_makerune_no()
{
	AI_Output(other,self, " DIA_Xardas_MAKERUNEDOIT_15_06 " );	// No, don't do that!
	AI_Output(self,other, " DIA_Xardas_MAKERUNEDOIT_14_07 " );	// What do you think. So let the sword retain its magical power.
	Info_ClearChoices(dia_xardas_makerunedoit);
};


instances of DIA_Addon_Xardas_Portal (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_Portal_Condition;
	information = DIA_Addon_Xardas_Portal_Info;
	description = " The Water Mages discovered a portal to an unknown part of the island... " ;
};


func int DIA_Addon_Xardas_Portal_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Saturas_WhatsOrnament ) && ( Saturas_KlaueInsMeer ==  FALSE ) &&  ! C_ScHasBeliarsWeapon());
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info()
{
	AI_Output(other,self, " DIA_Addon_Xardas_AddonSuccess_15_00 " );	// Mage Waters discovered a portal to an unknown part of the island...
	AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_01 " );	// How interesting...
	AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_02 " );	// When you find something that REALLY helps us, let me know!
	AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_03 " );	// Beliar's artifact may be hidden in there somewhere. Find him!
};


instances DIA_Addon_Xardas_PortalAgain (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_PortalAgain_Condition;
	information = DIA_Addon_Xardas_PortalAgain_Info;
	permanent = FALSE;
	description = " About an unknown part of the island... " ;
};


func int DIA_Addon_Xardas_PortalAgain_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Xardas_Portal ) && ( Saturas_KlaueInsMeer ==  FALSE ) &&  ! C_ScHasBeliarsWeapon ());
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info()
{
	AI_Output(other,self, " DIA_Addon_Xardas_AddonSuccess_15_17 " );	// About an unknown part of the island...
	AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_18 " );	// Don't burden me with details. Come back when you find something really useful.
};


instance DIA_Addon_Xardas_AddonSuccess(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_AddonSuccess_Condition;
	information = DIA_Addon_Xardas_AddonSuccess_Info;
	permanent = FALSE;
	description = " I explored an unknown part of the island... " ;
};


func int DIA_Addon_Xardas_AddonSuccess_Condition()
{
	if((Saturas_KlaueInsMeer == TRUE) || C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info()
{
	AI_Output(other,self, " DIA_Addon_Xardas_AddonSuccess_15_03 " );	// I explored an unknown part of the island...
	AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_04 " );	// And what did you find?
	AI_Output(other,self, " DIA_Addon_Xardas_AddonSuccess_15_05 " );	// Everything turned towards a powerful artifact. Beliar's Claw.
	AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_06 " );	// Beliar's Claw? where is he now Do you have it with you?
	if(C_ScHasBeliarsWeapon())
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_07");	//Ano, mám ho tady.
		AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_08 " );	// (hungry) Very interesting.
		AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_09 " );	// This weapon can be very useful to us. But also extremely dangerous.
		AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_10 " );	// Use it carefully! And most importantly: don't lose her!
		B_GivePlayerXP(XP_Ambient * 3);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_11");	//Už ho nemám...
		AI_Output(other,self, " DIA_Addon_Xardas_AddonSuccess_15_12 " );	// I gave her to the Water Mages to throw into the sea...
		AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_13 " );	// (furiously) Are you crazy? Do you even know what you put out of hand?
		AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_14 " );	// This weapon could have been very useful to us!
		AI_Output(other,self, " DIA_Addon_Xardas_AddonSuccess_15_15 " );	// I believe it's for the best.
		AI_Output(self,other, " DIA_Addon_Xardas_AddonSuccess_14_16 " );	// (sigh) God's ways are sometimes unpredictable...
	};
};


instance DIA_Xardas_ARTEFAKT (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_ARTEFAKT_Condition;
	information = DIA_Xardas_ARTEFAKT_Info;
	permanent = FALSE;
	description = " What exactly is the 'Eye of Innos'? " ;
};


func int DIA_Xardas_ARTEFAKT_Condition()
{
	if ( Npc_KnowsInfo ( other , DAY_Xardas_ALL ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info()
{
	AI_Output(other,self, " DIA_Xardas_ARTEFAKT_15_00 " );	// What exactly is the 'Eye of Innos'?
	AI_Output(self,other, " DIA_Xardas_ARTEFAKT_14_01 " );	// It's an amulet. Legend has it that Innos himself put some of his power into it.
	AI_Output(self,other, " DIA_Xardas_ARTEFAKT_14_02 " );	// Restores some of your lost power and helps us defeat the dragons.
	AI_Output(self,other, " DIA_Xardas_ARTEFAKT_14_03 " );	// It also has other hidden abilities. I will tell you more about them when you have him with you.
};


instances of DIA_Xardas_PALADIN (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_PALADIN_Condition;
	information = DIA_Xardas_PALADIN_Info;
	permanent = FALSE;
	description = " Why should paladins give me the Eye of Innos? " ;
};


func int DIA_Xardas_PALADIN_Condition()
{
	if ( Npc_KnowsInfo ( other , DAY_Xardas_ALL ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Xardas_PALADIN_Info()
{
	AI_Output(other,self, " DIA_Xardas_PALADIN_15_00 " );	// Why should paladins give me the Eye of Innos?
	AI_Output(self,other, " DIA_Xardas_PALADIN_14_01 " );	// Because you're the one fated to wear it.
	AI_Output(other,self, " DIA_Xardas_PALADIN_15_02 " );	// How can you know such a thing?
	AI_Output(self,other, " DIA_Xardas_PALADIN_14_03 " );	// I have several reasons for thinking this, but the most important one is that you defeated the Sleeper. If you weren't a favorite of the gods, you'd be dead by now.
	AI_Output(other,self, " DIA_Xardas_PALADIN_15_04 " );	// Let's say you're right and I'm chosen to carry the Eye of Innos. But how do paladins know this is true?
	AI_Output(self,other, " DIA_Xardas_PALADIN_14_05 " );	// The eye itself chooses who can have it. Once you reach it and put it on, the paladins will no longer be able to doubt your words.
};


instances of DIA_Xardas_Khorinis (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 4;
	condition = DIA_Xardas_Khorinis_Condition;
	information = DIA_Xardas_Khorinis_Info;
	permanent = FALSE;
	description = " How do I get to the city? " ;
};


func int DIA_Xardas_Khorinis_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Xardas_TODO ) && ( Lothar . aivar [ AIV_ TalkedToPlayer ] ==  FALSE ) && ( Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Xardas_Khorinis_Info()
{
	AI_Output(other,self, " DIA_Xardas_Khorinis_15_00 " );	// How do I get to town?
	AI_Output(self,other, " DIA_Xardas_Khorinis_14_01 " );	// Follow the path leading through the mountains from here. The city is big. You can't miss him.
	AI_Output(self,other, " DIA_Xardas_Khorinis_14_02 " );	// But be careful! The road to town is not entirely safe. And you're nowhere near as strong as you once were.
};


instance DIA_Xardas_WhereEx(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 6;
	condition = DIA_Xardas_WhereEx_Condition;
	information = DIA_Xardas_WhereEx_Info;
	permanent = FALSE;
	description = " And where are we anyway? " ;
};


func int DIA_Xardas_WhereEx_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Xardas_FirstEXIT ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info()
{
	AI_Output(other,self, " DIA_Xardas_Add_15_00 " );	// And where are we anyway?
	AI_Output(self,other, " DIA_Xardas_Add_14_01 " );	// As I said, near the city of Khorinis.
	AI_Output(self,other, " DIA_Xardas_Add_14_02 " );	// I rebuilt my tower here.
	AI_Output(other,self, " DIA_Xardas_Add_15_03 " );	// But it's only been a few days since we last saw each other in the Mining Valley...
	AI_Output(self,other, " DIA_Xardas_Add_14_04 " );	// The servants I summoned to restore my tower did a thorough job.
	AI_Output(other,self, " DIA_Xardas_Add_15_05 " );	// I feel the same way.
};


instance DIA_Xardas_EQUIPMENT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 7;
	condition = DIA_Xardas_EQUIPMENT_Condition;
	information = DIA_Xardas_EQUIPMENT_Info;
	permanent = FALSE;
	description = " Where can I find better equipment? " ;
};


func int DIA_Xardas_EQUIPMENT_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Xardas_FirstEXIT ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info()
{
	AI_Output(other,self, " DIA_Xardas_EQUIPMENT_15_00 " );	// Where can I find better gear?
	AI_Output(self,other, " DIA_Xardas_EQUIPMENT_14_01 " );	// The closest place to find better weapons and armor is the city of Khorinis.
	AI_Output(self,other, " DIA_Xardas_EQUIPMENT_14_02 " );	// But down in the valley you can find healing herbs here and there to help you when you're wounded in battle.
	AI_Output(self,other, " DIA_Xardas_EQUIPMENT_14_03 " );	// See that lake right in front of my tower? A secret path leads from it to the valley.
};


instance DIA_Xardas_ABOUTLESTER(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Xardas_ABOUTLESTER_Condition;
	information = DIA_Xardas_ABOUTLESTER_Info;
	permanent = FALSE;
	description = " Have you talked to Lester yet? " ;
};


func int DIA_Xardas_ABOUTLESTER_Condition()
{
	if((LesterGoXar == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_ABOUTLESTER_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Xardas_ABOUTLESTER_15_00 " );	// Have you talked to Lester yet?
	AI_Output(self,other, " DIA_Xardas_ABOUTLESTER_14_01 " );	// Yes, I peppered him with questions. he told me a lot, but he was completely exhausted.
	AI_Output(self,other, " DIA_Xardas_ABOUTLESTER_14_02 " );	// It's actually a miracle that he survived the escape at all. I sent him to rest.
	AI_Output(other,self, " DIA_Xardas_ABOUTLESTER_15_03 " );	// What did he tell you?
	AI_Output(self,other, " DIA_Xardas_ABOUTLESTER_14_04 " );	// No good, I'm afraid. Not only did he see a dragon, but also a black hooded man.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//A?
	AI_Output(self,other, " DIA_Xardas_ABOUTLESTER_14_06 " );	// If the men really exist, their presence is a possible threat.
	AI_Output(self,other, " DIA_Xardas_ABOUTLESTER_14_07 " );	// And I don't like that very much. Na, take my ring. It will protect you from magic.
	B_GiveInvItems(self,other,ItRi_Prot_Mage_01,1);
};


DIA_Xardas_FirstPal (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 10;
	condition = DIA_Xardas_FirstPal_Condition;
	information = DIA_Xardas_FirstPal_Info;
	permanent = FALSE;
	description = " I was in town. " ;
};


func int DIA_Xardas_FirstPal_Condition()
{
	if ((Lothar.aivar[AIV_TalkedToPlayer] ==  TRUE ) && (LordHagen.aivar[AIV_TalkedToPlayer] ==  FALSE ) && (other.guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstPal_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Xardas_FirstPal_15_00 " );	// I was in town.
	AI_Output(self,other, " DIA_Xardas_FirstPal_14_01 " );	// And? Did you manage to talk to the paladin leader?
	AI_Output(other,self, " DIA_Xardas_FirstPal_15_02 " );	// He didn't let me near him.
	AI_Output(self,other, " DIA_Xardas_FirstPal_14_03 " );	// Nonsense! There must be a way to get to it.
	AI_Output(self,other, " DIA_Xardas_FirstPal_14_04 " );	// When all else fails, enter the monastery and become a mage.
	AI_Output(self,other, " DIA_Xardas_FirstPal_14_05 " );	// Maybe it's a bit dubious from a moral point of view, but the end justifies the means.
	AI_Output(self,other, " DIA_Xardas_FirstPal_14_06 " );	// If you are a mage, he will definitely not refuse to meet you.
};


instance DIA_Xardas_Next (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = DIA_Xardas_Next_Condition;
	information = DIA_Xardas_Next_Info;
	permanent = FALSE;
	description = " So what do we do now? " ;
};


func int DIA_Xardas_Next_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Xardas_FirstEXIT ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Xardas_Next_Info()
{
	AI_Output(other,self, " DIA_Xardas_Weiter_15_00 " );	// So what do we do now?
	AI_Output(self,other, " DIA_Xardas_Weiter_14_01 " );	// We will proceed as planned. There is no other way.
	AI_Output(self,other, " DIA_Xardas_Weiter_14_02 " );	// You go get the Eye of Innos and I'll look for answers.
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_KdfSecret(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 9;
	condition = DIA_Xardas_KdfSecret_Condition;
	information = DIA_Xardas_KdfSecret_Info;
	permanent = FALSE;
	description = " Why don't the Fire mages know about you? " ;
};


func int DIA_Xardas_KdfSecret_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};

func void DIA_Xardas_KdfSecret_Info()
{
	AI_Output(other,self, " DIA_Xardas_KdfSecret_15_00 " );	// Why don't the Fire mages know about you?
	AI_Output(self,other, " DIA_Xardas_KdfSecret_14_01 " );	// I used to be a high ranking member of the circle. Even back then, I suspected that the key to the magic barrier might be demon magic.
	AI_Output(self,other, " DIA_Xardas_KdfSecret_14_02 " );	// However, I was never able to convince the other members of the circle to follow this lead.
	AI_Output(self,other, " DIA_Xardas_KdfSecret_14_03 " );	// So I left the circle to study the black arts.
	AI_Output(self,other, " DIA_Xardas_KdfSecret_14_04 " );	// And that is a crime for which the Fire mages, (bitingly) 'Servants of Innos', always 'Good' and 'Virtuous', will never accept any apology.
	AI_Output(self,other, " DIA_Xardas_KdfSecret_14_05 " );	// They're sure I'm still alive, but they have no idea where to look for me - and that's only a good thing.
};


instance DIA_Xardas_KAP3_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP3_EXIT_Condition;
	information = DIA_Xardas_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Xardas_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


DIA_Xardas_BACKFROMOW (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 31;
	condition = DIA_Xardas_BACKFROMOW_Condition;
	information = DIA_Xardas_BACKFROMOW_Info;
	description = " I returned from Mining Valley. " ;
};


func int DIA_Xardas_BACKFROMOW_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info()
{
	AI_Output(other,self, " DIA_Xardas_BACKFROMOW_15_00 " );	// I returned from Mining Valley.
	AI_Output(self,other, " DIA_Xardas_BACKFROMOW_14_01 " );	// It's about time. What did you see?
	AI_Output(other,self, " DIA_Xardas_BACKFROMOW_15_02 " );	// You were right. The whole country is swarming with an enemy army.
	AI_Output(other,self, " DIA_Xardas_BACKFROMOW_15_03 " );	// Orcs are besieging the castle and dragons have ravaged the entire region.
	AI_Output(other,self, " DIA_Xardas_BACKFROMOW_15_04 " );	// If I'm not mistaken, it won't be long before they attack Khorinis.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Xardas_DMTSINDDA(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 32;
	condition = DIA_Xardas_DMTSINDDA_Condition;
	information = DIA_Xardas_DMTSINDDA_Info;
	description = " What on earth happened here? " ;
};


func int DIA_Xardas_DMTSINDDA_Condition()
{
	if ((Capital ==  3 ) && Npc_KnowsInfo(other,DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info()
{
	if(Npc_KnowsInfo(other,DIA_Lester_BACKINTOWN))
	{
		AI_Output(other,self, " DIA_Xardas_DMTSINDDA_15_00 " );	// Lester said you wanted to see me right away.
	};

	AI_Output(other,self, " DIA_Xardas_DMTSINDDA_15_01 " );	// What on earth happened here?
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_14_02 " );	// The enemy has learned who you really are and wants to take the Eye of Innos.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_14_03 " );	// He found out what threat was coming at him. It forced him to leave cover and go on the attack.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_14_04 " );	// The game of hide and seek is over. Until yesterday, no one knew what the enemy's attack would look like. Now it's crystal clear.
	XarMeetPsi = TRUE;
	B_LogEntry( TOPIC_INNOSEYE , " The enemy has learned that I'm looking for the Eye of Innos. It's time to get it before it's too late. " );
	Info_ClearChoices(DIA_Xardas_DMTSINDDA);
	Info_AddChoice(DIA_Xardas_DMTSINDDA, " Black hooded mages attacked me. " ,DIA_Xardas_DMTSINDDA_DMT);
	Info_AddChoice(DIA_Xardas_DMTSINDDA, " I finally got proof for Lord Hagen. " ,DIA_Xardas_DMTSINDDA_Beweis);
};

func void DIA_Xardas_DMTSINDDA_DMT()
{
	AI_Output(other,self, " DIA_Xardas_DMTSINDDA_DMT_15_00 " );	// Black hooded mages attacked me.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_DMT_14_01 " );	// The enemy comes in many forms. Searchers is one of them. They are the ones preparing the ground for the enemy.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_DMT_14_02 " );	// They have taken up positions in strategic places and are now just waiting for the right opportunity to spring a trap.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_DMT_14_03 " );	// Avoid them. They are powerful magical creatures and will try to get you out of the way at any cost.

	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
		B_LogEntry( TOPIC_DEMENTOREN , " Xardas knows those dark-robed mages. The Seekers are probably the ones controlling our enemies. They are extremely dangerous. " );
	};
};

func void DIA_Xardas_DMTSINDDA_proof()
{
	AI_Output(other,self, " DIA_Xardas_DMTSINDDA_Beweis_15_00 " );	// I finally got the proof for Lord Hagen.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_Beweis_14_01 " );	// What kind of proof is this?
	AI_Output(other,self, " DIA_Xardas_DMTSINDDA_Beweis_15_02 " );	// I received a letter from Garond, Paladin Commander of Mining Valley. In it, he asks for reinforcements.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_Beweis_14_03 " );	// That should hopefully convince the militant politician. Good work.
	Info_AddChoice(DIA_Xardas_DMTSINDDA, " What do we do now? " ,DIA_Xardas_DMTSINDDA_DMT_WhatToDo);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo()
{
	AI_Output(other,self, " DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00 " );	// What do we do now?
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01 " );	// Go get Lord Hagen a letter from Garond, he should arrange for you to access the Eye of Innos.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02 " );	// Then go to the monastery and talk to Pyrokar. He will have to give you the Eye.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03 " );	// Nothing is more important than getting that artifact to safety.
	AI_Output(self,other, " DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04 " );	// Now run before it's too late. Even the enemy will definitely try to get him.
	B_LogEntry( TOPIC_INNOSEYE , " The Eye is located in the Monastery of the Fire Mages. Hopefully Lord Hagen will allow me to enter there now if I give him a message from Lord Garond. The Chief Mage Pyrokar won't let me go to the amulet without Hagen's permission at all. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(PC_Psionic,"XardasTow");
};


instance DIA_Xardas_INNOSEYEBROKEN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 33;
	condition = DIA_Xardas_INNOSEYEBROKEN_Condition;
	information = DIA_Xardas_INNOSEYEBROKEN_Info;
	description = " Innos' eye has been destroyed. " ;
};


func int DIA_Xardas_INNOSEYEBROKEN_Condition()
{
	if ((Capital ==  3 ) && Npc_KnowsInfo(other,DIA_Xardas_DMTSINDDA) && (Npc_HasItems(hero,ItMy_InnosEye_Broken_Mis) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info()
{
	AI_Output(other,self, " DIA_Xardas_INNOSEYEBROKEN_15_00 " );	// Eye of Innos has been destroyed.
	AI_Output(self,other, " DIA_Xardas_INNOSEYEBROKEN_14_01 " );	// What are you saying? Destroyed?!
	AI_Output(other,self, " DIA_Xardas_INNOSEYEBROKEN_15_02 " );	// I found this up in the northern woods - unfortunately I was only able to retrieve its fragments.
	AI_Output(self,other, " DIA_Xardas_INNOSEYEBROKEN_14_03 " );	// It was our only hope of standing against the dragons. He is now in a state of no return. We failed.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice(DIA_Xardas_INNOSEYEBROKEN, " What now? " ,DIA_Xardas_INNOSEYEBROKEN_wasnun);
};

func void DIA_Xardas_INNOSEYEBROKEN_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//Co teď?
	AI_Output(self,other, " DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01 " );	// This is painful news. We have to find our way in this situation ourselves. I'll download and try to find a solution.
	AI_Output(self,other, " DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02 " );	// In the meantime, you should go to town and talk to the Water Mage Vatras. It is possible that he will know what should be done.
	B_LogEntry( TOPIC_INNOSEYE , " The news of the destruction of the Eye of Innos certainly did not please Xardas. Our only hope now is a Water mage named Vatras who resides in the city of Khorinisu. " );
	MIS_Xardas_GoToVatrasInnoseye = LOG_Running;
};


instance DIA_Xardas_RITUALREQUEST(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_RITUALREQUEST_Condition;
	information = DIA_Xardas_RITUALREQUEST_Info;
	description = " Vatras sends me to you. " ;
};


func int DIA_Xardas_RITUALREQUEST_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && Npc_KnowsInfo(other,DIA_Xardas_INNOSEYEBROKEN) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RITUALREQUEST_Info()
{
	AI_Output(other,self, " DIA_Xardas_RITUALREQUEST_15_00 " );	// Vatras sends me to you.
	AI_Output(self,other, " DIA_Xardas_RITUALREQUEST_14_01 " );	// That's good. What he said?
	AI_Output(other,self, " DIA_Xardas_RITUALREQUEST_15_02 " );	// He was saying something about a reverse ritual in the Sun Circle.
	AI_Output(self,other, " DIA_Xardas_RITUALREQUEST_14_03 " );	// (laughs) That old hellhound. I think I know what he's up to. You came to get me to him.
	AI_Output(other,self, " DIA_Xardas_RITUALREQUEST_15_04 " );	// It looks like this. When are you leaving for the trip?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Xardas_RITUALREQUEST_14_05 " );	// I can't keep Vatras waiting. I'll be on my way immediately. Do what you must and then rejoin me.
		AI_StopProcessInfos(self);
		B_LogEntry( TOPIC_INNOSEYE , " Xardas agreed to participate in the Sun Circle Ritual. " );
		B_GivePlayerXP(XP_Ambient);
		Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_RITUALREQUEST_14_06 " );	// I'll only participate in the ritual when I'm sure you're fully ready to fight the dragons.
		AI_Output(self,other, " DIA_Xardas_RITUALREQUEST_14_07 " );	// And not just for your pretty eyes.
		B_LogEntry( TOPIC_INNOSEYE , " Xardas will not participate in the ritual until I am able to face the dragons. " );
	};
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Xardas_WHYNOTNOW (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_WHYNOTNOW_Condition;
	information = DIA_Xardas_WHYNOTNOW_Info;
	description = " Why don't you go to the meeting with Vatras right away? " ;
};


func int DIA_Xardas_WHYNOTNOW_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Xardas_GoesToRitualInnosEye == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_SEK) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WHYNOTNOW_Info()
{
	AI_Output(other,self, " DIA_Xardas_WARUMNICHTJETTZT_15_00 " );	// Why don't you go to the meeting with Vatras right away?
	AI_Output(other,self, " DIA_Xardas_WARUMNICHTJETTZT_15_01 " );	// Sometimes I just don't understand you.
	AI_Output(self,other, " DIA_Xardas_WARUMNICHTJETTZT_14_02 " );	// (angry) Don't talk to me in that tone. If it weren't for me, your worthless body would still be rotting in that temple.
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT, " Calm down! Just tell me what I have to do. " ,DIA_Xardas_WARUMNICHTJETZT_wastun);
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT, " Then at least explain to me why you are waiting. " ,DIA_Xardas_WARUMNICHTJETZT_grund);
};

func void DIA_Xardas_WHYNOTNOW_reason()
{
	AI_Output(other,self, " DIA_Xardas_WARUMNICHTJETTZT_grund_15_00 " );	// Then at least explain to me why you're waiting.
	AI_Output(self,other, " DIA_Xardas_WARUMNICHTJETTZT_grund_14_01 " );	// Ever since I left the Fire mages, I've tried to stay away from them.
	AI_Output(self,other, " DIA_Xardas_WARUMNICHTJETTZT_grund_14_02 " );	// And I have no intention of changing this unless I have absolutely no other choice.
	AI_Output(self,other, " DIA_Xardas_WARUMNICHTJETTZT_grund_14_03 " );	// So before I go to the mercy of these mages, I want to make sure we at least have a chance against the dragons.
	AI_Output(self,other, " DIA_Xardas_WARUMNICHTJETTZT_grund_14_04 " );	// You won't get very far with your poor equipment though. Come back when you are strong enough.
	AI_StopProcessInfos(self);
};

func void DIA_Xardas_WHYNOTNOW_wastun()
{
	AI_Output(other,self, " DIA_Xardas_WARUMNICHTJETTZT_wastun_15_00 " );	// Calm down! Just tell me what to do.
	AI_Output(self,other, " DIA_Xardas_WARUMNICHTJETTZT_wastun_14_01 " );	// You're still too weak to fight dragons. You don't stand a chance with this weaponry.
	AI_Output(self,other, " DIA_Xardas_WARUMNICHTJETTZT_wastun_14_02 " );	// Don't come back to me until you're completely ready. Then I will go and make my way to Vatras.
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_READY (C_Info)
{
	npc = NONE_100_Xardas;
	condition = DIA_Xardas_READY_Condition;
	information = DIA_Xardas_READY_Info;
	description = " I'm ready to fight dragons. " ;
};

func int DIA_Xardas_READY_Condition()
{
	if((Xardas_GoesToRitualInnosEye == FALSE) && Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_READY_Info()
{
	AI_Output(other,self, " DIA_Xardas_BEREIT_15_00 " );	// I'm ready to fight dragons.
	AI_Output(self,other, " DIA_Xardas_BEREIT_14_01 " );	// In that case, we can't waste any more time. I will go to the Sun Circle immediately. Do what you must. I'll meet you there.
	AI_StopProcessInfos(self);
	B_LogEntry( TOPIC_INNOSEYE , " Xardas agreed to participate in the Sun Circle Ritual. " );
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	Xardas_GoesToRitualInnosEye = TRUE;
};


instance DIA_Xardas_BINGSPANNT (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 35;
	condition = DIA_Xardas_BINGESPANNT_Condition;
	information = DIA_Xardas_BINGESPANNT_Info;
	permanent = TRUE;
	description = " Will the reverse ritual work? " ;
};


func int DIA_Xardas_BINGESPANNT_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3) && (Xardas_GoesToRitualInnosEye == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BINGESPANNT_Info()
{
	AI_Output(other,self, " DIA_Xardas_BINGESPANNT_15_00 " );	// Will the reverse ritual work?
	AI_Output(self,other, " DIA_Xardas_BINGESPANNT_14_01 " );	// I can't know for sure. It depends on exactly what Vatras wants to do.
};


instance DIA_Xardas_PYROWILL NOT (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 37;
	condition = DIA_Xardas_PYROWILLNICHT_Condition;
	information = DIA_Xardas_PYROWILLNOT_Info;
	description = " Pyrokar refuses to participate in the ritual. " ;
};


func int DIA_Xardas_PYROWILLNICHT_Condition()
{
	if((Pyrokar_DeniesInnosEyeRitual == TRUE) && Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PYROWILLNOT_Info()
{
	AI_Output(other,self, " DIA_Xardas_PYROWILLNICHT_15_00 " );	// Pyrokar refuses to participate in the ritual.
	AI_Output(other,self, " DIA_Xardas_PYROWILLNICHT_15_01 " );	// Above all, he wants proof that he can trust you.
	AI_Output(self,other, " DIA_Xardas_PYROWILLNICHT_14_02 " );	// Well, yes. Pyrocar. Very interesting.
	AI_Output(self,other, " DIA_Xardas_PYROWILLNICHT_14_03 " );	// The old man is becoming quite grumpy. But I think I have something useful for you.
	AI_Output(self,other, " DIA_Xardas_PYROWILLNICHT_14_04 " );	// When I once left the Firebender Order, I took a few things from the monastery.
	AI_Output(self,other, " DIA_Xardas_PYROWILLNICHT_14_06 " );	// I didn't want a bunch of paladins or fire mages to accidentally come and search the tower through and through and find the stuff.
	AI_Output(self,other, " DIA_Xardas_PYROWILLNICHT_14_07 " );	// So I hid them in safe places where mages would definitely never look for them.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//A kde?
	AI_Output(self,other, " DIA_Xardas_PYROWILLNICHT_14_09 " );	// Some of them are locked in a chest at Sekob's farm.
	Sekob_RoomFree = TRUE;
	AI_Output(other,self, " DIA_Xardas_PYROWILLNICHT_15_10 " );	// Do you trust that Sekoba?
	AI_Output(self,other, " DIA_Xardas_PYROWILLNICHT_14_11 " );	// Nope. But it's possible to buy it and it doesn't ask any tricky questions. Also, that chest is locked. Here's your key.
	CreateInvItems(self,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	B_GiveInvItems(self,other,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	AI_Output(self,other, " DIA_Xardas_PYROWILLNICHT_14_12 " );	// Among those things is a very old book. When Pyrokar sees it, he'll know it's from me.
	AI_Output(self,other, " DIA_Xardas_PYROWILLNICHT_14_13 " );	// It's no use to me anymore. But I'd say she could be quite good for the job.
	B_LogEntry( TOPIC_INNOSEYE , " Xardas gave me the key to the chest in Sekob's farm. The book I find inside is to be taken to Pyrokar. " );
};


instance DIA_Xardas_RitualInnosEyeRepairImportant(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information = DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important = TRUE;
};


func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info()
{
	AI_Output(self,other, " DIA_Xardas_Add_14_06 " );	// Now that Innos' eye is fixed, you must face the dragons!
	AI_Output(self,other, " DIA_Xardas_Add_14_07 " );	// All dragons serve Beliar, the Dark God.
	AI_Output(self,other, " DIA_Xardas_Add_14_08 " );	// But there must be some earthly force that controls them.
	AI_Output(self,other, " DIA_Xardas_Add_14_09 " );	// Find out what the power is.
	AI_Output(self,other, " DIA_Xardas_Add_14_10 " );	// Come back here once you figure it out.
	Info_ClearChoices(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice(DIA_Xardas_RitualInnosEyeRepairImportant,Dialog_End,DIA_Xardas_RitualInnosEyeRepairImportant_next);
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_next()
{
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Xardas,"Start");
	B_StartOtherRoutine(Vatras,"Start");
};


DIA_Xardas_WASNUN (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_WASNUN_Condition;
	information = DIA_Xardas_WASNUN_Info;
	permanent = TRUE;
	description = " Innos' eye is fixed. What next? " ;
};


func int DIA_Xardas_WASNUN_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WASNUN_Info()
{
	AI_Output(other,self, " DIA_Xardas_WASNUN_15_00 " );	// Innos' eye is fixed. What's next?
	AI_Output(self,other, " DIA_Xardas_WASNUN_14_01 " );	// Don't forget to wear it when you face the dragons.
	AI_Output(self,other, " DIA_Xardas_WASNUN_14_04 " );	// And keep in mind that you may need Uriziel to fight those creatures of darkness.
	AI_Output(self,other, " DIA_Xardas_WASNUN_14_05 " );	// The power of that sword will no doubt be of great benefit in the difficulties you will face.
	AI_Output(self,other, " DIA_Xardas_WASNUN_14_06 " );	// That's all I wanted to tell you.

	if(MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output(self,other, " DIA_Xardas_WASNUN_14_02 " );	// Don't waste time. Go to Mining Valley and kill those dragons.
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_WASNUN_14_03 " );	// Go to Pyrokar and he will explain how to use the Eye of Innos.
	};
};

instance DIA_Xardas_KAP4_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP4_EXIT_Condition;
	information = DIA_Xardas_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

DIA_Xardas_PERM4 (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 40;
	condition = DIA_Xardas_PERM4_Condition;
	information = DIA_Xardas_PERM4_Info;
	permanent = TRUE;
	description = " What's new? " ;
};

func int DIA_Xardas_PERM4_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info()
{
	AI_Output(other,self, " DIA_Xardas_PERM4_15_00 " );	// What's new?
	AI_Output(self,other, " DIA_Xardas_PERM4_14_01 " );	// The searchers haven't left yet. They won't rest until they get you.
	AI_Output(self,other, " DIA_Xardas_PERM4_14_02 " );	// Kill the dragons in Mining Valley and find out who is behind the attacks. Otherwise, their power will continue to grow.
};

instance DIA_Xardas_KAP5_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP5_EXIT_Condition;
	information = DIA_Xardas_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_KAP6_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_KAP6_EXIT_Condition;
	information = DIA_Xardas_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_XARDAS_PRETEACH (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_preteach_condition;
	information = dia_xardas_preteach_info;
	description = " Can I learn necromantic magic? " ;
};

func int dia_xardas_preteach_condition()
{
	if(hero.guild == GIL_KDM)
	{
		return TRUE;
	};
};

func void dia_xardas_preteach_info()
{
	AI_Output(other,self, " DIA_Xardas_PreTeach_15_00 " );	// Can I learn necromancy magic?
	AI_Output(self,other, " DIA_Xardas_PreTeach_05_01 " );	// Creating necromancer runes is not a problem. However, the main thing is the circles.
	AI_Output(self,other, " DIA_Xardas_PreTeach_05_02 " );	// I can teach you if you are experienced enough.
	AI_Output(self,other, " DIA_Xardas_PreTeach_05_03 " );	// It is important to be very careful - necromantic magic is the most powerful destructive magic in this world.
	AI_Output(self,other, " DIA_Xardas_PreTeach_05_04 " );	// Remember and use this knowledge wisely!
	XARDAS_TEACHRUNES = TRUE;
	XARDAS_TACHCIRCLE = TRUE ;
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ADDON_DMTTEECHER , " Xardas can teach me how to create necromancer runes and explain how to understand circles of magic. " );
};


instance DIA_XARDAS_SACTANOME (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_sactanome_condition;
	information = dia_xardas_sactanome_info;
	permanent = FALSE;
	description = " Can you teach me something else? " ;
};


func int dia_xardas_sactanome_condition()
{
	if (( hero . guild ==  GIL_KDM ) && Npc_KnowsInfo ( other , dia_xardas_preteach ))
	{
		return TRUE;
	};
};

func void dia_xardas_sactanome_info()
{
	AI_Output(other,self, " DIA_Xardas_SactaNome_01_00 " );	// Can you teach me anything else?
	AI_Output(self,other, " DIA_Xardas_SactaNome_01_01 " );	// There's still a lot to learn, but I can only teach you if you're experienced enough.
	AI_Output(self,other, " DIA_Xardas_SactaNome_01_02 " );	// You should know that some secrets of Dark magic can be extremely dangerous.
	AI_Output(other,self, " DIA_Xardas_SactaNome_01_04 " );	// What are the secrets?
	AI_Output(self,other,"DIA_Xardas_SactaNome_01_05");	//Jedno z nich je Sakta Nomen.
	AI_Output(other,self,"DIA_Xardas_SactaNome_01_06");	//Sakta Nomen?
	AI_Output(self,other, " DIA_Xardas_SactaNome_01_07 " );	// In demon language it's 'Blood Sacrifice' - that in itself already hints at the essence of this thing.
	AI_Output(other,self, " DIA_Xardas_SactaNome_01_08 " );	// Can you elaborate a bit...?
	AI_Output(self,other, " DIA_Xardas_SactaNome_01_09 " );	// Sakta Nomen allows you to use runes and scrolls of Dark magic even if you don't have enough mana.
	AI_Output(other,self,"DIA_Xardas_SactaNome_01_10");	//Ale jak?
	AI_Output(self,other, " DIA_Xardas_SactaNome_01_11 " );	// Of your own blood... (seriously)
	AI_Output(self,other, " DIA_Xardas_SactaNome_01_13 " );	// Therefore, you should only use this skill in absolutely necessary cases.
	AI_Output(other,self, " DIA_Xardas_SactaNome_01_16 " );	// Ok, I understand.
	XARDAS_TEACHSACTANOME = TRUE;
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ADDON_DMTTEECHER , " Xardas will teach me the art of Sakta Nomen, which means 'Blood Sacrifice' in the language of demons. With this ability, I can use runes and scrolls of Dark magic at the expense of my life force if my magical power is not enough to cast the spell. " );
};


instance DIA_XARDAS_TEACHSACTANOME(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 998;
	condition = dia_xardas_teachsactanome_condition;
	information = dia_xardas_teachsactanome_info;
	permanent = TRUE;
	description = " Teach me Sakta Nomen. (VB: 50, price: 50000 gold) " ;
};


func int dia_xardas_teachsactanome_condition()
{
	if ((hero.guild ==  GIL_KDM ) && ( XARDAS_TEACHSACTANOME  ==  TRUE ) && ( XARDAS_KNOWSSACTANOME  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_xardas_teachsactanome_info()
{
	AI_Output(other,self, " DIA_Xardas_TeachSactaNome_01_00 " );	// Teach me Sakta Nomen.
	AI_Output(self,other, " DIA_Xardas_TeachSactaNome_01_01 " );	// Are you sure about this?
	Info_ClearChoices(dia_xardas_teachsactanome);
	Info_AddChoice(dia_xardas_teachsactanome, " Not really. " ,dia_xardas_teachsactanome_no);
	Info_AddChoice(dia_xardas_teachsactanome,"Ano.",dia_xardas_teachsactanome_yes);
};

func void dia_xardas_teachsactanome_no()
{
	AI_Output(other,self, " DIA_Xardas_TeachSactaNome_No_01_00 " );	// Not really.
	AI_Output(self,other, " DIA_Xardas_TeachSactaNome_No_01_01 " );	// Good for saying that.
	Info_ClearChoices(dia_xardas_teachsactanome);
};

func void dia_xardas_teachsactanome_yes()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50000) && (other.lp >= 50))
	{
		AI_Print(PRINT_SACTANOME);
		Snd_Play("MFX_FEAR_CAST");
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_Output(self,other, " DIA_Xardas_TeachSactaNome_Yes_01_01 " );	// Then know the true power of the magic of Darkness and let your sacrifices not be in vain!
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other, " DIA_Xardas_TeachSactaNome_Yes_01_02 " );	// SAKTA SHADAR NOMEN TAR MADAR SATAG!
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other, " DIA_Xardas_TeachSactaNome_Yes_01_03 " );	// Use this knowledge wisely.
		other.lp = other.lp - 50;
		RankPoints = RankPoints + 50;
		Npc_RemoveInvItems(other,ItMi_Gold,50000);
		XARDAS_KNOWSSACTANOME = TRUE;
		Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
		B_LogEntry( TOPIC_ADDON_DMTTEECHER , " I have learned the art of Sakta Nomen. " );
		Info_ClearChoices(dia_xardas_teachsactanome);
		Info_ClearChoices(dia_xardas_teachsactanome);
	}
	else if(other.lp < 50)
	{
		AI_Output(self,other, " DIA_Xardas_TeachSactaNome_01_05 " );	// You're not experienced enough, we'll talk later.
		Info_ClearChoices(dia_xardas_teachsactanome);
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_TeachSactaNome_01_08 " );	// You don't have enough gold! We will talk later.
		Info_ClearChoices(dia_xardas_teachsactanome);
	};
};


instance DIA_XARDAS_EXPLAINCIRCLES(C_Info)
{
	npc = NONE_100_Xardas;
	condition = dia_xardas_explaincircles_condition;
	information = dia_xardas_explaincircles_info;
	permanent = FALSE;
	description = " Can you explain to me the meaning of magic circles? " ;
};


func int dia_xardas_explaincircles_condition()
{
	if (( hero . guild ==  GIL_KDM ) && Npc_KnowsInfo ( other , dia_xardas_preteach ))
	{
		return TRUE;
	};
};

func void dia_xardas_explaincircles_info()
{
	AI_Output(other,self, " DIA_Xardas_EXPLAINCIRCLES_Info_15_01 " );	// Can you explain the meaning of magic circles?
	AI_Output(self,other, " DIA_Xardas_EXPLAINCIRCLES_Info_14_02 " );	// Circles symbolize your understanding of magic.
	AI_Output(self,other, " DIA_Xardas_EXPLAINCIRCLES_Info_14_03 " );	// A higher circle means more spells you can use.
	AI_Output(self,other, " DIA_Xardas_EXPLAINCIRCLES_Info_14_04 " );	// You have to go through each previous circle so I can teach you the next one.
	AI_Output(self,other, " DIA_Xardas_EXPLAINCIRCLES_Info_14_05 " );	// You will have to endure long hours of training before I initiate you into all the circles.
	AI_Output(self,other, " DIA_Xardas_EXPLAINCIRCLES_Info_14_06 " );	// Each time you achieve new spells to show your skill.
	AI_Output(self,other, " DIA_Xardas_EXPLAINCIRCLES_Info_14_07 " );	// They will be a part of your life.
	AI_Output(self,other, " DIA_Xardas_EXPLAINCIRCLES_Info_14_08 " );	// You will understand yourself and at the same time discover the immense power of the magic of Darkness.
	EXPLAINCIRCLEMEAN = TRUE;
};


instance DIA_XARDAS_RUNEN (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_runen_condition;
	information = dia_xardas_runes_info;
	permanent = TRUE;
	description = " Teach me how to create runes. " ;
};


func int dia_xardas_runen_condition()
{
	if(XARDAS_TEACHRUNES == TRUE)
	{
		return TRUE;
	};
};

func void dia_xardas_runes_info()
{
	AI_Output(other,self, " DIA_Parlan_TEACH_15_00 " );	// Teach me how to create runes.
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runes,Dialog_Back,dia_xardas_runes_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_DEMONOLOG) == 1) && (PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE))
	{
		Info_AddChoice(dia_xardas_runen, " Démonologické runy " ,dia_xardas_runen_dem);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_xardas_runes, " 6. kruh magic " ,dia_xardas_runes_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_xardas_runes, " 5. kruh magic " ,dia_xardas_runes_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_xardas_runes, " 4. kruh magic " ,dia_xardas_runes_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_xardas_runes, " 3. kruh magic " ,dia_xardas_runes_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_xardas_runes, " 2. kruh magic " ,dia_xardas_runes_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_xardas_runes, " 1. kruh magic " ,dia_xardas_runes_1);
	};
};

func void dia_xardas_runes_back()
{
	Info_ClearChoices(dia_xardas_runen);
};

func void dia_xardas_runen_dem()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runes,Dialog_Back,dia_xardas_runes_back);
	if((PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE) && (XARDASTEACHCASTDEMON == TRUE))
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),dia_xardas_runen_circle_4_spl_summondemon);
	};
};

func void dia_xardas_runen_1()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runes,Dialog_Back,dia_xardas_runes_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathbolt] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Deathbolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathbolt)),dia_xardas_runen_circle_1_spl_deathbolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),dia_xardas_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Rage] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Rage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Rage)),dia_xardas_runen_circle_1_spl_Rage);
	};
};

func void dia_xardas_runen_2()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runes,Dialog_Back,dia_xardas_runes_back);

	if(PLAYER_TALENT_RUNES[SPL_ManaForLife] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_ManaForLife,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ManaForLife)),dia_xardas_runen_circle_2_spl_suckenergy);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonZombie] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_SummonZombie,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonZombie)),dia_xardas_runen_circle_2_spl_summonzombie);
	};
	if(PLAYER_TALENT_RUNES[SPL_Lacerate] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Lacerate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Lacerate)),dia_xardas_runen_circle_2_spl_Lacerate);
	};
};

func void dia_xardas_runen_3()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runes,Dialog_Back,dia_xardas_runes_back);

	if(PLAYER_TALENT_RUNES[SPL_Swarm] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Swarm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Swarm)),dia_xardas_runen_circle_3_spl_swarm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),dia_xardas_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Energyball] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_BeliarsRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Energyball)),dia_xardas_runen_circle_3_spl_energyball);
	};
};

func void dia_xardas_runen_4()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runes,Dialog_Back,dia_xardas_runes_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathball] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Deathball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathball)),dia_xardas_runen_circle_4_spl_deathball);
	};
};

func void dia_xardas_runen_5()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runes,Dialog_Back,dia_xardas_runes_back);

	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),dia_xardas_runen_circle_5_spl_armyofdarkness);
	};
};

func void dia_xardas_runen_6()
{
	Info_ClearChoices(dia_xardas_runen);
	Info_AddChoice(dia_xardas_runes,Dialog_Back,dia_xardas_runes_back);

	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes("Černá mlha",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),dia_xardas_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Skull] == FALSE)
	{
		Info_AddChoice(dia_xardas_runen,b_buildlearnstringforrunes(NAME_SPL_Skull,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Skull)),dia_xardas_runen_circle_6_spl_skull);
	};
};

func void dia_xardas_runen_circle_1_spl_Rage()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Rage);
};

func void dia_xardas_runen_circle_2_spl_Lacerate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Lacerate);
};

func void dia_xardas_runen_circle_1_spl_deathbolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathbolt);
};

func void dia_xardas_runen_circle_1_spl_summongoblinskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void dia_xardas_runen_circle_2_spl_suckenergy()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ManaForLife);
};

func void dia_xardas_runen_circle_2_spl_summonzombie()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonZombie);
};

func void dia_xardas_runen_circle_3_spl_swarm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Swarm);
};

func void dia_xardas_runen_circle_3_spl_summonskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void dia_xardas_runen_circle_3_spl_energyball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Energyball);
};

func void dia_xardas_runen_circle_4_spl_summondemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void dia_xardas_runen_circle_4_spl_deathball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathball);
};

func void dia_xardas_runen_circle_5_spl_armyofdarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void dia_xardas_runen_circle_6_spl_massdeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void dia_xardas_runen_circle_6_spl_skull()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Skull);
};


var int dia_xardas_trade_onetime;

instances of DIA_XARDAS_CANTRADE (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_cantrade_condition;
	information = dia_xardas_cantrade_info;
	permanent = FALSE;
	description = " Do you know where I can get scrolls with Dark magic spells? " ;
};


func int dia_xardas_cantrade_condition()
{
	if((XARDAS_TEACHRUNES == TRUE) && (DIA_XARDAS_TRADE_ONETIME == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_cantrade_info()
{
	DIA_XARDAS_TRADE_ONETIME = TRUE;
	AI_Output(other,self, " DIA_Xardas_CanTrade_01_01 " );	// Don't you know where I can get scrolls with Dark magic spells?
	AI_Output(self,other, " DIA_Xardas_CanTrade_01_02 " );	// Good question. Scrolls are essential for creating runes.
	AI_Output(self,other, " DIA_Xardas_CanTrade_01_03 " );	// You might find some at magic merchants.
	AI_Output(self,other, " DIA_Xardas_CanTrade_01_04 " );	// You can also get rare scrolls with dark spells from me.
};


instance DIA_XARDAS_TRADE (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_trade_condition;
	information = dia_xardas_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = " Show me your magic scrolls. " ;
};


func int dia_xardas_trade_condition()
{
	if((XARDAS_TEACHRUNES == TRUE) && (DIA_XARDAS_TRADE_ONETIME == TRUE))
	{
		return TRUE;
	};
	if((CHOOSEDARK == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_xardas_trade_info()
{
	AI_Output(other,self, " DIA_Xardas_Trade_01_01 " );	// Show me your magic scrolls.
	B_GiveTradeInv(self);
};


instance DIA_XARDAS_CIRCLE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = dia_xardas_circle_condition;
	information = dia_xardas_circle_info;
	permanent = TRUE;
	description = " I want to understand the essence of magic. " ;
};

func int dia_xardas_circle_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 6) && (XARDAS_TEACHCIRCLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_circle_info()
{
	AI_Output(other,self, " DIA_Xardas_CIRCLE_15_00 " );	// I want to understand the essence of magic.
	Info_ClearChoices(DIA_Xardas_CIRCLE);
	Info_AddChoice(DIA_Xardas_CIRCLE,Dialog_Back,DIA_Xardas_CIRCLE_Back);

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 1) && (CanLearnMagicCircleNext_ABCZ(1) == TRUE))
	{
		Info_AddChoice(DIA_Xardas_CIRCLE,"1. kruh magie (VB: 20)",DIA_Xardas_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (CanLearnMagicCircleNext_ABCZ(2) == TRUE))
	{
		Info_AddChoice(DIA_Xardas_CIRCLE,"2. kruh magie (VB: 30)",DIA_Xardas_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (CanLearnMagicCircleNext_ABCZ(3) == TRUE))
	{
		Info_AddChoice(DIA_Xardas_CIRCLE,"3. kruh magie (VB: 40)",DIA_Xardas_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (CanLearnMagicCircleNext_ABCZ(4) == TRUE))
	{
		Info_AddChoice(DIA_Xardas_CIRCLE,"4. kruh magie (VB: 60)",DIA_Xardas_CIRCLE_4);
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_31 " );	// We don't have time! Come back later.
	};
};

func void DIA_Xardas_CIRCLE_Back()
{
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

func void DIA_Xardas_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_01 " );	// When you enter the first circle, you learn to use your first runes.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_02 " );	// Each rune contains the structure of a special spell.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_03 " );	// To use a rune, simply release your magical power - mana.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_04 " );	// And unlike scrolls, the rune is eternal.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_05 " );	// Each rune has a certain magical power in it.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_06 " );	// As with the scroll, the moment you use a rune, you use up some of your own magical power.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_07 " );	// With each new circle you learn more about the runes.
	};
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

func void DIA_Xardas_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_09 " );	// You've already learned how to understand runes. It's time to deepen your knowledge.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_10 " );	// When you enter the second circle, you will understand the basics of stronger spells.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_11 " );	// But to know the true secret of magic, you still have to learn a lot.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_12 " );	// As you know, you can use a rune repeatedly before you run out of magic power. After filling it, you can start again. The rune never runs out.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_13 " );	// But before you do anything, think about it. You can cause irreversible damage.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_14");	//Pravý mág je používá jen tehdy, když je to nutné.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_15");	//Nauč se posoudit situaci a poznáš pravou sílu run.
	};
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

func void DIA_Xardas_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_16");	//Třetí kruh je hlavní etapa v životě mága. Přestáváš býti hledačem a našel jsi podstatu kouzel.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_17");	//Už umíš použít mocné runy a překročil jsi polovinu své cesty.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_18");	//Tyto znalosti jsou základem magie. Užívej jich moudře.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_19");	//Můžeš je použít nebo taky nemusíš. Co musíš je se rozhodnout.
		AI_Output(self,other,"DIA_Xardas_CIRCLE_14_20");	//Jakmile se rozhodneš, použij sílu bez váhání.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_21 " );	// Find a path and decide whether to follow it to the next circle.
	};
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

func void DIA_Xardas_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_22 " );	// After crossing the third circle, nothing stops you from revealing true magic.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_23 " );	// The base of the spell is not the same, but a rune made of special rune stones.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_24 " );	// This is the same ore mined in the mines. In the temples it is endowed with magical incantations and in the same place the runes are transformed into instruments of our power.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_25 " );	// The knowledge of their production is guarded in the temples of Innose, Adana or Beliar.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_27 " );	// Once you learn the spell, the secret of power will be revealed to you.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_28 " );	// And what's more - those who managed to enter the fourth circle of magic will be given the honor of receiving the heavy robes of the Dark Mages among the necromancers.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_29 " );	// You are now one of the Dark God's elite.
		AI_Output(self,other, " DIA_Xardas_CIRCLE_14_30 " );	// Here, accept this robe, proving your magical art.
		CreateInvItems(other,ItMW_Addon_Stab03,1);
		CreateInvItems(self,itar_dmt_h,1);
		B_GiveInvItems(self,other,itar_dmt_h,1);
		NEKR_H_ROBA = TRUE ;
	};
	Info_ClearChoices(DIA_Xardas_CIRCLE);
};

DIA_XARDAS_PRETEACH_MANA (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_preteach_mana_condition;
	information = dia_xardas_preteach_mana_info;
	permanent = FALSE;
	description = " Can you help me improve my magic power? " ;
};

func int dia_xardas_preteach_mana_condition()
{
	if ((other.guild ==  GIL_KDM ) && Npc_KnowsInfo(other,dia_xardas_preteach))
	{
		return TRUE;
	};
};

func void dia_xardas_preteach_mana_info()
{
	AI_Output(other,self, " DIA_Xardas_PreTeach_Mana_15_00 " );	// Can you help me improve my magic power?
	AI_Output(self,other, " DIA_Xardas_PreTeach_Mana_05_01 " );	// Of course, but you also have to learn to control it.
	AI_Output(self,other, " DIA_Xardas_PreTeach_Mana_05_03 " );	// Magic energy - mana, means power for every mage.
	AI_Output(self,other, " DIA_Xardas_PreTeach_Mana_05_04 " );	// We use it to create magic runes and use them, but it is not unlimited.
	AI_Output(self,other, " DIA_Xardas_PreTeach_Mana_05_05 " );	// In addition to increasing it, you should also learn to use it wisely and be able to limit it.
	AI_Output(self,other, " DIA_Xardas_PreTeach_Mana_05_06 " );	// Only then can you become a great mage.
	XARDAS_TEACHMANA = TRUE;
};

DIA_XARDAS_TEACH_MANA (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 10;
	condition = dia_xardas_teach_mana_condition;
	information = dia_xardas_teach_mana_info;
	permanent = TRUE;
	description = " I want to increase my magic power. " ;
};

func int dia_xardas_teach_mana_condition()
{
	if((other.guild == GIL_KDM) && (XARDAS_TEACHMANA == TRUE) && ((other.attribute[ATR_MANA_MAX] < T_MEGA) || (VATRAS_TEACHREGENMANA == FALSE))) 
	{
		return TRUE;
	};
};

func void dia_xardas_teach_mana_info()
{
	AI_Output(other,self, " DIA_Xardas_TEACH_MANA_15_00 " );	// I want to increase my magic power.
	AI_Output(self,other, " DIA_Xardas_TEACH_MANA_15_01 " );	// I can help you with that.
	Info_ClearChoices(dia_xardas_teach_mana);
	Info_AddChoice(dia_xardas_teach_mana,Dialog_Back,dia_xardas_teach_mana_back);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_xardas_teach_mana_1);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_xardas_teach_mana_5);

	if ((Chapter >=  2 ) && ( BACK_TEACREGEN  ==  FALSE ))
	{
		Info_AddChoice(DIA_Xardas_TEACH_MANA, " Mana Regen (VB: 15) " ,DIA_Xardas_TEACH_MANA_Regen);
	};
};

func void dia_xardas_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other, " DIA_Xardas_TEACH_MANA_05_00 " );	// I can't help you anymore.
		AI_Output(self,other, " DIA_Xardas_TEACH_MANA_05_01 " );	// You've reached the limit of what I can teach you.
	};

	Info_ClearChoices(dia_xardas_teach_mana);
};

func void DIA_Xardas_TEACH_MANA_Rain()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_05 " );	// Teach me how to regenerate mana.

	cost = 15 ;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	}
	else
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		AI_Print( " Learned: Mana Regeneration " );
		VATRAS_TEACHREGENMANA = TRUE ;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_xardas_teach_mana);
	Info_AddChoice(dia_xardas_teach_mana,Dialog_Back,dia_xardas_teach_mana_back);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_xardas_teach_mana_1);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_xardas_teach_mana_5);
};

func void dia_xardas_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_xardas_teach_mana);
	Info_AddChoice(dia_xardas_teach_mana,Dialog_Back,dia_xardas_teach_mana_back);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_xardas_teach_mana_1);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_xardas_teach_mana_5);

	if ((Chapter >=  2 ) && (hero.guild ==  GIL_KDM ) && ( BACK_TEACHREGENMANA  ==  FALSE ))
	{
		Info_AddChoice(DIA_Xardas_TEACH_MANA, " Mana Regen (VB: 15) " ,DIA_Xardas_TEACH_MANA_Regen);
	};
};

func void dia_xardas_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_xardas_teach_mana);
	Info_AddChoice(dia_xardas_teach_mana,Dialog_Back,dia_xardas_teach_mana_back);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_xardas_teach_mana_1);
	Info_AddChoice(dia_xardas_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_xardas_teach_mana_5);

	if ((Chapter >=  2 ) && (hero.guild ==  GIL_KDM ) && ( BACK_TEACHREGENMANA  ==  FALSE ))
	{
		Info_AddChoice(DIA_Xardas_TEACH_MANA, " Mana Regen (VB: 15) " ,DIA_Xardas_TEACH_MANA_Regen);
	};
};


instance DIA_XARDAS_TELLABOUTKREOL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_tellaboutkreol_condition;
	information = dia_xardas_tellaboutkreol_info;
	permanent = FALSE;
	description = " Do you know the language of demons? " ;
};


func int dia_xardas_tellaboutkreol_condition()
{
	if(Npc_KnowsInfo(other,dmt_1214_tegon_hello))
	{
		return TRUE;
	};
};

func void dia_xardas_tellaboutkreol_info()
{
	AI_Output(other,self, " DIA_Xardas_TellAboutKreol_01_00 " );	// Do you know the language of demons?
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_01 " );	// What?! How did you know I could control him? (surprised)
	AI_Output(other,self, " DIA_Xardas_TellAboutKreol_01_02 " );	// Ranger Tegon told me...
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_03 " );	// ... (interrupts) You don't have to go on, I understand now...
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_04 " );	// I assume you have to learn it to pass Tegon's exam.
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_05 " );	// I have some records on the pulpits in my tower.
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_06 " );	// Maybe I could teach you how to read them...
	AI_Output(other,self, " DIA_Xardas_TellAboutKreol_01_07 " );	// That's what I wanted to ask you.
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_08 " );	// But I'm very afraid that won't be possible.
	AI_Output(other,self, " DIA_Xardas_TellAboutKreol_01_11 " );	// Guardian Tegon told me you'd help me!
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_12 " );	// Actually, he wasn't sure I'd be able to teach him.
	AI_Output(other,self, " DIA_Xardas_TellAboutKreol_01_15 " );	// And do you know someone else?
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_18 " );	// It's called Creol. He's a very powerful necromancer, and even the Guardians couldn't get him to help them expand their knowledge of demonic languages.
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_19 " );	// Creol is a follower of the Dark God and has ambitions to become one of Beliar's elite.
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_22 " );	// You have to impress him though.
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_23 " );	// I don't know how exactly, but come up with something.
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_24 " );	// Creole is very strict and if you drop your good manners in his presence it could be the end of you.
	AI_Output(other,self, " DIA_Xardas_TellAboutKreol_01_25 " );	// Where can I find this Creole?
	AI_Output(self,other, " DIA_Xardas_TellAboutKreol_01_26 " );	// Last I heard about him, he was in Mining Valley, so you should start there.
	XARDASTELLABOUTKREOL = TRUE;
	Log_CreateTopic(TOPIC_FINDKREOL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FINDKREOL,LOG_Running);
	MIS_FINDKREOL = LOG_Running;
	B_LogEntry( TOPIC_FINDKREOL , " Xardas told me about someone who could teach me the language of demons. He's a necromancer and his name is Creol. He was last seen in Mining Valley, but in order for him to teach me, I have to impress him. He even turned down the Guardians. " );
	Log_AddEntry( TOPIC_FINDKREOL , " Xardas warned me that Creol is very conceited and if I drop my good manners in his presence I might provoke him, so I must behave respectfully. " );
};


instance DIA_XARDAS_TELLABOUTRESURECT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_tellaboutresurect_condition;
	information = dia_xardas_tellaboutresurect_info;
	permanent = TRUE;
	description = " I have one question. " ;
};

func int dia_xardas_tellaboutresurect_condition()
{
	if (( MIS_VIPERNUGGETS  == LOG_Running) && (Npc_HasItems(other,itat_skeletonbonealef) >=  1 ) && (AlefRitualTell ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_xardas_tellaboutresurect_info()
{
	AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_00 " );	// I have one question.

	if(Wld_IsTime(9,0,21,0) == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_TellAboutResurect_01_01");	//Tak se ptej.
		AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_02 " );	// Hmmm... Xardas, you're a necromancer, so you should be able to summon the dead.
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_03 " );	// Naturally, like any good necromancer. Why do you care?
		AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_04 " );	// Well, I have one problem with one person that I need to get information from.
		AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_05 " );	// The problem is that this person is currently gone. She's actually dead.
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_07 " );	// And what does it have to do with me?
		AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_08 " );	// Can you bring him back to life so I can talk to him?
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_09 " );	// Restore life? No one can do that, not even a necromancer.
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_11 " );	// Well, I could make him my minion - a zombie. But I'm not sure if he'll tell you anything else after that.
		AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_12 " );	// I'm afraid he'll become nothing as a zombie... Besides, there's no flesh left in his body and only a few bones.
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_13 " );	// Just a few bones you say... (thinks) Well, that would be something...
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_17 " );	// There is one ritual - summoning the soul of the deceased. But he is very dangerous.
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_18 " );	// If it's necessary for you...
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_20 " );	// Hmmm... Okay, fine, but I need something to perform the ritual.
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_21");	//Co?
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_22 " );	// We need something that has a soul attached to it. For example, a skeleton.
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_23 " );	// But don't drag the whole skeleton here, just a bone is enough.
		AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_25 " );	// No problem, I have one here!
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_26 " );	// YES? Really?! Show her to me!
		AI_Output(other,self,"DIA_Xardas_TellAboutResurect_01_27");	//Tady.
		B_GiveInvItems(other,self,itat_skeletonbonealef,1);
		AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_29 " );	// Can we start the ritual now?
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_30 " );	// Sure, but I must warn you that the ritual can have unpleasant side effects.
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_32 " );	// First, you can only talk to the soul for a limited time, then the spell runs out...
		AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_33 " );	// What if he refuses to talk or won't answer questions?
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_34 " );	// We can't know, so we'll have to ask carefully...
		AI_Output(other,self, " DIA_Xardas_TellAboutResurect_01_35 " );	// What next?
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_36 " );	// No good... The soul will not be happy that we are disturbing it and will try to take revenge on us.
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_46 " );	// Be sure to think it through.
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_47 " );	// So what do you say?
		AlefRitualTell = TRUE;
		B_LogEntry( TOPIC_VIPERNUGGETS , " As I discovered, it's not so bad after all. I manage to talk to Aleph - or rather, his soul. Xardas promised to help me with this. He can perform a ritual that will materialize Aleph's soul in our world. Xardas he told me it would be very dangerous. I can talk to the soul for a while, but then it loses control and the soul will probably try to kill me. " );
		Info_ClearChoices(dia_xardas_tellaboutresurect);
		Info_AddChoice(dia_xardas_tellaboutresurect, " No, wait a minute! " ,dia_xardas_tellaboutresurect_answer1);
		Info_AddChoice(dia_xardas_tellaboutresurect, " Let's begin. " ,dia_xardas_tellaboutresurect_answer2);
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_TellAboutResurect_01_99 " );	// That will wait until tomorrow! Now I'm tired and want to rest...
		AI_StopProcessInfos(self);
	};
};

func void dia_xardas_tellaboutresurect_answer1()
{
	AI_Output(other,self, " DIA_Xardas_TellAboutResurect_Answer1_01_00 " );	// No, wait a minute!
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer1_01_01");	//Dobře.
	Info_ClearChoices(dia_xardas_tellaboutresurect);
};

func void dia_xardas_tellaboutresurect_answer2()
{
	AI_Output(self,other, " DIA_Xardas_TellAboutResurect_Answer2_01_0A " );	// Then we mustn't waste time.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"NW_XARDAS_ALEFCAST");
	AI_AlignToWP(self);
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other, " DIA_Xardas_TellAboutResurect_Answer2_01_00 " );	// In the name of the Dark God I call you...
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other, " DIA_Xardas_TellAboutResurect_Answer2_01_01 " );	// The light recedes...! It will be dark!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other, " DIA_Xardas_TellAboutResurect_Answer2_01_02 " );	// Show his soul the way here to us...!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC3");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other, " DIA_Xardas_TellAboutResurect_Answer2_01_03 " );	// SHAKAN TAR MADAR! Come to my call...!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC2");
	AI_TurnToNPC(self,other);
	Info_ClearChoices(dia_xardas_tellaboutresurect);
	Info_AddChoice(dia_xardas_tellaboutresurect,"...",dia_xardas_tellaboutresurect_answer3);
};

func void dia_xardas_tellaboutresurect_answer3()
{
	Snd_Play("MFX_FEAR_CAST");
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DIA_Xardas_TellAboutResurect_Answer3_01_00 " );	// That's all. The soul is here.
	AI_Output(self,other, " DIA_Xardas_TellAboutResurect_Answer3_01_01 " );	// Talk to her, but don't waste time.
	Wld_InsertNpc(alef_soul,"NW_XARDAS_SOUL");
	ALEFRESURECTRITUAL = TRUE;
	Info_ClearChoices(dia_xardas_tellaboutresurect);
	Info_AddChoice(dia_xardas_tellaboutresurect,"Dobře.",dia_xardas_tellaboutresurect_answer5);
};

func void dia_xardas_tellaboutresurect_answer5()
{
	AI_Output(other,self,"DIA_Xardas_TellAboutResurect_Answer5_01_00");	//Dobře.
	AI_Output(self,other, " DIA_Xardas_TellAboutResurect_Answer5_01_01 " );	// (weakly) Hurry up...
	AI_Output(other,self,"DIA_Xardas_TellAboutResurect_Answer5_01_02");	//Co je s tebou?
	AI_Output(self,other,"DIA_Xardas_TellAboutResurect_Answer5_01_03");	//Já... ne...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DRAINED");
};


instance DIA_XARDAS_RESURECTALEF (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_resurectalef_condition;
	information = dia_xardas_resurectalef_info;
	permanent = TRUE;
	description = " I am ready for the ritual. " ;
};

func int dia_xardas_resurectalef_condition()
{
	if((AlefRitualTell == TRUE) && (ALEFRESURECTRITUAL == FALSE) && (MIS_VIPERNUGGETS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_xardas_resurectalef_info()
{
	AI_Output(other,self, " DIA_Xardas_ResurectAlef_01_00 " );	// I'm ready for the ritual.

	if(Wld_IsTime(9,0,21,0) == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_ResurectAlef_01_01");	//Ano?
		AI_Output(other,self, " DIA_Xardas_ResurectAlef_01_02 " );	// Summon his soul. I'm ready.
		AI_Output(self,other, " DIA_Xardas_ResurectAlef_01_03 " );	// Are you sure about this?
		Info_ClearChoices(dia_xardas_tellaboutresurect);
		Info_AddChoice(dia_xardas_resurectalef, " No, I changed my mind. " ,dia_xardas_resurectalef_answer1);
		Info_AddChoice(dia_xardas_resurectalef, " Yes ! " ,dia_xardas_resurectalef_answer2);
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_ResurectAlef_01_99 " );	// We'll talk about it tomorrow. Now let me rest...
		AI_StopProcessInfos(self);
	};
};

func void dia_xardas_resurectalef_answer1()
{
	AI_Output(other,self,"DIA_Xardas_ResurectAlef_Answer1_01_00");	//Ano!
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer1_01_01");	//To je dobře.
	Info_ClearChoices(dia_xardas_resurectalef);
};

func void dia_xardas_resurectalef_answer2()
{
	AI_Output(self,other, " DIA_Xardas_ResurectAlef_Answer2_01_0A " );	// Then we mustn't waste time.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"NW_XARDAS_ALEFCAST");
	AI_AlignToWP(self);
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other, " DIA_Xardas_ResurectAlef_Answer2_01_00 " );	// In the name of the Dark God I call you...
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other, " DIA_Xardas_ResurectAlef_Answer2_01_01 " );	// The light recedes...! It will be dark!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other, " DIA_Xardas_ResurectAlef_Answer2_01_02 " );	// Show his soul the way here to us...!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC3");
	AI_UseMob(self,"BOOK",1);
	AI_Output(self,other, " DIA_Xardas_ResurectAlef_Answer2_01_03 " );	// SHAKAN TAR MADAR! Come to my call...!
	AI_UseMob(self,"BOOK",-1);
	AI_PlayAni(self,"T_PRACTICEMAGIC2");
	AI_UseMob(self,"BOOK",-1);
	AI_TurnToNPC(self,other);
	Info_ClearChoices(dia_xardas_resurectalef);
	Info_AddChoice(dia_xardas_resurectalef, " ... " ,dia_xardas_resurectalef_answer3);
};

func void dia_xardas_resurectalef_answer3()
{
	Snd_Play("MFX_FEAR_CAST");
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DIA_Xardas_ResurectAlef_Answer3_01_00 " );	// That's all. The soul is here.
	AI_Output(self,other, " DIA_Xardas_ResurectAlef_Answer3_01_01 " );	// Talk to her, but don't waste time.
	Wld_InsertNpc(alef_soul,"NW_XARDAS_SOUL");
	ALEFRESURECTRITUAL = TRUE;
	Info_ClearChoices(dia_xardas_resurectalef);
	Info_AddChoice(dia_xardas_resurectalef, " Good. " , dia_xardas_resurectalef_answer4);
};

func void dia_xardas_resurectalef_answer4()
{
	AI_Output(other,self,"DIA_Xardas_ResurectAlef_Answer4_01_00");	//Dobře.
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer4_01_01");	//Pospěš si...
	AI_Output(other,self,"DIA_Xardas_ResurectAlef_Answer4_01_02");	//Co je s tebou?
	AI_Output(self,other,"DIA_Xardas_ResurectAlef_Answer4_01_03");	//Já... ne...
	Npc_ExchangeRoutine(self,"DRAINED");
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_FINDDARKSOUL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_finddarksoul_condition;
	information = dia_xardas_finddarksoul_info;
	permanent = FALSE;
	description = " Is Mora Ulart saying something to you? " ;
};


func int dia_xardas_finddarksoul_condition()
{
	if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_finddarksoul_info()
{
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_00 " );	// Is Mora Ulart telling you something?
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_01 " );	// Hmmm... Your questions never cease to amaze me. How did you hear that?
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_02 " );	// It's not important, can you tell me something about the spell?
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_03 " );	// I don't know much, but I'll try to explain everything important to you.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_05 " );	// As I know Mora Ulartu is a very powerful spell also called as 'Maze of Souls'.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_06 " );	// Came into this world along with humans.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_07 " );	// It is not known exactly how this spell entered this world, but it seems that Beliar himself is responsible.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_08 " );	// I don't think I need to explain what the spell is for, the name says it all.
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_09 " );	// Tell me how I can get Mora Ularta?
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_10 " );	// What will it do for you? (surprised)
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_14 " );	// I need to capture the soul of one demon.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_15 " );	// Ah! And how long have you been hunting demons?! Listen, this is a very risky job.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_17 " );	// Well, if you want to hunt them, that's really up to you...
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_18 " );	// But I'm afraid it will be a bit complicated since I don't have the magic.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_19 " );	// I could tell you where to look though.
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_20 " );	// I have a feeling it won't be that easy!
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_23 " );	// It is a gift for those whose knowledge is so great that they could balance the spell. Only Beliar can give it to you in exchange for something he wants.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_24 " );	// And I don't think you're worthy of getting her.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_25 " );	// First and foremost, you are a Fire Mage - a servant of Innos!
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_26 " );	// I'm afraid you don't stand a chance!... (skeptically)
		CHANCEGETDARKSOUL = 1;
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_27 " );	// First and foremost, you're a paladin of Innos!
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_28 " );	// Your chances are very slim!... (skeptically)
		CHANCEGETDARKSOUL = 5;
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_29 " );	// Besides, you are a Water Mage, a servant of Adana!
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_30 " );	// There is no murderous hatred between him and Beliar, but I wouldn't count on it.
		CHANCEGETDARKSOUL = 25;
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_31 " );	// Although on the other hand you are a dark mage... (thoughtfully)
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_32 " );	// I think you have a chance!
		CHANCEGETDARKSOUL = 50;
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_33 " );	// Although on the other hand you are not subject to any of the gods!
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_34 " );	// So you have some chance... (thoughtfully)
		CHANCEGETDARKSOUL = 75;
	};
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_35 " );	// In any case, this will be expensive.
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_36 " );	// Okay. What do I have to do to get Beliar to give me Mora Ularta?
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_37 " );	// To begin with, it is necessary to bring him something he wants.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_40 " );	// Probably your soul, but that's an unfavorable option.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_42 " );	// Hmmm... I think there's one more thing.
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_43 " );	// Which one?
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_46 " );	// Well... There is one very powerful artifact - the Triramar Amulet.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_47 " );	// I don't know who made it, but I assume it was Beliar himself.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_48 " );	// How else to explain that it was kept in the Dark God's temple the whole time.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_49 " );	// But the situation changed somewhat when the paladins destroyed this temple half a century ago.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_52 " );	// Found the artifact but couldn't destroy it. That's why they hid him.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_53 " );	// The power of Innos helped them withstand the wrath of Beliar.
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_54 " );	// What's so special about it?
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_55 " );	// It contains one of the four essences of the Dark God. For those who served him, this artifact was the source of their power.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_57 " );	// To the Dark God, it's part of himself.
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_58 " );	// Are you telling me that if I bring this amulet back to Beliar, then he will give me...
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_59 " );	// (interrupts) ... Like I said, that's the only way to get Beliar's attention. But Beliar is cunning and cunning!
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_61 " );	// Even if you return Triramar to him, there's no guarantee that he'll give you Ularta.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_63 " );	// Besides, you can imagine what would happen if the paladins found out.
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_65 " );	// Where are the paladins guarding him?
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_66 " );	// I assume they hid him somewhere on the island. But it is very unlikely that you will come across him in the city or in the monastery.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_68 " );	// Most likely, this place is reliably hidden from prying eyes and is almost impossible to get there.
	if(Npc_KnowsInfo(other,dia_pal_199_ritter_firstwarn) || Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_69 " );	// Could he be in Azgan Royal Keep?
		AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_70 " );	// I don't think so, there are too many people there.
	};
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_74 " );	// And how do you know about all this?
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_75 " );	// I was one of the higher Fire mages - such things never pass without their knowledge.
	AI_Output(other,self, " DIA_Xardas_FindDarkSoul_01_76 " );	// What should I do when I find the amulet?
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_77 " );	// Pray to Beliar and place the amulet on the altar. Then ask Beliar for Mora Ulart.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_81 " );	// And one more thing... keep me updated. If you find out anything about the amulet, let me know.
	AI_Output(self,other, " DIA_Xardas_FindDarkSoul_01_85 " );	// That's it - you're good to go.
	TELLABOUTDS = TRUE;
	XARDASLINE = TRUE;
	Wld_InsertNpc(pal_187_melhior,"NW_CITY_HABOUR_MELHIOR");
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Xardas told me about Mora Ulart, also called the 'Labyrinth of Souls'. That spell can only be granted by Beliar, and my chances are not high. However, Xardas told me that if I sacrifice what he wants to Beliar, my chances will increase greatly. That's why I need to find the amulet of Triramar, a creation of the Dark God that the paladins have taken. Xardas doesn't know exactly where it might be. I should ask one of the paladins... " );
	Log_AddEntry( TOPIC_GOLDDRAGONPORTAL , " If I manage to get the artifact, I should sacrifice it to Beliar. Maybe then he will give me Ulart, but according to Xardas, I should still expect failure. " );
};


instance DIA_XARDAS_FINDETLU (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_findetlu_condition;
	information = dia_xardas_findetlu_info;
	permanent = FALSE;
	description = " I found out where the paladins hid the Triramar amulet. " ;
};


func int dia_xardas_findetlu_condition()
{
	if((ETLUBEGINS == TRUE) && Npc_KnowsInfo(other,dia_xardas_finddarksoul) && (BEONETLU == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_findetlu_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Xardas_FindEtlu_01_00 " );	// I found out where the paladins hid the Triramar amulet.
	AI_Output(self,other,"DIA_Xardas_FindEtlu_01_01");	//A kde?
	AI_Output(other,self, " DIA_Xardas_FindEtlu_01_02 " );	// On the island of Etlu.
	AI_Output(self,other, " DIA_Xardas_FindEtlu_01_03 " );	// Etlu?! Hmmm... That was smart of them.
	AI_Output(other,self, " DIA_Xardas_FindEtlu_01_04 " );	// I also figured out how to get there.
	AI_Output(other,self, " DIA_Xardas_FindEtlu_01_05 " );	// On Khorinis there is a portal leading to Etlu.
	AI_Output(self,other, " DIA_Xardas_FindEtlu_01_06 " );	// Portal?! Where did he come from?
	AI_Output(other,self, " DIA_Xardas_FindEtlu_01_07 " );	// Built by paladins.
	AI_Output(self,other, " DIA_Xardas_FindEtlu_01_08 " );	// Hmmm... (laughs) Irony! Then just find the portal.
	AI_Output(self,other, " DIA_Xardas_FindEtlu_01_13 " );	// I'm afraid the paladins on the island won't be happy about your visit.
	AI_Output(self,other, " DIA_Xardas_FindEtlu_01_15 " );	// Anyone who violates this is outlawed.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Xardas_FindEtlu_01_18 " );	// Even though you're a paladin.
		AI_Output(self,other, " DIA_Xardas_FindEtlu_01_19 " );	// There on the island, your status won't protect you!
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Xardas_FindEtlu_01_20 " );	// Even though you're a Fire Mage.
		AI_Output(self,other, " DIA_Xardas_FindEtlu_01_21 " );	// There on the island, your status won't protect you!
	}
	else  if (hero.guild ==  GIL_KDW )
	{
		AI_Output(self,other, " DIA_Xardas_FindEtlu_01_22 " );	// Even though you're a Water Mage.
		AI_Output(self,other, " DIA_Xardas_FindEtlu_01_23 " );	// There on the island, your status won't protect you!
	};
	AI_Output(self,other, " DIA_Xardas_FindEtlu_01_24 " );	// Therefore prepare well - you can expect a tough fight.
	AI_Output(self,other, " DIA_Xardas_FindEtlu_01_25 " );	// Paladins will die easily if they protect an artifact with this.
	AI_Output(self,other, " DIA_Xardas_FindEtlu_01_27 " );	// And one more thing - you can't use that amulet. He would kill you! (menacingly)
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Xardas told me that I have no welcome on the island... I should prepare my weapons well. He also told me not to wear the amulet - he would kill me. " );
};


instance DIA_XARDAS_ASKABOUTPEACEWAY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_askaboutpeaceway_condition;
	information = dia_xardas_askaboutpeaceway_info;
	permanent = FALSE;
	description = " One more question. " ;
};


func int dia_xardas_askaboutpeaceway_condition()
{
	if ( Npc_KnowsInfo ( other , dia_xardas_found ) && ( MEHASTRIRAVAR  ==  FALSE ) && ( ASKABOUTPEACEWAY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_xardas_askaboutpeaceway_info()
{
	AI_Output(other,self, " DIA_Xardas_AskAboutPeaceWay_01_00 " );	// One more question.
	AI_Output(self,other, " DIA_Xardas_AskAboutPeaceWay_01_01 " );	// And what kind?
	AI_Output(other,self, " DIA_Xardas_AskAboutPeaceWay_01_03 " );	// Can't I get the amulet without facing the paladins?
	AI_Output(self,other, " DIA_Xardas_AskAboutPeaceWay_01_04 " );	// As I told you, I don't know this.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Xardas_AskAboutPeaceWay_01_05 " );	// If you want to find out, ask Beliar at his shrine!
		if(other.guild == GIL_PAL)
		{
			AI_Output(self,other, " DIA_Xardas_AskAboutPeaceWay_01_06 " );	// I just don't know if it will help the paladin.
		}
		else
		{
			AI_Output(self,other, " DIA_Xardas_AskAboutPeaceWay_01_07 " );	// I just don't know if it will help the Fire Mage.
		};
		AI_Output(other,self, " DIA_Xardas_AskAboutPeaceWay_01_08 " );	// Ok, I'll give it a try.
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_AskAboutPeaceWay_01_09 " );	// If you want to find out, ask the owner of the amulet!
		AI_Output(other,self,"DIA_Xardas_AskAboutPeaceWay_01_10");	//Máš namysli Beliara?!
		AI_Output(self,other, " DIA_Xardas_AskAboutPeaceWay_01_11 " );	// Yes. Try to pray and you will see.
		AI_Output(other,self, " DIA_Xardas_AskAboutPeaceWay_01_12 " );	// Then I'll try.
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I asked Xardas if there was a way around the paladins. He told me to turn to Beliar. " );
	};
	ASKABOUTPEACEWAY = TRUE;
};


instances DIA_XARDAS_FINDAMULET (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_findamulet_condition;
	information = dia_xardas_findamulet_info;
	permanent = FALSE;
	description = "Mám amulet Triramar!";
};


func int dia_xardas_findamulet_condition()
{
	if ((Npc_HasItems(other,itmi_triramar) >=  1 ) && Npc_KnowsInfo(other,dia_xardas_finddarksoul))
	{
		return TRUE;
	};
};

func void dia_xardas_findamulet_info()
{
	B_GivePlayerXP(200);

	if(Npc_HasItems(other,ITKE_SI_SIGN) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_SI_SIGN,1);
	};
	if(Npc_HasItems(other,ITKE_HAGEN_SECRETKEY) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_HAGEN_SECRETKEY,1);
	};

	AI_Output(other,self,"DIA_Xardas_FindAmulet_01_00");	//Mám amulet Triramar!
	AI_Output(self,other, " DIA_Xardas_FindAmulet_01_01 " );	// WHAT?! Did you really get it?
	AI_Output(self,other, " DIA_Xardas_FindAmulet_01_03 " );	// You never cease to amaze me. Actually, I should get used to it by now.

	if(CountPalmora >= 5)
	{
		AI_Output(self,other, " DIA_Xardas_FindAmulet_01_04 " );	// Hmmm... I hope you don't worry about sending so many people to eternity by getting this amulet?
		AI_Output(self,other, " DIA_Xardas_FindAmulet_01_08 " );	// You probably made a mistake... Well, we're not going to do anything about it.
	};

	AI_Output(self,other, " DIA_Xardas_FindAmulet_01_09 " );	// Now, to obtain Mor Ulart, you must sacrifice your gift to Beliar.
	AI_Output(self,other, " DIA_Xardas_FindAmulet_01_10 " );	// Go to his nearest shrine and ask him for Mora Ulart in exchange for Triramar.
	AI_Output(self,other, " DIA_Xardas_FindAmulet_01_11 " );	// You can find one shrine on the next floor of my tower, so don't waste time.
	AI_Output(self,other, " DIA_Xardas_FindAmulet_01_12 " );	// Also remember what I told you - The Dark God is mean!
	AI_Output(other,self, " DIA_Xardas_FindAmulet_01_14 " );	// Then I hope I get lucky.
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I showed Xardas the Triramar. He told me I could sacrifice it to Beliar. One shrine is at the top of Xardas's tower. But beware - just because I sacrifice the amulet doesn't mean Beliar will give me Ularta. I should get his first favor... " );
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GETSUPERBELIARWEAPON(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_getsuperbeliarweapon_condition;
	information = dia_xardas_getsuperbeliarweapon_info;
	permanent = FALSE;
	description = " The Dark God gave me Mora Ulart! " ;
};


func int dia_xardas_getsuperbeliarweapon_condition()
{
	if ((Npc_HasItems(hero,true_moral) >=  1 ) && Npc_KnowsInfo(hero, dia_xardas_finddarksoul))
	{
		return TRUE;
	};
};

func void dia_xardas_getsuperbeliarweapon_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Xardas_GetSuperBeliarWeapon_01_00 " );	// The Dark God gave me Mor Ulart!
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_01 " );	// REALLY?! So that surprises me a lot! Sometimes it seems to me that nothing is impossible for you...
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_07 " );	// You now have a powerful artifact in your hands that grants you the power of a Soul Hunter.
	AI_Output(other,self,"DIA_Xardas_GetSuperBeliarWeapon_01_08");	//Lovce duší?
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_09 " );	// Yes! I think you already understand why Mora Ulartu is a godsend.
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_12 " );	// It's an ability of demons who have it from birth or learn it, but they are the most dangerous demons you can meet.
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_13 " );	// Humans are forbidden this art, but looking at you, I see that exceptions are possible.
	AI_Output(other,self, " DIA_Xardas_GetSuperBeliarWeapon_01_14 " );	// But what good are those souls to me?!
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_15 " );	// It seems to me that you still do not realize what power this is.
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_16 " );	// The soul is the most valuable part of a living creature. Thanks to her we can cast spells and it can be said that in some cases she creates the spells herself...
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_17 " );	// The soul also has many other properties, but I don't know much about them.
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_19 " );	// It's actually invaluable - it's the key to unlimited power.
	AI_Output(other,self, " DIA_Xardas_GetSuperBeliarWeapon_01_20 " );	// Can you explain to me how to use this knowledge?
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_21 " );	// It's not too complicated. By using Mora Ulart after the death of a living creature, you can prevent the soul from leaving the body.
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_22 " );	// However, you cannot use her power.
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_24 " );	// Humans are not the same as demons - their bodies and souls are adapted so that they can use this power.
	AI_Output(other,self, " DIA_Xardas_GetSuperBeliarWeapon_01_25 " );	// So what will I do with them?
	AI_Output(self,other, " DIA_Xardas_GetSuperBeliarWeapon_01_26 " );	// Hmmm... Good question. You could probably offer the souls to the Dark God as a gift.
	AI_Output(other,self,"DIA_Xardas_GetSuperBeliarWeapon_01_29");	//No, je mi to jasné.
	KNOWSHOWDEALSOULS = TRUE;
	Log_CreateTopic(TOPIC_SUPERBELIARWEAPON_UPG,LOG_NOTE);
	B_LogEntry( TOPIC_SUPERBELIARWEAPON_UPG , " With Mora Ulart, I have been granted the Soul Hunter power. It allows me to capture the soul of any living creature I slay. I can also sacrifice souls to Beliar in exchange for less affection. " );
};


DIA_XARDAS_GETSUPERSOUL (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_getsupersoul_condition;
	information = dia_xardas_getsupersoul_info;
	permanent = FALSE;
	description = " I have the soul of the archdemon Senyak! " ;
};


func int dia_xardas_getsupersoul_condition()
{
	if ((Npc_HasItems(hero,itmi_stonesoul_senyak) >=  1 ) && ( TELLCANSUPERBELIERWEAPON  ==  FALSE ) && ( KNOWSHOWDEALSOULS  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_xardas_getsupersoul_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Xardas_GetSuperSoul_01_00 " );	// I have the soul of Archdemon Senyak!
	AI_Output(self,other, " DIA_Xardas_GetSuperSoul_01_01 " );	// Senyaka?! Hmmm... You really didn't waste your time, did you?
	AI_Output(self,other, " DIA_Xardas_GetSuperSoul_01_02 " );	// I see you really know your way around that treasure of yours.
	AI_Output(self,other, " DIA_Xardas_GetSuperSoul_01_05 " );	// An archdemon's soul is not the same as others. Her magical power is enormous and in such a state she cannot be easily controlled.
	AI_Output(self,other, " DIA_Xardas_GetSuperSoul_01_06 " );	// However, you can trap her in some powerful magical artifact.
	AI_Output(other,self, " DIA_Xardas_GetSuperSoul_01_08 " );	// What kind of subject should this be?
	AI_Output(self,other, " DIA_Xardas_GetSuperSoul_01_09 " );	// Hmmm... For starters, it should have a magical nature and something to trap souls into.
	AI_Output(other,self, " DIA_Xardas_GetSuperSoul_01_10 " );	// How about Beliar's Claw?!
	AI_Output(self,other, " DIA_Xardas_GetSuperSoul_01_11 " );	// CLAW! He could seriously come in handy for this purpose.
	AI_Output(other,self, " DIA_Xardas_GetSuperSoul_01_14 " );	// Okay, I'll do it, but how do I trap the demon soul in the Claw?
	AI_Output(self,other, " DIA_Xardas_GetSuperSoul_01_15 " );	// Nothing is easy - any Beliar shrine will do.
	AI_Output(self,other, " DIA_Xardas_GetSuperSoul_01_17 " );	// Besides, if you're Beliar's favorite, he won't reject you.
	TELLCANSUPERBELIARWEAPON = TRUE;
	B_LogEntry( TOPIC_SUPERBELIARWEAPON_UPG , " If I want to use the archdemon Senyak's soul, I need to place it in some artifact that can absorb it. Xardas and I agreed that Beliar's claw is best. I can perform the ritual at Beliar's shrine, but I should be in his favorable. " );
};


instance DIA_XARDAS_GOBLINBRINGSCROLL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 23;
	condition = dia_xardas_goblinbringscroll_condition;
	information = dia_xardas_goblinbringscroll_info;
	permanent = FALSE;
	description = " I need a scroll of banishment. " ;
};


func int dia_xardas_goblinbringscroll_condition()
{
	if((MIS_GOBLINAWAY == LOG_Running) && (XARDASGOBLINREADYAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_goblinbringscroll_info()
{
	AI_Output(other,self, " DIA_Xardas_GoblinBringScroll_01_00 " );	// I need a scroll of banishment.
	AI_Output(other,self, " DIA_Xardas_GoblinBringScroll_01_01 " );	// Don't know where I can get it?
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_01_02 " );	// This is a very dangerous spell and I won't give it to you without an explanation.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_01_03 " );	// (serious) What do you want it for?
	Info_ClearChoices(dia_xardas_goblinbringscroll);
	Info_AddChoice(dia_xardas_goblinbringscroll, " Come on, give it to me, I can't tell you! " ,dia_xardas_goblinbringscroll_ok);
	Info_AddChoice(dia_xardas_goblinbringscroll, " It is necessary for our common cause. " ,dia_xardas_goblinbringscroll_no_1);
	Info_AddChoice(dia_xardas_goblinbringscroll, " To banish one creature. " ,dia_xardas_goblinbringscroll_no_2);
	Info_AddChoice(dia_xardas_goblinbringscroll, " For my friend Mud... " ,dia_xardas_goblinbringscroll_no_3);
};

func void dia_xardas_goblinbringscroll_ok()
{
	AI_Output(other,self, " DIA_Xardas_GoblinBringScroll_Ok_01_00 " );	// Come on, give it to me, I can't tell you!
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_Ok_01_01 " );	// I can't help you in that case.
};

func void dia_xardas_goblinbringscroll_no_1()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Xardas_GoblinBringScroll_No_1_01_00 " );	// It is necessary for our common cause.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_1_01_01 " );	// Phew! I know what is necessary for our cause.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_1_01_02 " );	// And I see no reason why it should be this charm.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_1_01_03 " );	// Now it is imperative that you go away! And don't bother me anymore if you don't want to tell me!
	B_LogEntry( TOPIC_GOBLINAWAY , " Xardas won't give me a scroll of banishment. " );
	AI_StopProcessInfos(self);
};

func void dia_xardas_goblinbringscroll_no_2()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Xardas_GoblinBringScroll_No_2_01_00 " );	// To banish one creature.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_01 " );	// Which one? What are you talking about?
	AI_Output(other,self, " DIA_Xardas_GoblinBringScroll_No_2_01_02 " );	// One goblin! He even talked to me.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_03 " );	// Yes? I think I know who you're talking about...
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_04 " );	// You probably met him in Mining Valley near my old tower.
	AI_Output(other,self, " DIA_Xardas_GoblinBringScroll_No_2_01_05 " );	// How do you know?
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_06 " );	// We won't waste time doing this.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_07 " );	// Okay, I'll give you the spell, but only because I should have done it a long time ago.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_09 " );	// I kind of forgot about it. It's my fault, but you'll fix it.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_10 " );	// Although I should rather punish him for running away from me.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_11 " );	// It sometimes happens that summoned creatures do not always obey their master.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_12 " );	// Here's the scroll, and remember you can only use it once and only near the summoned creature.
	B_GiveInvItems(self,other,itwr_xardasgoblinscroll,1);
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_2_01_13 " );	// Now go and stop bothering me.
	B_LogEntry( TOPIC_GOBLINAWAY , " Xardas gave me the scroll of banishment. Time to get back to the goblin. " );
	AI_StopProcessInfos(self);
};

func void dia_xardas_goblinbringscroll_no_3()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Xardas_GoblinBringScroll_No_3_01_01 " );	// For my friend Mud. I met him in the colony.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_3_01_02 " );	// Somehow it seems to me that you are lying.
	AI_Output(self,other, " DIA_Xardas_GoblinBringScroll_No_3_01_08 " );	// You'd better go and do what you have to do. And don't disturb me!
	B_LogEntry( TOPIC_GOBLINAWAY , " Xardas won't give me a scroll of banishment. " );
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_CANBENECROM (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_canbenecrom_condition;
	information = dia_xardas_canbenecrom_info;
	permanent = FALSE;
	description = " Can you initiate me into the secrets of Dark magic? " ;
};


func int day_xardas_canbenecrom_condition()
{
	if((TELLABOUTOTHERGUILD == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_xardas_canbenecrom_info()
{
	AI_Output(other,self, " DIA_Xardas_CanBeNecrom_01_00 " );	// Can you initiate me into the secrets of Dark magic?
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_01 " );	// Hmmm... Your request surprises me a bit.
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_03 " );	// To be honest, I didn't expect that from you.
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_04 " );	// I certainly understand your desire to master magic...
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_05 " );	// ... But there are other ways to achieve this. You don't have to become a necromancer and demon companion.
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_06 " );	// Lots of people want it, but it's very difficult and dangerous.
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_07 " );	// And moreover, the path of the dark mage is the path of complete loneliness. (gloomily)
	AI_Output(other,self, " DIA_Xardas_CanBeNecrom_01_08 " );	// That doesn't scare me.
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_10 " );	// There are also representatives of other deities on the island. For example, magicians of Fire or Water.
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_11 " );	// Wouldn't you rather go to them?
	AI_Output(other,self, " DIA_Xardas_CanBeNecrom_01_14 " );	// I think darkness is my home. I see my destiny in her.
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_15 " );	// (thoughtfully) Hmmm...
	AI_Output(other,self, " DIA_Xardas_CanBeNecrom_01_17 " );	// Can you help me become a necromancer?
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_18 " );	// Oh well! However, I don't want to make hasty decisions.
	AI_Output(self,other, " DIA_Xardas_CanBeNecrom_01_21 " );	// I need some time to think.
	HARDASTIMERBENDM = Wld_GetDay();
	MIS_BECOMEKDM = LOG_Running;
	Log_CreateTopic(TOPIC_BECOMEKDM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_Running);
	B_LogEntry( TOPIC_BECOMEKDM , " I asked Xardas if he would take me on as an apprentice and train me in necromancer magic. He told me he had to decide and I should ask in a few days. " );
};


instance DIA_XARDAS_CANBENECROMOK ( C_Info ) ;
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_canbenecromok_condition;
	information = dia_xardas_canbenecromok_info;
	permanent = FALSE;
	description = " Have you reviewed my request yet? " ;
};

func int dia_xardas_canbenecromok_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if (( XARDASTIMERBENDM  <= (daynow -  2 )) && ( MY_BECOMEDM  == LOG_Running ) && ( XARDAS_NDM  ==  FALSE ) && ( hero . guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void dia_xardas_canbenecromok_info()
{
	AI_Output(other,self, " DIA_Xardas_CanBeNecromOk_01_00 " );	// Have you reviewed my request yet?
	AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_01_03 " );	// I think I could take you on as a student of Dark magic.
	AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_01_04 " );	// However, understand that you will not be able to change your decision.
	AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_01_05 " );	// Therefore, you should decide if you really want it that way.
	AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_01_06 " );	// Are you ready to dedicate yourself to the Dark God and the study of Dark magic?
	B_LogEntry( TOPIC_BECOMEKDM , " Xardas has agreed to accept me among the necromancers. " );
	Info_ClearChoices(dia_xardas_canbenecromok);
	Info_AddChoice(dia_xardas_canbenecromok, " Yes. " ,dia_xardas_canbenecromok_yes);
	Info_AddChoice(dia_xardas_canbenecromok, " I still have to think about it. " ,dia_xardas_canbenecromok_no);
};

func void dia_xardas_canbenecromok_yes()
{
	if(hero.level >= 10)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Xardas_CanBeNecromOk_Yes_01_00");	//Ano.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_01");	//Staniž se!
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_02 " );	// By the power entrusted to me by Beliar, I accept you into the ranks of the Dark Cult.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_03 " );	// Let the darkness show you the way to your soul.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_04 " );	// That's it! You are now part of the darkness and your life is inextricably linked with it.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_05 " );	// But you have to understand that it doesn't make you a mage.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_06 " );	// Practice and learn and one day you might become a great dark mage.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_07 " );	// In the meantime, accept this robe as a sign that you now belong to our circle.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_08 " );	// And one more thing. Since you are now my disciple, take this ring.
		B_GiveInvItems(self,other,ITRI_XARDASPLACE,1);
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_Yes_01_09 " );	// It will allow you to get to my tower faster than you can imagine.

		if(CanTeachTownMaster == FALSE)
		{
			CanTeachTownMaster = TRUE;
			MIS_PathFromDown = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		};

		other.guild = GIL_NDM;
		CheckHeroGuild[0] = TRUE;
		Snd_Play("LEVELUP");
		B_GiveInvItems(self,other,itar_ndm_l,1);
		SLD_recording = LOG_OBSOLETE ;
		KDF_Recording = LOG_OBSOLETE ;
		MIL_recording = LOG_OBSOLETE ;
		MIS_PSICAMPJOIN = LOG_OBSOLETE;
		MIS_BECOMEKDW = LOG_OBSOLETE;

		Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);

		if(MIS_SLDRESPEKT == LOG_Running)
		{
			MIS_SLDRESPEKT = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
		};

		XARDAS_NDM = TRUE;
		B_LogEntry( TOPIC_BECOMEKDM , " Xardas made me a novice of Darkness. " );
		Info_ClearChoices(dia_xardas_canbenecromok);
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_No_Level_00_01 " );	// But first you have to gain experience - I don't have time to explain the basics to you.
		B_LogEntry( TOPIC_BECOMEKDM , " If I want to become a disciple of Xardas, I need to gain experience (need hero level at least 10. " );
	};
};

func void dia_xardas_canbenecromok_no()
{
	AI_Output(other,self, " DIA_Xardas_CanBeNecromOk_No_01_00 " );	// I still have to think about it.
	AI_Output(self,other, " DIA_Xardas_CanBeNecromOk_No_01_01 " );	// Good! You don't have to rush the answer. This is a serious decision.
	Info_ClearChoices(dia_xardas_canbenecromok);
};


instance DIA_XARDAS_CANBENECROMOCONCE (C_Info);
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_canbenecromokonce_condition;
	information = dia_xardas_canbenecromoconce_info;
	permanent = TRUE;
	description = " I want to follow the path of the Mages of Darkness. " ;
};


func int day_xardas_canbenecromokonce_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_xardas_canbenecromok ) && ( MY_BECOMEKDM  == LOG_Running ) && ( XARDAS_NDM  ==  FALSE ) && ( hero . guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void dia_xardas_canbenecromokonce_info()
{
	AI_Output(other,self, " DIA_Xardas_CanBeNecromOkOnce_01_00 " );	// I want to follow the path of the Mages of Darkness.
	AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_01_01 " );	// Are you ready to dedicate your life to the Dark God and the study of magic?
	Info_ClearChoices(dia_xardas_canbenecromoconce);
	Info_AddChoice(dia_xardas_canbenecromokonce, " Yes. " ,dia_xardas_canbenecromokonce_yes);
	Info_AddChoice(dia_xardas_canbenecromokonce, " I still have to think about it. " ,dia_xardas_canbenecromokonce_no);
};

func void dia_xardas_canbenecromokonce_yes()
{
	if(hero.level >= 10)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_00");	//Ano.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOkOnce_Yes_01_01");	//Staniž se!
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_Yes_01_02 " );	// By the power entrusted to me by Beliar, I accept you into the ranks of the Dark Cult.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_Yes_01_03 " );	// Let the darkness show you the way to your soul.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_Yes_01_04 " );	// That's it! You are now part of the darkness and your life is inextricably linked with it.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_Yes_01_05 " );	// But you have to understand that it doesn't make you a mage.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_Yes_01_06 " );	// Practice and learn and one day you might become a great dark mage.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_Yes_01_07 " );	// In the meantime, accept this robe as a sign that you now belong to our circle.
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_Yes_01_08 " );	// And one more thing. Since you are now my disciple, take this ring.
		B_GiveInvItems(self,other,ITRI_XARDASPLACE,1);
		AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_Yes_01_09 " );	// It will allow you to get to my tower faster than you can imagine.

		if(CanTeachTownMaster == FALSE)
		{
			CanTeachTownMaster = TRUE;
			MIS_PathFromDown = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		};

		other.guild = GIL_NDM;
		CheckHeroGuild[0] = TRUE;
		Snd_Play("LEVELUP");
		B_GiveInvItems(self,other,itar_ndm_l,1);
		SLD_recording = LOG_OBSOLETE ;
		KDF_Recording = LOG_OBSOLETE ;
		MIL_recording = LOG_OBSOLETE ;
		MIS_PSICAMPJOIN = LOG_OBSOLETE;
		MIS_BECOMEKDW = LOG_OBSOLETE;

		Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);

		XARDAS_NDM = TRUE;
		B_LogEntry( TOPIC_BECOMEKDM , " Xardas made me a novice of Darkness. " );
		Info_ClearChoices(dia_xardas_canbenecromoconce);
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_No_Level_00_01 " );	// But first you have to gain experience - I don't have time to explain the basics to you.
		B_LogEntry( TOPIC_BECOMEKDM , " If I want to become a disciple of Xardas, I need to gain experience (need hero level at least 10. " );
	};
};

func void dia_xardas_canbenecromokonce_no()
{
	AI_Output(other,self, " DIA_Xardas_CanBeNecromOkOnce_No_01_00 " );	// I still have to think about it.
	AI_Output(self,other, " DIA_Xardas_CanBeNecromOkOnce_No_01_01 " );	// Good! You don't have to rush the answer. This is a serious decision.
	Info_ClearChoices(dia_xardas_canbenecromoconce);
};


instance DIA_XARDAS_NDM_HOWKDM(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_ndm_howkdm_condition;
	information = dia_xardas_ndm_howkdm_info;
	permanent = FALSE;
	description = " How can I become a true necromancer? " ;
};


func int dia_xardas_ndm_howkdm_condition()
{
	if((MIS_BECOMEKDM == LOG_Running) && (XARDAS_NDM == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_howkdm_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_HowKDM_01_00 " );	// How can I become a true necromancer?
	AI_Output(self,other, " DIA_Xardas_NDM_HowKDM_01_03 " );	// The path you have chosen is not just an opportunity to wear the robes of a novice or a necromancer.
	AI_Output(self,other, " DIA_Xardas_NDM_HowKDM_01_04 " );	// It's an opportunity to gain knowledge leading to almost unlimited power!
	AI_Output(self,other, " DIA_Xardas_NDM_HowKDM_01_07 " );	// A lot depends on how strong your spirit is and how great your wisdom is!
	AI_Output(other,self, " DIA_Xardas_NDM_HowKDM_01_08 " );	// What do you mean?
	AI_Output(self,other, " DIA_Xardas_NDM_HowKDM_01_09 " );	// This knowledge can drive the unprepared mad, or simply kill!
	AI_Output(self,other, " DIA_Xardas_NDM_HowKDM_01_10 " );	// And as you surely understand, that must not happen.
	AI_Output(other,self, " DIA_Xardas_NDM_HowKDM_01_11 " );	// Does this mean I'm not ready yet?
	AI_Output(self,other, " DIA_Xardas_NDM_HowKDM_01_12 " );	// Yes, your spirit is still weak and not ready for such a burden.
	AI_Output(self,other, " DIA_Xardas_NDM_HowKDM_01_13 " );	// To become a true Mage of Darkness, you will have to devote a long time to careful training, strengthening your spirit and mind.
	AI_Output(self,other, " DIA_Xardas_NDM_HowKDM_01_14 " );	// Only then can you become a necromancer.
	B_LogEntry( TOPIC_BECOMEKDM , " Xardas told me that in order to become a Dark Mage, I had to increase my magical energy as a novice. If I went through the ritual not mentally strong enough, it could kill me, and he doesn't want to risk that. " );
};

var int XarOneTimeDM;

DIA_XARDAS_NDM_MANA (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_mana_condition;
	information = dia_xardas_ndm_mana_info;
	permanent = TRUE;
	description = " Am I already worthy to become a dark mage? " ;
};

func int dia_xardas_ndm_mana_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_xardas_ndm_howkdm ) && ( MIS_RECOGNIZED  == LOG_Running ) && ( XARDAS_ACCEPTED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_mana_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_Mana_01_00 " );	// Am I already worthy to become a dark mage?
	AI_Output(self,other, " DIA_Xardas_NDM_Mana_01_01 " );	// Maybe. Now I will look into your soul and we will know the answer right away.

	if((other.attribute[ATR_MANA_MAX] >= 75) && (ATR_INTELLECT >= 30))
	{
		B_GivePlayerXP(300);
		AI_Output(self,other, " DIA_Xardas_NDM_Mana_01_03 " );	// Hmmm... (looks carefully)
		AI_Output(self,other, " DIA_Xardas_NDM_Mana_01_04 " );	// YES! I feel great spiritual power in you. Your mind is ready for the test of Darkness.
		AI_Output(self,other, " DIA_Xardas_NDM_Mana_01_07 " );	// Now I can initiate you into the secrets of Dark magic and raise you to the level of necromancer.
		AI_Output(self,other, " DIA_Xardas_NDM_Mana_01_08 " );	// Congratulations, you have been accepted into the circle of the chosen!
		B_LogEntry( TOPIC_BECOMEKDM , " Xardas believes that I am now worthy to become a Dark Mage. " );
		XARDAS_AGREEDBEKDM = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_NDM_Mana_01_09 " );	// Hmmm... (looks carefully)
		AI_Output(self,other, " DIA_Xardas_NDM_Mana_01_10 " );	// No, you're not ready yet.
		AI_Output(self,other, " DIA_Xardas_NDM_Mana_01_11 " );	// Don't waste my time. Come back when your mental strength is greater.

		if(XarOneTimeDM == FALSE)
		{
			B_LogEntry( TOPIC_BECOMEKDM , " According to Xardas, I'm still missing something - mana or knowledge. Or maybe it's too early to understand the magic of Darkness. (Requirement: mana 75, intelligence 30) " );
			XarOneTimeDM = TRUE;
		};

		AI_StopProcessInfos(self);
	};
};

instance DIA_Xardas_NDM_LastStand(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_NDM_LastStand_condition;
	information = DIA_Xardas_NDM_LastStand_info;
	permanent = FALSE;
	description = " Are you going to teach me Dark magic now? " ;
};

func int DIA_Xardas_NDM_LastStand_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_xardas_ndm_howkdm ) && ( MIS_ACCOUNT  == LOG_Running ) && ( XARDAS_ACCEPT  ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Xardas_NDM_LastStand_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_LastStand_01_01 " );	// Are you going to teach me Dark magic now?
	AI_Output(self,other, " DIA_Xardas_NDM_LastStand_01_02 " );	// Yes. I think you are ready for the initiation ritual.
	AI_Output(self,other, " DIA_Xardas_NDM_LastStand_01_03 " );	// But according to the old custom, every student must first pass a difficult exam. And you are no exception.
	AI_Output(other,self, " DIA_Xardas_NDM_LastStand_01_04 " );	// What do I need to do?
	AI_Output(self,other, " DIA_Xardas_NDM_LastStand_01_05 " );	// You must kill an innocent Fire novice.
	AI_Output(other,self, " DIA_Xardas_NDM_LastStand_01_06 " );	// What? And is there no other way?
	AI_Output(self,other, " DIA_Xardas_NDM_LastStand_01_07 " );	// No, it isn't. You must find out whose death the Dark God desires most.
	AI_Output(self,other, " DIA_Xardas_NDM_LastStand_01_08 " );	// Beliar gives his patronage and power only to those who have devoted their souls to him unconditionally.
	AI_Output(self,other, " DIA_Xardas_NDM_LastStand_01_09 " );	// Do as I told you and you will gain the power of Beliar's Crimson Darkness!
	MIS_Xardas_LastStand_Done = LOG_Running;
	Log_CreateTopic(TOPIC_XARDAS_DEMON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDAS_DEMON,LOG_Running);
	B_LogEntry( TOPIC_XARDAS_DEMON , " Xardas will initiate me into Dark magic only after I pass the final exam. In order to receive Beliar's blessing, I should find and kill an innocent novice from the Fire Monastery. According to Xardas, there is no other way. " );
};


instance DIA_Xardas_NDM_LastStand_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_NDM_LastStand_Done_condition;
	information = DIA_Xardas_NDM_LastStand_Done_info;
	permanent = FALSE;
	description = " I killed the novice Fire mages! " ;
};

func int DIA_Xardas_NDM_LastStand_Done_condition()
{
	if((MIS_Xardas_LastStand_Done == LOG_Running) && (OpolosIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_NDM_LastStand_Done_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Xardas_NDM_LastStand_Done_01_01 " );	// I killed the novice Fire Mages!
	AI_Output(self,other, " DIA_Xardas_NDM_LastStand_Done_01_02 " );	// Okay. In doing so, you proved that you were completely and unreservedly on Beliar's side.
	AI_Output(self,other, " DIA_Xardas_NDM_LastStand_Done_01_03 " );	// I'm sure the Dark God is extremely pleased with you!
	AI_Output(self,other, " DIA_Xardas_NDM_LastStand_Done_01_04 " );	// And now, as I promised, I can take you into the circle of necromancers and demonology masters at any time.
	MIS_Xardas_LastStand_Done = LOG_SUCCESS;
	B_LogEntry( TOPIC_XARDAS_DEMON , " I passed the final exam and now I can finally become a dark mage. " );
	Log_SetTopicStatus(TOPIC_XARDAS_DEMON,LOG_SUCCESS);
};

DIA_XARDAS_MAKEMEKDM (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_makemekdm_condition;
	information = dia_xardas_makemekdm_info;
	permanent = TRUE;
	description = " Train me in the magic of Darkness. " ;
};

func int dia_xardas_makemekdm_condition()
{
	if((MIS_BECOMEKDM == LOG_Running) && (XARDAS_AGREEDBEKDM == TRUE) && (other.guild == GIL_NDM) && (MIS_Xardas_LastStand_Done == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_xardas_makemekdm_info()
{
	hero.guild = GIL_KDM;
	CheckHeroGuild[0] = TRUE;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_Output(other,self, " DIA_Xardas_MakeMeKDM_01_00 " );	// Train me in the magic of Darkness.
	AI_Output(self,other, " DIA_Xardas_MakeMeKDM_01_01 " );	// Okay. You have proven yourself worthy of this honor.
	AI_Output(self,other, " DIA_Xardas_MakeMeKDM_01_02 " );	// From now on, you are part of the Holy Circle of Dark Mages, Necromancers, and Masters of Demonology.
	AI_Output(self,other, " DIA_Xardas_MakeMeKDM_01_03 " );	// Here. Take this robe in recognition of your status.
	CreateInvItems(self,itar_dmt_l,1);
	B_GiveInvItems(self,other,itar_dmt_l,1);
	MIS_BECOMEKDM = LOG_SUCCESS;
	BELIARPRAYCOUNT = BELIARPRAYCOUNT + 30;
	Snd_Play("GUILD_INV");
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_SUCCESS);
	B_LogEntry( TOPIC_BECOMEKDM , " I have attained the status of Dark Mage. My path is now inextricably linked with Darkness. " );
	AI_Output(self,other, " DIA_Xardas_MakeMeKDM_01_04 " );	// Only we, mages of Darkness, have the privilege of wielding the power of all supernatural servants.
	CreateInvItems(self,ITMW_2H_KMR_BLACKSTAFF_01,1);
	B_GiveInvItems(self,other,ITMW_2H_KMR_BLACKSTAFF_01,1);
	AI_Output(self,other, " DIA_Xardas_MakeMeKDM_01_05 " );	// Now your fate is inextricably linked to the crimson darkness of Beliar. Remember that.
	AI_Output(self,other, " DIA_Xardas_MakeMeKDM_01_06 " );	// Draw strength from her as if you were drinking mother's milk.
	AI_Output(self,other, " DIA_Xardas_MakeMeKDM_01_07 " );	// And may she protect your path!
	AI_StopProcessInfos(self);
};

instance DIA_XARDAS_NDM_ABOUTDARKMAGIC(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_ndm_aboutdarkmagic_condition;
	information = dia_xardas_ndm_aboutdarkmagic_info;
	permanent = TRUE;
	description = " Tell me more about Dark magic. " ;
};


func int dia_xardas_ndm_aboutdarkmagic_condition()
{
	if((XARDAS_NDM == TRUE) && (XARDASMENTIONABOUTDEMONOLOG == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_aboutdarkmagic_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_AboutDarkMagic_01_00 " );	// Tell me more about Dark magic.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_04 " );	// Beliar's magic is the most powerful destructive magic in this world.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_05 " );	// Her power of destruction cannot be compared to others.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_06 " );	// Her main purpose is to enslave and destroy.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_10 " );	// Understand that it can only be used by a mage who has served the Darkness for some time.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_11 " );	// Can easily kill a beginner. Dark magic is insidious, just like Beliar himself.
	if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_13 " );	// That's not all.
		AI_Output(other,self, " DIA_Xardas_NDM_AboutDarkMagic_01_14 " );	// What else?
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_15 " );	// There are also some advantages that you should understand.
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_17 " );	// Only the Rune of Darkness will allow you to summon the essence of Darkness - I mean the undead.
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_18 " );	// However, there are some difficulties here.
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_20 " );	// Summoned essence can sometimes simply reject you.
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_22 " );	// You might just be too weak.
		AI_Output(other,self,"DIA_Xardas_NDM_AboutDarkMagic_01_23");	//A pak?
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_24 " );	// Then they'll try to kill you.
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_28 " );	// Creatures of Darkness are very powerful and dangerous. Not to mention demons.
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_33 " );	// Remember one very important thing - the key to success lies in your power.
		AI_Output(other,self,"DIA_Xardas_NDM_AboutDarkMagic_01_34");	//Co to znamená?
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_35 " );	// This means that the stronger you are, the easier it will be to bend those creatures to your will.
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_36 " );	// And accordingly they will serve you longer.
		XARDASMENTIONABOUTDEMONOLOG = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Xardas_NDM_AboutDarkMagic_01_38 " );	// I understand. One more thing?
		AI_Output(self,other, " DIA_Xardas_NDM_AboutDarkMagic_01_39 " );	// No, that's all. You will know the rest when you become a dark mage.
	};
};


instance DIA_XARDAS_NDM_ABOUTDEMONOLOG(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_ndm_aboutdemonolog_condition;
	information = dia_xardas_ndm_aboutdemonolog_info;
	permanent = TRUE;
	description = " Tell me more about demons. " ;
};


func int dia_xardas_ndm_aboutdemonolog_condition()
{
	if ((hero.guild ==  GIL_KDM ) && ( XARDASTELLABOUTDEMONOLOGY  ==  TRUE ) && ( XARDASTELLABOUTDEMONOLOGY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_aboutdemonolog_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_AboutDemonolog_01_00 " );	// Tell me more about demons.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_01 " );	// Okay. Demons are a special breed of dark beings and Beliar's most terrifying creation.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_04 " );	// They are the most dangerous monsters that can be found in our world, except for dragons.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_08 " );	// Demons are highly immune to magic and extremely difficult to bend to your will.
	AI_Output(other,self, " DIA_Xardas_NDM_AboutDemonolog_01_09 " );	// Is there a way to solve this?
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_10 " );	// For this purpose, the magic of Darkness developed a separate branch - demonology.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_12 " );	// Studying it gives you the ability to summon these terrible creatures into our world.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_13 " );	// Additionally, knowing demonology will allow you to learn how to create runes to make this easier.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_14 " );	// But you can only use her power once. After that, the rune's power wears off.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_17 " );	// Finally, knowing demonology will allow you to summon higher demons.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_18 " );	// They are orders of magnitude stronger than their normal counterparts, and provide a much greater advantage in combat.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_19 " );	// Bending them to your will will also be much more difficult.
	AI_Output(other,self, " DIA_Xardas_NDM_AboutDemonolog_01_20 " );	// Can you teach me demonology?
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_21 " );	// I can explain the basic principles of demonology and teach you how to create runes to summon these beings.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_22 " );	// Although, you can only master this power when you enter the fourth circle of magic.
	AI_Output(self,other, " DIA_Xardas_NDM_AboutDemonolog_01_23 " );	// Of course, to understand all this knowledge, you will need enough experience.
	XARDASTELLABOUTDEMONOLOG = TRUE;
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ADDON_DMTTEECHER , " Xardas can teach me the art of demonology, the knowledge of which gives me the ability to summon demons. " );
};


instance DIA_XARDAS_NDM_TACHDEMONOLOG (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 997;
	condition = dia_xardas_ndm_teachdemonolog_condition;
	information = dia_xardas_ndm_teachdemenolog_info;
	permanent = TRUE;
	description = " Teach me the art of demonology. " ;
};


func int dia_xardas_ndm_teachdemenolog_condition()
{
	if((hero.guild == GIL_KDM) && (XARDASTELLABOUTDEMONOLOG == TRUE) && ((XARDASTEACHCASTDEMON_SIMPLE == FALSE) || (XARDASTEACHCASTDEMON_LORD == FALSE)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_teachdemolog_info()
{
	AI_Output(other,self, " DIA_Hokurn_Teach_15_00 " );	// Teach me the art of demonology.
	AI_Output(self,other, " DIA_Xardas_NDM_TeachDemonolog_01_01 " );	// If you think you're ready - I'll teach you everything I know.
	Info_ClearChoices(dia_xardas_ndm_teachdemolog);
	Info_AddChoice(dia_xardas_ndm_teachdemolog,Dialog_Back,dia_xardas_ndm_teachdemolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_xardas_ndm_teachdemonolog,b_buildlearnstringfordemonolog( " Démonologie " ,B_GetLearnCostTalent(other, NPC_TALENT_DEMONOLOG , 1 )),dia_xardas_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_xardas_ndm_teachdemonalog,b_buildlearnstringfordemonolog( " Vyšší démonologie " ,B_GetLearnCostTalent(other, NPC_TALENT_DEMONOLOG , 1 )),dia_xardas_ndm_teachdemonalog_high);
	};
};

func void dia_xardas_ndm_teachdemolog_back()
{
	if(XARDASTEACHCASTDEMON_LORD == TRUE)
	{
		AI_Output(self,other, " DIA_Xardas_NDM_TeachDemonolog_BACK_01_00 " );	// It is now within your power to summon the highest demons.
		AI_Output(self,other, " DIA_Xardas_NDM_TeachDemonolog_BACK_01_01 " );	// Be careful! Remember that subduing these beings is incredibly difficult.
		AI_Output(self,other, " DIA_Xardas_NDM_TeachDemonolog_BACK_01_02 " );	// A single mistake means quick death.
	};
	Info_ClearChoices(dia_xardas_ndm_teachdemolog);
};

func void dia_xardas_ndm_teachdemolog_simple()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		XARDASTEACHCASTDEMON_SIMPLE = TRUE;
	};
	Info_ClearChoices(dia_xardas_ndm_teachdemolog);
	Info_AddChoice(dia_xardas_ndm_teachdemolog,Dialog_Back,dia_xardas_ndm_teachdemolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_xardas_ndm_teachdemonolog,b_buildlearnstringfordemonolog( " Démonologie " ,B_GetLearnCostTalent(other, NPC_TALENT_DEMONOLOG , 1 )),dia_xardas_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_xardas_ndm_teachdemonalog,b_buildlearnstringfordemonolog( " Vyšší démonologie " ,B_GetLearnCostTalent(other, NPC_TALENT_DEMONOLOG , 1 )),dia_xardas_ndm_teachdemonalog_high);
	};
};

func void dia_xardas_ndm_teachdemonolog_high()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		AI_Output(self,other, " DIA_Xardas_NDM_TeachDemonolog_High_01_00 " );	// Know the power you have gained and your true power will be revealed!
		XARDASTEACHCASTDEMON_LORD = TRUE;
	};
	Info_ClearChoices(dia_xardas_ndm_teachdemolog);
	Info_AddChoice(dia_xardas_ndm_teachdemolog,Dialog_Back,dia_xardas_ndm_teachdemolog_back);
};


instance DIA_XARDAS_NDM_PROOF(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_proof_condition;
	information = dia_xardas_ndm_proof_info;
	permanent = FALSE;
	description = " How else can I prove myself worthy of being a dark mage? " ;
};


func int dia_xardas_ndm_proof_condition()
{
	if(Npc_KnowsInfo(hero,dia_xardas_ndm_howkdm) && (MIS_BECOMEKDM == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_proof_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_Proof_01_00 " );	// How else can I prove myself worthy of being a dark mage?
	AI_Output(self,other, " DIA_Xardas_NDM_Proof_01_01 " );	// Only the strength of your spirit can make you worthy of this honor.
	AI_Output(self,other, " DIA_Xardas_NDM_Proof_01_02 " );	// Besides, I don't need to find out what you can do.
	AI_Output(self,other, " DIA_Xardas_NDM_Proof_01_03 " );	// You already proved it.
};


instance DIA_XARDAS_NDM_TASKS(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_condition;
	information = dia_xardas_ndm_tasks_info;
	permanent = FALSE;
	description = " Do you have a job for me? " ;
};


func int dia_xardas_ndm_tasks_condition()
{
	if ((hero.guild ==  GIL_KDM ) || (Npc_KnowsInfo(hero,dia_xardas_ndm_howkdm) && ( MY_BECOMEDM  == LOG_Running)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_01_00 " );	// Do you have a job for me?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_01_01 " );	// Hmmm... Since you're my apprentice now, I've got some really simple tasks for you.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_01_02 " );	// But you have to remember that the most important thing is the threat from the dragons. That is our main task.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_01_03 " );	// Ok, now for the task itself...
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_01_04 " );	// For my experiments, I need a large number of different ingredients, most of which I simply cannot buy on the market.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_01_05 " );	// I don't have enough free time to look for them myself. I want you to bring me these ingredients.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_01_06 " );	// As a necromancer, I'm most interested in human remains - flesh from corpses, bones and skulls. The latter is particularly valuable.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_01_07 " );	// But dearest to me is the heart of a demon! It will be hard to get.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_01_08 " );	// If you come across any of this, feel free to bring it to me.
	XARDASTASKSBEGUN = TRUE;
	XARDASBUYBONES = TRUE;
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ADDON_DMTTEECHER , " Xardas needs ingredients for his experiments. Basically, he is interested in human remains - flesh from corpses, bones, skulls and hearts of demons. " );
};


DIA_XARDAS_BUYBONES (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 600;
	condition = dia_xardas_buybones_condition;
	information = dia_xardas_buybones_info;
	permanent = TRUE;
	description = " I'm carrying some human remains as you wanted... " ;
};


func int dia_xardas_buybones_condition()
{
	if(XARDASBUYBONES == TRUE)
	{
		if ((Npc_HasItems(hero,ItMi_Skull) >  0 ) || (Npc_HasItems(hero,ItMi_Plazma) >  0 ) || (Npc_HasItems(hero,ItAt_GoblinBone) >  0 ) || (Npc_HasItems(hero,ItAt_SkeletonBone) >  0 ) || (Npc_HasItems(hero,itmi_zombiecorpse) >  0 ) || (Npc_HasItems(hero,ItAt_DemonHeart) >  0 ))
		{
			return TRUE;
		};
	};
};

func void dia_xardas_buybones_info()
{
	var int countexp;
	var int goldplus;
	AI_Output(other,self, " DIA_Xardas_BuyBones_01_00 " );	// I'm carrying some human remains like you wanted...
	AI_Output(self,other, " DIA_Xardas_BuyBones_01_01 " );	// Excellent! So let's take a look at them.

	if(Npc_HasItems(other,ItAt_GoblinBone) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,ItAt_GoblinBone);
		B_GiveInvItems(other,self,ItAt_GoblinBone,Npc_HasItems(other,ItAt_GoblinBone));
		Npc_RemoveInvItems(self,ItAt_GoblinBone,Npc_HasItems(self,ItAt_GoblinBone));
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_02 " );	// Hmm... they seem to be goblin bones.
		AI_Output(other,self, " DIA_Xardas_BuyBones_01_03 " );	// Are they useful to you?
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_04 " );	// Sure. Although it's not exactly what I expected.
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 6);
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_08 " );	// What else did you bring me?
	};
	if(Npc_HasItems(other,ItAt_SkeletonBone) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,ItAt_SkeletonBone);
		B_GiveInvItems(other,self,ItAt_SkeletonBone,Npc_HasItems(other,ItAt_SkeletonBone));
		Npc_RemoveInvItems(self,ItAt_SkeletonBone,Npc_HasItems(self,ItAt_SkeletonBone));
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_09 " );	// So... it looks like it's skeleton bones. Well!
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_10 " );	// Although you could have brought a little more.
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_12 " );	// Ok, I think that's enough for now.
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 8);
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_16 " );	// Something else?
	};
	if(Npc_HasItems(other,itmi_zombiecorpse) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,itmi_zombiecorpse);
		B_GiveInvItems(other,self,itmi_zombiecorpse,Npc_HasItems(other,itmi_zombiecorpse));
		Npc_RemoveInvItems(self,itmi_zombiecorpse,Npc_HasItems(self,itmi_zombiecorpse));
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_33 " );	// Corpse meat - a very valuable ingredient.
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 15);
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_36 " );	// What else do you have here?
	};
	if(Npc_HasItems(other,ItMi_Plazma) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,ItMi_Plazma);
		B_GiveInvItems(other,self,ItMi_Plazma,Npc_HasItems(other,ItMi_Plazma));
		Npc_RemoveInvItems(self,ItMi_Plazma,Npc_HasItems(self,ItMi_Plazma));
		AI_Output(other,self, " DIA_Xardas_HarmUndead_Done_01_01 " );	// I brought you ectoplasm.
		AI_Output(self,other, " DIA_Xardas_HarmUndead_Done_01_02 " );	// Good, good... very good!
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 50);
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_08 " );	// What else did you bring me?
	};
	if(Npc_HasItems(other,ItMi_Skull) > 0)
	{
		AI_Wait(self,1);
		goldplus = Npc_HasItems(other,ItMi_Skull);
		B_GiveInvItems(other,self,ItMi_Skull,Npc_HasItems(other,ItMi_Skull));
		Npc_RemoveInvItems(self,ItMi_Skull,Npc_HasItems(self,ItMi_Skull));
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_17 " );	// Hmmm... I see your search was not in vain. Skull is a relatively rare ingredient.
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_19 " );	// Your efforts will be rewarded.
		B_GiveInvItems(self,other,ItMi_Gold,goldplus * 250);
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_21 " );	// What else do you have?
	};
	if(Npc_HasItems(other,ItAt_DemonHeart) > 0)
	{
		AI_Wait(self,1);
		GOLDPLUSDEM = Npc_HasItems(other,ItAt_DemonHeart);
		B_GiveInvItems(other,self,ItAt_DemonHeart,Npc_HasItems(other,ItAt_DemonHeart));
		Npc_RemoveInvItems(self,ItAt_DemonHeart,Npc_HasItems(self,ItAt_DemonHeart));
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_22 " );	// Unbelievable!
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_25 " );	// The demon heart is the most valuable thing you could have brought me.
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_26 " );	// That deserves a better reward than gold!
		AI_Output(self,other,"DIA_Xardas_BuyBones_01_27");	//Vyber si...
		Info_ClearChoices(dia_xardas_buybones);
		Info_AddChoice(dia_xardas_buybones, " I want to increase mana. " ,dia_xardas_buybones_mana);
		Info_AddChoice(dia_xardas_buybones, " I want to increase life energy. " ,dia_xardas_buybones_life);
		Info_AddChoice(dia_xardas_buybones, " I'll settle for gold. " ,dia_xardas_buybones_gold);
	}
	else
	{
		if(countexp > 0)
		{
			B_GivePlayerXP(countexp);
		};
		AI_Output(other,self, " DIA_Xardas_BuyBones_01_28 " );	// That's all.
		AI_Output(self,other, " DIA_Xardas_BuyBones_01_29 " );	// Okay. Come back when you find something again.
	};
};

func void dia_xardas_buybones_mana()
{
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,GOLDPLUSDEM * 2);
	AI_Output(other,self, " DIA_Xardas_BuyBones_Mana_01_00 " );	// As you wish.
	Info_ClearChoices(dia_xardas_buybones);
};

func void dia_xardas_buybones_life()
{
	B_RaiseAttribute_Bonus(other,ATR_HITPOINTS_MAX,GOLDPLUSDEM * 5);
	AI_Output(other,self,"DIA_Xardas_BuyBones_Life_01_00");	//Jak si přeješ.
	Info_ClearChoices(dia_xardas_buybones);
};

func void dia_xardas_buybones_gold()
{
	B_GiveInvItems(self,other,ItMi_Gold,GOLDPLUSDEM * 300);
	AI_Output(other,self,"DIA_Xardas_BuyBones_Gold_01_00");	//Jak si přeješ.
	Info_ClearChoices(dia_xardas_buybones);
};


instance DIA_XARDAS_NDM_TASKS_ONE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_condition;
	information = dia_xardas_ndm_tasks_one_info;
	permanent = FALSE;
	description = " Is there any work for me? " ;
};


func int dia_xardas_ndm_tasks_one_condition()
{
	if(XARDASTASKSBEGUN == TRUE)
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_01_00 " );	// There is no work for me?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_01 " );	// Surely you remember that I was a Fire Mage!
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_01_02 " );	// Yeah, you already talked about it in the colony.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_03 " );	// In those days, as a servant of Innos, I was engaged in researching magic.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_04 " );	// I got a lot of achievements, but I didn't have time to finish it.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_05 " );	// When I then left the order, all the records associated with these experiments remained in the monastery. Now I regret it very much.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_01_06");	//Proč sis je nevzal?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_07 " );	// Didn't know I'd need them now.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_08 " );	// I want to take these records back! Go to the monastery and take them from there.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_01_09 " );	// Ok, I'll give it a try.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_10 " );	// You try none - you just do it... (seriously)
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_01_11 " );	// And where exactly should I look for them?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_12 " );	// Some documents were stored in the monastery library. It won't be easy to get there - the Fire mages have the keys to it.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_13 " );	// But I'm sure you'll figure something out.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_14 " );	// The second part of the record must be gathering dust in my old room. I still have the key with me - here, take it.
	B_GiveInvItems(self,other,ItKe_KDFPlayer,1);
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_01_15 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_16 " );	// I think so. Pyrokar and the other mages believed that these studies were just a waste of time.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_17 " );	// For them, these documents never had any special value. And it is unlikely that anything has changed since then.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_01_18 " );	// Okay, go get me the papers.
	Mob_CreateItems("BOOKSHELF_CONT_7",itwr_xardasdocs_2,1);
	Mob_CreateItems("BOOKSHELF_CONT_10",itwr_xardasdocs_1,1);
	MIS_XARDASNDMTASKSONE = LOG_Running;
	Log_CreateTopic(TOPIC_XARDASNDMTASKSONE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSONE,LOG_Running);
	B_LogEntry( TOPIC_XARDASNDMTASKSONE , " Xardas told me to retrieve the ancient manuscripts that are stored in the Fire Mages Monastery. It seems that some of these documents should be in the library and others in his old chamber. " );
};


instance DIA_XARDAS_NDM_TASKS_ONE_DONE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_done_condition;
	information = dia_xardas_ndm_tasks_one_done_info;
	permanent = FALSE;
	description = " I brought your manuscripts. " ;
};


func int dia_xardas_ndm_tasks_one_done_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (Npc_HasItems(hero,itwr_xardasdocs_1) >= 1) && (Npc_HasItems(hero,itwr_xardasdocs_2) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_done_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Done_01_00 " );	// I brought your manuscripts.
	b_giveinvitemsmanythings(other,self);
	Npc_RemoveInvItems(other,itwr_xardasdocs_1,1);
	Npc_RemoveInvItems(other,itwr_xardasdocs_2,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Done_01_01 " );	// Yes, it really is them.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Done_01_02 " );	// What are you going to do with them now?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Done_01_03 " );	// I'm looking for something and these papers will help me a lot.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Done_01_04 " );	// What is written in them?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Done_01_05 " );	// (angrily) You're too curious! And then - I don't think you would be able to fully understand the essence of my research.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_06");	//Zkus to.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Done_01_07 " );	// Oh you smartass! Hmm... Well... These manuscripts contain the approximate formula for a complex magic spell I wrote many years ago.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Done_01_08");	//A co je to za kouzlo?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Done_01_09 " );	// The spell is similar to the one we used to transfer the magic ore energy to Uriziel before you fought the Sleeper.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Done_01_10 " );	// Ah! I'm starting to understand.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Done_01_11 " );	// Yes, but this time the spell is slightly different. It will allow you to transfer all the magical power of any creature.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Done_01_12 " );	// But why do you need it?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Done_01_13 " );	// (angrily) But that's none of your business! And I think you have too many questions!
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Done_01_14 " );	// I'm just curious.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Done_01_15 " );	// Sure! But now you should worry about something else.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Done_01_16 " );	// And here we go again - I haven't forgotten about dragons yet! (angry)
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Done_01_17 " );	// Why are you bothering me with your endless questions? You'd better go and see for yourself.
	MANUSCRIPTS1 = TRUE ;
	HARDASTIMERBENDM = Wld_GetDay();
	B_LogEntry( TOPIC_XARDASNDMTASKSONE , " I brought Xardas his old records. " );
};

instance DIA_XARDAS_NDM_TASKS_ONE_NEW(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_new_condition;
	information = dia_xardas_ndm_tasks_one_new_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_xardas_ndm_tasks_one_new_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (RUKOPISI1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_new_info()
{
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_New_01_01 " );	// (angry) Wait!
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_New_01_02");	//Co se děje?
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_New_01_03 " );	// The second part of the manuscript you brought me is actually nothing more than a cheap forgery! It's weird that I didn't notice it right away.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_New_01_04");	//Jak je to možné?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_New_01_05 " );	// I don't know and I don't care. The only thing I'm interested in right now is my original manuscript, which I don't have now.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_New_01_06 " );	// How do we find him now?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_New_01_07 " );	// Hmmm... I'm sure one of those overly curious Fire mages took it!
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_New_01_08 " );	// I doubt any of those hypocrites will admit to being interested in forbidden knowledge. But there is nothing left but to ask them.
	RUK3 = TRUE;
	B_LogEntry( TOPIC_XARDASNDMTASKSONE , " The second part of the manuscripts turned out to be fake. Now I have to find the original. Xardas is convinced that only Fire mages can know about it. " );
	AI_StopProcessInfos(self);
};

instance DIA_XARDAS_NDM_TASKS_ONE_NEW1(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_new1_condition;
	information = dia_xardas_ndm_tasks_one_new1_info;
	permanent = FALSE;
	description = " I found the original manuscript. " ;
};

func int dia_xardas_ndm_tasks_one_new1_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (Npc_HasItems(hero,itwr_xardasdocs_3) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_new1_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_New_01_09 " );	// Found the original manuscript.
	B_GiveInvItems(other,self,itwr_xardasdocs_3,1);
	Npc_RemoveInvItems(self,itwr_xardasdocs_3,1);
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_10");	//A kde?
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_New_01_11 " );	// A Fire mage named Trevius had it. Unfortunately he is dead.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_One_New_01_12");	//Zabil jsi ho?
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_New_01_13 " );	// Of course not! I found him in a cave and in his body was a real demon.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_New_01_14 " );	// Everything is clear to me now! (mockingly) This is what happens when you poke your nose into other people's secrets!
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_New_01_15 " );	// Not so important anymore. The manuscript has been returned to me and I can continue my research.
	B_GiveInvItems(self,hero,ItMi_Gold,1000);
	MIS_XARDASNDMTASKSONE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSONE,LOG_SUCCESS);
	B_LogEntry( TOPIC_XARDASNDMTASKSONE , " I brought Xardas the original part of the manuscript. " );
};

instance DIA_XARDAS_NDM_TASKS_ONE_TWO(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_two_condition;
	information = dia_xardas_ndm_tasks_one_two_info;
	permanent = TRUE;
	description = " Do you have any other tasks for me? " ;
};

func int dia_xardas_ndm_tasks_one_two_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_SUCCESS) && (MIS_XARDASNDMTASKSTWO == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_two_info()
{
	where int daynow;

	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Two_01_00 " );	// Do you have any other tasks for me?

	if (( XARDASTIMERBENDM  <= (daynow -  1 )) &&  ! Npc_IsDead(vlk_6027_taliasan))
	{
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_01 " );	// Yes, just in time! The other day I looked at the records you brought me from the monastery.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_02 " );	// Of course it helped me in my research, but it also brought to the surface even more questions that I don't know the answer to.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_03 " );	// I think to solve them, but I'll need one more thing. Or more. However, I don't know exactly where to start.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_Two_01_04");	//S čím?
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_05 " );	// I am interested in a rather rare book known as 'The Vain Journey'.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_06 " );	// If I remember correctly, it was owned by a mage whose name I have already forgotten.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_07 " );	// However, I know he won't just give me the treasure. I wanted to get it once before, but he didn't sell it.
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Two_01_08 " );	// Where should I look for it?
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_09 " );	// If I had known, I wouldn't have asked you for help.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_10 " );	// I would send one of my magical servants...
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Two_01_11 " );	// That's similar to you. Is there anything else you know about him?
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_12 " );	// All I know is that before I met him, he served as a town mage in Khorinis.
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_Two_01_13 " );	// Good. I will try to find him and get the book.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_14 " );	// Yes, try. In the end, I'm not so disappointed that I took you on as an apprentice.
		MIS_XARDASNDMTASKSTWO = LOG_Running;
		Log_CreateTopic(TOPIC_XARDASNDMTASKSTWO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_XARDASNDMTASKSTWO,LOG_Running);
		if(TALIASANTELLWHOMAGE == TRUE)
		{
			B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Now Xardas wants me to get him a book called 'The Vain Journey'... According to what he said, the last owner lives in Khorinis and was a city mage. Could it be Gallahad? " );
		}
		else
		{
			B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Now Xardas wants me to get him a book called 'The Vain Journey'. The last owner is said to live in Khorinis and was a town mage. I should try to find him. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_Two_01_28 " );	// Not yet. Maybe later.
	};
};


instance DIA_XARDAS_NDM_TASKS_ONE_TWODONEKILL(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_one_twodonekill_condition;
	information = dia_xardas_ndm_tasks_one_twodonekill_info;
	permanent = FALSE;
	description = " I found the mage. " ;
};


func int dia_xardas_ndm_tasks_one_twodonekill_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && !Npc_IsDead(vlk_6027_taliasan) && (XARDASBRIGBOOKSPECIAL == FALSE) && ((XARDASMISSBOOKFOREVER == TRUE) || (XARDASMISSBOOK == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_one_twodonekill_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_01 " );	// I found the mage. It was Gallahad.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_02 " );	// Oh yes. I remember now. where is he now
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_03 " );	// He lives in the city.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_04 " );	// And did you bring that book?
	TELLABOUTGALLAHAD = TRUE;
	if(XARDASMISSBOOKFOREVER == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_05");	//Ne.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_06 " );	// Why not? (seriously)
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_07 " );	// Gallahad said he sold her to a merchant a long time ago.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_08 " );	// What?! And you believed him?!
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_09");	//Nó...
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_10 " );	// Crazy! He tricked you! Only a fool will sell his knowledge for money!
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_11 " );	// Gallahad is a mage, albeit a useless one! To each of us, the secrets of magic are more important than the dull glitter of contemptible metal. He would never do that!
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_12 " );	// What should I do now?
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_13 " );	// You? Nothing... I'll send some of my demons to that worm. I think they can convince him to give me the book.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_14 " );	// For now, you can do more urgent things. But be prepared, I still need your services.
		MIS_XARDASNDMTASKSTWO = LOG_FAILED;
		XARDASTIMERQUEST = Wld_GetDay();
		B_LogEntry_Failed(TOPIC_XARDASNDMTASKSTWO);
		B_KillNpc(vlk_6027_taliasan);
	}
	else if(XARDASMISSBOOK == TRUE)
	{
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_15 " );	// Gallahad has it, but he wouldn't give it to me.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_16 " );	// Worse for him! We'll see what he says when I send some demons to him.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_17 " );	// I think they can convince him to give me the book.
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_18 " );	// Isn't that a bit of a drastic measure?
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_01_19 " );	// Do you want to tutor me?! (angry)
		Info_ClearChoices(dia_xardas_ndm_tasks_one_twodonekill);
		Info_AddChoice(dia_xardas_ndm_tasks_one_twodonekill, " Not at all! Do as you think. " ,dia_xardas_ndm_tasks_one_twodonekill_killgalah);
		Info_AddChoice(dia_xardas_ndm_tasks_one_twodonekill, " I just think I can handle it myself. " ,dia_xardas_ndm_tasks_one_twodonekill_dontworry);
	};
};

func void dia_xardas_ndm_tasks_one_twodonekill_killgalah()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_KillGalah_01_01 " );	// Not at all! Do as you wish.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_KillGalah_01_02 " );	// (maliciously) Anyway.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_KillGalah_01_03 " );	// For now, you can do more urgent things. But be prepared, I still need your services.
	B_KillNpc(vlk_6027_taliasan);
	MIS_XARDASNDMTASKSTWO = LOG_SUCCESS;
	XARDASTIMERQUEST = Wld_GetDay();
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSTWO,LOG_SUCCESS);
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Xardas wants to deal with it himself - or rather, he sends demons to bring her to him. Gallahad seems to be finished. " );
	Info_ClearChoices(dia_xardas_ndm_tasks_one_twodonekill);
};

func void dia_xardas_ndm_tasks_one_twodonekill_dontworry()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_DontWorry_01_01 " );	// I just think I can work it out myself.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_DontWorry_01_02 " );	// Are you sure about this?
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_DontWorry_01_03 " );	// Of course. I don't think Gallahad deserves such a fate.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_One_TwoDoneKill_DontWorry_01_04 " );	// Okay. But if you don't bring her, I'll send demons there.
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " I told Xardas about my conversation with Gallahad. Xardas wanted to send demons to Gallahad, but I told him I would arrange it myself. I have to bring the book. " );
	Info_ClearChoices(dia_xardas_ndm_tasks_one_twodonekill);
};


instance DIA_XARDAS_NDM_TASKS_TWO_DONE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_two_done_condition;
	information = dia_xardas_ndm_tasks_two_done_info;
	permanent = FALSE;
	description = " I have a book here. " ;
};


func int dia_xardas_ndm_tasks_two_done_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (Npc_HasItems(hero,itwr_umsonst_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_two_done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_Done_01_01");	//Mám tu knihu.
	B_GiveInvItems(other,self,itwr_umsonst_01, 1 );
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Two_Done_01_02 " );	// (angry) I thought so - several pages are missing!
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Two_Done_01_03 " );	// But it's not your fault. I should have expected it.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_Done_01_04");	//A co dál?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Two_Done_01_05 " );	// Hmmm... I hope this doesn't get in the way of my experiment.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Two_Done_01_06 " );	// I need to study everything written here. You can go your own way.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Two_Done_01_07 " );	// But be prepared, I still need your services.
	MIS_XARDASNDMTASKSTWO = LOG_SUCCESS;
	XARDASTIMERQUEST = Wld_GetDay();
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSTWO,LOG_SUCCESS);
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " I brought Xardas that book. Some pages are missing, but he doesn't mind so far. " );
};


instance DIA_XARDAS_NDM_TASKS_TWO_DONEDEAD(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_two_donedead_condition;
	information = dia_xardas_ndm_tasks_two_donedead_info;
	permanent = FALSE;
	description = " That mage is dead! " ;
};


func int dia_xardas_ndm_tasks_two_donedead_condition()
{
	if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (TALIASANISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_two_donedead_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_01");	//Ten mág je mrtev!
	if(TELLABOUTGALLAHAD == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_02");	//Myslíš Gallahada?!
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_03");	//Ano, někdo ho zabil!
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_04");	//Který mág?
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_Two_DoneDead_01_05 " );	// The mage who had the book - Gallahad.
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_Two_DoneDead_01_06 " );	// Lived in the port area of ​​Khorinis. Looks like someone killed the poor guy.
	};
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_07");	//Dobře. A kniha?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_08");	//Tu u sebe neměl.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Two_DoneDead_01_09 " );	// Hmmm... Are you sure?
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Two_DoneDead_01_10");	//Absolutně!
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Two_DoneDead_01_11 " );	// Hmmm, he probably has it well hidden.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Two_DoneDead_01_12 " );	// I'll send some servants to find her.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Two_DoneDead_01_13 " );	// You can go. But be prepared, I still need your services.
	MIS_XARDASNDMTASKSTWO = LOG_SUCCESS;
	XARDASTIMERQUEST = Wld_GetDay();
	Log_SetTopicStatus(TOPIC_XARDASNDMTASKSTWO,LOG_SUCCESS);
	B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " I brought news to Xardas of Gallahad's death and that the book was not there. Gallahad probably has it well hidden, so Xardas decided to send his servants to find it. " );
};

instance DIA_XARDAS_NDM_TASKS_FOUR(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_four_condition;
	information = dia_xardas_ndm_tasks_four_info;
	permanent = FALSE;
	description = " Do you need my help? " ;
};


func int dia_xardas_ndm_tasks_four_condition()
{
	where int daynow;
	daynow = Wld_GetDay();

	if((MIS_XARDASNDMTASKSTWO == LOG_SUCCESS) && (XARDASTIMERQUEST <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_four_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_Four_01_00 " );	// Do you need my help?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_01 " );	// (gloomily) Yes. Listen carefully. It will be much more complicated than what you did before.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_02 " );	// So... The other day I looked again at those records you brought me from the monastery.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_03 " );	// And after much thought, I've come to the conclusion that I'll need one more thing to complete the research.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_Four_01_04");	//Jakou?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_05 " );	// It's a thing that almost every necromancer wants - the Necronomicon.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_06 " );	// Ever heard of this artifact?
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_Four_01_07 " );	// Honestly - no.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_08 " );	// I thought so. Few people know about its existence. So better for me.!
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_09 " );	// Also, I don't know much about this artifact. But my knowledge is enough to get this treasure.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_Four_01_10 " );	// Do you know where to look for him?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_11 " );	// That's not what I said. But I know someone who can help us with that.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_12 " );	// His name is Nergal. He was one of the most powerful necromancers of his time and the last master of the Necronomicon.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_13 " );	// Unfortunately, Nergal's soul has long since entered the shadow world. Finding out in whose hands the Nekronomicon is now will not be so easy.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_Four_01_14 " );	// What are you planning to do?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_15 " );	// The knowledge of the dark runes of the nectormans will help me bring Nergal's spirit to this world, but I will need your help.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_Four_01_16 " );	// What should I do?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_17 " );	// (serious) Somewhere in the eastern part of this valley is the necromancer's old tower. Your path leads somewhere there.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_18 " );	// I don't know exactly what awaits you there, but I think you'll understand everything when you get there.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_Four_01_19 " );	// Well, that shouldn't be a problem.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_Four_01_20 " );	// Maybe. (sarcastically) But as far as I know, the entrance to this tower is closed. You'll have to figure out how to get there.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_Four_01_21 " );	// Well, of course, I don't even know what I expected.
	MIS_XARDASTASKSFOUR = LOG_Running;
	Log_CreateTopic(TOPIC_XARDASTASKSFOUR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDASTASKSFOUR,LOG_Running);
	B_LogEntry( TOPIC_XARDASTASKSFOUR , " Xardas gave me a task: to retrieve the oldest tome on the art of Dark magic - the Nekronomikon. It was once owned by the powerful necromancer Nergal, and apparently he is the only one who knows where this artifact is now. " );
	Log_AddEntry( TOPIC_XARDASTASKSFOUR , " First I have to go to Nergal's old tower. I will find out what awaits me there. But the problem is that the entrance to the tower is closed and there is no way to get there. Who can help me with this ? " );
};


instance DIA_XARDAS_NDM_TASKS_FOURPROGRESS(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_fourprogress_condition;
	information = dia_xardas_ndm_tasks_fourprogress_info;
	permanent = FALSE;
	description = " I visited Nergal's tower. " ;
};


func int dia_xardas_ndm_tasks_fourprogress_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (Npc_HasItems(hero,itmi_nergalcorpse) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_fourprogress_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourProgress_01_00 " );	// I visited Nergal's tower.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgress_01_01 " );	// (admiringly) Did you succeed? Well, you see, I knew why I entrusted it to you.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgress_01_02 " );	// What did you find out?
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourProgress_01_03 " );	// Nothing interesting. But I did find something.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgress_01_04");	//A co je to?
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourProgress_01_05 " );	// I think you'd better watch it yourself.
	B_GiveInvItems(other,self,itmi_nergalcorpse,1);
	Npc_RemoveInvItems(self,itmi_nergalcorpse,1);
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgress_01_06 " );	// Excellent! This is exactly what I needed.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgress_01_07 " );	// Now nothing prevents me from bringing Nergal's soul into this world. I will finally learn the secrets of the Necronomicon!
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourProgress_01_08 " );	// What should I do?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgress_01_09 " );	// Nothing yet. You can do whatever you want.
	B_LogEntry( TOPIC_XARDASTASKSFOUR , " I brought Xardas the dead body of a once-powerful necromancer. Now he can perform a ritual to summon the soul of Nergal to learn the secrets of the Necronomicon. " );
	RITUALNERGALTIMER = Wld_GetDay();
};


instance DIA_XARDAS_NDM_TASKS_FOURPROGRESSTWO(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_fourprogresstwo_condition;
	information = dia_xardas_ndm_tasks_fourprogresstwo_info;
	permanent = FALSE;
	description = " When will you be able to perform the ritual? " ;
};


func int dia_xardas_ndm_tasks_fourprogresstwo_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALTIMER > (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_fourprogresstwo_info()
{
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourProgressTwo_01_00 " );	// When will you be able to perform the ritual?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgressTwo_01_01 " );	// (thinking) I can't say exactly yet. Summoning a soul is an extremely difficult matter in itself.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgressTwo_01_02 " );	// And if it's a mage as powerful as Nergal, then it's deadly dangerous.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgressTwo_01_03 " );	// Haste is highly undesirable. We need to think over every detail, any mistake could cost us our lives.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgressTwo_01_04 " );	// By the way... (sincerely) Why do you ask that?
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourProgressTwo_01_05 " );	// I would like to participate in that ritual. You do not mind?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourProgressTwo_01_06 " );	// Hmmm... I really need some helpers for this ritual.
	AI_Output(self,other,"DIA_Xardas_NDM_Tasks_FourProgressTwo_01_07");	//Takže ne - nevadí.
	RITUALNERGALPREPARE = TRUE;
	B_LogEntry( TOPIC_XARDASTASKSFOUR , " Xardas agreed to my participation in the ritual of summoning the soul of the necromancer Nergal. " );
};


instance DIA_XARDAS_NDM_TASKS_FOURRITUALREADY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ndm_tasks_fourritualready_condition;
	information = dia_xardas_ndm_tasks_fourritualready_info;
	permanent = TRUE;
	description = " Is everything ready for the ritual? " ;
};


func int dia_xardas_ndm_tasks_fourritualready_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALPREPARE == TRUE) && (RITUALNERGALREADY == FALSE))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_fourritualready_info()
{
	where int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_00 " );	// Is everything ready for the ritual?
	if(RITUALNERGALTIMER <= (daynow - 2))
	{
		B_GivePlayerXP(500);
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_01 " );	// Yes, everything is ready. We can begin.
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_02 " );	// What should I do?
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_03 " );	// Listen carefully. As you must have noticed, there is a magical pentagram on the floor next to you.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_04 " );	// You stand on the point of the star that will be to my left and do not move from that spot until I say.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_05 " );	// In other words, don't cross the pentagram itself. This is very important!
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourRitualReady_01_06");	//Proč?
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_07 " );	// During the ritual, everyone who participates in it forms a certain magical barrier.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_08 " );	// When Nergal's soul enters this world, this barrier will protect us from his madness.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_09 " );	// So try to take it seriously.
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_10 " );	// I understood everything.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_11 " );	// So let's not waste time - let's start the ritual.
		B_LogEntry( TOPIC_XARDASTASKSFOUR , " Everything is ready for Xardas to perform the ritual. " );
		Info_ClearChoices(dia_xardas_ndm_tasks_fourritualready);
		Info_AddChoice(dia_xardas_ndm_tasks_fourritualready, " I'm ready. " ,dia_xardas_ndm_tasks_fourritualready_ok);
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_01_12 " );	// (screams) Not yet! Come back later!
	};
};

func void dia_xardas_ndm_tasks_fourritualready_ok()
{
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourRitualReady_Ok_01_01 " );	// I'm ready.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourRitualReady_Ok_01_02 " );	// Excellent. Remember what I told you and everything will be fine.
	RITUALNERGALREADY = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitForPlayerRitual");
	PC_Psionic.aivar[AIV_EnemyOverride] = TRUE;

	if(LesterGoXar == TRUE)
	{
		B_StartOtherRoutine(PC_Psionic,"Nergal");
	};
};


instance DIA_XARDAS_RITUALPREPAREHURRY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ritualpreparehurry_condition;
	information = dia_xardas_ritualpreparehurry_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_xardas_ritualpreparehurry_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALREADY == TRUE) && (XARDASFINISHRITUALBEGAN == FALSE) && Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(hero,"NW_XARDAS_RITUAL_04") >= 150))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualpreparehurry_info()
{
	AI_Output(self,other, " DIA_Xardas_RitualPrepareHurry_01_01 " );	// (bluntly) What are you waiting for? Stand at the end of the pentagram to my left and we will begin the ritual.
	AI_Output(other,self, " DIA_Xardas_RitualPrepareHurry_01_02 " );	// I'm going now.
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_RITUALPREPARE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ritualprepare_condition;
	information = dia_xardas_ritualprepare_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_ritualprepare_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALREADY == TRUE) && (Npc_GetDistToWP(hero,"NW_XARDAS_RITUAL_04") < 100) && (Npc_GetDistToWP(self,"NW_XARDAS_RITUAL_00") < 100))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualprepare_info()
{
	AI_Output(self,other, " DIA_Xardas_RitualPrepare_01_01 " );	// So let's get started. And remember - don't cross the pentagram!
	AI_Output(other,self, " DIA_Xardas_RitualPrepare_01_02 " );	// I understand. Let's start now.
	AI_Output(self,other,"DIA_Xardas_RitualPrepare_01_03");	//Dobře.
	AI_StopProcessInfos(self);
	XARDASFINISHRITUALBEGAN = TRUE;
	Npc_ExchangeRoutine(self,"XardasRitual");
	self.name[0] = "";
};


instances of DIA_XARDAS_RITUALDONE (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ritualdone_condition;
	information = dia_xardas_ritualdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_ritualdone_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (XARDASFINISHRITUALOK == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualdone_info()
{
	self.name[0] = "Xardas";
	B_GivePlayerXP(1000);
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_01 " );	// (powerfully) It's over - the ritual is over!
	AI_Output(other,self, " DIA_Xardas_RitualDone_01_02 " );	// What did you learn?
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_03 " );	// Enough to get my hands on the Necronomicon already.
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_04 " );	// Hmmm. This necromancer was stronger than I thought. It was difficult to get the truth out of him.
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_05 " );	// But it's over now. All that remains is to go for the Nekronomikon.
	AI_Output(other,self, " DIA_Xardas_RitualDone_01_06 " );	// And where does he find it?
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_07 " );	// Very close. On the west coast of the island stands the dark fortress of Acheron.
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_08 " );	// This is a huge black tower with tall pointed spikes. Maybe you've seen her before.
	AI_Output(other,self, " DIA_Xardas_RitualDone_01_09 " );	// It reminds me of something...
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_10 " );	// So there, at the very top of this monolith, Nergal hid the Necronomicon.
	AI_Output(other,self, " DIA_Xardas_RitualDone_01_11 " );	// You didn't know about it?
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_12 " );	// I suspected it but couldn't verify it. The entrance to the tower was guarded by an immortal creature spawned by Darkness itself.
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_13 " );	// I didn't know how to deal with him then. But now, after meeting Nergal, everything has changed.
	AI_Output(other,self, " DIA_Xardas_RitualDone_01_14 " );	// Then you should go back there.
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_15 " );	// (imperious) Not me, but you! I am too busy with other pressing matters right now.
	AI_Output(other,self, " DIA_Xardas_RitualDone_01_16 " );	// Okay, okay. And how can I defeat this immortal creature?
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_17 " );	// It's very simple. His weakness is his opposite!
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_18 " );	// Since this creature was spawned by the magic of Darkness, it can be destroyed by magical light!
	AI_Output(other,self, " DIA_Xardas_RitualDone_01_19 " );	// Yes, really simple.
	AI_Output(self,other, " DIA_Xardas_RitualDone_01_20 " );	// So do it. Go get me the Necronomicon!
	XARDASTELLMEOSTA = TRUE ;
	B_LogEntry( TOPIC_XARDASTASKSFOUR , " The ritual of summoning the necromancer Nergal is over, and now we know where to look for the Necronomicon. It is located on top of a dark tower on the west coast of the island. The entrance to the tower is guarded by an immortal being created by Darkness itself. But it is not difficult to deal with - this creature can be killed by magical light. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Xar");
	PC_Psionic.aivar[AIV_EnemyOverride] = FALSE ;

	if(LesterGoXar == TRUE)
	{
		B_StartOtherRoutine(PC_Psionic,"Xardas");	
	};
};


instance DIA_XARDAS_RITUALFAIL (C_Info);
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_ritualfail_condition;
	information = dia_xardas_ritualfail_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_ritualfail_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (XARDASRITUALFAIL == TRUE) && (NERGALISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualfail_info()
{
	self.name[0] = "Xardas";
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Xardas_RitualFail_01_01 " );	// (angry) Crazy! What have you done?!
	AI_Output(self,other, " DIA_Xardas_RitualFail_01_02 " );	// I told you don't you dare enter the pentagram!
	AI_Output(self,other, " DIA_Xardas_RitualFail_01_03 " );	// Now, because of your stupidity, we'll never know the secrets of the Necronomicon!
	AI_Output(other,self, " DIA_Xardas_RitualFail_01_04 " );	// Don't worry! I know where to find him.
	AI_Output(self,other, " DIA_Xardas_RitualFail_01_05 " );	// What? What are you talking about?
	AI_Output(self,other, " DIA_Xardas_RitualFail_01_06 " );	// Nergal's soul is dead! Only he could tell us about it...
	AI_Output(other,self, " DIA_Xardas_RitualFail_01_08 " );	// Before he tried to kill me, Nergal told me the secret and told me how to get the artifact you're so interested in.
	AI_Output(self,other, " DIA_Xardas_RitualFail_01_09 " );	// But that's not possible! Why would Nergal do that?
	AI_Output(other,self, " DIA_Xardas_RitualFail_01_10 " );	// I have no idea. Is it so important now?
	AI_Output(self,other, " DIA_Xardas_RitualFail_01_11 " );	// Hmmm... Well, if you really know how to get the Nekronomikon - then go ahead and bring it to me!
	AI_Output(self,other, " DIA_Xardas_RitualFail_01_12 " );	// For your sake, I hope you're not lying. I hate being made a fool of!
	B_LogEntry( TOPIC_XARDASTASKSFOUR , " Xardas did not believe that I managed to get the secret of the Necronomicon from Nergal. I should bring him the artifact to convince him otherwise. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Xar");
	PC_Psionic.aivar[AIV_EnemyOverride] = FALSE ;

	if(LesterGoXar == TRUE)
	{
		B_StartOtherRoutine(PC_Psionic,"Xardas");	
	};
};


instance DIA_XARDAS_NDM_TASKS_FOURDONE(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_ndm_tasks_fourdone_condition;
	information = dia_xardas_ndm_tasks_fourdone_info;
	permanent = FALSE;
	description = " I have a Necronomicon! " ;
};


func int dia_xardas_ndm_tasks_fourdone_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (Npc_HasItems(hero,itwr_necronomicon) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_ndm_tasks_fourdone_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_01");	//Mám Nekronomikon!
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_04 " );	// Very good! Give it to me so I can look at the treasure! I can't wait to see him in person.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_06");	//Tady.
	B_GiveInvItems(other,self,itwr_necronomicon,1);
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_07 " );	// Finally! That book is in my hands! You don't know what it means to me.
	AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_08");	//A co?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_09 " );	// Every dark mage dreams of this treasure, and now I AM its master!
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_10 " );	// No wonder Nergal was such a powerful necromancer in his lifetime. All thanks to the Necronomicon!
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_11 " );	// Even after death, its owner did not lose power.
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourDone_01_12 " );	// I understand. Now what?
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_13 " );	// Nothing. (laughter) Were you expecting some sort of introduction to the capabilities of this artifact?
	AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourDone_01_14 " );	// No, I just asked.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_15 " );	// Remember! The Necronomicon does not bestow its bearer with power, it only carries the wisdom and knowledge that is the key to gaining that power.
	AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_16 " );	// By the way, I'd like to ask you - have you tried to read it yet?
	if(((NECRONOMICONBONUS == TRUE) && (NECRONOMICONBONUSTRY == TRUE)) || ((NECRONOMICONBONUS == TRUE) && (NECRONOMICONBONUSTRY == FALSE)))
	{
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourDone_01_17 " );	// Yes, I read it.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_18 " );	// Then you must have understood by now. And surely this experience was not useless for you.
		AI_Output(other,self,"DIA_Xardas_NDM_Tasks_FourDone_01_19");	//Máš pravdu.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_20 " );	// (secretly) I don't doubt it. But ok, enough about that. We have more important things to do.
	}
	else if((NECRONOMICONBONUS == FALSE) && (NECRONOMICONBONUSTRY == TRUE))
	{
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourDone_01_22 " );	// Tried but failed. The book did not want to reveal its secret.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_23 " );	// (weird) That's understandable. After all, she is subject only to the will of the Dark mages, and you are not one of them. But it doesn't matter now.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_24 " );	// Enough about that. We have more important things to do.
	}
	else if((NECRONOMICONBONUS == FALSE) && (NECRONOMICONBONUSTRY == FALSE))
	{
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourDone_01_26 " );	// No, he didn't try. I had?
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_27 " );	// (surprised) He didn't try? You surprised me a bit.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_28 " );	// Hold such a treasure in your hands and not try to know its secret? I do not understand that.
		AI_Output(other,self, " DIA_Xardas_NDM_Tasks_FourDone_01_29 " );	// I just haven't tried it yet.
		AI_Output(self,other, " DIA_Xardas_NDM_Tasks_FourDone_01_30 " );	// Well, it's your business. But enough about that. We have more important things to do.
	};
	MIS_XARDASTASKSFOUR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_XARDASTASKSFOUR,LOG_SUCCESS);
	B_LogEntry( TOPIC_XARDASTASKSFOUR , " I brought Xardas the Necronomicon. " );
};


instance DIA_XARDAS_BRINGNECRONOMICONNOQUEST(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = dia_xardas_bringnecronomiconnoquest_condition;
	information = dia_xardas_bringnecronomiconnoquest_info;
	permanent = FALSE;
	description = " I have one very interesting thing for you. " ;
};


func int dia_xardas_bringnecronomiconnoquest_condition()
{
	if (( MIS_XARDASTASKSFOUR  ==  FALSE ) && (Npc_HasItems(hero,itwr_necronomicon) >=  1 ) && (hero.guild !=  GIL_KDM ) && (hero.guild !=  GIL_NDM )) ;
	{
		return TRUE;
	};
};

func void dia_xardas_bringnecronomiconnoquest_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Xardas_BringNecronomiconNoQuest_01_00 " );	// I have something very interesting for you.
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_01 " );	// Yes? What are you talking about?
	AI_Output(other,self, " DIA_Xardas_BringNecronomiconNoQuest_01_02 " );	// Here. See for yourself.
	B_GiveInvItems(other,self,itwr_necronomicon,1);
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_03 " );	// (surprised) Unbelievable! Where did you find that book?
	AI_Output(other,self, " DIA_Xardas_BringNecronomiconNoQuest_01_04 " );	// In an old tower. Looks like a pretty valuable item!
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_05 " );	// (indignantly) Valuable thing? Do you have the slightest idea what it is?
	AI_Output(other,self,"DIA_Xardas_BringNecronomiconNoQuest_01_06");	//A co to je?
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_07 " );	// (accusingly) This 'thing', as you called it, is none other than the Necronomicon - the oldest tome devoted to necromancer magic!
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_08 " );	// Every dark mage dreams of getting it. Not to mention that until recently no one knew exactly where this artifact was hidden.
	AI_Output(other,self, " DIA_Xardas_BringNecronomiconNoQuest_01_09 " );	// Looks like I was very lucky.
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_10 " );	// And not only you... (slyly) Me too.
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_11 " );	// Do you mind if I keep this book to myself? She's useless to you anyway.
	AI_Output(other,self, " DIA_Xardas_BringNecronomiconNoQuest_01_13 " );	// How is she useless?
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_14 " );	// Her secret is subject only to the will of the mages of Darkness. It represents absolutely no value to others.
	AI_Output(other,self, " DIA_Xardas_BringNecronomiconNoQuest_01_15 " );	// Well, if you need her that much, you can take her.
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_16 " );	// Thank you. To be honest, I didn't even consider another option.
	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_17 " );	// And I will give you something more useful for you than this book.

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_NOV) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW))
	{
		AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_22 " );	// Here, take this elixir of spirit!
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_20 " );	// Here, take this elixir of life!
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	};

	AI_Output(self,other, " DIA_Xardas_BringNecronomiconNoQuest_01_24 " );	// I hope you are satisfied?
	AI_Output(other,self, " DIA_Xardas_BringNecronomiconNoQuest_01_25 " );	// Completely.
};

instance DIA_XARDAS_PYROKINEZ(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = dia_xardas_pyrokinez_condition;
	information = dia_xardas_pyrokinez_info;
	permanent = FALSE;
	description = " What kind of rune do you have on that table? " ;
};

func int dia_xardas_pyrokinez_condition()
{
	if ((Chapter >=  2 ) && ((hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_NDM )))
	{
		return TRUE;
	};
};

func void dia_xardas_pyrokinez_info()
{
	AI_Output(other,self, " DIA_Xardas_HarmUndead_01_00 " );	// What's that rune on that table?
	AI_Output(self,other, " DIA_Xardas_HarmUndead_01_01 " );	// What do you mean? (looks back) Ah, that rune contains the essence of destroying the undead. Quite rare, by the way.
	AI_Output(self,other, " DIA_Xardas_HarmUndead_01_02 " );	// For those who dabble in Beliar's dark arts - this is truly a gem!
	AI_Output(other,self, " DIA_Xardas_HarmUndead_01_03 " );	// Impressive. Can I get one too?
	AI_Output(self,other, " DIA_Xardas_HarmUndead_01_04 " );	// I understand your interest. Well, I could give it to you.
	AI_Output(self,other, " DIA_Xardas_HarmUndead_01_05 " );	// But first you'll have to do me a little favor.
	AI_Output(self,other, " DIA_Xardas_HarmUndead_01_07 " );	// Bring me five bundles of ectoplasm. This will serve me to create a new, stronger rune.
	MIS_Pyrokinez = LOG_Running;
	Log_CreateTopic(TOPIC_XARDAS_PYROKINEZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDAS_PYROKINEZ,LOG_Running);
	B_LogEntry( TOPIC_XARDAS_PYROKINEZ , " Xardas promised to give me the rune of undead destruction, but first I will have to bring him 5 bundles of ectoplasm. " );
};


instance DIA_Xardas_Pyrokinez_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Pyrokinez_Done_condition;
	information = DIA_Xardas_Pyrokinez_Done_info;
	permanent = FALSE;
	description = " I brought the ectoplasm. " ;
};

func int DIA_Xardas_Pyrokinez_Done_condition()
{
	if((Npc_HasItems(hero,ITMI_PLAZMA) >= 5) && (MIS_Pyrokinez == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Pyrokinez_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Xardas_HarmUndead_Done_01_01 " );	// I brought the ectoplasm.
	B_GiveInvItems(other,self,ITMI_PLAZMA,5);
	Npc_RemoveInvItems(self,ITMI_PLAZMA,5);
	AI_Output(self,other, " DIA_Xardas_HarmUndead_Done_01_02 " );	// (delighted) Not bad, good job!
	AI_Output(self,other, " DIA_Xardas_HarmUndead_Done_01_03 " );	// Here's your reward. I'm sure you'll use it.
 	B_GiveInvItems(self,other,ItRu_HarmUndead,1);
 	AI_Output(self,other, " DIA_Xardas_HarmUndead_Done_01_04 " );	// Use it against the strongest of the undead.
	MIS_Pyrokinez = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_XARDAS_PYROKINEZ,LOG_SUCCESS);
	B_LogEntry( TOPIC_XARDAS_PYROKINEZ , " I brought ectoplasm to Xardas. He gave me the rune of destroying the undead. " );
};


instances of DIA_Xardas_RobaUp (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_RobaUp_condition;
	information = DIA_Xardas_RobaUp_info;
	permanent = FALSE;
	description = " Can I upgrade my robes? " ;
};

func int DIA_Xardas_RobaUp_condition()
{
	if((KNOWSHOWDEALSOULS == TRUE) && (NEKR_H_ROBA == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RobaUp_info()
{
	AI_Output(other,self, " DIA_Xardas_RobaUp_01_00 " );	// Can I upgrade my robes? It seems to me that it is no longer enough to protect me against enemies.
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_01 " );	// Well, if Beliar's will desires you to gain more power, he will surely help you with the sanctification of your robe.
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_02 " );	// And be aware that consecrating robes requires higher dark magic.
	AI_Output(other,self, " DIA_Xardas_RobaUp_01_03 " );	// Consecration? Does Dark magic include sanctification?
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_04 " );	// One of the ways in which the servants of Beliar consecrate various objects - especially armor - has been known for a long time.
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_05 " );	// That potion is called 'Breath of Death', unfortunately it's not easy to get.
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_06 " );	// Unfortunately, the recipe for this elixir has long since been lost. I can only assume that it was perhaps divided into two or three parts.
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_07 " );	// So you'll have to find him, and I certainly won't be your fellow explorer.
	AI_Output(other,self, " DIA_Xardas_RobaUp_01_08 " );	// If I did get it, what do you think I should do with it?
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_09 " );	// If you did manage to get it for the ritual, there's still one problem left. You need at least another hundred soul stones.
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_10 " );	// And then you turn to Beliar with a specific request.
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_11 " );	// Remember: SHATAR ATN BOLMAR KRAT ISAK MOTAL!
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_12 " );	// If your existence is part of Beliar's plans, he'll surely turn his attention to you.
	AI_Output(other,self, " DIA_Xardas_RobaUp_01_13 " );	// Isn't there another way?
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_14 " );	// It's not! I have already warned you that the path of Darkness magic is not something simple and safe.
	AI_Output(self,other, " DIA_Xardas_RobaUp_01_15 " );	// Go and save the lost sheep within you. Go and try to find the recipe.
	Log_CreateTopic(TOPIC_XARDAS_ROBA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_XARDAS_ROBA,LOG_Running);
	B_LogEntry( TOPIC_XARDAS_ROBA , " I asked Xardas about a better robe. He told me that there was a way to improve my armor, but at the cost of great difficulty. If I have any chance of success, I must obtain at least a hundred soul stones. I also need a special elixir, almost no one knows how to prepare it. Xardas indicated that the recipe should be found on the island in at most three parts. I'll do best if I go through all the dark corners and resting places of the dead. " );
	MIS_ROBA_XARDAS = LOG_Running;
};

instance DIA_Xardas_RobaUp_Find(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_RobaUp_Find_condition;
	information = DIA_Xardas_RobaUp_Find_info;
	permanent = FALSE;
	description = " I found the 'Breath of Death' recipe. " ;
};

func int DIA_Xardas_RobaUp_Find_condition()
{
	if((MIS_ROBA_XARDAS == LOG_Running) && (Npc_HasItems(other,itwr_death1) >= 1) && (Npc_HasItems(other,itwr_death2) >= 1) && (knows_breath_of_death1 == TRUE) && (knows_breath_of_death2 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RobaUp_Find_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Xardas_RobaUp_Find_00_01 " );	// I found the 'Breath of Death' recipe.
	AI_Output(self,other, " DIA_Xardas_RobaUp_Find_00_02 " );	// (respectfully) You never cease to amaze me. Tell me, did you find all the parts of the recipe?
	AI_Output(other,self,"DIA_Xardas_RobaUp_Find_00_03");	//Našel.
	AI_Output(self,other, " DIA_Xardas_RobaUp_Find_00_04 " );	// I hope you've already read the formula for that potion.
	AI_Output(other,self, " DIA_Xardas_RobaUp_Find_00_05 " );	// Of course.
	AI_Output(self,other, " DIA_Xardas_RobaUp_Find_00_06 " );	// Excellent. Then I guess it won't matter if I take it.
	AI_Output(other,self, " DIA_Xardas_RobaUp_Find_00_07 " );	// Well, if you need the recipe so much - take it.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,itwr_death1,2);
	Npc_RemoveInvItems(hero,itwr_death2,1);
	AI_Output(self,other, " DIA_Xardas_RobaUp_Find_00_08 " );	// Finally. You can't even imagine how long I've been waiting for this moment.
	AI_Output(self,other, " DIA_Xardas_RobaUp_Find_00_09 " );	// You made a very wise decision not to let me leave empty handed...
	AI_Output(self,other, " DIA_Xardas_RobaUp_Find_00_10 " );	// ... I will personally prepare the elixir for you.
	AI_Output(other,self, " DIA_Xardas_RobaUp_Find_00_11 " );	// I didn't count on this help.
	AI_Output(self,other, " DIA_Xardas_RobaUp_Find_00_12 " );	// It's not worth talking about. Come back in three days.
	MIS_ROBA_XARDAS = LOG_SUCCESS;
	HARDASTIMERBENDM = Wld_GetDay();
	Log_SetTopicStatus(TOPIC_XARDAS_ROBA,LOG_SUCCESS);
	B_LogEntry( TOPIC_XARDAS_ROBA , " I gave Xardas the recipe. During our conversation, he decided to mix the 'Breath of Death' potion for me. I should return in three days. " );
};

instance DIA_Xardas_RobaUp_Potion_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_RobaUp_Potion_Done_condition;
	information = DIA_Xardas_RobaUp_Potion_Done_info;
	important = FALSE;
	description = " What about my potion? " ;
};

func int DIA_Xardas_RobaUp_Potion_Done_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((MIS_ROBA_XARDAS == LOG_SUCCESS) && (XARDASTIMERBENDM > 0) && (XARDASTIMERBENDM < (daynow - 3)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RobaUp_Potion_Done_info()
{
	AI_Output(other,self, " DIA_Xardas_RobaUp_Potion_Done_01_00 " );	// What about my potion?
	AI_Output(self,other, " DIA_Xardas_RobaUp_Potion_Done_01_01 " );	// It's ready. Here, take it.
	B_GiveInvItems(self,other,ITPO_BREATH_OF_DEATH,1);
	AI_Output(other,self,"DIA_Xardas_RobaUp_Potion_Done_01_02");	//Děkuju.
};

instances of DIA_Xardas_RobaUp_NoRitual (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_RobaUp_NoRitual_condition;
	information = DIA_Xardas_RobaUp_NoRitual_info;
	permanent = FALSE;
	description = " I have a small problem. " ;
};

func int DIA_Xardas_RobaUp_NoRitual_condition()
{
	if (( BelieveFailedRobe ==  TRUE ) && ( BelieveDoneRobe ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RobaUp_NoRitual_info()
{
	AI_Output(other,self, " DIA_Xardas_RobaUp_NoRitual_00_01 " );	// I have a small problem.
	AI_Output(self,other, " DIA_Xardas_RobaUp_NoRitual_00_02 " );	// (surprised) What problem?
	AI_Output(other,self, " DIA_Xardas_RobaUp_NoRitual_00_03 " );	// Beliar does not want to consecrate my robe. What should I do?
	AI_Output(self,other, " DIA_Xardas_RobaUp_NoRitual_00_04 " );	// No wonder. You have to earn his favor first.
	AI_Output(self,other, " DIA_Xardas_RobaUp_NoRitual_00_05 " );	// You can only use his gifts once Beliar is sure that you are indeed his loyal servant.
	AI_Output(self,other, " DIA_Xardas_RobaUp_NoRitual_00_06 " );	// And one more thing: the stronger soulstone you bring, the more interesting the final effect will be.
};

DIA_Xardas_Mechi (C_Info) instances
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Mechi_condition;
	information = DIA_Xardas_Mechi_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Xardas_Mechi_condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Xardas_Mechi_info()
{
	AI_Output(self,other, " DIA_Xardas_Mechi_00_01 " );	// Wait, I have one request for you.
	AI_Output(self,other, " DIA_Xardas_Mechi_00_02 " );	// Have you dealt with the cursed blade before?
	AI_Output(other,self, " DIA_Xardas_Mechi_00_03 " );	// Maybe, I don't remember exactly.
	AI_Output(self,other, " DIA_Xardas_Mechi_00_04 " );	// I want to warn you - that weapon is very dangerous for people! So don't even think of using it.
	AI_Output(other,self,"DIA_Xardas_Mechi_00_05");	//Ale proč?
	AI_Output(self,other, " DIA_Xardas_Mechi_00_06 " );	// It's the power of the undead, and their magic can sometimes influence every man's thinking.
	AI_Output(self,other, " DIA_Xardas_Mechi_00_07 " );	// Even as strong as you are!
	AI_Output(self,other, " DIA_Xardas_Mechi_00_08 " );	// I would like to ask you to bring me those weapons that cause only confusion and pain in the world.
	AI_Output(self,other, " DIA_Xardas_Mechi_00_09 " );	// In my tower, under the protection of my servants, he will simply no longer harm the inhabitants of this world.
	AI_Output(self,other, " DIA_Xardas_Mechi_00_10 " );	// Well, your efforts will be very well paid after all. do you agree
	AI_Output(other,self, " DIA_Xardas_Mechi_00_11 " );	// Ok, I'll remember that.
	B_LogEntry(Topic_OutTrader, " Xardas buys cursed weapons from me. " );
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_BuyWeapons(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 600;
	condition = DIA_Xardas_BuyWeapons_condition;
	information = DIA_Xardas_BuyWeapons_info;
	permanent = TRUE;
	description = " I have cursed weapons for you. " ;
};

func int DIA_Xardas_BuyWeapons_condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Xardas_Mechi ))
	{
		if((Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0) || (Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0) || (Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0) || (Npc_HasItems(hero,ItMw_PlagueStaff) > 0) || (Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0) || (Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0) || (Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0) || (Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0) || (Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0) || (Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0) || (Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PreElite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0) || (Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0) || (Npc_HasItems(hero,ItRw_Undead) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_Elite) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Xardas_BuyWeapons_info()
{
	var int countexp;
	var int goldplus;
	var int goldplus_all;

	goldplus = FALSE ;
	goldplus_all = FALSE;

	AI_Output(other,self, " DIA_Xardas_BuyWeapons_01_00 " );	// I have cursed weapons for you.
	AI_Output(self,other, " DIA_Xardas_BuyWeapons_01_01 " );	// Excellent! Put it here.

	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Left);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Left,Npc_HasItems(hero,ItMw_1H_ChelDrak_Left));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Right);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Right,Npc_HasItems(hero,ItMw_1H_ChelDrak_Right));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_2H_ShadowBlade_Xert);
		Npc_RemoveInvItems(hero,ItMw_2H_ShadowBlade_Xert,Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elair);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elair,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Ober);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Ober,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_PlagueStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_PlagueStaff);
		Npc_RemoveInvItems(hero,ItMw_PlagueStaff,Npc_HasItems(hero,ItMw_PlagueStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_SoulKeeperStaff);
		Npc_RemoveInvItems(hero,ItMw_SoulKeeperStaff,Npc_HasItems(hero,ItMw_SoulKeeperStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DoomSpeer_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DoomSpeer_Elite,Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMAXE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMAXE,Npc_HasItems(hero,ITMW_2H_DOOMAXE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_HAOSHAND);
		Npc_RemoveInvItems(hero,ITMW_2H_HAOSHAND,Npc_HasItems(hero,ITMW_2H_HAOSHAND));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_RAVENELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_RAVENELITE,Npc_HasItems(hero,ITMW_2H_RAVENELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DRACONSWORD_DEAD);
		Npc_RemoveInvItems(hero,ITMW_2H_DRACONSWORD_DEAD,Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_Doom_OldPiratensaebel);
		Npc_RemoveInvItems(hero,ItMw_Doom_OldPiratensaebel,Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST,Npc_HasItems(hero,ITMW_SHADOWPRIEST));
		goldplus_all = goldplus_all + (goldplus * 40);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elite);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elite,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite));
		goldplus_all = goldplus_all + (goldplus * 40);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD,Npc_HasItems(hero,ITMW_2H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_PREELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_PREELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_ELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_ELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD,Npc_HasItems(hero,ITMW_1H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_GHOSTSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_GHOSTSWORD,Npc_HasItems(hero,ITMW_1H_GHOSTSWORD));
		goldplus_all = goldplus_all + (goldplus * 30);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSPEER);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSPEER,Npc_HasItems(hero,ITMW_1H_DOOMSPEER));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD_Elite,Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItRw_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Undead);
		Npc_RemoveInvItems(hero,ItRw_Undead,Npc_HasItems(hero,ItRw_Undead));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Crossbow_Undead);
		Npc_RemoveInvItems(hero,ItRw_Crossbow_Undead,Npc_HasItems(hero,ItRw_Crossbow_Undead));
		goldplus_all = goldplus_all + (goldplus * 15);
	};
	if(Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_01_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_01_Damn,Npc_HasItems(hero,ItAr_Shield_01_Damn));
		goldplus_all = goldplus_all + (goldplus * 15);
	};
	if(Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_02_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_02_Damn,Npc_HasItems(hero,ItAr_Shield_02_Damn));
		goldplus_all = goldplus_all + (goldplus * 15);
	};
	if(Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_03_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_03_Damn,Npc_HasItems(hero,ItAr_Shield_03_Damn));
		goldplus_all = goldplus_all + (goldplus * 15);
	};

	AI_Output(self,other, " DIA_Xardas_BuyWeapons_01_02 " );	// Good! Here's your honey.
	B_GiveInvItems(self,other,ItMi_Gold,goldplus_all);
};

instance DIA_Xardas_SleeperMask(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_SleeperMask_condition;
	information = DIA_Xardas_SleeperMask_info;
	permanent = FALSE;
	description = " I have a Sleeper mask here. " ;
};

func int DIA_Xardas_SleeperMask_condition()
{
	if ( Npc_HasItems ( hero , ITMI_HELMSLEEPER_MY ) >  0 ) ;
	{
		return TRUE;
	};
};

func void DIA_Xardas_SleeperMask_info()
{
	AI_Output(other,self, " DIA_Xardas_SleeperMask_00_01 " );	// I have the Sleeper mask here.
	AI_Output(self,other, " DIA_Xardas_SleeperMask_00_02 " );	// Interesting! Where did you get it?
	AI_Output(other,self, " DIA_Xardas_SleeperMask_00_03 " );	// From a necromancer in a goblin temple.
	AI_Output(self,other, " DIA_Xardas_SleeperMask_00_04 " );	// Come closer so I can look at her.
	AI_Output(other,self,"DIA_Xardas_SleeperMask_00_05");	//Tady.
	B_GiveInvItems(other,self,ITMI_HELMSLEEPER_MIS,1);
	Npc_RemoveInvItems(self,ITMI_HELMSLEEPER_MIS,1);
	AI_Output(self,other, " DIA_Xardas_SleeperMask_00_06 " );	// Hmmm... (appreciatively) It's loaded with Darkness magic. A very dangerous and powerful item.
	AI_Output(self,other, " DIA_Xardas_SleeperMask_00_07 " );	// I'm sure her previous owner didn't give her up voluntarily.
	AI_Output(other,self, " DIA_Xardas_SleeperMask_00_08 " );	// Of course. But I would be interested in another thing - can I put it on?
	AI_Output(self,other, " DIA_Xardas_SleeperMask_00_10 " );	// Well... (thoughtfully) Mastering a magical artifact of such power seems a little complicated to me.
	AI_Output(self,other, " DIA_Xardas_SleeperMask_00_11 " );	// It's true that some of that magic power will disappear and he won't be as powerful as he is now.
	AI_Output(self,other, " DIA_Xardas_SleeperMask_00_12 " );	// However, even then it will require considerable power to carry.

	if ((hero.guild !=  GIL_KDF ) || (hero.guild !=  GIL_KDW ) || (hero.guild !=  GIL_KDM ) || (hero.guild !=  GIL_GUR ))
	{
		AI_Output(self,other, " DIA_Xardas_SleeperMask_00_04 " );	// And since you're not a mage, the idea of ​​mastery is completely unrealistic.
	};

	Info_ClearChoices(DIA_Xardas_SleeperMask);
	Info_AddChoice(DIA_Xardas_SleeperMask, " Please! Help me. " ,DIA_Xardas_SleeperMask_DoIt);
	Info_AddChoice(DIA_Xardas_SleeperMask, " Then it's better to dedicate it to you. " ,DIA_Xardas_SleeperMask_Leave);
};

func void DIA_Xardas_SleeperMask_DoIt()
{
	AI_Output(other,self, " DIA_Xardas_SleeperMask_DoIt_00_01 " );	// Please! Help me.
	AI_Output(self,other, " DIA_Xardas_SleeperMask_DoIt_00_02 " );	// When you think Wait a minute.
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Output(self,other, " DIA_Xardas_SleeperMask_DoIt_00_03 " );	// Done, now you can use it.
	B_GiveInvItems(self,other,ITMI_HELMSLEEPER,1);
	AI_Output(other,self, " DIA_Xardas_SleeperMask_DoIt_00_04 " );	// Thank you very much.
	Info_ClearChoices(DIA_Xardas_SleeperMask);
};

func void DIA_Xardas_SleeperMask_Leave()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_Xardas_SleeperMask_Leave_00_01 " );	// Then it's better to dedicate it to you.
	AI_Output(self,other, " DIA_Xardas_SleeperMask_Leave_00_02 " );	// Wise decision... (gratefully) I'll find a better use for her.
	DestroyMask = TRUE;
	Info_ClearChoices(DIA_Xardas_SleeperMask);
};

var int XardasDoMagicRoot;
var int XardasDoMagicRootYes;
var int HardasDoMagicRootDay;

instance DIA_Xardas_Druid(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Druid_condition;
	information = DIA_Xardas_Druid_info;
	permanent = FALSE;
	description = " Do you know anything about druid magic? " ;
};

func int DIA_Xardas_Druid_condition()
{
	if((XarDruid == TRUE) && (RootIsUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Druid_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Xardas_Druid_00_01 " );	// Do you know anything about druid magic?
	AI_Output(self,other, " DIA_Xardas_Druid_00_02 " );	// Maybe I know. Why are you so interested?
	AI_Output(other,self, " DIA_Xardas_Druid_00_03 " );	// I have one problem. Saturas told me that druid magic would help me sort it out.
	AI_Output(self,other, " DIA_Xardas_Druid_00_04 " );	// What's the problem?
	AI_Output(other,self, " DIA_Xardas_Druid_00_05 " );	// I have to bring one dead tree back to life. Just please don't ask why.
	AI_Output(self,other, " DIA_Xardas_Druid_00_06 " );	// I don't quite understand it. But your question piques my interest.
	AI_Output(self,other, " DIA_Xardas_Druid_00_07 " );	// Wait a moment. So where are my notes...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Xardas_Druid_00_08 " );	// Ah, here they are. Yes, it is indeed possible.
	AI_Output(self,other, " DIA_Xardas_Druid_00_09 " );	// Healing was not difficult for druids, but for those unfamiliar with their magic.
	AI_Output(self,other, " DIA_Xardas_Druid_00_10 " );	// In general, this is not an easy task. But I can help you with this.
	AI_Output(other,self, " DIA_Xardas_Druid_00_11 " );	// What will I need?
	AI_Output(self,other, " DIA_Xardas_Druid_00_12 " );	// First, your cooperation. It is noted in the notes that in order to interfere with the life of a plant, you will need a thing called - 'Root of Life'.
	AI_Output(other,self, " DIA_Xardas_Druid_00_13 " );	// 'Root of Life'? Where I find him?
	AI_Output(self,other, " DIA_Xardas_Druid_00_14 " );	// You don't have to bother looking for that plant. It is impossible to pluck it anywhere in the garden, you can only find that with an experienced druid.
	AI_Output(other,self, " DIA_Xardas_Druid_00_15 " );	// Explain to me how to do this?
	AI_Output(self,other, " DIA_Xardas_Druid_00_16 " );	// I won't explain anything to you. Druid magic has been learned for years. I won't waste so much time with you.
	AI_Output(self,other, " DIA_Xardas_Druid_00_17 " );	// Bring me everything I need and I'll prepare it for you.
	AI_Output(other,self, " DIA_Xardas_Druid_00_18 " );	// Okay, that would work. What do you want for it?
	AI_Output(self,other, " DIA_Xardas_Druid_00_19 " );	// Hmmm... (thoughtfully) Give me a second...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Xardas_Druid_00_20 " );	// Remember: I need royal sorrel, fire root - this will serve as the basis for the recipe...
	AI_Output(self,other, " DIA_Xardas_Druid_00_21 " );	// ... three medicinal herb leaves, a troll berry as an agent, and...
	AI_Output(self,other, " DIA_Xardas_Druid_00_22 " );	// (thoughtfully) That'll be the hardest... I still need the cactus flower!
	AI_Output(other,self, " DIA_Xardas_Druid_00_23 " );	// Cactus flower?
	AI_Output(self,other, " DIA_Xardas_Druid_00_24 " );	// Yes! This plant grows in abundance only in very hot conditions. It will be extremely difficult to find a similar specimen on this island.


	if(Npc_HasItems(hero,ItPl_CactusFlower) > 0)
	{
		AI_Output(other,self, " DIA_Xardas_Druid_00_25 " );	// Don't worry! I already have one of those.
		AI_Output(self,other, " DIA_Xardas_Druid_00_26 " );	// (surprised) Well, if so, then bring me the rest of the ingredients and I'll create a 'Root of Life' for you.
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_Druid_00_27 " );	// But otherwise I can't do anything without him.
	};

	AI_Output(other,self,"DIA_Xardas_Druid_00_37");	//Chápu.
	B_LogEntry(TOPIC_AdanosCrone, " It seems that there is nothing in the world that Xardas does not know about. He will prepare for me a magical plant - the 'Root of Life', able to restore the life force of a dead tree. If I want to create it, I need: royal sorrel, fire root , a troll berry, three healing herb leaves, and a cactus flower. That last one won't be easy because it only grows in very hot places. Something tells me I can find it on the plateau. " );
	XardasDoMagicRoot = TRUE;
	RootIsUp = TRUE;
};

instance DIA_Xardas_MagicRoot(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_MagicRoot_condition;
	information = DIA_Xardas_MagicRoot_info;
	permanent = TRUE;
	description = " I have brought all the necessary ingredients. " ;
};

func int DIA_Xardas_MagicRoot_condition()
{
	if((XardasDoMagicRoot == TRUE) && (XardasDoMagicRootYes == FALSE) && (Npc_HasItems(hero,ItPl_CactusFlower) > 0) && (Npc_HasItems(hero,ItPl_Mana_Herb_03) > 0) && (Npc_HasItems(hero,ItPl_Health_Herb_01) >= 3) && (Npc_HasItems(hero,ITPL_SUPER_HERB) > 0) && (Npc_HasItems(hero,ItPl_Perm_Herb) > 0))
	{
		return TRUE;
	};
};

func void DIA_Xardas_MagicRoot_info()
{
	AI_Output(other,self, " DIA_Xardas_MagicRoot_00_01 " );	// I brought all the necessary ingredients.

	if((Xardas_GoesToRitualInnosEye == FALSE) || ((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Xardas_GoesToRitualInnosEye == TRUE)))
	{
		B_GivePlayerXP(500);
		AI_Output(self,other, " DIA_Xardas_MagicRoot_00_02 " );	// Excellent. Give them to me.
		AI_Output(other,self, " DIA_Xardas_MagicRoot_00_03 " );	// Here they are.
		b_giveinvitemsmanythings(other,self);
		Npc_RemoveInvItems(hero,ItPl_CactusFlower,1);
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,3);
		Npc_RemoveInvItems(hero,ITPL_SUPER_HERB,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		AI_Output(self,other, " DIA_Xardas_MagicRoot_00_04 " );	// I am asking for your patience now. Exactly one day and the 'Root of Life' will be ready.
		XardasDoMagicRootDay = Wld_GetDay();
		XardasDoMagicRootYes = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Alchemy");
	}
	else
	{
		AI_Output(self,other, " DIA_Xardas_MagicRoot_00_05 " );	// We'll talk about this later.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Xardas_MagicRoot_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_MagicRoot_Done_condition;
	information = DIA_Xardas_MagicRoot_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Xardas_MagicRoot_Done_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((XardasDoMagicRootYes == TRUE) && (XardasDoMagicRootDay < daynow))
	{
		return TRUE;
	};
};

func void DIA_Xardas_MagicRoot_Done_info()
{
	AI_Output(self,other, " DIA_Xardas_MagicRoot_Done_00_01 " );	// Root is ready. You can pick it up.
	B_GiveInvItems(self,other,ItPl_MagicRoot,1);
	AI_Output(other,self,"DIA_Xardas_MagicRoot_Done_00_02");	//Děkuju.
	B_LogEntry(TOPIC_AdanosCrone, " Xardas made me a 'Root of Life'. Time to go back to the dead tree. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Xar");
};

var int XarCanDoSoulPot;
var int XarCanDoSoulPotDay;

instances of DIA_Xardas_SeekerSoul (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_SeekerSoul_condition;
	information = DIA_Xardas_SeekerSoul_info;
	permanent = FALSE;
	description = " I have something here. " ;
};

func int DIA_Xardas_SeekerSoul_condition()
{
	if(Npc_HasItems(hero,ITMI_SeekerSoul) > 0)
	{
		return TRUE;
	};
};

func void DIA_Xardas_SeekerSoul_info()
{
	AI_Output(other,self, " DIA_Xardas_SeekerSoul_00_01 " );	// I have something here.
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_02 " );	// (grudgingly) Speak clearly! what do you have here
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_00_03");	//Tohle.
	B_GiveInvItems(other,self,ITMI_SeekerSoul,1);
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_04 " );	// (thoughtfully) It looks like a soul crystal. Where did you get it?
	AI_Output(other,self, " DIA_Xardas_SeekerSoul_00_05 " );	// I took it from one creature of evil. What is it?
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_06 " );	// Well, to put it simply, it's just an ordinary heart.
	AI_Output(other,self, " DIA_Xardas_SeekerSoul_00_07 " );	// It doesn't look much like a heart.
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_08 " );	// There are beings of flesh and blood. You have seen their hearts more than once.
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_09 " );	// And there are creatures of magic. They don't appear often in this world and they are all extremely dangerous.
	AI_Output(other,self, " DIA_Xardas_SeekerSoul_00_10 " );	// I agree with you on that. And this... heart, can it be used for anything?
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_11 " );	// Good question. Let me think...
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_12 " );	// I had records that listed one rare magic potion. These crystals were needed to prepare it.
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_13 " );	// Wait a moment.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Xardas_SeekerSoul_00_14");	//Aha, tady je to!
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_15 " );	// It says here that you need ten dark soul crystals to make this potion.
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_16 " );	// It also says that the effect of this potion is extremely unpredictable.
	AI_Output(other,self,"DIA_Xardas_SeekerSoul_00_17");	//A co to znamená?
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_18 " );	// If I understand correctly, it can increase your strength and can also give you agility. It has a different effect on everyone.
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_00_19 " );	// Anyway, if you bring me the crystals, I'll make you this potion.
	B_GiveInvItems(self,other,ITMI_SeekerSoul,1);
	MIS_SeekerSoul = LOG_Running;
	Log_CreateTopic(TOPIC_SeekerSoul,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SeekerSoul,LOG_Running);
	B_LogEntry(TOPIC_SeekerSoul, " Xardas told me that dark soul crystals can be used to make a magical potion. But for that he will need at least ten such crystals. " );
};

instance DIA_Xardas_SeekerSoul_Start(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_SeekerSoul_Start_condition;
	information = DIA_Xardas_SeekerSoul_Start_info;
	permanent = FALSE;
	description = " I brought dark soul crystals. " ;
};

func int DIA_Xardas_SeekerSoul_Start_condition()
{
	if((MIS_SeekerSoul == LOG_Running) && (Npc_HasItems(hero,ITMI_SeekerSoul) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Xardas_SeekerSoul_Start_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Xardas_SeekerSoul_Start_00_01 " );	// I brought the dark soul crystals.
	B_GiveInvItems(other,self,ITMI_SeekerSoul,10);
	Npc_RemoveInvItems(self,ITMI_SeekerSoul,10);
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_Start_00_06 " );	// Okay. I need time to prepare it.
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_Start_00_07 " );	// Come back in a few days. I think it will be done then.
	B_LogEntry(TOPIC_SeekerSoul, " I brought soul crystals to Xardas. I can show up for the potion in a few days. " );
	XarCanDoSoulPot = TRUE;
	XarCanDoSoulPotDay = Wld_GetDay();
};

instance DIA_Xardas_SeekerSoul_End(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_SeekerSoul_End_condition;
	information = DIA_Xardas_SeekerSoul_End_info;
	permanent = FALSE;
	description = " So what about my potion? " ;
};

func int DIA_Xardas_SeekerSoul_End_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_SeekerSoul == LOG_Running) && (XarCanDoSoulPot == TRUE) && (XarCanDoSoulPotDay <= (DayNow - 2)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_SeekerSoul_End_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Xardas_SeekerSoul_End_00_01 " );	// So what about my potion?
	AI_Output(self,other, " DIA_Xardas_SeekerSoul_End_00_02 " );	// It's ready. Here.
	B_GiveInvItems(self,other,ITPO_SOULPOTION,1);
	MIS_SeekerSoul = LOG_Success;
	Log_SetTopicStatus(TOPIC_SeekerSoul,LOG_Success);
	B_LogEntry(TOPIC_SeekerSoul, " I have a soul crystal potion. " );
};

instance DIA_Xardas_Pirate_Start(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Pirate_Start_condition;
	information = DIA_Xardas_Pirate_Start_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Xardas_Pirate_Start_condition()
{
	if ((Chapter >=  2 ) && (GregIsBack ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Pirate_Start_info()
{
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_01 " );	// Good to see you here. I have some job for you.
	AI_Output(other,self,"DIA_Xardas_Pirate_Start_00_02");	//Poslouchám.
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_03 " );	// As I learned, the paladins sank a pirate ship before arriving in Khorinis.
	AI_Output(other,self, " DIA_Xardas_Pirate_Start_00_04 " );	// Are you interested in pirates?
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_05 " );	// (disgusted) Listen first and ask questions later! So...
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_06 " );	// One thing once happened, before one of the temples of Beliar was destroyed, the paladins took many things from it.
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_07 " );	// They also took one ring with them. It looks ugly, but it has great power. Especially if the right person is wearing it.
	AI_Output(other,self, " DIA_Xardas_Pirate_Start_00_08 " );	// Where are the pirates?
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_09 " );	// Keep listening... (angry) I haven't had anything to do with that ring yet.
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_10 " );	// But recently I found out that one person in town saw the ring.
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_11 " );	// Rumors have reached here and I've found out that there's been a pirate hanging around town lately.
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_12 " );	// Has a signature look - an eye patch. It would be difficult to mistake him for anyone.
	AI_Output(self,other, " DIA_Xardas_Pirate_Start_00_13 " );	// I want you to look him up and learn more about that ring.
	AI_Output(other,self, " DIA_Xardas_Pirate_Start_00_14 " );	// Ok, I'll give it a try.
	MIS_PirateRing = LOG_Running;
	Log_CreateTopic(TOPIC_PirateRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PirateRing,LOG_Running);
	B_LogEntry(TOPIC_PirateRing, " Xardas is searching for a rare ring that was once taken from the ruins of the Temple of Beliar by paladins. Xardas has recently learned that this ring was seen on a person described as resembling a pirate. His distinguishing feature is an eye patch. Xardas asked me to to find out more about that ring. " );
	AI_StopProcessInfos(self);
};

instance DIA_Xardas_Pirate_Curse(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Pirate_Curse_condition;
	information = DIA_Xardas_Pirate_Curse_info;
	permanent = FALSE;
	description = " There was a problem with that ring. " ;
};

func int DIA_Xardas_Pirate_Curse_condition()
{
	if((MIS_PirateRing == LOG_Running) && (GregCurse == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Pirate_Curse_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Xardas_Pirate_Curse_00_01 " );	// There was a problem with that ring.
	AI_Output(other,self, " DIA_Xardas_Pirate_Curse_00_02 " );	// As you said, it carries a really great power, but also a curse.
	AI_Output(other,self, " DIA_Xardas_Pirate_Curse_00_03 " );	// The pirate captain who wears this ring redeemed it with many lives from his crew.
	AI_Output(self,other, " DIA_Xardas_Pirate_Curse_00_04 " );	// That's not a problem. Bring it to me and I will break the curse.
	AI_Output(other,self, " DIA_Xardas_Pirate_Curse_00_05 " );	// The problem is, I can't bring it to you. As soon as I took that ring off him - he would leave this world.
	AI_Output(self,other, " DIA_Xardas_Pirate_Curse_00_06 " );	// Hmmm... (thoughtfully) I wouldn't have thought of that.
	AI_Output(other,self, " DIA_Xardas_Pirate_Curse_00_07 " );	// He offers you a deal: save him from the curse and he'll give you a ring.
	AI_Output(self,other, " DIA_Xardas_Pirate_Curse_00_08 " );	// Good. I'll try to help him, but what I need to know is exactly how it all started.
	AI_Output(other,self, " DIA_Xardas_Pirate_Curse_00_09 " );	// It was like this... (tells story about Greg) ...
	AI_Output(self,other, " DIA_Xardas_Pirate_Curse_00_10 " );	// Then it's all clear to me! The curse fell not only on the wearer, but also on those who happened to be in the cave.
	AI_Output(self,other, " DIA_Xardas_Pirate_Curse_00_11 " );	// If we appease the cursed souls, the power of the curse will weaken. Then there will be a chance to take the ring off.
	AI_Output(other,self, " DIA_Xardas_Pirate_Curse_00_12 " );	// I don't think he'd go there again. The memories are too fresh.
	AI_Output(self,other, " DIA_Xardas_Pirate_Curse_00_13 " );	// Then you do it. You kill those damned pirates and bring me the ring.
	XarCurseClear = TRUE;
	B_LogEntry(TOPIC_PirateRing, " Xardas listened to Greg's story and said that it might do to calm the souls of those cursed pirates. It might weaken the power of the ring's curse, and then it can be taken off. Greg barely dares to go near that cave. I'll have to do it . " );
};

instance DIA_Xardas_Pirate_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Pirate_Done_condition;
	information = DIA_Xardas_Pirate_Done_info;
	permanent = FALSE;
	description = " Don't lose that ring. " ;
};

func int DIA_Xardas_Pirate_Done_condition()
{
	if((MIS_PirateRing == LOG_Running) && (Npc_HasItems(hero,ItRi_DarkCurse) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Pirate_Done_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Xardas_Pirate_Done_00_01 " );	// Don't lose that ring.
	B_GiveInvItems(other,self,ItRi_DarkCurse,1);
	Npc_RemoveInvItems(self,ItRi_DarkCurse,1);
	AI_Output(self,other, " DIA_Xardas_Pirate_Done_00_02 " );	// (satisfied) It's finally mine. You have no idea how long I've been waiting for this.
	AI_Output(other,self, " DIA_Xardas_Pirate_Done_00_03 " );	// What about my reward?
	AI_Output(self,other, " DIA_Xardas_Pirate_Done_00_04 " );	// Don't worry! I have prepared a special gift for you.
	B_GiveInvItems(self,other,ItPo_ElixirSHadow,1);
	AI_Output(other,self, " DIA_Xardas_Pirate_Done_00_05 " );	// Any potion?
	AI_Output(self,other, " DIA_Xardas_Pirate_Done_00_06 " );	// Not just any, but a rare elixir! So use it wisely.
	AI_Output(other,self, " DIA_Xardas_Pirate_Done_00_07 " );	// Oh well, thanks.
	MIS_PirateRing = LOG_Success;
	Log_SetTopicStatus(TOPIC_PirateRing,LOG_Success);
	B_LogEntry(TOPIC_PirateRing, " I gave the ring to Xardas and got the reward he deserved. " );
};

instance DIA_NONE_100_Xardas_WhyHere(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_NONE_100_Xardas_WhyHere_condition;
	information = DIA_NONE_100_Xardas_WhyHere_info;
	permanent = FALSE;
	description = " I need to talk to you. " ;
};

func int DIA_NONE_100_Xardas_WhyHere_condition()
{
	// if((Kapitel < 4) && (MIS_TrueDragonMasters == LOG_Running))
	if((Kapitel < 5) && (MIS_TrueDragonMasters == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_NONE_100_Xardas_WhyHere_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Xardas_WhyHere_01_00 " );	// I need to talk to you.
	AI_Output(self,other,"DIA_Xardas_WhyHere_01_01");	//Co se stalo?
	AI_Output(other,self, " DIA_Xardas_WhyHere_01_02 " );	// An orc shaman told me that dragons are not Beliar's creation! It is so?
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_03 " );	// (quietly) Let me explain.
 	AI_Output(self,other, " DIA_Xardas_WhyHere_01_04 " );	// From a recent survey I realized one fact. The threat doesn't come from the places we expected.
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_05 " );	// Only stupid people tend to blame goblins for all their mistakes! In reality, the situation is a bit different.
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_06 " );	// You've met the Rangers, haven't you?
	AI_Output(other,self, " DIA_Xardas_WhyHere_01_07 " );	// Met. Here in that tower.
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_08 " );	// Then we should know the reason why they appear here.
	AI_Output(other,self, " DIA_Xardas_WhyHere_01_09 " );	// Sure. Ranger Dagoth told me about them.
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_10 " );	// And you're not embarrassed knowing what awaits you?
	AI_Output(other,self, " DIA_Xardas_WhyHere_01_11 " );	// What's wrong with that? I killed the Sleeper. Have you already forgotten?
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_12 " );	// Yes, it does... (thoughtfully) Don't you think that's too much credit?
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_13 " );	// The Sleeper was a powerful archdemon, I won't deny that. But before, many heroes attempted similar feats, and most of them ended up in Beliar's realm.
	AI_Output(other,self, " DIA_Xardas_WhyHere_01_14 " );	// What do you mean?
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_15 " );	// I mean they are trying to turn you away from your true path.
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_16 " );	// So don't interact with them much and don't help them with their plans at all.
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_17 " );	// I thought about this for a long time and I think it might have been the goblins who helped us in the end.
	AI_Output(other,self, " DIA_Xardas_WhyHere_01_18 " );	// So what are their plans?
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_19 " );	// I believe they want to destroy the world!
	AI_Output(other,self, " DIA_Xardas_WhyHere_01_20 " );	// Ouch! Interesting... Why would they do that?
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_21 " );	// I can't answer this question because their plans are still a mystery to me.
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_22 " );	// But one thing I know for sure - your role in their affairs is far from over.
	AI_Output(self,other, " DIA_Xardas_WhyHere_01_23 " );	// We must act wisely! There's not much time to spare.
	B_LogEntry(TOPIC_TrueDragonMasters, " Xardas believes that the Guardians are playing a double game and that it is not the Orcs, but the Guardians who want to destroy the world. " );
};

instance DIA_NONE_100_Xardas_WhatDo(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_NONE_100_Xardas_WhatDo_condition;
	information = DIA_NONE_100_Xardas_WhatDo_info;
	permanent = FALSE;
	description = " What are we going to do next? " ;
};

func int DIA_NONE_100_Xardas_WhatDo_condition()
{
	if((MIS_TrueDragonMasters == LOG_Running) && (Npc_KnowsInfo(hero,DIA_NONE_100_Xardas_WhyHere) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_100_Xardas_WhatDo_info()
{
	AI_Output(other,self, " DIA_Xardas_WhatDo_01_00 " );	// And what do we do next?
	AI_Output(self,other, " DIA_Xardas_WhatDo_01_01 " );	// We have to deal with the dragons first! In most key moments, they could get in the way.
	AI_Output(other,self, " DIA_Xardas_WhatDo_01_02 " );	// Are dragons servants of Beliar?
	AI_Output(self,other, " DIA_Xardas_WhatDo_01_03 " );	// These ancient beings are the result of the great power of the elements. The call of the Sleeper woke them from their slumber.
	AI_Output(self,other, " DIA_Xardas_WhatDo_01_04 " );	// They will most likely obey the will of the Guardians more than anyone else.
	AI_Output(other,self, " DIA_Xardas_WhatDo_01_05 " );	// But I always thought dragons were exactly as Beliar's will.
	AI_Output(self,other, " DIA_Xardas_WhatDo_01_06 " );	// (serious) No, not that. Dragons do not serve Beliar.
	AI_Output(self,other, " DIA_Xardas_WhatDo_01_07 " );	// They are too powerful mere pawns in the endless war of the gods.
	AI_Output(self,other, " DIA_Xardas_WhatDo_01_08 " );	// And only the power of their creators can command them. Their masters are the Rangers.
	MIS_TrueDragonMasters = LOG_Success;
	Log_SetTopicStatus(TOPIC_TrueDragonMasters,LOG_Success);
	B_LogEntry(TOPIC_TrueDragonMasters, " Xardas told me that we will proceed according to plan for now. I have to slay dragons in Mining Valley. " );
};

instance DIA_NONE_100_Xardas_Scare(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_NONE_100_Xardas_Scare_condition;
	information = DIA_NONE_100_Xardas_Scare_info;
	permanent = FALSE;
	description = " Aren't you afraid the Guardians will hear your words? " ;
};

func int DIA_NONE_100_Xardas_Scare_condition()
{
	if((MIS_TrueDragonMasters == LOG_Success) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_01") > 2000))
	{
		return TRUE;
	};
};

func void DIA_NONE_100_Xardas_Scare_info()
{
	AI_Output(other,self, " DIA_Xardas_Scare_01_00 " );	// Aren't you afraid the Guardians will hear your words?
	AI_Output(self,other, " DIA_Xardas_Scare_01_01 " );	// (quietly) You're forgetting one thing. It's still my tower.
	AI_Output(self,other, " DIA_Xardas_Scare_01_02 " );	// Of course I'm sure I feel at home here and I'm completely safe here.
	AI_Output(self,other, " DIA_Xardas_Scare_01_03 " );	// So don't worry. No one will ever know about our conversation.
};

instance DIA_Xardas_DarkMageBuySwords(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_DarkMageBuySwords_condition;
	information = DIA_Xardas_DarkMageBuySwords_info;
	permanent = FALSE;
	description = " Perhaps you might be interested in this weapon? " ;
};

func int DIA_Xardas_DarkMageBuySwords_condition()
{
	if((Npc_HasItems(hero,ITMW_FAKESWORD_01) >= 1) && (DarkMageBuySwords == TRUE) && (KreolBuyMasiafSwrods == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DarkMageBuySwords_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Xardas_DarkMageBuySwords_01_00 " );	// Maybe you might be interested in this weapon?
	B_GiveInvItems(other,self,ITMW_FAKESWORD_01,1);
	AI_Output(self,other, " DIA_Xardas_DarkMageBuySwords_01_03 " );	// So, so... Yes, interesting thing! But I don't need her.
	AI_Output(self,other, " DIA_Xardas_DarkMageBuySwords_01_04 " );	// So you better find someone else who might be interested.
	B_GiveInvItems(self,other,ITMW_FAKESWORD_01,1);
};

instance DIA_Xardas_OldTeleports(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_OldTeleports_condition;
	information = DIA_Xardas_OldTeleports_info;
	permanent = FALSE;
	description = " What do you know about those big rocks out there? " ;
};

func int DIA_Xardas_OldTeleports_condition()
{
	if(MIS_OldTeleports == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Xardas_OldTeleports_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Xardas_OldTeleports_01_00 " );	// What do you know about those big rocks out there?
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_01 " );	// As far as I know, the druids who once resided on this island were used.
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_02 " );	// These stones served them as a means of fast travel throughout the island, as a kind of teleportation. They are also in Mining Valley.
	AI_Output(other,self, " DIA_Xardas_OldTeleports_01_03 " );	// Have you tried activating them?
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_04 " );	// Tried but failed.
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_05 " );	// I don't think the druid artifact trigger can be used because they can only be used by druids themselves.
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_06 " );	// But I don't know much about it.
	AI_Output(other,self, " DIA_Xardas_OldTeleports_01_07 " );	// So they're completely useless to us?
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_08 " );	// Not quite... I was able to deal with the relocation process itself.
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_09 " );	// I created a teleportation rune that harnesses the power of these magic stones.
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_10 " );	// But the question remains - will we be able to use the device itself?
	AI_Output(other,self, " DIA_Xardas_OldTeleports_01_11 " );	// I can look around these stones.
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_12 " );	// Hmmm... Why not? After all, I was very busy with the mechanism of those stones.
	AI_Output(self,other, " DIA_Xardas_OldTeleports_01_13 " );	// So I'll give you the rune and you look for some way to resurrect them.
	B_GiveInvItems(self,other,ItRu_GlobalTeleport, 1 );
	AI_Output(other,self, " DIA_Xardas_OldTeleports_01_14 " );	// Ok, I'll give it a try.
	B_LogEntry(TOPIC_OldTeleports, " According to Xardas, these runestones, used by druids, are found all over the island. He doesn't know how to activate the stones themselves, however, he was able to create a rune from the teleportation magic of these objects. Now I need to find the druid artifacts to make the stones work . " );
	XarSeekDruidArt = TRUE;
};

instance DIA_Xardas_OldTeleports_Done(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_OldTeleports_Done_condition;
	information = DIA_Xardas_OldTeleports_Done_info;
	permanent = FALSE;
	description = " I found a way to activate those stones. " ;
};

func int DIA_Xardas_OldTeleports_Done_condition()
{
	if((MIS_OldTeleports == LOG_Running) && (ActivateDruidStone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_OldTeleports_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Xardas_OldTeleports_Done_01_00 " );	// I found a way to activate those stones.
	AI_Output(self,other, " DIA_Xardas_OldTeleports_Done_01_01 " );	// Excellent. Now we will be able to move around the entire island, like the druids themselves once did.
	AI_Output(self,other, " DIA_Xardas_OldTeleports_Done_01_02 " );	// You can keep the rune I gave you earlier.
	MIS_OldTeleports = LOG_Success;
	Log_SetTopicStatus(TOPIC_OldTeleports,LOG_Success);
	B_LogEntry(TOPIC_OldTeleports, " Xardas is happy to be able to move around the island now. " );
};

instance DIA_Xardas_Fregarah (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_Fregarah_condition;
	information = DIA_Xardas_Fregarah_info;
	permanent = FALSE;
	description = " Tell me about the stone golem. " ;
};

func int DIA_Xardas_Fregarah_condition()
{
	if((MIS_XRANFREG == LOG_Running) && (XRANFREGXAR == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Fregarah_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Xardas_Fregarah_01_00 " );	// Tell me about the stone golem.
	AI_Output(self,other, " DIA_Xardas_Fregarah_01_01 " );	// What? What do you mean?
	AI_Output(other,self, " DIA_Xardas_Fregarah_01_02 " );	// The creature that blocks the way to the temple in the mountains. He was spotted by the Fire mages during an expedition to the mountains.
	AI_Output(self,other, " DIA_Xardas_Fregarah_01_03 " );	// Ah... So this is what you mean. How did you find out about it?
	AI_Output(other,self, " DIA_Xardas_Fregarah_01_04 " );	// I read about it in one of the books in the monastery library.
	AI_Output(other,self, " DIA_Xardas_Fregarah_01_05 " );	// In addition, Pyrokar also confirmed this to me.
	AI_Output(self,other, " DIA_Xardas_Fregarah_01_06 " );	// Well of course... (laughs) His fear wouldn't be any greater if a real dragon appeared in front of him at that moment!
	AI_Output(other,self, " DIA_Xardas_Fregarah_01_07 " );	// What do you know about him?
	AI_Output(self,other, " DIA_Xardas_Fregarah_01_08 " );	// Same as you. Nothing more and nothing less!
	AI_Output(self,other, " DIA_Xardas_Fregarah_01_09 " );	// I'm busy enough to have any time left to study golems.
	AI_Output(self,other, " DIA_Xardas_Fregarah_01_10 " );	// So if you're interested in learning more about them, you can find some of my own records here in the tower.
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItWr_Fregarah,"FP_ITEM_XARDAS_07");
};

instance DIA_Xardas_StonnosHronics (C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_StonnosHronics_condition;
	information = DIA_Xardas_StonnosHronics_info;
	permanent = FALSE;
	description = " I read your entries. " ;
};

func int DIA_Xardas_StonnosHronics_condition()
{
	if((MIS_XRANFREG == LOG_Running) && (FregarahSekret == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_StonnosHronics_info()
{
	AI_Output(other,self, " DIA_Xardas_StonnosHronics_01_01 " );	// I read your entries.
	AI_Output(self,other, " DIA_Xardas_StonnosHronics_01_02 " );	// What did you come up with?
	AI_Output(other,self, " DIA_Xardas_StonnosHronics_01_03 " );	// Okay, as for the stone golem...
	AI_Output(self,other, " DIA_Xardas_StonnosHronics_01_04 " );	// (grudgingly) Oh, this again... So what?
	AI_Output(other,self, " DIA_Xardas_StonnosHronics_01_05 " );	// I really need your advice.
	AI_Output(self,other, " DIA_Xardas_StonnosHronics_01_06 " );	// (laughs) You really wouldn't be able to do without me, would you?
	AI_Output(self,other, " DIA_Xardas_StonnosHronics_01_07 " );	// Okay, if it's that important to you... I'll help you.
	AI_Output(self,other, " DIA_Xardas_StonnosHronics_01_08 " );	// If I remember, the events of that day are described in one book. Look into my flooded tower.
	AI_Output(self,other, " DIA_Xardas_StonnosHronics_01_09 " );	// Located in an old crate. Here, take the key.
	B_GiveInvItems(self,other,itke_xardasowt,1);
	AI_Output(other,self,"DIA_Xardas_StonnosHronics_01_10");	//Díky.

     if(Npc_HasItems(hero,ItWr_Fregarah) >= 1)
	{
		AI_Output(self,other, " DIA_Xardas_StonnosHronics_01_11 " );	// (grudgingly) And give me back my notes! I need them.
	     B_GiveInvItems(other,self,ItWr_Fregarah,1);
		Npc_RemoveInvItems(self,ItWr_Fregarah,1);
	};

	XarGiveFirstTome = TRUE;
};

instance DIA_Xardas_HauntedLighthouse(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_HauntedLighthouse_condition;
	information = DIA_Xardas_HauntedLighthouse_info;
	permanent = FALSE;
	description = " Do you understand magic symbols? " ;
};

func int DIA_Xardas_HauntedLighthouse_condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindDamnSigh == TRUE) && (XardasGiveScroll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_HauntedLighthouse_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Xardas_HauntedLighthouse_01_01 " );	// Do you understand magic symbols?
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_01_02 " );	// What is this query? I am a magician. Of course I understand.
	AI_Output(other,self, " DIA_Xardas_HauntedLighthouse_01_03 " );	// Then maybe you could help me understand the meaning of one of them.
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_01_04 " );	// Hmmm... Tell me what he looked like.
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_01_05");	//No tak... (popisuje)
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_01_06 " );	// This is a sign of a curse. Quite old. Where did you see him?
	AI_Output(other,self, " DIA_Xardas_HauntedLighthouse_01_07 " );	// In the old lighthouse near Khorinis.
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_01_08 " );	// Yes, I've heard of that. Local superstitions point to the fact that this lighthouse is cursed and haunted.
	B_LogEntry(TOPIC_HauntedLighthouse, " I told Xardas about that sign. They say it's a symbol of a curse. If I'm going to learn more, I have to figure out what actually happened there back then. " );

	if((MIS_HauntedLighthouse == LOG_Running) && (FindOldSkeleton == TRUE) && (FindOldRing == TRUE) && (KnowStefan == TRUE))
	{
		Info_ClearChoices(DIA_Xardas_HauntedLighthouse);
		Info_AddChoice(DIA_Xardas_HauntedLighthouse, " I think I know what happened at the lighthouse. " ,DIA_Xardas_HauntedLighthouse_FindSkel);
	}
	else
	{
		XarKnowHLH = TRUE;
		AI_Output(other,self, " DIA_Xardas_HauntedLighthouse_01_09 " );	// Well, I'll try to find out.
	};
};

instance DIA_Xardas_HauntedLighthouse_Again(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_HauntedLighthouse_Again_condition;
	information = DIA_Xardas_HauntedLighthouse_Again_info;
	permanent = TRUE;
	description = " Regarding that lighthouse... " ;
};

func int DIA_Xardas_HauntedLighthouse_Again_condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (FindDamnSigh == TRUE) && (XarKnowHLH == TRUE) && (XardasGiveScroll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_HauntedLighthouse_Again_info()
{
	AI_Output(other,self, " DIA_Xardas_HauntedLighthouse_Again_01_01 " );	// About that lighthouse...
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_Again_01_02 " );	// Yes? Did you find out anything?

	if((MIS_HauntedLighthouse == LOG_Running) && (FindOldSkeleton == TRUE) && (FindOldRing == TRUE) && (KnowStefan == TRUE))
	{
		Info_ClearChoices(DIA_Xardas_HauntedLighthouse_Again);
		Info_AddChoice(DIA_Xardas_HauntedLighthouse_Again, " I think I know what happened at the lighthouse. " ,DIA_Xardas_HauntedLighthouse_FindSkel);
	}
	else
	{
		AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_Again_01_03");	//Zatím ne.
	};
};

func void DIA_Xardas_HauntedLighthouse_FindSkel()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Xardas_HauntedLighthouse_FindSkel_01_01 " );	// I think I know what happened at the lighthouse. A few years ago there was a murder there.
	AI_Output(other,self, " DIA_Xardas_HauntedLighthouse_FindSkel_01_02 " );	// Hanna, the owner of the hotel, told me that...
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_FindSkel_01_03 " );	// I'm not interested in details. Your words are enough.
	AI_Output(other,self,"DIA_Xardas_HauntedLighthouse_FindSkel_01_04");	//A co si o tom myslíš?
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_FindSkel_01_05 " );	// I believe there could easily have been some sort of curse there. Then the appearance of ghosts would be easily explained.
	AI_Output(other,self, " DIA_Xardas_HauntedLighthouse_FindSkel_01_06 " );	// How do I undo the curse?
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_FindSkel_01_07 " );	// Hmmm... (thoughtfully) It won't be easy. First, you must know the cause of the murder. Only the ghost of the poor man who was killed can help you with that.
	AI_Output(other,self, " DIA_Xardas_HauntedLighthouse_FindSkel_01_08 " );	// Can we call it somehow?
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_FindSkel_01_09 " );	// Deal with it yourself, I have enough work to do without you.
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_FindSkel_01_10 " );	// Here's your scroll. Its power allows you to summon the spirit of the slain at the place of his death.
	B_GiveInvItems(self,other,ItMi_XardasMagicScroll,1);
	AI_Output(self,other, " DIA_Xardas_HauntedLighthouse_FindSkel_01_11 " );	// Just be careful. Ghosts don't love the living much. If they even talk to you, you can consider it a big success.
	XardasGiveScroll = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse, " I told Xardas about what happened in the lighthouse. Now it is necessary to speak with the spirit of the murdered man to understand why he was killed. Xardas gave me a magical scroll that will summon the spirit of the dead man. However, it must be read in lighthouse at the scene of the murder. " );
	AI_StopProcessInfos(self);
};

instance DIA_Xardas_DealStoryDLH(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_DealStoryDLH_condition;
	information = DIA_Xardas_DealStoryDLH_info;
	permanent = FALSE;
	description = " Regarding that lighthouse... " ;
};

func int DIA_Xardas_DealStoryDLH_condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (DealStoryDLH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DealStoryDLH_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Xardas_DealStoryDLH_01_01 " );	// About the lighthouse... I used the scroll and summoned the spirit of the dead man.
	AI_Output(other,self, " DIA_Xardas_DealStoryDLH_01_02 " );	// He told me everything he knew. Now I have only one question - how do I remove the curse?
	AI_Output(self,other, " DIA_Xardas_DealStoryDLH_01_03 " );	// If I'm not mistaken, only the repentance of the murderer himself in the face of his victim can remove the curse.
	AI_Output(self,other, " DIA_Xardas_DealStoryDLH_01_04 " );	// You have to find that person and bring them to the lighthouse. There he must ask the ghost for forgiveness for his actions.
	AI_Output(self,other, " DIA_Xardas_DealStoryDLH_01_05 " );	// If he forgives him, the curse will lose its power.
	AI_Output(other,self,"DIA_Xardas_DealStoryDLH_01_06");	//A pokud ne?
	AI_Output(self,other, " DIA_Xardas_DealStoryDLH_01_07 " );	// Then it will most likely die.
	CanGoLH = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse, " According to Xardas, only the murderer's repentance in the face of the ghost will remove the curse from the lighthouse. I must find out who killed Stefan and lead him to the lighthouse, where he will plead before the dead for forgiveness. But where do I look for him? It's already so much flight... Maybe I should ask at the port. " );
};

// -------------------------------Slugi Ksara--------------- ------------------------


instance DIA_Xardas_Skeleton_Servant_01_EXIT(C_Info)
{
	npc = Xardas_Skeleton_Servant_01;
	nr = 999;
	condition = DIA_Xardas_Skeleton_Servant_01_EXIT_Condition;
	information = DIA_Xardas_Skeleton_Servant_01_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_Skeleton_Servant_01_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Xardas_Skeleton_Servant_01_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_Skeleton_Servant_01_NO_TALK(C_Info)
{
	npc = Xardas_Skeleton_Servant_01;
	nr = 1;
	condition = DIA_Xardas_Skeleton_Servant_01_NO_TALK_condition;
	information = DIA_Xardas_Skeleton_Servant_01_NO_TALK_info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Xardas_Skeleton_Servant_01_NO_TALK_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Skeleton_Servant_01_NO_TALK_info()
{
	Snd_Play3d(self,"GHOSTCURSE");
	AI_StopProcessInfos(self);
};

instance DIA_Xardas_Skeleton_Servant_02_EXIT(C_Info)
{
	npc = Xardas_Skeleton_Servant_02;
	nr = 999;
	condition = DIA_Xardas_Skeleton_Servant_02_EXIT_Condition;
	information = DIA_Xardas_Skeleton_Servant_02_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Xardas_Skeleton_Servant_02_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Xardas_Skeleton_Servant_02_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_Skeleton_Servant_02_NO_TALK(C_Info)
{
	npc = Xardas_Skeleton_Servant_02;
	nr = 1;
	condition = DIA_Xardas_Skeleton_Servant_02_NO_TALK_condition;
	information = DIA_Xardas_Skeleton_Servant_02_NO_TALK_info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Xardas_Skeleton_Servant_02_NO_TALK_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Skeleton_Servant_02_NO_TALK_info()
{
	Snd_Play3d(self,"GHOSTCURSE");
	AI_StopProcessInfos(self);
};

//-----------------------druid---------------------------------------------

instance DIA_Fregeal_EXIT(C_Info)
{
	npc = NONE_1192_Fregeal;
	nr = 999;
	condition = DIA_Fregeal_EXIT_Condition;
	information = DIA_Fregeal_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Fregeal_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fregeal_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Fregeal_Hello(C_Info)
{
	npc = NONE_1192_Fregeal;
	condition = DIA_Fregeal_Hello_Condition;
	information = DIA_Fregeal_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Fregeal_Hello_Condition()
{
	return TRUE;
};

func void DIA_Fregeal_Hello_Info()
{
	AI_Output(self,other, " DIA_Fregeal_Hello_01_00 " );	// Hello, traveler. Looking for something or just lost?
	AI_Output(other,self, " DIA_Fregeal_Hello_01_01 " );	// Just walking around. What are you doing here?
	AI_Output(self,other, " DIA_Fregeal_Hello_01_02 " );	// I live here.
	AI_Output(other,self, " DIA_Fregeal_Hello_01_03 " );	// Do you live here?! Alone in the woods?
	AI_Output(self,other, " DIA_Fregeal_Hello_01_04 " );	// And what's wrong with the forest?
	AI_Output(other,self, " DIA_Fregeal_Hello_01_05 " );	// There are a lot of dangerous monsters here. Not to mention goblins...
	AI_Output(self,other, " DIA_Fregeal_Hello_01_06 " );	// They wouldn't touch me. I mean nothing to them. As they do for me.
	AI_Output(other,self, " DIA_Fregeal_Hello_01_07 " );	// Did you say animals can't touch you?
	AI_Output(self,other, " DIA_Fregeal_Hello_01_08 " );	// I have no idea why they would do that.
	AI_Output(other,self,"DIA_Fregeal_Hello_01_09");	//A co skřeti?
	AI_Output(self,other, " DIA_Fregeal_Hello_01_10 " );	// I haven't seen them here, yet. And I doubt they would choose to attack me.
	AI_Output(other,self, " DIA_Fregeal_Hello_01_11 " );	// The Goblin is a fairly strong opponent.
	AI_Output(self,other, " DIA_Fregeal_Hello_01_12 " );	// Yes. But my forest brothers will protect me if necessary.
	AI_Output(self,other, " DIA_Fregeal_Hello_01_13 " );	// So you don't have to worry about me.
};

instance DIA_Fregeal_WhatName(C_Info)
{
	npc = NONE_1192_Fregeal;
	condition = DIA_Fregeal_WhatName_Condition;
	information = DIA_Fregeal_WhatName_Info;
	permanent = FALSE;
	description = " What is your name? " ;
};

func int DIA_Fregeal_WhatName_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fregeal_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Fregeal_WhatName_Info()
{
	AI_Output(other,self, " DIA_Fregeal_WhatName_01_00 " );	// What's your name?
	AI_Output(self,other, " DIA_Fregeal_WhatName_01_01 " );	// My name is Fregeal.
	AI_Output(other,self, " DIA_Fregeal_WhatName_01_02 " );	// Hmmm... quite an unusual name for such an herbalist.
	AI_Output(self,other, " DIA_Fregeal_WhatName_01_03 " );	// You know, we don't choose names. I got my name from my grandfather.
	AI_Output(self,other, " DIA_Fregeal_WhatName_01_04 " );	// He must have had a reason for calling me that.
	AI_Output(self,other, " DIA_Fregeal_WhatName_01_05 " );	// But it doesn't matter now. I'm used to it and I have no intention of changing it.
};

var int FregealCanTrade;

instance DIA_Fregeal_WhatDo(C_Info)
{
	npc = NONE_1192_Fregeal;
	condition = DIA_Fregeal_WhatDo_Condition;
	information = DIA_Fregeal_WhatDo_Info;
	permanent = FALSE;
	description = " And what are you doing here? " ;
};

func int DIA_Fregeal_WhatDo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fregeal_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Fregeal_WhatDo_Info()
{
	AI_Output(other,self, " DIA_Fregeal_WhatDo_01_00 " );	// And what are you doing here?
	AI_Output(self,other, " DIA_Fregeal_WhatDo_01_01 " );	// I am an ordinary herbalist. I collect plants and then I create various medicines or herbal teas.
	AI_Output(other,self, " DIA_Fregeal_WhatDo_01_02 " );	// What for example?
	AI_Output(self,other, " DIA_Fregeal_WhatDo_01_03 " );	// Healing, healing from various diseases...
	AI_Output(self,other, " DIA_Fregeal_WhatDo_01_04 " );	// If you suddenly get sick, I could sell you something.
	AI_Output(self,other, " DIA_Fregeal_WhatDo_01_05 " );	// You'll see how quickly you get back on your feet.
	AI_Output(other,self, " DIA_Fregeal_WhatDo_01_06 " );	// Sounds great.
	FregealCanTrade = TRUE;
	Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
	B_LogEntry(Topic_OutTrader, " Herbalist Fregeal can sell me all kinds of goods. " );
};

instance DIA_Fregeal_Trade(C_Info)
{
	npc = NONE_1192_Fregeal;
	nr = 80;
	condition = DIA_Fregeal_Trade_Condition;
	information = DIA_Fregeal_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = " What can you offer me? " ;
};

func int DIA_Fregeal_Trade_Condition()
{
	if((FregealCanTrade == TRUE) && (Wld_IsTime(8,0,23,0) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Fregeal_Trade_Info()
{
	AI_Output(other,self, " DIA_Addon_Martin_Trade_15_00 " );	// What can you offer me?
	B_GiveTradeInv(self);
};

instance DIA_Fregeal_SwampSecret(C_Info)
{
	npc = NONE_1192_Fregeal;
	nr = 1;
	condition = DIA_Fregeal_SwampSecret_condition;
	information = DIA_Fregeal_SwampSecret_info;
	permanent = FALSE;
	description = " Don't you know something about a plant called swamp grass? " ;
};

func int DIA_Fregeal_SwampSecret_condition()
{
	if((MIS_SwampSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Fregeal_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Fregeal_SwampSecret_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Fregeal_SwampSecret_01_00 " );	// Don't you know something about a plant called swamp grass?
	AI_Output(self,other, " DIA_Fregeal_SwampSecret_01_01 " );	// (thoughtfully) No, not really. Why are you interested in this?
	AI_Output(other,self, " DIA_Fregeal_SwampSecret_01_02 " );	// It seems to me that the effects of that plant are too strong for it to be just an ordinary plant.
	AI_Output(self,other, " DIA_Fregeal_SwampSecret_01_03 " );	// Ah... So you want to know why smoking swamp weed has such a big effect on magical power and human consciousness?
	AI_Output(other,self, " DIA_Fregeal_SwampSecret_01_04 " );	// Exactly.
	AI_Output(self,other, " DIA_Fregeal_SwampSecret_01_05 " );	// Unfortunately, I can't answer this question for you. I have a hunch though.
	AI_Output(self,other, " DIA_Fregeal_SwampSecret_01_06 " );	// It seems to me that this plant is generated by elemental magic.
	AI_Output(other,self, " DIA_Fregeal_SwampSecret_01_07 " );	// Elemental magic? What do you mean?
	AI_Output(self,other, " DIA_Fregeal_SwampSecret_01_08 " );	// Usually the gift of magic is transferred to a person from one of the gods. Fire mages are empowered by Innos, Water mages by Adanos, and dark mages by Beliar.
	AI_Output(self,other, " DIA_Fregeal_SwampSecret_01_09 " );	// But there are many more, mighty powers, other than those pertaining to the gods themselves in the world.
	AI_Output(self,other, " DIA_Fregeal_SwampSecret_01_10 " );	// Perhaps swamp grass is part of just such a power. And when a person smokes it, he fills himself with some of this power.
	AI_Output(other,self, " DIA_Fregeal_SwampSecret_01_11 " );	// Are you saying that all those corrupt addicts will one day become powerful mages thanks to this herb?
	AI_Output(self,other, " DIA_Fregeal_SwampSecret_01_12 " );	// Of course not! First, the person must have great strength of mind and devote long months to meditation. Simply, an ignoramus cannot do it.
	AI_Output(self,other, " DIA_Fregeal_SwampSecret_01_13 " );	// But that's just my guess. If you want to know more about this herb, you will have to verify all the information somehow and then you will find out what is true.
	B_LogEntry(TOPIC_SwampSecret, " Fregeal believes that the swamp grass contains the great power of the elements that fills this world. It is hard to believe. If he is right, the only way to learn the secret of the grass is to find out which element gives it its magical power and how the process works. Where can one find the answer to this question? These elements existed before this world. But hardly any of the common people wrote anything about them. Perhaps some ancient artifact that absorbed the power of these elements, shed light on this mystery. " );
};
