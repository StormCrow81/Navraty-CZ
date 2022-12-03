

instance DIA_Bennet_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Bennet_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_HELLO (C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_HALLO_Condition;
	information = DIA_Bennet_HELLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_HALLO_Condition()
{
	if((Kapitel < 3) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bennet_HALLO_Info()
{
	AI_Output(self,other, " DIA_Bennet_HALLO_06_00 " );	// I don't sell guns! Khaled sells. He is in Onar's house.
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader, " Khaled trades weapons. " );
};


instance DIA_Bennet_TRADE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 700;
	condition = DIA_Bennet_TRADE_Condition;
	information = DIA_Bennet_TRADE_Info;
	permanent = TRUE;
	description = " What about a blacksmith's tool? " ;
	trade = TRUE;
};


func int DIA_Bennet_TRADE_Condition()
{
	if (Wld_IsTime( 8 , 0 , 22 , 0 ) && ((Capital !=  3 ) || (MY_RescueBennet ==  LOG_SUCCESS ) || (DarkPathStart ==  TRUE ))) ;
	{
		return TRUE;
	};
};

var int bennetarrowsday;

func void DIA_Bennet_TRADE_Info()
{
	where int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Bennet_TRADE_15_00 " );	// What about a blacksmith's tool?
	daynow = Wld_GetDay();

	if(BENNETARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (BENNETARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - BENNETARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
			BENNETARROWSDAY = daynow;
		};
	}
	else
	{
		Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
	};

	AI_Output(self,other, " DIA_Bennet_TRADE_06_01 " );	// What do you need?

	if(BennetLOG == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader, " Bennet sells blacksmith supplies. " );
		BennetLOG = TRUE;
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
};


instance DIA_Bennet_WhichWeapons(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 2;
	condition = DIA_Bennet_WhichWeapons_Condition;
	information = DIA_Bennet_WhichWeapons_Info;
	permanent = FALSE;
	description = " What weapon do you make? " ;
};


func int DIA_Bennet_WhichWeapons_Condition()
{
	if (((Chapter !=  3 ) || (MY_RescueBennet ==  LOG_SUCCESS ) || (DarkPathStart ==  TRUE )) && (MY_Bennet_BringOre ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhichWeapons_Info()
{
	AI_Output(other,self, " DIA_Bennet_WhichWeapons_15_00 " );	// What weapon are you making?
	AI_Output(self,other, " DIA_Bennet_WhichWeapons_06_01 " );	// Now - regular swords. Nothing else.
	AI_Output(self,other, " DIA_Bennet_WhichWeapons_06_02 " );	// But if I had magic ore, I could forge a weapon superior to any sword made from ordinary steel.
	AI_Output(self,other, " DIA_Bennet_WhichWeapons_06_03 " );	// Do you happen to know where you can get ores? (laughs) Except in the Valley of Mines, I mean.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Нет.
	AI_Output(self,other, " DIA_Bennet_WhichWeapons_06_05 " );	// Of course you don't.
};


instance DIA_Bennet_BauOrSld(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 3;
	condition = DIA_Bennet_BauOrSld_Condition;
	information = DIA_Bennet_BauOrSld_Info;
	permanent = FALSE;
	description = " Are you with the farmers or the mercenaries? " ;
};


func int DIA_Bennet_BauOrSld_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_BauOrSld_Info()
{
	AI_Output(other,self, " DIA_Bennet_BauOrSld_15_00 " );	// Are you with the farmers or the mercenaries?
	AI_Output(self,other, " DIA_Bennet_BauOrSld_06_01 " );	// You're laughing at me, right?
	AI_Output(other,self, " DIA_Bennet_BauOrSld_15_02 " );	// I'm just curious.
	AI_Output(self,other, " DIA_Bennet_BauOrSld_06_03 " );	// Have you ever seen a farmer forging weapons?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Нет.
	AI_Output(self,other, " DIA_Bennet_BauOrSld_06_05 " );	// Then why are you asking such stupid questions?
};

instance DIA_Bennet_WannaJoin(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 4;
	condition = DIA_Bennet_WannaJoin_Condition;
	information = DIA_Bennet_WannaJoin_Info;
	permanent = TRUE;
	description = " I want to join the mercenaries! " ;
};

func int DIA_Bennet_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_BauOrSld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Bennet_WannaJoin_15_00 " );	// I want to join the mercenaries!
	AI_Output(self,other, " DIA_Bennet_WannaJoin_06_01 " );	// Then stop talking and go to Torlof. Let him give you a test.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self, " DIA_Bennet_WannaJoin_15_02 " );	// I passed the test.
		AI_Output(self,other, " DIA_Bennet_WannaJoin_06_03 " );	// Okay, then I'll vote for you.
	};
};


instance DIA_Bennet_WannaSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_WannaSmith_Condition;
	information = DIA_Bennet_WannaSmith_Info;
	permanent = TRUE;
	description = " Can you teach me how to make swords? " ;
};


func int DIA_Bennet_WannaSmith_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info()
{
	AI_Output(other,self, " DIA_Bennet_WannaSmith_15_00 " );	// Can you teach me how to forge swords?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Конечно.
	AI_Output(self,other, " DIA_Bennet_WannaSmith_06_02 " );	// However, this will cost you some money. Let's say thirty gold pieces!
	Info_ClearChoices(DIA_Bennet_WannaSmith);
	Info_AddChoice(DIA_Bennet_WannaSmith, " Maybe later. " ,DIA_Bennet_WannaSmith_Later);
	Info_AddChoice(DIA_Bennet_WannaSmith, " Okay! Here's your thirty gold coins. " ,DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output(other,self, " DIA_Bennet_WannaSmith_Pay_15_00 " );	// Good! Here's your thirty gold coins.

	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other, " DIA_Bennet_WannaSmith_Pay_06_01 " );	// I must say, this is a very good price! I'm ready to start training as soon as you're ready.
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher, " Bennett can teach me blacksmithing. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_WannaSmith_Pay_06_02 " );	// Don't take me for an idiot. Thirty gold pieces and not one coin less.
	};
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output(other,self, " DIA_Bennet_WannaSmith_Later_15_00 " );	// Maybe later.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};


instance DIA_Bennet_TeachCOMMON(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 6;
	condition = DIA_Bennet_TeachCOMMON_Condition;
	information = DIA_Bennet_TeachCOMMON_Info;
	permanent = TRUE;
	description = " Teach me how to forge swords. " ;
};

func int DIA_Bennet_TeachCOMMON_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info()
{
	AI_Output(other,self, " DIA_Bennet_TeachCOMMON_15_00 " );	// Teach me how to forge swords.
	Info_ClearChoices(DIA_Bennet_TeachCOMMON);
	Info_AddChoice(DIA_Bennet_TeachCOMMON,Dialog_Back,DIA_Bennet_TeachCOMMON_Back);
	Info_AddChoice(DIA_Bennet_TeachCOMMON,b_buildlearnstringforsmithhunt("Выучить кузнечное дело",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Bennet_TeachCOMMON_WEAPON);
};

func void DIA_Bennet_TeachCOMMON_Back()
{
	Info_ClearChoices(DIA_Bennet_TeachCOMMON);
};

func void DIA_Bennet_TeachCOMMON_WEAPON()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		AI_Output(self,other, " DIA_Bennet_TeachCOMMON_06_01 " );	// It's pretty simple: you take a piece of raw steel and hold it over a fire until it's hot.
		AI_Output(self,other, " DIA_Bennet_TeachCOMMON_06_02 " );	// Then you put it on the anvil and shape the sword.
		AI_Output(self,other, " DIA_Bennet_TeachCOMMON_06_03 " );	// Most importantly, make sure the steel doesn't get too cold. You only have a few minutes to craft weapons...
		AI_Output(self,other, " DIA_Bennet_TeachCOMMON_06_04 " );	// And the rest you will learn by yourself - it's just a matter of practice.
	};

	Info_ClearChoices(DIA_Bennet_TeachCOMMON);
};

instance DIA_Bennet_WannaSmithORE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 7;
	condition = DIA_Bennet_WannaSmithORE_Condition;
	information = DIA_Bennet_WannaSmithORE_Info;
	permanent = TRUE;
	description = " Teach me how to forge magical weapons! " ;
};

func int DIA_Bennet_WannaSmithORE_Condition()
{
	if((Bennet_TeachSmith == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info()
{
	AI_Output(other,self, " DIA_Bennet_WannaSmithORE_15_00 " );	// Teach me how to forge magical weapons!

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_01 " );	// But you don't even know the basics of blacksmithing.
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_02 " );	// You must first learn how to forge ordinary swords. And we'll see.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_03 " );	// As long as you're not one of us, I'll be damned if I teach you the secrets of making magical weapons.
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_04 " );	// Only a few blacksmiths are proficient in this art, and I think even the blacksmiths in the city don't know anything about it.
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_05 " );	// And that's good. Otherwise, all those drunken city guards would be brandishing magical swords.

		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_06 " );	// Nothing personal...(grins) I have nothing against you!
		};
	}
	else if(MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_07 " );	// If I had magic ore, I might agree.
		AI_Output(other,self, " DIA_Bennet_WannaSmithORE_15_08 " );	// Oh, come on. I'm with the mercenaries, and I know blacksmithing. What else do you need?
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_09 " );	// Tell me, how interesting should I be forging magic weapons without having magic ore?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//Нууу...
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_11 " );	// Here's what I'll say. I need at least five pieces of ore - or you can forget about it.

		if(MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_Running;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_12 " );	// Great, you brought me the ore, and you also know how to forge a normal sword.
		AI_Output(other,self, " DIA_Bennet_WannaSmithORE_15_13 " );	// So come on, teach me!
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_14 " );	// Most importantly, it doesn't matter if your sword is made entirely of magic ore, or if you just coated a regular sword with a thin layer of it. The surface is the only thing that matters.
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_15 " );	// And since this damn ore is so expensive, you just take a steel billet and a few pieces of ore.
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_16 " );	// Naturally, you can't just cover a finished sword with magic ore. Weapons need to be created from scratch.
		AI_Output(self,other, " DIA_Bennet_WannaSmithORE_06_17 " );	// And everything else depends on the weapon you want to get.
		Bennet_TeachSmith = TRUE;
	};
};

instance DIA_Bennet_WhereOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhereOre_Condition;
	information = DIA_Bennet_WhereOre_Info;
	permanent = FALSE;
	description = " Where can I find magic ore? " ;
};

