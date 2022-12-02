
instance DIA_Orc_8567_UrKarras_EXIT(C_Info)
{
	npc = Orc_8567_UrKarras;
	nr = 999;
	condition = DIA_Orc_8567_UrKarras_Exit_Condition;
	information = DIA_Orc_8567_UrKarras_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Orc_8567_UrKarras_Exit_Condition()
{
	return TRUE;
};

func void DIA_Orc_8567_UrKarras_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8567_UrKarras_Hello(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Hello_Condition;
	information = DIA_Orc_8567_UrKarras_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Orc_8567_UrKarras_Hello_Condition()
{
	if(MIS_Orcwayhero == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Hello_Info()
{
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hello_01_01 " );	// Ur-Karras can't believe his eyes that a human is coming here...(surprised) What's a great shaman to do in an orc city?!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Hello_01_02 " );	// Let's just say I have some business here.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hello_01_03 " );	// Ur-Karras does not remember to foot a man once set foot in our city. To be surprised the orcs let you in here!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Hello_01_04 " );	// I have Ulu-mulu! I think you know that its owner enjoys your respect.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hello_01_05 " );	// Be like this. But Ur-Karras wants to warn the great shaman not to do anything wrong in the city.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hello_01_06 " );	// Otherwise, the orcs become evil and the Ulu-mulu will not help the man!
};

instance DIA_Orc_8567_UrKarras_Town(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Town_Condition;
	information = DIA_Orc_8567_UrKarras_Town_Info;
	permanent = FALSE;
	description = " What do you do in the city? " ;
};

func int DIA_Orc_8567_UrKarras_Town_Condition()
{
	if(MIS_Orcwayhero == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Town_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Town_01_01 " );	// What do you do in the city?
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Town_01_02 " );	// It seemed to me that all the orcs should now besiege the fortress of the paladins.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Town_01_03 " );	// Man be right, but Ur-Karras' place is always here. So command him Ur-Thrall!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Town_01_04");	//Почему?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Town_01_05 " );	// Ur-Karras be the commander of the great leader and see to it that there is order.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Town_01_06 " );	// All orc warriors that a man sees here, obey me. Ur-Karras tell them what to do.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Town_01_07 " );	// Ur-Karras himself obeys only the great leader and receives new orders from him.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Town_01_08 " );	// So you're like a captain of the guard here?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Town_01_09 " );	// Ur-Karras doesn't understand what the man is saying.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Town_01_10 " );	// But to think that the great shaman now little know why Ur-Karras be here.
};

instance DIA_Orc_8567_UrKarras_Chief(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Chief_Condition;
	information = DIA_Orc_8567_UrKarras_Chief_Info;
	permanent = FALSE;
	description = " Is Ur-Thrall your chieftain? " ;
};

func int DIA_Orc_8567_UrKarras_Chief_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8567_UrKarras_Town) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Chief_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Chief_01_01 " );	// Ur-Thrall is your leader?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Chief_01_02 " );	// Yes, be a great leader of the orcs! Be a very strong warrior and be very wise.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Chief_01_03 " );	// The strongest, you say?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Chief_01_04 " );	// Man don't doubt it! All brothers respect and fear Ur-Thrall.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Chief_01_05 " );	// Sons of spirits speak - Beliar himself will grant him protection.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Chief_01_06 " );	// Human don't even think to go kill Ur-Thrall! The person is dying very quickly.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Chief_01_07 " );	// And this was not in my thoughts!
};

instance DIA_Orc_8567_UrKarras_Clanname(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Clanname_Condition;
	information = DIA_Orc_8567_UrKarras_Clanname_Info;
	important = FALSE;
	permanent = FALSE;
	description = " What is your clan name? " ;
};

func int DIA_Orc_8567_UrKarras_Clanname_Condition()
{
	return TRUE;
};

