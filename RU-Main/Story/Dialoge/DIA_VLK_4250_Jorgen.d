

instance DIA_Jorgen_KAP3_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP3_EXIT_Condition;
	information = DIA_Jorgen_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_PICKPOCKET(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 900;
	condition = DIA_Jorgen_PICKPOCKET_Condition;
	information = DIA_Jorgen_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jorgen_PICKPOCKET_Condition()
{
	return  C_Robbery ( 59 , 70 );
};

func void DIA_Jorgen_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
	Info_AddChoice(DIA_Jorgen_PICKPOCKET,Dialog_Back,DIA_Jorgen_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jorgen_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jorgen_PICKPOCKET_DoIt);
};

func void DIA_Jorgen_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
};

func void DIA_Jorgen_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
};


instance DIA_Jorgen_Hello (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 4;
	condition = DIA_Jorgen_Hallo_Condition;
	information = DIA_Jorgen_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jorgen_Hallo_Condition()
{
	if ((Capital ==  3 ) && (MIS_SCKnowsInnosEyeIsBroken ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Hello_Info()
{
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//Эй, ты!

	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Jorgen_Hallo_07_01 " );	// I see you're from the monastery of magicians.
		AI_Output(other,self, " DIA_Jorgen_Hallo_15_02 " );	// Yes, so what?
		AI_Output(self,other, " DIA_Jorgen_Hallo_07_03 " );	// Don't you need another worker there?
	}
	else
	{
		AI_Output(self,other, " DIA_Jorgen_Hallo_07_04 " );	// Hey, have you ever been to a monastery?
		AI_Output(other,self, " DIA_Jorgen_Hallo_15_05 " );	// Maybe, but what?
		AI_Output(self,other, " DIA_Jorgen_Hallo_07_06 " );	// Are they still recruiting?
	};

	AI_Output(self,other, " DIA_Jorgen_Hallo_07_07 " );	// I just don't know where else to go.
};


instance DIA_Jorgen_Novice (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 6;
	condition = DIA_Jorgen_Novice_Condition;
	information = DIA_Jorgen_Novice_Info;
	permanent = FALSE;
	description = " Did a novice pass by you? " ;
};

func int DIA_Jorgen_Novice_Condition()
{
	if ((MIS_NovizenChase == LOG_Running) && (Chapter ==  3 ) && (MIS_SCKnowsInnosEyeIsBroken ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Novice_Info()
{
	AI_Output(other,self, " DIA_Jorgen_Novice_15_00 " );	// Didn't a novice pass by you?
	AI_Output(self,other, " DIA_Jorgen_Novice_07_01 " );	// Yes, of course, he ran there.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other, " DIA_Jorgen_Novice_07_02 " );	// He jumped into the water from the bridge and swam like he was being chased by a shark.
	AI_StopPointAt(self);
};

instance DIA_Jorgen_Milten (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 5;
	condition = DIA_Jorgen_Milten_Condition;
	information = DIA_Jorgen_Milten_Info;
	permanent = FALSE;
	description = " If you're going to the monastery, you need to talk to Milten. " ;
};

func int DIA_Jorgen_Milten_Condition()
{
	if ((Chapter ==  3 ) && (MY_SCKnowsInnosEyeIsBroken ==  FALSE ) && ( MY_OLDWORLD  ==  LOG_SUCCESS ) && (MiltenNW.aivar[AIV_TalkedToPlayer] ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Milten_Info()
{
	AI_Output(other,self, " DIA_Jorgen_Milten_15_00 " );	// If you're going to the monastery, you need to talk to Milten. He will surely be able to help you.
	AI_Output(self,other, " DIA_Jorgen_Milten_07_01 " );	// Do you think I'll be accepted there?
	AI_Output(other,self, " DIA_Jorgen_Milten_15_02 " );	// Possibly. But for some reason it's hard for me to imagine you in the robe of a novice.
	AI_Output(self,other, " DIA_Jorgen_Milten_07_03 " );	// Stop talking nonsense - the robe is so robe. First of all I need food, otherwise I will soon have to gnaw the bark from the trees.
};


instance DIA_Jorgen_Home(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 7;
	condition = DIA_Jorgen_Home_Condition;
	information = DIA_Jorgen_Home_Info;
	description = " Where are you from? " ;
};

func int DIA_Jorgen_Home_Condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Home_Info()
{
	AI_Output(other,self, " DIA_Jorgen_Home_15_00 " );	// Where are you from?
	AI_Output(self,other, " DIA_Jorgen_Home_07_01 " );	// I was the captain of a big whaling ship, lad. My home is the sea.
	AI_Output(self,other, " DIA_Jorgen_Home_07_02 " );	// My ship, the Magdalena, was sunk by pirates a few months ago, and now I'm stranded here.
	AI_Output(self,other, " DIA_Jorgen_Home_07_03 " );	// I really wanted to get out to sea as soon as possible, but since I arrived here, not a single schooner has entered this accursed port.
	AI_Output(self,other, " DIA_Jorgen_Home_07_04 " );	// The only ship docked in Khorinis is the king's damned war galley, and they're not taking anyone.
	AI_Output(self,other, " DIA_Jorgen_Home_07_05 " );	// And what should I do now? There is no job for me in the city. I've already tried everything.
};


instance DIA_Jorgen_BeCarefull(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 8;
	condition = DIA_Jorgen_BeCarefull_Condition;
	information = DIA_Jorgen_BeCarefull_Info;
	permanent = TRUE;
	description = " You'd better stay off the roads. " ;
};


func int DIA_Jorgen_BeCarefull_Condition()
{
	if ((Capital ==  3 ) && Npc_KnowsInfo(other,DIA_Jorgen_Home))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BeCarefull_Info()
{
	AI_Output(other,self, " DIA_Jorgen_BeCarefull_15_00 " );	// You'd better stay off the roads.
	AI_Output(self,other, " DIA_Jorgen_BeCarefull_07_01 " );	// Don't worry. I've already noticed that these places have become dangerous as hell in the last couple of days.
};


instance DIA_Jorgen_KAP4_EXIT (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP4_EXIT_Condition;
	information = DIA_Jorgen_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Jorgen_NEUHIER (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 41;
	condition = DIA_Jorgen_NEUHIER_Condition;
	information = DIA_Jorgen_NEUHIER_Info;
	description = " How is life in the monastery? " ;
};


func int DIA_Jorgen_NEUHIER_Condition()
{
	if ((Captain >=  4 ) && ( CAPTAINNORTHWORTHWAY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DAY_Jorgen_NEUHIER_Info()
{
	AI_Output(other,self, " DIA_Jorgen_NEUHIER_15_00 " );	// How is life in the monastery?
	AI_Output(self,other, " DIA_Jorgen_NEUHIER_07_01 " );	// I'm going crazy here!
	if ( Npc_KnowsInfo ( other , DIA_Jorgen_Milten ) )
	{
		AI_Output(self,other, " DIA_Jorgen_NEUHIER_07_02 " );	// But still, thanks for the advice. Milten really helped me get a place here.
		B_GivePlayerXP(XP_Ambient);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other, " DIA_Jorgen_NEUHIER_07_03 " );	// I feel like an idiot among these always grumbling benefactors.
	};
	AI_Output(self,other, " DIA_Jorgen_NEUHIER_07_04 " );	// Well. What else can I do? Rather than starve to death in the city, it is better to do the work that the novices give me.
};


instances DIA_Jorgen_PERM4 (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 400;
	condition = DIA_Jorgen_PERM4_Condition;
	information = DIA_Jorgen_PERM4_Info;
	permanent = TRUE;
	description = " I trust you will be fine. " ;
};


func int DIA_Jorgen_PERM4_Condition()
{
	if ((Capitol >=  4 ) && ( CAPTAINNORDERDIAWAY  ==  FALSE ) && Npc_KnowsInfo(other,DIA_Jorgen_Home) && Npc_KnowsInfo(other,DIA_Jorgen_NEUHIER) && (JorgenIsCaptain ==  FALSE ))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_PERM4_OneTime;

func void DIA_Jorgen_PERM4_Info()
{
	AI_Output(other,self, " DIA_Jorgen_PERM4_15_00 " );	// I trust you will be fine.
	if ((DIA_Jorgen_PERM4_OneTime ==  FALSE ) && (hero.guild !=  GIL_KDF ))
	{
		AI_Output(self,other, " DIA_Jorgen_PERM4_07_01 " );	// Just imagine: I have to weed their garden. If this continues, I'll go crazy.
		DIA_Jorgen_PERM4_OneTime = TRUE ;
	};
	AI_Output(self,other, " DIA_Jorgen_PERM4_07_02 " );	// I so want to feel the deck under my feet again.
};


instance DIA_Jorgen_KAP5_EXIT (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP5_EXIT_Condition;
	information = DIA_Jorgen_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_BEMYCAPTAIN (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 51;
	condition = DIA_Jorgen_BEMYCAPTAIN_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN_Info;
	permanent = TRUE;
	description = " Maybe I can offer you a job as a captain. " ;
};


func int DIA_Jorgen_BEMYCAPTAIN_Condition()
{
	if ((Chapter ==  5 ) && ( CAPTAINORDERDIAWAY  ==  FALSE ) && (MY_SCKnowsWayToIrdorath ==  TRUE ) && (MY_PyrokarClearDemonTower !=  LOG_SUCCESS ) && Npc_KnowsInfo(other,DAY_Jorgen_Home));
	{
		return TRUE;
	};
};


var int DIA_Jorgen_BEMYCAPTAIN_OneTime;

func void DIA_Jorgen_BEMYCAPTAIN_Info()
{
	AI_Output(other,self, " DIA_Jorgen_BEMYCAPTAIN_15_00 " );	// Maybe I can offer you a job as a captain.
	if (DIA_Jorgen_BEMYCAPTAIN_OneTime ==  FALSE )
	{
		AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN_07_01 " );	// You're not kidding me, boy? If you say it's true, I'm always ready.
		AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN_07_02 " );	// Uh... there's just one little problem. I ate half of the novices' pantry.
		AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN_07_03 " );	// They almost went crazy with anger when they found out. I don't think the head mage would let me just leave like that.
		DIA_Jorgen_BEMYCAPTAIN_OneTime = TRUE ;
	};
	AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN_07_04 " );	// First I need to work off my debt to the Pyrocar. I'm sorry.
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain, " Jorgen is ready to be my captain, but I have to pay his debt to the monastery first. " );
};


instance DIA_Jorgen_BEMYCAPTAIN2 (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 52;
	condition = DIA_Jorgen_BEMYCAPTAIN2_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN2_Info;
	description = " I've paid off your debts. " ;
};


func int DIA_Jorgen_BEMYCAPTAIN2_Condition()
{
	if((MIS_PyrokarClearDemonTower == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN2_Info()
{
	AI_Output(other,self, " DIA_Jorgen_BEMYCAPTAIN2_15_00 " );	// I've paid off your debts. You are free.
	AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN2_07_01 " );	// True? How did you do it?
	AI_Output(other,self, " DIA_Jorgen_BEMYCAPTAIN2_15_02 " );	// You better not know.
	AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN2_07_03 " );	// Oh, okay. It really doesn't bother me much. A thousand thanks!

	if(SCGotCaptain == FALSE)
	{
		AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN2_07_04 " );	// How about your offer now? Do you still have room for me?
	}
	else
	{
		AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN2_07_05 " );	// Great. Now I can get out of here!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_Jorgen_BEMYCAPTAIN3 (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 53;
	condition = DIA_Jorgen_BEMYCAPTAIN3_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN3_Info;
	description = " Be my captain. " ;
};


func int DIA_Jorgen_BEMYCAPTAIN3_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Jorgen_BEMYCAPTAIN2 ) && ( SCGotCaptain ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self, " DIA_Jorgen_BEMYCAPTAIN3_15_00 " );	// Be my captain.
	AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN3_07_01 " );	// It's a great honor for me, but do you have a ship and crew?
	AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN3_07_02 " );	// I should say we need at least five people.
	AI_Output(other,self, " DIA_Jorgen_BEMYCAPTAIN3_15_03 " );	// Good. I'll see what i can do. Wait for me at the harbor.
	AI_Output(self,other, " DIA_Jorgen_BEMYCAPTAIN3_07_04 " );	// Yes, sir.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JorgenIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Jorgen_LOSFAHREN (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 59;
	condition = DIA_Jorgen_LOSFAHREN_Condition;
	information = DIA_Jorgen_LOSFAHREN_Info;
	permanent = TRUE;
	description = " Are you ready to take me to the island? " ;
};


func int DIA_Jorgen_LOSFAHREN_Condition()
{
	if((JorgenIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_LOSFAHREN_Info()
{
	AI_Output(other,self, " DIA_Jorgen_LOSFAHREN_15_00 " );	// Are you ready to take me to the island?
	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other, " DIA_Jorgen_LOSFAHREN_07_01 " );	// Of course! Give me your card here.
		AI_Output(other,self, " DIA_Jorgen_LOSFAHREN_07_07 " );	// Here, take this.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other, " DIA_Jorgen_LOSFAHREN_07_02 " );	// Great! (seriously) Then we'll weigh anchor right now.
		AI_Output(self,other, " DIA_Jorgen_LOSFAHREN_07_03 " );	// Just double-check your supplies before boarding! Once we are at sea, there will be no going back.
		AI_Output(self,other, " DIA_Jorgen_LOSFAHREN_07_04 " );	// Then you can go to the captain's quarters and take a nap there. We'll be leaving soon!
		B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Jorgen_LOSFAHREN_07_05 " );	// You need a ship, a crew of five, and a sea chart so I can navigate it.
		AI_Output(self,other, " DIA_Jorgen_LOSFAHREN_07_06 " );	// We can't set sail until we have everything we need.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Jorgen_PERM5_NOTCAPTAIN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 59;
	condition = DIA_Jorgen_PERM5_NOTCAPTAIN_Condition;
	information = DIA_Jorgen_PERM5_NOTCAPTAIN_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Jorgen_PERM5_NOTCAPTAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_BEMYCAPTAIN2) && (SCGotCaptain == TRUE) && (JorgenIsCaptain == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven;

func void DIA_Jorgen_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//Как ты?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other, " DIA_Jorgen_PERM5_NOTCAPTAIN_07_01 " );	// Great! It's not the worst place.
		AI_Output(self,other, " DIA_Jorgen_PERM5_NOTCAPTAIN_07_02 " );	// They give me idiotic tasks, like tending sheep, but still people here are far from being as limited and stupid as in the monastery.
		if (DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven ==  FALSE )
		{
			B_GivePlayerXP(XP_Ambient);
			DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven = TRUE ;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Jorgen_PERM5_NOTCAPTAIN_07_03 " );	// I need to find another place for myself. Let's see where else the wind will take me.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_Jorgen_KAP6_EXIT (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP6_EXIT_Condition;
	information = DIA_Jorgen_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NW_KAPITELORCATTACK (C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 1;
	condition = dia_jorgen_nw_kapitelorcattack_condition;
	information = dia_jorgen_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " What do you say, captain? " ;
};


func int dia_jorgen_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JORGENBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_nw_kapitelorcattack_info()
{
	AI_Output(other,self, " DIA_Jorgen_NW_KapitelOrcAttack_01_00 " );	// What do you say, captain?
	AI_Output(self,other, " DIA_Jorgen_NW_KapitelOrcAttack_01_01 " );	// What can I say... (sadly) I heard that orcs are in full swing in Khorinis!
	AI_Output(other,self, " DIA_Jorgen_NW_KapitelOrcAttack_01_02 " );	// I heard that a few guys still want to try to break through the city with a fight.
	AI_Output(self,other, " DIA_Jorgen_NW_KapitelOrcAttack_01_04 " );	// Many of them are experienced warriors, and they are not the first to fight against the orcs.
	AI_Output(self,other, " DIA_Jorgen_NW_KapitelOrcAttack_01_03 " );	// Eh... What can not be said about me... (frightened) I don't even know how to properly hold a sword. Where can I go against these creatures?
	Info_ClearChoices(dia_jorgen_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportTaverne) >= 1)
	{
		Info_AddChoice(dia_jorgen_nw_kapitelorcattack, " (offer teleport rune to tavern) " ,dia_jorgen_nw_kapitelorcattack_taverne);
	};
	Info_AddChoice(dia_jorgen_nw_kapitelorcattack, " You'll have to try. " ,dia_jorgen_nw_kapitelorcattack_nogiverune);
};

func void dia_jorgen_nw_kapitelorcattack_taverne()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_01 " );	// Wait! I have a rune to teleport to the Dead Harpy Tavern with me.
	AI_Output(other,self, " DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_02 " );	// You can use it!
	AI_Output(self,other, " DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_03 " );	// Rune? Hmmm... (thoughtfully) Well, I don't even know, I have to think - is it worth it?
	AI_Output(other,self, " DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_05 " );	// Fighting your way through a city filled to the brim with orcs is certain death for you!
	AI_Output(other,self, " DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_06 " );	// These creatures will make mincemeat out of you! And you know it as well as I do.
	AI_Output(self,other, " DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_08 " );	// Yeah... you still know how to persuade. Okay, give it here!
	AI_Output(other,self, " DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_09 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_TeleportTaverne,1);
	Npc_RemoveInvItems(self,ItMi_TeleportTaverne,1);
	AI_Output(self,other, " DIA_Jorgen_NW_KapitelOrcAttack_Taverne_01_10 " );	// Eh! I hope after it I won’t be sick again for a week, like after a bottle of old schnapps.
	JORGENNOBATTLETHROUGTH = TRUE;
	B_LogEntry( TOPIC_HELPCREW , " I gave Jorgen the rune to teleport to the Dead Harpy Tavern. Now I'm at peace with his fate. " );
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_jorgen_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_01 " );	// There is no other way to get out of here!
	AI_Output(self,other, " DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_02 " );	// I don't think I can...(doomed) But I'll have to try.
	AI_Output(other,self, " DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_03 " );	// Good luck then! You will need it.
	AI_Output(self,other, " DIA_Jorgen_NW_KapitelOrcAttack_NoGiveRune_01_04 " );	// Thank you.
	B_LogEntry( TOPIC_HELPCREW , " Jorgen will fight his way out of the captured city. I don't think he has any chance of staying alive. " );
	JORGENBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NW_AGAINCAPITAN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 1;
	condition = dia_jorgen_nw_againcapitan_condition;
	information = dia_jorgen_nw_againcapitan_info;
	permanent = FALSE;
	description = " I need a ship captain again. " ;
};


func int dia_jorgen_nw_againcapitan_condition()
{
	if ( Npc_KnowsInfo ( hero , their_lord_hagen_need_captain ) && ( WHOTRAVELONBIGLAND  ==  FALSE ) && ( SHIPGAINACESS  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_jorgen_nw_againcapitan_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Jorgen_NW_AgainCapitan_01_00 " );	// I need a ship captain again.
	AI_Output(self,other, " DIA_Jorgen_NW_AgainCapitan_01_01 " );	// Hmmm...(snidely) Are you up to something again, mate?
	AI_Output(other,self, " DIA_Jorgen_NW_AgainCapitan_01_02 " );	// I'm sailing to the mainland. I have a very important message for the king! Will you help me?
	AI_Output(self,other, " DIA_Jorgen_NW_AgainCapitan_01_03 " );	// Well, if there is such a thing, then fair wind to your sails! I'm sorry, but I can't help you anymore.
	AI_Output(other,self,"DIA_Jorgen_NW_AgainCapitan_01_04");	//Почему?
	AI_Output(self,other, " DIA_Jorgen_NW_AgainCapitan_01_05 " );	// I've had enough of this shit! Orcs, dragons, demons - I am a simple person and I want to live in peace.
	AI_Output(self,other, " DIA_Jorgen_NW_AgainCapitan_01_06 " );	// I'd rather stay here and be a simple sheep herder in a monastery than swim with you and constantly tremble for my life.
	AI_Output(self,other, " DIA_Jorgen_NW_AgainCapitan_01_07 " );	// So I'm sorry, I can't help!
	AI_Output(other,self, " DIA_Jorgen_NW_AgainCapitan_01_08 " );	// Very sorry. I counted on you.
	B_LogEntry( TOPIC_SALETOBIGLAND , " Jorgen refused to captain my ship. I should look for someone else to help me. " );
};
