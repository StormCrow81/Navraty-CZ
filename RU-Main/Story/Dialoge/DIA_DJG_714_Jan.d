
instance DIA_Jan_EXIT(C_Info)
{
	npc = DJG_714_Jan;
	nr = 999;
	condition = DIA_Jan_EXIT_Condition;
	information = DIA_Jan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_Hello(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Hello_Condition;
	information = DIA_Jan_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jan_Hello_Condition()
{
	if (( Capital >=  4 ) && Npc_IsInState ( self , ZS_Talk ) && ( MIS_OCGateOpen ==  FALSE )) ;
	{
		return  1 ;
	};
};

func void DIA_Jan_Hello_Info()
{
	AI_Output(self,other, " DIA_Jan_Hello_10_00 " );	// And what idiot dragged me here?!
	AI_Output(self,other, " DIA_Jan_Hello_10_01 " );	// I thought there might actually be a real job for me here. But there's nothing here but a few arrogant paladins and a band of orcs.
};


instance DIA_JAN_Dragons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragons_Condition;
	information = DIA_Jan_Dragons_Info;
	permanent = FALSE;
	description = " You forgot about dragons! " ;
};


func int DIA_Jan_Dragons_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_JAN_Hello ) && ( MY_JanBecomesSmith ==  FALSE ) && ( Chapter ==  4 ) && ( MY_OCGateOpen ==  FALSE )) ;
	{
		return  1 ;
	};
};

func void DIA_Jan_Dragons_Info()
{
	AI_Output(other,self, " DIA_Jan_Dragons_15_00 " );	// You forgot about dragons!
	AI_Output(self,other, " DIA_Jan_Dragons_10_01 " );	// (with mockery) How could I forget?! You know? I am a blacksmith, not a warrior.
	AI_Output(self,other, " DIA_Jan_Dragons_10_02 " );	// I make weapons. And others fight their way.
	AI_Output(other,self, " DIA_Jan_Dragons_15_03 " );	// Then why aren't you standing behind that anvil?
	AI_Output(self,other, " DIA_Jan_Dragons_10_04 " );	// Paladins won't let me near the forge. If I approach her, they will throw me behind bars.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Jan_Dragons_10_05 " );	// You're one of them. Maybe put in a good word for me?
	};
	Info_ClearChoices(DIA_JAN_Dragons);
	Info_AddChoice(DIA_JAN_Dragons, " I have to go. " ,DIA_JAN_Dragons_ShitHappen);
	Info_AddChoice(DIA_JAN_Dragons, " What if I help you? " ,DIA_JAN_Dragons_Reward);
	Info_AddChoice(DIA_JAN_Dragons, " I'll try to help you. " ,DIA_JAN_Dragons_HelpYou);
};

func void DIA_JAN_Dragons_HelpYou()
{
	AI_Output(other,self, " DIA_JAN_Dragons_HelpYou_15_00 " );	// I'll try to help you.
	AI_Output(self,other, " DIA_JAN_Dragons_HelpYou_10_01 " );	// How do you do it? Parsival ordered the guards to keep us out of anything.
	AI_Output(self,other, " DIA_JAN_Dragons_HelpYou_10_02 " );	// Nobody dares to break it.
	AI_Output(other,self, " DIA_JAN_Dragons_HelpYou_15_03 " );	// I'll do my best.
	AI_Output(self,other, " DIA_JAN_Dragons_HelpYou_10_04 " );	// I can't imagine that he will listen to you.
	Log_CreateTopic(TOPIC_JanBecomesSmith,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith,LOG_Running);
	) ; _ _ _
	MIS_JanBecomesSmith = LOG_Running;
	Info_ClearChoices(DIA_JAN_Dragons);
};

