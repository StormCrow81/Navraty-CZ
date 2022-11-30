

instance DIA_Addon_Saturas_EXIT (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 999;
	condition = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_EXIT_Info()
{
	if ((MY_Saturated_Addon_BringRiordian2Me ==  FALSE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Addon_Saturas_auftrag_14_01 " );	// Well, since there's no other way you can be persuaded to leave the other mages alone, I'll have to give you a task.
		AI_Output(self,other, " DIA_Addon_Saturas_auftrag_14_02 " );	// Tell Riordian I'm waiting for him.
		AI_Output(self,other, " DIA_Addon_Saturas_auftrag_14_03 " );	// You'll find it at the back of the vault.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_HolRiordian,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian,LOG_Running);
		B_LogEntry(TOPIC_Addon_HolRiordian, " Saturas wants me to send the mage Riordian to him. He should be at the back of the building. " );
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Nefarius (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Nefarious_Condition;
	information = DIA_Addon_Saturas_Nefarius_Info;
	description = " I've taken it upon myself to help Nefarious find the missing pieces of the ornament. " ;
};


func int DIA_Addon_Saturations_Nefarious_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturas_Nefarius_Info()
{
	AI_Output(other,self, " DIA_ADDON_Saturas_Nefarius_15_00 " );	// I've taken it upon myself to help Nefarious find the missing pieces of the ornament.
	AI_Output(self,other, " DIA_ADDON_Saturas_Nefarius_14_01 " );	// What? That cannot be! Are you meddling again?
	AI_Output(other,self, " DIA_ADDON_Saturas_Nefarius_15_02 " );	// Don't worry. I will deliver everything as is.

	if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_HasItems(other,itwr_map_newworld_ornaments_addon_1))
	{
		AI_Output(self,other, " DIA_ADDON_Saturas_Nefarius_14_03 " );	// Do you even know what you're looking for?
		AI_Output(other,self, " DIA_ADDON_Saturas_Nefarius_15_04 " );	// Well, Nefarius gave me this card...
		AI_Output(self,other, " DIA_ADDON_Saturas_Nefarius_14_05 " );	// Show her to me!
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_ADDON_Saturas_Nefarius_14_06 " );	// Hmm. The big forest is extremely dangerous. You shouldn't go there alone.
		AI_Output(self,other, " DIA_ADDON_Saturas_Nefarius_14_07 " );	// Find someone in Khorinis to come with you.
		AI_Output(self,other, " DIA_ADDON_Saturas_Nefarius_14_08 " );	// Not that I'm worried about you, but the monsters might eat the ornament with you.
		AI_Output(self,other, " DIA_ADDON_Saturas_Nefarius_14_09 " );	// Here's your card...
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament, " Saturas advised me not to go looking for the piece of ornament that is in the forest alone. I should find someone in Khorinis to come with me. " );
	};
};


instance DIA_Addon_Saturas_Hallo (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Hallo_Condition;
	information = DIA_Addon_Saturas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition()
{
	Npc_PerceiveAll(self);

	if(Wld_DetectNpc(self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		if ( CAPITALORCATC  ==  FALSE )
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Saturas_Hello_WEISSTDU()
{
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_WEISSTDU_14_00 " );	// Do you have any idea what you've done?
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_WEISSTDU_14_01 " );	// You've shattered the basic structure of magical nature so much that everyone in Khorinis almost went deaf.
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_WEISSTDU_14_02 " );	// Be thankful the Barrier is gone.
	AI_Output(other,self, " DIA_Addon_Saturas_Hallo_WEISSTDU_15_03 " );	// What are you complaining about, old man? Everything worked as it should.
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_WEISSTDU_14_04 " );	// Watch your tongue, young man!
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_WEISSTDU_14_05 " );	// What in the name of all the elements do you want here?
	Info_ClearChoices(DIA_Addon_Saturas_Hello);
};

func void DIA_Addon_Saturas_Hello_Info()
{
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_14_00 " );	// Are you crazy? Out!
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_14_01 " );	// Under the arches of this place is too dangerous for a novice adventurer.
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_14_02 " );	// But wait, don't I know you? Well, of course! Damn bastard...
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_14_03 " );	// Don't you think I've forgotten how you betrayed us back in the New Camp?
	Info_ClearChoices(DIA_Addon_Saturas_Hello);
	Info_AddChoice(DIA_Addon_Saturas_Hello, " (смущенно) Я... " ,DIA_Addon_Saturas_Hello_Video);
};

func void DIA_Addon_Saturas_Hallo_Video()
{
	PlayVideo("RET2_Oreheap.bik");
	AI_Output(self,other, " DIA_Addon_Saturas_Video_14_00 " );	// You somehow sucked all the magical energy out of our mountain of ore, and then just disappeared!
	AI_Output(self,other, " DIA_Addon_Saturas_Video_14_01 " );	// And why do you need it!
	Info_ClearChoices(DIA_Addon_Saturas_Hello);

	if(RhetorikSkillValue[1] >= 15)
	{	
		Info_AddChoice(DIA_Addon_Saturas_Hallo, " Your plan wouldn't have worked anyway. " ,DIA_Addon_Saturas_Hallo_Spott);
	}; 

	Info_AddChoice(DIA_Addon_Saturas_Hallo, " I'm really sorry. " ,DIA_Addon_Saturas_Hallo_sorry);
	Info_AddChoice(DIA_Addon_Saturas_Hallo, " Такова жизнь! " ,DIA_Addon_Saturas_Hallo_notwendig);
};

func void DIA_Addon_Saturas_Hello_necessary()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Saturas_Hallo_notwendig_15_00 " );	// Such is life! Without the power of the ore you have accumulated, I would not have been able to defeat the Sleeper.
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_notwendig_14_01 " );	// What the hell are you talking about?! Sleeping? Defeat the Sleeper?!
	DIA_Addon_Saturas_Hallo_WEISSTDU();
};

func void DIA_Addon_Saturas_Hallo_Spott()
{
	AI_Output(other,self, " DIA_Addon_Saturas_Hallo_Spott_15_00 " );	// Your plan wouldn't work anyway. Hehe, blow up a mountain of ore to remove the Barrier... Laughter, that's all.
	AI_Output(other,self, " DIA_Addon_Saturas_Hallo_Spott_15_01 " );	// All you'd have to do then is fly up into the air with your camp and its inhabitants to boot.
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_Spott_14_02 " );	// This is going too far! Who gave you the right to judge us and our intentions?
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_Spott_14_03 " );	// If I had not professed the path of non-violence, my boy... Consider yourself lucky.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	DIA_Addon_Saturas_Hallo_WEISSTDU();
};

func void DIA_Addon_Saturas_Hallo_sorry()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Saturas_Hallo_sorry_15_00 " );	// I'm really sorry. I didn't know what I was doing.
	AI_Output(self,other, " DIA_Addon_Saturas_Hallo_sorry_14_01 " );	// Oh, and you, naive, think that now you can forget about it?
	DIA_Addon_Saturas_Hallo_WEISSTDU();
};


instance DIA_Addon_NoneAfter (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_keineAhnung_Condition;
	information = DIA_Addon_Saturated_NoneAfter_Info;
	description = " I have absolutely no idea. " ;
};


func int DIA_Addon_Saturas_keineAhnung_Condition()
{
	if (MIS_Addon_Lares_Ornament2Saturas ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Addon_NoneBackground_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_keineAhnung_15_00 " );	// I have no idea. Just looked. It is forbidden?
	AI_Output(self,other, " DIA_Addon_Saturas_keineAhnung_14_01 " );	// You're wasting my precious time. Get out of my sight!
	AI_Output(self,other, " DIA_Addon_Saturas_keineAhnung_14_02 " );	// I'll deal with you later.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW, " I found the Waterbenders at the dig site. I need to find out what they're doing there. Saturas hasn't told me anything yet. He still can't get over that story in the colony. " );
	AI_StopProcessInfos(self);
};

instances DIA_Addon_Saturas_raus (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_raus_Condition;
	information = DIA_Addon_Saturas_raus_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Saturas_raus_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Saturas_noneAfter) && (MY_Addon_Ornament2Saturations ==  FALSE ) && Npc_IsInState(self,ZS_Talk));
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_raus_Info()
{
	AI_Output(self,other, " DIA_Addon_Saturas_raus_14_00 " );	// Get out before anything happens to you.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Lares (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Lares_Condition;
	information = DIA_Addon_Saturas_Lares_Info;
	description = " I came here with Lares. " ;
};


func int DIA_Addon_Saturas_Lares_Condition()
{
	if (Lares_arrived ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Lares_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_Lares_15_00 " );	// I came here with Lares.
	AI_Output(self,other, " DIA_Addon_Saturas_Lares_14_01 " );	// Lares? Truth? Where is he?
	AI_Output(other,self, " DIA_Addon_Saturas_Lares_15_02 " );	// I'm alone. Lares returned to the city.
	AI_Output(self,other, " DIA_Addon_Saturas_Lares_14_03 " );	// What? And he sent you to us alone? What was he thinking?
};


instance DIA_Addon_Saturate_Ornament (C_Info);
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Ornament_Condition;
	information = DIA_Addon_Saturas_Ornament_Info;
	description = " Here's what you need! Ornament. " ;
};

func int DIA_Addon_Saturations_Ornament_Condition()
{
	if ((Npc_HasItems(other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen ==  FALSE )) || ((Lares_Angekommen ==  TRUE ) && Npc_KnowsInfo(other,DIA_Addon_Saturas_Lares) && Npc_HasItems(other,ItMi_Ornament_Addon_Vatras)))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturas_Ornament_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_Ornament_15_00 " );	// Here's what you need. Ornament.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other, " DIA_Addon_Saturas_Ornament_ADD_14_00 " );	// For the sake of the essence of everything, what is this all supposed to mean?
	if (Lares_arrived ==  TRUE )
	{
		AI_Output(self,other, " DIA_Addon_Saturas_Ornament_14_01 " );	// Who gave you this? Don't tell me Lares just handed it to you.
	};
	AI_Output(other,self, " DIA_Addon_Saturas_Ornament_15_02 " );	// Well, that's enough already, old man. I brought it to you, what more?
	AI_Output(self,other, " DIA_Addon_Saturas_Ornament_14_03 " );	// Of course. I'm just worried that you've put your mean hands on this again.
	AI_Output(other,self, " DIA_Addon_Saturas_Ornament_15_04 " );	// Why are you still fuming over that ore?
	AI_Output(other,self, " DIA_Addon_Saturas_Ornament_15_05 " );	// I was already working for you then. You could rely on me.
	AI_Output(self,other, " DIA_Addon_Saturas_Ornament_14_06 " );	// And what did this lead us to, answer? ... (sighs) Don't even think that I trust you!
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;
	Wld_InsertNpc(Bloodfly,"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Black,"NW_CITY_TO_FARM2_02");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
};

instance DIA_Saturated_Addon (C_Info);
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_HowYouHere_Condition;
	information = DIA_Addon_Saturated_HowYouHere_Info;
	description = " How did you get here? " ;
};

func int DIA_Addon_Saturation_HowYouHere_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturities_HowYouHere_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_HowYouHere_01_00 " );	// How did you get here?
	AI_Output(self,other, " DIA_Addon_Saturas_HowYouHere_01_01 " );	// After the fall of the Barrier, we had to stay a little longer at the New Camp.
	AI_Output(other, self, " DIA_Addon_Saturas_HowYouHere_01_02 " );	// Why?
	AI_Output(self,other, " DIA_Addon_Saturas_HowYouHere_01_03 " );	// We had to take a lot of valuables with us. Mostly our work and knowledge accumulated over the years spent beyond the Barrier.
	AI_Output(self,other, " DIA_Addon_Saturas_HowYouHere_01_04 " );	// True, we still had to leave some of them there until better times.
	AI_Output(other,self, " DIA_Addon_Saturas_HowYouHere_01_05 " );	// And what happened next?
	AI_Output(self,other, " DIA_Addon_Saturas_HowYouHere_01_06 " );	// By the time we got to Khorinis, the panic had almost spread throughout this part of the island. Many even believed then that the convicts would take the city by storm.
	AI_Output(self,other, " DIA_Addon_Saturas_HowYouHere_01_07 " );	// But their fears were unfounded. With the arrival of the paladins in Khorinis, the situation has completely stabilized, and nothing threatens the city itself anymore.
	AI_Output(self,other, " DIA_Addon_Saturas_HowYouHere_01_08 " );	// Vatras, the only Waterbender in this part of the island, welcomed us warmly, providing us with everything we needed.
	AI_Output(self,other, " DIA_Addon_Saturas_HowYouHere_01_09 " );	// And then we decided to go here in order to study the remains of an ancient civilization, which, according to Vatras, worshiped Adanos himself.
	AI_Output(self,other, " DIA_Addon_Saturas_HowYouHere_01_10 " );	// Now it's up to us to unravel the mysteries that lie within these ancient halls.
};

instance DIA_Addon_Saturas_geheimbund (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_geheimbund_Condition;
	information = DIA_Addon_Saturas_geheimbund_Info;
	description = " I wish to become a member of the 'Ring of Water'. " ;
};


func int DIA_Addon_Saturas_geheimbund_Condition()
{
	if ((MY_Addon_Ornament2Saturations ==  LOG_SUCCESS ) && (SC_KnowsRanger ==  TRUE ) && (SC_IsRanger ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_geheimbund_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_geheimbund_15_00 " );	// I wish to become a member of the 'Ring of Water'.
	if (Lares_arrived ==  TRUE )
	{
		AI_Output(self,other, " DIA_Addon_Saturas_geheimbund_14_01 " );	// (violently) WHAT? How did you know about it? Who?.. LARES... I'll kill him!
		AI_Output(self,other, " DIA_Addon_Saturas_geheimbund_14_02 " );	// He broke our main rule. It is forbidden to talk about the Ring of Water!
	};
	AI_Output(self,other, " DIA_Addon_Saturas_geheimbund_14_03 " );	// (completely broken) I don't know what I should say. I just trust you as long as I have you in front of me.
	AI_Output(other,self, " DIA_Addon_Saturas_geheimbund_15_04 " );	// Vatras told me about the Ring.
	AI_Output(self,other, " DIA_Addon_Saturas_geheimbund_14_05 " );	// (humbly) What? Vatras? (sarcastically) Great! Of all the waterbenders on the island, the one you meet is the one who DOES NOT KNOW you.
	AI_Output(self,other, " DIA_Addon_Saturas_geheimbund_14_06 " );	// Warning, don't be stupid this time.
	AI_Output(other,self, " DIA_Addon_Saturas_geheimbund_15_07 " );	// (dryly) I'll try...
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater, " Saturas is not ready to accept me into the Ring of Water. He said Vatras should make the decision. " );
};


instance DIA_Addon_Saturas_wasmachstdu(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_wasmachstdu_Condition;
	information = DIA_Addon_Saturas_wasmachstdu_Info;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Saturas_wasmachstdu_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturas_wasmachstdu_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_wasmachstdu_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Saturas_wasmachstdu_14_01 " );	// These chambers hold ancient secrets. Mysterious secrets.
	AI_Output(self,other, " DIA_Addon_Saturas_wasmachstdu_14_02 " );	// The inscriptions and frescoes show that this is a very ancient culture.
	AI_Output(self,other, " DIA_Addon_Saturas_wasmachstdu_14_03 " );	// All the inscriptions that you see are made in a completely unknown language.
	AI_Output(self,other, " DIA_Addon_Saturas_wasmachstdu_14_04 " );	// We are just beginning to study it and have deciphered only a small part.
};


instance DIA_Addon_Saturas_Erdbeben (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 6;
	condition = DIA_Addon_Saturas_Erdbeben_Condition;
	information = DIA_Addon_Saturas_Erdbeben_Info;
	description = " What are these strange tremors? " ;
};


func int DIA_Addon_Saturas_Erdbeben_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas ==  LOG_SUCCESS ) && Npc_KnowsInfo(other,DIA_Addon_Saturas_wasmachstdu) && Npc_KnowsInfo(other,DIA_Addon_Merdarion_Bedrohung));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturas_Erdbeben_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_Erdbeben_15_00 " );	// What are these strange tremors?
	AI_Output(self,other, " DIA_Addon_Saturas_Erdbeben_14_01 " );	// This is one of the mysteries I'm trying to solve myself.
	AI_Output(self,other, " DIA_Addon_Saturas_Erdbeben_14_02 " );	// Something is disturbing the structure of magic somewhere under these mountains.
	AI_Output(self,other, " DIA_Addon_Saturas_Erdbeben_14_03 " );	// Obviously, someone is trying with all their might to destroy the mighty magic.
	AI_Output(self,other, " DIA_Addon_Saturas_Erdbeben_14_04 " );	// I'm afraid this will happen before the whole island shakes from these tremors.
};


instance DIA_Addon_Saturas_WhatsOrnament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_WhatsOrnament_Condition;
	information = DIA_Addon_Saturas_WhatsOrnament_Info;
	description = " Why is this ornament so important to you? " ;
};


