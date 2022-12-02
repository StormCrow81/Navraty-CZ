

instance DIA_Keroloth_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_EXIT_Condition;
	information = DIA_Keroloth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Keroloth_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Keroloth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_HELLO(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 2;
	condition = DIA_Keroloth_HELLO_Condition;
	information = DIA_Keroloth_HELLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Keroloth_HELLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_HELLO_Info()
{
	AI_Output(other,self, " DIA_Keroloth_HELLO_15_00 " );	// Do you train people?
	AI_Output(self,other, " DIA_Keroloth_HELLO_07_01 " );	// Yes. When those orcs, or worse, the dragons, attack again, we'll need every sword.
};


instance DIA_Keroloth_WantTeach(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 3;
	condition = DIA_Keroloth_WantTeach_Condition;
	information = DIA_Keroloth_WantTeach_Info;
	permanent = FALSE;
	description = " Can you teach me too? " ;
};

func int DIA_Keroloth_WantTeach_Condition()
{
	if (Keroloths_BagEmpty ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Keroloth_WantTeach_Info()
{
	AI_Output(other,self, " DIA_Keroloth_WantTeach_15_00 " );	// Can you teach me too?
	AI_Output(self,other, " DIA_Keroloth_WantTeach_07_01 " );	// Of course! I train everyone.
	AI_Output(self,other, " DIA_Keroloth_WantTeach_07_02 " );	// But besides your talent, you'll need a good weapon if you want to survive here.
	AI_Output(self,other, " DIA_Keroloth_WantTeach_07_03 " );	// Speak to Knight Tandor. He will equip you.
	Keroloth_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher_OC, " Paladin Caroloth is teaching one-handed weapons. " );
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_Trader_OC, " Paladin Tandor sells weapons. " );
};

var int DIA_Keroloth_Teach_permanent;

instance DIA_Keroloth_Teacher(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 6;
	condition = DIA_Keroloth_Teacher_Condition;
	information = DIA_Keroloth_Teacher_Info;
	permanent = TRUE;
	description = " I want to train! " ;
};

func int DIA_Keroloth_Teacher_Condition()
{
	if ((Keroloth_TeachPlayer ==  TRUE ) && (Keroloths_BeutelLeer ==  FALSE ) && (Keroloth_Teach_Permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_Teacher_Info()
{
	AI_Output(other,self, " DIA_Keroloth_Teacher_15_00 " );	// I want to train!
	Info_ClearChoices(DIA_Keroloth_Teacher);
	Info_AddChoice(DIA_Keroloth_Teacher,Dialog_Back,DIA_Keroloth_Teacher_Back);
	Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Keroloth_Teacher_1H_1);
	Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Keroloth_Teacher_1H_5);
};

func void DIA_Keroloth_Teacher_Back()
{
	Info_ClearChoices(DIA_Keroloth_Teacher);
};

func void DIA_Keroloth_Teacher_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);

	if(other.HitChance[NPC_TALENT_1H] >= 60)
	{
		AI_Output(self,other, " B_Keroloth_TeachNoMore1_07_00 " );	// You are very good! I have nothing more to teach you.
		AI_Output(self,other, " B_Keroloth_TeachNoMore2_07_00 " );	// Only a very experienced swordsman can help you now.
		DIA_Keroloth_Teach_permanent = TRUE;
		Info_ClearChoices(DIA_Keroloth_Teacher);
	}
	else
	{
		Info_ClearChoices(DIA_Keroloth_Teacher);
		Info_AddChoice(DIA_Keroloth_Teacher,Dialog_Back,DIA_Keroloth_Teacher_Back);
		Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Keroloth_Teacher_1H_1);
		Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Keroloth_Teacher_1H_5);
	};
};

func void DIA_Keroloth_Teacher_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);

	if(other.HitChance[NPC_TALENT_1H] >= 60)
	{
		AI_Output(self,other, " B_Keroloth_TeachNoMore1_07_00 " );	// You are very good. I have nothing more to teach you.
		AI_Output(self,other, " B_Keroloth_TeachNoMore2_07_00 " );	// Only a very experienced swordsman can help you now.
		DIA_Keroloth_Teach_permanent = TRUE;
		Info_ClearChoices(DIA_Keroloth_Teacher);
	}
	else
	{
		Info_ClearChoices(DIA_Keroloth_Teacher);
		Info_AddChoice(DIA_Keroloth_Teacher,Dialog_Back,DIA_Keroloth_Teacher_Back);
		Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Keroloth_Teacher_1H_1);
		Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Keroloth_Teacher_1H_5);
	};
};

instances of DIA_Keroloth_Udar (C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 4;
	condition = DIA_Keroloth_Udar_Condition;
	information = DIA_Keroloth_Udar_Info;
	permanent = FALSE;
	description = " What about ranged combat? " ;
};