func void DIA_Orc_8567_UrKarras_Clanname_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Clanname_01_01 " );	// What is your clan name?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Clanname_01_02 " );	// (proudly) Called the Black Dragon. Be the strongest clan of orc brothers in this land!

	if(Npc_KnowsInfo(hero,DIA_ORC_8550_URNAZUL_HELLO) == TRUE)
	{
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_Clanname_01_03 " );	// Clear. And I even guess where the name comes from.
	}
	else
	{
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_Clanname_01_04 " );	// Impressive!
	};
};


instance DIA_Orc_8567_UrKarras_WhatInteres(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_WhatInteres_Condition;
	information = DIA_Orc_8567_UrKarras_WhatInteres_Info;
	permanent = FALSE;
	description = " What is there to see in your city? " ;
};

func int DIA_Orc_8567_UrKarras_WhatInteres_Condition()
{
	return TRUE;
};

func void DIA_Orc_8567_UrKarras_WhatInteres_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_WhatInteres_01_01 " );	// What interesting things can be seen in your city?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_WhatInteres_01_02 " );	// Ur-Karras to think that a person will not find anything interesting for himself here.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_WhatInteres_01_03 " );	// And he shouldn't be here for a long time, or the orcs might get very angry with the humans!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_WhatInteres_01_04 " );	// Are you saying you shouldn't expect hospitality here?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_WhatInteres_01_05 " );	// Man understand correctly.
};

instance DIA_Orc_8567_UrKarras_UrTrall(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_UrTrall_Condition;
	information = DIA_Orc_8567_UrKarras_UrTrall_Info;
	important = FALSE;
	permanent = FALSE;
	description = " Where can I find a great leader? " ;
};

func int DIA_Orc_8567_UrKarras_UrTrall_Condition()
{
	if (MeetFarrok ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_UrTrall_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_UrTrall_01_01 " );	// Where can I find a great leader?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_UrTrall_01_02 " );	// The hall of the great leader Ur-Thrall is located in the center of the city. There to lead a small rise from the main entrance to the city.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_UrTrall_01_03 " );	// But a man is not allowed in unless he has any important news for Ur-Thrall.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_UrTrall_01_04 " );	// If a great shaman tries to enter there just like that, the orcs will get angry and kill the people.
};


// --------------------- Ur-Karras Quests----------------------- ------------------------------


instance DIA_Orc_8567_UrKarras_HelpRespect(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_HelpRespect_Condition;
	information = DIA_Orc_8567_UrKarras_HelpRespect_Info;
	important = FALSE;
	permanent = FALSE;
	description = " Can you help me get to Ur-Thrall? " ;
};

