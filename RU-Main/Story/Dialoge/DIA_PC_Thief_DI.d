

instance DIA_PC_Thief_DI_EXIT(C_Info)
{
	npc = PC_Thief_DI;
	nr = 999;
	condition = DIA_PC_Thief_DI_EXIT_Condition;
	information = DIA_PC_Thief_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PC_Thief_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PC_Thief_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_Thief_DI_Hello (C_Info)
{
	npc = PC_Thief_DI;
	nr = 5;
	condition = DIA_PC_Thief_DI_Hallo_Condition;
	information = DIA_PC_Thief_DI_Hello_Info;
	description = " We've arrived. " ;
};


func int DIA_PC_Thief_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_Hallo_Info()
{
	AI_Output(other,self, " DIA_PC_Thief_DI_Hallo_15_00 " );	// We've arrived.
	AI_Output(self,other, " DIA_PC_Thief_DI_Hallo_11_01 " );	// This island seems to be quite close to Khorinis.
	AI_Output(self,other, " DIA_PC_Thief_DI_Hallo_11_02 " );	// I didn't know about this. But now many things have become clear to me.
	AI_Output(self,other, " DIA_PC_Thief_DI_Hallo_11_03 " );	// I kept wondering how the orcs were able to bring in provisions and reinforcements so quickly.
	AI_Output(self,other, " DIA_PC_Thief_DI_Hallo_11_04 " );	// With such an outpost, it was a breeze for them.
	AI_Output(self,other, " DIA_PC_Thief_DI_Hallo_11_05 " );	// On your way inland, you'll probably run into a trap or two.
	AI_Output(self,other, " DIA_PC_Thief_DI_Hallo_11_06 " );	// If you feel like you don't know what to do next, come back to me. Perhaps my experience can help you.
};


instance DIA_PC_Thief_DI_RAT(C_Info)
{
	npc = PC_Thief_DI;
	nr = 5;
	condition = DIA_PC_Thief_DI_RAT_Condition;
	information = DIA_PC_Thief_DI_RAT_Info;
	permanent = TRUE;
	description = " I need your advice. " ;
};


func int DIA_PC_Thief_DI_RAT_Condition()
{
	if((UndeadDragonIsDead == FALSE) && Npc_KnowsInfo(other,DIA_PC_Thief_DI_Hallo))
	{
		return TRUE;
	};
};


var int DIA_PC_Thief_DI_RAT_OneTime;
var int DIA_PC_Thief_DI_RAT_OneTime2;

func void DIA_PC_Thief_DI_RAT_Info()
{
	AI_Output(other,self, " DIA_PC_Thief_DI_RAT_15_00 " );	// I need your advice.
	if (Npc_IsDead(OrkElite_AntiPaladinOrkColonel_DI) && ( EVT_ORKCOMMANDER_SWITCH_FOUND  ==  FALSE )) ;
	{
		AI_Output(other,self, " DIA_PC_Thief_DI_RAT_15_01 " );	// The orc colonel has his headquarters here. I can't move inland beyond this point.
		AI_Output(self,other, " DIA_PC_Thief_DI_RAT_11_02 " );	// Orcs are cunning creatures. They are often underestimated. I believe they have some kind of secret passage there. Check the walls for hidden switches.
		AI_Output(self,other, " DIA_PC_Thief_DI_RAT_11_03 " );	// Remember though - these switches usually need to be pressed in a specific order for the mechanism to work.
	}
	else if(Npc_IsDead(FireDragonIsland) && (EVT_DIBRIDGE_OPENED == FALSE))
	{
		AI_Output(other,self, " DIA_PC_Thief_DI_RAT_15_04 " );	// I've fought a dragon, and now I'm stuck in front of a drawbridge chasm. This bridge is up and I don't know how to lower it.
		AI_Output(self,other, " DIA_PC_Thief_DI_RAT_11_05 " );	// Mmm. Have you tried ranged weapons? Maybe the mechanism can be activated with a shot.
	}
	else  if ( Npc_IsDead ( Skeleton_Lord_Archol ) && ( Npc_KnowsInfo ( other , DIA_Martial_Magic_HELLO ) ==  FALSE )) .
	{
		AI_Output(other,self, " DIA_PC_Thief_DI_RAT_15_06 " );	// I encounter hordes of the undead and their elaborate traps along the way.
		AI_Output(self,other, " DIA_PC_Thief_DI_RAT_11_07 " );	// Sorry, but I've never dealt with the undead. Here you have to invent something yourself.
	}
	else
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_RAT_11_08 " );	// Come see me if you have a problem that my experience can help solve.
		if((ORkSturmDI == TRUE) && (DIA_PC_Thief_DI_RAT_OneTime2 == FALSE))
		{
			AI_Output(self,other, " DIA_PC_Thief_DI_RAT_11_09 " );	// One more thing. I'd rather you didn't bring all those creatures that roam around here to the ship. I hope this orc raid was the last attack we had to repel here!
			B_GivePlayerXP(XP_Ambient);
			DIA_PC_Thief_DI_RAT_OneTime2 = TRUE;
		};
	};
};


instance DIA_Diego_TRADE (C_Info)
{
	npc = PC_Thief_DI;
	nr = 12;
	condition = DIA_Diego_DI_TRADE_Condition;
	information = DIA_Diego_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " I need ammo. " ;
};


