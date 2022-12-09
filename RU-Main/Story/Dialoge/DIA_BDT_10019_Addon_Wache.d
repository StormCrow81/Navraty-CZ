
instance DIA_Addon_BDT_10019_Wache_EXIT(C_Info)
{
	npc = BDT_10019_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10019_Wache_EXIT_Condition;
	information = DIA_Addon_10019_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10019_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10019_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10019_Wache_Hi(C_Info)
{
	npc = BDT_10019_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10019_Wache_Hi_Condition;
	information = DIA_Addon_10019_Wache_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10019_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10019_Wache_Hi_Info()
{
	AI_Output(self,other, " DIA_Addon_BDT_10019_Wache_Hi_06_00 " );	// Heading to the mine?
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
	Info_AddChoice(DIA_Addon_BDT_10019_Wache_Hi, " Actually, I wanted to see Raven. " ,DIA_Addon_BDT_10019_Wache_Hi_Raven);
	Info_AddChoice(DIA_Addon_BDT_10019_Wache_Hi,"Alright.",DIA_Addon_BDT_10019_Wache_Hi_Ja);
};

func void B_Say_Guard_broken()
{
	AI_Output(other,self, " DIA_Addon_BDT_10019_Wache_kaputt_15_00 " );	// Why did they die?
	AI_Output(self,other, " DIA_Addon_BDT_10019_Wache_kaputt_06_01 " );	// Ha! Worked to death.
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
};

func void DIA_Addon_BDT_10019_Wache_Hi_Raven()
{
	AI_Output(other,self, " DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00 " );	// Actually, I wanted to see Raven.
	AI_Output(self,other, " DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01 " );	// Hey! Just try to enter the temple - and you will end up just like these prisoners.
	AI_Output(self,other, " DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02 " );	// Get yourself into the mine.
	B_Say_Guard_broken();
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
};

func void DIA_Addon_BDT_10019_Wache_Hi_Ja()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00");	//Good.
	AI_Output(self,other, " DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01 " );	// Then try to be more careful than these poor slobs.
	B_Say_Guard_broken();
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
};
