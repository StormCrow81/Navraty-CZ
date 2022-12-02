

instance DIA_MiltenOW_EXIT(C_Info)
{
	npc = PC_Mage_OW;
	nr = 999;
	condition = DIA_MiltenOW_EXIT_Condition;
	information = DIA_MiltenOW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenOW_Hello(C_Info)
{
	npc = PC_Mage_OW;
	nr = TRUE;
	condition = DIA_MiltenOW_Hello_Condition;
	information = DIA_MiltenOW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_Hello_Info()
{
	AI_Output(self,other, " DIA_MiltenOW_Hello_03_00 " );	// Look who's back! Our hero from beyond the Barrier!
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello, " Nice to see you Milten! " ,DIA_MiltenOW_Hello_YES);
	Info_AddChoice(DIA_MiltenOW_Hello,"Я знаю тебя?",DIA_MiltenOW_Hello_NO);
};

func void B_Milten_GornDiegoLester()
{
	AI_Output(self,other, " DIA_MiltenOW_Hello_NO_03_02 " );	// Do you remember Gorn, Diego and Lester?
};

func void DIA_MiltenOW_Hello_YES()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_MiltenOW_Hello_YES_15_00 " );	// Good to see you, Milten. Are you still here or here again?
	AI_Output(self,other, " DIA_MiltenOW_Hello_YES_03_01 " );	// Again. After the barrier collapsed, I entered the Fire Mage Monastery.
	AI_Output(self,other, " DIA_MiltenOW_Hello_YES_03_02 " );	// But when it became clear that the paladins wanted to go here, my experience and knowledge of these places proved to be very useful.
	AI_Output(self,other, " DIA_MiltenOW_Hello_YES_03_03 " );	// Therefore, it was decided to entrust me with this sacred mission of providing magical support for this expedition.
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello, " Of course I remember guys! " ,DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello, " These names mean nothing to me. " ,DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_NO()
{
	AI_Output(other,self, " DIA_MiltenOW_Hello_NO_15_00 " );	// Do I know you?
	AI_Output(self,other, " DIA_MiltenOW_Hello_NO_03_01 " );	// You've been through a lot, haven't you?
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello, " Of course I remember guys! " ,DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello, " These names mean nothing to me. " ,DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_Friends()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_MiltenOW_Hello_Friends_15_00 " );	// Of course I remember the guys!
	AI_Output(self,other, " DIA_MiltenOW_Hello_Friends_03_01 " );	// Well, Gorn and Diego didn't get far. They were picked up by the paladins here in the valley.
	AI_Output(self,other, " DIA_MiltenOW_Hello_Friends_03_02 " );	// Lester is gone, though - and I have no idea where he's hanging out right now.

	if(Npc_KnowsInfo(other,DIA_Lester_Hello))
	{
		AI_Output(other,self, " DIA_MiltenOW_Hello_Friends_15_03 " );	// I met Lester - he's with Xardas now.
		AI_Output(self,other, " DIA_MiltenOW_Hello_Friends_03_04 " );	// Well, at least some good news.
	};

	AI_Output(self,other, " DIA_MiltenOW_Hello_Friends_03_05 " );	// Well, I don't have anything good.
	Knows_Diego = TRUE;
	Info_ClearChoices(DIA_MiltenOW_Hello);
};

func void DIA_MiltenOW_Hello_Forget()
{
	AI_Output(other,self, " DIA_MiltenOW_Hello_Forget_15_00 " );	// These names mean nothing to me.
	AI_Output(self,other, " DIA_MiltenOW_Hello_Forget_03_01 " );	// You forgot a lot, didn't you? Well, let's leave the past alone and devote ourselves to the affairs of the present day.
	AI_Output(self,other, " DIA_MiltenOW_Hello_Forget_03_02 " );	// I don't have good news though.
	Info_ClearChoices(DIA_MiltenOW_Hello);
};

instance DIA_MiltenOW_Report (C_Info)
{
	npc = PC_Mage_OW;
	nr = 3;
	condition = DIA_MiltenOW_Report_Condition;
	information = DIA_MiltenOW_Report_Info;
	permanent = FALSE;
	description = " How are things here? " ;
};

func int DIA_MiltenOW_Report_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Hello))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Report_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Bericht_15_00 " );	// How are things here?
	AI_Output(self,other, " DIA_MiltenOW_Bericht_03_01 " );	// Paladins came here to mine magic ore.
	AI_Output(self,other, " DIA_MiltenOW_Bericht_03_02 " );	// But with all these dragon and orc attacks, I doubt the paladins will leave here with the ore.
	AI_Output(self,other, " DIA_MiltenOW_Bericht_03_03 " );	// No, I swear by Innos - I feel the presence of something dark... some kind of evil, it grows here. Something dark is rising from this valley.
	AI_Output(self,other, " DIA_MiltenOW_Bericht_03_04 " );	// We paid a high price for the destruction of the Sleeper. The destruction of the Barrier destroyed this place as well.
	AI_Output(self,other, " DIA_MiltenOW_Bericht_03_05 " );	// We can consider ourselves lucky if we manage to survive all this.
};