func int DIA_Addon_Saturas_WhatsOrnament_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsOrnament == FALSE) && (RitualRingRuns == 0))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturas_WhatsOrnament_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_WhatsOrnament_15_00 " );	// Why is this ornament so important to you?
	AI_Output(self,other, " DIA_Addon_Saturas_WhatsOrnament_14_01 " );	// This is the key to the portal.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//Больше я ничего тебе не скажу.
};


instance DIA_Addon_Saturas_ScRanger(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_ScRanger_Condition;
	information = DIA_Addon_Saturas_ScRanger_Info;
	permanent = TRUE;
	description = "Теперь я принадлежу к 'Кольцу Воды'.";
};


func int DIA_Addon_Saturas_ScRanger_Condition()
{
	if (( SaturasKnows_SC_IsRanger ==  FALSE ) && ( SC_IsRanger ==  TRUE ) && ( other . guild !=  GIL_NDW ) && ( other . guild !=  GIL_KDW ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ScRanger_Info()
{
	var C_Item itm;
	AI_Output(other,self, " DIA_Addon_Saturas_ScRanger_15_00 " );	// I now belong to the 'Ring of Water'.
	itm = Npc_GetEquippedArmor(other);
	if (((SCIsWearingRangerRing ==  TRUE ) && (RangerRingIsLaresRing ==  FALSE )) || (Hlp_IsItem(itm,ITAR_RANGER_Addon) ==  TRUE ) || (Hlp_IsItem(itm,itar_ranger_addon_v1) ==  TRUE ) || ( Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE ) itar_ranger_addon_v2) ==  TRUE ) || (Hlp_IsItem(itm,itar_ranger_addon_v3) ==  TRUE ) || (Hlp_IsItem(itm,itar_ranger_addon_v4) ==  TRUE ) || (Hlp_IsItem(itm,itar_ranger_addon_v5) == TRUE))
	{
		if ((Hlp_IsItem(itm,ITAR_RANGER_Addon) ==  TRUE ) || (Hlp_IsItem(itm,itar_ranger_addon_v1) ==  TRUE ) || (Hlp_IsItem(itm,itar_ranger_addon_v2) ==  TRUE ) || ( Hlp_IsItem(itm,itar_ranger_addon_v3) == TRUE )  TRUE ) || (Hlp_IsItem(itm,itar_ranger_addon_v4) ==  TRUE ) || (Hlp_IsItem(itm,itar_ranger_addon_v5) ==  TRUE ))
		{
			AI_Output(self,other, " DIA_Addon_Saturas_ScRanger_14_01 " );	// I see you wearing the armor of our children.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Saturas_ScRanger_14_02 " );	// I see you are wearing our secret sign. Aquamarine ring.
		};
		AI_Output(self,other, " DIA_Addon_Saturas_ScRanger_14_03 " );	// I can also see in your eyes that you're telling the truth.
		AI_Output(self,other, " DIA_Addon_Saturas_ScRanger_14_04 " );	// (mumbling) Good. I will accept you into our ranks.
		AI_Output(self,other, " DIA_Addon_Saturas_ScRanger_14_05 " );	// But remember that this puts a lot of responsibility on you.
		AI_Output(self,other, " DIA_Addon_Saturas_ScRanger_14_06 " );	// And I hope you do justice. For your own good.
		SaturasKnows_SC_IsRanger = TRUE;
		B_LogEntry(TOPIC_Addon_RingOfWater, " Saturas agreed to my entry into the 'Ring of Water'. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Saturas_ScRanger_14_07 " );	// How can I tell you're one of us now?
		if(RangerRingIsLaresRing == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_Saturas_ScRanger_14_08 " );	// The aquamarine ring you're wearing belongs to Lares. I see.
		};
		AI_Output(self,other, " DIA_Addon_Saturas_ScRanger_14_09 " );	// Are you trying to trick me? I didn't expect anything else.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Saturated_OpenPortal (C_Info) .
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_OpenPortal_Condition;
	information = DIA_Addon_Saturas_OpenPortal_Info;
	permanent = TRUE;
	description = " Give me the ring! I'll open a portal. " ;
};

func int DIA_Addon_Saturates_OpenPortal_Condition();
{
	if ((RitualRingRuns ==  LOG_SUCCESS ) && (DAY_Addon_Saturates_OpenPortal_NoPerm ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturates_OpenPortal_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_OpenPortal_15_00 " );	// Give me the ring! I will open a portal.
	if((SaturasKnows_SC_IsRanger == TRUE) || (other.guild == GIL_NDW) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened))
	{
		AI_Output(self,other, " DIA_Addon_Saturas_OpenPortal_14_01 " );	// Good! As one of our new children, you should be given this honor.
		AI_Output(self,other, " DIA_Addon_Saturas_OpenPortal_14_02 " );	// However, I still await word from Vatras. We're not going anywhere until we wait for them.
		if(Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened))
		{
			AI_Output(other,self, " DIA_Addon_Saturas_OpenPortal_15_03 " );	// I have a message for you from Vatras.
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven));
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven_opened,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened));
			B_UseFakeScroll();
			if(Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output(self,other, " DIA_Addon_Saturas_OpenPortal_14_04 " );	// I see! And, of course, you could not resist and surely opened it?
				AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//Ну...
				AI_Output(self,other, " DIA_Addon_Saturas_OpenPortal_14_06 " );	// I hope... (terribly) My already fragile trust in you will not be completely shaken! For your own good.
			}
			else
			{
				AI_Output(self,other, " DIA_Addon_Saturas_OpenPortal_14_07 " );	// (surprised) Interesting. Good.
				B_GivePlayerXP(XP_Ambient);
			};
			AI_Output(self,other, " DIA_Addon_Saturas_OpenPortal_14_08 " );	// Here, take the ring! We'll meet at the portal and wait for you.
			CreateInvItems(self,ItMi_PortalRing_Addon,1);
			B_GiveInvItems(self,other,ItMi_PortalRing_Addon,1);
			AI_Output(self,other, " DIA_Addon_Saturas_OpenPortal_14_09 " );	// If Nefarius is correct, the portal will open as soon as the ring is inserted into it.
			DIA_Addon_Saturates_OpenPortal_NoPerm = TRUE ;
			B_LogEntry(TOPIC_Addon_Ornament,"Сатурас дал мне украшенное кольцо. Я должен открыть портал, вставив кольцо в механизм, а затем пройти через портал.");
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OpenPortal");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			if(SATURASWAITSVATRASMESSAGE != TRUE)
			{
				SATURASWAITSVATRASMESSAGE = TRUE;
				B_LogEntry(TOPIC_Addon_KDW,"Стаурас ждет вестей от Ватраса. Мне необходимо отправиться в Хоринис и поговорить с ним.");
			};
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//Пока Ватрас не дал мне знать, что тебе можно доверять полностью, кольцо побудет у меня.
		if(Saturas_WillVertrauensBeweis == FALSE)
		{
			Saturas_WillVertrauensBeweis = TRUE;
			SATURASWAITSVATRASMESSAGE = TRUE;
			B_LogEntry(TOPIC_Addon_Ornament,"Сатурас не хочет давать мне кольцо с орнаментом, пока он не получит знак от Ватраса, что мне можно доверять.");
		};
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Saturas_PERM(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 99;
	condition = DIA_Addon_Saturas_PERM_Condition;
	information = DIA_Addon_Saturas_PERM_Info;
	permanent = FALSE;
	description = "Ты можешь немного поучить меня магии?";
};

