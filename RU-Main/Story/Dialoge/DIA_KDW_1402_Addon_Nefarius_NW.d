
instance DIA_Addon_Nefarious_EXIT (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 999;
	condition = DIA_Addon_Nefarious_EXIT_Condition;
	information = DIA_Addon_Nefarious_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarious_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarious_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarious_Hallo (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 5;
	condition = DIA_Addon_Nefarious_Hello_Condition;
	information = DIA_Addon_Nefarious_Hello_Info;
	description = " How are you? " ;
};


func int DIA_Addon_Nefarious_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarious_Hello_Info()
{
	AI_Output(other, self, " DIA_Addon_Nefarious_Hallo_15_00 " );	// What are you doing?
	AI_Output(self,other, " DIA_Addon_Nefarius_Hallo_05_01 " );	// What are YOU doing here? What a surprise!
	AI_Output(self,other, " DIA_Addon_Nefarius_Hallo_05_02 " );	// I thought you were dead.
	AI_Output(other, self, " DIA_Addon_Nefarious_Hallo_15_03 " );	// Almost
	AI_Output(self,other, " DIA_Addon_Nefarius_Hallo_05_04 " );	// You made a big fuss, you know about that? Saturas was unrecognizable - those events completely pissed him off.
};


instance DIA_Addon_Nefarius_keineahnung (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_keineahnung_Condition;
	information = DIA_Addon_Nefarius_keineahnung_Info;
	description = " What is this portal? " ;
};


func int DIA_Addon_Nefarious_keineahnung_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Nefarius_Hello ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Nefarious_keineahnung_Info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_keineahnung_15_00 " );	// What is this portal?
	AI_Output(self,other, " DIA_Addon_Nefarius_keineahnung_05_01 " );	// We believe it leads to a lost valley that contains a city of an ancient civilization.
	AI_Output(self,other, " DIA_Addon_Nefarius_keineahnung_05_02 " );	// But for now, there is only many meters of stone behind the portal.
	AI_Output(self,other, " DIA_Addon_Nefarius_keineahnung_05_03 " );	// We couldn't find any traces of teleportation magic. Very mysterious...
};


instance DIA_Addon_Nefarius_WieMechanik (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WieMechanik_Condition;
	information = DIA_Addon_Nefarius_WieMechanik_Info;
	description = " Do you know how to activate the portal? " ;
};


func int DIA_Addon_Nefarious_WieMechanik_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Nefarius_NoneAfter )) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Nefarious_WieMechanik_Info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_WieMechanik_15_00 " );	// Do you know how to activate the portal?
	AI_Output(self,other, " DIA_Addon_Nefarius_WieMechanik_05_01 " );	// Looks like the missing parts of the ornament add up to the key.
	AI_Output(self,other, " DIA_Addon_Nefarius_WieMechanik_05_03 " );	// We need him to open the portal.
	AI_Output(self,other, " DIA_Addon_Nefarius_WieMechanik_05_02 " );	// The key must fit exactly into the ring-shaped recess next to the portal.
};


instance DIA_Addon_Nefarious_SCbringOrnaments (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_SCbringOrnaments_Condition;
	information = DIA_Addon_Nefarius_SCbringOrnaments_Info;
	description = " I brought a piece of ornament. " ;
};


func int DIA_Addon_Nefarious_SCbringOrnaments_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Nefarious_SCbringOrnaments_Info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_SCbringOrnaments_15_00 " );	// I brought a part of the ornament.
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_01 " );	// True? This is amazing.
	AI_Output(other,self, " DIA_Addon_Nefarius_SCbringOrnaments_15_02 " );	// Do you know where the other parts are?
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_03 " );	// According to the ancient writings, the key was divided into four parts.
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_04 " );	// These pieces are still on the island...
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_05 " );	// With the help of Merdarion, I managed to decipher some of the inscriptions.
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_06 " );	// They point to places where parts of the ornament were hidden.
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_07 " );	// I marked these places on this map.
	CreateInvItems(self,itwr_map_newworld_ornaments_addon_1,1);
	B_GiveInvItems(self,other,itwr_map_newworld_ornaments_addon_1,1);
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament, " Waterbenders have found a portal that leads to an unknown part of Khorinis. " );
	B_LogEntry(TOPIC_Addon_Ornament, " Nefarius wants to activate the portal with an ornate ring. He's still missing three pieces of that ring. I have to find them. He gave me a map that shows where I should look for the fragments. " );
	B_StartOtherRoutine(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_08 " );	// You should be looking for the key parts there.
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_09 " );	// Pay attention to ancient buildings. They may be dilapidated, but still easily recognizable.
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_10 " );	// It can be anything: a boulder, a circle of stones, a mausoleum, or something similar.
	AI_Output(self,other, " DIA_Addon_Nefarius_SCbringOrnaments_05_11 " );	// But why this chatter? You yourself will see everything. Good luck!
};