func void DIA_JAN_Dragons_Reward()
{
	AI_Output(other,self, " DIA_JAN_Dragons_Reward_15_00 " );	// What will happen to me if I help you?
	AI_Output(self,other, " DIA_JAN_Dragons_Reward_10_01 " );	// I don't have anything. The only thing I can teach you is something.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_JAN_Dragons_Reward_10_02 " );	// I know a way to make a blade forged from magic ore even stronger.
	};
	Jan_TeachPlayer = TRUE;
};

func void DIA_JAN_Dragons_ShitHappen()
{
	AI_Output(other,self, " DIA_JAN_Dragons_ShitHappen_15_00 " );	// I need to go.
	AI_Output(self,other, " DIA_JAN_Dragons_ShitHappen_10_01 " );	// Everything is just awful. I can't leave this castle and I can't work in the forge.
	Info_ClearChoices(DIA_JAN_Dragons);
};


instance DIA_JAN_Home(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Home_Condition;
	information = DIA_Jan_Home_Info;
	permanent = FALSE;
	description = " Where are you from? " ;
};


func int DIA_Jan_Home_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_JAN_Hello ) && ( Capital >=  4 ) && ( MIS_OCGateOpen ==  FALSE )) .
	{
		return  1 ;
	};
};

func void DIA_Jan_Home_Info()
{
	AI_Output(other,self, " DIA_Jan_Home_15_00 " );	// Where did you come from?
	AI_Output(self,other, " DIA_Jan_Home_10_01 " );	// I joined the guys from the mountains. And we went to this valley to get rich hunting dragons.
	AI_Output(self,other, " DIA_Jan_Home_10_02 " );	// Their leader's name was Silvio. Such a bastard! He treated me like his own property.
};


instance DIA_JAN_OldCamp(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_OldCamp_Condition;
	information = DIA_Jan_OldCamp_Info;
	permanent = TRUE;
	description = " What happened in the castle? " ;
};


func int DIA_Jan_OldCamp_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_JAN_Hello ) && ( Capital ==  4 ) && ( MIS_OCGateOpen ==  FALSE )) ;
	{
		return  1 ;
	};
};

func void DIA_Jan_OldCamp_Info()
{
	AI_Output(other,self, " DIA_Jan_OldCamp_15_00 " );	// What happened in the castle?
	AI_Output(self,other, " DIA_Jan_OldCamp_10_01 " );	// Nothing, as far as I've heard. But, of course, I'm very worried about what happened OUTSIDE the castle.
};


instance DIA_JAN_Parcival (C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Parcival_Condition;
	information = DIA_Jan_Parcival_Info;
	permanent = FALSE;
	description = " I spoke to Parzival. " ;
};


func int DIA_Jan_Parcival_Condition()
{
	if ((MY_JanBecomesSmith !=  LOG_SUCCESS ) && Npc_KnowsInfo(other, DIA_Parcival_Jan) && (MY_OCGateOpen ==  FALSE ))
	{
		return  1 ;
	};
};

func void DIA_Jan_Parcival_Info()
{
	AI_Output(other,self, " DIA_Jan_Parcival_15_00 " );	// I've spoken to Parsival.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//И?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self, " DIA_Jan_Parcival_15_02 " );	// He doesn't trust us dragon hunters.
	}
	else
	{
		AI_Output(other,self, " DIA_Jan_Parcival_15_03 " );	// He doesn't trust you dragon hunters.
	};
	AI_Output(self,other, " DIA_Jan_Parcival_10_04 " );	// Damn. I so want to work.
	AI_Output(self,other, " DIA_Jan_Parcival_10_05 " );	// Well, apparently, we'll have to put up with it. Only Garond can help me now.
};


instance DIA_JAN_JanIsSmith(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_JanIsSmith_Condition;
	information = DIA_Jan_JanIsSmith_Info;
	permanent = FALSE;
	description = " Grab the hammer, there's work for you. " ;
};


func int DIA_Jan_JanIsSmith_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && (MIS_OCGateOpen == FALSE))
	{
		return  1 ;
	};
};

