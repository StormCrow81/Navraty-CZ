

func void b_removeorc()
{
	B_RemoveNpc(orc_8563_urgrom);
	B_RemoveNpc(orc_8564_vanhan);
	B_RemoveNpc(orcwarrior_sh_01);
	B_RemoveNpc(orcwarrior_sh_02);
	B_RemoveNpc(orcwarrior_sh_03);
	B_RemoveNpc(orcwarrior_sh_04);
	B_RemoveNpc(orcwarrior_sh_05);
	B_RemoveNpc(orcwarrior_sh_06);
	B_RemoveNpc(orcwarrior_sh_07);
	B_RemoveNpc(orcwarrior_sh_08);
	B_RemoveNpc(orcwarrior_sh_09);
	B_RemoveNpc(orcwarrior_sh_10);
	B_RemoveNpc(orcwarrior_sh_11);
	B_RemoveNpc(orcwarrior_sh_12);
	B_RemoveNpc(orcwarrior_sh_13);
	B_RemoveNpc(orcwarrior_sh_14);
	B_RemoveNpc(orcwarrior_sh_15);
	B_RemoveNpc(orcwarrior_sh_16);
	B_RemoveNpc(orcelite_sh_01);
	B_RemoveNpc(orcelite_sh_02);
	B_RemoveNpc(orcelite_sh_03);
	B_RemoveNpc(orcelite_sh_04);
	B_RemoveNpc(orcelite_sh_05);
	B_RemoveNpc(orcelite_sh_06);
	B_RemoveNpc(orcelite_sh_07);
	B_RemoveNpc(orcelite_sh_08);
	B_RemoveNpc(orcelite_sh_09);
	B_RemoveNpc(orcelite_sh_10);
	B_RemoveNpc(orcelite_sh_11);
	B_RemoveNpc(orcelite_sh_12);
	B_RemoveNpc(orcwarrior_sh_sit_01);
	B_RemoveNpc(orcwarrior_sh_sit_02);
	B_RemoveNpc(orcwarrior_sh_sit_03);
	B_RemoveNpc(orcwarrior_sh_sit_04);
	B_RemoveNpc(orcwarrior_sh_sit_05);
	B_RemoveNpc(orcwarrior_sh_sit_06);
	B_RemoveNpc(orcwarrior_sh_sit_07);
	B_RemoveNpc(orcelite_sh_sit_01);
	B_RemoveNpc(orcelite_sh_sit_02);
	B_RemoveNpc(orcelite_sh_sit_03);
	B_RemoveNpc(orcelite_sh_sit_04);
	B_RemoveNpc(orcshaman_sh_01);
	B_RemoveNpc(orcshaman_sh_02);
	B_RemoveNpc(orcshaman_sh_03);
	B_RemoveNpc(orcshaman_sh_04);
	B_RemoveNpc(orcshaman_sh_05);
	B_RemoveNpc(orcshaman_sh_06);
};

func void b_placeorc()
{
	Wld_InsertNpc(orcshaman_van_xan,"FP_ROAM_ORCSHAMAN_01");
	Wld_InsertNpc(orcwarrior4,"FP_ROAM_MONSTER_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_MONSTER_23");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_22B");
	Wld_InsertNpc(orcwarrior3,"FP_ROAM_SHORC_22C");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_23");
	Wld_InsertNpc(orcwarrior4,"FP_ROAM_SHORC_21");
	Wld_InsertNpc(orcwarrior3,"FP_ROAM_SHORC_16");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_17");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_18");
	Wld_InsertNpc(orcwarrior4,"FP_ROAM_SHORC_14");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_11");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_12");
	Wld_InsertNpc(orcwarrior3,"FP_ROAM_SHORC_07");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_02");
	Wld_InsertNpc(orcwarrior4,"FP_ROAM_SHORC_03");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_SHORC_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_MONSTER_28");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_19");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_20");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_22A");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_13");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_15");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_08");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_09");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_10");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_04");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_05");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_SHORC_06");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SHORC_14");
	Wld_InsertNpc(orcwarrior1s,"FP_CAMPFIRE_SHORC_16");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SHORC_08");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SHORC_09");
	Wld_InsertNpc(orcwarrior1s,"FP_CAMPFIRE_SHORC_10");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SHORC_04");
	Wld_InsertNpc(orcwarrior4,"FP_CAMPFIRE_SHORC_05");
	Wld_InsertNpc(orkelite_addon3s,"FP_CAMPFIRE_SHORC_18");
	Wld_InsertNpc(orkelite_addon3s,"FP_CAMPFIRE_SHORC_13");
	Wld_InsertNpc(orkelite_addon3s,"FP_CAMPFIRE_SHORC_11");
	Wld_InsertNpc(orkelite_addon3s,"FP_CAMPFIRE_SHORC_02");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_17");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_12");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_06");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_07");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_03");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_SHORC_01");
};


