

instance DIA_Addon_Pardos_EXIT(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 999;
	condition = DIA_Addon_Pardos_EXIT_Condition;
	information = DIA_Addon_Pardos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Pardos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Pardos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Pardos_Hi(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 2;
	condition = DIA_Addon_Pardos_Hi_Condition;
	information = DIA_Addon_Pardos_Hi_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Addon_Pardos_Hi_Condition()
{
	if (slave_escape ==  FALSE )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Pardos_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_00");	//Как ты?
	AI_Output(self,other, " DIA_Addon_Pardos_Hi_03_01 " );	// I'm tired... (tired) I'm completely exhausted! Tell me, is it a sunny day or a clear night, and thousands of stars twinkle in the sky?
	AI_Output(self,other, " DIA_Addon_Pardos_Hi_03_02 " );	// I don't know if it's a warm summer rain or a cool evening wind. I don't feel anything anymore!
	AI_Output(self,other, " DIA_Addon_Pardos_Hi_03_03 " );	// The eyes fail here first.
};


instance DIA_Addon_Pardos_save(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 2;
	condition = DIA_Addon_Pardos_save_Condition;
	information = DIA_Addon_Pardos_save_Info;
	permanent = FALSE;
	description = " Hold on. Help is coming soon. " ;
};


func int DIA_Addon_Pardos_save_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Pardos_Hi ) && ( Slave_Escape ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Pardos_save_Info()
{
	AI_Output(other,self, " DIA_Addon_Pardos_save_15_00 " );	// Hold on. Help will come soon.
	AI_Output(self,other, " DIA_Addon_Pardos_save_03_01 " );	// (wearily) Thank you. Thanks for the kind words.
};


var int Pardos_Healed;

instance DIA_Addon_Pardos_trank (C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 2;
	condition = DIA_Addon_Pardos_trank_Condition;
	information = DIA_Addon_Pardos_trank_Info;
	permanent = FALSE;
	description = " Here, drink. (give potion) " ;
};


func int DIA_Addon_Pardos_trank_Condition()
{
	if ((Pardos_Geheilt ==  FALSE ) && Npc_KnowsInfo(other,DAY_Addon_Pardos_save))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Pardos_trank_Info()
{
	AI_Output(other,self, " DIA_Addon_Pardos_trank_15_00 " );	// Here, have a drink.
	AI_StandupQuick(self);
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Info_AddChoice(DIA_Addon_Pardos_trank,Dialog_Back,DIA_Addon_Pardos_trank_BACK);
	if(Npc_HasItems(other,ItPo_Health_01))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank, " Give healing essence " ,DIA_Addon_Pardos_trank_01);
	};
	if(Npc_HasItems(other,ItPo_Health_02))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank, " give healing extract " ,DIA_Addon_Pardos_trank_02);
	};
	if(Npc_HasItems(other,ItPo_Health_03))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank, " Give Healing Elixir " ,DIA_Addon_Pardos_trank_03);
	};
	if(Npc_HasItems(other,ItFo_Addon_Meatsoup))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank, " Give Meat Soup. " ,DIA_Addon_Pardos_trank_Soup);
	};
};

func void B_SayPardosThanks()
{
	AI_Output(self,other, " DIA_Addon_Pardos_trank_03_00 " );	// Thank you. I'm better now.
};

func void DIA_Addon_Pardos_trank_BACK()
{
	Info_ClearChoices(DIA_Addon_Pardos_trank);
};

func void DIA_Addon_Pardos_trank_01()
{
	if(B_GiveInvItems(other,self,ItPo_Health_01,1))
	{
		B_UseItem(self,ItPo_Health_01);
	};
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Healed = TRUE ;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Pardos_trank_02()
{
	if(B_GiveInvItems(other,self,ItPo_Health_02,1))
	{
		B_UseItem(self,ItPo_Health_02);
	};
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Healed = TRUE ;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient * 2);
};

func void DIA_Addon_Pardos_trank_03()
{
	if(B_GiveInvItems(other,self,ItPo_Health_01,3))
	{
		B_UseItem(self,ItPo_Health_03);
	};
	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Healed = TRUE ;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient * 3);
};

func void DIA_Addon_Pardos_trank_Soup()
{
	AI_Output(other,self, " DIA_Addon_Pardos_trank_soup_15_00 " );	// Here, eat meat soup.

	if(B_GiveInvItems(other,self,ItFo_Addon_Meatsoup,1))
	{
		B_UseItem(self,ItFo_Addon_Meatsoup);
	};
	AI_Output(self,other, " DIA_Addon_Pardos_trank_03_01 " );	// Thank you. I'm not so weak anymore.
	B_GivePlayerXP(XP_Ambient * 3);
};


instance DIA_Addon_Pardos_perm(C_Info)
{
	npc = STRF_1122_Addon_Pardos;
	nr = 99;
	condition = DIA_Addon_Pardos_perm_Condition;
	information = DIA_Addon_Pardos_perm_Info;
	permanent = TRUE;
	description = " How are you feeling? " ;
};


func int DIA_Addon_Pardos_perm_Condition()
{
	if (Pardos_Healed ==  TRUE )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Pardos_perm_Info()
{
	AI_Output(other,self, " DIA_Addon_Pardos_perm_15_00 " );	// How do you feel?
	AI_Output(self,other, " DIA_Addon_Pardos_perm_03_01 " );	// Thank you, better. My strength is returning.
};