instance DIA_Addon_Nefarius_WhyPortalClosed(C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 5;
	condition = DIA_Addon_Nefarious_WhyPortalClosed_Condition;
	information = DIA_Addon_Nefarius_WhyPortalClosed_Info;
	description = " Why was the ornament broken? " ;
};


func int DIA_Addon_Nefarious_WhyPortalClosed_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Nefarius_SCbringOrnaments ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Nefarious_WhyPortalClosed_Info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_WhyPortalClosed_15_00 " );	// Why was the ornament broken?
	AI_Output(self,other, " DIA_Addon_Nefarius_WhyPortalClosed_05_01 " );	// Whoever did this didn't want the portal to open again.
	AI_Output(self,other, " DIA_Addon_Nefarius_WhyPortalClosed_05_02 " );	// The more I study these inscriptions, the more I am convinced that the priests of this civilization were not fools.
	AI_Output(self,other, " DIA_Addon_Nefarius_WhyPortalClosed_05_03 " );	// They had good reasons to deny access to their valley.
	AI_Output(self,other, " DIA_Addon_Nefarius_WhyPortalClosed_05_04 " );	// We don't know what awaits us there, but it won't turn out to be anything good...
};


instance DIA_Addon_Nefarius_MissingOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 5;
	condition = DIA_Addon_Nefarious_MissingOrnaments_Condition;
	information = DIA_Addon_Nefarius_MissingOrnaments_Info;
	permanent = TRUE;
	description = " About missing fragments... " ;
};


func int DIA_Addon_Nefarious_MissingOrnaments_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};


var int MissingOrnamentsCounter;
const int Addon_NefariussMissingOrnamentsOffer = 100;

func void DIA_Addon_Nefarious_MissingOrnaments_Info()
{
	var int MissingOrnamentsCount;
	var int XP_Addon_BringMissingOrnaments;
	var int MissingOrnamentsGeld;
	var string concatText;
	AI_Output(other,self, " DIA_Addon_Nefarius_MissingOrnaments_15_00 " );	// About missing fragments...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//Да?
	if(Npc_HasItems(other,ItMi_Ornament_Addon) >= 1)
	{
		MissingOrnamentsCount = Npc_HasItems(other,ItMi_Ornament_Addon);
		if(MissingOrnamentsCount == 1)
		{
			AI_Output(other,self, " DIA_Addon_Nefarius_MissingOrnaments_15_02 " );	// I found another one.
			B_GivePlayerXP(XP_Addon_BringMissingOrnament);
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,1);
			AI_Print(b_formgivestring(other,1));
			MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
		}
		else
		{
			AI_Output(other, self, " DIA_Addon_Nefarious_MissingOrnaments_15_03 " );	// I found them
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,MissingOrnamentsCount);
			concatText = b_formgivestring(other,MissingOrnamentsCount);
			AI_Print(concatText);
			XP_Addon_BringMissingOrnaments = MissingOrnamentsCount * XP_Addon_BringMissingOrnament;
			MissingOrnamentsCounter = MissingOrnamentsCounter + MissingOrnamentsCount;
			B_GivePlayerXP(XP_Addon_BringMissingOrnaments);
		};
		AI_Output(self,other, " DIA_Addon_Nefarious_MissingOrnaments_05_04 " );	// Excellent!
		if(MissingOrnamentsCounter == 1)
		{
			AI_Output(self,other, " DIA_Addon_Nefarius_MissingOrnaments_05_05 " );	// There are two more left to find. I think you can do it.
		}
		else if(MissingOrnamentsCounter == 2)
		{
			AI_Output(self,other, " DIA_Addon_Nefarius_MissingOrnaments_05_06 " );	// Find another one and we'll have them all.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Nefarius_MissingOrnaments_05_07 " );	// Now we have all the parts. It remains to collect them.
			AI_Output(self,other, " DIA_Addon_Nefarius_MissingOrnaments_05_08 " );	// We use our combined powers to make a ring out of the fragments.
			MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS ;
		};
		AI_Output(self,other, " DIA_Addon_Nefarius_MissingOrnaments_05_09 " );	// Here, take this gold as a reward.
		MissingOrnamentsGeld = MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer;
		CreateInvItems(self,ItMi_Gold,MissingOrnamentsGeld);
		B_GiveInvItems(self,other,ItMi_Gold,MissingOrnamentsGeld);
		if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Addon_Nefarius_MissingOrnaments_05_10 " );	// Follow me!
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"PreRingritual");
			B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"PreRingritual");
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Nefarius_MissingOrnaments_15_11 " );	// Remind me how many fragments are there?
		AI_Output(self,other, " DIA_Addon_Nefarious_MissingOrnaments_05_12 " );	// Four...
		AI_Output(self,other, " DIA_Addon_Nefarius_MissingOrnaments_05_13 " );	// You'll find the remaining fragments at the locations I've marked on the map.
	};
};


