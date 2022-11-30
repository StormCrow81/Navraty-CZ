
instance DIA_Addon_Myxir_ADW_EXIT(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 999;
	condition = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_ADWHello(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_ADWHello_Condition;
	information = DIA_Addon_Myxir_ADWHello_Info;
	description = " Any new finds? " ;
};


func int DIA_Addon_Myxir_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_ADWHello_15_00 " );	// Any new finds?
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_12_01 " );	// Architects just amaze me!
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_12_02 " );	// Too bad they're all dead, like their language.
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_12_03 " );	// Even their powerful rituals and ancestral spirits couldn't save them.
	AI_Output(other,self, " DIA_Addon_Myxir_ADWHello_15_04 " );	// Spirits of ancestors?
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_12_05 " );	// Architects lived in close connection with the world of spirits.
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_12_06 " );	// If I understand correctly, they believed that their ancestors were in constant contact with them.
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_12_07 " );	// They regularly performed rituals to summon spirits. The spirits gave them advice and helped them achieve enlightenment.
	Info_ClearChoices(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello, " How did these rituals work? " ,DIA_Addon_Myxir_ADWHello_wie);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello, " The undead I've met weren't very talkative. " ,DIA_Addon_Myxir_ADWHello_Watt);
};

func void DIA_Addon_Myxir_ADWHello_wie()
{
	AI_Output(other,self, " DIA_Addon_Myxir_ADWHello_wie_15_00 " );	// How did these rituals work?
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_wie_12_01 " );	// Guardians of the dead were known to have special spells that were used to appease the spirits.
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_wie_12_02 " );	// However, the descriptions I find here are mostly obscure. Very rarely do I manage to find a clear answer to a question that interests me.
};

func void DIA_Addon_Myxir_ADWHello_Watt()
{
	AI_Output(other,self, " DIA_Addon_Myxir_ADWHello_Watt_15_00 " );	// The undead I've met weren't very talkative.
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_Watt_12_01 " );	// But the builders didn't call for evil soulless creatures like zombies or skeletons.
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_Watt_12_02 " );	// They were able to summon the spirits of great warriors, priests and rulers.
	AI_Output(self,other, " DIA_Addon_Myxir_ADWHello_Watt_12_03 " );	// I have no doubt they actually existed.
};


instances of DIA_Addon_Myxir_PermADW (C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_PermADW_Condition;
	information = DIA_Addon_Myxir_PermADW_Info;
	permanent = TRUE;
	description = " If I meet a spirit, I will definitely let you know. " ;
};


func int DIA_Addon_Myxir_PermADW_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Myxir_ADWHello ) && ( Saturation_SnowPlan ==  FALSE )) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Myxir_PermADW_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_PermADW_15_00 " );	// If I meet a spirit, I will definitely let you know.
	AI_Output(self,other, " DIA_Addon_Myxir_PermADW_12_01 " );	// (laughs) Yes, I insist on it.
};

instance DIA_Addon_Myxir_AncientBook(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_AncientBook_Condition;
	information = DIA_Addon_Myxir_AncientBook_Info;
	permanent = FALSE;
	description = " You look a little puzzled. " ;
};

func int DIA_Addon_Myxir_AncientBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_AncientBook_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_AncientBook_01_00 " );	// You look a little puzzled.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_01 " );	// You see, since I began to study the culture of architects, I have been constantly tormented by one question.
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBook_01_02");	//Какой?
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_03 " );	// We already know that the Ancients used stone tablets as writing.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_04 " );	// But it seems to me that they should have had full-fledged books in which they kept their knowledge and wisdom.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_05 " );	// In the north of this valley there is a large temple, which, apparently, the Builders used as their library.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_06 " );	// Unfortunately, I don't currently have the opportunity to go there myself and study it thoroughly.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_07 " );	// But maybe you can do it?
	AI_Output(other,self, " DIA_Addon_Myxir_AncientBook_01_08 " );	// Are you sure that the books of architects really exist?
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_09 " );	// Not sure. But their civilization has more than one millennium.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_10 " );	// And for such a huge period it is simply impossible to save all the records only on pieces of stone.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_11 " );	// So it's quite possible that we just don't know about the existence of other sources of their knowledge.
	AI_Output(other,self, " DIA_Addon_Myxir_AncientBook_01_12 " );	// Okay. I'll look there just in case.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBook_01_13 " );	// Great. If you find something interesting, be sure to show me.
	MIS_MyxirAncientBook = LOG_Running;
	Log_CreateTopic(TOPIC_MyxirAncientBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MyxirAncientBook,LOG_Running);
	B_LogEntry(TOPIC_MyxirAncientBook, " Mixir is sure that the Builders had their own real books. He thinks they can be found in the library, which is located in the northeast of the valley. " );
};

instance DIA_Addon_Myxir_AncientBookDone(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_AncientBookDone_Condition;
	information = DIA_Addon_Myxir_AncientBookDone_Info;
	permanent = FALSE;
	description = " Look at this. " ;
};

