

instance DIA_Mika_EXIT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 999;
	condition = DIA_Mika_EXIT_Condition;
	information = DIA_Mika_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mika_EXIT_Condition()
{
	if (chapter <=  2 )
	{
		return TRUE;
	};
};

func void DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mika_WOHIN (C_Info)
{
	npc = Mil_337_Mika;
	nr = 4;
	condition = DIA_Mika_WOHIN_Condition;
	information = DIA_Mika_WOHIN_Info;
	important = TRUE;
};


func int DIA_Mika_WHIN_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mika_WHIN_Info()
{
	AI_Output(self,other, " DIA_Mika_WOHIN_12_00 " );	// Hey, hey! Not so fast. Walking alone here is quite dangerous. Where are you going from now?
	Info_ClearChoices(DIA_Mika_WOHIN);
	Info_AddChoice(DIA_Mika_WOHIN, " It's none of your business. " ,DIA_Mika_WOHIN_weg);
	Info_AddChoice(DIA_Mika_WOHIN, " From one of the farms. " ,DIA_Mika_WOHIN_Bauern);
	Info_AddChoice(DIA_Mika_WOHIN, " Из города! " ,DIA_Mika_WOHIN_stadt);
};

func void DIA_Mika_WHERE_city()
{
	AI_Output(other,self, " DIA_Mika_WOHIN_stadt_15_00 " );	// Out of town!
	AI_Output(self,other, " DIA_Mika_WOHIN_stadt_12_01 " );	// Yes, yes. Then what are you doing here, so far from its protective walls?
	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern()
{
	AI_Output(other,self, " DIA_Mika_WOHIN_Bauern_15_00 " );	// From one of the farms.
	AI_Output(self,other, " DIA_Mika_WOHIN_Bauern_12_01 " );	// You're a farmer, right? Hmm. Then you shouldn't wander these dangerous paths all alone. Who knows who might be waiting for you there.
	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg()
{
	AI_Output(other,self, " DIA_Mika_WOHIN_weg_15_00 " );	// It's none of your business.
	AI_Output(self,other, " DIA_Mika_WOHIN_weg_12_01 " );	// As you know. But don't cry later if someone skins you. Have a good walk.
	AI_StopProcessInfos(self);
};


instance DIA_Mika_WAS DANGEROUS (C_Info)
{
	npc = Mil_337_Mika;
	nr = 5;
	condition = DIA_Mika_WASGEFAEHRLICH_Condition;
	information = DIA_Mika_WAS DANGEROUS_Info;
	description = " What's so dangerous here? " ;
};

func int DIA_Mika_WASGEFAEHRLICH_Condition()
{
	return TRUE;
};

func void DIA_Mika_WAS DANGEROUS_Info()
{
	AI_Output(other,self, " DIA_Mika_WASGEFAEHRLICH_15_00 " );	// What's so dangerous here?
	AI_Output(self,other, " DIA_Mika_WASGEFAEHRLICH_12_01 " );	// Lots of things.
	AI_Output(self,other, " DIA_Mika_WASGEFAEHRLICH_12_02 " );	// Well, for example, bandits. They're just waiting for someone like you to fall into their clutches.
	AI_Output(self,other, " DIA_Mika_WASGEFAEHRLICH_12_03 " );	// And if the bandits don't catch you, then the wild animals from the forest or the mercenaries that hang around will take care of you.
	AI_Output(self,other, " DIA_Mika_WASGEFAEHRLICH_12_04 " );	// So try to at least get some decent armor first. There is nothing to do without them.

	if(RealMode[2] == FALSE)
	{
		AI_Output(self,other, " DIA_Mika_WASGEFAEHRLICH_12_05 " );	// I'm sure you'll come running to me for help before you even make it to the next turn in this road.
	};
};

instance DIA_Mika_WASKOSTETHILFE (C_Info)
{
	npc = Mil_337_Mika;
	nr = 6;
	condition = DIA_Mika_WASKOSTETHILFE_Condition;
	information = DIA_Mika_WASKOSTETHILFE_Info;
	description = " Well, let's say I ask you for help. " ;
};


func int DIA_Mika_WASKOSTETHILFE_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_Mika_WASGEFAEHRLICH ) ==  TRUE ) && ( RealMode [ 2 ] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Mika_WASKOSTETHILFE_Info()
{
	AI_Output(other,self, " DIA_Mika_WASKOSTETHILFE_15_00 " );	// Well, suppose I turn to you for help. How much will it cost me?
	AI_Output(self,other, " DIA_Mika_WASKOSTETHILFE_12_01 " );	// I'm just a humble servant of the king, and it doesn't suit me to rip off the defenseless citizens of our kingdom.
	AI_Output(self,other, " DIA_Mika_WASKOSTETHILFE_12_02 " );	// But, you know, if that's how you put the question, I wouldn't mind a little financial help. This will strengthen our future business relationship.
	AI_Output(self,other, " DIA_Mika_WASKOSTETHILFE_12_03 " );	// One hundred gold coins will be enough to get you started. What do you say?
	Info_ClearChoices(DIA_Mika_WASKOSTETHILFE);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE, " I'll think about it. " ,DIA_Mika_WASKOSTETHILFE_nochnicht);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE, " Why not? Here's your 100 coins. " ,DIA_Mika_WASKOSTETHILFE_ja);
};