instance DIA_MiltenOW_Pashal(C_Info)
{
	npc = PC_Mage_OW;
	nr = 3;
	condition = DIA_MiltenOW_Pashal_Condition;
	information = DIA_MiltenOW_Pashal_Info;
	permanent = FALSE;
	description = " I have one question for you. " ;
};

func int DIA_MiltenOW_Pashal_Condition()
{
	if((MIS_PashalQuest == LOG_Running) && (PashalQuestMageStep == TRUE) && (PashalQuestCaveStep == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Pashal_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Pashal_01_00 " );	// I have one question for you.
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_01 " );	// Which one?
	AI_Output(other,self, " DIA_MiltenOW_Pashal_01_02 " );	// Have you heard anything about a certain magical artifact that absorbed all the power of this world?
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_03 " );	// Hmmm... (thoughtfully) Yes! I remember something... I think Master Corristo once mentioned this.
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_04 " );	// He even planned to use this artifact to destroy the magic barrier!
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_05 " );	// But since the artifact was never found, all this remained only in words.
	AI_Output(other,self, " DIA_MiltenOW_Pashal_01_06 " );	// What exactly did you do?
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_07 " );	// As far as I know, Corristo sent one of the mages to find him.
	AI_Output(self,other, " DIA_MiltenOW_Pashal_01_08 " );	// But he never came back! No further attempts were made to find him.
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_09");	//Ясно.
	PashalQuestCaveStep = TRUE;
	B_LogEntry(TOPIC_PashalQuest, " Milten told me that the Fire Mages tried to find this artifact and even sent one of the Mages to look for it. But they did not succeed, and that mage disappeared altogether. " );
	Wld_InsertNpc(KDF_4569_AlexOne,"OW_ALEXONE");
};

instance DIA_MiltenOW_Erz (C_Info)
{
	npc = PC_Mage_OW;
	nr = 4;
	condition = DIA_MiltenOW_Erz_Condition;
	information = DIA_MiltenOW_Erz_Info;
	permanent = FALSE;
	description = " How much ore did you mine? " ;
};


func int DIA_MiltenOW_Erz_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_MiltenOW_Info ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Erz_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Erz_15_00 " );	// How much ore did you mine?
	AI_Output(self,other, " DIA_MiltenOW_Erz_03_01 " );	// How much ore?.. Not a single crate! We haven't had any news from the prospectors for a long time.
	AI_Output(self,other, " DIA_MiltenOW_Erz_03_02 " );	// I wouldn't be surprised if they're all long dead. And we are attacked by dragons and besieged by orcs!
	AI_Output(self,other, " DIA_MiltenOW_Erz_03_03 " );	// This expedition turned out to be a complete failure.
};


instance DIA_MiltenOW_Wo (C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Wo_Condition;
	information = DIA_MiltenOW_Wo_Info;
	permanent = FALSE;
	description = " Where are Gorn and Diego now? " ;
};


func int DIA_MiltenOW_Wo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_MiltenOW_Hello ) && ( Knows_Diego ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Wo_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Wo_Forget_15_00 " );	// Where are Gorn and Diego now?
	AI_Output(self,other, " DIA_MiltenOW_Wo_Forget_03_01 " );	// Well, Gorn is here in prison for resisting arrest.
	AI_Output(self,other, " DIA_MiltenOW_Wo_Forget_03_02 " );	// Diego was assigned to a prospecting party. Ask paladin Parsival, he sent this squad.
	KnowsAboutGorn = TRUE;
	SearchForDiego = LOG_Running;
};


instance DIA_MiltenOW_Gorn(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Gorn_Condition;
	information = DIA_MiltenOW_Gorn_Info;
	permanent = FALSE;
	description = " Let's go free the Gorn! " ;
};