func int DIA_Diego_TRADE_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Diego_DI_TRADE_Info()
{
	var int McBolzenAmount;
	var int McArrowAmount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Diego_DI_TRADE_15_00 " );	// I need ammo.
	AI_Output(self,other, " DIA_Diego_DI_TRADE_11_01 " );	// Maybe I can help you out.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItRw_Bolt,Npc_HasItems(self,ItRw_Bolt));
	McBolzeAmount = Chapter *  50 ;
	CreateInvItems(self,ItRw_Bolt,McBolzenAmount);
	Npc_RemoveInvItems(self,ItRw_Arrow,Npc_HasItems(self,ItRw_Arrow));
	McArrowAmount = Kapitel * 50;
	CreateInvItems(self,ItRw_Arrow,McArrowAmount);
};


instance DIA_PC_Thief_DI_Training_Talente(C_Info)
{
	npc = PC_Thief_DI;
	nr = 10;
	condition = DIA_PC_Thief_DI_Training_Talente_Condition;
	information = DIA_PC_Thief_DI_Training_Talente_Info;
	permanent = TRUE;
	description = " Teach me. " ;
};


func int DIA_PC_Thief_DI_Training_Talente_Condition()
{
	if((UndeadDragonIsDead == FALSE) && Npc_KnowsInfo(other,DIA_PC_Thief_DI_Hallo))
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_Training_Talente_Info()
{
	AI_Output(other,self, " DIA_PC_Thief_DI_Training_15_00 " );	// Train me.
	AI_Output(self,other, " DIA_PC_Thief_DI_Training_11_01 " );	// What do you need?
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, " Pick Locks " ,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_DEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA))
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_Training_DEX_1_11_00 " );	// You'll feel much better if you stay out of the line of fire.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, " Pick Locks " ,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_DEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA))
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_Training_DEX_5_11_00 " );	// When you move, always remember how easy cats move. The rest will come by itself.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, " Pick Locks " ,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_Combat_BOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00 " );	// For best results, practice more.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, " Pick Locks " ,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_Combat_BOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00 " );	// To keep your hand from shaking, try to slow your breathing while aiming.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, " Pick Locks " ,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_Talente_PICKLOCK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_Training_PICKLOCK_11_00 " );	// Better late than never. It's strange that you haven't learned this ability before.
	};
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, " Pick Locks " ,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

func void DIA_PC_Thief_DI_Training_Talente_BACK()
{
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
};


instance DIA_PC_Thief_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Thief_DI;
	nr = 5;
	condition = DIA_PC_Thief_DI_UndeadDragonDead_Condition;
	information = DIA_PC_Thief_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " It's over. Now we can get out of here. " ;
};


func int DIA_PC_Thief_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

var int DIA_PC_Thief_DI_UndeadDragonDead_OneTime;

func void DIA_PC_Thief_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_PC_Thief_DI_UndeadDragonDead_15_00 " );	// It's over. Now we can get out of here.
	if(Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01") < 4000)
	{
		AI_Output(self,other, " DIA_PC_Thief_DI_UndeadDragonDead_11_01 " );	// Just look at this. I have never seen such a structure in my life.
		AI_Output(self,other, " DIA_PC_Thief_DI_UndeadDragonDead_11_02 " );	// How the hell did you manage to get through there?
		AI_Output(other,self, " DIA_PC_Thief_DI_UndeadDragonDead_15_03 " );	// I'm just lucky I guess.
		AI_Output(self,other, " DIA_PC_Thief_DI_UndeadDragonDead_11_04 " );	// (laughs) Well, if you think so...
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05");	//Отлично.
	};
	if(DIA_PC_Thief_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self, " DIA_PC_Thief_DI_UndeadDragonDead_15_06 " );	// What are you going to do next?
		AI_Output(self,other, " DIA_PC_Thief_DI_UndeadDragonDead_11_07 " );	// Good question. I think we need to return to Khorinis first.
		if((Diebesgilde_Verraten == TRUE) || (MIS_Andre_GuildOfThieves == LOG_SUCCESS))
		{
			AI_Output(self,other, " DIA_DiegoDI_Add_11_00 " );	// There's no thieves guild there anymore. This opens up interesting new possibilities.
		};
		AI_Output(self,other, " DIA_PC_Thief_DI_UndeadDragonDead_11_09 " );	// Mmm. Well, or maybe I'll just continue Bromor's business. This is very good money. Honest money.
		DIA_PC_Thief_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other, " DIA_PC_Thief_DI_UndeadDragonDead_11_10 " );	// Go to the captain. Let him raise the anchor.
	AI_StopProcessInfos(self);
	if(Lares_IsOnBoard != LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"SittingShipDI");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_Thief_DI_PICKPOCKET(C_Info)
{
	npc = PC_Thief_DI;
	nr = 900;
	condition = DIA_Thief_DI_PICKPOCKET_Condition;
	information = DIA_Thief_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Thief_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 120 , 600 );
};

func void DIA_Thief_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
	Info_AddChoice(DIA_Thief_DI_PICKPOCKET,Dialog_Back,DIA_Thief_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Thief_DI_PICKPOCKET_DoIt);
};

func void DIA_Thief_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
};

func void DIA_Thief_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
};