func int DIA_Orc_8567_UrKarras_HelpRespect_Condition()
{
	if ((MY_HeroOrcJoin == LOG_Running) && (HeroOrcJoinStart ==  FALSE ) && ( PASSORCCHAMBER  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_HelpRespect_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_HelpRespect_01_01 " );	// Can you help me get to Ur-Thrall?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_HelpRespect_01_02 " );	// Hmmm... Farrok won't let you see the Great Chief until you earn the respect of your brothers!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_HelpRespect_01_03 " );	// How can I do this?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_HelpRespect_01_04 " );	// A man must help his brothers or go fight in the great orc arena! Become Mor Dar like Ur-Karras.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_HelpRespect_01_05 " );	// How can I earn your trust?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_HelpRespect_01_06 " );	// Ur-Karras can give a human multiple tasks. If the latter fulfill them, then the brothers will respect the man more!
	B_LogEntry(TOPIC_HeroOrcJoin, " Ur-Karras has errands for me to complete to earn the respect of the orcs. Or go to the orc arena and earn the respect of the orcs with my sword. " );
	HeroOrcJoinStart = TRUE;
};

instance DIA_Orc_8567_UrKarras_FirstTask(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_FirstTask_Condition;
	information = DIA_Orc_8567_UrKarras_FirstTask_Info;
	important = FALSE;
	permanent = FALSE;
	description = " Tell me what I should do. " ;
};

func int DIA_Orc_8567_UrKarras_FirstTask_Condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (HeroOrcJoinStart == TRUE) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_FirstTask_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_01 " );	// Tell me what to do.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_02 " );	// Good. The man listen to Ur-Karras carefully.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_03 " );	// When a man meet Ur-Karras, then ask him what Ur-Karras do in the land of men.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_04 " );	// Now Ur-Karras will respond. His squad is heading there to retrieve one very rare trophy that Ur-Thrall needs.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_05 " );	// Interesting. And what is the trophy?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_06 " );	// Ur-Karras was supposed to get Muritan's poisonous fang for the chieftain.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_07 " );	// Muritana?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_08 " );	// Be a huge and ferocious wild beast. Be very rare and dangerous!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_09 " );	// So you were out there hunting that monster?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_10 " );	// Man be right. Our scouts say that to see this big beast in Khorinis.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_11 " );	// Ur-Karras take five of our clan's best hunters with him and go in search of him.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_12 " );	// At night we cross the mountains and go to where the orcs see Muritan for the last time.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_13 " );	// And what happened next?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_14 " );	// We want to ambush... (sadly) But they themselves become prey!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_15 " );	// The monster will attack us suddenly and immediately kill two orc hunters.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_16 " );	// Only Ur-Karras to stay alive from the entire squad, but be badly wounded.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_17 " );	// If not for the man, Muritan's poison would eventually kill him too!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_18 " );	// Ur-Karras is very sad that he could not fulfill the order of the leader... But maybe the man can do it?
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_19 " );	// Do you think I can handle something that your whole squad couldn't handle?!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_20 " );	// Ur-Karras wants a person to try it.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_23 " );	// Okay, we'll have to kill this creature. Where to look for it?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_24 " );	// Ur-Karras think that a man find Muriatan in the forest near the city people.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_25 " );	// Somewhere in the rock there is a large and deep cave. There's a monster to kill all the brothers of Ur-Karras!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_26 " );	// I'll try to find this place.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_27 " );	// If the human manages to kill the Muritan, he will remember to bring Ur-Karras the poison fang.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_28 " );	// But be careful - its poison can easily kill a person!


	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
	{
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_29 " );	// Don't worry! I'm pretty good at hunting.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_30 " );	// Then Ur-Karras wish the man a good hunt and wait for him here.
	}
	else
	{
		UrKarrasCanTeach = TRUE;
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_32 " );	// Looks like I'll have to learn this first.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_33 " );	// If a man wants - Ur-Karras show him how to properly take the monster's fangs.
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTask_01_34 " );	// Okay, I'll think about it.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTask_01_35 " );	// Then Ur-Karras wish the man a good hunt and wait for him here.
	};

	MIS_HeroOrcJoin_T1 = LOG_Running;
	MuritanS1 = TRUE ;
	Log_CreateTopic(TOPIC_HeroOrcJoin_T1,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin_T1,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin_T1, " Ur-Karras's first assignment was rather difficult. I'll have to find a dangerous creature in Khorinis - Muritan - and rip out its poisonous fangs. High Warlord Ur-Thrall himself wants this trophy, so I didn’t have time to think at all . Orc scouts saw this monster not far from the city, at the bottom of a hollow with a huge cave. " );
};

instance DIA_Orc_8567_UrKarras_Teeth(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Teeth_Condition;
	information = DIA_Orc_8567_UrKarras_Teeth_Info;
	permanent = FALSE;
	description = " Show me how to rip out fangs. " ;
};