func void DIA_Jan_JanIsSmith_Info()
{
	AI_Output(other,self, " DIA_Jan_JanIsSmith_15_00 " );	// Grab the hammer, there's work for you.
	AI_Output(self,other, " DIA_Jan_JanIsSmith_10_01 " );	// Did you do it? How did you manage?
	AI_Output(other,self, " DIA_Jan_JanIsSmith_15_02 " );	// I had to vouch for you, so don't disappoint me.
	AI_Output(self,other, " DIA_Jan_JanIsSmith_10_03 " );	// Don't worry. I'm so glad I can work again.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SellWeapons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellWeapons_Condition;
	information = DIA_Jan_SellWeapons_Info;
	permanent = FALSE;
	description = " Do you sell weapons? " ;
};


func int DIA_Jan_SellWeapons_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (Jan_TeachPlayer == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return  1 ;
	};
};

func void DIA_Jan_SellWeapons_Info()
{
	AI_Output(other,self, " DIA_Jan_SellWeapons_15_00 " );	// Do you sell weapons?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Jan_SellWeapons_10_01 " );	// No way. So that your brethren will then throw me in a dungeon for trading from under the floor? No, forget it!
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_SellWeapons_10_02 " );	// I could if I had one. But first, I have to secure weapons for the paladins in the castle.
	};
	AI_Output(self,other, " DIA_Jan_SellWeapons_10_03 " );	// But I can show you how to make good weapons.
	Jan_TeachPlayer = TRUE;
};


instance Jan_Training_Talente(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = Jan_Training_Talente_Condition;
	information = Jan_Training_Talente_Info;
	permanent = TRUE;
	description = " Teach me blacksmithing. " ;
};


func int Jan_Training_Talente_Condition()
{
	if (( Jan_TeachPlayer ==  TRUE ) && Npc_KnowsInfo( other , DIA_JAN_JanIsSmith ) && ( MIS_OCGateOpen ==  FALSE ))
	{
		return  1 ;
	};
};

func void Jan_Training_Talente_Info()
{
	AI_Output(other,self, " DIA_Jan_TeachPlayer_15_00 " );	// Teach me blacksmithing.
	AI_Output(self,other, " DIA_Jan_TeachPlayer_10_01 " );	// What exactly do you want to learn how to forge?
	Info_ClearChoices(Jan_Training_Talente);
	Info_AddChoice(Jan_Training_Talente,Dialog_Back,Jan_Training_Smith_Back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt("Научиться ковать ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),Jan_Training_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),Jan_Training_Smith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),Jan_Training_Smith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),Jan_Training_Smith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),Jan_Training_Smith_2hSpecial2);
		};
	};
};

func void Jan_Training_Smith_Back()
{
	Info_ClearChoices(Jan_Training_Talente);
};

func void Jan_Training_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void Jan_Training_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void Jan_Training_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void Jan_Training_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void Jan_Training_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};


var int DAY_JAN_SellArmor_permanent;

instance DIA_JAN_SellArmor(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellArmor_Condition;
	information = DIA_Jan_SellArmor_Info;
	permanent = TRUE;
	description = " Can I buy armor from you? " ;
};


func int DIA_Jan_SellArmor_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == FALSE))
	{
		return  1 ;
	};
};

func void DIA_Jan_SellArmor_Info()
{
	AI_Output(other,self, " DIA_Jan_SellArmor_15_00 " );	// Can I buy armor from you?

	if((hero.guild == GIL_PAL) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other, " DIA_Jan_SellArmor_10_01 " );	// My armor is no match for what you currently have. Forget it.
	}
	else  if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_GUR ))
	{
		AI_Output(self,other, " DIA_Jan_SellArmor_10_02 " );	// Mage who needs armor? Forget it - you'd better go to a tailor. I can't make armor for you.
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_SellArmor_10_03 " );	// If I had them, I would sell them to you. But unfortunately I don't have them.

		if((SBMode == TRUE) || (RealMode[2] == TRUE))
		{
			Info_ClearChoices(DIA_JAN_SellArmor);
			Info_AddChoice(DIA_JAN_SellArmor, " Can you make something for me? " ,DIA_JAN_SellArmor_BuildOne);
		};
	};
};