func int DIA_Bennet_WhereOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info()
{
	AI_Output(other,self, " DIA_Bennet_WhereOre_15_00 " );	// Where can I find magic ore?
	AI_Output(self,other, " DIA_Bennet_WhereOre_06_01 " );	// Oh, if I only knew that. I think you'll probably find something in a mining colony.
	AI_Output(self,other, " DIA_Bennet_WhereOre_06_02 " );	// But maybe you'll get lucky and find some small pieces around here somewhere and you can mold them into a decent chunk of ore.
	AI_Output(self,other, " DIA_Bennet_WhereOre_06_03 " );	// As far as I know, there are abandoned mines in the mountains south of here. Try to try your luck there.
	AI_Output(self,other, " DIA_Bennet_WhereOre_06_04 " );	// But be careful: I heard bandits set up a lair there.
};

instance DIA_Bennet_BringOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 9;
	condition = DIA_Bennet_BringOre_Condition;
	information = DIA_Bennet_BringOre_Info;
	permanent = FALSE;
	description = " Here, take the ore. " ;
};

func int DIA_Bennet_BringOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && (Npc_HasItems(other,ItMi_Nugget) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info()
{
	AI_Output(other,self, " DIA_Bennet_BringOre_15_00 " );	// Here, take this.
	AI_Output(self,other, " DIA_Bennet_BringOre_06_01 " );	// (laughs) Show me!
	B_GiveInvItems(other,self,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ItMi_Nugget,5);
	AI_Output(self,other, " DIA_Bennet_BringOre_06_02 " );	// What are you doing! I'm shocked!
	AI_Output(self,other, " DIA_Bennet_BringOre_06_03 " );	// Keep two chunks for yourself. You will need them to make your own weapons.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};

var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;

func void B_SayBennetLATER()
{
	AI_Output(self,other, " DIA_Bennet_GetInnosEye_06_04 " );	// This is not enough. Come in later.
};


instance DIA_Bennet_TeachSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 30;
	condition = DIA_Bennet_TeachSmith_Condition;
	information = DIA_Bennet_TeachSmith_Info;
	permanent = TRUE;
	description = " Teach me how to forge weapons. " ;
};

func int DIA_Bennet_TeachSmith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info()
{
	AI_Output(other,self, " DIA_Bennet_TeachSmith_15_00 " );	// I want to learn more about magic weapons.

	if (Wld_IsTime( 8 , 0 , 22 , 0 ))
	{
		if ((Cap ==  1 ) && (Bennet_Cap2Smith ==  FALSE ))
		{
			AI_Output(self,other, " DIA_Bennet_TeachSmith_06_01 " );	// I can teach you how to forge magical swords and even two-handed blades.
			Bennet_Kap2Smith = TRUE;
		}
		else  if ((Chapter ==  2 ) && (Bennet_Chapter3Smith ==  FALSE ))
		{
			AI_Output(self,other, " DIA_Bennet_TeachSmith_06_02 " );	// I've had some practice, and now I can teach you how to forge one-and-a-half and heavy two-handed magic swords.
			Bennet_Kap3Smith = TRUE;
		}
		else  if ((Chapter ==  3 ) && (Bennet_Kap4Smith ==  FALSE ))
		{
			AI_Output(self,other, " DIA_Bennet_TeachSmith_06_03 " );	// I have nothing to teach you yet. This is the best thing I know how to forge now.
			Bennet_Kap4Smith = TRUE;
		}
		else  if ((Chapter ==  4 ) && (Bennet_Chapter5Smith ==  FALSE ))
		{
			AI_Output(self,other, " DIA_Bennet_TeachSmith_06_04 " );	// Listen! I just got inspired! A magical weapon covered in dragon's blood! I know exactly how to make it.
			AI_Output(self,other, " DIA_Bennet_TeachSmith_06_05 " );	// Hmm, do you want to know?
			Bennet_Kap5Smith = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Bennet_TeachSmith_06_06 " );	// What weapon would you like to learn how to make?
		};

		Info_ClearChoices(DIA_Bennet_TeachSmith);
		Info_AddChoice(DIA_Bennet_TeachSmith,Dialog_Back,DIA_Bennet_TeachSmith_BACK);

		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_TeachSmith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_TeachSmith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_TeachSmith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_TeachSmith_2hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_TeachSmith_1hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_TeachSmith_2hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE) && (Kapitel >= 4))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_TeachSmith_1hSpecial4);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE) && (Kapitel >= 4))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnStringForSmith_SLD(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_TeachSmith_2hSpecial4);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_ArmorTeach_01_02 " );	// I've already finished working at the forge for today. Come tomorrow morning.
	};
};

func void DIA_Bennet_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Bennet_TeachSmith);
};

func void DIA_Bennet_TeachSmith_1hSpecial1()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_TeachSmith_2hSpecial1()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_TeachSmith_1hSpecial2()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_TeachSmith_2hSpecial2()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_TeachSmith_1hSpecial3()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_TeachSmith_2hSpecial3()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_TeachSmith_1hSpecial4()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_TeachSmith_2hSpecial4()
{
	B_TeachPlayerTalentSmith_SLD(self,other,WEAPON_2H_Special_04);
};

instance DIA_Bennet_KAP3_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP3_EXIT_Condition;
	information = DIA_Bennet_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP3_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_WhyPrison(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhyPrison_Condition;
	information = DIA_Bennet_WhyPrison_Info;
	permanent = FALSE;
	description = " How did you end up behind bars? " ;
};