func int DIA_Orc_8567_UrKarras_Teeth_Condition()
{
	if((UrKarrasCanTeach == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Teeth_Info()
{
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy, " Now I can: " );
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
	AI_Print( " Learned the skill of butchering prey - 'Pull out teeth and fangs' " );
	B_LogEntry_Quiet(TOPIC_TalentAnimalTrophy, " ...pull out teeth and fangs. " );
	Npc_SetTalentSkill(other,NPC_TALENT_TAKEANIMALTROPHY,1);
	Snd_Play("LevelUP");
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Teeth_01_01 " );	// Show me how to rip out fangs.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Teeth_01_02 " );	// It shouldn't be very hard, man.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Teeth_01_03 " );	// You need to put the knife approximately in the middle of the tooth or fang, and then gently pick it out. Then it won't break.
};

instance DIA_Orc_8567_UrKarras_Hunt(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Hunt_Condition;
	information = DIA_Orc_8567_UrKarras_Hunt_Info;
	permanent = FALSE;
	description = " Why were you sent to find Muritan? " ;
};

func int DIA_Orc_8567_UrKarras_Hunt_Condition()
{
	if ( MIS_HeroOrcJoin_T1 !=  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Hunt_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Hunt_01_01 " );	// And why were you sent to find Muritan?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hunt_01_02 " );	// Tag-Nor will not be in the city of brothers then... Therefore, the leader should send Ur-Karras!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Hunt_01_04 " );	// Who is Tag-Nor?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hunt_01_05 " );	// To be the best orc hunter here! For many winters to hunt wild animals, to bring brothers a lot of prey.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Hunt_01_06 " );	// Where can I find it?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hunt_01_07 " );	// Tag-Nor is usually near the entrance to the orc iron mine. Man look for it there.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hunt_01_08 " );	// Only Ur-Karras wants to give advice to a man if one goes to him.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Hunt_01_09 " );	// What's another tip?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hunt_01_10 " );	// Tag-Nor just won't talk to a human. He should get his respect.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Hunt_01_11 " );	// And how can I do this?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hunt_01_12 " );	// Human kill Muritana first!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hunt_01_13 " );	// Muritan must have two poison fangs. One person to give to Ur-Karras, and the other to carry Tag-Nora!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hunt_01_14 " );	// Then Tag-Nor will respect him and talk to him.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_Hunt_01_15 " );	// Is there any other way?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_Hunt_01_16 " );	// Still Tag-Nor really appreciate the skin of a big black troll! A person can bring it.
	TagNorTell = TRUE;
};

instance DIA_Orc_8567_UrKarras_FirstTaskDone(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_FirstTaskDone_Condition;
	information = DIA_Orc_8567_UrKarras_FirstTaskDone_Info;
	permanent = TRUE;
	description = " I'm talking about Muritan... " ;
};

func int DIA_Orc_8567_UrKarras_FirstTaskDone_Condition()
{
	if(MIS_HeroOrcJoin_T1 == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_FirstTaskDone_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_01 " );	// I'm talking about Muritan...
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_02 " );	// Man have something to say to Ur-Karras?

	if(Npc_HasItems(other,ItAt_BuritanTooth) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_03 " );	// I managed to get the trophy that the chief wanted.
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_04 " );	// Here, you can take it.
		B_GiveInvItems(other,self,ItAt_BuritanTooth,1);
		Npc_RemoveInvItems(self,ItAt_BuritanTooth,1);

		if(Trophy_MuritanTooth  == TRUE)
		{
			if ((Npc_HasItems(other,ItAt_PW_MuritanTooth) ==  FALSE ) && (Npc_HasItems(other,ItAt_BuritanTooth) ==  FALSE ))
			{
				Ext_RemoveFromSlot(other,"BIP01 PELVIS");
				Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
				Trophy_MuritanTooth  = FALSE;
			};
		};

		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_05 " );	//Arghhh!!!...(respectfully ) Human be able to kill Muritan! Be very good.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_06 " );	// Now Ur-Karras can see that he doesn't make mistakes when sending a man to kill Muritan.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_07 " );	// For this, Ur-Karras will respect him even more, and think that the other orcs will too.

		if(SBMODE == TRUE)
		{
			AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_08 " );	// Do you know why your leader needed this fang?
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_09 " );	// Ur-Thrall don't say this to Ur-Karras. A person can try to ask him about it himself.
			UrTrallTalkTooth = TRUE;
		};

		T1_OrcTask_Done = TRUE;
		ORCRESPECT = ORCRESPECT + 10;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 10 " );
		};

		MIS_HeroOrcJoin_T1 = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin_T1,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin_T1, " I brought Muritan's fang to Ur-Karras. He was very pleased and said it would surely make the orcs respect me even more. I guess I'm on the right track... " );

	}
	else if(MuritanS3 == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_11 " );	// I have bad news for you.
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_12 " );	// I tracked down and killed Muritan, but I couldn't take his poisonous fangs.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_13 " );	// Arghhh... Human not bring fang to Ur-Karras?! It be very bad!
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_14 " );	// Now other orcs don't believe a man that he kill a monster if he doesn't have this fang.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_15 " );	// Brothers won't respect a man!
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_16 " );	// And what should I do now?
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_17 " );	// Ur-Karras does not know this. But to think that a man must still help the orcs, so that they respect him.
		MIS_HeroOrcJoin_T1 = LOG_FAILED;
		T1_OrcTask_Done = TRUE;
		B_LogEntry_Failed(TOPIC_HeroOrcJoin_T1);
	}
	else
	{
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_19 " );	// Not yet.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_FirstTaskDone_01_20 " );	// Then man better not waste time and go kill Muritan!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Orc_8567_UrKarras_SecondTask(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_SecondTask_Condition;
	information = DIA_Orc_8567_UrKarras_SecondTask_Info;
	important = FALSE;
	permanent = FALSE;
	description = " Do you have any more tasks for me? " ;
};