func int DIA_Addon_Saturas_PERM_Condition()
{
	if((MIS_Addon_Saturas_BringRiordian2Me != 0) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PERM_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_PERM_15_00 " );	// Can you teach me some magic?
	AI_Output(self,other, " DIA_Addon_Saturas_PERM_14_01 " );	// To make you do things again?!
	AI_Output(self,other, " DIA_Addon_Saturas_PERM_14_02 " );	// No! I don't have time to play games.
};


instance DIA_ADDON_SATURA_HOWCANBEKDW (C_Info) .
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = dia_addon_saturas_howcanbekdw_condition;
	information = dia_addon_saturas_howcanbekdw_info;
	permanent = FALSE;
	description = " Can I become a Waterbender? " ;
};

func int dia_addon_saturas_howcanbekdw_condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_howcanbekdw_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_HowCanBeKDW_15_00 " );	// Can I become a Waterbender?
	AI_Output(self,other, " DIA_Addon_Saturas_HowCanBeKDW_15_01 " );	// What makes you think this is possible?

	if(VATRASSAYABOUTKDW == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Saturas_HowCanBeKDW_15_02 " );	// Vatras told me about it.
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Saturas_HowCanBeKDW_15_03 " );	// I was just wondering.
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Addon_Saturas_HowCanBeKDW_15_05 " );	// Hmmm. We do sometimes make exceptions...
		AI_Output(self,other, " DIA_Addon_Saturas_HowCanBeKDW_15_06 " );	// But for this, your actions must be VERY convincing.
		AI_Output(self,other, " DIA_Addon_Saturas_HowCanBeKDW_15_07 " );	// We'll talk about this later if you can really surprise me.
		if(VATRASSAYABOUTKDW == FALSE)
		{
			MIS_BECOMEKDW = LOG_Running;
			Log_CreateTopic(TOPIC_BECOMEKDW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_Running);
			B_LogEntry( TOPIC_BECOMEKDW , " Saturas will accept me as a Waterbender if I can convince him that I am worthy. " );
		}
		else
		{
			B_LogEntry( TOPIC_BECOMEKDW , " Saturas wants to make sure I'm worthy of becoming a Waterbender. I need to prove it with deeds. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Saturas_HowCanBeKDW_15_04 " );	// In any case, you've already made your choice. Therefore, follow the path that you have chosen - the path of the Waterbender is not for you.
		if(MIS_BECOMEKDW == LOG_Running)
		{
			MIS_BECOMEKDW = LOG_FAILED;
		};
	};
};