func int DIA_Bennet_WhyPrison_Condition()
{
	if ((Chapter ==  3 ) && (MY_RescueBennet !=  LOG_SUCCESS ) && (DarkPathStart ==  FALSE ) && (MeetDarkRavenSpeaker ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhyPrison_Info()
{
	AI_Output(other,self, " DIA_Bennet_WhyPrison_15_00 " );	// How did you get behind bars?
	AI_Output(self,other, " DIA_Bennet_WhyPrison_06_01 " );	// Those pigs grabbed me and threw me here. They say I killed a paladin.
	AI_Output(self,other, " DIA_Bennet_WhyPrison_06_02 " );	// But I didn't do it, they want to slander me.
	AI_Output(other,self, " DIA_Bennet_WhyPrison_15_03 " );	// Why would they?
	AI_Output(self,other, " DIA_Bennet_WhyPrison_06_04 " );	// How should I know? You have to get me out of here.
	AI_Output(self,other, " DIA_Bennet_WhyPrison_06_05 " );	// Talk to Lord Hagen, break through the wall...well, I don't know...do something!
	MIS_RescueBennet = LOG_Running;
	Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
	B_LogEntry(TOPIC_RescueBennet, " Bennet is in serious trouble. He'll do anything to get out of prison. " );
};

instance DIA_Bennet_Victim(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Victim_Condition;
	information = DIA_Bennet_Victim_Info;
	permanent = FALSE;
	description = " Who was killed? " ;
};


func int DIA_Bennet_Victim_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Victim_Info()
{
	AI_Output(other,self, " DIA_Bennet_Victim_15_00 " );	// Who was killed?
	AI_Output(self,other, " DIA_Bennet_Victim_06_01 " );	// I have no idea - one of the paladins, I don't know who.
	AI_Output(other,self, " DIA_Bennet_Victim_15_02 " );	// Do you know the name?
	AI_Output(self,other, " DIA_Bennet_Victim_06_03 " );	// Some kind of Lothar, in my opinion. Well, I don't know, I'm not sure.
	AI_Output(self,other, " DIA_Bennet_Victim_06_04 " );	// You'd better ask Lord Hagen, he knows all the details.
	B_LogEntry(TOPIC_RescueBennet, " Lothar, one of the paladins, has been killed. Lord Hagen may be able to tell me more about this case, as he is the one who is investigating. " );
};


instance DIA_Bennet_Evidence(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Evidence_Condition;
	information = DIA_Bennet_Evidence_Info;
	permanent = FALSE;
	description = " Do they have evidence against you? " ;
};


func int DIA_Bennet_Evidence_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Evidence_Info()
{
	AI_Output(other,self, " DIA_Bennet_Evidence_15_00 " );	// Do they have evidence against you?
	AI_Output(self,other, " DIA_Bennet_Evidence_06_01 " );	// They say there is a witness who identified me.
	AI_Output(other,self, " DIA_Bennet_Evidence_15_02 " );	// Do you know who this witness is?
	AI_Output(self,other, " DIA_Bennet_Evidence_06_03 " );	// No. I only know that he is lying.
	B_LogEntry(TOPIC_RescueBennet, " There is a witness who claims to have seen Bennet do this. I must find that witness if I want to find out the truth. " );
	RescueBennet_KnowsWitness = TRUE;
};


instance DIA_Bennet_Investigation(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Investigation_Condition;
	information = DIA_Bennet_Investigation_Info;
	permanent = FALSE;
	description = " Who is investigating? " ;
};


func int DIA_Bennet_Investigation_Condition()
{
	if (( MIS_RescueBench == LOG_Running ) && Npc_KnowsInfo ( other , DIA_Bennet_Evidence ))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Investigation_Info()
{
	AI_Output(other,self, " DIA_Bennet_Investigation_15_00 " );	// Who is investigating?
	AI_Output(self,other, " DIA_Bennet_Investigation_06_01 " );	// Lord Hagen himself. Since one of the paladins was killed, this case falls under martial law.
	AI_Output(other,self, " DIA_Bennet_Investigation_15_02 " );	// What does this mean?
	AI_Output(self,other, " DIA_Bennet_Investigation_06_03 " );	// This is easy to guess. If I don't get out of here, I'll be hanged without much discussion.
	AI_Output(self,other, " DIA_Bennet_Investigation_06_04 " );	// You must help me, or there will be a war. Lee won't just let it go.
	AI_Output(self,other, " DIA_Bennet_Investigation_06_05 " );	// You yourself understand what this means.
};


instance DIA_Bennet_ThankYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ThankYou_Condition;
	information = DIA_Bennet_ThankYou_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_ThankYou_Condition()
{
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Bennet_ThankYou_Info()
{
	if(hero.guild == GIL_SLD)
	{
		hero.guild = GIL_DJG;
		CheckHeroGuild[0] = TRUE;
	};
	AI_Output(self,other, " DIA_Bennet_ThankYou_06_00 " );	// Oh, and I already thought that they would hang me for sure!
	AI_Output(other,self, " DIA_Bennet_ThankYou_15_01 " );	// Well, it ended well in the end.
	AI_Output(self,other, " DIA_Bennet_ThankYou_06_02 " );	// Yeah! You should have seen the expression on the face of the soldier who let me out!
	AI_Output(self,other, " DIA_Bennet_ThankYou_06_03 " );	// (laughs) He was so scared he almost peeed in his pants.
	AI_Output(self,other, " DIA_Bennet_ThankYou_06_04 " );	// Yes, I almost forgot. I have something for you.
	AI_Output(other,self, " DIA_Bennet_ThankYou_15_05 " );	// What do you mean?
	AI_Output(self,other, " DIA_Bennet_ThankYou_06_06 " );	// (grins) Present.
};

var int BennetNeedSteel;

instance DIA_Bennet_Present(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Present_Condition;
	information = DIA_Bennet_Present_Info;
	permanent = FALSE;
	description = " What present? " ;
};

func int DIA_Bennet_Present_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Present_Info()
{
	AI_Output(other,self, " DIA_Bennet_Present_15_00 " );	// What present?
	AI_Output(self,other, " DIA_Bennet_Present_06_01 " );	// We've all heard about the dragons that seem to have appeared in the Valley.
	AI_Output(other,self, " DIA_Bennet_Present_15_02 " );	// They really are there!
	AI_Output(self,other, " DIA_Bennet_Present_06_03 " );	// Okay, I believe you.

	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Bennet_Present_06_04 " );	// Anyway, some of the guys decided to go to the Valley.
		AI_Output(self,other, " DIA_Bennet_Present_06_05 " );	// They're going to clean up there.
		AI_Output(other,self, " DIA_Bennet_Present_15_06 " );	// What does this have to do with me?
		AI_Output(self,other, " DIA_Bennet_Present_06_07 " );	// I've designed a new type of armor. Dragon Hunter Armor!
		AI_Output(self,other, " DIA_Bennet_Present_06_08 " );	// They are stronger and lighter than traditional armor.
		AI_Output(self,other, " DIA_Bennet_Present_06_09 " );	// Since you saved me, I want you to get the first copy. This is a gift!
		CreateInvItems(self,itar_djg_l,1);
		B_GiveInvItems(self,other,itar_djg_l,1);
		SHOW_DJG_ARMOR_L = TRUE;
		AI_Output(self,other, " DIA_Bennet_Present_06_10 " );	// I thought you might want to have some fun there too. You will need good equipment when you go to this valley.
		AI_Output(self,other, " DIA_Bennet_Present_06_11 " );	// I'm also interested in dragon scales. Real dragon scales. I'll pay you well for them!
		AI_Output(other,self, " DIA_Bennet_Present_15_12 " );	// How much will I get for a scale?
		B_Say_Gold(self,other,Value_DragonScale);
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_Present_06_13 " );	// Okay, I think you might want to take part in the upcoming dragon hunt.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//И?
		AI_Output(self,other, " DIA_Bennet_Present_06_95 " );	// Here, take this gold! You will need it to properly prepare for the upcoming battle.
		B_GiveInvItems(self,other,ItMi_Gold,1000);
	};

	BennetNeedSteel = TRUE;
};


var int Bennet_DragonScale_Counter;

instance DIA_Bennet_DragonScale(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DragonScale_Condition;
	information = DIA_Bennet_DragonScale_Info;
	permanent = TRUE;
	description = " I brought you some dragon scales. " ;
};


func int DIA_Bennet_DragonScale_Condition()
{
	if((Npc_HasItems(other,ItAt_DragonScale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DragonScale_Info()
{
	AI_Output(other,self, " DIA_Bennet_DragonScale_15_00 " );	// I brought you some dragon scales.
	AI_Output(self,other, " DIA_Bennet_DragonScale_06_01 " );	// Real dragon scale!
	AI_Output(self,other, " DIA_Bennet_DragonScale_06_02 " );	// Here's your gold!
	Bennet_DragonScale_Counter = Bennet_DragonScale_Counter + Npc_HasItems(other,ItAt_DragonScale);
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_DragonScale) * Value_DragonScale);
	B_GiveInvItems(other,self,ItAt_DragonScale,Npc_HasItems(other,ItAt_DragonScale));

	if((Bennet_DragonScale_Counter >= 20) && (Show_DJG_Armor_M == FALSE))
	{
		AI_Output(self,other, " DIA_Bennet_DragonScale_06_03 " );	// Okay, this should be enough. I can sell you new, improved armor if you're interested.
		Show_DJG_Armor_M = TRUE;
	};
};


var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;

instance DIA_Bennet_DJG_ARMOR_M(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_M_Condition;
	information = DIA_Bennet_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = " Buy Dragonslayer Armor. (Price: 12000 coins) " ;
};

func int DIA_Bennet_DJG_ARMOR_M_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (Show_DJG_Armor_M == TRUE) && (Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_M_Info()
{
	AI_Output(other,self, " DIA_Bennet_DJG_ARMOR_M_15_00 " );	// I want to buy armor.

	if(Npc_HasItems(other,ItMi_Gold) >= 12000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,12000);
		Npc_RemoveInvItems(self,ItMi_Gold,12000);
		AI_Output(self,other, " DIA_Bennet_DJG_ARMOR_M_06_01 " );	// Very good. I'm sure they won't disappoint you.
		AI_Output(other,self, " DIA_Bennet_DJG_ARMOR_M_15_02 " );	// Yeah, for such and such a price...
		AI_Output(self,other, " DIA_Bennet_DJG_ARMOR_M_06_03 " );	// You will understand that they are worth the money.
		CreateInvItems(self,itar_djg_m,1);
		B_GiveInvItems(self,other,itar_djg_m,1);
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_DJG_ARMOR_M_06_04 " );	// You don't have enough gold.
	};
};


instance DIA_Bennet_BetterArmor(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Condition;
	information = DIA_Bennet_BetterArmor_Info;
	permanent = FALSE;
	description = " I know how to improve the armor further. " ;
};

func int DIA_Bennet_BetterArmor_Condition()
{
	if((DragonHigh == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Info()
{
	AI_Output(other,self, " DIA_Bennet_BetterArmor_15_00 " );	// I know how to improve the armor even more.
	AI_Output(self,other, " DIA_Bennet_BetterArmor_06_01 " );	// Well, tell me.
	AI_Output(other,self, " DIA_Bennet_BetterArmor_15_02 " );	// You can cover dragon scales with magic ore.
	AI_Output(self,other, " DIA_Bennet_BetterArmor_06_03 " );	// This thought came to me too! Yes, you are right.
	AI_Output(self,other, " DIA_Bennet_BetterArmor_06_04 " );	// My new armor surpasses anything you've ever seen. They are very light and very durable.
	AI_Output(self,other, " DIA_Bennet_BetterArmor_06_05 " );	// They are PERFECT!
	AI_Output(self,other, " DIA_Bennet_BetterArmor_06_06 " );	// You can buy them if you want. I would not offer them to anyone, and the price just covers the cost of production.
};


var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;

instance DIA_Bennet_DJG_ARMOR_H(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_H_Condition;
	information = DIA_Bennet_DJG_ARMOR_H_Info;
	permanent = TRUE;
	description = " Buy Heavy Dragonslayer Armor. (Price: 15000 coins) " ;
};

func int DIA_Bennet_DJG_ARMOR_H_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Bennet_BetterArmor))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_H_Info()
{
	AI_Output(other,self, " DIA_Bennet_DJG_ARMOR_H_15_00 " );	// Give me the armor.

	if(Npc_HasItems(other,ItMi_Gold) >= 15000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,15000);
		Npc_RemoveInvItems(self,ItMi_Gold,15000);
		AI_Output(self,other, " DIA_Bennet_DJG_ARMOR_H_06_01 " );	// This is the best armor I've ever made.
		AI_Output(self,other, " DIA_Bennet_DJG_ARMOR_H_06_02 " );	// A true work of art!
		CreateInvItems(self,itar_djg_h,1);
		B_GiveInvItems(self,other,itar_djg_h,1);
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
		SHOW_DJG_ARMOR_H = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_DJG_ARMOR_H_06_03 " );	// You don't have enough gold.
	};
};

var int Bennet_DIA_Bennet_DJG_HELM_H_permanent;

instance DIA_Bennet_DJG_HELM_H(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 9;
	condition = DIA_Bennet_DJG_HELM_H_Condition;
	information = DIA_Bennet_DJG_HELM_H_Info;
	permanent = TRUE;
	description = " Buy a dragon slayer helmet. (Price: 6000 coins) " ;
};

func int DIA_Bennet_DJG_HELM_H_Condition()
{
	if((Bennet_DIA_Bennet_DJG_HELM_H_permanent == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Bennet_BetterArmor) && (hero.guild == GIL_DJG))

	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_HELM_H_Info()
{
	AI_Output(other,self, " DIA_Bennet_DJG_HELM_H_15_00 " );	// Give me the dragonslayer helmet.

	if(Npc_HasItems(other,ItMi_Gold) >= 6000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,6000);
		Npc_RemoveInvItems(self,ItMi_Gold,6000);
		AI_Output(self,other, " DIA_Bennet_DJG_HELM_H_06_01 " );	// Great choice, mate!
		CreateInvItems(self,itar_djg_helm,1);
		B_GiveInvItems(self,other,itar_djg_helm,1);
		Bennet_DIA_Bennet_DJG_HELM_H_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_DJG_HELM_H_06_03 " );	// You don't have enough gold.
	};
};

instance DIA_Bennet_RepairNecklace(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_RepairNecklace_Condition;
	information = DIA_Bennet_RepairNecklace_Info;
	permanent = FALSE;
	description = " Can you repair jewelry? " ;
};

func int DIA_Bennet_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bennet_RepairNecklace_Info()
{
	AI_Output(other,self, " DIA_Bennet_RepairNecklace_15_00 " );	// Can you repair jewelry?
	AI_Output(self,other, " DIA_Bennet_RepairNecklace_06_01 " );	// Maybe. You must show me them first.
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Bennet_RepairNecklace_06_02 " );	// Also, I need to get out of here first.
		AI_Output(self,other, " DIA_Bennet_RepairNecklace_06_03 " );	// Without this, I can't do anything, obviously.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_ShowInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ShowInnosEye_Condition;
	information = DIA_Bennet_ShowInnosEye_Info;
	permanent = FALSE;
	description = " Can you take a look at this amulet? " ;
};


func int DIA_Bennet_ShowInnosEye_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_ShowInnosEye_Info()
{
	AI_Output(other,self, " DIA_Bennet_ShowInnosEye_15_00 " );	// Can you take a look at this amulet?
	AI_Output(self,other, " DIA_Bennet_ShowInnosEye_06_01 " );	// Of course, let's see.
	AI_Output(self,other, " DIA_Bennet_ShowInnosEye_06_02 " );	// Hmmm, excellent work. The frame is broken. But I think, however, I can fix it.
	AI_Output(other,self, " DIA_Bennet_ShowInnosEye_15_03 " );	// How long will it take?
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Bennet_ShowInnosEye_06_04 " );	// Well, I'm stuck here for now. Or do you see a forge around here somewhere?
		AI_Output(self,other, " DIA_Bennet_ShowInnosEye_06_05 " );	// If I was in my forge, I could do it in one day. But of course, I need to get out of here first.
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_ShowInnosEye_06_06 " );	// If you leave it to me, it will be as good as new by tomorrow morning.
		AI_Output(self,other, " DIA_Bennet_ShowInnosEye_06_07 " );	// And I won't even charge you for this job. It was you who got me out of prison.
	};
	B_LogEntry( TOPIC_INNOSEYE , " Bennet is the blacksmith I need to repair the amulet. " );
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_GiveInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GiveInnosEye_Condition;
	information = DIA_Bennet_GiveInnosEye_Info;
	permanent = FALSE;
	description = " Here is the amulet, please repair it. " ;
};


func int DIA_Bennet_GiveInnosEye_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) >= 1) && (MIS_SCKnowsInnosEyeIsBroken == TRUE) && (MIS_RescueBennet == LOG_SUCCESS) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GiveInnosEye_Info()
{
	AI_Output(other,self, " DIA_Bennet_GiveInnosEye_15_00 " );	// Here is the amulet, please fix it.
	AI_Output(self,other, " DIA_Bennet_GiveInnosEye_06_01 " );	// Good. I will finish the work by tomorrow morning.
	AI_Output(self,other, " DIA_Bennet_GiveInnosEye_06_02 " );	// Come by tomorrow and pick him up.
	Npc_RemoveInvItems(other,ItMi_InnosEye_Broken_Mis,1);
	AI_Print(Print_InnoseyeGiven);
	Bennet_RepairDay = Wld_GetDay();
};


instance DIA_Bennet_GetInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GetInnosEye_Condition;
	information = DIA_Bennet_GetInnosEye_Info;
	permanent = TRUE;
	description = " Is the amulet ready? " ;
};


func int DIA_Bennet_GetInnosEye_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_GiveInnosEye) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GetInnosEye_Info()
{
	AI_Output(other,self, " DIA_Bennet_GetInnosEye_15_00 " );	// Is the amulet ready?
	if(Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Да, держи.
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems(other,ItMi_InnosEye_Broken_Mis,1);
		AI_Print(Print_InnosEyeGet);
		AI_Output(self,other, " DIA_Bennet_GetInnosEye_06_02 " );	// I had to make a new setting for the stone.
		AI_Output(self,other, " DIA_Bennet_GetInnosEye_06_03 " );	// I worked all night and now it's good as new.
		B_LogEntry( TOPIC_INNOSEYE , "The amulet is as good as new again. Bennet did a great job. " );
		MIS_Bennet_InnosEyeRepairedSetting = LOG_SUCCESS;
		B_GivePlayerXP(XP_InnosEyeIsRepaired);
	}
	else
	{
		B_SayBennetLATER();
		AI_Output(self,other, " DIA_Bennet_GetInnosEye_06_05 " );	// If you continue to interfere with me, it will only delay the work.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Bennet_KAP4_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP4_EXIT_Condition;
	information = DIA_Bennet_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP4_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DRACHENEIER (C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_DRACHENEIER_Condition;
	information = DIA_Bennet_DRACHENEIER_Info;
	permanent = TRUE;
	description = " Can you do something with dragon eggs? " ;
};


func int DIA_Bennet_DRACHENEIER_Condition()
{
	if ((Chapter >=  4 ) && (Bennet'sDragonEggOffering ==  0 ) && (Npc_HasItems(other,It's_Dragon_Egg_MY) >=  1 )) ;
	{
		return TRUE;
	};
};


var int BennetsDragonEggOffer;
var int DRAGONEIER_offeredXP_OneTime;

func void DIA_Bennet_DRACHENEIER_Info()
{
	AI_Output(other,self, " DIA_Bennet_DRACHENEIER_15_00 " );	// Can you do something with dragon eggs?

	if (DRACHENEIER_offeredXP_OneTime ==  FALSE )
	{
		AI_Output(self,other, " DIA_Bennet_DRACHENEIER_06_01 " );	// Dragon eggs? Where the hell did you manage to get them?
		AI_Output(other,self, " DIA_Bennet_DRACHENEIER_15_02 " );	// I took them from the lizard people.
		AI_Output(self,other, " DIA_Bennet_DRACHENEIER_06_03 " );	// Let's see.
	};

	B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
	Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,1);

	if (DRACHENEIER_offeredXP_OneTime ==  FALSE )
	{
		AI_Output(self,other, " DIA_Bennet_DRACHENEIER_06_04 " );	// Mmm. Very hard material. Ideal for armor. If only we could open them.
		AI_Output(other,self, " DIA_Bennet_DRACHENEIER_15_05 " );	// Well, how? Do you need them?
		AI_Output(self,other, " DIA_Bennet_DRACHENEIER_06_06 " );	// Of course! Come here.
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_DRACHENEIER_06_07 " );	// So how much longer are you going to twirl them in front of me? Are you selling them or not?
	};

	AI_Output(self,other, " DIA_Bennet_DRACHENEIER_06_08 " );	// I'll pay you, uh, say, three hundred gold pieces for every egg you bring me.
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
	Info_AddChoice(DIA_Bennet_DRACHENEIER, " Then you can keep the gold. I'll keep those eggs for now. " ,DIA_Bennet_DRACHENEIER_nein);
	Info_AddChoice(DIA_Bennet_DRACHENEIER, " Those are dragon eggs, not chicken eggs! " ,DIA_Bennet_DRACHENEIER_mehr);
	Info_AddChoice(DIA_Bennet_DRACHENEIER, " Agreed! " ,DIA_Bennet_DRACHENEIER_ok);

	if (DRACHENEIER_offeredXP_OneTime ==  FALSE )
	{
		B_LogEntry( TOPIC_DRACHENEIER , " Bennett is willing to give a good price for any dragon eggs I find. " );
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		DRACHENEIER_offeredXP_OneTime = TRUE ;
	};
};

func void DIA_Bennet_DRACHENEIER_ok()
{
	AI_Output(other,self, " DIA_Bennet_DRACHENEIER_ok_15_00 " );	// Agreed!
	AI_Output(self,other, " DIA_Bennet_DRACHENEIER_ok_06_01 " );	// Great.
	AI_Output(self,other, " DIA_Bennet_DRACHENEIER_ok_06_02 " );	// If you find more, bring them here.

	if(BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;
	};

	B_GiveInvItems(self,other,ItMi_Gold,BennetsDragonEggOffer);
	AI_Output(self,other, " DIA_Bennet_DRACHENEIER_ok_06_03 " );	// uh. You said you took them from the lizard people?
	AI_Output(other,self, " DIA_Bennet_DRACHENEIER_ok_15_04 " );	// Exactly.
	AI_Output(self,other, " DIA_Bennet_DRACHENEIER_ok_06_05 " );	// As far as I know, lizard people usually live in caves.
	AI_Output(self,other, " DIA_Bennet_DRACHENEIER_ok_06_06 " );	// I wouldn't be surprised if you can find more eggs in the caves nearby.
	B_LogEntry( TOPIC_DRACHENEIER , " Bennett thinks I should look for eggs in the caves of Khorinis. Lizardmen are rumored to have been seen in many of them. " );
	AI_Output(self,other, " DIA_Bennet_DRACHENEIER_ok_06_07 " );	// Here! Take this card. She will help you find the caves.
	B_GiveInvItems(self,other,itwr_map_caves_mis_1,1);
	B_LogEntry( TOPIC_DRACHENEIER , " Bennet gave me a map of the caves, maybe it will help me. " );
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_more()
{
	AI_Output(other,self, " DIA_Bennet_DRACHENEIER_mehr_15_00 " );	// These are dragon eggs, not chicken eggs.
	AI_Output(self,other, " DIA_Bennet_DRACHENEIER_mehr_06_01 " );	// Good! Three hundred and fifty point! I can't give you more - otherwise this case will not pay off.
	BennetsDragonEggOffer = 350;
};

func void DIA_Bennet_DRACHENEIER_nein()
{
	AI_Output(other,self, " DIA_Bennet_DRACHENEIER_nein_15_00 " );	// Then you can keep the gold. I'll keep those eggs for now.
	AI_Output(self,other, " DIA_Bennet_DRACHENEIER_nein_06_01 " );	// Let me know if you change your mind.
	B_GiveInvItems(self,other,ItAt_DragonEgg_MIS,1);
	BennetsDragonEggOffer = 0;
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};


instance DIA_Bennet_EierBringen (C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_EierBringen_Condition;
	information = DIA_Bennet_EierBringen_Info;
	permanent = TRUE;
	description = " Need more dragon eggs? " ;
};

func int DIA_Bennet_EierBringen_Condition()
{
	if ((BennetsDragonEggOffering >  0 ) && (Chapter >=  4 ) && (Npc_HasItems(other,It_DragonEgg_MY) >=  1 )) ;
	{
		return TRUE;
	};
};


var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info()
{
	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;

	AI_Output(other,self, " DIA_Bennet_EierBringen_15_00 " );	// Need more dragon eggs?
	AI_Output(self,other, " DIA_Bennet_EierBringen_06_01 " );	// Of course!
	DragonEggCount = Npc_HasItems(other,ItAt_DragonEgg_MIS);

	if(DragonEggCount == 1)
	{
		AI_Output(other,self, " DIA_Bennet_EierBringen_15_02 " );	// Here! I brought another one.
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
		Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,1);
		DragonEggCounter = DragonEggCounter + 1;
	}
	else
	{
		AI_Output(other,self, " DIA_Bennet_EierBringen_15_03 " );	// I brought some more.
		B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,DragonEggCount);
		Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,DragonEggCount);
		XP_DJG_BringDragonEggs = DragonEggCount * XP_DJG_BringDragonEgg;
		DragonEggCounter = DragonEggCounter + DragonEggCount;
		B_GivePlayerXP(XP_DJG_BringDragonEggs);
	};
	if(DragonEggCounter <= 7)
	{
		AI_Output(self,other, " DIA_Bennet_EierBringen_06_04 " );	// Great. Come here. You looked everywhere, didn't you? Surely there must be more somewhere.
	}
	else if(DragonEggCounter <= 11)
	{
		AI_Output(self,other, " DIA_Bennet_EierBringen_06_05 " );	// Where did you dig them up? It is unlikely that these eggs were left anywhere else.
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_EierBringen_06_06 " );	// I don't think you'll find more eggs. Besides, these are enough for me. I don't even know what I'll do with all of them.
		TOPIC_END_DRACENEIER = TRUE ;
	};

	AI_Output(self,other, " DIA_Bennet_EierBringen_06_07 " );	// Oh, good. Here is your money.
	DragonEggGeld = DragonEggCount * BennetsDragonEggOffer;
	B_GiveInvItems(self,other,ItMi_Gold,DragonEggGeld);
};