func int DIA_MiltenOW_Gorn_Condition()
{
	if ((KnowsAboutGorn ==  TRUE ) && (Chapter ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Gorn_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Gorn_15_00 " );	// Let's go free Gorn!
	AI_Output(self,other, " DIA_MiltenOW_Gorn_03_01 " );	// Well... the problem is that Gorn is a convicted prisoner.
	AI_Output(self,other, " DIA_MiltenOW_Gorn_03_02 " );	// But if we're lucky, Garond will agree to the deal and we can buy Gorn's freedom.
	AI_Output(other,self, " DIA_MiltenOW_Gorn_15_03 " );	// Yes, maybe...
	AI_Output(self,other, " DIA_MiltenOW_Gorn_03_04 " );	// Keep me posted.
	Log_CreateTopic(TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueGorn,LOG_Running);
	B_LogEntry(TOPIC_RescueGorn, " Commander Garond put Gorn in jail. Perhaps we can negotiate with him and we will be able to get the poor fellow out. " );
};


instance DIA_MiltenOW_Price (C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Preis_Condition;
	information = DIA_MiltenOW_Preis_Info;
	permanent = FALSE;
	description = " Garond wants a thousand gold coins for the Gorn. " ;
};


func int DIA_MiltenOW_Price_Condition()
{
	if ((MY_RescueGorn == LOG_Running) && (Chapter ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Preis_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Preis_15_00 " );	// Garond wants a thousand gold coins for Gorn.
	AI_Output(self,other, " DIA_MiltenOW_Preis_03_01 " );	// Not a small amount. I can donate two hundred and fifty coins.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	B_LogEntry(TOPIC_RescueGorn, " Milten gave me two hundred and fifty coins to pay for rescuing Gorn. " );
};


instance DIA_MiltenOW_More (C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Mehr_Condition;
	information = DIA_MiltenOW_More_Info;
	permanent = FALSE;
	description = " I need more gold to buy Gorn's freedom. " ;
};


func int DIA_MiltenOW_Mehr_Condition()
{
	if ((MY_RescueGorn == LOG_Running) && (Chapter ==  2 ) && (Npc_HasItems(other,ItMy_Gold) <  1000 ) && Npc_KnowsInfo(other,DIA_MiltenOW_Price));
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_More_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Mehr_15_00 " );	// I need more gold to buy Gorn's freedom.
	AI_Output(self,other, " DIA_MiltenOW_Mehr_03_01 " );	// Get more gold... Hmm, Diego could help, but he's not here.
	AI_Output(self,other, " DIA_MiltenOW_Mehr_03_02 " );	// Maybe Gorn stashed some gold for himself somewhere. Need to figure it out.
	AI_Output(self,other, " DIA_MiltenOW_Mehr_03_03 " );	// I'll write him a note - here, try to send it to the dungeon.
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);
	B_LogEntry(TOPIC_RescueGorn, " Milten gave me a note for the Gorn. If I can get into the prison, perhaps the Gorn can let me know if he has hidden some gold somewhere. " );
};


instance DIA_MiltenOW_Equipment(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Equipment_Condition;
	information = DIA_MiltenOW_Equipment_Info;
	permanent = FALSE;
	description = " Can you provide me with gear? " ;
};


func int DIA_MiltenOW_Equipment_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Garond_Equipment ) && ( other . guild ==  GIL_KDF ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Equipment_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Equipmentt_15_00 " );	// Can you provide me with equipment? Garond asked me to go to the mines.
	AI_Output(self,other, " DIA_MiltenOW_Equipment_03_01 " );	// And where do you think I'll get it? The only thing I can give you is a valuable runestone.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
};


instance DIA_MiltenOW_Versteck (C_Info)
{
	npc = PC_Mage_OW;
	nr = 1;
	condition = DIA_MiltenOW_Versteck_Condition;
	information = DIA_MiltenOW_Versteck_Info;
	permanent = FALSE;
	important = FALSE;
	description = " I received a response from Gorn. " ;
};


func int DIA_MiltenOW_Versteck_Condition()
{
	if ((GornsTreasure ==  TRUE ) && (Npc_HasItems(other,ItMi_GornsTreasure_MIS) <=  0 ) && (Gorns_Beutel ==  FALSE ) && (Kapitel ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Versteck_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Versteck_15_00 " );	// I got a response from Gorn. He says that his gold is at the south gate.
	AI_Output(self,other, " DIA_MiltenOW_Versteck_03_01 " );	// The former south gate, you mean. The dragon turned them into ruins.
	AI_Output(other,self, " DIA_MiltenOW_Versteck_15_02 " );	// How do I get there?
	AI_Output(self,other, " DIA_MiltenOW_Versteck_03_03 " );	// It's near the orc ram. The south gate was to his right.
	AI_Output(self,other, " DIA_MiltenOW_Versteck_03_04 " );	// It won't be easy - so try to do it quickly and without attracting the attention of the enemy.
	B_LogEntry(TOPIC_RescueGorn, " The former south gate is to the right of the orc battering ram. The Forge's gold is hidden somewhere. " );
};


instance DIA_MiltenOW_Frei (C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Frei_Condition;
	information = DIA_MiltenOW_Frei_Info;
	permanent = FALSE;
	description = " I freed the Gorn. " ;
};


func int DIA_MiltenOW_Frei_Condition()
{
	if ((MY_RescueGorn ==  LOG_SUCCESS ) && (Chapter ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Frei_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Frei_15_00 " );	// I freed Gorn.
	AI_Output(self,other, " DIA_MiltenOW_Frei_03_01 " );	// Good! Now we can think about what to do next.
};


instance DIA_MiltenOW_Lehren (C_Info)
{
	npc = PC_Mage_OW;
	nr = 9;
	condition = DIA_MiltenOW_Lehren_Condition;
	information = DIA_MiltenOW_Teaching_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int DIA_MiltenOW_Lehren_Condition()
{
	if ((other.guild ==  GIL_KDF ) && (Chapter ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Teaching_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Lehren_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_MiltenOW_Lehren_03_01 " );	// I can initiate you into some of the spells of the second circle of magic or help you increase your magic power.
	AI_Output(self,other, " DIA_MiltenOW_Lehren_03_02 " );	// If you feel ready to increase your power, I will give you instructions.
};

instance DIA_MILTENOW_CASSIA(C_Info)
{
	npc = PC_Mage_OW;
	nr = 10;
	condition = dia_miltenow_cassia_condition;
	information = dia_miltenow_cassia_info;
	permanent = FALSE;
	description = " Do you happen to know... " ;
};

func int dia_miltenow_cassia_condition()
{
	if((MIS_CASSIAGOLDCUP == LOG_Running) && (Npc_HasItems(other,ItKe_OC_Store) == 0))
	{
		return TRUE;
	};
};

func void dia_miltenow_cassia_info()
{
	AI_Output(other,self, " DIA_Milten_Cassia_15_00 " );	// Do you happen to know where the key to the paladin warehouse is?
	AI_Output(self,other, " DIA_Milten_Cassia_03_01 " );	// What are you up to, robber? However, you're out of luck.
	AI_Output(self,other, " DIA_Milten_Cassia_03_02 " );	// One fine day, Anghor got out of his kennel to breathe fresh air and sowed it somewhere.
	AI_Output(self,other, " DIA_Milten_Cassia_03_03 " );	// I think that sooner or later Garond will order to break the door and force Angora to repair it.
	AI_Output(self,other,"DIA_Milten_Cassia_03_04");	//Да, кстати...
	AI_Output(self,other, " DIA_Milten_Cassia_03_05 " );	// If you still find the key - return it to Angora!
	AI_Output(self,other, " DIA_Milten_Cassia_03_06 " );	// This will be better for everyone.
	AI_Output(other,self, " DIA_Milten_Cassia_15_07 " );	// Got it.
	B_LogEntry( TOPIC_CASSIAGOLDCUP , " Angore lost the paladin store key when he went out for some fresh air. If I find the key, it's best if I return it to Anggor. " );
	MILTENSAYABOUTOCKEY = TRUE;
};

instance DIA_MiltenOW_TeachCircle2(C_Info)
{
	npc = PC_Mage_OW;
	nr = 91;
	condition = DIA_MiltenOW_TeachCircle2_Condition;
	information = DIA_MiltenOW_TeachCircle2_Info;
	permanent = TRUE;
	description = " Teach me the second Circle of Magic. (Training Points: 30) " ;
};


func int DIA_MiltenOW_TeachCircle2_Condition()
{
	if ((other.guild ==  GIL_KDF ) && Npc_KnowsInfo(other, DIA_MiltenOW_Lehren) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE ) <  2 ) );
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_TeachCircle2_Info()
{
	AI_Output(other,self, " DIA_Milten_Add_15_00 " );	// Teach me the second circle of magic.
	AI_Output(self,other, " DIA_Milten_Add_03_01 " );	// This is usually the privilege of the teachers of our order.
	AI_Output(self,other, " DIA_Milten_Add_03_02 " );	// But I think we can make an exception in your case...

	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other, " DIA_Milten_Add_03_03 " );	// I'm not sure I remember all those official and solemn words...
		AI_Output(self,other, " DIA_Milten_Add_03_04 " );	// Enter the second circle. Uh... he will show you the direction, but your deeds form the path..
		AI_Output(self,other, " DIA_Milten_Add_03_05 " );	// I think you understand what this is all about...
	};
};


instance DIA_MiltenOW_Teach(C_Info)
{
	npc = PC_Mage_OW;
	nr = 90;
	condition = DIA_MiltenOW_Teach_Condition;
	information = DIA_MiltenOW_Teach_Info;
	permanent = TRUE;
	description = " I want to learn new spells. " ;
};


func int DIA_MiltenOW_Teach_Condition()
{
	if ((other.guild ==  GIL_KDF ) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Chapter ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Teach_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Teach_15_00 " );	// I want to learn new spells.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenOW_Teach);
		Info_AddChoice(DIA_MiltenOW_Teach,Dialog_Back,DIA_MiltenOW_Teach_BACK);
		if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenOW_Teach,b_buildlearnstringforrunes(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenOW_Teach_Feuerball);
		};
		if((PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == FALSE) && (LegoSpells == TRUE))
		{
			Info_AddChoice(DIA_MiltenOW_Teach,b_buildlearnstringforrunes(NAME_SPL_RapidFirebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidFirebolt)),DIA_MiltenOW_Teach_RapidFirebolt);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_MiltenOW_Teach_03_01 " );	// You still haven't reached the second circle of magic. I can't teach you anything.
	};
};

func void DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenOW_Teach);
};

func void DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenOW_Teach_RapidFirebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidFirebolt);
};

instances DIA_MiltenOW_Mana (C_Info)
{
	npc = PC_Mage_OW;
	nr = 100;
	condition = DIA_MiltenOW_Mana_Condition;
	information = DIA_MiltenOW_Mana_Info;
	permanent = TRUE;
	description = " I want to increase my magical abilities. " ;
};


func int DIA_MiltenOW_Mana_Condition()
{
	if ((other.guild ==  GIL_KDF ) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Chapter ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mana_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Mana_15_00 " );	// I want to increase my magical abilities
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other, " DIA_MiltenOW_Mana_03_00 " );	// Your magical energy is great. Too big for me to enlarge it.
	};
	Info_ClearChoices(DIA_MiltenOW_Mana);
};

