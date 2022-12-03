

instance DIA_SKELETON_LORD_KELTUZED_SOUL_EXIT(C_Info)
{
	npc = skeleton_lord_keltuzed;
	nr = 999;
	condition = dia_skeleton_lord_keltuzed_soul_exit_condition;
	information = dia_skeleton_lord_keltuzed_soul_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_skeleton_lord_keltuzed_soul_exit_condition()
{
	return TRUE;
};

func void dia_skeleton_lord_keltuzed_soul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SKELETON_LORD_KELTUZED_SOUL_HALLO(C_Info)
{
	npc = skeleton_lord_keltuzed;
	nr = 1;
	condition = dia_skeleton_lord_keltuzed_soul_hallo_condition;
	information = dia_skeleton_lord_keltuzed_soul_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_skeleton_lord_keltuzed_soul_hallo_condition()
{
	return TRUE;
};

func void dia_skeleton_lord_keltuzed_soul_hallo_info()
{
	B_GivePlayerXP(100);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	AI_Output(self,other, " DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_00 " );	// (dead voice) Who dares to disturb me?! Who called me?!
	AI_Output(other,self, " DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_01 " );	// That was me.
	AI_Output(self,other, " DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_02 " );	// Human?! I thought I had destroyed all of you, you wretched worms!
	AI_Output(other,self, " DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_03 " );	// You're wrong.
	AI_Output(self,other, " DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_04 " );	// Aarggg... And you're cheeky, mortal. But it still won't help you.
	AI_Output(self,other, " DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_05 " );	// Because now I will kill you, and your worthless life will end forever!
	AI_Output(other,self, " DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_06 " );	// Try it if you can.
	AI_Output(self,other,"DIA_Skeleton_Lord_KelTuzed_Soul_HALLO_01_07");	//Ааргггг...
	Info_ClearChoices(dia_skeleton_lord_keltuzed_soul_hallo);
	Info_AddChoice(dia_skeleton_lord_keltuzed_soul_hallo, " (end conversation) " ,dia_skeleton_lord_keltuzed_soul_hallo_ex1);
};

func void dia_skeleton_lord_keltuzed_soul_hallo_ex1()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	self.start_aistate = ZS_MM_AllScheduler;
	skeleton_knight_death_01.aivar[AIV_EnemyOverride] = FALSE;
	skeleton_knight_death_02.aivar[AIV_EnemyOverride] = FALSE;
	skeleton_knight_death_03.aivar[AIV_EnemyOverride] = FALSE;
	skeleton_knight_death_04.aivar[AIV_EnemyOverride] = FALSE;
	Wld_SendTrigger("EVT_DAKKAT_GATE");
};