func int DIA_Orc_8567_UrKarras_SecondTask_Condition()
{
	if (( MIS_HeroOrcJoin == LOG_Running ) && ( T1_OrcTask_Done ==  TRUE ) && ( OrcsClan_CHK_01 ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_SecondTask_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTask_01_01 " );	// Do you have any more tasks for me?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTask_01_02 " );	// Brother human want to help the orcs again? Ur-Karras can give him one more task.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTask_01_03 " );	// Get to the point then. What is required of me?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTask_01_04 " );	// The person must go to the valley, where there is a large fortress of paladins.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTask_01_05 " );	// High in the mountains, in the north, be a large clan of High Rock orcs.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTask_01_06 " );	// Ur-Karras has a very important message for their leader. Man must pass it on!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_07");	//Это все?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTask_01_08 " );	// That's all for now. Isn't that enough for a person?
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTask_01_09 " );	// I was hoping for something more fun.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTask_01_10 " );	// Ur-Karras understand what brother man is thinking. But he must know that it is very important for the orcs!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTask_01_11 " );	// Okay, give this message here.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTask_01_12 " );	// Here! Man take this scroll and carry it to the leader of the High Rock.
	B_GiveInvItems(self,other,ItWr_UrKarrasLetter,1);
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTask_01_13 " );	// Then return to Ur-Karras and tell him what to say.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTask_01_14 " );	// Now man step. Ur-Karras wait for him here.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTask_01_15 " );	// I'll be right back.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_16");	//Аргххх...(одобряюще)
	MIS_HeroOrcJoin_T2 = LOG_Running;
	Log_CreateTopic(TOPIC_HeroOrcJoin_T2,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin_T2, " Ur-Karras has given me another errand. I need to go to the Valley of the Mines and find the Highrock chief there to give him Ur-Karras' message. " );
};

instance DIA_Orc_8567_UrKarras_SecondTaskDone(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_SecondTaskDone_Condition;
	information = DIA_Orc_8567_UrKarras_SecondTaskDone_Info;
	permanent = FALSE;
	description = " Regarding your errand... " ;
};