instance DIA_Bennet_KAP5_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_KAP5_EXIT_Condition;
	information = DIA_Bennet_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_KAP5_EXIT_Condition()
{
	if (Chapter >=  5 )
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP5_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_KnowWhereEnemy(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_KnowWhereEnemy_Condition;
	information = DIA_Bennet_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " I need to sail to another island. I could use a blacksmith. " ;
};


func int DIA_Bennet_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Bennet_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_KnowWhereEnemy_Info()
{
	AI_Output(other,self, " DIA_Bennet_KnowWhereEnemy_15_00 " );	// I need to sail to another island. I could use a blacksmith.
	AI_Output(self,other, " DIA_Bennet_KnowWhereEnemy_06_01 " );	// And you thought of me?
	AI_Output(other,self, " DIA_Bennet_KnowWhereEnemy_15_02 " );	// Yes. What do you say? At least you can get out of here.
	AI_Output(self,other, " DIA_Bennet_KnowWhereEnemy_06_03 " );	// It's better than working on Onar's farm. Man, even hell is BETTER than here. You can count on me
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew, " Bennett is ready to go immediately. He's an excellent blacksmith. I'm sure I can learn a lot from him. " );
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_Bennet_KnowWhereEnemy_15_04 " );	// My team is now fully staffed.
		AI_Output(self,other, " DIA_Bennet_KnowWhereEnemy_06_05 " );	// Then fire one of her.
	}
	else
	{
		Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy, " I'll let you know when I need you. " ,DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy, " Be my blacksmith. See you at the harbor. " ,DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

func void DIA_Bennet_KnowWhereEnemy_Yes()
{
	AI_Output(other,self, " DIA_Bennet_KnowWhereEnemy_Yes_15_00 " );	// Be my blacksmith. See you at the harbor.
	AI_Output(self,other, " DIA_Bennet_KnowWhereEnemy_Yes_06_01 " );	// Good. See you later.
	B_GivePlayerXP(XP_Crewmember_Success);
	Bennet_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};

func void DIA_Bennet_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_Bennet_KnowWhereEnemy_No_15_00 " );	// I'll let you know when I need you.
	AI_Output(self,other, " DIA_Bennet_KnowWhereEnemy_No_06_01 " );	// Great. I will be here.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};


instance DIA_Bennet_LeaveMyShip(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_LeaveMyShip_Condition;
	information = DIA_Bennet_LeaveMyShip_Info;
	permanent = TRUE;
	description = " I want to find myself another blacksmith. " ;
};


func int DIA_Bennet_LeaveMyShip_Condition()
{
	if((Bennet_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_Bennet_LeaveMyShip_15_00 " );	// I want to find myself another blacksmith.
	AI_Output(self,other, " DIA_Bennet_LeaveMyShip_06_01 " );	// Now you think one thing, in a minute - another. You couldn't decide, could you? When you're sure of what you want, let me know.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Bennet_StillNeedYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_StillNeedYou_Condition;
	information = DIA_Bennet_StillNeedYou_Info;
	permanent = TRUE;
	description = " Come back, I can't find another blacksmith. " ;
};


func int DIA_Bennet_StillNeedYou_Condition()
{
	if(((Bennet_IsOnBoard == LOG_OBSOLETE) || (Bennet_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_Bennet_StillNeedYou_15_00 " );	// Come back, I can't find another blacksmith.
	AI_Output(self,other, " DIA_Bennet_StillNeedYou_06_01 " );	// (embittered) Good! Anyone can mock a simple blacksmith! See you at the harbor.
	Bennet_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Bennet_PICKPOCKET(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 900;
	condition = DIA_Bennet_PICKPOCKET_Condition;
	information = DIA_Bennet_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bennet_PICKPOCKET_Condition()
{
	return  C_Robbery ( 35 , 45 );
};

func void DIA_Bennet_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,Dialog_Back,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};


instance DIA_BENNET_ARMORCANTEACH(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = dia_bennet_armorcanteach_condition;
	information = dia_bennet_armorcanteach_info;
	permanent = TRUE;
	description = " Can you forge armor? " ;
};

func int dia_bennet_armorcanteach_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((BENNET_TEACHARMOR == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
		{
			return TRUE;
		};
	};
};

func void dia_bennet_armorcanteach_info()
{
	AI_Output(other,self, " DIA_Bennet_ArmorCanTeach_01_00 " );	// Can you forge armor?
	AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_01 " );	// Yes, I forge armor for mercenaries. And quite good, as you can see.
	AI_Output(other,self, " DIA_Bennet_ArmorCanTeach_01_02 " );	// Can you sell me some better armor?
	AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_03 " );	// No, man, I can't. Only Lee decides to whom to issue them and for what. So I won't do it without his permission.
	AI_Output(other,self, " DIA_Bennet_ArmorCanTeach_01_05 " );	// Sorry, but I was counting on you.
	AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_06 " );	// Well, if you're itching to get yourself some better armor, then maybe I can help you.
	AI_Output(other,self, " DIA_Bennet_ArmorCanTeach_01_07 " );	// How?
	AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_08 " );	// Well, since you're one of us, I could show you some ways to upgrade your armor.
	AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_09 " );	// But for this you need to know a little about forging.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self, " DIA_Bennet_ArmorCanTeach_01_10 " );	// I'm pretty good at forging.
		AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_11 " );	// Well, let's see... Yes, indeed. Well, that simplifies things a bit.
		AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_12 " );	// I'll teach you what I know. And remember one thing: you will have to pay for your education. I don't do charity work!
		AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_13 " );	// Anyway, come by any time you want to learn something about armor forging.
		AI_Output(other,self, " DIA_Bennet_ArmorCanTeach_01_14 " );	// Okay, I got it.
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_15 " );	// And you, as I see it, even have no idea what it is!
		AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_16 " );	// Here's the thing, man. First, learn the basics of blacksmithing. And then we'll talk about your training.
		AI_Output(self,other, " DIA_Bennet_ArmorCanTeach_01_17 " );	// And keep in mind one thing - you will have to pay for your training. I don't do charity work!
	};
	BENNET_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ARMORTEACHER , " Bennet can teach me how to upgrade mercenary armor. " );
};

func void b_bennet_teacharmor_1()
{
	AI_Output(self,other, " DIA_Bennet_TeachArmor_1_01_01 " );	// Okay, watch carefully how this is done. Get the materials you need and...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Bennet_TeachArmor_1_01_02 " );	// ...on the anvil, you add them in the desired sequence to the heated steel billet...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_1_01_03 " );	// ...after which you give it the necessary shape and fasten it with the existing armor...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_1_01_04 " );	// ...this is how I do it now...(shows)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_1_01_05");	//...вот и все!
		AI_Output(self,other, " DIA_Bennet_TeachArmor_1_01_06 " );	// Now you can try it yourself.
	};
};

func void b_bennet_teacharmor_2()
{
	AI_Output(self,other, " DIA_Bennet_TeachArmor_2_01_01 " );	// Great, carefully remember everything that I'm going to show you now. First of all, you need to have on hand all the materials for forging...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Bennet_TeachArmor_2_01_02 " );	// ...you take a hot steel billet and break it into several component parts...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_2_01_03 " );	// ...in a certain sequence, mixing each part with the next material...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_2_01_04 " );	// ...then you forge them into the frame of the existing armor, especially carefully forging the exit points. That's it, see?
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Bennet_TeachArmor_2_01_05 " );	// ...and that's all!
		AI_Output(self,other, " DIA_Bennet_TeachArmor_2_01_06 " );	// Nothing complicated, trust me. The main thing is to follow the correct sequence of actions.
	};
};

func void b_bennet_teacharmor_3()
{
	AI_Output(self,other, " DIA_Bennet_TeachArmor_3_01_01 " );	// Watch and remember everything I'm going to show you now. In fact, there is nothing complicated here ...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Bennet_TeachArmor_3_01_02 " );	// ...processing a hot steel billet on an anvil, adding iron ore in the required proportion one by one...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_3_01_03 " );	// ...bring the alloy to a homogeneous substance, after which you mix it with the rest of the components...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_3_01_04 " );	// ...then you give it a finished shape and forge it with the contour of the armor... Like this, look - see how I do it?
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Bennet_TeachArmor_3_01_05 " );	// ...that's it!
		AI_Output(self,other, " DIA_Bennet_TeachArmor_3_01_06 " );	// You can see for yourself, it's simple. Now go try it yourself.
	};
};

func void b_bennet_teacharmor_4()
{
	AI_Output(self,other, " DIA_Bennet_TeachArmor_4_01_01 " );	// So let's get started. Make sure you have all the necessary materials at hand. You take a heated steel billet ...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Bennet_TeachArmor_4_01_02 " );	// ...on an anvil you give it the shape of a plate and forge pieces of iron ore into it....
		AI_Output(self,other, " DIA_Bennet_TeachArmor_4_01_03 " );	// ...then you make fasteners and connect the plate to them, carefully forging the vanishing points...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_4_01_04 " );	// ...after that, you carefully fasten the resulting element to the body of the armor - like this... look... (shows)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_4_01_05");	//...готово!
		AI_Output(self,other, " DIA_Bennet_TeachArmor_4_01_06 " );	// That's all you need to know to upgrade this armor.
	};
};

func void b_bennet_teacharmor_5()
{
	AI_Output(self,other, " DIA_Bennet_TeachArmor_5_01_01 " );	// Well, let's get started. It will take a lot of time and effort to create this armor, but it's worth it...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Bennet_TeachArmor_5_01_02 " );	// ...take a hot steel billet and divide it into several equal parts...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_5_01_03 " );	// ...then take each piece and process them sequentially with ore chips. Fasten the two parts and forge the vanishing points...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_5_01_04 " );	// ...and then fasten the resulting element to the armor on the sides using a metal plate...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_5_01_05 " );	// ...reinforce the fastening with metal bolts, and...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Bennet_TeachArmor_5_01_06");	//...готово!
	};
};