instance DIA_ADDON_SATURA_CANBEKDW (C_Info) .
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = dia_addon_saturas_canbekdw_condition;
	information = dia_addon_saturas_canbekdw_info;
	permanent = TRUE;
	description = " About the intro... " ;
};

func int dia_addon_saturas_canbekdw_condition()
{
	if ( Npc_KnowsInfo ( other , dia_addon_saturas_howcanknow ) && ( other . guild ==  GIL_NONE ) && ( MY_BECOME_DW  == LOG_Running ) && ( SATURASTELLWISHJOIN  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_saturas_canbekdw_info()
{
	var int countsaturas;
	countsaturas = 0;
	AI_Output(other,self, " DIA_Addon_Saturas_CanBeKDW_15_00 " );	// About the intro...
	AI_Output(self,other, " DIA_Addon_Saturas_CanBeKDW_15_01 " );	// Yes? I am listening you.
	AI_Output(other,self, " DIA_Addon_Saturas_CanBeKDW_15_02 " );	// Can I join the Circle of Waterbenders now?
	AI_Output(self,other, " DIA_Addon_Saturas_CanBeKDW_15_03 " );	// Give me at least a few reasons why I should accept you into our ranks?
	if ((MIS_Vatras_FindTheBanditTrader ==  LOG_SUCCESS ) || (MIS_Addon_Nefarius_BringMissingOrnaments ==  LOG_SUCCESS ))
	{
		if(MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_06");	//Я помог Мартину найти торговца, который продавал оружие бандитам.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_07");	//Неплохо. Я думаю, что ты на правильном пути.
			countsaturas = countsaturas + 1;
		};
		if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_08");	//Я принес Нефариусу все недостающие части орнамента для портала.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_09");	//Это так! Ты действительно оказал нам неоценимую услугу. Маги Воды очень благодарны тебе!
			countsaturas = countsaturas + 1;
		};
		if(countsaturas == 2)
		{
			B_GivePlayerXP(150);
			B_LogEntry(TOPIC_BECOMEKDW,"Сатурас считает, что я достоин носить одеяние послушника Воды. Теперь выбор за мной.");
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKdw_15_10");	//Этого достаточно?
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_11");	//Безусловно, ты доказал, что достоин того, чтобы присоединиться к нам. Твои деяния и твои поступки говорят сами за себя.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_12");	//Однако...
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_14");	//Стать магом Воды - как великий дар, так и большая ответственность! Только избранные Аданоса удостаиваются этой чести.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_15");	//Лишь тот, кто готов всецело и безраздельно следовать священному пути Аданоса может рассчитывать на посвящение в маги Воды.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_16");	//Стать магом Воды - это не просто овладеть той силой и знаниями, что дарует нам Аданос. Это намного больше...
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_17");	//...больше для тех, чье служение Аданосу - это знак, это судьба!
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_18");	//Поэтому не проси меня сейчас посвятить тебя в маги Воды. Ты еще не готов для этого.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_20");	//Я могу принять тебя только в послушники нашего ордена. Но этим самым ты сможешь начать свой путь в качестве слуги Аданоса.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_23");	//И запомни: если ты решишь посвятить свою жизнь служению Аданосу, то уже не сможешь просто так отказаться от этого выбора.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_24");	//Поэтому подумай хорошенько, прежде чем дать мне окончательный ответ.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_25");	//Итак, сын мой, готов ли ты принять обет послушника Воды?
			SATURASTELLWISHJOIN = TRUE;
			Info_ClearChoices(dia_addon_saturas_canbekdw);
			Info_AddChoice(dia_addon_saturas_canbekdw,"Я еще подумаю над этим.",dia_addon_saturas_canbekdw_no);
			Info_AddChoice(dia_addon_saturas_canbekdw,"Да, я хочу посвятить свою жизнь служению Аданосу!",dia_addon_saturas_canbekdw_yes);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_26");	//Этого достаточно?
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_27");	//Своими поступками ты неплохо зарекомендовал себя, но, к сожалению, этого недостаточно.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_29");	//Я должен быть полностью уверен в том, что не совершаю ошибку, принимая тебя в наши ряды.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_30");	//Возращайся позже, когда твои причины будут более убедительными.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_32");	//Боюсь, что мне нечего тебе сказать.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_33");	//Тогда не трать понапрасну мое время!
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_34");	//Лучше иди и займись чем-нибудь полезным.
	};
};

