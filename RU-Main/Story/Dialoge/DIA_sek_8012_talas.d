

instance DIA_TALAS_EXIT(C_Info)
{
	npc = sek_8012_talas;
	nr = 999;
	condition = dia_talas_exit_condition;
	information = dia_talas_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_talas_exit_condition()
{
	return TRUE;
};

func void dia_talas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALAS_GREET(C_Info)
{
	npc = sek_8012_talas;
	nr = 1;
	condition = dia_talas_greet_condition;
	information = dia_talas_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_talas_greet_condition()
{
	if(Npc_GetDistToWP(self,"NW_PSICAMP_TALAS") <= 1000)
	{
		return TRUE;
	};
};

func void dia_talas_greet_info()
{
	AI_Output(self,other, " DIA_Talas_Greet_05_00 " );	// Come closer! Here, every newcomer receives a gift from me.
};


var int talas_rationday;

instance DIA_TALAS_GETGIFT (C_Info)
{
	npc = sek_8012_talas;
	nr = 1;
	condition = dia_talas_getgeschenk_condition;
	information = dia_talas_getgift_info;
	permanent = FALSE;
	description = " What gift? " ;
};


func int dia_talas_getgeschenk_condition()
{
	return TRUE;
};

func void dia_talas_getgift_info()
{
	AI_Output(other,self, " DIA_Talas_GetGeschenk_15_00 " );	// What gift?
	AI_Output(self,other, " DIA_Talas_GetGeschenk_05_01 " );	// Here are three bog cigarettes. A very strong thing!
	AI_Output(self,other, " DIA_Talas_GetGeschenk_05_02 " );	// You can take a bog from me every day, but if you want more than the usual portion, you will have to pay.
	AI_Output(self,other, " DIA_Talas_GetGeschenk_05_03 " );	// And if you come across any herbs or berries on the road, bring them here. I will pay you.
	CreateInvItems(self,ItMi_Joint,3);
	B_GiveInvItems(self,other,ItMi_Joint,3);
	RATE_RATIONDAY = Wld_GetDay();
	Log_CreateTopic(TOPIC_TRADERPSI,LOG_NOTE);
	; _ _ _ _ _ _
};


instance DIA_TALAS_DAILYRATION(C_Info)
{
	npc = sek_8012_talas;
	nr = 3;
	condition = dia_talas_dailyration_condition;
	information = dia_talas_dailyration_info;
	permanent = 1;
	description = " I've come for my daily portion of bogweed. " ;
};


func int dia_talas_dailyration_condition()
{
	if(Npc_KnowsInfo(hero,dia_talas_getgeschenk) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_SEK) || (hero.guild == GIL_NONE) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_talas_dailyration_info()
{
	AI_Output(other,self, " DIA_Talas_DailyRation_15_00 " );	// I've come for my daily portion of the bogweed.
	if ( TALK_RATIONDAY  != Wld_GetDay())
	{
		AI_Output(self,other, " DIA_Talas_DailyRation_05_01 " );	// Here, take this. Three swamp cigarettes - but don't smoke them all at once!
		CreateInvItems(self,ItMi_Joint,3);
		B_GiveInvItems(self,other,ItMi_Joint,3);
		RATE_RATIONDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_Talas_DailyRation_05_02 " );	// You already got your portion today. If you want more, come tomorrow or buy something.
	};
};


instance DIA_TALAS_BUYJOINTS(C_Info)
{
	npc = sek_8012_talas;
	nr = 4;
	condition = dia_talas_buyjoints_condition;
	information = dia_talas_buyjoints_info;
	permanent = TRUE;
	description = " Let's change. " ;
	trade = TRUE;
};


func int dia_talas_buyjoints_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_talas_getgeschenk ) & & Wld_IsTime ( 9 , 0 , 20 , 0 )) ;
	{
		return TRUE;
	};
};

func void dia_talas_buyjoints_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Talas_BuyJoints_15_00 " );	// Let's change.
	AI_Output(self,other, " DIA_Talas_BuyJoints_05_01 " );	// What do you want from me? Or do you want to sell me something?
	B_GiveTradeInv(self);
};


instance DIA_TALAS_SEKTEHEILEN (C_Info)
{
	npc = sek_8012_talas;
	nr = 1;
	condition = dia_talas_sekteheilen_condition;
	information = dia_talas_sekteheilen_info;
	permanent = FALSE;
	description = " Drink a drink! It helps with a headache. " ;
};


func int dia_talas_sekteheilen_condition()
{
	if ((Npc_HasItems(other,ItPo_Heal_Obsession_MY) >  0 ) && ( MY_SECTS_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero, dia_heal_sectarian_obsession));
	{
		return TRUE;
	};
};

func void dia_talas_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Talas_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Output(self,other, " DIA_Talas_SekteHeilen_01_01 " );	// I seem to be feeling much better!
	AI_Output(self,other, " DIA_Talas_SekteHeilen_01_02 " );	// Thank you very much!
};

