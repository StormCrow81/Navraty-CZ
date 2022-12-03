
instance DIA_NagShor_EXIT (C_Info)
{
	npc = Orc_Clan_Boss;
	nr = 999;
	condition = DIA_NagShor_Exit_Condition;
	information = DIA_NagShor_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NagShor_Exit_Condition()
{
	return TRUE;
};

func void DIA_NagShor_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NagShor_Hello (C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_Hello_Condition;
	information = DIA_NagShor_Hello_Info;
	permanent = FALSE;
	description = " Greetings Orc. " ;
};

func int DIA_NagShor_Hello_Condition()
{
	return TRUE;
};

func void DIA_NagShor_Hello_Info()
{
	AI_Output(other,self, " DIA_NagShor_Hello_01_01 " );	// Greetings, orc.
	AI_Output(self,other, " DIA_NagShor_Hello_01_02 " );	// URG HAR BAR... Human?!
	AI_Output(self,other, " DIA_NagShor_Hello_01_03 " );	// You would never think that people of their own free will can come here.
	AI_Output(self,other, " DIA_NagShor_Hello_01_04 " );	// Although I see that a person wearing Ulu-Mulu is a sign of orc power.
	AI_Output(self,other, " DIA_NagShor_Hello_01_05 " );	// It turns out he knows our customs...(respectfully) It's good to be human.
	AI_Output(self,other, " DIA_NagShor_Hello_01_06 " );	// Orcs respect Ulu-Mulu and don't touch humans. Now he himself to speak, why come here?
	Info_ClearChoices(DIA_NagShor_Hello);
	Info_AddChoice(DIA_NagShor_Hello, " Neither nor anyone. " ,DIA_NagShor_Hello_None);

	if((MIS_WakonTest == LOG_Running) && (UrShakTellWaterSoul == TRUE))
	{
		Info_AddChoice(DIA_NagShor_Hello, " Neighborhood of UrShak. " ,DIA_NagShor_Hello_UrShak);
	};

	if ((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcTraitor ==  FALSE ) && (Npc_HasItems(other,ItWr_UrKarrasLetter) >=  1 ) && (OrcClanBossLetterDeliver ==  FALSE )) ;
	{
		Info_AddChoice(DIA_NagShor_Hello, " I have a message for you, chief. " ,DIA_NagShor_Hello_UrKarras);
	};
};

func void DIA_NagShor_Hello_UrShak()
{
	AI_Output(other,self, " DIA_NagShor_Hello_UrShak_01_01 " );	// The shaman Ur-Shak sent me.
	AI_Output(other,self, " DIA_NagShor_Hello_UrShak_01_02 " );	// He said that here I can get some answers to my questions.
	AI_Output(self,other, " DIA_NagShor_Hello_UrShak_01_03 " );	// Should Ur-Shak send you?! Hmmm...(thoughtfully) However, man greatly surprise me with this!
	AI_Output(other,self, " DIA_NagShor_Hello_UrShak_01_04 " );	// Why is that?
	AI_Output(self,other, " DIA_NagShor_Hello_UrShak_01_05 " );	// Arghh...(hostile) Because orcs never like humans!
	AI_Output(self,other, " DIA_NagShor_Hello_UrShak_01_06 " );	// Orcs always fight with humans and make him dead. Humans will always be the enemy of orcs!
	AI_Output(other,self, " DIA_NagShor_Hello_UrShak_01_07 " );	// As you can see, there are exceptions. Besides, I once saved Ur-Shak's life.
	AI_Output(other,self, " DIA_NagShor_Hello_UrShak_01_08 " );	// So we have no reason to be at enmity with him.
	AI_Output(self,other, " DIA_NagShor_Hello_UrShak_01_09 " );	// Human saving an orc's life?! (very surprised) Never hear of such a thing! Are you speaking the truth?
	AI_Output(other,self, " DIA_NagShor_Hello_UrShak_01_10 " );	// You can go and ask him yourself if you don't believe me.
	AI_Output(self,other, " DIA_NagShor_Hello_UrShak_01_11 " );	// (looking) Good. I believe you man and think that's the way it be.
	AI_Output(self,other, " DIA_NagShor_Hello_UrShak_01_13 " );	// Now the man is talking - what does he want to know?
	NagShorFirstMeet = TRUE;
	NagShorAreedAnswer = TRUE ;
	NagShorTellUrShak = TRUE;
	Info_ClearChoices(DIA_NagShor_Hello);
};


func void DIA_NagShor_Hello_UrKarras()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_NagShor_Hello_UrKarras_01_01 " );	// I have a message for you, warchief.
	AI_Output(other,self, " DIA_NagShor_Hello_UrKarras_01_02 " );	// It is given to you by Ur-Karras, one of the orc warlords of the Black Dragon clan.
	AI_Output(self,other, " DIA_NagShor_Hello_UrKarras_01_03 " );	// Man go crazy?! (sternly) I doubt our brothers could trust him with such a thing!
	AI_Output(self,other, " DIA_NagShor_Hello_UrKarras_01_04 " );	// I think you're fooling me! So tell your warriors now to kill you, man!
	AI_Output(other,self, " DIA_NagShor_Hello_UrKarras_01_05 " );	// Wait, leader! Here, take this scroll. Everything is written here.
	B_GiveInvItems(other,self,ItWr_UrKarrasLetter,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_NagShor_Hello_UrKarras_01_06 " );	// Arghhh... Looks like the person is telling the truth!
	AI_Output(self,other, " DIA_NagShor_Hello_UrKarras_01_07 " );	// But if Ur-Karras himself is to be entrusted to you to bring it to us, it means that the brothers of the Black Dragon orcs respect you very much!
	AI_Output(self,other, " DIA_NagShor_Hello_UrKarras_01_08 " );	// They respect you - we respect you too, man. Don't kill him! Treats him like a brother.
	AI_Output(other,self, " DIA_NagShor_Hello_UrKarras_01_09 " );	// I'm glad it's cleared up, chief. Now that you have read his message, what answer should I give to Ur-Karras?
	AI_Output(self,other, " DIA_NagShor_Hello_UrKarras_01_10 " );	// (thinking) Tell him that my brothers and I will agree to his proposal.
	AI_Output(other,self, " DIA_NagShor_Hello_UrKarras_01_11 " );	// Good. Now I have to go.
	AI_Output(self,other, " DIA_NagShor_Hello_UrKarras_01_12 " );	// Farewell, brother man.
	NagShorFirstMeet = TRUE;
	NagShorTellUrKarras = TRUE ;
	OrcClanBossLetterDeliver = TRUE;
	B_LogEntry(TOPIC_HeroOrcJoin_T2, " I have delivered Ur-Karras's message to the Chieftain of the Highrock clan. Now it's time to return to the orc city and give Ur-Karras his reply. " );
	AI_StopProcessInfos(self);
};

func void DIA_NagShor_Hello_None()
{
	AI_Output(other,self, " DIA_NagShor_Hello_None_01_01 " );	// I don't know this myself.
	AI_Output(self,other, " DIA_NagShor_Hello_None_01_02 " );	// Man himself does not know why come here? (laughs) What a stupid person!
	AI_Output(self,other, " DIA_NagShor_Hello_None_01_03 " );	// Man make me laugh really hard...(laughs) Never see such a stupid man!
	AI_Output(self,other, " DIA_NagShor_Hello_None_01_04 " );	// If a person has nothing to say, I won't talk to him either!
	AI_Output(self,other, " DIA_NagShor_Hello_None_01_05 " );	// So man better go! Orc will keep laughing...
	NagShorFirstMeet = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_NagShor_HelloAgain (C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_HelloAgain_Condition;
	information = DIA_NagShor_HelloAgain_Info;
	permanent = TRUE;
	description = " I need to talk to you, orc! " ;
};

func int DIA_NagShor_HelloAgain_Condition()
{
	if(NagShorFirstMeet == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NagShor_HelloAgain_Info()
{
	AI_Output(other,self, " DIA_NagShor_HelloAgain_01_01 " );	// I need to talk to you, orc.
	AI_Output(self,other, " DIA_NagShor_HelloAgain_01_02 " );	// URG HAR BAR! The stupid man is here again?! Orc wants to laugh again?
	AI_Output(self,other, " DIA_NagShor_HelloAgain_01_03 " );	// Why did he come here?
	Info_ClearChoices(DIA_NagShor_HelloAgain);
	Info_AddChoice(DIA_Shored_HelloAgain, " Поняия не имею. " ,DIA_Shored_HelloAgain_None);

	if ((MIS_WakonTest == LOG_Running) && (ClockShackTellWaterSoul ==  TRUE ) && (NagShorTellClockShack ==  FALSE ))
	{
		Info_AddChoice(DIA_NagShor_HelloAgain, " Neither marriage nor marriage. " ,DIA_NagShor_HelloAgain_UrShak);
	};

	if ((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcTraitor ==  FALSE ) && (NagShorTellUrKarras ==  FALSE ) && (Npc_HasItems(other,ItWr_UrKarrasLetter) >=  1 ) && (OrcClanBossLetterDeliver ==  FALSE )) ;
	{
		Info_AddChoice(DIA_NagShor_HelloAgain, " I have a message for you. " ,DIA_NagShor_HelloAgain_UrKarras);
	};
};

func void DIA_NagShor_HelloAgain_UrShak()
{
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrShak_01_01 " );	// The shaman Ur-Shak sent me.
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrShak_01_02 " );	// He said that here I can get some answers to my questions.
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrShak_01_03 " );	// Should Ur-Shak send you?! Hmmm...(thoughtfully) However, man greatly surprise me with this!
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrShak_01_04 " );	// Why is that?
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrShak_01_05 " );	// Arghh...(hostile) Because orcs never like humans!
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrShak_01_06 " );	// Orcs always fight with humans and make him dead. Humans will always be the enemy of orcs!
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrShak_01_07 " );	// As you can see, there are exceptions. In addition, I once saved Ur-Shak's life, and this, as you yourself understand, is still worth something.
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrShak_01_08 " );	// So we have no reason to be at enmity with him now.
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrShak_01_09 " );	// Human saving an orc's life?! (very surprised) Never hear of such a thing! Are you speaking the truth?
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrShak_01_10 " );	// You can go and ask him yourself if you don't believe me.
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrShak_01_11 " );	// (peeping) Good. I believe you man and think that's the way it be.
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrShak_01_13 " );	// Now the man is talking - what does he want to know?
	NagShorTellUrShak = TRUE;
	NagShorAreedAnswer = TRUE ;
	Info_ClearChoices(DIA_NagShor_HelloAgain);
};

func void DIA_NagShor_HelloAgain_UrKarras()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrKarras_01_01 " );	// I have a message for you, warchief.
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrKarras_01_02 " );	// It is given to you by Ur-Karras, one of the orc warlords of the Black Dragon clan.
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrKarras_01_03 " );	// Man go crazy?!...(terribly) I doubt our brothers can trust him with such a thing!
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrKarras_01_04 " );	// I think you're fooling me! So tell your warriors now to kill you, man!
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrKarras_01_05 " );	// Wait, leader! Here, take this scroll... everything is written here.
	B_GiveInvItems(other,self,ItWr_UrKarrasLetter,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrKarras_01_06 " );	// Arghhh... Looks like the person is telling the truth!
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrKarras_01_07 " );	// But if Ur-Karras himself is to be entrusted to you to bring him to us, it means that the brothers of the Black Dragon orcs respect you very much!
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrKarras_01_08 " );	// They respect you - we respect you too, man. Don't kill him! Treat him like a brother!
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrKarras_01_09 " );	// I'm glad it's cleared up, chief. Now that you have read his message, what answer should I give to Ur-Karras?
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrKarras_01_10 " );	// Hmmm...(thinking) Tell him that my brothers and I will agree to his proposal.
	AI_Output(other,self, " DIA_NagShor_HelloAgain_UrKarras_01_11 " );	// Good. Now I have to go.
	AI_Output(self,other, " DIA_NagShor_HelloAgain_UrKarras_01_12 " );	// Farewell, brother man.
	NagShorTellUrKarras = TRUE ;
	OrcClanBossLetterDeliver = TRUE;
	B_LogEntry(TOPIC_HeroOrcJoin_T2, " I have delivered Ur-Karras's message to the Chieftain of the Highrock clan. Now it's time to return to the orc city and give Ur-Karras his reply. " );
	AI_StopProcessInfos(self);
};

func void DIA_NagShor_HelloAgain_None()
{
	AI_Output(other,self, " DIA_NagShor_HelloAgain_None_01_01 " );	// I have no idea.
	AI_Output(self,other, " DIA_NagShor_HelloAgain_None_01_02 " );	// Ha ha ha! The man again makes me laugh very much... (laughs) What a stupid man!
	AI_Output(self,other, " DIA_NagShor_HelloAgain_None_01_03 " );	// Now he better go! Orc will keep laughing...
	AI_StopProcessInfos(self);
};

instance DIA_NagShor_WhoYou (C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_WhoYou_Condition;
	information = DIA_NagShor_WhoYou_Info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_NagShor_WhoYou_Condition()
{
	if (NagShorAreedAnswer ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_NagShor_WhoYou_Info()
{
	AI_Output(other,self,"DIA_NagShor_WhoYou_01_01");	//Кто ты?
	AI_Output(self,other, " DIA_NagShor_WhoYou_01_02 " );	// Call Nag-Shor. To be the leader of the High Rock clan is to be the strongest warrior of the clan.
	AI_Output(other,self, " DIA_NagShor_WhoYou_01_03 " );	// So you're the one in charge here?
	AI_Output(self,other, " DIA_NagShor_WhoYou_01_04 " );	// Think the person is speaking correctly. Be in charge here!
	AI_Output(other,self,"DIA_NagShor_WhoYou_01_05");	//Все ясно.
};

instance DIA_NagShor_WaterSoul (C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_WaterSoul_Condition;
	information = DIA_NagShor_WaterSoul_Info;
	permanent = FALSE;
	description = " Do you know anything about the Water Spirit? " ;
};

func int DIA_NagShor_WaterSoul_Condition()
{
	if ((MIS_WakonTest == LOG_Running) && (ShortAreedAnswer ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_NagShor_WaterSoul_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_NagShor_WaterSoul_01_01 " );	// Do you know anything about the ancient creature called the Water Spirit?
	AI_Output(self,other, " DIA_NagShor_WaterSoul_01_02 " );	// Water Spirit?! (thoughtfully) Nag Shor think you don't know anything about what a person asks.
	AI_Output(self,other, " DIA_NagShor_WaterSoul_01_03 " );	// Only the shaman can talk to the spirits and conjure them! Nag Shor don't be a shaman.
	AI_Output(self,other, " DIA_NagShor_WaterSoul_01_04 " );	// Nag Shor only be a warrior - only fight the enemy and kill them! Do nothing more.
	AI_Output(other,self, " DIA_NagShor_WaterSoul_01_05 " );	// Well, yes, it couldn't be otherwise. And who from shamans can know about it?
	AI_Output(self,other, " DIA_NagShor_WaterSoul_01_06 " );	// Hmmm... Nag Shor to think that maybe Ur-Dah could help a human. He must know more!
	AI_Output(other,self, " DIA_NagShor_WaterSoul_01_07 " );	// Ur-Dah? And who is it?
	AI_Output(self,other, " DIA_NagShor_WaterSoul_01_08 " );	// Be the head shaman of the High Rock clan - speak with the spirits and cast their magic. Be very old and wise!
	AI_Output(other,self, " DIA_NagShor_WaterSoul_01_09 " );	// Well, if so, then we'll have to talk to him. Tell me where can I find him in your camp?
	AI_Output(self,other, " DIA_NagShor_WaterSoul_01_10 " );	// Ur-Dah is out of camp now! He's leaving here to help his brothers fight against the humans.
	AI_Output(other,self, " DIA_NagShor_WaterSoul_01_11 " );	// Then maybe you could tell me where he could go?
	AI_Output(self,other, " DIA_NagShor_WaterSoul_01_12 " );	// Nag Shor to think that a man should go where the orcs bury their brothers - a place very far from here.
	AI_Output(other,self, " DIA_NagShor_WaterSoul_01_14 " );	// Are you talking about the orc graveyard?
	AI_Output(self,other, " DIA_NagShor_WaterSoul_01_15 " );	// Nag Shor to believe that a person to be right - to be the very place. Search nearby!
	AI_Output(other,self, " DIA_NagShor_WaterSoul_01_16 " );	// Okay, thanks - I understand everything.
	NagShorTellMe = TRUE ;
	B_LogEntry(TOPIC_WakonTest, " Nag Shor, chief of the High Rock clan, knows nothing about the mysterious Water Spirit. He said that Ur-Dah, the chief shaman of his tribe, could help me in this matter. According to Nag Shor, he is now on orc graveyard. " );
};

instance DIA_NagShor_UrShak (C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_UrShak_Condition;
	information = DIA_NagShor_UrShak_Info;
	permanent = FALSE;
	description = " How do you know the shaman Ur-Shak? " ;
};

func int DIA_NagShor_UrShak_Condition()
{
	if (NagShorAreedAnswer ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_NagShor_UrShak_Info()
{
	AI_Output(other,self, " DIA_NagShor_UrShak_01_01 " );	// How do you know the shaman Ur-Shak?
	AI_Output(self,other, " DIA_NagShor_UrShak_01_02 " );	// Many winters ago be a warrior - fight your enemy! The enemy live in the Fire Clan.
	AI_Output(self,other, " DIA_NagShor_UrShak_01_03 " );	// Ur-Shak also live in the Fire Clan and be my enemy.
	AI_Output(self,other, " DIA_NagShor_UrShak_01_04 " );	// Me and Ur-Shak used to fight each other and want to kill each other.
	AI_Output(other,self, " DIA_NagShor_UrShak_01_05 " );	// So Ur-Shak is your enemy?
	AI_Output(self,other, " DIA_NagShor_UrShak_01_06 " );	// To be once my enemy, but not anymore!
	AI_Output(self,other, " DIA_NagShor_UrShak_01_07 " );	// Now we will no longer be an enemy - the Fire Clan is no more. Enemy die!
	AI_Output(self,other, " DIA_NagShor_UrShak_01_08 " );	// But I remember Ur-Shak and greatly respect! Be first a great warrior, then become a great shaman - the son of a spirit.
	AI_Output(other,self,"DIA_NagShor_UrShak_01_09");	//Понятно.
};