func void b_bennet_teacharmor_6()
{
	AI_Output(self,other, " DIA_Bennet_TeachArmor_6_01_01 " );	// Having mastered this knowledge, you will be able to make such an armor that no other can be compared in terms of its strength and reliability...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Bennet_TeachArmor_6_01_02 " );	// ...you take a hot steel billet and shape it into a plate on an anvil...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_6_01_03 " );	// ...after that, you cover the resulting element with ore chips and apply a layer of iron ore on top...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_6_01_04 " );	// ...you fasten two such plates with steel bolts and attach them to the armor frame...
		AI_Output(self,other, " DIA_Bennet_TeachArmor_6_01_05 " );	// ...this will add strength in the places where all the elements of the armor are attached... We knock out the contour of the armor a little more, and...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Bennet_TeachArmor_6_01_06 " );	// ...that's it, the armor is ready!
		AI_Output(self,other, " DIA_Bennet_TeachArmor_6_01_07 " );	// I have nothing more to teach you. Everything I knew, I told you. Now go and test your knowledge.
	};
};

func void b_bennetarmorchoices()
{
	Info_ClearChoices(dia_bennet_armorteach);
	Info_AddChoice(dia_bennet_armorteach,Dialog_Back,dia_bennet_armorteach_back);

	if(PLAYER_TALENT_SMITH[17] == FALSE)
	{
		Info_AddChoice(dia_bennet_armorteach, " Mercenary Light Armor (Price: 500 coins) " ,dia_bennet_armorteach_itar_sld_l_v1);
	};
	if((PLAYER_TALENT_SMITH[18] == FALSE) && (Lee_SldMGiven == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach, " Mercenary Armor (Cost: 1000 coins) " ,dia_bennet_armorteach_itar_sld_m_v1);
	};
	if((PLAYER_TALENT_SMITH[19] == FALSE) && (Lee_SldHGiven == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach, " Heavy Mercenary Armor (Price: 2000 coins) " ,dia_bennet_armorteach_itar_sld_h_v1);
	};
	if((PLAYER_TALENT_SMITH[20] == FALSE) && (SHOW_DJG_ARMOR_L == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,B_BuildLearnStringEx( " Dragonslayer Light Armor (Cost: 3000 coins " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_DJG_L_V1 )),dia_bennet_armorteach_itar_djg_l_v1);
	};
	if((PLAYER_TALENT_SMITH[21] == FALSE) && (Show_DJG_Armor_M == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,B_BuildLearnStringEx( " Dragon Fighter Gear (Cost: 4000 Monet " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_DJG_M_V1 )),dia_bennet_armorteach_itar_djg_m_v1);
	};
	if((PLAYER_TALENT_SMITH[22] == FALSE) && (SHOW_DJG_ARMOR_H == TRUE))
	{
		Info_AddChoice(dia_bennet_armorteach,B_BuildLearnStringEx( " Heavy Dragonslayer Armor (Cost: 5000 coins " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_DJG_H_V1 )),dia_bennet_armorteach_itar_djg_h_v1);
	};
};


