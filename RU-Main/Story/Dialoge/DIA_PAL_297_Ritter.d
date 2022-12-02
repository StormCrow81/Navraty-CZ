

instance DIA_PAL_297_EXIT(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 999;
	condition = DIA_PAL_297_EXIT_Condition;
	information = DIA_PAL_297_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_297_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_297_TRESPAS(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 2;
	condition = DIA_PAL_297_TRESPAS_Condition;
	information = DIA_PAL_297_TRESPAS_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_PAL_297_TRESPAS_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_TRESPAS_Info()
{
	AI_Output(other,self, " DIA_PAL_297_TRESPAS_15_00 " );	// How are you?
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_PAL_297_TRESPAS_04_01 " );	// It's very dangerous here, so you'd better turn back - we don't want anything to happen to you.
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_297_TRESPAS_04_02 " );	// You are very courageous if you want to enter the Valley. Don't forget to bring more healing potions with you.
	};
};


instance DIA_Addon_PAL_297_Rangerbandits(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 5;
	condition = DIA_Addon_PAL_297_Rangerbandits_Condition;
	information = DIA_Addon_PAL_297_Rangerbandits_Info;
	description = " Were there bandits here recently? " ;
};


func int DIA_Addon_PAL_297_Rangerbandits_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_PAL_297_Rangerbandits_Info()
{
	AI_Output(other,self, " DIA_Addon_PAL_297_Rangerbandits_15_00 " );	// Were there bandits here recently?
	AI_Output(self,other, " DIA_Addon_PAL_297_Rangerbandits_04_01 " );	// I don't understand what you're talking about. While we were on guard, no one passed. And of course, there were no bandits here.
	AI_Output(self,other, " DIA_Addon_PAL_297_Rangerbandits_04_02 " );	// Try asking the peasants. Maybe they saw something.
};