func void dia_addon_saturas_canbekdw_yes()
{
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKdw_Yes_01_00");	//Да, я хочу посвятить свою жизнь служению Аданосу!
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_01");	//Тогда добро пожаловать. С благословления Аданоса я принимаю тебя в ряды последователей его священного пути.
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_02");	//Теперь ты послушник. Носи эту одежду в знак того, что ты теперь принадлежишь к нашей общине.
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_03");	//Благослови Аданос этого мужчину, который отдает свою жизнь тебе в услужение и освободи его от грехов!

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_NDW;
	CheckHeroGuild[0] = TRUE;
	Snd_Play("LEVELUP");
	B_GiveInvItems(self,other,itar_ndw_l,1);
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_04");	//Твердо следуй выбранному тобой пути, и пусть мудрость Аданоса никогда не покидает тебя!
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_SUCCESS;

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_SUCCESS);
	B_GivePlayerXP(500);
	B_LogEntry(TOPIC_BECOMEKDW,"Теперь, я послушник Магов Воды.");
	Info_ClearChoices(dia_addon_saturas_canbekdw);
};

func void dia_addon_saturas_canbekdw_no()
{
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKdw_No_01_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_No_01_01");	//Тогда приходи, когда будешь готов. Да пребудет с тобой Аданос, сын мой!
	Info_ClearChoices(dia_addon_saturas_canbekdw);
};