func int DIA_Keroloth_Udar_Condition()
{
	if((Keroloth_TeachPlayer == TRUE) && (Keroloths_BeutelLeer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_Udar_Info()
{
	AI_Output(other,self, " DIA_Keroloth_Udar_15_00 " );	// What about ranged combat?
	AI_Output(self,other, " DIA_Keroloth_Udar_07_01 " );	// What about him?
	AI_Output(other,self, " DIA_Keroloth_Udar_15_02 " );	// Can you teach me how to do it?
	AI_Output(self,other, " DIA_Keroloth_Udar_07_03 " );	// No, but you can ask Udar. He is good - no, he is the BEST crossbowman as far as I know.
	Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher_OC, " Strike, from Mine Valley Castle, knows all about crossbows. " );
};


instance DIA_Keroloth_KAP3_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_KAP3_EXIT_Condition;
	information = DIA_Keroloth_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Keroloth_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_KAP4_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_KAP4_EXIT_Condition;
	information = DIA_Keroloth_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Keroloth_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_KAP4_HELLO(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 40;
	condition = DIA_Keroloth_KAP4_HELLO_Condition;
	information = DIA_Keroloth_KAP4_HELLO_Info;
	description = " You look so upset. " ;
};


func int DIA_Keroloth_KAP4_HELLO_Condition()
{
	if (Chapter >=  4 )
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_HELLO_Info()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_HELLO_15_00 " );	// You look so upset.
	AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_07_01 " );	// (excitedly) Damn them. My advice to you: keep an eye on your things.
	AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_07_02 " );	// Turn your back a little, and that's it - things have already been taken away. Here are the bastards!
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,Dialog_Back,DIA_Keroloth_KAP4_HELLO_ende);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO, " A paladin shouldn't lose his temper so easily. " ,DIA_Keroloth_KAP4_HELLO_ruhig);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO, " Did something get stolen from you? " ,DIA_Keroloth_KAP4_HELLO_bestohlen);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO, " What the hell? " ,DIA_Keroloth_KAP4_HELLO_pack);
};

func void DIA_Keroloth_KAP4_HELLO_ende()
{
	Info_ClearChoices(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_bestolen()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_HELLO_bestohlen_15_00 " );	// Was something stolen from you?
	AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_bestohlen_07_01 " );	// No. They put twenty gold coins in my pocket. Of course I got robbed, you idiot!
	AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_bestohlen_07_02 " );	// Never mind when I get to that bastard...
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO, " So what's missing? " ,DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt);
};

func void DIA_Keroloth_KAP4_HELLO_stolen_wasmissing()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00 " );	// So what are you missing?
	AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01 " );	// My wallet, with all my savings.
	AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02 " );	// It's been stolen!
	AI_Output(other,self, " DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03 " );	// It will pop up somewhere.
	AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04 " );	// When I get to it...
	Log_CreateTopic(TOPIC_KerolothsGeldbeutel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KerolothsGeldbeutel,LOG_Running);
	B_LogEntry(TOPIC_KerolothsGeldbeutel, " Paladin Keroloth has lost his wallet. He claims it was stolen by dragon hunters. " );
	Info_ClearChoices(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_pack()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_HELLO_pack_15_00 " );	// What kind of bastards?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_pack_07_01 " );	// You ragged dragon hunters, of course. Who else?
	}
	else
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_pack_07_02 " );	// The riffraff who call themselves dragon hunters, of course. Who else do you think I might be referring to?
	};
	AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_pack_07_03 " );	// (under his breath) You have to be vigilant, I'm telling you.
};

func void DIA_Keroloth_KAP4_HELLO_quiet()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_HELLO_ruhig_15_00 " );	// Calm down! A paladin shouldn't lose his temper so easily.
	AI_Output(self,other, " DIA_Keroloth_KAP4_HELLO_ruhig_07_01 " );	// But I don't want to settle down. It was all my savings, damn!
};


instance DIA_Keroloth_KAP4_GELDGEFINDEN (C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 42;
	condition = DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition;
	information = DIA_Keroloth_KAP4_GELDGEFUNDEN_Info;
	description = " I think I found your wallet. " ;
};


func int DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Keroloth_KAP4_HELLO) && (Npc_HasItems(other,ItMi_KerolothsGeldbeutel_MIS) || Npc_HasItems(other,ItMi_KerolothsGeldbeutelLeer_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_GELDGEFINDEN_Info()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00 " );	// I think I found your wallet.
	TOPIC_END_KerolothsGeldbeutel = TRUE;
	B_GivePlayerXP(XP_KerolothsGeldbeutel);
	if (B_GiveInvItems(other,self,ItMi_KerolothsPurseLeer_MIS, 1 ))
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01 " );	// Wallet is empty. What pig did this?
		Keroloths_BagEmpty = TRUE ;
	};
	if(B_GiveInvItems(other,self,ItMi_KerolothsGeldbeutel_MIS,1))
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02 " );	// What? Where? What motherfucker did this?
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, " Wait a minute. How about a reward? " ,DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn);
	};
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, " He was over there at the forge. " ,DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede);
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, " I suspect a dragon hunter. " ,DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG);
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFINDEN, " Откуда мне знать? " ,DIA_Keroloth_KAP4_GELDGEFINDEN_no idea);
};