func void DIA_JAN_SellArmor_Sorry()
{
	AI_Output(other,self, " DIA_JAN_SellArmor_Sorry_15_00 " );	// I don't think it will work.
	AI_Output(self,other, " DIA_JAN_SellArmor_Sorry_10_01 " );	// Well, if you come up with something, let me know.
	Info_ClearChoices(DIA_JAN_SellArmor);
};

func void DIA_JAN_SellArmor_BuildOne()
{
	AI_Output(other,self, " DIA_JAN_SellArmor_BuildOne_15_00 " );	// Can you make something for me?
	AI_Output(self,other, " DIA_JAN_SellArmor_BuildOne_10_01 " );	// Well, if you want something better, you should bring me the necessary materials.
	AI_Output(other,self, " DIA_JAN_SellArmor_BuildOne_15_02 " );	// What do you need?
	AI_Output(self,other, " DIA_JAN_SellArmor_BuildOne_10_03 " );	// You want to fight dragons, don't you? Bring me some dragon scales - I can use them to collect something for you.
	AI_Output(self,other, " DIA_JAN_SellArmor_BuildOne_10_04 " );	// Twenty scales should be enough.
	DIA_JAN_SellArmor_permanent = TRUE ;
	Info_ClearChoices(DIA_JAN_SellArmor);
};


var int Jan_Sells_Armor;

instance DIA_JAN_Dragonscales(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragonscales_Condition;
	information = DIA_Jan_Dragonscales_Info;
	permanent = TRUE;
	description = " I have dragon scales. " ;
};


func int DIA_Jan_Dragonscales_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == TRUE) && (Jan_Sells_Armor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 1))
	{
		return  1 ;
	};
};


var int DIA_JAN_Dragonscales_OneTime;

func void DIA_Jan_Dragonscales_Info()
{
	AI_Output(other,self, " DIA_JAN_Dragonscales_15_00 " );	// I have dragon scales.

	if(Npc_HasItems(other,ItAt_DragonScale) >= 20)
	{
		B_GiveInvItems(other,self,ItAt_DragonScale,20);
		Npc_RemoveInvItems(self,ItAt_DragonScale,20);
		AI_Output(self,other, " DIA_JAN_Dragonscales_10_01 " );	// Good! I think something will come of it.
		AI_Output(self,other, " DIA_JAN_Dragonscales_10_02 " );	// Come in tomorrow and get your new armor.
		if(DIA_JAN_Dragonscales_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_Addon_JanSellsArmor);
			DIA_JAN_Dragonscales_OneTime = TRUE;
		};
		Jan_Sells_Armor = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other, " DIA_JAN_Dragonscales_10_03 " );	// I need two dozen dragon scales, otherwise I won't be able to make you armor.
	};
};


var int DJG_Armor_is_offered;
var int DIA_JAN_ArmorReady_NoPerm;

instance DIA_JAN_ArmorReady(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_ArmorReady_Condition;
	information = DIA_Jan_ArmorReady_Info;
	permanent = TRUE;
	description = " Armor ready? " ;
};

func int DIA_Jan_ArmorReady_Condition()
{
	if ((MIS_OCGateOpen ==  FALSE ) && (Jan_Sells_Armor !=  FALSE ) && (DIA_JAN_ArmorReady_NoPerm ==  FALSE ))
	{
		return  1 ;
	};
};