func void DIA_Mika_WASKOSTETHILFE_ja()
{
	AI_Output(other,self, " DIA_Mika_WASKOSTETHILFE_ja_15_00 " );	// Why not? Here is your hundred coins.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other, " DIA_Mika_WASKOSTETHILFE_ja_12_01 " );	// Awesome. If you need my help, you know where to find me.
		AI_Output(self,other, " DIA_Mika_WASKOSTETHILFE_ja_12_02 " );	// But be so kind as to not distract me with trifles. I can't stand it, do you hear?
		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Mika_WASKOSTETHILFE_ja_12_03 " );	// You don't have any money. But perhaps you will have them when you really need my help.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Mika_WASKOSTETHILFE_not yet()
{
	AI_Output(other,self, " DIA_Mika_WASKOSTETHILFE_nochnicht_15_00 " );	// I'll think about it.
	AI_Output(self,other, " DIA_Mika_WASKOSTETHILFE_nochnicht_12_01 " );	// As you know. I wish you a good death.
	AI_StopProcessInfos(self);
};


instance DIA_Mika_UEBERLEGT (C_Info)
{
	npc = Mil_337_Mika;
	nr = 7;
	condition = DIA_Mika_UEBERLEGT_Condition;
	information = DIA_Mika_UEBERLEGT_Info;
	permanent = TRUE;
	description = " I changed my mind! I'll pay you a hundred gold. " ;
};


func int DIA_Mika_UEBERLEGT_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Mika_WASCOST_THINGS) && (Mika_Helps ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Mika_UEBERLEGT_Info()
{
	AI_Output(other,self, " DIA_Mika_UEBERLEGT_15_00 " );	// I changed my mind! I will pay you a hundred gold.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other, " DIA_Mika_UEBERLEGT_12_01 " );	// Excellent! Better late than never. And now what?
		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Mika_UEBERLEGT_12_02 " );	// (angrily) Come back when you have the money.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Mika_HILFE (C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_HILFE_Condition;
	information = DIA_Mika_HILFE_Info;
	permanent = TRUE;
	description = " I need your help. " ;
};

func int DIA_Mika_HILFE_Condition()
{
	if(Mika_Helps == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mika_HILFE_Info()
{
	AI_Output(other,self, " DIA_Mika_HILFE_15_00 " );	// I need your help.
	AI_Output(self,other, " DIA_Mika_HILFE_12_01 " );	// Well, if it's necessary. What happened?
	Info_ClearChoices(DIA_Mika_HILFE);
	Info_AddChoice(DIA_Mika_HILFE, " Bandits are chasing me. " ,DIA_Mika_HILFE_schongut);
	Info_AddChoice(DIA_Mika_HILFE, " Monsters attacked me. " ,DIA_Mika_HILFE_monster);
	if ( ! Npc_IsDead(Alvares) &&  ! Npc_IsDead(Engardo) && ( MIKAGOFARM  ==  FALSE ) && ((Achilles_SLDStillthere ==  TRUE ) || Npc_KnowsInfo(other,DIA_Sarah_Bauern)));
	{
		Info_AddChoice(DIA_Mika_HILFE, " Farmer Akil was attacked by mercenaries. " ,DIA_Mika_HILFE_Akil);
	};
	if((MIS_SALANDRILHELP == LOG_Running) && (ORCWARRIORSALANDRILISDEAD == FALSE))
	{
		Info_AddChoice(DIA_Mika_HILFE, " They say there's an orc nearby. " ,dia_mika_hilfe_orcsalandril);
	};
};

func void DIA_Mika_HILFE_Akil()
{
	AI_Output(other,self, " DIA_Mika_HILFE_Akil_15_00 " );	// Farmer Akil was attacked by mercenaries.
	AI_Output(self,other, " DIA_Mika_HILFE_Akil_12_01 " );	// What?...(excited) Is this rabble hanging around Akil's farm? Then let's not waste time. Come follow me!
	AI_StopProcessInfos(self);
	MIKAGOFARM = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_AkilsSLDStillthere, " Mika wants to help me solve the problem with the mercenaries who attacked Akil. " );
	Npc_ExchangeRoutine(self,"Akil");
};

func void DIA_Mika_HILFE_monster()
{
	AI_Output(other,self, " DIA_Mika_HILFE_monster_15_00 " );	// Monsters attacked me.
	AI_Output(self,other, " DIA_Mika_HILFE_monster_12_01 " );	// But I don't see any monsters. I think you got it.
	AI_StopProcessInfos(self);
};

func void DIA_Mika_HILFE_schongut()
{
	AI_Output(other,self, " DIA_Mika_HILFE_schongut_15_00 " );	// I'm being chased by bandits.
	AI_Output(self,other, " DIA_Mika_HILFE_schongut_12_01 " );	// huh? And where are they? If you were being chased, I would have seen at least one of them, right?
	AI_StopProcessInfos(self);
};

func void dia_mika_hilfe_orcsalandril()
{
	AI_Output(other,self, " DIA_Mika_HILFE_OrcSalandril_01_00 " );	// They say there's an orc nearby.
	AI_Output(self,other, " DIA_Mika_HILFE_OrcSalandril_01_01 " );	// Orc?! Hmmm... (frightened) This is a serious opponent!
	AI_Output(self,other, " DIA_Mika_HILFE_OrcSalandril_01_02 " );	// Guess you can't get by with a hundred gold pieces.
	AI_Output(other,self, " DIA_Mika_HILFE_OrcSalandril_01_03 " );	// So how? But we agreed!
	AI_Output(self,other, " DIA_Mika_HILFE_OrcSalandril_01_04 " );	// Man, I'm not going to risk my life for a couple of coins, much less fighting an orc!
	AI_Output(other,self, " DIA_Mika_HILFE_OrcSalandril_01_05 " );	// Well, how much do you want?
	AI_Output(self,other, " DIA_Mika_HILFE_OrcSalandril_01_06 " );	// Mmm... (thinking) Five hundred gold pieces and not a coin less!
	MIKATELLORKS = TRUE;
	Info_ClearChoices(DIA_Mika_HILFE);
};


instance DIA_MIKA_GOHUNT (C_Info)
{
	npc = Mil_337_Mika;
	nr = 1;
	condition = dia_mika_gohunt_condition;
	information = dia_mica_gohunt_info;
	permanent = TRUE;
	description = " Here's your five hundred coins. Now let's go! " ;
};

func int dia_mika_gohunt_condition()
{
	if (( MIS_SALANDRILHELP  == LOG_Running) && ( ORCWARRIORSALANDRILISDEAD  ==  FALSE ) && ( MIKATELLORKS  ==  TRUE ) && ( MIKATELLORKSGO  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_mika_gohunt_info()
{
	AI_Output(other,self, " DIA_Mika_GoHunt_01_00 " );	// Here's your five hundred coins. Now let's go!

	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		MIKATELLORKSGO = TRUE ;
		AI_Output(self,other, " DIA_Mika_GoHunt_01_01 " );	// Eh. Okay, let's go! Show me where this orc of yours is.
		AI_StopProcessInfos(self);
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
		B_GivePlayerXP(XP_Ambient);
		Npc_ExchangeRoutine(self,"Follow");
	}
	else
	{
		AI_Output(self,other, " DIA_Mika_GoHunt_01_02 " );	// And where are they? You don't have that much gold!
		AI_Output(self,other, " DIA_Mika_GoHunt_01_03 " );	// So I better stay here. Away from the orcs!
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIKA_GOHOME(C_Info)
{
	npc = Mil_337_Mika;
	nr = 1;
	condition = dia_mika_gohome_condition;
	information = dia_mika_gohome_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mika_gohome_condition()
{
	if (( MIS_SALANDRILHELP  == LOG_Running) && ( MIKATELLORKSDONE  ==  FALSE ) && ( ORCWARRIORSALANDRILISDEAD  ==  FALSE ) && ( MIKATELLORKSGO  ==  TRUE ) && (Npc_GetDistToWP(self, " NW_CITY_TO_FOREST_01 " ) >=  10000 )) ;
	{
		return TRUE;
	};
};

func void dia_mika_gohome_info()
{
	AI_Output(self,other, " DIA_Mika_GoHome_01_00 " );	// There ain't no orcs here, mate!
	AI_Output(self,other, " DIA_Mika_GoHome_01_01 " );	// So I better get back to town.
	AI_Output(other,self, " DIA_Mika_GoHome_01_02 " );	// Hey, wait...
	MIKATELLORKSDONE = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Mika_Zack(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_Zack_Condition;
	information = DIA_Mika_Zack_Info;
	important = TRUE;
};


func int DIA_Mika_Zack_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 500) && !Npc_IsDead(Alvares) && !Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_Zack_Info()
{
	AI_Output(self,other, " DIA_Mika_Zack_12_00 " );	// Now watch how it's done.
	Info_AddChoice(DIA_Mika_Zack,Dialog_Ende,DIA_Mika_Zack_los);
};

func void DIA_Mika_Zack_los()
{
	AI_StopProcessInfos(self);
	if ( ! Npc_IsDead(Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE ;
	};
	if ( ! Npc_IsDead(Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE ;
	};
};

instance DIA_Mika_WIEDERNACHHAUSE (C_Info)
{
	npc = Mil_337_Mika;
	nr = 9;
	condition = DIA_Mika_WIEDERNACHHAUSE_Condition;
	information = DIA_Mika_WIEDERNACHHAUSE_Info;
	important = TRUE;
};

func int DIA_Mika_WIEDERNACHHAUSE_Condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 10000) && Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info()
{
	AI_Output(self,other, " DIA_Mika_WIEDERNACHHAUSE_12_00 " );	// That's it! I can go back.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"Start");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Mika_Kap3_EXIT(C_Info)
{
	npc = Mil_337_Mika;
	nr = 999;
	condition = DIA_Mika_Kap3_EXIT_Condition;
	information = DIA_Mika_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mika_Kap3_EXIT_Condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mika_Kap3u4u5_PERM(C_Info)
{
	npc = Mil_337_Mika;
	nr = 39;
	condition = DIA_Mika_Kap3u4u5_PERM_Condition;
	information = DIA_MIKA_CAP_PERM_Info;
	permanent = TRUE;
	description = " Is everything quiet? " ;
};


func int DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if ((Capital >=  3 ) && Npc_KnowsInfo(other,DIA_Mika_WOHIN) && Npc_IsDead(Alvares) && Npc_IsDead(Engardo));
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output(other,self,"DIA_Mika_Kap3u4u5_PERM_15_00");	//Все тихо?
	AI_Output(self,other, " DIA_Mika_Kap3u4u5_PERM_12_01 " );	// Are you still alive? Wow!
};


instance DIA_Mika_PICKPOCKET(C_Info)
{
	npc = Mil_337_Mika;
	nr = 900;
	condition = DIA_Mika_PICKPOCKET_Condition;
	information = DIA_Mika_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mika_PICKPOCKET_Condition()
{
	return  C_Robbery ( 65 , 75 );
};

func void DIA_Mika_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
	Info_AddChoice(DIA_Mika_PICKPOCKET,Dialog_Back,DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mika_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

instance DIA_Mika_Key(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_Key_Condition;
	information = DIA_Mika_Key_Info;
	permanent = FALSE;
	description = " Did you find any clue here? " ;
};

func int DIA_Mika_Key_Condition()
{
	if (( MY_Constantine_LostKey == LOG_Running ) && ( MikaHaveKey ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Mika_Key_Info()
{
	AI_Output(other,self, " DIA_Mika_Key_01_00 " );	// Did you find any key here?
	AI_Output(self,other, " DIA_Mika_Key_01_01 " );	// Found. There he was lying under that tree. Looks like someone accidentally dropped it.
	AI_Output(other,self, " DIA_Mika_Key_01_02 " );	// Could you give it to me?
	AI_Output(self,other, " DIA_Mika_Key_01_03 " );	// Of course, mate. What are we talking about.
	AI_Output(self,other, " DIA_Mika_Key_01_04 " );	// Only for this you will pay me, say... fifty gold coins. Deal?
	AI_Output(other,self, " DIA_Mika_Key_01_05 " );	// Isn't it too much for some kind of key?
	AI_Output(self,other, " DIA_Mika_Key_01_06 " );	// I won't give it to you cheaper. So if you really need it, you will have to fork out.
	B_LogEntry(TOPIC_Constantino_LostKey, " Mick found Constantino's key. But he'll only give it to me for fifty coins. " );
};

instance DIA_Mika_KeyDone(C_Info)
{
	npc = Mil_337_Mika;
	nr = 8;
	condition = DIA_Mika_KeyDone_Condition;
	information = DIA_Mika_KeyDone_Info;
	permanent = TRUE;
	description = " Give me the key here. " ;
};

func int DIA_Mika_KeyDone_Condition()
{
	if ((MIS_Constantino_LostKey == LOG_Running) && (MikaGiveKey ==  FALSE ) && (Npc_KnowsInfo(other,DIA_Mika_Key) ==  TRUE ) && (MikaHaveKey ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Mika_KeyDone_Info()
{
	AI_Output(other, self, " DIA_Mika_KeyDone_01_00 " );	// Give me the key here.
	AI_Output(self,other,"DIA_Mika_KeyDone_01_01");	//А деньги?

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		Npc_RemoveInvItems(self,ItMi_Gold,50);
		AI_Output(other,self, " DIA_Mika_KeyDone_01_02 " );	// Here, there are fifty gold coins.
		AI_Output(self,other, " DIA_Mika_KeyDone_01_03 " );	// Good. Then hold your key.
		B_GiveInvItems(self,other,ItKe_Constantino,1);
		AI_Output(self,other, " DIA_Mika_KeyDone_01_04 " );	// Fair deal, isn't it?
		AI_Output(other,self,"DIA_Mika_KeyDone_01_05");	//Да уж.
		MikaGiveKey = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Mika_KeyDone_01_06 " );	// I don't have that much money yet.
		AI_Output(self,other, " DIA_Mika_KeyDone_01_07 " );	// Then find them. For now, I'll have the key.
	};
};

instance DIA_Mika_Werewolf(C_Info)
{
	npc = Mil_337_Mika;
	nr = 3;
	condition = DIA_Mika_Werewolf_Condition;
	information = DIA_Mika_Werewolf_Info;
	permanent = FALSE;
	description = " Have you heard anything about attacks on people lately? " ;
};

func int DIA_Mika_Werewolf_Condition()
{
	if(MIS_WolfAndMan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mika_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Mika_Werewolf_01_00 " );	// Have you heard anything about attacks on people lately?
	AI_Output(self,other, " DIA_Mika_Werewolf_01_01 " );	// Yes, it was. Recently, at the Akila farm, one of the peasants was killed by some beast.
	AI_Output(other,self, " DIA_Mika_Werewolf_01_02 " );	// Did you do something about this?
	AI_Output(self,other, " DIA_Mika_Werewolf_01_03 " );	// Well, Lord Andre sent some of his guys there.
	AI_Output(self,other, " DIA_Mika_Werewolf_01_04 " );	// But apart from traces of blood and torn clothes, they found nothing there.
	AI_Output(self,other, " DIA_Mika_Werewolf_01_05 " );	// Apparently, the monster took its prey far into the forest.
	B_LogEntry(TOPIC_WolfAndMan, " According to Micah, one of the peasants at Akila's farm was recently killed by some beast. " );
};


// ----------------------guard------------------------ ---------------

const string Mil_360_Checkpoint = "NW_CASTLEMINE_PATH_02";

instance DIA_Mil_360_Miliz_EXIT (C_Info)
{
	npc = Mil_360_Miliz;
	nr = 999;
	condition = DIA_Mil_360_Miliz_EXIT_Condition;
	information = DIA_Mil_360_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_360_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DAY_Thousand_360_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_360_Miliz_FirstWarn(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 1;
	condition = DIA_Mil_360_Miliz_FirstWarn_Condition;
	information = DIA_Mil_360_Miliz_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_360_Miliz_FirstWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (PasswordSet == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_360_Miliz_FirstWarn_03_00");	//СТОЙ!
	AI_Output(self,other, " DIA_Mil_360_Miliz_FirstWarn_03_01 " );	// There is no further passage! This is private property!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_360_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instances of DIA_Mil_360_Miliz_SecondWarn (C_Info)
{
	npc = Mil_360_Miliz;
	nr = 2;
	condition = DIA_Mil_360_Miliz_SecondWarn_Condition;
	information = DIA_Mil_360_Miliz_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_360_Miliz_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (PasswordSet == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_360_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_SecondWarn_Info()
{
	AI_Output(self,other, " DIA_Mil_360_Miliz_SecondWarn_03_00 " );	// I'm warning you for the last time. One more step and you will be acquainted with my sword.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_360_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_360_Miliz_Attack (C_Info)
{
	npc = Mil_360_Miliz;
	nr = 3;
	condition = DIA_Mil_360_Miliz_Attack_Condition;
	information = DIA_Mil_360_Miliz_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_360_Miliz_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (PasswordSet == FALSE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_360_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_Output(self,other, " DIA_Mil_360_Miliz_Attack_03_00 " );	// You asked for it...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

instance DIA_Mil_360_Miliz_FirstInTower(C_Info)
{
	npc = Mil_360_Miliz;
	nr = 3;
	condition = DIA_Mil_360_Miliz_FirstInTower_condition;
	information = DIA_Mil_360_Miliz_FirstInTower_info;
	permanent = TRUE;
	description = " Calm down! Here are the documents. " ;
};

func int DIA_Mil_360_Miliz_FirstInTower_condition()
{
	if((PasswordSet == FALSE) && (Npc_HasItems(other,ItWr_HagenLoanDocs) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_FirstInTower_info()
{
	AI_Output(other,self, " DIA_Mil_360_Miliz_FirstInTower_15_00 " );	// Calm down! Here are the documents.
	B_GiveInvItems(other,self,ItWr_HagenLoanDocs,1);
	AI_Output(self,other, " DIA_Mil_360_Miliz_FirstInTower_15_01 " );	// Well, let's take a look at them.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Mil_360_Miliz_FirstInTower_15_02 " );	// Hmmm... Everything seems to be in order! So you are the new owner?
	B_GiveInvItems(self,other,ItWr_HagenLoanDocs,1);
	AI_Output(other,self, " DIA_Mil_360_Miliz_FirstInTower_15_03 " );	// Everything is written there. Now let me into my tower!
	AI_Output(self,other, " DIA_Mil_360_Miliz_FirstInTower_15_04 " );	// Sure, go ahead. Any other orders?
	AI_Output(other,self, " DIA_Mil_360_Miliz_FirstInTower_15_05 " );	// Hmmm... Maybe other people will come here in the future. You will ask them for a password.
	AI_Output(other,self, " DIA_Mil_360_Miliz_FirstInTower_15_06 " );	// The password will be the phrase - 'Dragon Treasures'. Anyone who knows the password, you will miss. The rest - no!
	AI_Output(self,other, " DIA_Mil_360_Miliz_FirstInTower_15_07 " );	// Good. Will be done!
	PasswordSet = TRUE;
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Guard");
	B_StartOtherRoutine(Mil_361_Miliz,"Guard");
};

instance DIA_Mil_360_Miliz_PERM (C_Info)
{
	npc = Mil_360_Miliz;
	nr = 1;
	condition = DIA_Mil_360_Miliz_PERM_Condition;
	information = DIA_Mil_360_Miliz_PERM_Info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int DIA_Mil_360_Miliz_PERM_Condition()
{
	if(PasswordSet == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mil_360_Miliz_PERM_Info()
{
	AI_Output(other,self, " DIA_Mil_360_Miliz_PERM_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Mil_360_Miliz_PERM_03_01 " );	// All is well, friend!
};

instance DIA_Mil_361_Miliz_EXIT (C_Info)
{
	npc = Mil_361_Miliz;
	nr = 999;
	condition = DIA_Mil_361_Miliz_EXIT_Condition;
	information = DIA_Mil_361_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_361_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DAY_Mil_361_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_361_Miliz_Hello (C_Info)
{
	npc = Mil_361_Miliz;
	nr = 2;
	condition = DIA_Mil_361_Miliz_Hallo_Condition;
	information = DIA_Mil_361_Miliz_Hallo_Info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int DIA_Mil_361_Miliz_Hallo_Condition()
{
	if(PasswordSet == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mil_361_Miliz_Hallo_Info()
{
	AI_Output(other,self, " DIA_Mil_309_Stadtwache_Hallo_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Mil_309_Stadtwache_Hallo_06_01 " );	// All right! But we must be careful.
};

instance DIA_Mil_363_Miliz_EXIT (C_Info)
{
	npc = Mil_363_Miliz;
	nr = 999;
	condition = DIA_Mil_363_Miliz_EXIT_Condition;
	information = DIA_Mil_363_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_363_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DAY_Thousand_363_Thousand_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Mil_362_Miliz_EXIT (C_Info)
{
	npc = Mil_362_Miliz;
	nr = 999;
	condition = DIA_Mil_362_Miliz_EXIT_Condition;
	information = DIA_Mil_362_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Mil_362_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DAY_Thousand_362_Thousand_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
