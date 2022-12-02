

instance DIA_VLK_989_REINAR_EXIT(C_Info)
{
	npc = vlk_989_reinar;
	nr = 999;
	condition = dia_vlk_989_reinar_exit_condition;
	information = dia_vlk_989_reinar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_989_reinar_exit_condition()
{
	return TRUE;
};

func void dia_vlk_989_reinar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_REINAR_PICKPOCKET(C_Info)
{
	npc = vlk_989_reinar;
	nr = 998;
	condition = DIA_REINAR_PICKPOCKET_Condition;
	information = DIA_REINAR_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_REINAR_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_REINAR_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_REINAR_PICKPOCKET);
	Info_AddChoice(DIA_REINAR_PICKPOCKET,Dialog_Back,DIA_REINAR_PICKPOCKET_BACK);
	Info_AddChoice(DIA_REINAR_PICKPOCKET,DIALOG_PICKPOCKET,DIA_REINAR_PICKPOCKET_DoIt);
};

func void DIA_REINAR_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_REINAR_PICKPOCKET);
};

func void DIA_REINAR_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_REINAR_PICKPOCKET);
};

instance DIA_VLK_989_REINAR_NO_TALK(C_Info)
{
	npc = vlk_989_reinar;
	nr = 1;
	condition = dia_vlk_989_reinar_no_talk_condition;
	information = dia_vlk_989_reinar_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_989_reign_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void day_vlk_989_reign_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_VLK_989_REINAR_MEET (C_Info);
{
	npc = vlk_989_reign;
	nr = 1;
	condition = dia_vlk_989_reinar_meet_condition;
	information = dia_vlk_989_reinar_meet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_989_reinar_meets_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_989_reinar_meet_info()
{
	AI_Output(self,other, " DIA_VLK_989_Reinar_Meet_01_00 " );	// Hey young man! Are you looking for something?
	AI_Output(self,other, " DIA_VLK_989_Reinar_Meet_01_01 " );	// If so, then you've come to the right place! I am exactly the person you need.
};


instance DAY_VLK_989_REIGN_HELLO (C_Info)
{
	npc = vlk_989_reign;
	nr = 2;
	condition = dia_vlk_989_reinar_hello_condition;
	information = dia_vlk_989_reinar_hello_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_vlk_989_reign_hello_condition()
{
	return TRUE;
};

func void day_vlk_989_reign_hello_info()
{
	AI_Output(other,self,"DIA_VLK_989_Reinar_Hello_01_00");	//Кто ты?
	AI_Output(self,other, " DIA_VLK_989_Reinar_Hello_01_01 " );	// My name is Raynar and, as you may have guessed, I make a little extra money reselling weapons to paladins.
	AI_Output(self,other, " DIA_VLK_989_Reinar_Hello_01_02 " );	// True, I only deal with extremely rare and extremely expensive items, and not with the rubbish that they sell on the marketplace.
	AI_Output(other,self, " DIA_VLK_989_Reinar_Hello_01_03 " );	// Do you buy weapons?
	AI_Output(self,other, " DIA_VLK_989_Reinar_Hello_01_04 " );	// Of course! So if suddenly a young man finds some rare sword or dagger, please bring it to me.
	AI_Output(self,other, " DIA_VLK_989_Reinar_Hello_01_05 " );	// Don't hesitate, I'll give you the best price for it!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Raynar buys rare and unique melee weapons for paladins at a good price. " );
};


instances DIA_VLK_989_REINAR_SELLWEAPON (C_Info)
{
	npc = vlk_989_reign;
	nr = 1;
	condition = dia_vlk_989_reinar_sellweapon_condition;
	information = dia_vlk_989_reinar_sellweapon_info;
	permanent = TRUE;
	description = " I have a rare weapon for sale. " ;
};

func int dia_vlk_989_reinar_sellweapon_condition()
{
	if((c_schasrareweapons() == TRUE) && Npc_KnowsInfo(other,dia_vlk_989_reinar_hello))
	{
		return TRUE;
	};
};

func void dia_vlk_989_reinar_sellweapon_info()
{
	var C_Item EquipWeap;
	EquipWeap = Npc_GetEquippedMeleeWeapon(other);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_00 " );	// I have a rare weapon for sale.
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_01 " );	// Great! Then let's look at it.
	Info_ClearChoices(dia_vlk_989_reinar_sellweapon);
	Info_AddChoice(dia_vlk_989_reinar_sellweapon,Dialog_Back,dia_vlk_989_reinar_sellweapon_back);

	if((Hlp_IsItem(EquipWeap,ItMw_Morgenstern) == FALSE) && (Npc_HasItems(other,ItMw_Morgenstern) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Morning Star' - 150 coins " ,dia_vlk_989_reinar_sellweapon_Morgenstern);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Inquisitor) == FALSE) && (Npc_HasItems(other,ItMw_Inquisitor) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Inquisitor' - 200 coins " ,dia_vlk_989_reinar_sellweapon_Inquisitor);
	};
	if ((Hlp_IsItem(EquipWeap,ItMw_Rabenschnabel) ==  FALSE ) && (Npc_HasItems(other,ItMw_Rabenschnabel) >=  1 ))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Night of the Raven' - 200 coins " ,dia_vlk_989_reinar_sellweapon_Rabenschnabel);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_2H_MACE_107) == FALSE) && (Npc_HasItems(other,ITMW_2H_MACE_107) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Crusher' - 250 coins " ,dia_vlk_989_reinar_sellweapon_Crusher);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_2H_Volebir) == FALSE) && (Npc_HasItems(other,ItMw_2H_Volebir) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Bone Crusher' - 400 coins " ,dia_vlk_989_reinar_sellweapon_Volebir);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_2H_IceHammer) == FALSE) && (Npc_HasItems(other,ItMw_2H_IceHammer) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Ice hammer' - 700 coins " ,dia_vlk_989_reinar_sellweapon_IceHammer);
	};
	if ((Hlp_IsItem(EquipWeap,ItMw_1H_MolagBarMace) ==  FALSE ) && (Npc_HasItems(other,ItMw_1H_MolagBarMace) >=  1 ))
	{
		Info_AddChoice(dia_vlk_989_reinar_cellweapon, " 'size' - 250 months " ,dia_vlk_989_reinar_cellweapon_MolagBarMace);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_2H_SharpTeeth) == FALSE) && (Npc_HasItems(other,ItMw_2H_SharpTeeth) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Razorthorn' - 500 coins " ,dia_vlk_989_reinar_sellweapon_SharpTeeth);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Drakesaebel) == FALSE) && (Npc_HasItems(other,ItMw_Drakesaebel) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Captain Drake's Saber' - 300 coins " ,dia_vlk_989_reinar_sellweapon_Drake);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_1H_SWORD_LONG_05) == FALSE) && (Npc_HasItems(other,ITMW_1H_SWORD_LONG_05) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_cellweapon, " 'Men' - 300 months " ,dia_vlk_989_reinar_cellweapon_Deathruff);
	};
	if ((Hlp_IsItem(EquipWeap,ItMw_Sturmbringer) ==  FALSE ) && (Npc_HasItems(other,ItMw_Sturmbringer) >=  1 ))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Fateful Steel' - 200 coins " ,dia_vlk_989_reinar_sellweapon_Sturmbringer);
	};
	if((Hlp_IsItem(EquipWeap,itmw_1h_Сrest) == FALSE) && (Npc_HasItems(other,itmw_1h_Сrest) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Cross of Destiny' - 200 coins " ,dia_vlk_989_reinar_sellweapon_Сrest);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Orkschlaechter) == FALSE) && (Npc_HasItems(other,ItMw_Orkschlaechter) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Peacekeeper' - 250 coins " ,dia_vlk_989_reinar_sellweapon_orkschlaechter);
	};
	if ((Hlp_IsItem(EquipWeap, ITMW_FEARUND ) ==  FALSE ) && (Npc_HasItems(other, ITMW_FEARUND ) >=  1 ))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'subject matter' - 200 minutes " ,dia_vlk_989_reinar_sellweapon_Fearund);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_1H_KMR_SNAKESWORD_01) == FALSE) && (Npc_HasItems(other,ITMW_1H_KMR_SNAKESWORD_01) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Snake' - 250 coins " ,dia_vlk_989_reinar_sellweapon_SnakeSword);
	};
	if((Hlp_IsItem(EquipWeap,itmw_normardsword) == FALSE) && (Npc_HasItems(other,itmw_normardsword) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Silver Nordmar Sword' - 350 coins " ,dia_vlk_989_reinar_sellweapon_normardsword);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_1H_BLACKSWORD) == FALSE) && (Npc_HasItems(other,ITMW_1H_BLACKSWORD) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Blackheart' - 500 coins " ,dia_vlk_989_reinar_sellweapon_BlackHeart);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_1H_G3A_DAEMONBLADE_01) == FALSE) && (Npc_HasItems(other,ITMW_1H_G3A_DAEMONBLADE_01) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Douche Champion' - 700 coin " ,dia_vlk_989_reinar_sellweapon_DemonBlade);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_1H_GinnokSword) == FALSE) && (Npc_HasItems(other,ItMw_1H_GinnokSword) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Mad Crusader Sword' - 700 coins " ,dia_vlk_989_reinar_sellweapon_GinnokSword);
	};
	if ((Hlp_IsItem(EquipWeap,ItMw_Schlachtaxt) ==  FALSE ) && (Npc_HasItems(other,ItMw_Schlachtaxt) >=  1 ))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Barbarian's Fist' - 300 coins " ,dia_vlk_989_reinar_sellweapon_schlachtaxt);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_2H_KMR_SOULSWORD_01) == FALSE) && (Npc_HasItems(other,ITMW_2H_KMR_SOULSWORD_01) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Dark Vow' - 250 coins " ,dia_vlk_989_reinar_sellweapon_SoulSword);
	};
	if ((Hlp_IsItem(EquipWeap,ItMw_Dragon's Edge) ==  FALSE ) && (Npc_HasItems(other,ItMw_Dragon's Edge) >=  1 ))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Justice' - 500 coins " ,dia_vlk_989_reinar_sellweapon_drachenschneide);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_RuneAxeAncient) == FALSE) && (Npc_HasItems(other,ItMw_RuneAxeAncient) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Ancient Rune Axe' - 500 coins " ,dia_vlk_989_reinar_sellweapon_RuneAxeAncient);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_2H_KMR_RHOBAR_01) == FALSE) && (Npc_HasItems(other,ITMW_2H_KMR_RHOBAR_01) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Robar's Will' - 700 coins " ,dia_vlk_989_reinar_sellweapon_RobarWill);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_DemonHand) == FALSE) && (Npc_HasItems(other,ItMw_DemonHand) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Demon Hand' - 700 coins " ,dia_vlk_989_reinar_sellweapon_DemonHand);
	};
	if((Hlp_IsItem(EquipWeap,itmw_2h_urizel) == FALSE) && (Npc_HasItems(other,itmw_2h_urizel) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Urisel' - 700 coins " ,dia_vlk_989_reinar_sellweapon_urizel);
	};
	if((Hlp_IsItem(EquipWeap,itmw_2h_urizel_nomagic) == FALSE) && (Npc_HasItems(other,itmw_2h_urizel_nomagic) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Urisel' - 500 coins " ,dia_vlk_989_reinar_sellweapon_urizel_nomagic);
	};
	if ((Hlp_IsItem(EquipWeap,itmw_2h_weltenspalter) ==  FALSE ) && (Npc_HasItems(other,itmw_2h_weltenspalter) >=  1 ))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon, " 'Curse of Azgalor' - 2000 coins " ,dia_vlk_989_reinar_sellweapon_weltenspalter);
	};
};