func void DIA_Jan_ArmorReady_Info()
{
	AI_Output(other,self, " DIA_JAN_ArmorReady_15_00 " );	// Armor ready?
	if(Jan_Sells_Armor == Wld_GetDay())
	{
		AI_Output(self,other, " DIA_JAN_ArmorReady_10_01 " );	// Not yet. Come tomorrow.
	}
	else
	{
		AI_Output(self,other, " DIA_JAN_ArmorReady_10_02 " );	// This is a true work of art. You can buy them if you want.
		AI_Output(self,other, " DIA_JAN_ArmorReady_10_03 " );	// Special price for you.
		AI_Output(other,self, " DIA_JAN_ArmorReady_15_04 " );	// What!? And this is after everything I've done for you
		AI_Output(self,other, " DIA_JAN_ArmorReady_10_05 " );	// Well, don't do that. I also need to earn a living. If you don't want it, don't take it.
		DJG_Armor_is_offered = TRUE;
		DAY_JAN_ArmorReady_NoPerm = TRUE ;
	};
};


var int Jan_DIA_Jan_DJG_ARMOR_M_permanent;

instance DIA_Jan_DJG_ARMOR_M(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_DJG_ARMOR_M_Condition;
	information = DIA_Jan_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = " Dragonscale armor. (Price: 15000 coins) " ;
};