func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};


instance DIA_MiltenOW_Perm(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Perm_Condition;
	information = DIA_MiltenOW_Perm_Info;
	permanent = TRUE;
	description = " What are your responsibilities here? " ;
};


func int DIA_MiltenOW_Perm_Condition()
{
	if ((Capital ==  2 ) && (Npc_KnowsInfo(other,DIA_MiltenOW_Free) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Perm_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Perm_15_00 " );	// And what are your duties here?
	AI_Output(self,other, " DIA_MiltenOW_Perm_03_01 " );	// Initially, I had to check for magic ore. But she rarely fell into my hands here.
	AI_Output(self,other, " DIA_MiltenOW_Perm_03_02 " );	// And now I'm focusing on learning alchemy.
};


instance DIA_MiltenOW_Plan(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Plan_Condition;
	information = DIA_MiltenOW_Plan_Info;
	permanent = TRUE;
	description = " What are you planning to do next? " ;
};


func int DIA_MiltenOW_Plan_Condition()
{
	if ((Capital ==  2 ) && Npc_KnowsInfo(other,DIA_MiltenOW_Free)) .
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Plan_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Plan_15_00 " );	// What are you planning to do next?
	AI_Output(self,other, " DIA_MiltenOW_Plan_03_01 " );	// I'll be back. I'll wait a little longer, and now that Gorn is free, I can go with him.
	AI_Output(self,other, " DIA_MiltenOW_Plan_03_02 " );	// It's imperative that the Pyrocar learn about the situation here.
	AI_Output(other,self, " DIA_MiltenOW_Plan_15_03 " );	// Well, if you think so.
	AI_Output(self,other, " DIA_MiltenOW_Plan_03_04 " );	// I hope Lord Hagen understands the threat this valley poses. I don't want to think about what will happen if the orcs pass through the Passage.
	AI_Output(other,self, " DIA_MiltenOW_Plan_15_05 " );	// Well, have a good trip then.
};

instance DIA_MiltenOW_Baby(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Baby_Condition;
	information = DIA_MiltenOW_Baby_Info;
	permanent = FALSE;
	description = " I have a very unusual request for you. " ;
};

func int DIA_MiltenOW_Baby_Condition()
{
	if((Kapitel < 3) && (MIS_BrutusBaby == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Baby_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Baby_01_00 " );	// I have a very unusual request for you.
	AI_Output(self,other, " DIA_MiltenOW_Baby_01_01 " );	// Speak. You know, for a friend, I'm ready to do everything in my power.
	AI_Output(other,self, " DIA_MiltenOW_Baby_01_02 " );	// Anyway, a squire from the castle asked me... to ask you to conjure a woman for him and his comrades.
	AI_Output(other,self, " DIA_MiltenOW_Baby_01_03 " );	// Well, you know what I mean.
	AI_Output(self,other, " DIA_MiltenOW_Baby_01_04 " );	// (puzzled) To tell you the truth, I didn't expect to hear such a request from you.
	AI_Output(other,self, " DIA_MiltenOW_Baby_01_05 " );	// So can you help them?
	AI_Output(self,other, " DIA_MiltenOW_Baby_01_06 " );	// Well... I'm not very experienced in such matters, shall we say. But since you ask, I'll try to come up with something.
	AI_Output(other,self, " DIA_MiltenOW_Baby_01_07 " );	// Great! I'm sure the guys will be just overjoyed. When will everything be ready?
	AI_Output(self,other, " DIA_MiltenOW_Baby_01_08 " );	// I think by tomorrow evening, not earlier. I need to be well prepared.
	AI_Output(other,self, " DIA_MiltenOW_Baby_01_09 " );	// So I'll tell them.
	B_LogEntry(TOPIC_BrutusBaby, " Oddly enough, Milten agreed to help. According to him, by tomorrow evening, everything should be ready. " );
	AI_StopProcessInfos(self);
};

instance DIA_MiltenOW_Baby_Done(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Baby_Done_Condition;
	information = DIA_MiltenOW_Baby_Done_Info;
	permanent = FALSE;
	description = " Are you ready? " ;
};

func int DIA_MiltenOW_Baby_Done_Condition()
{
	if((Kapitel < 3) && (MIS_BrutusBaby == LOG_Running) && (BrutusGoParty == TRUE) && (BrutusGoPartyNever == FALSE) && (Npc_GetDistToWP(self,"OC_DRAGO") <= 500))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Baby_Done_Info()
{
	AI_Output(other,self, " DIA_MiltenOW_Baby_Done_01_00 " );	// Are you ready?
	AI_Output(self,other, " DIA_MiltenOW_Baby_Done_01_01 " );	// Yes, all preparations are complete. It remains only to cast the desired spell.
	AI_Output(other,self, " DIA_MiltenOW_Baby_Done_01_02 " );	// So, what's the matter, read.
	AI_Output(self,other, " DIA_MiltenOW_Baby_Done_01_03 " );	// You'd better do it, as I need to maintain my concentration around the magic pentagram of summoning.
	AI_Output(self,other, " DIA_MiltenOW_Baby_Done_01_04 " );	// Here, take this scroll. Everything is written there.
	B_GiveInvItems(self,other,ItWr_MiltenSummon,1);
	AI_Output(other,self, " DIA_MiltenOW_Baby_Done_01_05 " );	// Okay, come here.
	Info_ClearChoices(DIA_MiltenOW_Baby_Done);
	Info_AddChoice(DIA_MiltenOW_Baby_Done, " Use Scroll... " ,DIA_MiltenOW_Baby_Done_Do);
};

func void DIA_MiltenOW_Baby_Done_Do()
{
	B_GivePlayerXP(500);
	Npc_RemoveInvItems(other,ItWr_MiltenSummon,1);
	B_HeroUseFakeScroll();
	MIS_BrutusBaby = LOG_Success;
	Log_SetTopicStatus(TOPIC_BrutusBaby,LOG_Success);
	B_LogEntry(TOPIC_BrutusBaby, " It looks like Milten messed up something in the spell. Instead of a beautiful maiden, a huge archdemon appeared in the center of the pentagram. True, it is quite harmless. But one of his sights caught up with such horror on all those present that they will now probably forget about any- or your desires. " );
	MiltenSummon = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Demon_Lord_Milten,"OC_MAGE_CENTER");
};