func int DIA_Orc_8567_UrKarras_SecondTaskDone_Condition()
{
	if((MIS_HeroOrcJoin_T2 == LOG_Running) && ((OrcTraitor == TRUE) || (OrcClanBossLetterDeliver == TRUE) || (OrcFailInvte == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_SecondTaskDone_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_01 " );	// About your order...

	if(OrcClanBossLetterDeliver == TRUE)
	{
		B_GivePlayerXP(500);
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_02 " );	// Ur-Karras listen carefully to what the man says to him.
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_03 " );	// I have conveyed your message to the chieftain of the Highrock Orcs.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_04 " );	// And what to answer the leader?
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_05 " );	// He said his clan agreed to your proposal. True, he did not specify which ...
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_06 " );	//Arghhh...(approvingly ) Ur-Karras be very pleased with this news! Brother man do things right.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_07 " );	// Orcs will respect him even more for this!
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_08 " );	// Now Ur-Karras needs to think long and hard. Brother man can go for now.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_09 " );	// If Ur-Karras needs him again, send for him.
		ORCRESPECT = ORCRESPECT + 15;
		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 15 " );
		};
		T2_OrcTask_Done = TRUE;
		MIS_HeroOrcJoin_T2 = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin_T2, " I passed Warchief Ur-Karras' reply on. He seemed to be very pleased with the answer. " );
		AI_StopProcessInfos(self);
	};
	if(OrcFailInvte == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_11 " );	// Ur-Karras listen carefully to what the man says to him.
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_12 " );	// I couldn't send a message to the High Rock chief because he's dead.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_13 " );	// Arghhh... That must be very bad news! Ur-Karras is very sad that the man could not fulfill his order.
		AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_14 " );	// And what should we do now?
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_15 " );	// Now Ur-Karras has to think a lot, and brother man can walk for now.
		AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_16 " );	// If Ur-Karras needs him again, send for him.
		MIS_HeroOrcJoin_T2 = LOG_Success;
		T2_OrcTask_Done = TRUE;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin_T2, " I informed Ur-Karras that I was unable to deliver his message to the Chieftain of the Highrock clan. He must have been greatly distressed by this news. " );
		AI_StopProcessInfos(self);
	};
	if(OrcTraitor == TRUE)
	{
		if(UrKarrasGonezIsDead == TRUE)
		{
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_18 " );	// Ur-Karras listen carefully to what the man says to him.
			AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_19 " );	// I failed to deliver a message to the High Rock Clan Chief.
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_20 " );	// Arghhh... That's too bad! Ur-Karras is very sad that the man could not fulfill his order.
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_21 " );	// But what prevented him from doing this?
			AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_22 " );	// Umm... I accidentally lost it.
			AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_23 " );	// But you can give me another letter, and this time I promise to lose it!
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_24 " );	// No... (terribly) Ur-Karras can't take that risk anymore.
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_25 " );	// Now he has to think a lot and for a long time, but a person can still go.
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_26 " );	// If Ur-Karras needs him again, send for him.
			AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_27 " );	// Then I'll probably go.
			MIS_HeroOrcJoin_T2 = LOG_Success;
			T2_OrcTask_Done = TRUE;
			Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_SUCCESS);
			B_LogEntry(TOPIC_HeroOrcJoin_T2, " Damn! Ur-Karras finally found out that I was in the paladin stronghold and talked to them. He accused me of treason, and now I better not get in his eyes again. " );
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_28 " );	// You shouldn't have come here, man... (terribly) Ur-Karras already knows everything!
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_29 " );	// My scouts say you're in a paladin's stronghold instead of talking to Highrock Chieftain.
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_30 " );	// He think the man will betray Ur-Karras and his brothers!
			AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_31 " );	// Heh... Did you really think that I would help you, vile creatures?
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_32 " );	// Arghhh...(viciously) Man still regret that betray us!
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_33 " );	// Now Ur-Karras does not order his brothers to kill humans.
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_34 " );	// He remember what thats to do for him. But now the man will no longer be his brother!
			AI_Output(self,other, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_35 " );	// If Ur-Karras sees a man in the city again, he will die!
			AI_Output(other,self, " DIA_Orc_8567_UrKarras_SecondTaskDone_01_36 " );	// (sarcastically) You're so generous, orc.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_36");	//Аргххх...(злобно)
			MIS_HeroOrcJoin_T2 = LOG_Failed;
			B_LogEntry_Failed(TOPIC_HeroOrcJoin_T2);
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Orc_8567_UrKarras_PaladinGoods(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinGoods_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinGoods_Info;
	permanent = FALSE;
	description = " Any more errands for me? " ;
};

func int DIA_Orc_8567_UrKarras_PaladinGoods_Condition()
{
	if ((T2_OrcTask_Done ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinGoods_01_01 " );	// Any more errands for me?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_01_02 " );	// Ur-Karras think not... Unless a human wants to help brothers fight against humans.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinGoods_01_03 " );	// And what did you think?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_01_04 " );	// The person should go to the paladin stronghold. Look for their food warehouse there and destroy it!
	Info_ClearChoices(DIA_Orc_8567_UrKarras_PaladinGoods);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinGoods, " No, I wouldn't do that for anything. " ,DIA_Orc_8567_UrKarras_PaladinGoods_No);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinGoods, " I'll do it. " ,DIA_Orc_8567_UrKarras_PaladinGoods_Yes);
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_Yes()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_01 " );	// Okay, I'll do it.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_02 " );	// (surprised) I'm a little surprised that a person would agree to such a thing.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_03 " );	// The brothers are very much helped if the paladins are left without food.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_04 " );	// Since we can't beat them from the outside, we have to try from the inside!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_05 " );	// Maybe then they'll starve each other to death.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_06 " );	// But man be careful. Lest the paladins guess!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_07 " );	// Ur-Karras think they trust the man. Be good!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_08 " );	// I understand, Ur-Karras. I'm leaving immediately.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_09 " );	// Ur-Karras wish good luck man!
	MIS_PaladinGoods = LOG_Running;
	Log_CreateTopic(TOPIC_PaladinGoods,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PaladinGoods,LOG_Running);
	B_LogEntry(TOPIC_PaladinGoods, " It looks like the situation in the Vale of Mines is starting to heat up. Ur-Karras is eager to break the resistance of the paladins in the fortress, but since all previous attempts to storm the castle have failed, he decided to act differently. So my next task was to destroy the food stores of the paladins. Ur -Karras has no doubts that hunger should undermine the strength of the defenders. I think the best way to deal with this is fire... " );
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_No()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinGoods_No_01_01 " );	// No, I won't do that!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_No_01_02 " );	// Ur-Karras understand why a man refuse! He doesn't want to betray his people.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_No_01_03 " );	// Ur-Karras don't be mad at this. Still respect the person.
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8567_UrKarras_PaladinGoods_Done(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinGoods_Done_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinGoods_Done_Info;
	permanent = FALSE;
	description = " The paladin stronghold will soon be starving. " ;
};