instance DIA_ORC_8565_URGROM_EXIT(C_Info)
{
	npc = orc_8565_urgrom;
	nr = 999;
	condition = dia_orc_8565_urgrom_exit_condition;
	information = dia_orc_8565_urgrom_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_orc_8565_urgrom_exit_condition()
{
	return TRUE;
};

func void dia_orc_8565_urgrom_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8565_URGROM_AZGOLOR_DEAD(C_Info)
{
	npc = orc_8565_urgrom;
	condition = dia_orc_8565_urgrom_azgolor_dead_condition;
	information = dia_orc_8565_urgrom_azgolor_dead_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_orc_8565_urgrom_azgolor_dead_condition()
{
	if((BLKDRAGNISDEAD == TRUE) && (CURSEISEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8565_urgrom_azgolor_dead_info()
{
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_01 " );	// The demon is dead!!! Man kill demon!!!
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_02 " );	// To feel, to feel is a curse to disappear.... the spirit of Ur-Grom belongs to him again...
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_03 " );	// Ur-Thunder is no longer a ghost. Ur-Grom is alive! And brothers too! The evil demon will no longer cast spells and kill brothers...
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_04 " );	// Now this valley is free from the dark spells of evil, like all of you.
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_05 " );	// Ur-Thunder say man thank you very much! Ur-Grom respect the man and consider him a friend!
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_06 " );	// I seem to be making friends with orcs... (laughs)
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_07 " );	// Okay, I've got to go. I will pass on the news to Ur-Thrall that the Vale is no longer the source of evil.
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_08 " );	// And of course, his brother is alive!
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_09 " );	// Hello man! Ur-Thunder will always remember the great hero!
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Dead_01_10 " );	// Ur-Thunder go home. Man always find Ur-Thunder in the camp.
	CURSE ISEND = TRUE ;
	AI_StopProcessInfos(self);
	b_removeorc();
	b_placeorc();
	Npc_ExchangeRoutine(self,"urgromhome");
};

instance DIA_ORC_8565_URGROM_AZGOLOR_HUMAN(C_Info)
{
	npc = orc_8565_urgrom;
	condition = dia_orc_8565_urgrom_azgolor_human_condition;
	information = dia_orc_8565_urgrom_azgolor_human_info;
	important = FALSE;
	permanent = TRUE;
	description = " One more thing... " ;
};

func int dia_orc_8565_urgrom_azgolor_human_condition()
{
	if((SAVEHUMAN == FALSE) && (CURSEISENDHUMAN == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8565_urgrom_azgolor_human_info()
{
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_01 " );	// One more thing, Ur-Thunder.
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_02 " );	// Ur-Thunder listen man. What does a person want?
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_03 " );	// In addition to you, there is a small camp of people left in this valley - there are very few of them.
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_04 " );	// I would like to take your word, Ur-Grom, that the orcs will not attack them.
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_05 " );	// Can you make me such a promise?
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_06 " );	// Man is a friend of Ur-Grom, man is a great warrior - Ur-Grom respect man and owe him life!
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_07 " );	// Ur-Grom can give such a word a man, if people do not begin to kill brothers.
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_08 " );	// Well, it's unlikely to come to that. They, just like you, are tired of constant bloody battles.
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_09 " );	// They just want to coexist peacefully here.
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_10 " );	// Ur-Thunder believe the people and give their word that the brothers will not kill other people.
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_11 " );	// Excellent Ur-Thunder! I knew I wasn't wrong about you.
	AI_Output(other,self, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_12 " );	// Now, all my business here is done. Maybe we'll meet again!
	AI_Output(self,other, " DIA_Orc_8565_UrGrom_Azgolor_Human_01_13 " );	// Ur-Thunder talk man goodbye and wish good luck.
	B_LogEntry( TOPIC_HUMANINVALLEY , " I've spoken to Ur-Grom. He's agreed not to kill humans in the Valley of Shadows! Now I need to report this to Elvais " );
	SAVEHUMAN = TRUE;
};