instance DIA_BENNET_ARMORTEACH(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = dia_bennet_armorteach_condition;
	information = dia_bennet_armorteach_info;
	permanent = TRUE;
	description = " Teach me how to upgrade my armor. " ;
};

func int dia_bennet_armorteach_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (BENNET_TEACHARMOR == TRUE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
		{
			if((PLAYER_TALENT_SMITH[17] == FALSE) || (PLAYER_TALENT_SMITH[18] == FALSE) || (PLAYER_TALENT_SMITH[19] == FALSE) || (PLAYER_TALENT_SMITH[20] == FALSE) || (PLAYER_TALENT_SMITH[21] == FALSE) || (PLAYER_TALENT_SMITH[22] == FALSE))
			{
				return TRUE;
			};
		};
	};
};

func void dia_bennet_armorteach_info()
{
	AI_Output(other,self, " DIA_Bennet_ArmorTeach_01_00 " );	// Teach me how to upgrade armor.

	if (Wld_IsTime( 8 , 0 , 22 , 0 ))
	{
		AI_Output(self,other, " DIA_Bennet_ArmorTeach_01_01 " );	// And what do you want to know?
		b_bennetarmorchoices();
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_ArmorTeach_01_02 " );	// I've already finished working at the forge for today. Come tomorrow morning.
	};
};

func void dia_bennet_armorteach_back()
{
	Info_ClearChoices(dia_bennet_armorteach);
};

func void dia_bennet_armorteach_itar_sld_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SLD_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			b_bennet_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_TeachArmor_01_00 " );	// I told you I don't do charity work. Come when you have enough gold.
	};
	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_sld_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SLD_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1000);
			b_bennet_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_TeachArmor_01_00 " );	// I told you I don't do charity work. Come when you have enough gold.
	};

	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_sld_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SLD_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,2000);
			b_bennet_teacharmor_3();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_TeachArmor_01_00 " );	// I told you I don't do charity work. Come when you have enough gold.
	};

	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_djg_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3000);
			b_bennet_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_TeachArmor_01_00 " );	// I told you I don't do charity work. Come when you have enough gold.
	};
	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_djg_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 4000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,4000);
			b_bennet_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_TeachArmor_01_00 " );	// I told you I don't do charity work. Come when you have enough gold.
	};
	b_bennetarmorchoices();
};

func void dia_bennet_armorteach_itar_djg_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,5000);
			b_bennet_teacharmor_6();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_TeachArmor_01_00 " );	// I told you I don't do charity work. Come when you have enough gold.
	};
	b_bennetarmorchoices();
};


