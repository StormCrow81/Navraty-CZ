

instance DIA_PAL_9160_ORTO_EXIT(C_Info)
{
	npc = pal_9160_orto;
	nr = 999;
	condition = dia_pal_9160_orto_exit_condition;
	information = dia_pal_9160_orto_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9160_orto_exit_condition()
{
	return TRUE;
};

func void dia_pal_9160_orto_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_PAL_9160_ORTO_MATTER (C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_matter_condition;
	information = dia_pal_9160_orto_matter_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9160_orto_matter_condition()
{
	return TRUE;
};

func void dia_pal_9160_orto_matter_info()
{
	AI_Output(self,other, " DIA_Pal_9160_Orto_Matter_01_00 " );	// Hey man! Where did you come from?
	AI_Output(other,self, " DIA_Pal_9160_Orto_Matter_01_01 " );	// I passed through the mountain pass. What surprises you?

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Pal_9160_Orto_Matter_01_02 " );	// Of course! It's not often you see a new face here - especially a mercenary... (with contempt)
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Pal_9160_Orto_Matter_01_03 " );	// Of course! It's not often you see a new face here - especially a necromancer.
	};

	AI_Output(self,other, " DIA_Pal_9160_Orto_Matter_01_04 " );	// I wonder what kind of business brought a man like you to the paladin fort?
	AI_Output(other,self, " DIA_Pal_9160_Orto_Matter_01_05 " );	// Do I have to answer your questions, or can I just go to the fort?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Matter_01_06 " );	// Hmmm... (with a grin) no, you don't have to answer if you want to.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Matter_01_08 " );	// Okay, come on in - just try not to bother our guys too much!
	AI_Output(self,other, " DIA_Pal_9160_Orto_Matter_01_09 " );	// They've been on edge lately anyway.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Matter_01_10 " );	// So you yourself understand - we don't need extra problems here.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Matter_01_11 " );	// I'll try.
};


instance DIA_PAL_9160_ORTO_WHO(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_who_condition;
	information = dia_pal_9160_orto_who_info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int dia_pal_9160_orto_who_condition()
{
	return TRUE;
};

func void dia_pal_9160_orto_who_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_00");	//Кто ты?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Who_01_01 " );	// My name is Ortho. I am the paladin of the king and obedient servant of Innos.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Who_01_02 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Who_01_03 " );	// Ha. Strange question - what do you think a king's paladin can do?
	AI_Output(other,self, " DIA_Pal_9160_Orto_Who_01_04 " );	// I have no idea. Can you say?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Who_01_05 " );	// The paladin's only destiny is to fight for the glory of Innos and the king. This is what we live and breathe!
	AI_Output(other,self, " DIA_Pal_9160_Orto_Who_01_06 " );	// But I don't think there's anyone to fight here right now.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Who_01_07 " );	// Unfortunately, you're right. And this makes me very sad. And not only me.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Who_01_08 " );	// All this serenity and its inherent boredom is the worst thing ever.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Who_01_10 " );	// Well, if so, then why are you stuck in this fort, and not go, for example, to the Valley of Mines?
	AI_Output(other,self, " DIA_Pal_9160_Orto_Who_01_11 " );	// As far as I know, you definitely won't be bored there.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Who_01_12 " );	// With joy! But until Lord Varus gives us such an order, we will not be able to leave this fort.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Who_01_13 " );	// So we have to sit here doing nothing for now.
};

instance DIA_Pal_9160_Orto_Map(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = DIA_Pal_9160_Orto_Map_condition;
	information = DIA_Pal_9160_Orto_Map_info;
	permanent = FALSE;
	description = " Are you also the navigator of the Esmeralda? " ;
};