func int DIA_Orc_8567_UrKarras_PaladinGoods_Done_Condition()
{
	if((MIS_PaladinGoods == LOG_Running) && (PaladinGoodsBurned == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_01 " );	// The paladin stronghold will soon be starving.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_02 " );	// (pretty) NICAR HTAG. Very well!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_03 " );	// Soon they will become weak, and then we will capture their castle!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_04 " );	// If I were you, I wouldn't be so presumptuous, Ur-Karras.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_05 " );	// Paladins' faith is still too strong to be broken by simple hunger.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_06 " );	// Plus, the magic given to them by Innos is still with them.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_07 " );	// Yes, man be right. But this does not change the plans of the orcs to capture this fortress at any cost!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_08 " );	// Ur-Karras to thank a person for fulfilling his request.
	ORCRESPECT = ORCRESPECT + 20;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 20 " );
	};

	MIS_PaladinGoods = LOG_Success;
	Log_SetTopicStatus(TOPIC_PaladinGoods,LOG_SUCCESS);
	B_LogEntry(TOPIC_PaladinGoods, " I reported to Ur-Karras that the paladin food stores in the fortress had been destroyed. He was pleased with this message. " );
};

instance DIA_Orc_8567_UrKarras_PaladinCamp(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinCamp_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinCamp_Info;
	important = FALSE;
	permanent = FALSE;
	description = " Do you still need my help? " ;
};