instance DIA_BENNET_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_bennet_nw_kapitelorcattack_condition;
	information = dia_bennet_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " The city has been taken over by orcs! " ;
};


func int dia_bennet_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BENNETBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_nw_kapitelorcattack_info()
{
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_01_00 " );	// The city has been taken over by orcs!
	AI_Output(self,other, " DIA_Bennet_NW_KapitelOrcAttack_01_01 " );	// Yes?! (frightened) Damn, looks like we're seriously screwed! And what do we do now?
	Info_ClearChoices(dia_bennet_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
	{
		Info_AddChoice(dia_bennet_nw_kapitelorcattack, " Offer teleportation rune to Onar's farm. " ,dia_bennet_nw_kapitelorcattack_farm);
	};
	Info_AddChoice(dia_bennet_nw_kapitelorcattack, " I don't know yet. " ,dia_bennet_nw_kapitelorcattack_nogiverune);
};

func void dia_bennet_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_01 " );	// I have a rune to teleport to Onar's farm.
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_02 " );	// If you want, you can use it.
	AI_Output(self,other, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_03 " );	// Rune?! Hmmm... (thoughtfully) Well, I don't even know, I'll have to think about it.
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_04 " );	// What is there to think about, take it - and that's it!
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_05 " );	// The rest of the guys will most likely reject it anyway. So take it and don't argue.
	AI_Output(self,other, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_06 " );	// Yeah... (looking skeptically) You still know how to persuade. Okay, give it here.
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_07 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_08 " );	// Eh! I hope that after it I won’t feel sick again for a week, as after the wrong hangover.
	AI_Output(self,other, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_09 " );	// I'm usually not good with these things!
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_11 " );	// Anyway, it's better than getting familiar with orc axes.
	AI_Output(self,other, " DIA_Bennet_NW_KapitelOrcAttack_Farm_01_12 " );	// That's for sure... (laughs) Okay, mate - then I'm going back to the farm. We'll meet there!
	AI_Output(other,self,"DIA_Bennet_NW_KapitelOrcAttack_Farm_01_13");	//Конечно.
	BENNETNOBATTLETHROUGTH = TRUE;
	B_LogEntry( TOPIC_HELPCREW , " I gave Bennet the teleportation rune to Onar's farm. Now I'm at peace with his fate. " );
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_bennet_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_01 " );	// I don't know yet.
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_02 " );	// But, apparently, you will have to fight your way out of the city. There is no other way out.
	AI_Output(self,other, " DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_03 " );	// Yeah... (sadly) Good idea! Of course, I'm not a coward, but I'm also a useless soldier.
	AI_Output(self,other, " DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_04 " );	// I don't think I'll have much chance of surviving this mess.
	AI_Output(other,self, " DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_05 " );	// I hope you're lucky.
	AI_Output(self,other, " DIA_Bennet_NW_KapitelOrcAttack_NoGiveRune_01_06 " );	// Let's see. In any case, it won't be long to wait.
	B_LogEntry( TOPIC_HELPCREW , " Bennett will take part in the breach through the city. By his own admission, he's a bad soldier, so I don't think he has much of a chance of getting out of this mess alive. " );
	BENNETBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_809_BENNET_FUCKOFF(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 2;
	condition = dia_sld_809_bennet_fuckoff_condition;
	information = dia_sld_809_bennet_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_809_bennet_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BENNETCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_809_bennet_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SLD_809_BENNET_YOURFREE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_sld_809_bennet_yourfree_condition;
	information = dia_sld_809_bennet_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_809_bennet_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BENNETCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_809_bennet_yourfree_info()
{
	AI_Output(self,other, " DIA_SLD_809_Bennet_YourFree_01_08 " );	// What else do you need?
	AI_Output(other,self, " DIA_SLD_809_Bennet_YourFree_01_00 " );	// I just want to say that you are free!
	AI_Output(self,other, " DIA_SLD_809_Bennet_YourFree_01_01 " );	// Hmmm... (surprised) Have you killed all the orcs in the city?
	AI_Output(other,self, " DIA_SLD_809_Bennet_YourFree_01_02 " );	// Yes, that's right.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other, " DIA_SLD_809_Bennet_YourFree_01_03 " );	// Well, great mate! And then we thought that we all came to an end.
		AI_Output(self,other, " DIA_SLD_809_Bennet_YourFree_01_04 " );	// Just open the bars first so we can get out of here.
	}
	else
	{
		AI_Output(self,other, " DIA_SLD_809_Bennet_YourFree_01_05 " );	// Well, great mate! And then I thought I was finished.
		AI_Output(self,other, " DIA_SLD_809_Bennet_YourFree_01_06 " );	// Just open the grate first so I can get out of here.
	};
	AI_Output(other,self,"DIA_SLD_809_Bennet_YourFree_01_07");	//Сейчас.
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_809_BENNET_OPENGATENOW(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = dia_sld_809_bennet_opengatenow_condition;
	information = dia_sld_809_bennet_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_809_bennet_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BENNETCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (BENNETISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_809_bennet_opengatenow_info()
{
	AI_Output(self,other, " DIA_SLD_809_Bennet_OpenGateNow_01_00 " );	// Well, finally open this lattice!
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_ABOUTSWBL(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 3;
	condition = dia_bennet_aboutswbl_condition;
	information = dia_bennet_aboutswbl_info;
	permanent = FALSE;
	description = " Where do you get steel billets? " ;
};


func int dia_bennet_aboutswbl_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (ABOUTSWBL == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_bennet_aboutswbl_info()
{
	AI_Output(other,self, " DIA_BENNET_aboutswbl_15_00 " );	// Where do you get steel blanks?
	AI_Output(self,other, " DIA_BENNET_aboutswbl_06_01 " );	// They're hard to find lately. In the Valley of Mines, it is becoming more and more difficult to mine ore and smelt ingots.
	AI_Output(self,other, " DIA_BENNET_aboutswbl_06_02 " );	// You can look for blanks from merchants, or you can smelt them yourself from ore.
	AI_Output(self,other, " DIA_BENNET_aboutswbl_06_03 " );	// True, you will have to mine the ore first, and then find someone who understands smelting.
	AI_Output(self,other, " DIA_BENNET_aboutswbl_06_04 " );	// You can try to look for teachers among the former prisoners from the Valley - there are a lot of them in Khorinis now after the fall of the Barrier.
	AI_Output(other,self, " DIA_BENNET_TellsMarduk_01_04 " );	// Thanks for the tip.
	ABOUTSWBL = TRUE;
	Log_CreateTopic(TOPIC_STEELDRAW,LOG_NOTE);
	Log_SetTopicStatus(TOPIC_STEELDRAW,LOG_Running);
	B_LogEntry( TOPIC_STEELDRAW , " Bennett told me that you can find steel blanks from merchants, or you can try to smelt it yourself. However, I will first have to mine the ore and find someone among the former prisoners who will teach me how to smelt it. And how to mine the ore, I already forgot. " );
};

instance DIA_Bennet_PrioratBlade(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_PrioratBlade_condition;
	information = DIA_Bennet_PrioratBlade_info;
	permanent = FALSE;
	description = " Are you good with weapons? " ;
};

func int DIA_Bennet_PrioratBlade_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_PrioratBlade_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Bennet_PrioratBlade_01_01 " );	// Are you good with weapons?
	AI_Output(self,other, " DIA_Bennet_PrioratBlade_01_02 " );	// Pretty good. Why are you interested?
	AI_Output(other,self, " DIA_Bennet_PrioratBlade_01_03 " );	// I have one very interesting instance.
	AI_Output(other,self, " DIA_Bennet_PrioratBlade_01_04 " );	// And I would like to understand where and by whom it was forged.
	AI_Output(self,other, " DIA_Bennet_PrioratBlade_01_05 " );	// Do you have it with you?
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_06");	//Да, вот.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other, " DIA_Bennet_PrioratBlade_01_07 " );	// (seriously) It's immediately obvious that this weapon was not forged by a beginner. Whoever made it should be proud of their work!
	AI_Output(self,other, " DIA_Bennet_PrioratBlade_01_08 " );	// The blade itself is perfectly balanced, which, as far as I know, the blacksmiths here are not capable of.
	AI_Output(other,self,"DIA_Bennet_PrioratBlade_01_09");	//А ты?
	AI_Output(self,other, " DIA_Bennet_PrioratBlade_01_10 " );	// Well, to be honest, including me... (snidely) So, most likely, this blade came to us from Myrtana, lad.
	AI_Output(self,other, " DIA_Bennet_PrioratBlade_01_11 " );	// Only there live real master gunsmiths who can do this kind of thing.
	AI_Output(self,other, " DIA_Bennet_PrioratBlade_01_12 " );	// Here, take it back and take good care of it. Such weapons are valued much more than gold!
	B_LogEntry(TOPIC_PrioratStart, " After examining the blade, Bennet said it was forged by the smiths of Myrtana. But he didn't add anything else. " );
};

instance DIA_Bennet_NeedSteel(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_NeedSteel_condition;
	information = DIA_Bennet_NeedSteel_info;
	permanent = FALSE;
	description = " You look a little upset. " ;
};

func int DIA_Bennet_NeedSteel_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if(BennetNeedSteel == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_NeedSteel_info()
{
	AI_Output(other,self, " DIA_Bennet_NeedSteel_01_01 " );	// You look a little upset.
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_02 " );	// Yes, there is something. Lee gave me a big order for new armor.
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_03 " );	// But I don't have enough steel to make it. And where to get it, I just don’t know!
	AI_Output(other,self, " DIA_Bennet_NeedSteel_01_04 " );	// And if you just buy steel in the city?
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_05 " );	// It is unlikely that anyone will trade with me there. And, as I heard, they themselves sometimes lack it.
	AI_Output(other,self, " DIA_Bennet_NeedSteel_01_06 " );	// And how much steel do you need?
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_07 " );	// I believe that for the first batch of armor, hundreds of blanks should be enough.
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_08 " );	// Well, and there it will already be clear what's what. By the way, what is your interest before this?
	AI_Output(other,self, " DIA_Bennet_NeedSteel_01_09 " );	// I can probably get it for you.
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_10 " );	// (surprised) Do you know where you can get a bunch of steel?
	AI_Output(other,self,"DIA_Bennet_NeedSteel_01_11");	//Возможно.
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_12 " );	// Well, you're a sly one, buddy. OK. I see what you want, tea, no fool.
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_13 " );	// So I'll tell you this:
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_14 " );	// If you help me complete this order, you can count on my immense gratitude!
	AI_Output(self,other, " DIA_Bennet_NeedSteel_01_15 " );	// And you know me, I will not remain in debt. Well, on the hands?
	AI_Output(other,self, " DIA_Bennet_NeedSteel_01_16 " );	// Okay, agreed.
	MIS_NeedSteel = LOG_Running;
	Log_CreateTopic(TOPIC_NeedSteel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NeedSteel,LOG_Running);
	B_LogEntry(TOPIC_NeedSteel, " Bennet needs a lot of steel. About a hundred blanks to make new armor for the mercenaries. If I help him complete this order and bring him steel, he will thank me generously. " );
};

instance DIA_Bennet_NeedSteel_Done(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_NeedSteel_Done_condition;
	information = DIA_Bennet_NeedSteel_Done_info;
	permanent = FALSE;
	description = " I got steel for you. " ;
};

func int DIA_Bennet_NeedSteel_Done_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((MIS_NeedSteel == LOG_Running) && (Npc_HasItems(hero,ItMiSwordraw) >= 100))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_NeedSteel_Done_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Bennet_NeedSteel_Done_01_01 " );	// I got steel for you.
	AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_02 " );	// (distrustfully) Really? Then give it here!
	AI_Output(other,self,"DIA_Bennet_NeedSteel_Done_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,ItMiSwordraw,100);
	Npc_RemoveInvItems(self,ItMiSwordraw,100);
	AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_04 " );	// Hey, hey... Not all at once! She weighs who knows how much.
	AI_Output(other,self, " DIA_Bennet_NeedSteel_Done_01_05 " );	// Well, will this be enough?
	AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_06 " );	// (breathing) Quite! It seems to me that you brought even too much.
	AI_Output(other,self, " DIA_Bennet_NeedSteel_Done_01_07 " );	// As you requested. Hundreds of blanks have become.
	AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_08 " );	// Okay. Steel is a commodity that will always come in handy.
	AI_Output(other,self, " DIA_Bennet_NeedSteel_Done_01_09 " );	// What about your gratitude?
	AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_10 " );	// Heh, you think I forgot about that? You love it, buddy!

	if((hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY]) && (hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_MANA_MAX]))
	{
		AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_11 " );	// Here, keep this sword as your reward.
		B_GiveInvItems(self,other,ItMw_Drachen_Sword_02,1);
		AI_Output(other,self, " DIA_Bennet_NeedSteel_Done_01_12 " );	// What? Just an ordinary sword?
		AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_13 " );	// (indignantly) It's not just a sword! You won't find anything like this in the whole wide world!
		AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_14 " );	// I forged it for about a year from a special blueprint I bought from a merchant in Montere for a fortune.
		AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_15 " );	// (proudly) But believe me, it was worth it! The sword turned out to be light, durable and deadly.
		AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_16 " );	// True, I never took it out of its sheath. The opportunity has not presented itself.
		AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_17 " );	// But you, I think, will appreciate all his qualities.
		AI_Output(other,self, " DIA_Bennet_NeedSteel_Done_01_18 " );	// Okay, let's take a look.
		MIS_NeedSteel = LOG_Success;
		Log_SetTopicStatus(TOPIC_NeedSteel,LOG_Success);
		B_LogEntry(TOPIC_NeedSteel, " I brought Bennet steel, and he gave me the best of his swords in return. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_19 " );	// Here, keep this gold as your reward.
		B_GiveInvItems(self,other,ItMi_Gold,2000);
		AI_Output(self,other, " DIA_Bennet_NeedSteel_Done_01_20 " );	// I think you'll probably find a use for it.
		MIS_NeedSteel = LOG_Success;
		Log_SetTopicStatus(TOPIC_NeedSteel,LOG_Success);
		B_LogEntry(TOPIC_NeedSteel, " I got Bennet steel. " );
	};
};

instance DIA_Bennet_DoCrossBow(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_DoCrossBow_condition;
	information = DIA_Bennet_DoCrossBow_info;
	permanent = FALSE;
	description = " Can you make crossbows? " ;
};

func int DIA_Bennet_DoCrossBow_condition()
{
 	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS) || (DarkPathStart == TRUE))
	{
		if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Bennet_DoCrossBow_01_01 " );	// Can you make crossbows?
	AI_Output(self,other, " DIA_Bennet_DoCrossBow_01_02 " );	// Crossbows? No, buddy.
	AI_Output(self,other, " DIA_Bennet_DoCrossBow_01_03 " );	// A good carpenter or joiner is what you need.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap, " Only a carpenter or joiner can teach me how to make crossbows. Where can I find one like that? " );
};

instance DIA_Bennet_BetterArmor_Done(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Done_Condition;
	information = DIA_Bennet_BetterArmor_Done_Info;
	permanent = FALSE;
	description = " I have everything you asked for. " ;
};

func int DIA_Bennet_BetterArmor_Done_Condition()
{
	if ((MY_BetterArmor == LOG_Running) && (DayStartArmor ==  FALSE ) && (Npc_HasItems(other,It's_DragonScale) >=  50 ) && (Npc_HasItems(other,It's_XragonSkull) >=  4 ) && (Npc_HasItems(other,It's_XragonSkull) >= 20 ) && (Npc_HasItems(other,It's_DragonSkull) >=  20 ) ) && (Npc_HasItems(other,ItMi_Sulfur) >=  10 ) && (Npc_HasItems(other,ItMi_Pitch) >=  2 ) && (Npc_HasItems(other,ItMi_DarkPearl) >=  5 ))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Done_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self, " DIA_Bennet_DI_BetterArmor_Done_01_00 " );	// I have everything you asked for.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItAt_DragonScale,50);
	Npc_RemoveInvItems(hero,ItAt_XragonSkull,4);
	Npc_RemoveInvItems(hero,ItMi_Nugget,20);
	Npc_RemoveInvItems(hero,ItMi_Pitch,2);
	Npc_RemoveInvItems(hero,ItMi_Sulfur,10);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,5);

	if(Trophy_DragonSkull  == TRUE)
	{
		if(Npc_HasItems(other,ItAt_XragonSkull) == FALSE)
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_DragonSkull,Npc_HasItems(other,ItUt_DragonSkull));
			Trophy_DragonSkull  = FALSE;
		};
	};

	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_Done_01_01 " );	// Good. Then I immediately get to work.
	AI_Output(other,self, " DIA_Bennet_DI_BetterArmor_Done_01_02 " );	// How long does it take you to make them?
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_Done_01_03 " );	// Hard to say. But I'll let you know as soon as they're ready.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_04");	//Хорошо.
	DayStartArmor = TRUE;
	DayStartArmorCount = Wld_GetDay();
	B_LogEntry(TOPIC_BetterArmor, " I gave Bennett all the materials he needed for the armor and he got to work immediately. However, he doesn't know how long it will take. " );
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_BetterArmor_Finish(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Finish_Condition;
	information = DIA_Bennet_BetterArmor_Finish_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bennet_BetterArmor_Finish_Condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == TRUE) && (OberDementorIsDead == TRUE) && (DayStartArmorCount < daynow))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Finish_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_Finish_01_00 " );	// About your armor...(wearily) They're ready!
	AI_Output(self,other, " DIA_Bennet_DI_BetterArmor_Finish_01_01 " );	// Here, take them. They will reliably protect you from any enemy.
	B_GiveInvItems(self,other,ItAr_DragonKiller,1);
	MIS_BetterArmor = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_SUCCESS);
	B_LogEntry(TOPIC_BetterArmor, " Bennet forged the armor and gave it to me. " );
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_DarkWeb(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_DarkWeb_Condition;
	information = DIA_Bennet_DarkWeb_Info;
	permanent = FALSE;
	description = " I have one question for you. " ;
};

func int DIA_Bennet_DarkWeb_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(other,DIA_Bennet_ThankYou) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DarkWeb_Info()
{
	AI_Output(other,self, " DIA_Bennet_DarkWeb_01_00 " );	// I have one question for you.
	AI_Output(self,other, " DIA_Bennet_DarkWeb_01_01 " );	// Ask if there is.
	AI_Output(other,self, " DIA_Bennet_DarkWeb_01_02 " );	// Who were you in town with when you were arrested?
	AI_Output(self,other, " DIA_Bennet_DarkWeb_01_03 " );	// With Hodges, my assistant.
	AI_Output(other,self, " DIA_Bennet_DarkWeb_01_04 " );	// Where was Hodges at the time of your arrest?
	AI_Output(self,other, " DIA_Bennet_DarkWeb_01_05 " );	// I don't know this. When we finished our business, he said he wanted to soak his throat in Koragon's tavern.
	AI_Output(self,other, " DIA_Bennet_DarkWeb_01_06 " );	// That's where he went, as I understand it. The rest I don't know.
	B_LogEntry(TOPIC_DarkWeb, "The person Bennet went to town with was Hodges, his assistant. I'll have to ask him about what happened. " );
	HodjesTalk = TRUE;
};