func int DIA_Jan_DJG_ARMOR_M_Condition()
{
	if((Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (DJG_Armor_is_offered == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jan_DJG_ARMOR_M_Info()
{
	AI_Output(other,self, " DIA_Jan_DJG_ARMOR_M_15_00 " );	// I want to buy this armor.

	if(Npc_HasItems(other,ItMi_Gold) >= 15000)
	{
		AI_Output(self,other, " DIA_Jan_DJG_ARMOR_M_10_01 " );	// You'll see, they're worth the money.
		B_GiveInvItems(other,self,ItMi_Gold,15000);
		Npc_RemoveInvItems(self,ItMi_Gold,15000);
		CreateInvItems(self,ITAR_Dargonscale,1);
		B_GiveInvItems(self,other,ITAR_Dargonscale,1);
		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_DJG_ARMOR_M_10_02 " );	// You don't have enough gold.
	};
};

instance DIA_Jan_DragonPlettReport (C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonPlettBericht_Condition;
	information = DIA_Jan_DragonPlettReport_Info;
	description = " About dragons... " ;
};

var int DIA_Jan_DragonPlettBericht_NoPerm;

func int DIA_Jan_DragonPlettBericht_Condition()
{
	if ((Chapter >=  4 ) && Npc_KnowsInfo(other,DIA_JAN_Dragons) && (DIA_Jan_DragonPlettBericht_NoPerm ==  FALSE ) && (MIS_OCGateOpen ==  FALSE ) && (MIS_KilledDragons !=  0 )) ;
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonPlettBericht_Info()
{
	if(MIS_KilledDragons == 1)
	{
		AI_Output(other,self, " DIA_Jan_DragonPlettBericht_15_00 " );	// I killed the dragon.
	}
	else if((MIS_KilledDragons == 2) || (MIS_KilledDragons == 3))
	{
		AI_Output(other,self, " DIA_Jan_DragonPlettBericht_15_01 " );	// I killed some dragons.
	}
	else
	{
		AI_Output(other,self, " DIA_Jan_DragonPlettBericht_15_02 " );	// I killed all the dragons.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Jan_DragonPlettBericht_10_03 " );	// So what? You're a dragon hunter, aren't you?
		AI_Output(other,self, " DIA_Jan_DragonPlettBericht_15_04 " );	// Don't you?
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_DragonPlettBericht_10_05 " );	// Yes, of course, but to be honest, I'm not interested.
	};
	AI_Output(self,other, " DIA_Jan_DragonPlettBericht_10_06 " );	// I already told you, I like making weapons more than killing dragons.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other, " DIA_Jan_DragonPlettBericht_10_07 " );	// However, there is something that might interest me.
		AI_Output(self,other, " DIA_Jan_DragonPlettBericht_10_08 " );	// If you brought me dragon blood, I would pay well for it.
		Jan_WantsDragonBlood = TRUE;
	};
};


instance DIA_Jan_DragonBlood(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonBlood_Condition;
	information = DIA_Jan_DragonBlood_Info;
	permanent = TRUE;
	description = " I have dragon blood for you. " ;
};


func int DIA_Jan_DragonBlood_Condition()
{
	if ((Jan_WantsDragonBlood ==  TRUE ) && (MY_OCGateOpen ==  FALSE ) && Npc_HasItems(other,It_DragonBlood) && ((hero.guild !=  GIL_DJG ) && (hero.guild !=  GIL_SLD ))) ;
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonBlood_Info()
{
	AI_Output(other,self, " DIA_Jan_DragonBlood_15_00 " );	// I brought you dragon blood.
	AI_Output(self,other, " DIA_Jan_DragonBlood_10_01 " );	// Great. Bring me all the blood you can find.
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(Все)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood, " (One tube) " ,DIA_Jan_DragonBlood_1);
	};
};

func void DIA_Jan_DragonBlood_BACK()
{
	Info_ClearChoices(DIA_Jan_DragonBlood);
};

func void DIA_Jan_DragonBlood_1()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = 1;
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	Npc_RemoveInvItems(self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(Все)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood, " (One tube) " ,DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	AI_Print(BloodText);
};

func void DIA_Jan_DragonBlood_all()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = Npc_HasItems(other,ItAt_DragonBlood);
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	Npc_RemoveInvItems(self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(Все)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood, " (One tube) " ,DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	AI_Print(BloodText);
};


instance DIA_Jan_NACHOCGATEOPEN(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_NACHOCGATEOPEN_Condition;
	information = DIA_Jan_NACHOCGATEOPEN_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Jan_NACHOCGATEOPEN_Condition()
{
	if(MIS_OCGateOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jan_NACHOCGATEOPEN_Info()
{
	AI_Output(other,self, " DIA_Jan_NACHOCGATEOPEN_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Jan_NACHOCGATEOPEN_10_01 " );	// Absolutely nothing is clear!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Jan_NACHOCGATEOPEN_10_02 " );	// Why did those idiots open the gate? You paladins are good for nothing!
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_NACHOCGATEOPEN_10_03 " );	// They just took it like that and opened the gate. Idiots! I don't understand this.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jan_PICKPOCKET(C_Info)
{
	npc = DJG_714_Jan;
	nr = 900;
	condition = DIA_Jan_PICKPOCKET_Condition;
	information = DIA_Jan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 37 , 95 );
};

func void DIA_Jan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
	Info_AddChoice(DIA_Jan_PICKPOCKET,Dialog_Back,DIA_Jan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jan_PICKPOCKET_DoIt);
};

func void DIA_Jan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};

func void DIA_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};


instance DIA_JAN_ARMORCANTEACH(C_Info)
{
	npc = DJG_714_Jan;
	nr = 5;
	condition = dia_jan_armorcanteach_condition;
	information = dia_jan_armorcanteach_info;
	permanent = TRUE;
	description = " Can you forge armor? " ;
};


func int dia_jan_armorcanteach_condition()
{
	if((JAN_TEACHARMOR == FALSE) && (other.guild == GIL_DJG) && (MIS_JanBecomesSmith == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_jan_armorcanteach_info()
{
	AI_Output(other,self, " DIA_Jan_ArmorCanTeach_01_00 " );	// Can you forge armor?
	AI_Output(self,other, " DIA_Jan_ArmorCanTeach_01_01 " );	// Yes, I can do something. Why you asking?
	AI_Output(other,self, " DIA_Jan_ArmorCanTeach_01_02 " );	// Can you teach me how to do this?
	AI_Output(self,other, " DIA_Jan_ArmorCanTeach_01_03 " );	// Well, why not. You are also a dragon hunter. I could show you some ways to improve your armor.
	AI_Output(self,other, " DIA_Jan_ArmorCanTeach_01_04 " );	// True, you need to know a little about forging first.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self, " DIA_Jan_ArmorCanTeach_01_05 " );	// I'm pretty good at forging.
		AI_Output(self,other, " DIA_Jan_ArmorCanTeach_01_06 " );	// Yes, I see that you understand. Okay, I'll show you how to do it.
		AI_Output(self,other, " DIA_Jan_ArmorCanTeach_01_07 " );	// But you know, you'll have to pay for it.
		AI_Output(self,other, " DIA_Jan_ArmorCanTeach_01_08 " );	// And so - just say it, and we will begin your training.
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_ArmorCanTeach_01_09 " );	// And you, as I see it, even have no idea what it is!
		AI_Output(self,other, " DIA_Jan_ArmorCanTeach_01_10 " );	// Here's the thing, man. Go learn how to forge first. And then we'll talk about your training.
		AI_Output(self,other, " DIA_Jan_ArmorCanTeach_01_11 " );	// And one more thing: you yourself understand, you will have to pay for this.
	};

	JAN_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ARMORTEACHER , " Yan can teach me how to upgrade dragon hunter armor. " );
};

func void b_jan_teacharmor_4()
{
	AI_Output(self,other, " DIA_Jan_TeachArmor_4_01_01 " );	// So let's get started. Make sure you have all the necessary materials at hand. You take a heated steel billet ...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Jan_TeachArmor_4_01_02 " );	// ...on an anvil you give it the shape of a plate and forge a piece of magic ore into it....
		AI_Output(self,other, " DIA_Jan_TeachArmor_4_01_03 " );	// ...then you make fasteners and connect the plate to them, carefully forging the vanishing points...
		AI_Output(self,other, " DIA_Jan_TeachArmor_4_01_04 " );	// ...after that, you carefully fasten the resulting element to the body of the armor - like this... look... (shows)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_05");	//...готово!
		AI_Output(self,other, " DIA_Jan_TeachArmor_4_01_06 " );	// That's all you need to know to upgrade this armor.
	};
};

func void b_jan_teacharmor_5()
{
	AI_Output(self,other, " DIA_Jan_TeachArmor_5_01_01 " );	// Well, let's get started. It will take a lot of time and effort to create this armor - but trust me, it's worth it...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Jan_TeachArmor_5_01_02 " );	// ...take a hot steel billet and divide it into several equal parts. Try to keep them about the same size...
		AI_Output(self,other, " DIA_Jan_TeachArmor_5_01_03 " );	// ...next, take each piece and process it sequentially with magical ore chips. After fasten the two parts and forge the places of convergence ...
		AI_Output(self,other, " DIA_Jan_TeachArmor_5_01_04 " );	// ...and then you fasten the resulting element to the armor on the sides using a metal plate... Watch how I do it... (shows)
		AI_Output(self,other, " DIA_Jan_TeachArmor_5_01_05 " );	// ...you see how he sat down clearly, practically flowing around the surface of the armor. Strengthen the fastening with metal bolts, and ...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Jan_TeachArmor_5_01_06 " );	// ...done! So how do you like the process? Nothing, a little practice - and you'll get it right.
		AI_Output(self,other, " DIA_Jan_TeachArmor_5_01_07 " );	// Now go try it yourself.
	};
};

func void b_jan_teacharmor_6()
{
	AI_Output(self,other, " DIA_Jan_TeachArmor_6_01_01 " );	// Having mastered this knowledge, you will be able to make such armor, which no other can be compared with in terms of its strength and reliability...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Jan_TeachArmor_6_01_02 " );	// ...watch carefully. You take a hot steel billet and on the anvil you give it the shape of a plate ...
		AI_Output(self,other, " DIA_Jan_TeachArmor_6_01_03 " );	// ...after that, cover the resulting element with magical ore chips and apply a layer of black ore on top...
		AI_Output(self,other, " DIA_Jan_TeachArmor_6_01_04 " );	// ...then you fasten two such plates with steel bolts and fasten them to the armor frame... this is how I do it... (shows)
		AI_Output(self,other, " DIA_Jan_TeachArmor_6_01_05 " );	// ...this will add strength in the places of fastening of all elements of the armor...we knock out the contour of the armor a little more, and...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Jan_TeachArmor_6_01_06 " );	// ...that's it, the armor is ready! Truly a true work of art.
		AI_Output(self,other, " DIA_Jan_TeachArmor_6_01_07 " );	// I have nothing more to teach you. Everything I knew, I told you. Now go and test your knowledge.
	};
};

func void b_janarmorchoices()
{
	Info_ClearChoices(dia_jan_armorteach);
	Info_AddChoice(dia_jan_armorteach,Dialog_Back,dia_jan_armorteach_back);

	if((PLAYER_TALENT_SMITH[20] == FALSE) && (SHOW_DJG_ARMOR_L == TRUE))
	{
		Info_AddChoice(dia_jan_armorteach,B_BuildLearnString( " Upgrade Dragonslayer Light Armor (Cost: 4000 coins) " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_DJG_L_V1 )),dia_jan_armorteach_itar_djg_l_v1);
	};
	if((PLAYER_TALENT_SMITH[21] == FALSE) && (Show_DJG_Armor_M == TRUE))
	{
		Info_AddChoice(dia_jan_armorteach,B_BuildLearnString( " Upgrade Dragonslayer Armor (Cost: 6000 coins) " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_DJG_M_V1 )),dia_jan_armorteach_itar_djg_m_v1);
	};
	if((PLAYER_TALENT_SMITH[22] == FALSE) && (SHOW_DJG_ARMOR_H == TRUE))
	{
		Info_AddChoice(dia_jan_armorteach,B_BuildLearnString( " Upgrade Dragonslayer Heavy Armor (Cost: 8000 coins) " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_DJG_H_V1 )),dia_jan_armorteach_itar_djg_h_v1);
	};
};