func int DIA_Orc_8567_UrKarras_PaladinCamp_Condition()
{
	if((MIS_PaladinGoods == LOG_Success) && (PaladinCampCostDestroyed == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinCamp_Info()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinCamp_01_01 " );	// Do you still need my help?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_01_02 " );	// Ur-Karras think so... But this will be my last assignment.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_01_03 " );	// If a person fulfills it, then finally earn the respect of the orcs.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinCamp_01_04 " );	// Then lay out what it is?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_01_05 " );	// Scouts from Ur-Karras say they see a small band of paladins near the coast.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_01_06 " );	// Ur-Karras does not know how they get there and their plans. But they must not be allowed to break back into the castle!
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinCamp_01_07 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_01_08 " );	// (smartly) Man hasn't figured it out yet? Want a person to find that squad and kill everyone.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_01_09 " );	// Ur-Karras say everything. The rest is up to you!
	Info_ClearChoices(DIA_Orc_8567_UrKarras_PaladinCamp);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinCamp, " No, this is too much. " ,DIA_Orc_8567_UrKarras_PaladinCamp_No);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinCamp, " I'll deal with them! " ,DIA_Orc_8567_UrKarras_PaladinCamp_Yes);
};


func void DIA_Orc_8567_UrKarras_PaladinCamp_No()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinCamp_No_01_01 " );	// No, this is too much.
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_No_01_02 " );	// Good! Then Ur-Karras has no more errands for humans.
	Info_ClearChoices(DIA_Orc_8567_UrKarras_PaladinCamp);
};

func void DIA_Orc_8567_UrKarras_PaladinCamp_Yes()
{
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinCamp_Yes_01_01 " );	// I'll deal with them!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_Yes_01_02 " );	// Have a good trip, man!
	MIS_PaladinCamp = LOG_Running;
	Log_CreateTopic(TOPIC_PaladinCamp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PaladinCamp,LOG_Running);
	B_LogEntry(TOPIC_PaladinCamp, " Ur-Karras gave me one last task. I need to find and destroy a group of paladins located near the coast. I hope my conscience will not be tormented later... " );
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8567_UrKarras_PaladinCamp_Done(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinCamp_Done_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinCamp_Done_Info;
	important = FALSE;
	permanent = FALSE;
	description = " The paladin squad has been destroyed! " ;
};

func int DIA_Orc_8567_UrKarras_PaladinCamp_Done_Condition()
{
	if (( MY_PaladinCamp == LOG_Running ) && ( ALBERTISDEAD  ==  TRUE ) && ( PAL_7518_ISDEAD  ==  TRUE ) && ( PAL_7519_ISDEAD  ==  TRUE ) && ( PAL_7521_ISDEAD  ==  TRUE ) && ( PAL_7521_ISDEAD  ==  TRUEDE ) && ( _AD_AD  )  && ( PAL_7524_ISDEAD == TRUE ))  
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinCamp_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_01 " );	// The paladin squad has been destroyed, just like you wanted.
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_02 " );	// And thus you prove that you are worthy of our respect!
	AI_Output(self,other, " DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_03 " );	// Ur-Karras to bow before a great warrior, what a man is.
	AI_Output(other,self, " DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_04 " );	// I am extremely flattered.
	ORCRESPECT = ORCRESPECT + 25;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 25 " );
	};

	MIS_PaladinCamp = LOG_Success;
	Log_SetTopicStatus(TOPIC_PaladinCamp,LOG_SUCCESS);
	B_LogEntry(TOPIC_PaladinCamp, " I arrived at Ur-Karras with the news that a band of paladins had been destroyed. The orc warlord was very pleased with me. " );
	AI_StopProcessInfos(self);
};
