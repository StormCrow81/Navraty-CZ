
instance DIA_Addon_BDT_10026_Wache_EXIT(C_Info)
{
	npc = BDT_10026_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10026_Wache_EXIT_Condition;
	information = DIA_Addon_10026_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10026_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10026_Wache_Hi(C_Info)
{
	npc = BDT_10026_Addon_Wache;
	nr = 99;
	condition = DIA_Addon_10026_Wache_Hi_Condition;
	information = DIA_Addon_10026_Wache_Hi_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_10026_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10026_Wache_Hi_15_00 " );	// How are you?
	if (slave_escape ==  FALSE )
	{
		CreateInvItems(self,ItFo_Bacon,1);
		AI_Output(self,other, " DIA_Addon_BDT_10026_Wache_Hi_13_01 " );	// Too bad we have so few slaves. We should get new ones.
		AI_Output(self,other, " DIA_Addon_BDT_10026_Wache_Hi_13_02 " );	// This batch is done for. Perhaps because they hardly ate anything. Haha!
		B_UseItem(self,ItFo_Bacon);
		AI_Output(self,other, " DIA_Addon_BDT_10026_Wache_Hi_13_03 " );	// But I'd rather send the miners off to work than give those dogs a piece of meat.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_BDT_10026_Wache_Hi_13_04 " );	// The slaves are gone, too bad. I guess we'll have to pay real miners again.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10026_Guard_Crypt (C_Info)
{
	npc = BDT_10026_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10026_Wache_Gruft_Condition;
	information = DIA_Addon_10026_Wache_Gruft_Info;
	permanent = TRUE;
	description = " Do you know anything about the tomb? " ;
};


func int DIA_Addon_10026_Wache_Gruft_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Guard_Crypt_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10026_Wache_Gruft_15_00 " );	// Do you know anything about the tomb?
	AI_Output(self,other, " DIA_Addon_BDT_10026_Wache_Gruft_13_01 " );	// Yes. It's at the end of this passage.
	AI_Output(self,other, " DIA_Addon_BDT_10026_Wache_Gruft_13_02 " );	// Just follow the corpses and you'll find it.
};