func void dia_vlk_989_reinar_sellweapon_back()
{
	Info_ClearChoices(dia_vlk_989_reinar_sellweapon);
};


func void dia_vlk_989_reinar_sellweapon_Morgenstern()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Morgenstern,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Npc_RemoveInvItems(self,ItMw_Morgenstern,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_Inquisitor()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Inquisitor,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ItMw_Inquisitor,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_Rabenschnabel()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Rabenschnabel, 1 );
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ItMw_Rabenschnabel, 1 );
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_Crusher()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITMW_2H_MACE_107,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ITMW_2H_MACE_107,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_Volebir()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_2H_Volebir,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,400);
	Npc_RemoveInvItems(self,ItMw_2H_Volebir,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_IceHammer()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMw_2H_IceHammer,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ItMw_2H_IceHammer,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_MolagBarMace()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_1H_MolagBarMace,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ItMw_1H_MolagBarMace,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_SharpTeeth()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMw_2H_SharpTeeth,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItMw_2H_SharpTeeth,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_drake()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Drakesaebel,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Npc_RemoveInvItems(self,ItMw_Drakesaebel,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_Deathruff()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITMW_1H_SWORD_LONG_05,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Npc_RemoveInvItems(self,ITMW_1H_SWORD_LONG_05,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_sturmbringer()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Stormbringer, 1 );
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ItMw_Sturmbringer, 1 );
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_Сrest()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,itmw_1h_Сrest,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,itmw_1h_Сrest,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_orkschlaechter()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Orkschlaechter,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ItMw_Orkschlaechter,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_Fearund()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITMW_FEARUND,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ITMW_FEARUND,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_SnakeSword()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITMW_1H_KMR_SNAKESWORD_01,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ITMW_1H_KMR_SNAKESWORD_01,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_normardsword()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,itmw_normardsword,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,350);
	Npc_RemoveInvItems(self,itmw_normardsword,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_BlackHeart()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ITMW_1H_BLACKSWORD,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ITMW_1H_BLACKSWORD,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_DemonBlade()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ITMW_1H_G3A_DAEMONBLADE_01,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ITMW_1H_G3A_DAEMONBLADE_01,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_GinnokSword()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItMw_1H_GinnokSword,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ItMw_1H_GinnokSword,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_battleaxe()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Battleaxe, 1 );
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Npc_RemoveInvItems(self,ItMw_Battleaxe, 1 );
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_SoulSword()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ITMW_2H_KMR_SOULSWORD_01,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ITMW_2H_KMR_SOULSWORD_01,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_drachenschneide()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMw_Dragon's Edge, 1 );
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItMw_Drachenschneide,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_RuneAxeAncient()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMw_RuneAxeAncient,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItMw_RuneAxeAncient,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_RobarWill()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ITMW_2H_KMR_RHOBAR_01,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ITMW_2H_KMR_RHOBAR_01,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_DemonHand()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItMw_DemonHand,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ItMw_DemonHand,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_urizel()
{
	B_GivePlayerXP(400);
	B_GiveInvItems(other,self,itmw_2h_urizel,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,itmw_2h_urizel,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_urizel_nomagic()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,itmw_2h_urizel_nomagic,1);
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,itmw_2h_urizel_nomagic,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

func void dia_vlk_989_reinar_sellweapon_weltenspalter()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,itmw_2h_weltenspalter, 1 );
	AI_Output(other,self, " DIA_VLK_989_Reinar_SellWeapon_01_02 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_03 " );	// Hmmm...(assessing) What a really beautiful and really rare weapon!
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_04 " );	// So I'll probably take it from you. Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,itmw_2h_weltenspalter,1);
	AI_Output(self,other, " DIA_VLK_989_Reinar_SellWeapon_01_05 " );	// And rest assured, this is a good price. No merchant will give you more for it!
};

instance DIA_VLK_989_REINAR_FUCKOFF (C_Info)
{
	npc = vlk_989_reign;
	nr = 10;
	condition = dia_vlk_989_reinar_fuckoff_condition;
	information = dia_vlk_989_reinar_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_989_reinar_fuckoff_condition()
{
	if((REINARPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_989_reinar_fuckoff_info()
{
	AI_Output(self,other, " DIA_VLK_989_Reinar_FuckOff_01_00 " );	// Get out! (angrily) Raynar will have nothing to do with people like you!
	AI_StopProcessInfos(self);
};