func int DIA_Pal_9160_Orto_Map_condition()
{
	if ((MIS_SylvioCrew == LOG_Running) && (Npc_KnowsInfo(hero,dia_pal_9160_orto_who) ==  TRUE ) && (GotoFortMap ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Pal_9160_Orto_Map_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Pal_9160_Orto_Map_01_00 " );	// And you're also the navigator of the Esmeralda?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Map_01_01 " );	// Yes, it is. (surprised) Though I don't understand, how did you know that?
	AI_Output(other,self, " DIA_Pal_9160_Orto_Map_01_02 " );	// Lord Hagen himself told me about it.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Map_01_03 " );	// Well, then it's understandable! Why are you suddenly talking about it?
	AI_Output(other,self, " DIA_Pal_9160_Orto_Map_01_04 " );	// I need a map showing the path from this island to the mainland.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Map_01_05 " );	// You have it, don't you?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Map_01_06 " );	// Naturally. Any navigator without an accurate map at sea is like without hands.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Map_01_07 " );	// However, I don't have it with me. She stayed on the ship.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Map_01_08 " );	// Well, I wish I knew about this sooner!
	SeaMapIns = TRUE;
	B_LogEntry(Topic_SylvioCrew, " I wasted my time in the paladin fort. Ortho left his card on the ship! I'll have to search it thoroughly now... " );
};

instance DIA_PAL_9160_ORTO_FORT(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_FORT_condition;
	information = dia_pal_9160_orto_FORT_info;
	permanent = FALSE;
	description = " Tell me about the fort. " ;
};

func int dia_pal_9160_orto_FORT_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_FORT_info()
{
	AI_Output(other,self, " DIA_Pal_9160_Orto_FORT_01_00 " );		// Tell me about the fort.
	AI_Output(self,other, " DIA_Pal_9160_Orto_FORT_01_01 " );		// It was founded under King Rhobar I to cover the southern borders of Khorinis.
	AI_Output(self,other, " DIA_Pal_9160_Orto_FORT_01_02 " );		// Before the war with the orcs, this was mostly inhabited by knights and paladins.
	AI_Output(self,other, " DIA_Pal_9160_Orto_FORT_01_03 " );		// But after the magical dome was erected over the Valley of Mines, almost the entire garrison was sent back to Myrtana.
	AI_Output(self,other, " DIA_Pal_9160_Orto_FORT_01_04 " );		// And then there was only a small detachment of the royal guards and the local militia.
};

instance DIA_PAL_9160_ORTO_HOWWAY(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_HOWWAY_condition;
	information = dia_pal_9160_orto_HOWWAY_info;
	permanent = FALSE;
	description = " How did you get here?! " ;
};

func int dia_pal_9160_orto_HOWWAY_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_HOWWAY_info()
{
	AI_Output(other,self, " DIA_Pal_9160_Orto_HOWWAY_01_00 " );	// How did you get here?
	AI_Output(self,other, " DIA_Pal_9160_Orto_HOWWAY_01_01 " );	// Most of us were transported here by sea, by ship! The rest remained in Khorinis.
	AI_Output(other,self, " DIA_Pal_9160_Orto_HOWWAY_01_02 " );	// Why didn't you just walk on land?
	AI_Output(self,other, " DIA_Pal_9160_Orto_HOWWAY_01_03 " );	// Way by sea is much shorter! In addition, the entrance to the fort is located next to Onar's farm and the mercenaries supporting it.
	AI_Output(other,self, " DIA_Pal_9160_Orto_HOWWAY_01_04 " );	// Are you afraid of these people?
	AI_Output(self,other, " DIA_Pal_9160_Orto_HOWWAY_01_05 " );	// No, of course not. The paladins of the king can hardly be frightened by ordinary mercenaries!
	AI_Output(self,other, " DIA_Pal_9160_Orto_HOWWAY_01_06 " );	// But now it seems rather inappropriate for me to enter into an open conflict with them.
	AI_Output(self,other, " DIA_Pal_9160_Orto_HOWWAY_01_07 " );	// In addition, until the situation in the Vale of Mines is cleared up, Lord Varus is unlikely to give the order to launch an attack.
};

instances DIA_PAL_9160_ORTO_VARUS (C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_varus_condition;
	information = dia_pal_9160_orto_varus_info;
	permanent = FALSE;
	description = " Lord Varus? " ;
};


func int dia_pal_9160_orto_varus_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_varus_info()
{
	AI_Output(other,self, " DIA_Pal_9160_Orto_Varus_01_00 " );	// Lord Varus?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Varus_01_01 " );	// Well, yes. He is the commander of our garrison - a stern man, I'll tell you.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Varus_01_03 " );	// Where can I meet him?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Varus_01_04 " );	// The house in the center of the fort. There, on the second floor, you will find it.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Varus_01_05 " );	// I just don't think Glantz will let you through.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Varus_01_06 " );	// And who is Glantz?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Varus_01_07 " );	// The guard at the entrance.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Varus_01_08 " );	// So unless you have a good reason to meet Lord Varus, you don't even have to try.
};


instance DIA_PAL_9160_ORTO_HOW(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_how_condition;
	information = dia_pal_9160_orto_how_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_pal_9160_orto_how_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_how_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_How_01_00");	//Как жизнь?
	if ( VARUSAGREEDHUNTDONE  ==  FALSE )
	{
		AI_Output(self,other, " DIA_Pal_9160_Orto_How_01_01 " );	// (sadly) Would have asked something more fun than this.
		AI_Output(self,other, " DIA_Pal_9160_Orto_How_01_02 " );	// Still the same, no change.
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9160_Orto_How_01_03 " );	// Everything is just fine, mate!
		AI_Output(self,other, " DIA_Pal_9160_Orto_How_01_04 " );	// I never thought hunting was such an interesting activity.
		AI_Output(self,other, " DIA_Pal_9160_Orto_How_01_05 " );	// And it's way more fun than just sitting around and getting bored.
		AI_Output(self,other, " DIA_Pal_9160_Orto_How_01_06 " );	// So thank you for helping me talk Varus around! Now we are all your debtors... (laughs)
	};
};


instance DIA_PAL_9160_ORTO_HUNT(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_hunt_condition;
	information = dia_pal_9160_orto_hunt_info;
	permanent = FALSE;
	description = " Well, try to find something to do. " ;
};


func int dia_pal_9160_orto_hunt_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_hunt_info()
{
	AI_Output(other,self, " DIA_Pal_9160_Orto_Hunt_01_00 " );	// Well, try to find something to do.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_02 " );	// Guy, what are you talking about? Nothing to do in this fort!
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_03 " );	// Although it's true, I have one idea here...
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_04");	//Какая?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_05 " );	// (animated) Well, a few of the guys and I are thinking of going hunting inland.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_06 " );	// They say there are dangerous creatures out there - just what we need.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Hunt_01_07 " );	// What's the problem then?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_08 " );	// Eh... (sadly) The fact is that Lord Varus is unlikely to allow us to do this.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Hunt_01_09 " );	// How do you know? Have you talked to him about this before?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_10 " );	// Are you laughing? (nervously) No, man - I definitely won't do that.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_12 " );	// You just don't know Varus! Had I known, I wouldn't have asked such questions.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Hunt_01_14 " );	// Then maybe I can help?
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_15 " );	// You? Hmmm...(thoughtfully) what a good idea!
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_16 " );	// You really don't have to ask him anything like that. You risk nothing.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_01_17 " );	// Tell me, did you really decide to do this?
	Info_ClearChoices(dia_pal_9160_orto_hunt);
	Info_AddChoice(dia_pal_9160_orto_hunt, " No, I was just joking. " ,dia_pal_9160_orto_hunt_no);
	Info_AddChoice(dia_pal_9160_orto_hunt, " Yes, I'll talk to Varus. " ,dia_pal_9160_orto_hunt_ok);
};