instance DIA_Addon_Nefarious_Ringritual (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 5;
	condition = DIA_Addon_Nefarious_Ringritual_Condition;
	information = DIA_Addon_Nefarious_Ringritual_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarious_Ringritual_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Nefarious_Ringritual_Info()
{
	AI_Output(self,other, " DIA_Addon_Nefarius_Ringritual_05_00 " );	// Now step back.
	Npc_SetRefuseTalk(self,60);
	RitualRingRuns = LOG_Running;
	B_LogEntry(TOPIC_Addon_Ornament, " I brought all the pieces of the ring to Nefarius. Now the waterbenders can assemble the ring. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ringritual");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Ringritual");
};


instance DIA_Addon_Nefarious_RingRitualEnds (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 5;
	condition = DIA_Addon_Nefarious_RingRitualEnds_Condition;
	information = DIA_Addon_Nefarius_RingRitualEnds_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarious_RingRitualEnds_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (RitualRingRuns == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Nefarious_RingRitualEnds_Info()
{
	AI_Output(self,other, " DIA_Addon_Nefarius_RingRitualEnds_05_00 " );	// Ornament reassembled.
	AI_Output(self,other, " DIA_Addon_Nefarius_RingRitualEnds_05_01 " );	// You brought us the missing fragments, so we honor you with inserting the key into the portal.
	AI_Output(self,other, " DIA_Addon_Nefarius_RingRitualEnds_05_02 " );	// Go to Saturas and take the ring from him.
	AI_Output(self,other, " DIA_Addon_Nefarius_RingRitualEnds_05_03 " );	// Hope the portal opens.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Start");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Start");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Start");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Start");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry(TOPIC_Addon_Ornament, " The ornamental ring has been restored. I must take it back from Saturas. " );
};

instance DIA_ADDON_NEFARIUS_PRAYFORGOMEZ (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 1;
	condition = dia_addon_nefarius_prayforgomez_condition;
	information = dia_addon_nefarius_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};

func int dia_addon_nefarius_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Nefarius_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Nefarius_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Addon_Nefarius_PrayForGomez_01_03 " );	// I think he can help you.
	SENTTOSATURASGOMEZ = TRUE ;
};


instance DIA_ADDON_NEFARIUS_RUNEMAGICNOTWORK (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 1;
	condition = dia_addon_nefarius_runemagicnotwork_condition;
	information = dia_addon_nefarius_runemagicnotwork_info;
	permanent = FALSE;
	description = " Can you still use your rune magic? " ;
};


func int dia_addon_nefarious_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Nefarius_RuneMagicNotWork_01_00 " );	// Can you still use your rune magic?
	AI_Output(self,other, " DIA_Addon_Nefarius_RuneMagicNotWork_01_01 " );	// Rune magic no longer exists. Today its imperfection has been proven. Our task now is not to lose heart and not show our own insignificance.
	AI_Output(self,other, " DIA_Addon_Nefarius_RuneMagicNotWork_01_02 " );	// On the battlefield, of course, we are worthless, but we will heal and instruct our soldiers with a word.
	AI_Output(self,other, " DIA_Addon_Nefarius_RuneMagicNotWork_01_03 " );	// And once the war is over, we will immediately rush in search of other magic, and I am convinced that we will find it!
	AI_Output(other,self, " DIA_Addon_Nefarious_RuneMagicNotWork_01_04 " );	// Hmmm. Everything is clear.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " It seems the Waterbenders have also lost their ability to use rune magic. " );
	WATERMAGERUNESNOT = TRUE;
};

instance DIA_Addon_Nefarious_NW_Runen (C_Info)
{
	npc = KDW_1402_Addon_Nefarious_NW;
	nr = 99;
	condition = DIA_Addon_Nefarious_NW_Runen_Condition;
	information = DIA_Addon_Nefarious_NW_Runen_Info;
	permanent = TRUE;
	description = " Teach me how to make runes. " ;
};

func int DIA_Addon_Nefarious_NW_Runen_Condition()
{
	if (( Nefarius_Addon_TeachRunes ==  TRUE ) && ( STOPBIGBATTLE  ==  FALSE ) && ( KDW_JOINHAGEN  ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarious_NW_Runen_Info()
{
	AI_Output(other,self, " DIA_Parlan_TEACH_15_00 " );	// Train me!
	Info_ClearChoices(DIA_Addon_Nefarious_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_NW_Runen,Dialog_Back,DIA_Addon_Nefarious_NW_Runen_BACK);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen, " 6 Magic Circles " , DIA_Addon_Nefarius_NW_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen, " 5 Magic Circles " , DIA_Addon_Nefarius_NW_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen, " 4 Magic Circles " , DIA_Addon_Nefarius_NW_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen, " 3 Круг магии " ,DIA_Addon_Nefarius_NW_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen, " 2 Круг магии " ,DIA_Addon_Nefarius_NW_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen, " 1 Круг магии " ,DIA_Addon_Nefarius_NW_Runen_1);
	};
};

func void DIA_Addon_Nefarious_NW_Runen_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarious_NW_Runen);
};