func int DIA_Addon_Myxir_AncientBookDone_Condition()
{
	if((MIS_MyxirAncientBook == LOG_Running) && (Npc_HasItems(hero,ItWr_AncientBook_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_AncientBookDone_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Addon_Myxir_AncientBookDone_01_00 " );	// Take a look at this.
	B_GiveInvItems(other,self,ItWr_AncientBook_01,1);
	Npc_RemoveInvItems(self,ItWr_AncientBook_01,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBookDone_01_01 " );	// Oh Adanos...(astonished) Where did you find this ancient manuscript?
	AI_Output(other,self, " DIA_Addon_Myxir_AncientBookDone_01_02 " );	// Where you advised me to look - in the Library of Architects.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBookDone_01_03 " );	// Incredible! So, I was right, and they really kept some of their notes in such books.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBookDone_01_04 " );	// These entries should be carefully examined as soon as possible.
	AI_Output(self,other, " DIA_Addon_Myxir_AncientBookDone_01_05 " );	// Perhaps this is where the answers to our questions lie.
	MIS_MyxirAncientBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_MyxirAncientBook,LOG_Success);
	B_LogEntry(TOPIC_MyxirAncientBook, " I gave Mixer the Builder's book I found in the ruins of the library. " );
};

instance DIA_Addon_Myxir_GeistTafel(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistTafel_Condition;
	information = DIA_Addon_Myxir_GeistTafel_Info;
	description = " Saturas sent me. " ;
};

func int DIA_Addon_Myxir_GeistTafel_Condition()
{
	if ((Saturated_SnowPlan ==  TRUE ) && Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Myxir_GeistTafel_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_GeistTafel_15_00 " );	// Saturas sent me.
	AI_Output(other,self, " DIA_Addon_Myxir_GeistTafel_15_01 " );	// The raven entered the temple and closed its doors from the inside.
	AI_Output(other,self, " DIA_Addon_Myxir_GeistTafel_15_02 " );	// Saturas thinks he learned how to get to the temple from a spirit!
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_03 " );	// (amazed) Oh, Adanos!
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_04 " );	// He must have summoned High Priest Cardimon to learn how to open the gate.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_05 " );	// According to the records, his tomb was in the caves under the fortress!
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_06 " );	// You should do the same.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_07 " );	// But you won't be able to summon Cardimon...
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_08 " );	// To the west of the valley is the tomb of Quarhodron, leader of the warriors.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_09 " );	// You must find her... and awaken Quarhodron.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_10 " );	// It is written here how one who believes in Adanos can summon a spirit.
	AI_Output(other,self, " DIA_Addon_Myxir_GeistTafel_15_11 " );	// Do you think this will work?
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_12 " );	// I've come across a lot of meaningless manuscripts.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_13 " );	// For example, records of Yu'Berion, leader of the Brotherhood of the Sleeper.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_12_14 " );	// But I believe the author of THESE entries.
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_Running;
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel, " Are you serious? " ,DIA_Addon_Myxir_GeistTafel_geist);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel, " Why Quarhodron? Why not High Priest Cardimon? " ,DIA_Addon_Myxir_GeistTafel_Khardimon);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel, " The Brotherhood of the Sleeper spread more than just lies. " ,DIA_Addon_Myxir_GeistTafel_psi);
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon()
{
	AI_Output(other,self, " DIA_Addon_Myxir_GeistTafel_Khardimon_15_00 " );	// Why Quarhodron? Why not High Priest Cardimon?
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_Khardimon_12_01 " );	// Raven defiled Cardimon's tomb with his ritual.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_Khardimon_12_02 " );	// So you'll have to find another spirit.
};

func void DIA_Addon_Myxir_GeistTafel_psi()
{
	AI_Output(other,self, " DIA_Addon_Myxir_GeistTafel_psi_15_00 " );	// The Brotherhood of the Sleeper was spreading more than just lies. The sleeper actually existed.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_psi_12_01 " );	// It wasn't what they were talking about that made them doubt their veracity, but the words they used.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_psi_12_02 " );	// The speeches of the members of the Brotherhood were confused and incomprehensible. Their minds were clouded by the swamp grass they smoked non-stop.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_psi_12_03 " );	// And the text on this tablet is written by a serious and reasonable person. This convinces me of the veracity of his words.
};

func void DIA_Addon_Myxir_GeistTafel_geist()
{
	AI_Output(other,self, " DIA_Addon_Myxir_GeistTafel_geist_15_00 " );	// Are you serious?
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_geist_12_01 " );	// We should use every opportunity.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_geist_12_02 " );	// Even if we only have a slim chance of meeting one of the Builders, we should use it.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_geist_12_03 " );	// In the end, Raven succeeded.
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel, " So what do I need to do to summon this spirit? " ,DIA_Addon_Myxir_GeistTafel_wie);
};