func void DIA_Keroloth_KAP4_FOUND_MONEY_no idea()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00 " );	// How should I know?

	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01 " );	// Are you trying to fool me? It was you, admit it.
		Info_ClearChoices(DIA_Keroloth_KAP4_GELDGEFINDEN);
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, " I suspect a dragon hunter. " ,DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG);
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFINDEN, " Поцелуй мою задницу! " ,DIA_Keroloth_KAP4_GELDGEFINDEN_no idea_canstme);
	}
	else
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02 " );	// I'll find out later.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Keroloth_KAP4_FOUND_MONEY_no idea_canstme()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_kannstmich_15_00 " );	// Kiss my ass!
	AI_Output(self,other, " DIA_Keroloth_KAP4_kannstmich_07_01 " );	// I'll show you how to steal honest people!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Keroloth_KAP4_GELDGEFINDEN_DJG()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00 " );	// I suspect one dragon hunter.
	AI_Output(self,other, " DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01 " );	// I knew it!
	AI_Output(self,other, " DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02 " );	// They shouldn't have been allowed into the castle at all.
	AI_StopProcessInfos(self);
};

func void DIA_Keroloth_KAP4_FOUND_MONEY_Forge()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00 " );	// He was over there by the forge!
	AI_Output(self,other, " DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01 " );	// Where? At the forge? It must have fallen out of some dragon hunter's pocket there. Just don't tell me it's not.
};

func void DIA_Keroloth_KAP4_GELDGEFINDEN_Lohn()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00 " );	// Wait a minute. What about the reward?

	if (Keroloths_BagEmpty ==  TRUE )
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01 " );	// This was the last straw. Looks like you haven't been punched in the face in a long time, huh?
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02 " );	// Ahh. Good. Here are some coins. Now tell me who did it?
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Keroloth_HasPayed = TRUE;
	};
};


instance DIA_Keroloth_KAP4_REWARD (C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 43;
	condition = DIA_Keroloth_KAP4_REWARD_Condition;
	information = DIA_Keroloth_KAP4_REWARD_Info;
	permanent = FALSE;
	description = " I want my share of this find. " ;
};

func int DIA_Keroloth_KAP4_REWARD_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Keroloth_CHAP4_REVENUES) && (Keroloth_HasPaid ==  FALSE ) && (hero.guild !=  GIL_KDF )) ;
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_REWARD_Info()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_BELOHNUNG_15_00 " );	// I want my share of this find.

	if((Keroloths_BeutelLeer == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_BELOHNUNG_07_01 " );	// Yes, and you risk getting hit in the jaw!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_BELOHNUNG_07_02 " );	// Is that all you need? Here are a couple of coins. Now get lost.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Keroloth_HasPayed = TRUE;
	};
};

instance DIA_Keroloth_KAP4_RELAXEDICH (C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 44;
	condition = DIA_Keroloth_KAP4_RELAXEDICH_Condition;
	information = DIA_Keroloth_KAP4_RELAXEDICH_Info;
	permanent = FALSE;
	description = " Relax! " ;
};

func int DIA_Keroloth_KAP4_RELAXEDICH_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Keroloth_CHAP4_REVENUES) && (Capital >=  4 )) || (MY_OCGateOpen ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_RELEASE_Info()
{
	AI_Output(other,self, " DIA_Keroloth_KAP4_ENTSPANNDICH_15_00 " );	// Relax!

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_ENTSPANNDICH_07_01 " );	// Yes, master! I'll try.
	}
	else if((MIS_OCGateOpen == TRUE) && (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Keroloth_KAP4_ENTSPANNDICH_07_02 " );	// I can't prove it, but it seems to me that you're the traitor who opened the gate.
		AI_Output(self,other, " DIA_Keroloth_KAP4_ENTSPANNDICH_07_03 " );	// You will pay for this!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(other,self, " DIA_Keroloth_KAP4_ENTSPANNDICH_15_04 " );	// You got your wallet back, didn't you?
		AI_Output(self,other, " DIA_Keroloth_KAP4_ENTSPANNDICH_07_05 " );	// Don't provoke me! Get out!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Keroloth_KAP5_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_KAP5_EXIT_Condition;
	information = DIA_Keroloth_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Keroloth_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_KAP6_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_KAP6_EXIT_Condition;
	information = DIA_Keroloth_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Keroloth_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_PICKPOCKET(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 900;
	condition = DIA_Keroloth_PICKPOCKET_Condition;
	information = DIA_Keroloth_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Keroloth_PICKPOCKET_Condition()
{
	return  C_Robbery ( 25 , 45 );
};

func void DIA_Keroloth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Keroloth_PICKPOCKET);
	Info_AddChoice(DIA_Keroloth_PICKPOCKET,Dialog_Back,DIA_Keroloth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Keroloth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Keroloth_PICKPOCKET_DoIt);
};

func void DIA_Keroloth_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Keroloth_PICKPOCKET);
};

func void DIA_Keroloth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Keroloth_PICKPOCKET);
};