instance DIA_ADDON_SATURAS_JOINWATERMAGE(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_joinwatermage_condition;
	information = dia_addon_saturas_joinwatermage_info;
	permanent = TRUE;
	description = "Я хочу стать послушником магов Воды.";
};


func int dia_addon_saturas_joinwatermage_condition()
{
	if((hero.guild == GIL_NONE) && (SATURASTELLWISHJOIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_joinwatermage_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_JoinWaterMage_01_01");	//Я хочу стать послушником магов Воды.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_01_02");	//Это действительно твое желание? Помни, что обратного пути у тебя нет.
	Info_ClearChoices(dia_addon_saturas_joinwatermage);
	Info_AddChoice(dia_addon_saturas_joinwatermage,"Я подумаю над этим.",dia_addon_saturas_joinwatermage_no);
	Info_AddChoice(dia_addon_saturas_joinwatermage,"Да, я хочу посвятить свою жизнь служению Аданосу.",dia_addon_saturas_joinwatermage_yes);
};

func void dia_addon_saturas_joinwatermage_yes()
{
	AI_Output(other,self,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_00");	//Да, я хочу посвятить свою жизнь служению Аданосу.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_01");	//Тогда добро пожаловать. С благословения Аданоса я принимаю тебя в ряды последователей его священного пути.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_02");	//Теперь ты послушник. Носи эту одежду в знак того, что ты теперь принадлежишь к нашей общине.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_03");	//Благослови Аданос этого мужчину, который отдает свою жизнь тебе в услужение и освободи его от грехов!

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_NDW;
	CheckHeroGuild[0] = TRUE;
	Snd_Play("LEVELUP");
	B_GiveInvItems(self,other,itar_ndw_l,1);
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_04");	//Твердо следуй выбранному тобой пути, и пусть мудрость Аданоса никогда не покидает тебя!
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_SUCCESS;

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_SUCCESS);
	B_GivePlayerXP(500);
	B_LogEntry(TOPIC_BECOMEKDW,"Теперь, я послушник Магов Воды.");
	Info_ClearChoices(dia_addon_saturas_joinwatermage);
};

func void dia_addon_saturas_joinwatermage_no()
{
	AI_Output(other,self, " DIA_Addon_Saturas_JoinWaterMage_No_01_00 " );	// I'll think about it.
	AI_Output(self,other, " DIA_Addon_Saturas_JoinWaterMage_No_01_01 " );	// Then come back when you're ready. May Adanos be with you, my son!
	Info_ClearChoices(dia_addon_saturas_joinwatermage);
};

instance DIA_Addon_Saturas_PowerMagic(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_PowerMagic_Condition;
	information = DIA_Addon_Saturas_PowerMagic_Info;
	description = " Tell me about water magic. " ;
};