instance DIA_JAN_ARMORTEACH(C_Info)
{
	npc = DJG_714_Jan;
	nr = 5;
	condition = dia_jan_armorteach_condition;
	information = dia_jan_armorteach_info;
	permanent = TRUE;
	description = " Teach me how to upgrade my armor. " ;
};


func int dia_jan_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (JAN_TEACHARMOR == TRUE) && (other.guild == GIL_DJG) && (MIS_JanBecomesSmith == LOG_SUCCESS))
	{
		if((PLAYER_TALENT_SMITH[20] == FALSE) || (PLAYER_TALENT_SMITH[21] == FALSE) || (PLAYER_TALENT_SMITH[22] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_jan_armorteach_info()
{
	AI_Output(other,self, " DIA_Jan_ArmorTeach_01_00 " );	// Teach me how to upgrade armor.
	if (Wld_IsTime( 8 , 0 , 20 , 0 ))
	{
		AI_Output(self,other, " DIA_Jan_ArmorTeach_01_01 " );	// And what do you want to know?
		b_janarmorchoices();
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_ArmorTeach_01_02 " );	// I've already finished working at the forge for today.
		AI_Output(self,other, " DIA_Jan_ArmorTeach_01_03 " );	// Come tomorrow morning, then we'll talk about it.
	};
};

func void dia_jan_armorteach_back()
{
	Info_ClearChoices(dia_jan_armorteach);
};

func void dia_jan_armorteach_itar_djg_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 4000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,4000);
			b_jan_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_TeachArmor_04_00 " );	// But you don't have enough gold! So for now, forget about it.
	};
	b_janarmorchoices();
};

func void dia_jan_armorteach_itar_djg_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 6000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,6000);
			b_jan_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_TeachArmor_05_00 " );	// But you don't have enough gold! So for now, forget about it.
	};
	b_janarmorchoices();
};

func void dia_jan_armorteach_itar_djg_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 8000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,8000);
			b_jan_teacharmor_6();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jan_TeachArmor_06_00 " );	// But you don't have enough gold! So for now, forget about it.
	};
	b_janarmorchoices();
};