func void DIA_Addon_Nefarious_NW_Runen_1()
{
	Info_ClearChoices(DIA_Addon_Nefarious_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_NW_Runen,Dialog_Back,DIA_Addon_Nefarious_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_Icebolt,B_GetLearnCostTalent(other, NPC_TALENT_RUNES ,SPL_Icebolt)),dia_addon_nefarius_NW_runen_circle_1_spl_icebolt);
	};
};

func void DIA_Addon_Nefarious_NW_Runen_2()
{
	Info_ClearChoices(DIA_Addon_Nefarious_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_NW_Runen,Dialog_Back,DIA_Addon_Nefarious_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_ICELANCE);
	};
	if(PLAYER_TALENT_RUNES[98] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSHOAL,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSHOAL)),dia_addon_nefarius_NW_runen_circle_2_spl_summonshoal);
	};
	if((PLAYER_TALENT_RUNES[SPL_RapidIcebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_RapidIcebolt,B_GetLearnCostTalent(other, NPC_TALENT_RUNES ,SPL_RapidIcebolt)),DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_RapidIcebolt);
	};
};

func void DIA_Addon_Nefarious_NW_Runen_3()
{
	Info_ClearChoices(DIA_Addon_Nefarious_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_NW_Runen,Dialog_Back,DIA_Addon_Nefarious_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_ThunderBall);
	};
};

func void DIA_Addon_Nefarious_NW_Runen_4()
{
	Info_ClearChoices(DIA_Addon_Nefarious_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_NW_Runen,Dialog_Back,DIA_Addon_Nefarious_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Addon_Nefarius_NW_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[89] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes( NAME_SPL_SUMMONICEGOLEM ,B_GetLearnCostTalent(other, NPC_TALENT_RUNES , SPL_SUMMONICEGOLEM )),dia_addon_nefarius_NW_runen_circle_4_spl_summonicegolem);
	};
};

func void DIA_Addon_Nefarious_NW_Runen_5()
{
	Info_ClearChoices(DIA_Addon_Nefarious_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_NW_Runen,Dialog_Back,DIA_Addon_Nefarious_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),dia_addon_nefarius_NW_runen_circle_5_spl_waterfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Addon_Nefarius_NW_Runen_Circle_5_SPL_IceWave);
	};
};

func void DIA_Addon_Nefarious_NW_Runen_6()
{
	Info_ClearChoices(DIA_Addon_Nefarious_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarious_NW_Runen,Dialog_Back,DIA_Addon_Nefarious_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),dia_addon_nefarius_NW_runen_circle_6_spl_geyser);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),dia_addon_nefarius_NW_runen_circle_6_spl_thunderstorm);
	};
};


func void DIA_Addon_Nefarious_NW_Runen_Circle_2_SPL_RapidIcebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidIcebolt);
};

func void DIA_Addon_Nefarious_NW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void dia_addon_nefarious_NW_runen_circle_1_spl_icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Addon_Nefarious_NW_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void dia_addon_nefarius_NW_runen_circle_2_spl_summonshoal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONSHOAL);
};

func void DIA_Addon_Nefarious_NW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_ThunderBall();
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void dia_addon_nefarius_NW_runen_circle_4_spl_summonicegolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONICEGOLEM);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void dia_addon_nefarius_NW_runen_circle_5_spl_waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void dia_addon_nefarius_NW_runen_circle_6_spl_geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void dia_addon_nefarius_NW_runen_circle_6_spl_thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};