func void dia_pal_9160_orto_hunt_ok()
{
	AI_Output(other,self, " DIA_Pal_9160_Orto_Hunt_Ok_01_00 " );	// Yes, I'll talk to Varus.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_Ok_01_01 " );	// Thank you, mate! You just save us all.
	AI_Output(other,self, " DIA_Pal_9160_Orto_Hunt_Ok_01_05 " );	// I'll do my best.
	MIS_ORTOHUNT = LOG_Running;
	Log_CreateTopic(TOPIC_ORTOHUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORTOHUNT,LOG_Running);
	B_LogEntry( TOPIC_ORTOHUNT , " Paladin Ortho has asked me to speak with Lord Varus to allow a few paladins to go hunting inland. Let's see what Varus has to say. " );
	Info_ClearChoices(dia_pal_9160_orto_hunt);
};

func void dia_pal_9160_orto_hunt_no()
{
	AI_Output(other,self, " DIA_Pal_9160_Orto_Hunt_No_01_00 " );	// No, I was just joking.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_No_01_01 " );	// Well, you have jokes. (annoyed) Okay.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_No_01_02 " );	// After all - you don't really have to do anything for us.
	AI_Output(self,other, " DIA_Pal_9160_Orto_Hunt_No_01_03 " );	// So let's just forget about this conversation.
	Info_ClearChoices(dia_pal_9160_orto_hunt);
};


instance DIA_PAL_9160_ORTO_HUNTDONE (C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_huntdone_condition;
	information = dia_pal_9160_orto_huntdone_info;
	permanent = FALSE;
	description = " Lord Varus has no objection to your venture. " ;
};