func int DIA_Addon_Saturas_PowerMagic_Condition()
{
	if(hero.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PowerMagic_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_PowerMagic_01_00 " );	// Tell me about Waterbending.
	AI_Output(self,other, " DIA_Addon_Saturas_PowerMagic_01_01 " );	// Unlike other schools of magic, ours is based on the application of various properties of water and its manifestations.
	AI_Output(self,other, " DIA_Addon_Saturas_PowerMagic_01_02 " );	// In addition, we partially use the magical energy contained in nature.
	AI_Output(self,other, " DIA_Addon_Saturas_PowerMagic_01_03 " );	// Therefore, our magic has a number of advantages over other magical schools, because with its help you can sometimes defeat even the most powerful enemies.
};

instance DIA_ADDON_SATURAS_FirstRune (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = DIA_ADDON_SATURAS_FirstRune_condition;
	information = DIA_ADDON_SATURAS_FirstRune_info;
	permanent = FALSE;
	description = " Can I learn your magic? " ;
};

func int DIA_ADDON_SATURAS_FirstRune_condition()
{
	if(hero.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void DIA_ADDON_SATURAS_FirstRune_info()
{
	AI_Output(other,self, " DIA_ADDON_SATURAS_FirstRune_01_01 " );	// Will I be able to learn your magic?
	AI_Output(self,other, " DIA_ADDON_SATURAS_FirstRune_01_02 " );	// The magic of our Circle is available only to mages. Why are you asking about this?
	AI_Output(other,self, " DIA_ADDON_SATURAS_FirstRune_01_03 " );	// There are a lot of dangerous monsters and bandits around now. I won't be able to defend myself if they attack.
	AI_Output(self,other, " DIA_ADDON_SATURAS_FirstRune_01_04 " );	// You know, there is some truth in what you say.
	AI_Output(self,other, " DIA_ADDON_SATURAS_FirstRune_01_05 " );	// Usually Waterbenders never share their knowledge with the uninitiated.
	AI_Output(self,other, " DIA_ADDON_SATURAS_FirstRune_01_06 " );	// However, given that you helped us in the Valley of Mines and have already done well here, I'll make an exception.
	AI_Output(self,other, " DIA_ADDON_SATURAS_FirstRune_01_07 " );	// Here, take this rune. It will help you protect yourself in case of danger.
	B_GiveInvItems(self,other,ItRu_Zap,1);
	AI_Output(self,other, " DIA_ADDON_SATURAS_FirstRune_01_08 " );	// True, to use it, you must be initiated into the first Circle of Magic.
	AI_Output(self,other, " DIA_ADDON_SATURAS_FirstRune_01_09 " );	// Unfortunately, I can't teach you this, as I would break the rules of our order.
	AI_Output(self,other, " DIA_ADDON_SATURAS_FirstRune_01_10 " );	// So you'll have to solve this problem yourself.
};

instance DIA_ADDON_SATURAS_MEETHAGEN(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_meethagen_condition;
	information = dia_addon_saturas_meethagen_info;
	permanent = FALSE;
	description = " I have a problem. " ;
};

func int dia_addon_saturas_meethagen_condition()
{
	if(other.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_meethagen_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_MeetHagen_01_01 " );	// I have a problem.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_02 " );	// What do you want, novice?
	AI_Output(other,self, " DIA_Addon_Saturas_MeetHagen_01_03 " );	// I need to urgently get an appointment with the head of the paladins, Lord Hagen.
	AI_Output(other,self, " DIA_Addon_Saturas_MeetHagen_01_05 " );	// I have a very important message for him!
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_09 " );	// It's unlikely that paladins will just let you through to him.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_12 " );	// But I have one idea.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_14 " );	// As you already know, we recently discovered a portal leading to a hitherto unknown part of the island.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_15 " );	// And sooner or later we'll probably find a way to open it.
	AI_Output(other,self, " DIA_Addon_Saturas_MeetHagen_01_16 " );	// And how does this relate to my problem?
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_18 " );	// Once we solve the mystery of this mysterious portal, we plan to proceed inside it.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_19 " );	// We have no idea what awaits us there.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_22 " );	// By leaving this place, we will leave this portal unattended. Which, in my opinion, cannot be allowed!
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_23 " );	// This is where Lord Hagen's paladins would certainly come in handy.
	AI_Output(other,self, " DIA_Addon_Saturas_MeetHagen_01_24 " );	// What are you thinking?
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_25 " );	// I'll send a message to Lord Hagen asking him to keep the portal safe in our absence.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_26 " );	// I think Lord Hagen is unlikely to refuse us this request. But that's not the point.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_27 " );	// The main thing is that it is you who will carry this message to him.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_33 " );	// Wait a minute...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_34 " );	// Mmm... I think that's enough. Here, take the letter.
	B_GiveInvItems(self,other,itwr_watermageletter,1);
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_35 " );	// Don't you dare open or read it, novice!
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_36 " );	// Now go to Lord Hagen.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagen_01_38 " );	// May Adanos be with you, my son!
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_CITY_TO_FOREST_04_05_4");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_CITY_TO_FOREST_04_05_7");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_CITY_TO_FOREST_04_05_8");
	MIS_WATERMAGELETTER = LOG_Running;
	Log_CreateTopic(TOPIC_WATERMAGELETTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WATERMAGELETTER,LOG_Running);
	B_LogEntry( TOPIC_WATERMAGELETTER , " Saturas gave me a letter to take to the paladins in Khorinis. Now I can definitely get to the town hall and meet Lord Hagen. " );
};

instance DIA_ADDON_SATURAS_MEETHAGENOK(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_meethagenok_condition;
	information = dia_addon_saturas_meethagenok_info;
	permanent = FALSE;
	description = " I delivered the letter to Lord Hagen. " ;
};

func int dia_addon_saturas_meethagenok_condition()
{
	if(HAGENTAKELETTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_meethagenok_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Addon_Saturas_MeetHagenOk_01_01 " );	// I gave the letter to Lord Hagen.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagenOk_01_02 " );	// And what did Lord Hagen say?
	AI_Output(other,self, " DIA_Addon_Saturas_MeetHagenOk_01_03 " );	// He will send some paladins to guard the portal.
	AI_Output(self,other, " DIA_Addon_Saturas_MeetHagenOk_01_04 " );	// Good! Now I can not worry about the safety of the portal.
	Wld_InsertNpc(pal_188_ritter,"NW_GUARDPORTAL_01");
	Wld_InsertNpc(pal_189_ritter,"NW_GUARDPORTAL_02");
	MIS_WATERMAGELETTER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WATERMAGELETTER,LOG_SUCCESS);
};


instance DIA_ADDON_SATURAS_PRAYFORGOMEZ (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_prayforgomez_condition;
	information = dia_addon_saturas_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_saturas_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_prayforgomez_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Saturas_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Saturas_PrayForGomez_01_02 " );	// (surprised) Do you need Water's blessing? What for?
	AI_Output(other,self, " DIA_Addon_Saturas_PrayForGomez_01_04 " );	// It's not for me, but for one restless soul.
	AI_Output(self,other, " DIA_Addon_Saturas_PrayForGomez_01_07 " );	// It seems that during his lifetime that person did a lot of bad things, since it happened.
	AI_Output(other,self, " DIA_Addon_Saturas_PrayForGomez_01_08 " );	// Quite a lot. However, the blessing of Adanos will help to forgive this sinful soul.
	AI_Output(self,other, " DIA_Addon_Saturas_PrayForGomez_01_09 " );	// And whose soul is this?
	AI_Output(other,self, " DIA_Addon_Saturas_PrayForGomez_01_10 " );	// This is the soul of former ore baron Gomez.
	AI_Output(self,other, " DIA_Addon_Saturas_PrayForGomez_01_11 " );	// GOMEZA?! This murderer and executioner?
	AI_Output(self,other, " DIA_Addon_Saturas_PrayForGomez_01_12 " );	// (besides himself) How dare you even ask me SUCH a request?!
	AI_Output(self,other, " DIA_Addon_Saturas_PrayForGomez_01_14 " );	// That bastard deserved his fate!
	AI_Output(self,other, " DIA_Addon_Saturas_PrayForGomez_01_18 " );	// So you're wasting your time.
	B_LogEntry( TOPIC_RESCUEGOMEZ , " Saturas and the other Waterbenders refused to help me. " );
	SATURASREFUSEHELPGOMEZ = TRUE;
};