func void DIA_Addon_Myxir_GeistTafel_wie()
{
	AI_Output(other,self, " DIA_Addon_Myxir_GeistTafel_wie_15_00 " );	// And what do I need to do to summon this spirit?
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_wie_12_01 " );	// Find Quarhodron's tomb. It is located in the west of the valley.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_wie_12_02 " );	// The spirit can be summoned using the guardian of the dead spell. Here, I wrote it down.
	CreateInvItems(self,ItWr_Addon_SUMMONANCIENTGHOST,1);
	B_GiveInvItems(self,other,ItWr_Addon_SUMMONANCIENTGHOST,1);
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_wie_12_03 " );	// That's all. Now you just need to find the tomb.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistTafel_wie_12_04 " );	// Good luck, my son!
	; _ _ _ _
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
};

instance DIA_Addon_Myxir_GeistPerm(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistPerm_Condition;
	information = DIA_Addon_Myxir_GeistPerm_Info;
	description = " Tell me again about how to summon the spirit of Quarhodron. " ;
};


func int DIA_Addon_Myxir_GeistPerm_Condition()
{
	if(MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Myxir_GeistPerm_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_GeistPerm_15_00 " );	// Tell me again about how to summon Quarhodron's spirit.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistPerm_12_01 " );	// Find his tomb and cast the Guardians of the Dead spell in it.
	AI_Output(self,other, " DIA_Addon_Myxir_GeistPerm_12_02 " );	// I wrote down the words. You should just read them aloud.
};


instance DIA_Addon_Myxir_TalkedToGhost(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_TalkedToGhost_Condition;
	information = DIA_Addon_Myxir_TalkedToGhost_Info;
	description = " I spoke with Quarhodron. " ;
};


func int DIA_Addon_Myxir_TalkedToGhost_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Myxir_TalkedToGhost_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_TalkedToGhost_15_00 " );	// I spoke with Quarhodron.
	AI_Output(self,other, " DIA_Addon_Myxir_TalkedToGhost_12_01 " );	// (admiringly) Did you really manage to wake him from his mortal sleep?
	AI_Output(self,other, " DIA_Addon_Myxir_TalkedToGhost_12_02 " );	// Incredible! I am more and more fascinated by these Architects.
	AI_Output(self,other, " DIA_Addon_Myxir_TalkedToGhost_12_03 " );	// Who knows what they could have achieved if their civilization hadn't died...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Myxir_GeistBeschwoeren);
	if((Saturas_KnowsHow2GetInTempel == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TalkedToGhost_12_04 " );	// And what did the spirit say?
		AI_Output(other,self, " DIA_Addon_Myxir_TalkedToGhost_15_05 " );	// He told me about how to get to the Temple of Adanos.
		AI_Output(self,other, " DIA_Addon_Myxir_TalkedToGhost_12_06 " );	// Then quickly go to Saturas. He will certainly be interested in what you tell him.
		B_LogEntry(TOPIC_Addon_Quarhodron, " I must tell Saturas that I awakened the Quarhodron. " );
	};
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

instance DIA_Addon_Myxir_ADW_Teach(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 90;
	condition = DIA_Addon_Myxir_ADW_Teach_Condition;
	information = DIA_Addon_Myxir_ADW_Teach_Info;
	permanent = TRUE;
	description = " Teach me this language. " ;
};

func int DIA_Addon_Myxir_ADW_Teach_Condition()
{
	if((DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE) && ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_TeachRequest_15_00 " );	// Teach me this language.

	if(DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,Dialog_Back,DIA_Addon_Myxir_ADW_Teach_BACK);

		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_ADW_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachNoMore_12_00 " );	// I have nothing more to show you. You have learned the language of architects.
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_00 " );	// Well, let's start with something simple. Let us first deal with the language of the peasants.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_01 " );	// As a rule, texts written in the language of peasants are connected with our world, with such concepts as work, love, food production.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_02 " );	// This is the main language of the city. You can read most of the texts you find here if you master it.
	};

	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL2_12_00 " );	// You are already familiar with the language of the peasants. The language of the warriors is a bit more complex.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL2_12_01 " );	// Texts written in the language of warriors mainly deal with wars and weapons. You will learn something useful.
	};

	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_00 " );	// The high calm of the priests is hard to understand. But I'll gladly teach it to you.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_01 " );	// Among other things, the sacred books that describe the history and magic of the creators are written in the language of the priests.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_02 " );	// Each of these texts is a real treasure, if, of course, you can understand it.
	};

	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

instance DIA_ADDON_MYXIR_ADW_PRAYFORGOMEZ (C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 1;
	condition = dia_addon_myxir_adw_prayforgomez_condition;
	information = dia_addon_myxir_adw_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_myxir_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_adw_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_ADW_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Myxir_ADW_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Addon_Myxir_ADW_PrayForGomez_01_03 " );	// I think he can help you.
	SENTTOSATURASGOMEZ = TRUE ;
};