func int dia_pal_9160_orto_huntdone_condition()
{
	if (( MIS_ORTOHUNT  == LOG_Running ) && ( VARUSAGREEDHUNT  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_huntdone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Pal_9160_Orto_HuntDone_01_01 " );	// Lord Varus has no objection to your venture.
	AI_Output(self,other, " DIA_Pal_9160_Orto_HuntDone_01_02 " );	// Are you serious?
	AI_Output(other,self, " DIA_Pal_9160_Orto_HuntDone_01_03 " );	// Absolutely! So you can take people with you and go hunting.
	AI_Output(self,other, " DIA_Pal_9160_Orto_HuntDone_01_04 " );	// Oh, thanks man! I don't even know how to thank you.
	AI_Output(self,other, " DIA_Pal_9160_Orto_HuntDone_01_05 " );	// Although, no - I think I know ... (laughs)
	AI_Output(self,other, " DIA_Pal_9160_Orto_HuntDone_01_06 " );	// I'll tell you how to properly use your power in combat.
	AI_Output(self,other, " DIA_Pal_9160_Orto_HuntDone_01_07 " );	// I think you will definitely need this!
	MIS_ORTOHUNT = LOG_SUCCESS;
	VARUSAGREEDHUNTDONE = TRUE ;
	Log_SetTopicStatus(TOPIC_ORTOHUNT,LOG_SUCCESS);
	B_LogEntry( TOPIC_ORTOHUNT , " Ortho was grateful to me that I was able to persuade Varus. For this favor, he showed me one of his fighting moves, which will increase the power of my blow. " );
	Info_ClearChoices(dia_pal_9160_orto_huntdone);
	Info_AddChoice(dia_pal_9160_orto_huntdone, " Would love to hear from you! " ,dia_pal_9160_orto_huntdone_teach);
};

func void dia_pal_9160_orto_huntdone_teach()
{
	AI_Output(other,self, " DIA_Pal_9160_Orto_HuntDone_Teach_01_00 " );	// I just have a free minute!
	AI_Output(self,other, " DIA_Pal_9160_Orto_HuntDone_Teach_01_01 " );	// Then remember, it's pretty simple - when someone attacks you, try to use your enemy's momentum.
	AI_Output(self,other, " DIA_Pal_9160_Orto_HuntDone_Teach_01_02 " );	// This is especially true for parrying. Make your opponent act the way you need it.
	AI_Output(self,other, " DIA_Pal_9160_Orto_HuntDone_Teach_01_03 " );	// Do this and you'll always have the upper hand in combat! Remember?
	AI_Output(other,self, " DIA_Pal_9160_Orto_HuntDone_Teach_01_04 " );	// Yes - thanks for the tip.
	AI_Output(self,other, " DIA_Pal_9160_Orto_HuntDone_Teach_01_05 " );	// Thank you! (laughs) Well, now - to hunt!
	B_RaiseAttribute_Bonus(other,ATR_STRENGTH,1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pal_9160_orto,"Hunt");
	Npc_ExchangeRoutine(pal_9139_ritter,"Hunt");
	Npc_ExchangeRoutine(pal_9140_ritter,"Hunt");
	Npc_ExchangeRoutine(pal_9141_ritter,"Hunt");
	Npc_ExchangeRoutine(pal_9142_ritter,"Hunt");
};


instance DIA_PAL_9160_ORTO_RAYNEHELP (C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_raynehelp_condition;
	information = dia_pal_9160_ortho_raynehelp_info;
	permanent = FALSE;
	description = " Could you help Rain at the warehouse? " ;
};


func int dia_pal_9160_orto_raynehelp_condition()
{
	if(MIS_RAYNEHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_raynehelp_info()
{
	AI_Output(other,self, " DIA_Pal_9160_Orto_RayneHelp_01_00 " );	// Could you help Rain at the warehouse?
	AI_Output(self,other, " DIA_Pal_9160_Orto_RayneHelp_01_01 " );	// What? (laughs) Not really - I have more interesting things to do than hang around in a warehouse all day!
	AI_Output(self,other, " DIA_Pal_9160_Orto_RayneHelp_01_02 " );	// So I'm sorry - I can't help.
	AI_Output(other,self, " DIA_Pal_9160_Orto_RayneHelp_01_03 " );	// I thought so.
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if (( HELPCOUNTRAYNE  >  10 ) && ( MAYTALKVARUSRAYNE  ==  FALSE ) && ( MY_RAYHELP  == LOG_Running ))
	{
		MAYTALKVARUSRAYNE = TRUE ;
		B_LogEntry( TOPIC_RAYNEHELP , " I feel like I'm wasting my time - none of the paladins want to help Rayne. Maybe I should take more drastic action? " );
	};
};


instance DIA_PAL_9160_ORTO_PICKPOCKET(C_Info)
{
	npc = pal_9160_orto;
	nr = 900;
	condition = dia_pal_9160_orto_pickpocket_condition;
	information = dia_pal_9160_orto_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9160_orto_pickpocket_condition()
{
	return  C_Robbery ( 100 , 150 );
};

func void dia_pal_9160_orto_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9160_orto_pickpocket);
	Info_AddChoice(dia_pal_9160_orto_pickpocket,Dialog_Back,dia_pal_9160_orto_pickpocket_back);
	Info_AddChoice(dia_pal_9160_orto_pickpocket,DIALOG_PICKPOCKET,dia_pal_9160_orto_pickpocket_doit);
};

func void dia_pal_9160_orto_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_pal_9160_orto_pickpocket);
};

func void dia_pal_9160_orto_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9160_orto_pickpocket);
};