instance DIA_ADDON_SATURAS_UNITOR (C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_unitor_condition;
	information = dia_addon_saturas_unitor_info;
	permanent = FALSE;
	description = " I need another unit. " ;
};


func int dia_addon_saturas_unitor_condition()
{
	if((HOWCANMAKERUNE == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_unitor_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Saturas_Unitor_01_01 " );	// I need another unit.
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_02 " );	// Sorry, but we already used all the units we had.
	AI_Output(other,self, " DIA_Addon_Saturas_Unitor_01_03 " );	// Then maybe you know where I can find another one?
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_04 " );	// I'm afraid that's not possible. Those magic stones were created specifically so that we could then focus all our energy and build a Barrier.
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_05 " );	// And when the Barrier was created, there were six of them. Yes exactly. Xardas was the thirteenth mage - the focus of our magical powers. We, the twelve others, split into pairs. That is, there were six pairs in total.
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_07 " );	// At that moment I was working with a uniter on top of a cliff overlooking the future Swamp Camp. And Nefarius stood a little behind and made sure that my vitality was not undermined by the power of the accumulated energy.
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_08 " );	// If something happened to me, he would continue working with the stone.
	AI_Output(other,self, " DIA_Addon_Saturas_Unitor_01_09 " );	// Nobody ever told me about this. And where is this sixth unit now?
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_10 " );	// Hmm. I can't even tell where this sixth position was located. As far as I remember, on the map I gave you as a guide, there were five points. They formed a pentagram.
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_11 " );	// But there was a sixth stone, and Corristo loaded it. I remembered. After the ritual, he came to the castle without a partner, who mysteriously disappeared.
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_12 " );	// Later, Corristo took Milten as his apprentice, and many who arrived after mistakenly considered him one of the creators of the dome.
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_13 " );	// The whole mystery of this story and the fact that the sixth position, the sixth stone and all the data about Corristo's partner were erased from the documents we have left make me think that Xardas was involved here.
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_14 " );	// Yes. He has the sixth unit!
 	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_15 " ); // And you can try to visit his old tower in the Valley of Mines.
	AI_Output(self,other, " DIA_Addon_Saturas_Unitor_01_16 " );	// There's a chance Xardas left the unit there.
	B_LogEntry( TOPIC_GUARDIANS , " According to Saturas, there were six focusstones in total, and Xardas may have had the last of them, since he was also involved in the construction of the Barrier. Saturas advised me to look in the old necromancer's tower in the Valley of Mines. " );
};


instance DIA_ADDON_SATURAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_runemagicnotwork_condition;
	information = dia_addon_saturas_runemagicnotwork_info;
	permanent = FALSE;
	description = " Can you still use your rune magic? " ;
};


func int dia_addon_saturas_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Saturas_RuneMagicNotWork_01_00 " );	// Can you still use your rune magic?
	AI_Output(self,other, " DIA_Addon_Saturas_RuneMagicNotWork_01_01 " );	// (angrily) You wouldn't ask that out of curiosity! You know about it! And you ask to...
	AI_Output(self,other, " DIA_Addon_Saturas_RuneMagicNotWork_01_02 " );	// ...make fun of me, huh?! Gloat?! You look with the same shameless eyes that you looked after stealing the energy from our ore!
	AI_Output(self,other, " DIA_Addon_Saturas_RuneMagicNotWork_01_03 " );	// Oh... sorry. Yes, the runes failed. We have never encountered this before. Well, what now? We will look for ways out of this situation.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " It seems the Waterbenders have also lost their ability to use rune magic. " );
	WATERMAGERUNESNOT = TRUE;
};

instance DIA_ADDON_SATURAS_WaterMageDocumentsDone(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = DIA_ADDON_SATURAS_WaterMageDocumentsDone_condition;
	information = DIA_ADDON_SATURAS_WaterMageDocumentsDone_info;
	permanent = FALSE;
	description = " It looks like it belongs to you. " ;
};

func int DIA_ADDON_SATURAS_WaterMageDocumentsDone_condition()
{
	if((MIS_WaterMageDocuments == LOG_Running) && (Npc_HasItems(hero,ItWr_WaterMageDoc) >= 1))
	{
		return TRUE;
	};
};

func void DIA_ADDON_SATURAS_WaterMageDocumentsDone_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_01 " );	// Looks like it belongs to you.
	B_GiveInvItems(other,self,ItWr_WaterMageDoc,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_02 " );	// (surprised) Quite unexpectedly, Lee gave you this task.
	AI_Output(other,self, " DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_03 " );	// Does it really matter who brought you these notes?
	AI_Output(self,other, " DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_04 " );	// No, I just expected him to send a large force of mercenaries to the Valley of Mines.
	AI_Output(self,other, " DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_05 " );	// And you, it turns out, coped with this alone.
	AI_Output(other,self, " DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_06 " );	// Does that surprise you?
	AI_Output(self,other, " DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_07 " );	// Not much. But in any case, we are all very grateful to you for your help.
	AI_Output(self,other, " DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_08 " );	// I think you'll find a worthy use for these scrolls.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_IceWave,2);
	CreateInvItems(other,ItSc_LightningFlash,1);
	AI_Output(other,self, " DIA_ADDON_SATURA_WaterMageDocumentsDone_01_09 " );	// Благодарю.
	MIS_WaterMageDocuments = LOG_Success;
	Log_SetTopicStatus(TOPIC_WaterMageDocuments,LOG_Success);
	B_LogEntry(TOPIC_WaterMageDocuments, " I brought back to Saturas the records of the Waterbenders they left in the Valley of Mines. " );	
};
