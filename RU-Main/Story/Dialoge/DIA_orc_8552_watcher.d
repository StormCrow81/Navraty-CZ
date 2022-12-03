

instance DIA_ORC_8552_WATCHER_EXIT(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_exit_condition;
	information = dia_orc_8552_watcher_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8552_watcher_exit_condition()
{
	return TRUE;
};

func void dia_orc_8552_watcher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8552_WATCHER_HELLO(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_hello_condition;
	information = dia_orc_8552_watcher_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8552_watcher_hello_condition()
{
	return TRUE;
};

func void dia_orc_8552_watcher_hello_info()
{
	AI_ReadyMeleeWeapon(self);
	Snd_Play("ORC_Angry");
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_01 " );	// GROTAK NABAR!!!
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_02");	//Человек!?
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_03 " );	// Wearing an Oooo-Mula!?
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_04 " );	// Outlander be a strong warrior - orcs respect a strong warrior! Orcs don't kill the outsider.
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_05 " );	// Why would a person come here?
	AI_Output(other,self, " DIA_Orc_8552_Watcher_Hello_Info_18_06 " );	// I need to talk to the orcs about a very important matter.
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_07 " );	// Human come to speak with orcs. Good.
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_08 " );	// Outsider can talk to orcs. Stranger wear Ulu-Mulu - orcs respect the stranger!
	AI_Output(other,self, " DIA_Orc_8552_Watcher_Hello_Info_18_12 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_10 " );	// Outsider seek Ur-Thrall! Be a great orc leader, be a great warrior.
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_11 " );	// Stranger to talk to him about business.
	AI_Output(other,self, " DIA_Orc_8552_Watcher_Hello_Info_18_16 " );	// Where can I find Ur-Thrall?
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_13 " );	// Stranger go further into the depths of the mountain. Stranger come to town and look there.
	AI_Output(other,self,"DIA_Orc_8552_Watcher_Hello_Info_18_14");	//Понятно.
	AI_Output(self,other, " DIA_Orc_8552_Watcher_Hello_Info_18_15 " );	// Now the alien go.
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
};

instance DIA_ORC_8552_WATCHER_DRINK(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_DRINK_condition;
	information = dia_orc_8552_watcher_DRINK_info;
	permanent = FALSE;
	description = " Why are you always looking down? " ;
};

func int dia_orc_8552_watcher_DRINK_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8552_Watcher_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_orc_8552_watcher_DRINK_info()
{
	AI_Output(other,self, " DIA_Orc_8552_Watcher_DRINK_01_01 " );	// Why are you always looking down?
	AI_Output(self,other, " DIA_Orc_8552_Watcher_DRINK_01_02 " );	// Wah Grosh drop your flask of grog there... (shaking his head) Be very tasty grog!
	AI_Output(other,self, " DIA_Orc_8552_Watcher_DRINK_01_03 " );	// So go downstairs and get her.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other, " DIA_Orc_8552_Watcher_DRINK_01_04 " );	// Be very dark downstairs! Wah Grosh will be looking for her for a very long time.
	AI_Output(self,other, " DIA_Orc_8552_Watcher_DRINK_01_05 " );	// And your Grosh cannot leave his place for a long time.
	AI_Output(self,other, " DIA_Orc_8552_Watcher_DRINK_01_06 " );	// Otherwise, Farrok will be angry, Ur-Thrall will be angry, beat Vah Grosh!
	AI_Output(other,self, " DIA_Orc_8552_Watcher_DRINK_01_07 " );	// I understand you must not leave your post.
	MIS_GroshBottle = LOG_Running;
	Log_CreateTopic(TOPIC_GroshBottle,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GroshBottle,LOG_Running);
	B_LogEntry(TOPIC_GroshBottle, " Vah Grosh, guard at the bridge, dropped his grog flask down. He can't go down for it, because he can't leave his post for long. " );
};

instance DIA_ORC_8552_WATCHER_DRINK_Done(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_DRINK_Done_condition;
	information = dia_orc_8552_watcher_DRINK_Done_info;
	permanent = FALSE;
	description = " Here's your flask. " ;
};

func int dia_orc_8552_watcher_DRINK_Done_condition()
{
	if((MIS_GroshBottle == LOG_Running) && (Npc_HasItems(other,ItMi_GroshBottle) >= 1))

	{
		return TRUE;
	};
};

func void dia_orc_8552_watcher_DRINK_Done_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Orc_8552_Watcher_DRINK_Done_01_01 " );	// Here's your flask.
	B_GiveInvItems(other,self,ItMi_GroshBottle,1);
	Npc_RemoveInvItems(self,ItMi_GroshBottle,1);
	AI_Output(self,other, " DIA_Orc_8552_Watcher_DRINK_Done_01_02 " );	// URAT GIFT! Wah Grosh can now drink his grog again!
	AI_Output(self,other, " DIA_Orc_8552_Watcher_DRINK_Done_01_03 " );	// He is very grateful to the man that he helps Wah Grosh.
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_Done_01_04");	//Да не за что.
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 5 " );
	};

	MIS_GroshBottle = LOG_Success;
	Log_SetTopicStatus(TOPIC_GroshBottle,LOG_Success);
	B_LogEntry(TOPIC_GroshBottle, " I brought Wah Grosh his flask. " );
};


// -------------------------------- mine guard in town------ --------------------------------------------------


instance DIA_ORC_8901_GuardMine_EXIT(C_Info)
{
	npc = OrcWarrior_GuardMine;
	condition = DIA_ORC_8901_GuardMine_exit_condition;
	information = DIA_ORC_8901_GuardMine_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_ORC_8901_GuardMine_exit_condition()
{
	return TRUE;
};

func void DIA_ORC_8901_GuardMine_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8901_GuardMine_HELLO(C_Info)
{
	npc = OrcWarrior_GuardMine;
	condition = DIA_ORC_8901_GuardMine_hello_condition;
	information = DIA_ORC_8901_GuardMine_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_ORC_8901_GuardMine_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_ORC_8901_GuardMine_hello_info()
{
	AI_Output(self,other, " DIA_ORC_8901_GuardMine_hello_01_01 " );	// (terribly) CAR NATARAK! What man should be from Turrak?
};

instance DIA_ORC_8901_GuardMine_Enter(C_Info)
{
	npc = OrcWarrior_GuardMine;
	condition = DIA_ORC_8901_GuardMine_Enter_condition;
	information = DIA_ORC_8901_GuardMine_Enter_info;
	permanent = FALSE;
	description = " What are you guarding here? " ;
};

func int DIA_ORC_8901_GuardMine_Enter_condition()
{
	return TRUE;
};

func void DIA_ORC_8901_GuardMine_Enter_info()
{
	AI_Output(other,self, " DIA_ORC_8901_GuardMine_Enter_01_01 " );	// What are you guarding here?
	AI_Output(self,other, " DIA_ORC_8901_GuardMine_Enter_01_02 " );	// Turrak look beyond the entrance to the orc iron mine!
	AI_Output(self,other, " DIA_ORC_8901_GuardMine_Enter_01_03 " );	// Do not let anyone in, do not let anyone out, unless the big leader orders this Turrak.
	AI_Output(other,self, " DIA_ORC_8901_GuardMine_Enter_01_04 " );	// And if I still want to enter it?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other, " DIA_ORC_8901_GuardMine_Enter_01_05 " );	// A person cannot just do this! The shaman brothers do magic at the entrance to the mine.
	AI_Output(self,other, " DIA_ORC_8901_GuardMine_Enter_01_06 " );	// She kill anyone, if not be a brother.
	AI_Output(other,self, " DIA_ORC_8901_GuardMine_Enter_01_07 " );	// And what if I suddenly need to look there?
	AI_Output(self,other, " DIA_ORC_8901_GuardMine_Enter_01_08 " );	// (terribly) ARUG NOR! Only a great leader can allow you to go there.
	AI_Output(self,other, " DIA_ORC_8901_GuardMine_Enter_01_09 " );	// Then the door will open and the magic won't kill the person!
};

//instance DIA_ORC_8901_GuardMine_Closed(C_Info)
//{
//	npc = OrcWarrior_GuardMine;
//	condition = DIA_ORC_8901_GuardMine_Closed_condition;
//	information = DIA_ORC_8901_GuardMine_Closed_info;
//	permanent = FALSE;
// 	description = "Why is the mine closed?";
//};

//func int DIA_ORC_8901_GuardMine_Closed_condition()
//{
//	if(MIS_EscapeMine == LOG_Success)
//	{
//		return TRUE;
//	};
//};

//func void DIA_ORC_8901_GuardMine_Closed_info()
//{
//	B_GivePlayerXP(200);
// 	AI_Output(other,self,"DIA_ORC_8901_GuardMine_Closed_01_01"); //Why is the mine closed?
//	AI_PlayAni(self,"T_NO");
// 	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Closed_01_02"); //All slaves escape from there! Ur-Thrall will be very angry!
// 	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Closed_01_03"); //Kill a lot of brothers, close the mine. Man no longer go there!
//};

// ------------------------------------------------ -----Tar Gore------------------------------------------

instance DIA_Orc_8205_TarGor_EXIT(C_Info)
{
	npc = Orc_8205_TarGor;
	condition = DIA_Orc_8205_TarGor_exit_condition;
	information = DIA_Orc_8205_TarGor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8205_TarGor_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8205_TarGor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8205_TarGor_HELLO(C_Info)
{
	npc = Orc_8205_TarGor;
	condition = DIA_Orc_8205_TarGor_hello_condition;
	information = DIA_Orc_8205_TarGor_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8205_TarGor_hello_condition()
{
	return TRUE;
};

func void DIA_Orc_8205_TarGor_hello_info()
{
	AI_ReadyMeleeWeapon(self);
	Snd_Play("ORC_Angry");
	AI_Output(self,other, " DIA_Orc_8205_TarGor_hello_01_01 " );	// (menacingly) KRUSHAK CAR! Who let you in here, man?!
	AI_Output(other,self, " DIA_Orc_8205_TarGor_hello_01_02 " );	// Calm down! Ur-Thrall gave me permission to enter the mine.
	AI_Output(self,other, " DIA_Orc_8205_TarGor_hello_01_03 " );	// Hmmm... Well, if that's the case, the person can walk further.
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_Orc_8205_TarGor_hello_01_04 " );	// Just don't make trouble here, man! And do not distract the slave from their work.
	AI_Output(self,other, " DIA_Orc_8205_TarGor_hello_01_05 " );	// Otherwise Tar Horus will be angry! Ar Dagar be angry! Make a person dead...
	AI_StopProcessInfos(self);
};


// ------------------------------------------------ -----Grock----------------------------------------

instance DIA_Orc_8204_Grok_EXIT(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_exit_condition;
	information = DIA_Orc_8204_Grok_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8204_Grok_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8204_Grok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8204_Grok_HELLO(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_hello_condition;
	information = DIA_Orc_8204_Grok_hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8204_Grok_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_hello_info()
{
	AI_Output(self,other, " DIA_Orc_8204_Grok_hello_01_01 " );	// KROK TAR MOR TA! UKT DAR MAR BAR DURAT GROK...
	AI_Output(other,self, " DIA_Orc_8204_Grok_hello_01_02 " );	// Umm... I don't really understand you.
	AI_PlayAni(self, " T_DONTKNOW " );
	AI_Output(self,other, " DIA_Orc_8204_Grok_hello_01_03 " );	// UR DAGAR TAROK MOR DA KUR ZAR PARAK TURAB.
	AI_Output(other,self, " DIA_Orc_8204_Grok_hello_01_04 " );	// Hmmm... (looks like I need to know the orc language to talk to this guy)
	AI_PlayAni(self,"T_GETLOST2");
	AI_Output(self,other, " DIA_Orc_8204_Grok_hello_01_05 " );	// BIGGER DROP LOAD! DON'T...
	NeedKnowOrcLang = TRUE;

	if((MIS_LowLevel == LOG_Running) && (KnowGrok == TRUE))
	{
		B_LogEntry(TOPIC_LowLevel, " To speak with Grock, I need to learn the orc language. Who can help me with this? " );
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8204_Grok_HELLO_OK(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_hello_OK_condition;
	information = DIA_Orc_8204_Grok_hello_OK_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8204_Grok_hello_OK_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_hello_OK_info()
{
	AI_Output(self,other, " DIA_Orc_8204_Grok_hello_OK_01_01 " );	// What do you need to be, man? Why are you disturbing old Grock?
	AI_Output(other,self, " DIA_Orc_8204_Grok_hello_OK_01_02 " );	// I need to talk to you, orc.
	AI_Output(self,other, " DIA_Orc_8204_Grok_hello_OK_01_03 " );	// (surprised) Man know our language? Okay, Grock talk to him.
	AI_Output(self,other, " DIA_Orc_8204_Grok_hello_OK_01_04 " );	// What would a person want to talk about with Grock?
};

instance DIA_Orc_8204_Grok_HowThings(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_HowThings_condition;
	information = DIA_Orc_8204_Grok_HowThings_info;
	permanent = TRUE;
	description = " How are you, Orc? " ;
};

func int DIA_Orc_8204_Grok_HowThings_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_HowThings_info()
{
	AI_Output(other,self, " DIA_Orc_8204_Grok_HowThings_01_01 " );	// How are you, orc?
	AI_Output(self,other, " DIA_Orc_8204_Grok_HowThings_01_02 " );	// Grock doesn't understand what kind of person it is to be the case.
	AI_Output(self,other, " DIA_Orc_8204_Grok_HowThings_01_03 " );	// Better man go do your thing and not disturb old Grock.
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8204_Grok_WhatYouDo(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_WhatYouDo_condition;
	information = DIA_Orc_8204_Grok_WhatYouDo_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};

func int DIA_Orc_8204_Grok_WhatYouDo_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_WhatYouDo_info()
{
	AI_Output(other,self, " DIA_Orc_8204_Grok_WhatYouDo_01_01 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Orc_8204_Grok_WhatYouDo_01_02 " );	// Grock is here to stand and watch so that no one comes down.
	AI_Output(other,self, " DIA_Orc_8204_Grok_WhatYouDo_01_03 " );	// What's down there?
	AI_Output(self,other, " DIA_Orc_8204_Grok_WhatYouDo_01_04 " );	// There be a big orc mine. But you can't go there! HARAD!
	AI_Output(other,self,"DIA_Orc_8204_Grok_WhatYouDo_01_05");	//Почему?
	AI_Output(self,other, " DIA_Orc_8204_Grok_WhatYouDo_01_06 " );	// It's a man's business not to touch! Touch only brothers.
	AI_Output(other,self, " DIA_Orc_8204_Grok_WhatYouDo_01_07 " );	// Hmmm... Interesting. Or maybe you can tell?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other, " DIA_Orc_8204_Grok_WhatYouDo_01_08 " );	// (angrily) No. HARAD!
	AI_Output(self,other, " DIA_Orc_8204_Grok_WhatYouDo_01_09 " );	// Come on!
};

instance DIA_Orc_8204_Grok_Help(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_Help_condition;
	information = DIA_Orc_8204_Grok_Help_info;
	permanent = FALSE;
	description = " You don't look good " ;
};

func int DIA_Orc_8204_Grok_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8204_Grok_WhatYouDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_Help_info()
{
	AI_Output(other,self, " DIA_Orc_8204_Grok_Help_01_01 " );	// You don't look well. Are you sick or something?
	AI_Output(self,other, " DIA_Orc_8204_Grok_Help_01_02 " );	// Grock is already a very old orc... It's hard for him to stand here all day. Little strength!
	AI_Output(self,other, " DIA_Orc_8204_Grok_Help_01_03 " );	// Grok used to have potions of the spirit brothers, he used them to restore his strength.
	AI_Output(self,other, " DIA_Orc_8204_Grok_Help_01_04 " );	// But the potions are long gone! And now Grock is getting weak every day.
	AI_Output(other,self, " DIA_Orc_8204_Grok_Help_01_05 " );	// What happens if you get really weak?
	AI_Output(self,other, " DIA_Orc_8204_Grok_Help_01_06 " );	// If Grock gets weak and the brothers see it, then they are Grock.
	AI_Output(other,self, " DIA_Orc_8204_Grok_Help_01_07 " );	// M-yes, you have good orders. But maybe I can help you somehow?
	AI_Output(self,other, " DIA_Orc_8204_Grok_Help_01_08 " );	// Man want to help Grock?! Grock is greatly surprised by this.
	AI_Output(self,other, " DIA_Orc_8204_Grok_Help_01_09 " );	// Normally people only want to kill Grock.
	AI_Output(other,self, " DIA_Orc_8204_Grok_Help_01_10 " );	// Usually people don't come to your city.
	AI_Output(other,self, " DIA_Orc_8204_Grok_Help_01_11 " );	// So what kind of potions do you say you need?
	AI_Output(self,other, " DIA_Orc_8204_Grok_Help_01_12 " );	// Potions to make Grock strong! Then Grock can stand here for a long time.
	AI_Output(other,self, " DIA_Orc_8204_Grok_Help_01_13 " );	// So, potion of strength. I'll try to get it.
	MIS_GrokBringPotion = LOG_Running;
	Log_CreateTopic(TOPIC_GrokBringPotion,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GrokBringPotion,LOG_Running);
	B_LogEntry(TOPIC_GrokBringPotion, "The orc named Grok is already very old and getting weaker every day. He used to have shaman potions with which he maintained his strength. But now that the potions are gone, he can't do anything about it. If he gets really weak , then the brothers will just eat it. " );
};

instances of DIA_Orc_8204_Grok_BringPotion (C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_BringPotion_condition;
	information = DIA_Orc_8204_Grok_BringPotion_info;
	permanent = FALSE;
	description = " Here's a potion for you. " ;
};

func int DIA_Orc_8204_Grok_BringPotion_condition()
{
	if((MIS_GrokBringPotion == LOG_Running) && (Npc_HasItems(hero,ItPo_Perm_STR) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_BringPotion_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_Orc_8204_Grok_BringPotion_01_01 " );	// Here's a potion for you.
	B_GiveInvItems(other,self,ItPo_Perm_STR,1);
	Npc_RemoveInvItems(self,ItPo_Perm_STR,1);
	B_UseItem(self,ItPo_Perm_STR_Fake);
	AI_Output(self,other, " DIA_Orc_8204_Grok_BringPotion_01_02 " );	// Grock thank man! Feel the power returning to him again.
	AI_Output(other,self, " DIA_Orc_8204_Grok_BringPotion_01_03 " );	// Well, then your brothers will have to eat you later.
	AI_Output(self,other, " DIA_Orc_8204_Grok_BringPotion_01_04 " );	// A man to be able to joke nicely... (laughs) Grock likes this!
	MIS_GrokBringPotion = LOG_Success;
	Log_SetTopicStatus(TOPIC_GrokBringPotion,LOG_Success);
	B_LogEntry(TOPIC_GrokBringPotion, " I brought Grok a potion. It helped him recover. " );
};

instances of DIA_Orc_8204_Grok_LowLevel (C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_LowLevel_condition;
	information = DIA_Orc_8204_Grok_LowLevel_info;
	permanent = FALSE;
	description = " I need to know what happened in the lower level of the mine. " ;
};

func int DIA_Orc_8204_Grok_LowLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (KnowGrok == TRUE) && (MIS_GrokBringPotion == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_LowLevel_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8204_Grok_LowLevel_01_01 " );	// I need to know what happened at the bottom of the mine.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_02 " );	// And why does a person ask Grock about this?
	AI_Output(other,self, " DIA_Orc_8204_Grok_LowLevel_01_03 " );	// Because you're the only one who knows what caused the orcs to lock down the lower level.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_04 " );	// Grock is very surprised... (surprised) How does a person know this?
	AI_Output(other,self, " DIA_Orc_8204_Grok_LowLevel_01_05 " );	// Smelter Hildur said you were the only survivor of the mine.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_06 " );	// Hmmm... (thoughtfully) Good! The man help Grock, and he tells him about the mine as a token of gratitude.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_07 " );	// Grock really sees everything and knows everything. Hildur don't deceive people!
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_09 " );	// It's been a lot of winters ago. When else Grock be a strong warrior and guard the mine below.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_10 " );	// Brothers dig a lot of ore. Want to dig even more and more!
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_11 " );	// One day they dig out one cave where they find a very large and evil demon.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_12 " );	// Grock see him! To see what it is like to kill brothers and slaves.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_13 " );	// He gets very frightened and runs away from there! And all his brothers die there.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_14 " );	// Then the brothers lock the mine and never open it again. Don't disturb the evil demon anymore!
	AI_Output(other,self, " DIA_Orc_8204_Grok_LowLevel_01_15 " );	// I don't think a simple grill would stop a real demon.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_16 " );	// At first Grock think so! Wait for the demon to still come here.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_17 " );	// But many winters have passed, and the demon never appears again.
	AI_Output(other,self, " DIA_Orc_8204_Grok_LowLevel_01_18 " );	// I wonder what stopped him then?
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_19 " );	// Grock doesn't know for sure, but think the demon is guarding something.
	AI_Output(self,other, " DIA_Orc_8204_Grok_LowLevel_01_20 " );	// He then sees a bright light in the cave. Think it be very strong magic!
	AI_Output(other,self, " DIA_Orc_8204_Grok_LowLevel_01_21 " );	// Well, yes, then that explains a lot.
	B_LogEntry(TOPIC_LowLevel, " From Grok, I learned that at one time the orcs dug out a cave, inside of which there was a huge and evil demon. He killed all the orcs, only Grok managed to avoid death. Apparently, the demon was guarding something there. But what exactly, Grock does not know. He saw only a bright blinding light illuminating the entire cave. " );
};

instances of DIA_Orc_8204_Grok_GoLevel (C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_GoLevel_condition;
	information = DIA_Orc_8204_Grok_GoLevel_info;
	permanent = FALSE;
	description = " Have you tried to kill this demon again? " ;
};

func int DIA_Orc_8204_Grok_GoLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Orc_8204_Grok_LowLevel) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_GoLevel_info()
{
	AI_Output(other,self, " DIA_Orc_8204_Grok_GoLevel_01_01 " );	// Have you tried to kill this demon again?
	AI_Output(self,other, " DIA_Orc_8204_Grok_GoLevel_01_02 " );	// When Ar Dagar becomes the chief orc here, he will send a strong detachment of his warriors there.
	AI_Output(self,other, " DIA_Orc_8204_Grok_GoLevel_01_03 " );	// But none of them come back! Nobody knows where they go.
	AI_Output(self,other, " DIA_Orc_8204_Grok_GoLevel_01_04 " );	// No more brothers going downstairs to kill the demon.
	KnowGrokDemon = TRUE;
	B_LogEntry(TOPIC_LowLevel, " Ar Dagar sent a squad of warriors down, but none of them returned. " );
};

// ------------------------------------------------ -----Beaver Shak-------------------------------------------

instance DIA_Orc_8206_Dakar_EXIT(C_Info)
{
	npc = Orc_8206_Dakar;
	condition = DIA_Orc_8206_Dakar_exit_condition;
	information = DIA_Orc_8206_Dakar_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8206_Dakar_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8206_Dakar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8206_Dakar_HELLO(C_Info)
{
	npc = Orc_8206_Dakar;
	condition = DIA_Orc_8206_Dakar_hello_condition;
	information = DIA_Orc_8206_Dakar_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8206_Dakar_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Orc_8206_Dakar_hello_info()
{
	AI_Output(self,other, " DIA_Orc_8206_Dakar_hello_01_01 " );	// What's a man to do here?! Why talk to Dabar Shaku?!
	AI_Output(other,self, " DIA_Orc_8206_Dakar_hello_01_02 " );	// I'm just looking around. What are you guarding here?
	AI_Output(self,other, " DIA_Orc_8206_Dakar_hello_01_03 " );	// Dabar Shak to look behind the furnace, to look for a man to make steel for the orcs.
	AI_Output(self,other, " DIA_Orc_8206_Dakar_hello_01_04 " );	// If the steel be small, Ar Dagar be dissatisfied. Scold Dabar Shaka!
	AI_Output(self,other, " DIA_Orc_8206_Dakar_hello_01_05 " );	// So Dabar Shak watch to make a person work well.
	AI_Output(self,other, " DIA_Orc_8206_Dakar_hello_01_06 " );	// Don't rest! Just work, make steel. Lots of steel...
};

instance DIA_Orc_8206_Dakar_Steel(C_Info)
{
	npc = Orc_8206_Dakar;
	condition = DIA_Orc_8206_Dakar_Steel_condition;
	information = DIA_Orc_8206_Dakar_Steel_info;
	permanent = FALSE;
	description = " Why do you need so much steel? " ;
};

func int DIA_Orc_8206_Dakar_Steel_condition()
{
	return TRUE;
};

func void DIA_Orc_8206_Dakar_Steel_info()
{
	AI_Output(other,self, " DIA_Orc_8206_Dakar_Steel_01_01 " );	// Why do you need so much steel?
	AI_Output(self,other, " DIA_Orc_8206_Dakar_Steel_01_02 " );	// Orcs fight a lot! The brothers need a lot of weapons.
};


// ------------------------------------------------ -----Ar Dagar--------------------------------------------------------


instance DIA_OrcWarrior_MineCommander_EXIT(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_exit_condition;
	information = DIA_OrcWarrior_MineCommander_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_OrcWarrior_MineCommander_exit_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineCommander_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineCommander_HELLO(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_hello_condition;
	information = DIA_OrcWarrior_MineCommander_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_OrcWarrior_MineCommander_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_hello_info()
{
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_hello_01_01 " );	// (angrily) What's a man to do here?! Why not work?
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_hello_01_02 " );	// I am not one of your slaves.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_hello_01_03 " );	// Then what do you need from Ar Dagar?
};

instance DIA_OrcWarrior_MineCommander_WhoYou(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_WhoYou_condition;
	information = DIA_OrcWarrior_MineCommander_WhoYou_info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_OrcWarrior_MineCommander_WhoYou_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineCommander_WhoYou_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhoYou_01_01");	//Ты кто?
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhoYou_01_02 " );	// My name is Ar Dagar, man... (terribly) And this will be my iron mine.
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_WhoYou_01_03 " );	// I thought the mine belonged to the orcs of Ur-Thrall.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhoYou_01_04 " );	// Yes, be like this. But I'm the only one giving orders here!
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhoYou_01_05 " );	// So man be careful what you say, if you don't want to anger Ar Dagar.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhoYou_01_06 " );	// Otherwise, the sign of strength won't help him!
};

instance DIA_OrcWarrior_MineCommander_LowLevel(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_LowLevel_condition;
	information = DIA_OrcWarrior_MineCommander_LowLevel_info;
	permanent = FALSE;
	description = " I want to ask about the lower level of the mine. " ;
};

func int DIA_OrcWarrior_MineCommander_LowLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (KnowGrokDemon == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_LowLevel_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_LowLevel_01_01 " );	// I want to ask about the lower level of the mine.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_LowLevel_01_02 " );	// (menacingly) Ar Dagar to think it's a little touching man.
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_LowLevel_01_03 " );	// Just answer - you sent your fighters there, didn't you?
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_LowLevel_01_04 " );	// Hmmm...(grimly) Ar Dagar doesn't know how a person would be aware of this.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_LowLevel_01_05 " );	// But he must be right! Once Ar Dagar want to free the deep mine.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_LowLevel_01_06 " );	// He sends many strong brothers there, but they all die there.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_LowLevel_01_07 " );	// No one will return to Ar Dagar back...
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_LowLevel_01_08 " );	// You know what's down there, right?
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_LowLevel_01_09 " );	// There be evil... (gloomy) Huge evil that kill many Ar Dagar brothers!
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_LowLevel_01_10 " );	// Terrible demon that doesn't have a name, doesn't have a name.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_LowLevel_01_11 " );	// Ar Dagar don't send anyone there anymore! Do not disturb the evil demon anymore.
	B_LogEntry(TOPIC_LowLevel, " Ar Dagar confirmed Grok's words that he once tried to free a deep mine. Ar Dagar himself called it that. " );
};

instance DIA_OrcWarrior_MineCommander_WhyDemon(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_WhyDemon_condition;
	information = DIA_OrcWarrior_MineCommander_WhyDemon_info;
	permanent = FALSE;
	description = " Do you know where it could have come from? " ;
};

func int DIA_OrcWarrior_MineCommander_WhyDemon_condition()
{
	if (( MIS_LowLevel == LOG_Running ) && ( Npc_KnowsInfo ( hero , DIA_OrcWarrior_MineCommander_LowLevel ) ==  TRUE )) .
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_WhyDemon_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_WhyDemon_01_01 " );	// Do you know where he even could come from there?
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhyDemon_01_02 " );	// Ar Dagar not to know this! Only old Grock be there when the demon awakens.
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_WhyDemon_01_03 " );	// Grock assumed he was guarding something there.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhyDemon_01_04 " );	// Ar Dagar knows nothing about this... (grimly) But Grock may be right.
};

instance DIA_OrcWarrior_MineCommander_HelpDemon(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_HelpDemon_condition;
	information = DIA_OrcWarrior_MineCommander_HelpDemon_info;
	permanent = FALSE;
	description = " I want to help you deal with the demon. " ;
};

func int DIA_OrcWarrior_MineCommander_HelpDemon_condition()
{
	if (( MIS_LowLevel == LOG_Running ) && ( Npc_KnowsInfo ( hero , DIA_OrcWarrior_MineCommander_LowLevel ) ==  TRUE )) .
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_HelpDemon_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_HelpDemon_01_01 " );		// I want to help you deal with the demon.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_HelpDemon_01_02 " );		// (laughs) Can a man imagine himself a great warrior?
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_HelpDemon_01_03 " );		// Evil demon crush him like a pathetic worm!
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_HelpDemon_01_04 " );		// If I were you, I wouldn't be so self-confident.

	if(MIS_PsicampDemon == LOG_Success)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_01 " );	// Temple in the swamps is free!
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_05 " );		// Now Ar Dagar can see that he doesn't lie to him. A man to be able to fight well!
		AI_Output(other,self, " DIA_OrcWarrior_MineCommander_BringGrah_01_06 " );		// What about the mine?
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_08 " );		// He's allowing a person to go into the deep mine to fight a demon there.
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_09 " );		// But the evil demon has many dead servants! Man be hard alone to go there.
		AI_Output(other,self, " DIA_OrcWarrior_MineCommander_BringGrah_01_10 " );		// And what do you suggest?
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_11 " );		// Ar Dagar have a little strong warrior to send them along with the people.
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_12 " );		// Therefore, he first go to Ur-Thrall, the great leader of the brothers. Ask him to give a lot of strong warrior.
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_13 " );		// They go along with the man. Will help him fight the demon!
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_14 " );		// Now man step! Come to Ar Dagar when talking to Ur-Thrall.
		B_LogEntry(TOPIC_LowLevel, " Ar Dagar sent me to Ur-Thrall to send him warriors. These orcs will come with me to help me defeat the demon. " );
		SendForHelp = TRUE;
	}
	else
	{
	 	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_HelpDemon_01_05 " );		// At least you can give me a chance.
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_HelpDemon_01_06 " );		// Hmmm...(thoughtfully) Man be very brave, but very stupid!
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_HelpDemon_01_07 " );		// But Ar Dagar give him a chance to fight that demon.
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_HelpDemon_01_08 " );		// However, for starters, a person bring me Grah Shah!
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_HelpDemon_01_09 " );		// Ar Dagar to check if a person is as strong as they say.
		AI_Output(other,self, " DIA_OrcWarrior_MineCommander_HelpDemon_01_10 " );		// And what is Grah Shah?
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_HelpDemon_01_11 " );		// Reward the one who becomes the strongest warrior in the city of brothers!
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_HelpDemon_01_12 " );		// If a person proves that he is worthy of wearing the Grah Shah, then go fight the evil demon.
		AI_Output(self,other, " DIA_OrcWarrior_MineCommander_HelpDemon_01_13 " );		// And Ar Dagar help him with this.
		B_LogEntry(TOPIC_LowLevel, " If I become the arena champion in the orc city, Ar Dagar will let me go down to the lower level of the mine. " );
	};
};

instance DIA_OrcWarrior_MineCommander_BringGrah(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_BringGrah_condition;
	information = DIA_OrcWarrior_MineCommander_BringGrah_info;
	permanent = FALSE;
	description = " I have Grah Shah! " ;
};

func int DIA_OrcWarrior_MineCommander_BringGrah_condition()
{
	if ((MIS_LowLevel == LOG_Running) && (SendForHelp ==  FALSE ) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineCommander_HelpDemon) ==  TRUE ) && (Npc_HasItems(hero,ItI_GrahShar) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_BringGrah_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_BringGrah_01_01 " );	// I have Grah Shah!
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_02 " );	// Then the man show him Ar Dagar. He will watch!
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_03");	//Вот он.
	B_GiveInvItems(other,self,ItMi_GrahShar,1);
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_04 " );	// Hmmm...(respectfully) CRAT KOR! Man be Mor Dar! The great warrior of the brothers.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_05 " );	// Now Ar Dagar can see that he doesn't lie to him. A man to be able to fight well!
	B_GiveInvItems(self,other,ItMi_GrahShar,1);
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_BringGrah_01_06 " );	// What about the mine?
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_07 " );	// Ar Dagar give the word to help a person if he brings Grah Shah! Ar Dagar to fulfill his promise.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_08 " );	// He's allowing a person to go into the deep mine to fight a demon there.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_09 " );	// But the evil demon has many dead servants! Man be hard alone to go there.
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_BringGrah_01_10 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_11 " );	// Ar Dagar have a little strong warrior to send them along with the people.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_12 " );	// Therefore, he first go to Ur-Thrall, the great leader of the brothers. Ask him to give a lot of strong warrior.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_13 " );	// They go along with the man. Will help him fight the demon!
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_BringGrah_01_14 " );	// Now man step! Come to Ar Dagar when talking to Ur-Thrall.
	B_LogEntry(TOPIC_LowLevel, " Ar Dagar sent me to Ur-Thrall to send him warriors. These orcs will come with me to help me defeat the demon. " );
	SendForHelp = TRUE;
};

instance DIA_OrcWarrior_MineCommander_GoShaht(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_GoShaht_condition;
	information = DIA_OrcWarrior_MineCommander_GoShaht_info;
	permanent = FALSE;
	description = " Ur-Thrall will help with the warriors! " ;
};

func int DIA_OrcWarrior_MineCommander_GoShaht_condition()
{
	if ((MIS_LowLevel == LOG_Running) && (OrcHelpLowLevel ==  TRUE ) && (Npc_IsDead(HaosDemon_Orcmine) ==  FALSE ) && (Npc_IsDead(skeleton_warrior_dark_stoneshpere) ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_GoShaht_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_GoShaht_01_01 " );	// Ur-Thrall will help with the warriors!
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_GoShaht_01_02 " );	// Be good! Then the man go fight the demon.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_GoShaht_01_03 " );	// Ar Dagar wish him good luck!
	GoFightDeepMine = TRUE;
	B_LogEntry(TOPIC_LowLevel, " I've informed Ar Dagar that Ur-Thrall has agreed to help with the warriors. It's time to put an end to the evil that's been brewing there. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(STRF_2153_Fighter,"ORCMINE_FIGHTER_01");
	Wld_InsertNpc(STRF_2154_Fighter,"ORCMINE_FIGHTER_02");
	Wld_InsertNpc(STRF_2155_Fighter,"ORCMINE_FIGHTER_03");
	Wld_InsertNpc(STRF_2156_Fighter,"ORCMINE_FIGHTER_04");
	Wld_InsertNpc(STRF_2157_Fighter,"ORCMINE_FIGHTER_05");
};

instance DIA_OrcWarrior_MineCommander_FreeDeepShaht (C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_FreeDeepShaht_condition;
	information = DIA_OrcWarrior_MineCommander_FreeDeepShaht_info;
	permanent = FALSE;
	description = "The evil in the deep mine is finished. " ;
};

func int DIA_OrcWarrior_MineCommander_FreeDeepShaht_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_IsDead(HaosDemon_Orcmine) == TRUE) && (Npc_IsDead(skeleton_warrior_dark_stoneshpere) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_FreeDeepShaht_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_01 " );	// The evil in the deep mine is done.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_02 " );	// (surprised) Man be sure exactly what to kill the evil demon?
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_03 " );	// If you don't believe me, you can go down there and check it out yourself. There is nobody there!
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_04 " );	// This shouldn't be necessary! Ar Dagar believe man.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_05 " );	// He just doesn't understand how he managed to do it.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_06 " );	// Man truly be a great and fearless warrior! Ar Dagar is an honor to speak with him.
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_07 " );	// Nice to hear that.
	MIS_LowLevel = LOG_Success;
	Log_SetTopicStatus(TOPIC_LowLevel,LOG_Success);
	B_LogEntry(TOPIC_LowLevel, " I returned to Ar Dagar and told that I had managed to end the curse of the orcs. " );
};

instance DIA_OrcWarrior_MineCommander_WhatNow(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_WhatNow_condition;
	information = DIA_OrcWarrior_MineCommander_WhatNow_info;
	permanent = FALSE;
	description = " Are Orcs able to mine magic ore again? " ;
};

func int DIA_OrcWarrior_MineCommander_WhatNow_condition()
{
	if(MIS_LowLevel == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_WhatNow_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_WhatNow_01_01 " );	// Will Orcs be able to mine magic ore again?
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhatNow_01_02 " );	// Ar Dagar to think that it is not... It is impossible to be!
	AI_Output(other,self, " DIA_OrcWarrior_MineCommander_WhatNow_01_03 " );	// But why? After all, the lower level of the mine is now free.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhatNow_01_04 " );	// The orcs would be very stupid then, what to dig so deep into the mine!
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhatNow_01_05 " );	// Ar Dagar doesn't want to make the mistakes of his brothers anymore.
	AI_Output(self,other, " DIA_OrcWarrior_MineCommander_WhatNow_01_06 " );	// No orc will ever set foot there again! Otherwise, a new problem may occur.
};

instance DIA_OrcWarrior_MineCommander_PICKPOCKET(C_Info)
{
	npc = OrcWarrior_MineCommander;
	nr = 900;
	condition = DIA_OrcWarrior_MineCommander_pickpocket_condition;
	information = DIA_OrcWarrior_MineCommander_pickpocket_info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_OrcWarrior_MineCommander_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MIS_ArDagarKey == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_pickpocket_info()
{
	Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
	Info_AddChoice(DIA_OrcWarrior_MineCommander_pickpocket,Dialog_Back,DIA_OrcWarrior_MineCommander_pickpocket_back);
	Info_AddChoice(DIA_OrcWarrior_MineCommander_pickpocket,DIALOG_PICKPOCKET,DIA_OrcWarrior_MineCommander_pickpocket_doit);
};

func void DIA_OrcWarrior_MineCommander_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		B_GiveThiefXP();
		B_GiveInvItems(self,other,ItKe_ArDagar,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_LogEntry(TOPIC_ArDagarKey, " I stole the key from Ar Dagar! I think I should go back to Gars now. " );
		Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
	}
	else
	{
		B_Say(other,other,"$TOOHEAVYFORME");
		Print ( " Required Agility: 100 " );
		Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
	};
};

func void DIA_OrcWarrior_MineCommander_pickpocket_back()
{
	Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
};

// ------------------------------------------------ -----Vakur Shak----------------------------------------

var int VakurShakNeedGold;
var int VakurShakNeedMoreGold;
var int VakurShakSellRing;
var int VakurShakNeedGoldCount;

instance DIA_OrcWarrior_MineWatcher_Vakur_EXIT(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_exit_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_exit_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Vakur_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_Hello(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_Hello_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_Hello_info;
	permanent = FALSE;
	description = " Hello, green face. " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_Hello_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Vakur_Hello_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_01 " );	// Hello, green muzzle.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_02 " );	// Man... (terribly) Why come here?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_03 " );	// Or does a human want to become a slave of the brothers, like the rest of the morra?
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_04 " );	// Can't wait, orc.
};

instance DIA_OrcWarrior_MineWatcher_Vakur_WhatDo(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Vakur_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_01 " );	// What are you doing here?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_02 " );	// Vakur Shak make sure the slaves work well.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_03 " );	// If the work is bad, Wakur Shak beat them!
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_04 " );	// How easy it is for you.
};

instance DIA_OrcWarrior_MineWatcher_Vakur_DontLove(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_DontLove_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_DontLove_info;
	permanent = FALSE;
	description = " And how many of you are there? " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_DontLove_condition()
{
	if(Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Vakur_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_DontLove_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_01 " );	// And how many of you are there?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_02 " );	// There will be many brothers, few people.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_03 " );	// No one can escape!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_04");	//Само собой.
};

instance DIA_OrcWarrior_MineWatcher_Vakur_FerdRing (C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_info;
	permanent = FALSE;
	description = " Hey, I have something to do with you. " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_condition()
{
	if((MIS_FerdRing == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Vakur_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_01 " );	// Hey, I have one thing for you.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_02 " );	// Wakur Shak don't deal with a man!
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_03 " );	// He only tells people what to do. But don't listen to him!
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_04 " );	// What about gold?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_05 " );	// Hmmm...(thoughtfully) Then the man give it to Vakur Shak and he then listen.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_06 " );	// And how much do you need?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_07 " );	// Lots and lots of gold! So much to make Vakur Shak very happy.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_08 " );	// Be precise!
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_09 " );	// ....(thinks) Thirty gold nuggets!
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_10 " );	// You have a good appetite. But if there is no other way, you will have to get them for you.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_11 " );	// A person is not stupid, if you understand this.
	VakurShakNeedGold = TRUE;
	B_LogEntry(TOPIC_FerdRing, " That orc Vakur Shak refused to talk to me at all! Only gold will make him listen to me, namely thirty gold nuggets. Yes, this orc has a smart mouth... " );
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_info;
	permanent = FALSE;
	description = " Here are your thirty nuggets. " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_condition()
{
	if ((MIS_FerdRing == LOG_Running) && (VakurShakNeedGold ==  TRUE ) && (Npc_HasItems(hero,ItMi_Addon_GoldNugget) >=  30 ))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_info()
{
	VakurShakNeedGoldCount = FALSE;
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_01 " );	// Here are your thirty nuggets.
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,30);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,30);
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_02 " );	// Gold! Wakur Shak loves gold very much.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_03 " );	// Now the person can ask what he wants. Vakur Shak will listen to him!
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_04 " );	// I need that ring you took from Slave Ferd.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_05 " );	// What else to be a ring?!
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_06 " );	// A simple silver ring! Have you never seen these?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_07 " );	// Ahhh, Vakur Shak seems to understand what the man is talking about... (pulling out his ring) Does he mean this thing?
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_08 " );	// Yes, that's it. Give it to me!
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_09 " );	// (laughs) Vakur Shak will not give anything just like that, a stupid person!
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_10 " );	// Well, what do you want for him?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_11 " );	// Wakur Shak think that man know this.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_12 " );	// What, gold again?!
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_13 " );	// Not gold again! And a lot of gold! Fifty pieces of gold ... (greedily)
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_14 " );	// You're crazy asking that much for a normal silver ring!
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_15 " );	// The person himself decides whether to take it or not! Wakur Shak say your price.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_16 " );	// Well, you and impudent!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_17");	//Аррргггх...
	VakurShakNeedMoreGold = TRUE;
	VakurShakNeedGoldCount = 50;	
	B_LogEntry(TOPIC_FerdRing, " I brought Vakur Shak thirty gold nuggets and asked him about Ferd's ring. And he broke another fifty gold nuggets for him! And why did I only contact him... " );
};

instance DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_info;
	permanent = FALSE;
	description = " Maybe we can meet in half? " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_condition()
{
	if ((MIS_FerdRing == LOG_Running) && (VakurShakNeedMoreGold ==  TRUE ) && (VakurShakSellRing ==  FALSE ) && (VakurShakNeedGoldCount >=  50 ))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_01_01 " );	// Shall we meet in half?

	if(RhetorikSkillValue[1] >= 65)
	{
		AI_PlayAni(self,"T_YES");
		AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_01_02 " );	// Hmmm... Well, good! But this will be the last price of Wakur Shaka.
		B_LogEntry(TOPIC_FerdRing, " I bargained with Vakur Shak for twenty-five gold nuggets. " );
		VakurShakNeedGoldCount = 25;
	}
	else
	{
		AI_PlayAni(self,"T_NO");
		AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_01_03 " );	// (viciously) No... HARAD!
	};
};

instance DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_info;
	permanent = FALSE;
	description = " Here, keep your gold. " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_condition()
{
	if ((MIS_FerdRing == LOG_Running) && (VakurShakNeedMoreGold ==  TRUE ) && (Npc_HasItems(hero,ItMi_Addon_GoldNugget) >= VakurShakNeedGoldCount))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_01 " );	// Here, keep your gold.
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,VakurShakNeedGoldCount);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,VakurShakNeedGoldCount);
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_02 " );	// (greedily) Gold be good. Vakur Shak be very pleased!
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_03 " );	// Now give me that ring.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_04 " );	// HARAD! (laughs) Wakur Shak be very smart! He's outsmarting the man.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_05 " );	// He would be very stupid if he thought that Vakur Shak would give him this ring.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_06 " );	// So you decided to cheat me?!
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_07 " );	// Pathetic morra! You will never get it.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_08 " );	// Well then, I'll have to pay a visit to Ur-Thrall! Let him judge us.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_09 " );	// (fearful) Ur-Thrall? Man to know the great leader?
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_10 " );	// Who do you think allowed me to enter this mine?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_11 " );	// SMART! Man don't have to go to Ur-Thrall! Wakur Shak is just kidding.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_12 " );	// Here, man take that ring! Just do not go to the great leader.
	B_GiveInvItems(self,other,ItRi_Ferd,1);

	if(RhetorikSkillValue[1] >= 65)
	{
		AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_13 " );	// Not enough!
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_14");	//Что?!
		AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_15 " );	// You'll have to pay me much more for your lies.
		AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_16 " );	// Arrrgggh...(viciously) And what does a human want from Vakur Shaka?!
		AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_17 " );	// Depending on what you can offer me.
		AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_18 " );	// Hmmm...(thoughtfully) Vakur Shak has a potion that makes morra strong.
		AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_19 " );	// He can give it to people.
		AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_20 " );	// Great. Give it here.
		B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_21 " );	// (evil) Arrrgggh...
	}
	else
	{
		AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_22 " );	// That's better.
	};

	VakurShakSellRing = TRUE ;
	B_LogEntry(TOPIC_FerdRing, " I now have Ferd's Ring. " );
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_Perm(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_Perm_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_Perm_info;
	permanent = TRUE;
	description = " Why do you need so much gold, Orc? " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_Perm_condition()
{
	if(VakurShakSellRing == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_Perm_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_Perm_01_01 " );	// Why do you need so much gold, orc?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_Perm_01_02 " );	// Man it's a little touch!
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_Perm_01_03 " );	// Better man go where you want. Don't talk to Vakur Shak anymore.
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_info;
	permanent = FALSE;
	description = " I need a new pickaxe. " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (ElkNeedNewKirka == 2))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_01 " );	// I need a new pickaxe.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_02 " );	// If a person want a new pickaxe, then pay Vakur Shak gold.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_03 " );	// And how much do you want?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_04 " );	// Ten gold nuggets! And not a piece less...
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_05 " );	// Hey, isn't that too much for a regular pickaxe?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_06 " );	// Wakur Shak think price be good. Good to sell!
	ElkNeedNewKirka = 3 ;
};

instance DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_info;
	permanent = TRUE;
	description = " Sell me a new pickaxe. (Price: 10 gold nuggets) " ;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (ElkNeedNewKirka == 3))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_01 " );	// Sell me a pickaxe.

	if(Npc_HasItems(hero,ItMi_Addon_GoldNugget) >= 10)
	{
		B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,10);
		Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,10);
		AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_02 " );	// Be a good deal...(pretty) Now the man can pick up his instrument!
		B_GiveInvItems(self,other,ItMw_Kirka_New,1);
		ElkNeedNewKirka = 4 ;
	}
	else
	{
		AI_PlayAni(self,"T_NO");
		AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_03 " );	// Humans don't have enough gold!
		AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_04 " );	// Vakur Shak don't give him anything.
	};
};

// ------------------------------------------------ -----Work Shack----------------------------------------------------------

instance DIA_OrcWarrior_MineWatcher_Korshak_EXIT(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_exit_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_OrcWarrior_MineWatcher_Korshak_exit_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Korshak_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Korshak_Hello(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_Hello_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_Hello_info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_OrcWarrior_MineWatcher_Korshak_Hello_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Korshak_Hello_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_01");	//Ты кто?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_02 " );	// My name is Kor Shak, human...
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_03 " );	// I make sure that the slaves do not sit idle here, but mine the ore.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_04 " );	// Hmmm... For an orc, you speak pretty good human.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_05 " );	// Kor Shak long time to learn human language.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_06 " );	// Knowing your enemy well is just as important as fighting them well.
};

instance DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_info;
	permanent = FALSE;
	description = " Where did you learn to speak so well? " ;
};

func int DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_condition()
{
	if(Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Korshak_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_01 " );	// Where did you learn to speak so well?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_02 " );	// Kor Shak was held captive by humans for a long time! Was their slave for many winters.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_03 " );	// He listened to people and learned to speak like them.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_04 " );	// Got it.
};

instance DIA_OrcWarrior_MineWatcher_Korshak_KrowBook(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_info;
	permanent = FALSE;
	description = " I heard you have a diary of a slave. " ;
};

func int DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_condition()
{
	if((MIS_KrowBook == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Korshak_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_01 " );	// I heard you have a diary of a slave.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_02 " );	// Yes, the man is right...
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_03 " );	// Kor Shak take this book for himself, but don't give it to anyone else.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_04 " );	// Why do you need it?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_05 " );	// Kor Shak thinks he can learn to speak better if he reads this book.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_06 " );	// And how are you doing?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_07 " );	// It'll be bad for now... Kor Shak doesn't understand what is written there yet.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_08 " );	// But he thinks that if he reads it for a long time, then he will succeed.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_09 " );	// Something I doubt it.
	B_LogEntry(TOPIC_KrowBook, " Kor Shak took Crowe's diary to learn to speak better. Quite a strange desire for an orc. I need to help him somehow if I want to get Krow's diary back. Maybe someone will help him book? " );
};

instance DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_info;
	permanent = FALSE;
	description = " I have a better offer for you. " ;
};

func int DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_condition()
{
	if ((MIS_KrowBook ​​== LOG_Running) && (Npc_KnowsInfo(hero, DIA_OrcWarrior_MineWatcher_Korshak_KrowBook) ==  TRUE ) && (Npc_HasItems(hero, ITWR_RHETORICBOOK ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_01 " );	// I have a better offer for you.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_02 " );	// What is this person talking about?
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_03 " );	// Look, it's a rhetoric textbook! It will allow you to understand the language of people much better.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_04 " );	// (with interest) Does the person have another book? What does he want for her?
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_05 " );	// Let's change. I give you this book, and you give me that diary.
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_06 " );	// Agree, orc. Trust me, it's a fair deal!
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_07 " );	// Hmmm... (thoughtfully) Well, well! Kor Shak agrees to change.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_08 " );	// But if Kor Shak doesn't like a man's book, he won't give him anything then!
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_09 " );	// Better take a look at it yourself.
	B_GiveInvItems(other,self,ITWR_RHETORIKBOOK,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_10 " );	// KRODAR CAR! UR TAR BAR!
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_11 " );	// (pretty) Kor Shak thinks this is going to be a very interesting book. He even understand what people write here!
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_12 " );	// Here, enjoy. But first, give me back the diary.
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_13 " );	// Hold on, man! Pick him up. He no longer needs Kor Shak!
	B_GiveInvItems(self,other,ItWr_KrowBook,1);
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_14 " );	// It's a pleasure doing business with you.
	B_LogEntry(TOPIC_KrowBook, " I traded Kor Shaq's rhetoric book for Crowe's diary. Time to return it to its rightful owner. " );
};

instance DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_info;
	permanent = TRUE;
	description = " How do you like that book? " ;
};

func int DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_condition()
{
	if(MIS_KrowBook == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_info()
{
	AI_Output(other,self, " DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_01_01 " );	// Well, how do you like that book?
	AI_Output(self,other, " DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_01_02 " );	// Very interesting! Kor Shak thanks the man for her.
	AI_PlayAni(self,"T_GREETGRD");
};

// ------------------------------------------------ -----Orc guard next to Nuts----------------------------------------


instance DIA_Orc_8208_MineGuard_EXIT(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_exit_condition;
	information = DIA_Orc_8208_MineGuard_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8208_MineGuard_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8208_MineGuard_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8208_MineGuard_HELLO(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_hello_condition;
	information = DIA_Orc_8208_MineGuard_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8208_MineGuard_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_hello_info()
{
	AI_PlayAni(self,"T_GETLOST2");
	AI_Output(self,other, " DIA_Orc_8208_MineGuard_hello_01_01 " );	// (angrily) CRATUK CAR DRAG BAR KIRACK! HARAD MORRA TAR!
	AI_Output(other,self, " DIA_Orc_8208_MineGuard_hello_01_02 " );	// Umm... What did you say?

	if(MIS_RemoveOrc == FALSE)
	{
		AI_StopProcessInfos(self);
	};
};

instance DIA_Orc_8208_MineGuard_RemoveOrc(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_RemoveOrc_condition;
	information = DIA_Orc_8208_MineGuard_RemoveOrc_info;
	permanent = FALSE;
	description = " Ar Dagar is summoning you! " ;
};

func int DIA_Orc_8208_MineGuard_RemoveOrc_condition()
{
	if(MIS_RemoveOrc == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_RemoveOrc_info()
{
	AI_Output(other,self, " DIA_Orc_8208_MineGuard_RemoveOrc_01_01 " );	// Ar Dagar summons you!
	AI_PlayAni(self, " T_DONTKNOW " );
	AI_Output(self,other, " DIA_Orc_8208_MineGuard_RemoveOrc_01_02 " );	// RAT TOR KU BAR HAK NOR...
	AI_Output(other,self, " DIA_Orc_8208_MineGuard_RemoveOrc_01_03 " );	// To be honest, I don't understand what you're muttering.
	AI_Output(other,self, " DIA_Orc_8208_MineGuard_RemoveOrc_01_04 " );	// But if you don't want to piss him off, you'd better hurry.
	AI_Output(self,other, " DIA_Orc_8208_MineGuard_RemoveOrc_01_05 " );	// MORRA DAH TUP GRON SAKUR DAR...
	RemoveOrcDone = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8208_MineGuard_Angry(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_Angry_condition;
	information = DIA_Orc_8208_MineGuard_Angry_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Orc_8208_MineGuard_Angry_condition()
{
	if((MIS_RemoveOrc == LOG_Success) && (OrcDoneWalArDagar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_Angry_info()
{
	AI_ReadyMeleeWeapon(self);
	Snd_Play("ORC_Angry");
	AI_PlayAni(self,"T_IGETYOU");
	AI_Output(self,other, " DIA_Orc_8208_MineGuard_Angry_01_01 " );	// MORRA CRASH DAR SUR MER! AR DAGAR CAR BIT MORRA.
	AI_Output(other,self, " DIA_Orc_8208_MineGuard_Angry_01_02 " );	// Well, yes, I mixed up a little. It happens to everyone!
	AI_Output(self,other, " DIA_Orc_8208_MineGuard_Angry_01_03 " );	// HARAD KAR VAK SHAR TUG! KROTAK NABAR...
	AI_RemoveWeapon(self);
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8208_MineGuard_Angry_Perm(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_Angry_Perm_condition;
	information = DIA_Orc_8208_MineGuard_Angry_Perm_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Orc_8208_MineGuard_Angry_Perm_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_KnowsInfo(hero,DIA_Orc_8208_MineGuard_Angry) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_Angry_Perm_info()
{
	AI_PlayAni(self,"T_GETLOST");
	AI_Output(self,other, " DIA_Orc_8208_MineGuard_Angry_Perm_01_01 " );	// MORRA HARAD TAR...
	AI_StopProcessInfos(self);
};

// ------------------------------------------------ -----Twilight--------------------------------------------------------

instance DIA_Orc_8210_Umrak_EXIT(C_Info)
{
	npc = STRF_8151_Umrak;
	condition = DIA_Orc_8210_Umrak_exit_condition;
	information = DIA_Orc_8210_Umrak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8210_Umrak_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8210_Umrak_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8210_Umrak_PreHello(C_Info)
{
	npc = STRF_8151_Umrak;
	condition = DIA_Orc_8210_Umrak_PreHello_condition;
	information = DIA_Orc_8210_Umrak_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8210_Umrak_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8210_Umrak_PreHello_info()
{
	be int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random( 8 );

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random( 3 );

		if(random == 0)
		{
			AI_Output(self,other, " DIA_Orc_8210_Umrak_PreHello_01_01 " );	// Get out of here! I'll cut you to pieces...
		}
		else if(random == 1)
		{
			AI_Output(self,other, " DIA_Orc_8210_Umrak_PreHello_01_02 " );	// Not now, morra.
		}	
		else if(random == 2)
		{
			AI_Output(self,other, " DIA_Orc_8210_Umrak_PreHello_01_03 " );	// I have a lot to do.
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8210_Umrak_Hello(C_Info)
{
	npc = STRF_8151_Umrak;
	condition = DIA_Orc_8210_Umrak_Hello_condition;
	information = DIA_Orc_8210_Umrak_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8210_Umrak_Hello_condition()
{
	if((ArenaBattle_06 == TRUE) && (ArenaBattle_06_Won == FALSE) && (ArenaBattle_06_Lost == FALSE) && (UmrakIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8210_Umrak_Hello_info()
{
	Wld_SendTrigger( " EVT_ORCARENA_01 " );
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8210_Umrak_Hello_01_00");	//Хорошо!
	AI_Output(self,other, " DIA_Orc_8210_Umrak_Hello_01_01 " );	// Finally a worthy opponent.
	AI_Output(self,other, " DIA_Orc_8210_Umrak_Hello_01_02 " );	// I'll crush you like a worm...
	UmrakIsFight = TRUE;
	KnowAboutUmrak = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

// ------------------------------Urthrock---------------- ------------

instance DIA_Orc_8211_UrTrok_EXIT(C_Info)
{
	npc = STRF_8150_UrTrok;
	condition = DIA_Orc_8211_UrTrok_exit_condition;
	information = DIA_Orc_8211_UrTrok_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8211_UrTrok_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8211_UrTrok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8211_UrTrok_PreHello(C_Info)
{
	npc = STRF_8150_UrTrok;
	condition = DIA_Orc_8211_UrTrok_PreHello_condition;
	information = DIA_Orc_8211_UrTrok_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8211_UrTrok_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8211_UrTrok_PreHello_info()
{
	be int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random( 8 );

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random( 3 );

		if(random == 0)
		{
			AI_Output(self,other, " DIA_Orc_8211_UrTrok_PreHello_01_01 " );	// Orak Shaka!
		}
		else if(random == 1)
		{
			AI_Output(self,other, " DIA_Orc_8211_UrTrok_PreHello_01_02 " );	// Fight with honor...
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8211_UrTrok_PreHello_01_03");	//Исчезни!
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8211_UrTrok_Hello(C_Info)
{
	npc = STRF_8150_UrTrok;
	condition = DIA_Orc_8211_UrTrok_Hello_condition;
	information = DIA_Orc_8211_UrTrok_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8211_UrTrok_Hello_condition()
{
	if((ArenaBattle_05 == TRUE) && (ArenaBattle_05_Won == FALSE) && (ArenaBattle_05_Lost == FALSE) && (UrTrokIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8211_UrTrok_Hello_info()
{
	Wld_SendTrigger( " EVT_ORCARENA_01 " );
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_Orc_8211_UrTrok_Hello_01_01 " );	// No one can defeat me, morra.
	AI_Output(self,other, " DIA_Orc_8211_UrTrok_Hello_01_02 " );	// Now I'll tear you to pieces!
	UrTrokIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


// -------------------------------Constant---------------- ------------

instance DIA_Orc_8212_Turuk_EXIT(C_Info)
{
	npc = STRF_8149_Turuk;
	condition = DIA_Orc_8212_Turuk_exit_condition;
	information = DIA_Orc_8212_Turuk_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8212_Turuk_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8212_Turuk_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8212_Turuk_PreHello(C_Info)
{
	npc = STRF_8149_Turuk;
	condition = DIA_Orc_8212_Turuk_PreHello_condition;
	information = DIA_Orc_8212_Turuk_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8212_Turuk_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8212_Turuk_PreHello_info()
{
	be int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random( 8 );

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random( 3 );

		if(random == 0)
		{
			AI_Output(self,other, " DIA_Orc_8212_Turuk_PreHello_01_01 " );	// A good weapon should be sharp!
		}
		else if(random == 1)
		{
			AI_Output(self,other, " DIA_Orc_8212_Turuk_PreHello_01_02 " );	// Get lost!
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8212_Turuk_PreHello_01_03");	//Исчезни!
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8212_Turuk_Hello(C_Info)
{
	npc = STRF_8149_Turuk;
	condition = DIA_Orc_8212_Turuk_Hello_condition;
	information = DIA_Orc_8212_Turuk_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8212_Turuk_Hello_condition()
{
	if ((ArenaBattle_03 ==  TRUE ) && (ArenaBattle_03_Won ==  FALSE ) && (ArenaBattle_03_Lost ==  FALSE ) && (TurkIsFight ==  FALSE ) && ( Npc_GetDistToWP (hero, " ORC_CITY_ARENA_HERO " ) <  200 ) && ( Npc_Get01 " ) <  200 ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8212_Turuk_Hello_info()
{
	Wld_SendTrigger( " EVT_ORCARENA_01 " );
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8212_Turuk_Hello_01_01");	//Глупец!
	AI_Output(self,other, " DIA_Orc_8212_Turuk_Hello_01_02 " );	// Do you really think you can beat me?
	TurukIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

// -------------------------------Gunnok---------------- ------------

instance DIA_Orc_8213_Gunnok_EXIT(C_Info)
{
	npc = STRF_8148_Gunnok;
	condition = DIA_Orc_8213_Gunnok_exit_condition;
	information = DIA_Orc_8213_Gunnok_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8213_Gunnok_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8213_Gunnok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8213_Gunnok_PreHello (C_Info) .
{
	npc = STRF_8148_Gunnok;
	condition = DIA_Orc_8213_Gunnok_PreHello_condition;
	information = DIA_Orc_8213_Gunnok_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8213_Gunnok_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8213_Gunnok_PreHello_info()
{
	be int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random( 8 );

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random( 3 );

		if(random == 0)
		{
			AI_Output(self,other, " DIA_Orc_8213_Gunnok_PreHello_01_01 " );	// You're too talkative, morra.
		}
		else if(random == 1)
		{
			AI_Output(self,other, " DIA_Orc_8213_Gunnok_PreHello_01_02 " );	// Orak Shaka!
		}	
		else if(random == 2)
		{
			AI_Output(self,other, " DIA_Orc_8213_Gunnok_PreHello_01_03 " );	// Get out of here.
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8213_Gunnok_Hello(C_Info)
{
	npc = STRF_8148_Gunnok;
	condition = DIA_Orc_8213_Gunnok_Hello_condition;
	information = DIA_Orc_8213_Gunnok_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8213_Gunnok_Hello_condition()
{
	if((ArenaBattle_02 == TRUE) && (ArenaBattle_02_Won == FALSE) && (ArenaBattle_02_Lost == FALSE) && (GunnokIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8213_Gunnok_Hello_info()
{
	Wld_SendTrigger( " EVT_ORCARENA_01 " );
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_Orc_8213_Gunnok_Hello_01_01 " );	// Yes, I'll smear you!
	GunnokIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

// ------------------------------ Dagrat---------------- ------------

instance DIA_Orc_8214_Dagrag_EXIT(C_Info)
{
	npc = STRF_8147_Dagrag;
	condition = DIA_Orc_8214_Dagrag_exit_condition;
	information = DIA_Orc_8214_Dagrag_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8214_Dagrag_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8214_Dagrag_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8214_Dagrag_PreHello (C_Info) .
{
	npc = STRF_8147_Dagrag;
	condition = DIA_Orc_8214_Dagrag_PreHello_condition;
	information = DIA_Orc_8214_Dagrag_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8214_Dagrag_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8214_Dagrag_PreHello_info()
{
	be int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random( 8 );

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random( 3 );

		if(random == 0)
		{
			AI_Output(self,other, " DIA_Orc_8214_Dagrag_PreHello_01_01 " );	// Looking for problems on your head?
		}
		else if(random == 1)
		{
			AI_Output(self,other, " DIA_Orc_8214_Dagrag_PreHello_01_02 " );	// Hit hard!
		}	
		else if(random == 2)
		{
			AI_Output(self,other, " DIA_Orc_8214_Dagrag_PreHello_01_03 " );	// Orak Shaka!
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8214_Dagrag_Hello(C_Info)
{
	npc = STRF_8147_Dagrag;
	condition = DIA_Orc_8214_Dagrag_Hello_condition;
	information = DIA_Orc_8214_Dagrag_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8214_Dagrag_Hello_condition()
{
	if((ArenaBattle_01 == TRUE) && (ArenaBattle_01_Won == FALSE) && (ArenaBattle_01_Lost == FALSE) && (DagragIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8214_Dagrag_Hello_info()
{
	Wld_SendTrigger( " EVT_ORCARENA_01 " );
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_Orc_8214_Dagrag_Hello_01_01 " );	// Well, show what you're worth, morra...
	DagragIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

// -------------------------------Ur Kahn--------------- -------------

instance DIA_Orc_8215_Kan_EXIT(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_exit_condition;
	information = DIA_Orc_8215_Kan_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8215_Kan_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8215_Kan_exit_info()
{
	AI_StopProcessInfos(self);
};

var int UrKanFirstTime;

instance DIA_Orc_8215_Your_PreHello (C_Info);
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_PreHello_condition;
	information = DIA_Orc_8215_Your_PreHello_info;
	permanent = TRUE;
	description = " Hello Orc! " ;

};

func int DIA_Orc_8215_Kan_PreHello_condition()
{
	if(PlayerKnowsOrcLanguage == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_PreHello_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_PreHello_01_00 " );	// Hello, orc!

	if(UrKanFirstTime == FALSE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_PreHello_01_01 " );	// COR GAR! TOUR CAR ULU MULU M...
		AI_Output(other,self, " DIA_Orc_8215_Kan_PreHello_01_02 " );	// I don't understand you!
		NeedKnowOrcLang = TRUE;
		UrKanFirstTime = TRUE;
	};

	AI_Output(self,other, " DIA_Orc_8215_Kan_PreHello_01_03 " );	// DABAR KARAD GOR TAK NIR VAK.
	AI_Output(other,self, " DIA_Orc_8215_Kan_PreHello_01_04 " );	// Ah, it's useless! First you need to learn your language.
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8215_Kan_Hello(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Hello_condition;
	information = DIA_Orc_8215_Kan_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8215_Kan_Hello_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Hello_info()
{
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other, " DIA_Orc_8215_Kan_Hello_01_01 " );	// COR GAR! Man... I see you wearing Ulu-Mulu.
	AI_Output(other,self, " DIA_Orc_8215_Kan_Hello_01_03 " );	// So what?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Hello_01_02 " );	// I think that a man be a very strong warrior if he has Ulu-Mulu.
	AI_Output(self,other, " DIA_Orc_8215_Kan_Hello_01_04 " );	// And if so, then a person can fight other warriors here to get a lot of honor.
	AI_Output(self,other, " DIA_Orc_8215_Kan_Hello_01_05 " );	// When a lot of honor, all brothers respect the person.
};

instance DIA_Orc_8215_Kan_WhoYou(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_WhoYou_condition;
	information = DIA_Orc_8215_Kan_WhoYou_info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_Orc_8215_Kan_WhoYou_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_WhoYou_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_WhoYou_01_01");	//Ты кто?
	AI_Output(self,other, " DIA_Orc_8215_Kan_WhoYou_01_02 " );	// My name is Ur Kahn, human.
	AI_Output(other,self, " DIA_Orc_8215_Kan_WhoYou_01_03 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Orc_8215_Kan_WhoYou_01_04 " );	// Ur Kahn see to it that his warriors are always ready for battle.
	AI_Output(self,other, " DIA_Orc_8215_Kan_WhoYou_01_05 " );	// Be strong! Exercise a lot, sleep a little...
};

instance DIA_Orc_8215_Kan_Place(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Place_condition;
	information = DIA_Orc_8215_Kan_Place_info;
	permanent = FALSE;
	description = " What is this place anyway? " ;
};

func int DIA_Orc_8215_Kan_Place_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Place_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_Place_01_01 " );	// What is this place anyway?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Place_01_02 " );	// Here be the great arena of the orcs.
	AI_Output(self,other, " DIA_Orc_8215_Kan_Place_01_03 " );	// A mighty warrior is here to fight among themselves for honor, for the right to be called Mor Dar!
	AI_Output(other,self, " DIA_Orc_8215_Kan_Place_01_04 " );	// Mor Dar?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Place_01_05 " );	// In the language of the brothers, mean the best, strongest orc warrior. Much honor, much respect!
	AI_Output(other,self, " DIA_Orc_8215_Kan_Place_01_06 " );	// Ah, I understand.
};

instance DIA_Orc_8215_Kan_MorDar (C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_MorDar_condition;
	info = DIA_Orc_8215_Kan_MorDar_info;
	permanent = FALSE;
	description = " Who is Mor Dar now? " ;
};

func int DIA_Orc_8215_Kan_MorDar_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Place) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_MorDar_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_MorDar_01_01 " );	// Who is Mor Dar now?
	AI_Output(self,other, " DIA_Orc_8215_Kan_MorDar_01_02 " );	// A black orc named Ur-Karras would be the last to receive such an honor.

	if(UrKarrasInsert == TRUE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_MorDar_01_03 " );	// But he no longer fight in the arena!
		AI_Output(other,self,"DIA_Orc_8215_Kan_MorDar_01_04");	//Почему?
		AI_Output(self,other, " DIA_Orc_8215_Kan_MorDar_01_05 " );	// Ur-Karras become a great elder and go to war with Ur-Thrall against the humans.
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_MorDar_01_07 " );	// But he's long gone from the city to fight with people.
		AI_Output(self,other, " DIA_Orc_8215_Kan_MorDar_01_08 " );	// The brothers need a new Mor Dar!
	};
};

instance DIA_Orc_8215_Kan_Interes (C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Interes_condition;
	information = DIA_Orc_8215_Kan_Interes_info;
	permanent = FALSE;
	description = " Are you fighting for nothing or is there some kind of reward? " ;
};

func int DIA_Orc_8215_Kan_Interes_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Join) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Interes_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_Interes_01_01 " );	// Are you just fighting or is there some kind of reward?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Interes_01_02 " );	// If a person fights well and wins, he will receive a reward from Ur Kang for each fight.
	AI_Output(self,other, " DIA_Orc_8215_Kan_Interes_01_03 " );	// If you lose and want to fight again, then give Ur Kang some magic ore.
	AI_Output(other,self, " DIA_Orc_8215_Kan_Interes_01_04 " );	// And gold is of little interest to you, then?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Interes_01_05 " );	// Orcs do not like gold, how people love it...
	AI_Output(self,other, " DIA_Orc_8215_Kan_Interes_01_06 " );	// Orcs only love a good sword and strong armor!
	AI_Output(other,self, " DIA_Orc_8215_Kan_Interes_01_07 " );	// Why do you need magic ore then?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Interes_01_08 " );	// The brothers can make a very strong weapon out of it. Then go and fight better!
	AI_Output(other,self, " DIA_Orc_8215_Kan_Interes_01_09 " );	// And who makes these weapons for you?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Interes_01_10 " );	// Man ask Hash Torah! Only he can do it.
	KnowAboutHashTor = TRUE;
	B_LogEntry(TOPIC_OrcArena, " I get a bounty for every battle I win. If I lose a battle, I need to give Ur Kahn some pieces of magic ore for the next challenge. It is very much appreciated here, because the orcs make good weapons from it. " );
};

instance DIA_Orc_8215_Kan_GrahShar (C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_GrahShar_condition;
	info = DIA_Orc_8215_Kan_GrahShar_info;
	permanent = FALSE;
	description = " What's the grand prize? " ;
};

func int DIA_Orc_8215_Kan_GrahShar_condition()
{
	if (Npc_KnowsInfo(hero,DIA_Orc_8215_Your_Interest) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_GrahShar_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_GrahShar_01_01 " );	// And what is the main prize?
	AI_Output(self,other, " DIA_Orc_8215_Kan_GrahShar_01_02 " );	// If a person defeats everyone and becomes Mor Dar, then he will receive Grah Shah.
	AI_Output(other,self,"DIA_Orc_8215_Kan_GrahShar_01_03");	//Грах Шах?
	AI_Output(self,other, " DIA_Orc_8215_Kan_GrahShar_01_04 " );	// Great symbol of the mighty orc warrior! To make a person stronger...
	B_LogEntry(TOPIC_OrcArena, " The most valuable prize in the arena is Grah Shah. I don't know what it is. Ur Kahn didn't explain. " );
};


instance DIA_Orc_8215_Kan_Join(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Join_condition;
	information = DIA_Orc_8215_Kan_Join_info;
	permanent = FALSE;
	description = " I want to fight in the arena too. " ;
};

func int DIA_Orc_8215_Kan_Join_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Place) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Join_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_Join_01_01 " );	// I want to fight in the arena too.
	AI_Output(self,other, " DIA_Orc_8215_Kan_Join_01_02 " );	// First the person will have to prove that he is worthy of it.
	AI_Output(other,self, " DIA_Orc_8215_Kan_Join_01_03 " );	// And how to do it? Punch you in the face, orc?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Join_01_04 " );	// (laughs) A man to be funny! Ur Kang like how that joke.
	AI_Output(self,other, " DIA_Orc_8215_Kan_Join_01_05 " );	// However, this does not help him.
	AI_Output(self,other, " DIA_Orc_8215_Kan_Join_01_06 " );	// The human must defeat one of Ur Kahn's warriors! Only then will he prove that he is worthy.
	AI_Output(other,self, " DIA_Orc_8215_Kan_Join_01_07 " );	// Well, I'll deal with that somehow.
	AI_Output(self,other, " DIA_Orc_8215_Kan_Join_01_08 " );	// That's not all...(seriously) Man will fight Ulu-Mulu!
	AI_Output(self,other, " DIA_Orc_8215_Kan_Join_01_09 " );	// If he take another weapon, then die quickly! So to say Ur Kahn...
	AI_Output(other,self, " DIA_Orc_8215_Kan_Join_01_10 " );	// Yeah, I understand.
	MIS_OrcArena = LOG_Running;
	Log_CreateTopic(TOPIC_OrcArena,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcArena,LOG_Running);
	B_LogEntry(TOPIC_OrcArena, " There is an arena in the Orc City where they fight for the right to bear the title of the great Orc warrior - Mor Dar. And the orc Ur Kahn runs everything there. I expressed a desire to participate in this. First, Ur Kahn wants to test me as a fighter. I will have to defeat one of his warriors to earn the right to compete in this arena. " );
};

instance DIA_Orc_8215_Kan_JoinNext(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_JoinNext_condition;
	information = DIA_Orc_8215_Kan_JoinNext_info;
	permanent = FALSE;
	description = " And if I win the fight, what then? " ;
};

func int DIA_Orc_8215_Kan_JoinNext_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Join) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_JoinNext_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_JoinNext_01_01 " );	// And if I win the fight, what then?
	AI_Output(self,other, " DIA_Orc_8215_Kan_JoinNext_01_02 " );	// Then the person becomes one of the warriors of Ur Kahn and then can challenge his other fighters.
	AI_Output(self,other, " DIA_Orc_8215_Kan_JoinNext_01_03 " );	// Until you become a Mor Dar or die!
};

var int UrKanTellRules;

instance DIA_Orc_8215_Kan_Rules(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Rules_condition;
	information = DIA_Orc_8215_Kan_Rules_info;
	permanent = FALSE;
	description = " What are the combat rules here? " ;
};

func int DIA_Orc_8215_Kan_Rules_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_JoinNext) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Rules_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_Rules_01_01 " );	// What are the combat rules here?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Rules_01_02 " );	// Man fight only with Ulu-Mulu!
	AI_Output(other,self, " DIA_Orc_8215_Kan_Rules_01_03 " );	// What, always?!
	AI_Output(self,other, " DIA_Orc_8215_Kan_Rules_01_04 " );	// No. He can use other weapons, but only if he wins his first fight.
	AI_Output(other,self, " DIA_Orc_8215_Kan_Rules_01_05 " );	// Okay. What else?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Rules_01_06 " );	// Launch an arrow or bolt HARAD! Man to die...
	AI_Output(self,other, " DIA_Orc_8215_Kan_Rules_01_07 " );	// Use magic HARAD! Man to die again...
	AI_Output(self,other, " DIA_Orc_8215_Kan_Rules_01_08 " );	// Start the battle only after talking with the enemy! If you hit earlier, then die again ...
	AI_Output(self,other, " DIA_Orc_8215_Kan_Rules_01_09 " );	// Don't kill if win! Otherwise the brothers quickly make a man dead.
	AI_Output(self,other, " DIA_Orc_8215_Kan_Rules_01_10 " );	// If he run away, then no longer be fight on the grand arena.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Rules_01_11");	//Это все?
	AI_Output(self,other, " DIA_Orc_8215_Kan_Rules_01_12 " );	// Yes, Ur Kahn say everything.
	UrKanTellRules = TRUE;
	B_LogEntry(TOPIC_OrcArena,"Ur Kahn told me the rules of fighting in the great orc arena. You can't use any bow or crossbow here, let alone magic. This is inevitably punishable by death. I must first greet my opponent and only after that start the battle. You can't leave with arenas when the challenge is announced, otherwise I will no longer be allowed to participate in battles.And, of course, you can’t kill your opponent.In my first fight, I can’t use any other weapon except Ulu-Mulu.In subsequent fights, I can choose any other weapon .After the battle in the arena is over, I must not forget to put on Ulu-Mula, otherwise the orcs will kill me. How difficult it is for them ... But this is not surprising - after all, I am a stranger to them. ");
};

instance DIA_Orc_8215_Kan_Ready(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Ready_condition;
	information = DIA_Orc_8215_Kan_Ready_info;
	permanent = TRUE;
	description = " I'm ready to fight. " ;
};

func int DIA_Orc_8215_Kan_Ready_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Orc_8215_You_JoinNext) ==  TRUE ) && (ArenaBattle_01 ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Ready_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8147_Day);
	AI_Output(other,self, " DIA_Orc_8215_Kan_Ready_01_01 " );	// I'm ready to fight.

	if(UrKanTellRules == TRUE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_Ready_01_02 " );	// Good. Your first opponent is called Dagrag!
		AI_Output(self,other, " DIA_Orc_8215_Kan_Ready_01_03 " );	// He be Ur Kana's weakest warrior.
		AI_Output(self,other, " DIA_Orc_8215_Kan_Ready_01_04 " );	// If a human can't defeat Dagragh, he has nothing to do here.
		AI_Output(self,other, " DIA_Orc_8215_Kan_Ready_01_05 " );	// Man leave and no longer come to Ur Can.
		AI_Output(self,other, " DIA_Orc_8215_Kan_Ready_01_06 " );	// Now he's stepping into the arena! Dagrag is already waiting for him there ...
		B_LogEntry(TOPIC_OrcArena, " So, the first thing I have to do is defeat an orc named Dagrag. Well, let's see how strong the fighters are here. " );
		AI_StopProcessInfos(self);
		ArenaBattle_01 = TRUE;
		ArenaFightNow = TRUE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_Ready_01_07 " );	// First ur kahn tell the man to rule the fight!
		AI_Output(self,other, " DIA_Orc_8215_Kan_Ready_01_08 " );	// Then he's already going to fight.
	};
};

var int ReadyForRoundTwo;
var int ReadyForRoundThree;
var int ReadyForRoundFour;
var int ReadyForRoundFive;
var int ReadyForRoundSix;
var int LostLastOrcFight;

instance DIA_Orc_8215_Kan_PissOff (C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_PissOff_condition;
	information = DIA_Orc_8215_Kan_PissOff_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8215_Kan_PissOff_condition()
{
	if((UrKanPissOff == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_PissOff_info()
{
	AI_Output(self,other, " DIA_Orc_8215_Kan_PissOff_01_01 " );	// (carelessly) Man, better get going. He be weak!
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8215_Kan_Round_First(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Round_First_condition;
	information = DIA_Orc_8215_Kan_Round_First_info;
	permanent = FALSE;
	description = " I've had my first fight. " ;
};

func int DIA_Orc_8215_Kan_Round_First_condition()
{
	if (( ArenaBattle_01_Won ==  TRUE ) || ( ArenaBattle_01_Lost ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Round_First_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_Round_First_01_01 " );	// I had my first fight.

	if(ArenaBattle_01_Won == TRUE)
	{
		B_GivePlayerXP(300);
		AI_Output(self,other, " DIA_Orc_8215_Kan_Round_First_01_02 " );	// And you win it...(respectfully) Ur Kahn see that man be a skilled warrior!
		AI_Output(self,other, " DIA_Orc_8215_Kan_Round_First_01_03 " );	// Now, if he wants, he can fight with other warriors of Ur Kahn.
		AI_Output(other,self, " DIA_Orc_8215_Kan_Round_First_01_04 " );	// What about my reward?
		AI_Output(self,other, " DIA_Orc_8215_Kan_Round_First_01_05 " );	// For this fight, a person does not receive anything. Ur Kang just check man.
		B_LogEntry(TOPIC_OrcArena, " I've passed Ur Kahn's challenge. Now I can challenge other arena fighters as well. " );
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 5 " );
		};
		ArenaFightNow = FALSE;
		ReadyForRoundTwo = TRUE;
		CanArenaFightNoUluMulu = TRUE ;
	}
	else if(ArenaBattle_01_Lost == TRUE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_Round_First_01_07 " );	// And you lose it! A person to be weak and not worthy to wear Ulu-Mulu.
		AI_Output(self,other, " DIA_Orc_8215_Kan_Round_First_01_08 " );	// Ur Kahn no longer talk to the man! The one to leave.
		AI_Output(other,self,"DIA_Orc_8215_Kan_Round_First_01_09");	//Эй, постой...
		B_LogEntry(TOPIC_OrcArena, " I failed Ur Kahn's test. Now I'd better not show myself to him at all. " );
		MIS_OrcArena = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_OrcArena);
		UrKanPissOff = TRUE;
		AI_StopProcessInfos(self);
	};

	B_StartOtherRoutine(STRF_8147_Dagrag,"Start");
};

// -----------------------battle cycle----------------- ------------------------------------

instance DIA_Orc_8215_Kan_RoundTwo(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundTwo_condition;
	information = DIA_Orc_8215_Kan_RoundTwo_info;
	permanent = FALSE;
	description = " I want to fight! " ;
};

func int DIA_Orc_8215_Kan_RoundTwo_condition()
{
	if((ReadyForRoundTwo == TRUE) && (ArenaBattle_02 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundTwo_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8148_Gunnok);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundTwo_01_01 " );	// I want to fight!
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwo_01_02 " );	// Good. I knew that man would like it!
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwo_01_03 " );	// Then your next opponent is Gunnok.
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwo_01_04 " );	// He's a pretty tough and strong orc warrior. Being a man is not easy!
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwo_01_05 " );	// Now he's stepping into the arena! Ur Kang all say...
	B_LogEntry(TOPIC_OrcArena, " My next opponent is an orc named Gunnok. " );
	AI_StopProcessInfos(self);
	ArenaBattle_02 = TRUE;
	ArenaFightNow = TRUE;
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundTwoDone (C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundTwoDone_condition;
	information = DIA_Orc_8215_Kan_RoundTwoDone_info;
	permanent = TRUE;
	description = " I fought Gunnok. " ;
};

func int DIA_Orc_8215_Kan_RoundTwoDone_condition()
{
	if (( ULUMULUISEQUIP  ==  TRUE ) && (ReadyForRoundThree ==  FALSE ) && ((ArenaBattle_02_Won ==  TRUE ) || (ArenaBattle_02_Lost ==  TRUE )))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundTwoDone_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundTwoDone_01_01 " );	// I fought Gunnok.

	if(ArenaBattle_02_Won == TRUE)
	{
		B_GivePlayerXP(400);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwoDone_01_02 " );	// Ur Kahn see the fight...(respectfully) Man fight well and deserve a reward!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwoDone_01_03 " );	// Here, take these magic potions. They help restore a person's strength.
		B_GiveInvItems(self,other,ItPo_Health_03,2);
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 5 " );
		};
		AI_Output(other,self, " DIA_Orc_8215_Kan_RoundTwoDone_01_04 " );	// Thank you.
		ArenaFightNow = FALSE;
		ReadyForRoundThree = TRUE;
	}
	else if(ArenaBattle_02_Lost == TRUE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_05 " );	// Ur Kahn see the fight... (disappointed) A human being not strong enough to take down Gunnok.
		AI_Output(self,other, " DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_06 " );	// To do this, he needs to train more and become stronger.
		AI_Output(self,other, " DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_07 " );	// He'll come back when he's ready to fight Gunnok.
		AI_Output(self,other, " DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_08 " );	// And don't forget to bring Ur Kahn ore magic because lose.
		AI_Output(self,other, " DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_09 " );	// Without her, Ur Kahn won't allow people to fight in the arena!
		ArenaBattle_02_Won = FALSE ;
		ArenaBattle_02_Lost = FALSE ;
		ArenaBattle_02 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(STRF_8148_Gunnok,"Start");
};

instance DIA_Orc_8215_Kan_RoundTwo_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundTwo_Again_condition;
	information = DIA_Orc_8215_Kan_RoundTwo_Again_info;
	permanent = TRUE;
	description = " I want to fight Gunnok again. (Cost: 10 Ore) " ;
};

func int DIA_Orc_8215_Kan_RoundTwo_Again_condition()
{
	if((ReadyForRoundTwo == TRUE) && (ArenaBattle_02 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundTwo_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8148_Gunnok);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundTwo_Again_01_01 " );	// I want to fight Gunnok again.

	if(Npc_HasItems(other,ItMi_Nugget) >= 10)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,10);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwo_Again_01_02 " );	// Good. Man try to defeat Gunnok again!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwo_Again_01_03 " );	// Enter the arena! He will be waiting there...
		AI_StopProcessInfos(self);
		ArenaBattle_02 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwo_Again_01_04 " );	// Do people not have enough ore for this!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundTwo_Again_01_05 " );	// Ur Kahn does not allow people to fight in the arena.
	};
};

// -----------------------------Constant-------------- -----------------------------------------------------

instance DIA_Orc_8215_Kan_RoundThree(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundThree_condition;
	information = DIA_Orc_8215_Kan_RoundThree_info;
	permanent = FALSE;
	description = " Who is your next fighter? " ;
};

func int DIA_Orc_8215_Kan_RoundThree_condition()
{
	if((ReadyForRoundThree == TRUE) && (ArenaBattle_03 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundThree_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8149_Turuk);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundThree_01_01 " );	// Who's your next fighter?
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThree_01_02 " );	// Turuk. Be a very serious opponent!
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThree_01_03 " );	// He is very skillful in wielding his ax and defeating many strong warriors.
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThree_01_04 " );	// Man step into the arena! Turuk is already waiting for him there ...
	B_LogEntry(TOPIC_OrcArena, " Now I have to fight an orc named Turuk. " );
	AI_StopProcessInfos(self);
	ArenaBattle_03 = TRUE;
	ArenaFightNow = TRUE;
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundThreeDone (C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundThreeDone_condition;
	information = DIA_Orc_8215_Kan_RoundThreeDone_info;
	permanent = TRUE;
	description = " I fought Turuk. " ;
};

func int DIA_Orc_8215_Kan_RoundThreeDone_condition()
{
	if (( ULUMULUISEQUIP  ==  TRUE ) && (ReadyForRoundFour ==  FALSE ) && ((ArenaBattle_03_Won ==  TRUE ) || (ArenaBattle_03_Lost ==  TRUE )))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundThreeDone_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8149_Turuk);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundThreeDone_01_01 " );	// I fought Turuk.

	if(ArenaBattle_03_Won == TRUE)
	{
		B_GivePlayerXP(400);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThreeDone_01_02 " );	// Turuk be a very skilled warrior, but the man defeat him!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThreeDone_01_03 " );	// For this Ur Kang give him a black pearl as a reward.
		B_GiveInvItems(self,other,ItMi_DarkPearl,1);
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 5 " );
		};
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundThreeDone_01_04");	//Неплохо.
		ArenaFightNow = FALSE;
		ReadyForRoundFour = TRUE;
	}
	else if(ArenaBattle_03_Lost == TRUE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThreeDone_01_05 " );	// Turuk be a very skilled warrior! The man could not defeat him.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThreeDone_01_06 " );	// A human must be faster and stronger to defeat Turuk.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThreeDone_01_07 " );	// If you want to fight again, then speak Ur Kahn.
		ArenaBattle_03_Won = FALSE ;
		ArenaBattle_03_Lost = FALSE ;
		ArenaBattle_03 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Start");
};

instance DIA_Orc_8215_Kan_RoundThree_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundThree_Again_condition;
	information = DIA_Orc_8215_Kan_RoundThree_Again_info;
	permanent = TRUE;
	description = " I want to fight Turuk again. (Cost: 20 Ore) " ;
};

func int DIA_Orc_8215_Kan_RoundThree_Again_condition()
{
	if((ReadyForRoundThree == TRUE) && (ArenaBattle_03 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundThree_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8149_Turuk);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundThree_Again_01_01 " );	// I want to fight Turuk again.

	if(Npc_HasItems(other,ItMi_Nugget) >= 20)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,20);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThree_Again_01_02 " );	// Human wants to challenge the fearsome Turuk?
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThree_Again_01_03 " );	// Ur Kahn don't mind! Go to the arena and fight him.
		AI_StopProcessInfos(self);
		ArenaBattle_03 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		Npc_ClearAIQueue(ArenaFighter);
		AI_RemoveWeapon(ArenaFighter);
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThree_Again_01_04 " );	// Do people not have enough ore for this!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundThree_Again_01_05 " );	// Ur Kahn does not allow people to fight in the arena.
	};
};

// --------------------------------Hart--------------- -------------------------------------------------- ---------------------

instance DIA_Orc_8215_Kan_RoundFour(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFour_condition;
	information = DIA_Orc_8215_Kan_RoundFour_info;
	permanent = FALSE;
	description = " Do you have better fighters? " ;
};

func int DIA_Orc_8215_Kan_RoundFour_condition()
{
	if((ReadyForRoundFour == TRUE) && (ArenaBattle_04 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFour_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8146_Hart);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundFour_01_01 " );	// Do you have stronger fighters?
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFour_01_02 " );	// Of course. The next fight will be with a man named Hart!
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFour_01_03 " );	// He will earn his right to fight here by slaying many of Ur Kang's fearsome brothers.
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFour_01_04 " );	// Step into the arena now! Ur Kang wish man good luck...
	B_LogEntry(TOPIC_OrcArena, " It's time to fight Hart, the only human in the Orc Arena. " );
	AI_StopProcessInfos(self);
	ArenaBattle_04 = TRUE;
	ArenaFightNow = TRUE;
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundFourDone (C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFourDone_condition;
	information = DIA_Orc_8215_Can_RoundFourDone_info;
	permanent = TRUE;
	description = " I fought Hart. " ;
};

func int DIA_Orc_8215_Can_RoundFourDone_condition();
{
	if (( READYForRoundFive ==  FALSE  ) && ( ( ArenaBattle_04_Won == TRUE  ) || ( ArenaBattle_04_Lost == TRUE ) ) )  
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Our_RoundFourDone_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8146_Hart);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundFourDone_01_01 " );	// I fought Hart.

	if(ArenaBattle_04_Won == TRUE)
	{
		B_GivePlayerXP(500);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFourDone_01_02 " );	// And you were able to defeat him! Although he be a strong and agile warrior.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFourDone_01_03 " );	// As a reward, a person will now receive a black troll skin.
		B_GiveInvItems(self,other,ItAt_TrollBlackFur,1);
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 5 " );
		};

		ArenaFightNow = FALSE;
		ReadyForRoundFive = TRUE;
	}
	else if(ArenaBattle_04_Lost == TRUE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFourDone_01_04 " );	// The man couldn't defeat his brother...
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFourDone_01_05 " );	// That being too strong and agile for him.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFourDone_01_06 " );	// Now he's going to learn how to fight the sword better.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFourDone_01_07 " );	// And then come to the arena again.
		ArenaBattle_04_Won = FALSE ;
		ArenaBattle_04_Lost = FALSE ;
		ArenaBattle_04 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Start");
	AI_Teleport(STRF_8146_Hart,"ORC_CITY_HART");
};

instance DIA_Orc_8215_Kan_RoundFour_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFour_Again_condition;
	information = DIA_Orc_8215_Kan_RoundFour_Again_info;
	permanent = TRUE;
	description = " I want to fight Hart again. (Cost: 30 Ore) " ;
};

func int DIA_Orc_8215_Kan_RoundFour_Again_condition()
{
	if((ReadyForRoundFour == TRUE) && (ArenaBattle_04 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFour_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8146_Hart);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundFour_Again_01_01 " );	// I want to fight Hart again.

	if(Npc_HasItems(other,ItMi_Nugget) >= 30)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,30);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFour_Again_01_02 " );	// A person has an ore of magic, mean to be a fight!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFour_Again_01_03 " );	// Now step into the arena and defeat your enemy.
		AI_StopProcessInfos(self);
		ArenaBattle_04 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		Npc_ClearAIQueue(ArenaFighter);
		AI_RemoveWeapon(ArenaFighter);
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFour_Again_01_04 " );	// Do people not have enough ore for this!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFour_Again_01_05 " );	// Ur Kahn does not allow people to fight in the arena.
	};
};

// --------------------------------Ur Throk-------------- --------------------------

instance DIA_Orc_8215_Kan_RoundFive(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFive_condition;
	information = DIA_Orc_8215_Kan_RoundFive_info;
	permanent = FALSE;
	description = " I need a new fighter. " ;
};

func int DIA_Orc_8215_Kan_RoundFive_condition()
{
	if((ReadyForRoundFive == TRUE) && (ArenaBattle_05 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFive_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8150_UrTrok);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundFive_01_01 " );	// I need a new fighter.
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFive_01_02 " );	// And man get it...(respectfully) Ur Throk be one of Ur Kang's finest warrior!
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFive_01_03 " );	// The one to hit so hard that he could kill a man with one blow.
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFive_01_04 " );	// Now step into the arena! He's waiting for you...
	B_LogEntry(TOPIC_OrcArena, " Ur Throk is my next opponent. " );
	AI_StopProcessInfos(self);
	ArenaBattle_05 = TRUE;
	ArenaFightNow = TRUE;
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundFiveDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFiveDone_condition;
	information = DIA_Orc_8215_Kan_RoundFiveDone_info;
	permanent = TRUE;
	description = " I fought Ur Throk. " ;
};

func int DIA_Orc_8215_Kan_RoundFiveDone_condition()
{
	if (( READYForRoundSix  ==  TRUE ) && ( ( ArenaBattle_05_Won ==  TRUE ) || ( ArenaBattle_05_Lost == TRUE ) ) )  
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFiveDone_info()
{
	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundFiveDone_01_01 " );	// I fought Ur Throk.

	if(ArenaBattle_05_Won == TRUE)
	{
		B_GivePlayerXP(600);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFiveDone_01_02 " );	// Ur Kahn admire the strength of a man! Defeating Ur Throk can be very difficult.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFiveDone_01_03 " );	// So he give the person a very valuable reward. Potion of strength!
		B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		AI_Output(other,self, " DIA_Orc_8215_Kan_RoundFiveDone_01_04 " );	// It certainly won't hurt me.
		ArenaFightNow = FALSE;
		ReadyForRoundSix = TRUE;
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 5 " );
		};
	}
	else if(ArenaBattle_05_Lost == TRUE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFiveDone_01_05 " );	// Ur Kahn warn people that Ur Throk be very strong.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFiveDone_01_06 " );	// And he could see for himself.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFiveDone_01_07 " );	// You have to be much stronger to defeat Ur Throk!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFiveDone_01_08 " );	// Man step to train! If fighting again, then speak Ur Kahn.
		ArenaBattle_05_Won = FALSE ;
		ArenaBattle_05_Lost = FALSE ;
		ArenaBattle_05 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(STRF_8150_UrTrok,"Start");
};

instance DIA_Orc_8215_Kan_RoundFive_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFive_Again_condition;
	information = DIA_Orc_8215_Kan_RoundFive_Again_info;
	permanent = TRUE;
	description = " I want to fight Ur Throk again. (Cost: 60 Ore) " ;
};

func int DIA_Orc_8215_Kan_RoundFive_Again_condition()
{
	if((ReadyForRoundFive == TRUE) && (ArenaBattle_05 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFive_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8150_UrTrok);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundFive_Again_01_01 " );	// I want to fight Ur Throk again.

	if(Npc_HasItems(other,ItMi_Nugget) >= 60)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,60);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFive_Again_01_02 " );	// If a person is confident in his strength, then Ur Kahn will start the fight.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFive_Again_01_03 " );	// Go man! Ur Throk wait for him.
		AI_StopProcessInfos(self);
		ArenaBattle_05 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFive_Again_01_04 " );	// Do people not have enough ore for this!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundFive_Again_01_05 " );	// Ur Kahn does not allow people to fight in the arena.
	};
};

// -----------------------------------Twilight------------- ----------------------------------

instance DIA_Orc_8215_Kan_RoundSix(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundSix_condition;
	information = DIA_Orc_8215_Kan_RoundSix_info;
	permanent = FALSE;
	description = " Do you still have anyone left? " ;
};

func int DIA_Orc_8215_Kan_RoundSix_condition()
{
	if((ReadyForRoundSix == TRUE) && (ArenaBattle_06 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundSix_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8151_Umrak);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundSix_01_01 " );	// Do you still have anyone left?
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSix_01_02 " );	// Only Umrak can't oppose people.
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSix_01_03 " );	// This is the strongest warrior Ur Kahn! Even the great Ur-Thrall is not inferior in strength.
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSix_01_04 " );	// Man first think well. Does he really want to fight Umrak?
	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundSix_01_05 " );	// Give it here already!
	AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSix_01_06 " );	// (seriously) Good. Be so! Enter the arena, fight Umrak Dar.
	B_LogEntry(TOPIC_OrcArena, " My last battle in the arena. Umrak will fight against me. According to Ur Kahn, this is a very serious opponent. He is not inferior in strength to the great leader of the orcs. " );
	AI_StopProcessInfos(self);
	ArenaBattle_06 = TRUE;
	ArenaFightNow = TRUE;
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundSixDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundSixDone_condition;
	information = DIA_Orc_8215_Kan_RoundSixDone_info;
	permanent = TRUE;
	description = " I fought the Dyomk. " ;
};

func int DIA_Orc_8215_Kan_RoundSixDone_condition()
{
	if (( ULUMULUISEQUIP  ==  TRUE ) && ( HeroIsMorDar ==  FALSE ) && (( ArenaBattle_06_Won ==  TRUE ) || ( ArenaBattle_06_Lost ==  TRUE )))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundSixDone_info()
{

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundSixDone_01_01 " );	// I fought Umrak.

	if(ArenaBattle_06_Won == TRUE)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSixDone_01_02 " );	// Ur Kahn can't believe your eyes! Man defeat the Umrak himself!
		AI_Output(other,self, " DIA_Orc_8215_Kan_RoundSixDone_01_03 " );	// Yes, and it wasn't easy!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSixDone_01_04 " );	// Then now a person becomes Mor Dar! The best warrior of the great orc arena.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSixDone_01_05 " );	// There is no one stronger than him here. A lot of power, a lot of honor and respect.
		AI_Output(other,self, " DIA_Orc_8215_Kan_RoundSixDone_01_06 " );	// Where's my reward?
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSixDone_01_07 " );	// Here, a person to receive Grah Shah! The most valuable reward he could ever have.
		B_GiveInvItems(self,other,ItMi_GrahShar,1);
		AI_Output(other,self, " DIA_Orc_8215_Kan_RoundSixDone_01_08 " );	// Interesting stuff. What is she for?
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSixDone_01_09 " );	// Man dress her up and watch! Ur Kahn think that a person is self-understand.
		ORCRESPECT = ORCRESPECT + 45;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 45 " );
		};

		ArenaFightNow = FALSE;
		HeroIsMorDar = TRUE;
		MIS_OrcArena = LOG_Success;
		Log_SetTopicStatus(TOPIC_OrcArena,LOG_Success);
		B_LogEntry(TOPIC_OrcArena, " Now I am Mor Dar, champion of the great orc arena! " );
	}
	else if(ArenaBattle_06_Lost == TRUE)
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSixDone_01_11 " );	// Ur Kahn is not surprised that a person lose Umrak.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSixDone_01_12 " );	// He's still lucky that Umrak didn't kill him!
		AI_Output(other,self, " DIA_Orc_8215_Kan_RoundSixDone_01_13 " );	// Yeah, this guy is pretty tough.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSixDone_01_14 " );	// Because to be the best, to be almost Mor Dar!
		ArenaBattle_06_Won = FALSE ;
		ArenaBattle_06_Lost = FALSE ;
		ArenaBattle_06 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(STRF_8151_Umrak,"Start");
};

instance DIA_Orc_8215_Kan_RoundSix_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundSix_Again_condition;
	information = DIA_Orc_8215_Kan_RoundSix_Again_info;
	permanent = TRUE;
	description = " I want to fight Umrak again. (Cost: 100 Ore) " ;
};

func int DIA_Orc_8215_Kan_RoundSix_Again_condition()
{
	if((ReadyForRoundSix == TRUE) && (ArenaBattle_06 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundSix_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8151_Umrak);

	AI_Output(other,self, " DIA_Orc_8215_Kan_RoundSix_Again_01_01 " );	// I want to fight Umrak again.

	if(Npc_HasItems(other,ItMi_Nugget) >= 100)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSix_Again_01_02 " );	// Is the person sure to want this?
		AI_Output(other,self, " DIA_Orc_8215_Kan_RoundSix_Again_01_03 " );	// I have to defeat him.
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSix_Again_01_04 " );	// Then go! The great battle is about to begin...
		AI_StopProcessInfos(self);
		ArenaBattle_06 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSix_Again_01_05 " );	// Do people not have enough ore for this!
		AI_Output(self,other, " DIA_Orc_8215_Kan_RoundSix_Again_01_06 " );	// Ur Kahn does not allow people to fight in the arena.
	};
};

// ------------------------------------------------ --Ur-So-------------------------------

instance DIA_STRF_8152_UrTak_EXIT(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_exit_condition;
	information = DIA_STRF_8152_UrTak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8152_UrTak_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8152_UrTak_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8152_UrTak_Hello(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_Hello_condition;
	information = DIA_STRF_8152_UrTak_Hello_info;
	permanent = FALSE;
	description = " Working out? " ;
};

func int DIA_STRF_8152_UrTak_Hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8152_UrTak_Hello_info()
{
	AI_Output(other,self, " DIA_STRF_8152_UrTak_Hello_01_01 " );	// Working out?
	AI_Output(self,other, " DIA_STRF_8152_UrTak_Hello_01_02 " );	// Urtak wants to be a strong warrior...(seriously) Wants to be like his brother Umrak!
	AI_Output(self,other, " DIA_STRF_8152_UrTak_Hello_01_03 " );	// Therefore, the person does not interfere with Urtak! Otherwise, he will get very angry and the person will beat.
	AI_Output(other,self, " DIA_STRF_8152_UrTak_Hello_01_04 " );	// How formidable you are.
};


instance DIA_STRF_8152_UrTak_Umrak (C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_Umrak_condition;
	information = DIA_STRF_8152_UrTak_Umrak_info;
	permanent = FALSE;
	description = " Darkness is your brother? " ;
};

func int DIA_STRF_8152_UrTak_Umrak_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_STRF_8152_UrTak_Hello) ==  TRUE ) && (KnowAboutUmrak ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_Umrak_info()
{
	AI_Output(other,self, " DIA_STRF_8152_UrTak_Umrak_01_01 " );	// Umrak is your brother?
	AI_Output(self,other, " DIA_STRF_8152_UrTak_Umrak_01_02 " );	// (proudly) Be like that. Be a very strong warrior! Fight in the great arena of brothers.
};

instance DIA_STRF_8152_UrTak_Teach(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_Teach_condition;
	information = DIA_STRF_8152_UrTak_Teach_info;
	permanent = FALSE;
	description = " Show me some of your tricks? " ;
};

func int DIA_STRF_8152_UrTak_Teach_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8152_UrTak_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_Teach_info()
{
	AI_Output(other,self, " DIA_STRF_8152_UrTak_Teach_01_01 " );	// Show me some of your tricks?
	AI_Output(self,other, " DIA_STRF_8152_UrTak_Teach_01_02 " );	// Why should Urtak do this? Urtak think that man be weak!
	AI_Output(other,self, " DIA_STRF_8152_UrTak_Teach_01_03 " );	// Can we check?
	AI_Output(self,other, " DIA_STRF_8152_UrTak_Teach_01_04 " );	// Ar Dagar forbid fighting here! If you disobey, then the brothers will kill people and Urtak.
	AI_Output(self,other, " DIA_STRF_8152_UrTak_Teach_01_05 " );	// If a person wants to prove to Urtak that he is strong, then go and defeat Umrak!
	AI_Output(self,other, " DIA_STRF_8152_UrTak_Teach_01_06 " );	// Then Urthak teach him to fight with the weapons of his brothers.
	MIS_UrTakTeach = LOG_Running;
	Log_CreateTopic(TOPIC_UrTakTeach,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_UrTakTeach,LOG_Running);
	B_LogEntry(TOPIC_UrTakTeach, " Urtak will show me how to fight with orc weapons. But only if I can defeat his brother Umrak in the orc arena. " );
};


instance DIA_STRF_8152_UrTak_TeachDone(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_TeachDone_condition;
	information = DIA_STRF_8152_UrTak_TeachDone_info;
	permanent = FALSE;
	description = " I defeated your brother in the arena! " ;
};

func int DIA_STRF_8152_UrTak_TeachDone_condition()
{
	if((MIS_UrTakTeach == LOG_Running) && (HeroIsMorDar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_TeachDone_info()
{
	AI_Output(other,self, " DIA_STRF_8152_UrTak_TeachDone_01_01 " );	// I defeated your brother in the arena!
	AI_Output(self,other, " DIA_STRF_8152_UrTak_TeachDone_01_02 " );	// Man to overcome the Twilight? (respectfully) Then he be a great warrior!
	AI_Output(self,other, " DIA_STRF_8152_UrTak_TeachDone_01_03 " );	// It's a great honor for Urtak to teach him how to fight.
	AI_PlayAni(self,"T_GREETGRD");
	MIS_UrTakTeach = LOG_Success;
	Log_SetTopicStatus(TOPIC_UrTakTeach,LOG_Success);
	B_LogEntry(TOPIC_UrTakTeach, " Now Urtak will show me how to fight with orc weapons. " );
};

instance DIA_STRF_8152_UrTak_OFStyle(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_OFStyle_condition;
	information = DIA_STRF_8152_UrTak_OFStyle_info;
	permanent = TRUE;
	description = " Teach me how to use orc weapons. (Training Points: 10) " ;
};

func int DIA_STRF_8152_UrTak_OFStyle_condition()
{
	if((MIS_UrTakTeach == LOG_Success) && (OFStyle == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_OFStyle_info()
{
	var int cost;

	cost = 10 ;

	AI_Output(other,self, " DIA_STRF_8152_UrTak_OFStyle_01_00 " );	// Teach me how to fight with orc weapons.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other, " DIA_STRF_8152_UrTak_OFStyle_01_01 " );	// Do people not have enough experience for this! Urtak can't teach him...
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= kosten)
	{
		AI_Output(self,other, " DIA_STRF_8152_UrTak_OFStyle_01_02 " );	// Then listen to Urtak carefully. He will speak.
		AI_Output(self,other, " DIA_STRF_8152_UrTak_OFStyle_01_03 " );	// The weapons of the brothers be very heavy for a man! Hard to hold, hard to fight.
		AI_Output(self,other, " DIA_STRF_8152_UrTak_OFStyle_01_04 " );	// He gets tired quickly, lose strength and lose the battle.
		AI_Output(self,other, " DIA_STRF_8152_UrTak_OFStyle_01_05 " );	// Urtak to show how to hold a weapon correctly, how to strike correctly.
		AI_Output(self,other, " DIA_STRF_8152_UrTak_OFStyle_01_06 " );	// A person must use the weight of the weapon, not their own strength, to hit.
		AI_Output(self,other, " DIA_STRF_8152_UrTak_OFStyle_01_07 " );	// Then he can use his brothers' weapons correctly!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		AI_Print( " Learned: Orc Weapon Proficiency " );
		OFStyle = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_STRF_8152_UrTak_WhatDo(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_WhatDo_condition;
	information = DIA_STRF_8152_UrTak_WhatDo_info;
	permanent = FALSE;
	description = " What are you even doing here? " ;
};

func int DIA_STRF_8152_UrTak_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8152_UrTak_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_WhatDo_info()
{
	AI_Output(other,self, " DIA_STRF_8152_UrTak_WhatDo_01_01 " );	// What are you even doing here?
	AI_Output(self,other, " DIA_STRF_8152_UrTak_WhatDo_01_02 " );	// Urtak guard the entrance to the deep mine.
	AI_Output(self,other, " DIA_STRF_8152_UrTak_WhatDo_01_03 " );	// If an enemy comes from below, then Urtak will fight him!
	AI_Output(other,self, " DIA_STRF_8152_UrTak_WhatDo_01_04 " );	// And what kind of enemy is there?
	AI_Output(self,other, " DIA_STRF_8152_UrTak_WhatDo_01_05 " );	// Urtak doesn't know this, but the other brothers say he's very strong!
	AI_Output(self,other, " DIA_STRF_8152_UrTak_WhatDo_01_06 " );	// He even wants to go see for himself, but Ar Dagar can't say Urtak.
	AI_Output(self,other, " DIA_STRF_8152_UrTak_WhatDo_01_07 " );	// Urtak is very sad. Urtak want to fight the enemy!
	AI_Output(other,self, " DIA_STRF_8152_UrTak_WhatDo_01_08 " );	// Well, don't be upset! Maybe you'll get another chance like this.
	MIS_UrTakWannaFight = LOG_Running;
	Log_CreateTopic(TOPIC_UrTakWannaFight,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_UrTakWannaFight,LOG_Running);
	B_LogEntry(TOPIC_UrTakWannaFight, " Orc Urtak wants to fight the evil that lurks in the deep mine. But since Ar Dagar forbade anyone to go down there, Urtak is very sad about it. If I suddenly go there, I must not forget about this warrior. " ) ;
};

instance DIA_STRF_8152_UrTak_GoWithMe(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_GoWithMe_condition;
	information = DIA_STRF_8152_UrTak_GoWithMe_info;
	permanent = FALSE;
	description = " Will you come with me to fight in the deep mine? " ;
};

func int DIA_STRF_8152_UrTak_GoWithMe_condition()
{
	if((MIS_LowLevel == LOG_Running) && (MIS_UrTakWannaFight == LOG_Running) && (GoFightDeepMine == TRUE) && (DeepMineArrived == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_GoWithMe_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_STRF_8152_UrTak_GoWithMe_01_01 " );	// Will you come with me to fight in a deep mine?
	AI_Output(self,other, " DIA_STRF_8152_UrTak_GoWithMe_01_02 " );	// Человек не шутить с Отрак? Razve Ar Dagar ne preshechat nikomu hodit there?
	AI_Output(other,self, " DIA_STRF_8152_UrTak_GoWithMe_01_03 " );	// Ar Dagar gave me his consent.
	AI_Output(other,self, " DIA_STRF_8152_UrTak_GoWithMe_01_04 " );	// So now I'm heading downstairs with a few of your warriors to deal with the evil that's settled there.
	AI_Output(self,other, " DIA_STRF_8152_UrTak_GoWithMe_01_05 " );	// Urtak be glad that the man didn't forget about him! He go along with him to fight in the deep mine.
	AI_Output(other,self, " DIA_STRF_8152_UrTak_GoWithMe_01_06 " );	// Then go to the lift. Gathering there.
	AI_Output(self,other, " DIA_STRF_8152_UrTak_GoWithMe_01_07 " );	// Good! Urtak already go.

	if(MIS_UrTakWannaFight != LOG_Success)
	{
		MIS_UrTakWannaFight = LOG_Success;
		Log_SetTopicStatus(TOPIC_UrTakWannaFight,LOG_Success);
		B_LogEntry(TOPIC_UrTakWannaFight, " I took Urtak with me to the deep mine. " );
	};

	AI_StopProcessInfos(self);

	if((OrcMineFightReady == TRUE) && (ORCMINEKILL_01 == FALSE))
	{
		Npc_ExchangeRoutine(STRF_8152_UrTak,"Elevator");
	}
	else
	{
		Npc_ExchangeRoutine(self,"NearFight");
	};
};


// ------------------------------------------------ --Orcs of UrThrall-------------------------------

instance DIA_STRF_8153_Fighter_EXIT(C_Info)
{
	npc = STRF_2153_Fighter;
	condition = DIA_STRF_8153_Fighter_exit_condition;
	information = DIA_STRF_8153_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8153_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8153_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8153_Fighter_PreHello (C_Info);
{
	npc = STRF_2153_Fighter;
	condition = DIA_STRF_8153_Fighter_PreHello_condition;
	information = DIA_STRF_8153_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8153_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8153_Fighter_PreHello_info()
{
	be int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random( 8 );

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8214_Dagrag_PreHello_01_03 " );	// Orak Shaka!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8154_Fighter_EXIT(C_Info)
{
	npc = STRF_2154_Fighter;
	condition = DIA_STRF_8154_Fighter_exit_condition;
	information = DIA_STRF_8154_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8154_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8154_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8154_Fighter_PreHello (C_Info);
{
	npc = STRF_2154_Fighter;
	condition = DIA_STRF_8154_Fighter_PreHello_condition;
	information = DIA_STRF_8154_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8154_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8154_Fighter_PreHello_info()
{
	be int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random( 8 );

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8214_Dagrag_PreHello_01_03 " );	// Orak Shaka!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8155_Fighter_EXIT(C_Info)
{
	npc = STRF_2155_Fighter;
	condition = DIA_STRF_8155_Fighter_exit_condition;
	information = DIA_STRF_8155_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8155_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8155_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8155_Fighter_PreHello (C_Info);
{
	npc = STRF_2155_Fighter;
	condition = DIA_STRF_8155_Fighter_PreHello_condition;
	information = DIA_STRF_8155_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8155_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8155_Fighter_PreHello_info()
{
	be int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random( 8 );

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8214_Dagrag_PreHello_01_03 " );	// Orak Shaka!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8156_Fighter_EXIT(C_Info)
{
	npc = STRF_2156_Fighter;
	condition = DIA_STRF_8156_Fighter_exit_condition;
	information = DIA_STRF_8156_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8156_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8156_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8156_Fighter_PreHello (C_Info);
{
	npc = STRF_2156_Fighter;
	condition = DIA_STRF_8156_Fighter_PreHello_condition;
	information = DIA_STRF_8156_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8156_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8156_Fighter_PreHello_info()
{
	be int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random( 8 );

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8214_Dagrag_PreHello_01_03 " );	// Orak Shaka!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8157_Fighter_EXIT(C_Info)
{
	npc = STRF_2157_Fighter;
	condition = DIA_STRF_8157_Fighter_exit_condition;
	information = DIA_STRF_8157_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8157_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8157_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8157_Fighter_PreHello (C_Info);
{
	npc = STRF_2157_Fighter;
	condition = DIA_STRF_8157_Fighter_PreHello_condition;
	information = DIA_STRF_8157_Fighter_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8157_Fighter_PreHello_condition()
{
	return TRUE;
};

func void DIA_STRF_8157_Fighter_PreHello_info()
{
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other, " DIA_Orc_8214_Dagrag_PreHello_01_03 " );	// Orak Shaka!
	AI_Output(self,other, " DIA_STRF_8157_Fighter_PreHello_01_01 " );	// Send us a great leader to go fight in the deep mine!
	AI_Output(other,self, " DIA_STRF_8157_Fighter_PreHello_01_02 " );	// There aren't many of you.
	AI_Output(self,other, " DIA_STRF_8157_Fighter_PreHello_01_03 " );	// All the warriors here are all very strong! Many times fight with the enemy and defeat him.
	AI_Output(other,self, " DIA_STRF_8157_Fighter_PreHello_01_04 " );	// Well, let's hope you're right and they really help me.
	AI_Output(self,other, " DIA_STRF_8157_Fighter_PreHello_01_05 " );	// Man letting you know when to start! We're waiting here for his signal...
};

instance DIA_STRF_8157_Fighter_Go(C_Info)
{
	npc = STRF_2157_Fighter;
	condition = DIA_STRF_8157_Fighter_Go_condition;
	information = DIA_STRF_8157_Fighter_Go_info;
	permanent = FALSE;
	description = " Get on the platform! We're starting. " ;
};

func int DIA_STRF_8157_Fighter_Go_condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_STRF_8157_Fighter_PreHello ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_STRF_8157_Fighter_Go_info()
{
	AI_Output(other,self, " DIA_STRF_8157_Fighter_Go_01_01 " );	// Get on the platform! We begin.
	AI_Output(self,other, " DIA_STRF_8157_Fighter_Go_01_02 " );	// Good! Then the person takes the key to lower the platform.
	B_GiveInvItems(self,other,ItKe_OrcMine_Elevator,1);
	AI_Output(self,other, " DIA_STRF_8157_Fighter_Go_01_03 " );	// Orak Shaka!
	OrcMineFightReady = TRUE;
	AI_StopProcessInfos(self);
	B_SetAttitude(STRF_2153_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2154_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2155_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2156_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2157_Fighter,ATT_FRIENDLY);
	Npc_ExchangeRoutine(STRF_2153_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2154_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2155_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2156_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2157_Fighter,"Elevator");

	if ((MIS_UrTakWannaFight == LOG_Success) && (Npc_IsDead(STRF_8152_UrTak) ==  FALSE ))
	{
		Npc_ExchangeRoutine(STRF_8152_UrTak,"Elevator");
		AI_Teleport(STRF_8152_UrTak,"ORCMINE_FIGHTER_URTAK");
		B_SetAttitude(STRF_8152_UrTak, ATT_FRIENDLY );
	};
};

// ------------------------------------------------ ------orc blacksmith--------------------------

instance DIA_Orc_8571_HashTor_EXIT(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_exit_condition;
	information = dia_Orc_8571_HashTor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_Orc_8571_HashTor_exit_condition()
{
	return TRUE;
};

func void dia_Orc_8571_HashTor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8571_HashTor_PreHello(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = DIA_Orc_8571_HashTor_PreHello_condition;
	information = DIA_Orc_8571_HashTor_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8571_HashTor_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8571_HashTor_PreHello_info()
{
	AI_Output(self,other, " DIA_Orc_8571_HashTor_PreHello_01_01 " );	// KARAT DAR POR NURAK KAR?
	AI_Output(other,self,"DIA_Orc_8571_HashTor_PreHello_01_02");	//Эммм...
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8571_HashTor_UpHello(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = DIA_Orc_8571_HashTor_UpHello_condition;
	information = DIA_Orc_8571_HashTor_UpHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8571_HashTor_UpHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8571_HashTor_UpHello_info()
{
	AI_Output(self,other, " DIA_Orc_8571_HashTor_UpHello_01_02 " );	// What man should be from Hash Tor?
};

instance DIA_Orc_8571_HashTor_HELLO(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_hello_condition;
	information = dia_Orc_8571_HashTor_hello_info;
	permanent = FALSE;
	description = " You're a blacksmith, aren't you? " ;
};

func int dia_Orc_8571_HashTor_hello_condition()
{
	if(KnowAboutHashTor == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_hello_info()
{
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Hello_01_01 " );	// You're a blacksmith, aren't you?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Hello_01_02 " );	// (approvingly) DAG TAKAR. Hash Tor be the master of iron ore! Being a blacksmith is how people talk.
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Hello_01_03 " );	// Ur Kahn said you make weapons from magical ores. This is true?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Hello_01_04 " );	// Yes, Hash Tor do! But only if the brothers bring him a lot of ore magic.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Hello_01_05 " );	// Orc weapons to be very big and heavy! You need a lot of ore magic to forge it.
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Hello_01_06 " );	// Can you teach me this?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Hello_01_07 " );	// Orc weapons don't need a human... He doesn't even know how to handle them!
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Hello_01_08 " );	// If a man learn how to fight with orc weapons, then Hash Tor show him how to make it.
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Hello_01_09 " );	// And who can teach this?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Hello_01_10 " );	// Hash Tor not to know! The man himself ask the brothers about it.
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Hello_01_11 " );	// Okay, I understand you.
	MIS_HashTorRule = LOG_Running;
	Log_CreateTopic(TOPIC_HashTorRule,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HashTorRule,LOG_Running);
	B_LogEntry(TOPIC_HashTorRule, " Blacksmith Hash Tor can teach me how to make orc weapons if I learn how to use them. " );	
};

instance DIA_Orc_8571_HashTor_Rule(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Rule_condition;
	information = dia_Orc_8571_HashTor_Rule_info;
	permanent = FALSE;
	description = " I can use orc weapons. " ;
};

func int dia_Orc_8571_HashTor_Rule_condition()
{
	if((MIS_HashTorRule == LOG_Running) && (OFStyle == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Rule_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Rule_01_01 " );	// I can use orc weapons.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Rule_01_02 " );	// URAK SHAKA MORA...(approvingly) Hash Tor see this! A man to be strong if he could learn it.
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Rule_01_03 " );	// Now will you show me how to forge orc ore weapons?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Rule_01_04 " );	// Hash Tor promise - Hash Tor keep your word!
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Rule_01_05 " );	// He will teach this to a person, if he has enough ore of magic and experience.
	MIS_HashTorRule = LOG_Success;
	Log_SetTopicStatus(TOPIC_HashTorRule,LOG_Success);
	B_LogEntry(TOPIC_HashTorRule, " Now that I know how to fight with Orc weapons, I'm sure Hash Tor can teach me how to forge Orc swords and axes. Hash Tor takes magic ore as payment. " );	
	Log_CreateTopic(TOPIC_ORCWEAPON,LOG_NOTE);
	B_LogEntry_Quiet( TOPIC_ORCWEAPON , " Forging Orc Weapons... " );
};

var int HashTorTeachAll;

instance DIA_Orc_8571_HashTor_Teach(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Teach_condition;
	information = dia_Orc_8571_HashTor_Teach_info;
	permanent = TRUE;
	description = " Teach me how to make orc ore weapons. " ;
};

func int dia_Orc_8571_HashTor_Teach_condition()
{
	if((MIS_HashTorRule == LOG_Success) && (HashTorTeachAll == FALSE))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Teach_info()
{
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Teach_01_01 " );	// Teach me how to forge orc ore weapons.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Teach_01_02 " );	// What exactly does the person want to know?
	Info_ClearChoices(DIA_Orc_8571_HashTor_Teach);
	Info_AddChoice(DIA_Orc_8571_HashTor_Teach,Dialog_Back,DIA_Orc_8571_HashTor_Teach_Back);

	if(ORCWEAPON_LINE_STR_01 == FALSE)
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach, " Ore Orc Ax (Ore: 125) " ,DIA_Orc_8571_HashTor_Teach_STR_01);
	};
	if((ORCWEAPON_LINE_STR_01 == TRUE) && (ORCWEAPON_LINE_STR_02 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach, " Warrior's Ore Sword (Ore: 250) " ,DIA_Orc_8571_HashTor_Teach_STR_02);
	};
	if((ORCWEAPON_LINE_STR_02 == TRUE) && (ORCWEAPON_LINE_STR_03 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach, " Ore Battle Ax (Ore Chunks: 500) " ,DIA_Orc_8571_HashTor_Teach_STR_03);
	};
	if((ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_01 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach, " Ore Orc Cleaver (Ore: 125) " ,DIA_Orc_8571_HashTor_Teach_HP_01);
	};
	if((ORCWEAPON_LINE_HP_01 == TRUE) && (ORCWEAPON_LINE_HP_02 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach, " Elder's Ore Sword (Ore: 250) " ,DIA_Orc_8571_HashTor_Teach_HP_02);
	};
	if((ORCWEAPON_LINE_HP_02 == TRUE) && (ORCWEAPON_LINE_HP_03 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach, " Ore Assault Ax (Ore: 500) " ,DIA_Orc_8571_HashTor_Teach_HP_03);
	};
	if((ORCWEAPON_LINE_HP_03 == TRUE) && (ORCPRIMEWEAPON == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach, " Warchief's Ore Claymore (Ore Chunks: 1000, Training Points: 10) " ,DIA_Orc_8571_HashTor_Teach_PRIME);
	};
};

func void DIA_Orc_8571_HashTor_Teach_Back()
{
	Info_ClearChoices(DIA_Orc_8571_HashTor_Teach);
};

func void DIA_Orc_8571_HashTor_Teach_STR_01()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 125)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(hero,ItMi_Nugget,125);
		ORCWEAPON_LINE_STR_01 = TRUE;
		AI_Print( " Learned forging recipe - 'Ore Orc Axe' " );
		B_LogEntry( TOPIC_ORCWEAPON , " I can now forge an ore orc axe. It requires: a steel billet, ten magic ore, two iron ore, resin and sulfur. " ​​);
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_STR_02()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 250)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 10;
		Npc_RemoveInvItems(hero,ItMi_Nugget,250);
		ORCWEAPON_LINE_STR_02 = TRUE;
		AI_Print( " Forging recipe learned - 'Warrior's Ore Sword' " );
		B_LogEntry( TOPIC_ORCWEAPON , " Now I can forge a warrior's ore sword. It requires: a steel billet, twenty magic ore, five iron ore, two coal, two sulfur, and two resin. " );
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_STR_03()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 500)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 15;
		Npc_RemoveInvItems(hero,ItMi_Nugget,500);
		ORCWEAPON_LINE_STR_03 = TRUE;
		AI_Print( " Learned the forging recipe - 'Ore War Axe' " );
		; _ _ _ _ _ _
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");

		if((ORCPRIMEWEAPON == TRUE) && (ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_03 == TRUE))
		{
			HashTorTeachAll = TRUE;
		};
	};
};

func void DIA_Orc_8571_HashTor_Teach_HP_01()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 125)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(hero,ItMi_Nugget,125);
		ORCWEAPON_LINE_HP_01 = TRUE;
		AI_Print( " Forging recipe learned - 'Ore Orc Cleaver' " );
		B_LogEntry( TOPIC_ORCWEAPON , " I can now forge an ore orc cleaver. Requires a billet of steel, five magic ore, ten iron ore, coal, and sulfur. " ​​);
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_HP_02()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 250)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 10;
		Npc_RemoveInvItems(hero,ItMi_Nugget,250);
		ORCWEAPON_LINE_HP_02 = TRUE;
		AI_Print( " Learned crafting recipe - 'Elder's Ore Sword' " );
		) ; _ _ _ _ _
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_HP_03()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 500)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 15;
		Npc_RemoveInvItems(hero,ItMi_Nugget,500);
		ORCWEAPON_LINE_HP_03 = TRUE;
		AI_Print( " Learned the forging recipe - 'Ore Assault Ax' " );
		; _ _ _ _ _ _
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");

		if((ORCPRIMEWEAPON == TRUE) && (ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_03 == TRUE))
		{
			HashTorTeachAll = TRUE;
		};
	};
};

func void DIA_Orc_8571_HashTor_Teach_PRIME()
{
	if(hero.lp < 10)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
	}
	else if(Npc_HasItems(hero,ItMi_Nugget) < 1000)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 20;
		Npc_RemoveInvItems(hero,ItMi_Nugget,1000);
		ORCPRIMEWEAPON = TRUE;
		AI_Print( " Learned the crafting recipe - 'Ore Claymore of the Warchief' " );
		; _ _ _ _ _ _
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");

		if((ORCPRIMEWEAPON == TRUE) && (ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_03 == TRUE))
		{
			HashTorTeachAll = TRUE;
		};
	};
};

instance DIA_Orc_8571_HashTor_Anvil(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Anvil_condition;
	information = dia_Orc_8571_HashTor_Anvil_info;
	permanent = FALSE;
	description = " Your forge is big! " ;
};

func int dia_Orc_8571_HashTor_Anvil_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8571_HashTor_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Anvil_info()
{
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Anvil_01_01 " );	// You have a big forge!
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Anvil_01_02 " );	// When there is a lot of forging, then there must be a lot of space.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Anvil_01_03 " );	// And kindle a big fire to make a big weapon!
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Anvil_01_04 " );	// Well, that's understandable.
};

instance DIA_Orc_8571_HashTor_War(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_War_condition;
	information = dia_Orc_8571_HashTor_War_info;
	permanent = FALSE;
	description = " Too much work? " ;
};

func int dia_Orc_8571_HashTor_War_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8571_HashTor_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_War_info()
{
	AI_Output(other,self, " DIA_Orc_8571_HashTor_War_01_01 " );	// Too much work?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_War_01_02 " );	// Brothers go to war. One must have a lot of weapons, a lot of armor!
	AI_Output(self,other, " DIA_Orc_8571_HashTor_War_01_03 " );	// All this is to do Hash Tor! He has a lot to do.
	AI_Output(other,self, " DIA_Orc_8571_HashTor_War_01_04 " );	// It's visible.
};

instance DIA_Orc_8571_HashTor_Help(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Help_condition;
	information = dia_Orc_8571_HashTor_Help_info;
	permanent = FALSE;
	description = " Do you need help? " ;
};

func int dia_Orc_8571_HashTor_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8571_HashTor_War) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Help_info()
{
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Help_01_01 " );	// Do you need help?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Help_01_02 " );	// Hash Thor really needs to be a black ore. You need at least five pieces!
	AI_Output(other,self, " DIA_Orc_8571_HashTor_Help_01_03 " );	// But why do you need so many?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Help_01_04 " );	// Hash Tor make a new sword for the great leader! Big and very strong.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_Help_01_05 " );	// But for this he needs to be a black ore. Without it, Hash Tor cannot make weapons.
	MIS_HashTorOre = LOG_Running;
	Log_CreateTopic(TOPIC_HashTorOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HashTorOre,LOG_Running);
	B_LogEntry(TOPIC_HashTorOre, " Blacksmith Hash TorOre needs five pieces of black ore. Without it, he will not be able to forge a new weapon for his leader. " );	
};


instance DIA_Orc_8571_HashTor_OreDone(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_OreDone_condition;
	information = dia_Orc_8571_HashTor_OreDone_info;
	permanent = FALSE;
	description = " I brought you ore. " ;
};

func int dia_Orc_8571_HashTor_OreDone_condition()
{
	if ((MY_HashTorOre == LOG_Running) && (Npc_HasItems(other,ItMy_TimeSpace_Addon) >=  5 ))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_OreDone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Orc_8571_HashTor_OreDone_01_01 " );	// I brought you ore.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_OreDone_01_02 " );	// Then the man give her Hash Tor, and he make a great sword for the great chief.
	AI_Output(other,self, " DIA_Orc_8571_HashTor_OreDone_01_03 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_Zeitspalt_Addon, 5 );
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon, 5 );
	AI_Output(self,other, " DIA_Orc_8571_HashTor_OreDone_01_04 " );	// Be very good... Now man wait a bit.
	AI_Output(other,self, " DIA_Orc_8571_HashTor_OreDone_01_05 " );	// Umm... What exactly?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_OreDone_01_06 " );	// Hash Tor now forge weapons, and then the man takes him to the halls, give the sword to Ur-Thrall!
	AI_Output(other,self, " DIA_Orc_8571_HashTor_OreDone_01_07 " );	// Aren't you afraid that I'll just run away with him?
	AI_Output(self,other, " DIA_Orc_8571_HashTor_OreDone_01_08 " );	// No... (chuckles) He's too heavy for a human! He will not be able to go to war with him.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_OreDone_01_09 " );	// Only a great leader be so strong that raise it.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_OreDone_01_10 " );	// But if a person does not believe, then he can try it himself.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_OreDone_01_11 " );	// Here, he hold it.
	B_GiveInvItems(self,other,ITMW_2H_ORCSWORD_05,1);
	AI_Output(other,self, " DIA_Orc_8571_HashTor_OreDone_01_12 " );	// Damn... He's heavy!
	AI_Output(self,other, " DIA_Orc_8571_HashTor_OreDone_01_13 " );	// Hash Tor don't fool people! A weapon for Ur-Thrall to be very heavy for him.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_OreDone_01_14 " );	// Everyone! Now the man set foot and carry his great chief. He is already waiting for him.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 10 " );
	};

	B_LogEntry(TOPIC_HashTorOre, " I brought five pieces of black ore to Hash Tor. He finished the sword and asked me to take it to Ur-Thrall. " );	
};

instance DIA_Orc_8571_HashTor_SwordBack(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_SwordBack_condition;
	information = dia_Orc_8571_HashTor_SwordBack_info;
	permanent = FALSE;
	description = " I took the sword to Ur-Thrall. " ;
};

func int dia_Orc_8571_HashTor_SwordBack_condition()
{
	if((MIS_HashTorOre == LOG_Running) && (UrTrallTakeSword == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_SwordBack_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Orc_8571_HashTor_SwordBack_01_01 " );	// I took the sword to Ur-Thrall.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_SwordBack_01_02 " );	// Good. And what to say the great leader?
	AI_Output(other,self, " DIA_Orc_8571_HashTor_SwordBack_01_03 " );	// He was pleased with your work and said that you are a great master.
	AI_Output(self,other, " DIA_Orc_8571_HashTor_SwordBack_01_04 " );	// KOR, KOR! (joyfully) Big chief praise Hash Tor! He be very happy about it.
	AI_Output(other,self, " DIA_Orc_8571_HashTor_SwordBack_01_05 " );	// I understand your joy.
	MIS_HashTorOre = LOG_Success;
	Log_SetTopicStatus(TOPIC_HashTorOre,LOG_Success);
	B_LogEntry(TOPIC_HashTorOre, " I told Hash Tor that Ur-Thrall liked the sword. " );
};
// ------------------------------------------------ ------orc shaman--------------------------

instance DIA_Orc_8572_UrHoshNar_EXIT(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_exit_condition;
	information = dia_Orc_8572_UrHoshNar_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_Orc_8572_UrHoshNar_exit_condition()
{
	return TRUE;
};

func void dia_Orc_8572_UrHoshNar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8572_UrConscious_PreHello (C_Info);
{
	npc = Orc_8572_UrHoshNar;
	condition = DIA_Orc_8572_UrHoshNar_PreHello_condition;
	information = DIA_Orc_8572_UrConscious_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8572_UrHoshNar_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8572_UrHoshNar_PreHello_info()
{
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PreHello_01_01 " );	// DAGAR KHAR MORA!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PreHello_01_02");	//Эммм... что?
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8572_UrHoshNar_HELLO(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_hello_condition;
	information = dia_Orc_8572_UrHoshNar_hello_info;
	permanent = FALSE;
	description = " Hi! " ;
};

func int dia_Orc_8572_UrHoshNar_hello_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_01");	//Привет!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Hello_01_02 " );	// Hmmm...(surprised) I see that person know our language.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Hello_01_03 " );	// Hosh Nar do not know that there are such people!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_04");	//А кто ты?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Hello_01_05 " );	// Hosh Nar be the son of spirits, be the great shaman of the brothers.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Hello_01_06 " );	// Conjure the spirits of the ancestors so that they do not get angry and kill the orcs.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Hello_01_07 " );	// What is this perfume?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Hello_01_08 " );	// Man is not a brother! Man does not understand...
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Hello_01_09 " );	// Ah, yes, of course.
};

instance DIA_Orc_8572_UrHoshNar_Clever(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Clever_condition;
	information = dia_Orc_8572_UrHoshNar_Clever_info;
	permanent = FALSE;
	description = " Are you shamans the smartest among orcs? " ;
};

func int dia_Orc_8572_UrHoshNar_Clever_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Clever_info()
{
	AI_Output(other,self, " DIA_Orc_8571_UrHoshNar_Clever_01_01 " );	// You shamans are the smartest among orcs, aren't you?
	AI_Output(self,other, " DIA_Orc_8571_UrHoshNar_Clever_01_02 " );	// UR RAT! The sons of spirits know a lot... (affirmatively) But why would a person ask this?
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Clever_01_03 " );	// I'd like to know a little about orc culture. And no one can tell me better than you.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_05 " );	// Man very much surprise Hosh Nar! That being very strange!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_06 " );	// But if he really wants to know a lot about orcs, he'll come right here.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_07 " );	// Hosh Nar to know a lot about brothers, to see a lot, to hear a lot...
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_08 " );	// Man to know our language, understand what to say Khash Nar!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_09 " );	// Therefore, he will tell him what to know himself. Unless, of course, a person wants to listen.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_10 " );	// However, before he does that, Hash Nar want the man to bring him the knowledge of the people!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Clever_01_11 " );	// You mean books of people?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_12 " );	// Books? Hmmm... (hesitantly) Hash Nar doesn't understand what the person is talking about!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_13 " );	// But he needs something where people write about their people.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_14 " );	// Hash Nar want to know more about people! How do they live, what do they do, how do they fight...
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Clever_01_15 " );	// Okay, I'll try to find something for you.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Clever_01_16 " );	// Then a man to carry Hash Nar this thing... (approvingly) That one will be waiting for a man here!
	MIS_HoshNarBooks = LOG_Running;
	Log_CreateTopic(TOPIC_HoshNarBooks,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HoshNarBooks,LOG_Running);
	B_LogEntry(TOPIC_HoshNarBooks, " In the city of orcs, I met the high shaman Ur Khash Nar. He wants to learn more about the culture of people, and asked me to get him some interesting records. For example, about the life of people or about their battles... " );
};

instance DIA_Orc_8572_UrHoshNar_CleverDone(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_CleverDone_condition;
	information = dia_Orc_8572_UrHoshNar_CleverDone_info;
	permanent = FALSE;
	description = " I brought you a book. " ;
};

func int dia_Orc_8572_UrHoshNar_CleverDone_condition()
{
	if((MIS_HoshNarBooks == LOG_Running) && (Npc_HasItems(other,ItWr_EinhandBuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_CleverDone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Orc_8571_UrHoshNar_CleverDone_01_01 " );	// I brought you a book.
	AI_Output(self,other, " DIA_Orc_8571_UrHoshNar_CleverDone_01_02 " );	// (approvingly) UR DAG SO. What do people write about?
	AI_Output(other,self, " DIA_Orc_8571_UrHoshNar_CleverDone_01_03 " );	// Looks like some major battle is described here. I do not remember exactly. Better read it yourself.
	B_GiveInvItems(other,self,ItWr_EinhandBuch, 1 );
	Npc_RemoveInvItems(self,ItWr_EinhandBuch, 1 );
	AI_Output(self,other, " DIA_Orc_8571_UrHoshNar_CleverDone_01_05 " );	// (with interest) Big war? Hash Nar think it be interesting to him!
	AI_Output(self,other, " DIA_Orc_8571_UrHoshNar_CleverDone_01_06 " );	// He takes it from the man and thank him.
	ORCRESPECT = ORCRESPECT + 15;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 15 " );
	};

	TellAboutOrcs = TRUE;
	MIS_HoshNarBooks = LOG_Success;
	Log_SetTopicStatus(TOPIC_HoshNarBooks,LOG_Success);
	B_LogEntry(TOPIC_HoshNarBooks, " I brought Ur Khash Nar a book that he is interested in. He in turn can tell me about Orc culture. " );
};

instance DIA_Orc_8572_UrHoshNar_WhereFrom(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_WhereFrom_condition;
	information = dia_Orc_8572_UrHoshNar_WhereFrom_info;
	permanent = FALSE;
	description = " Tell me about the orc city. " ;
};

func int dia_Orc_8572_UrHoshNar_WhereFrom_condition()
{
	if(TellAboutOrcs == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_WhereFrom_info()
{
	AI_Output(other,self, " DIA_Orc_8571_HashTor_WhereFrom_01_01 " );	// Tell me about the orc city.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_WhereFrom_01_02 " );	// UR CAR VASHAR... This is not to be a city like people! Be a fortress of brothers to go to war.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_WhereFrom_01_03 " );	// So this is a fortress?!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_WhereFrom_01_04 " );	// UR AR SHAR...(approvingly) The orcs built it many winters ago.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_WhereFrom_01_05 " );	// To be the place where the strongest warrior brothers gather! Here are the halls of the leaders of the tribes.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_WhereFrom_01_06 " );	// What about the rest of the orcs?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_WhereFrom_01_07 " );	// The rest of the brothers live far away in the mountains! But a person can never get there. Be very high!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_08");	//Понимаю.
};

instance DIA_Orc_8572_UrHoshNar_War(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_War_condition;
	information = dia_Orc_8572_UrHoshNar_War_info;
	permanent = FALSE;
	description = " Tell me about the war. " ;
};

func int dia_Orc_8572_UrHoshNar_War_condition()
{
	if(TellAboutOrcs == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_War_info()
{
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_War_01_01 " );	// Tell me about the war.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_War_01_02 " );	// She's been going for a very long time. Hash Nar be still very young when there is a war.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_War_01_03 " );	// And how did it even start?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_War_01_04 " );	// (angrily) KOR MORA TAR!!! People be too greedy, want a lot of gold, a lot of ore!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_War_01_05 " );	// Many winters ago sail here and kill many brothers of Ur Hash Nar.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_War_01_06 " );	// Then the orcs go high into the mountains, gather a lot of warriors and go to war.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_War_01_07 " );	// Revenge for your brothers! Kill all people, drive them off the island.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_War_01_08 " );	// And you don't need anything else?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_War_01_09 " );	// No! Orcs always want to live peacefully, but people don't know how to do that. People be angry, very angry!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_War_01_10 " );	// Hmmm... I see.
};

instance DIA_Orc_8572_UrHoshNar_Faith(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Faith_condition;
	information = dia_Orc_8572_UrHoshNar_Faith_info;
	permanent = FALSE;
	description = " Tell me about your faith. " ;
};

func int dia_Orc_8572_UrHoshNar_Faith_condition()
{
	if(TellAboutOrcs == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Faith_info()
{
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Faith_01_01 " );	// Tell me about your faith.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Faith_01_02 " );	// Orcs always honor only their great ancestor! We pray to the great leaders and shamans of the past.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Faith_01_03 " );	// And some of us can even communicate with them!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Faith_01_04 " );	// What about the Sleeper or Beliar?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Faith_01_05 " );	// (angrily) UR DAR KRUSHAK KAT ZO HAR!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Faith_01_06 " );	// And what does that mean?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Faith_01_07 " );	// Brothers of Piedmont Rock be stupid, very stupid to worship Crushak! Evil demon kill them all.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Faith_01_08 " );	// Undermountain Rock?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Faith_01_09 " );	// This is the name of the tribe of brothers, that they would live there once. It is their spirit sons to call Crushak into this world!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Faith_01_10 " );	// Clear. Do you worship Beliar?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Faith_01_11 " );	// Brothers never pray to GRAT BASHAR, he will not be their great ancestor.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Faith_01_12 " );	// GRAT BASHAR do you think this is Beliar?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Faith_01_13 " );	// KOR KOR...(approvingly) But GRAT BASHAR be very angry! All the brothers are very much afraid of him.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Faith_01_14 " );	// (sarcastically) I understand. You see, that's why you serve him.
};

instance DIA_Orc_8572_UrHoshNar_Peace(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Peace_condition;
	information = dia_Orc_8572_UrHoshNar_Peace_info;
	permanent = FALSE;
	description = " What do you do when you're not at war? " ;
};

func int dia_Orc_8572_UrHoshNar_Peace_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_War) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Peace_info()
{
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Peace_01_01 " );	// What do you do when you're not at war?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Peace_01_02 " );	// A lot of things... (pretty) But mostly the brothers go hunting!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Peace_01_03 " );	// Any orc must be able to feed and protect themselves if they want to survive in the mountains.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Peace_01_04 " );	// After all, there is a lot of scary beast and be very cold!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Peace_01_05 " );	// And what do you shamans do?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Peace_01_06 " );	// Sons of spirits sleep during the day, pray at night to the spirits of their ancestors to protect their brothers.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Peace_01_07 " );	// Night is the most dangerous time, when all the brothers are asleep and easy to kill.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Peace_01_08 " );	// You don't fight yourself, do you?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Peace_01_09 " );	// (surprised) Why fight a shaman?! To do this, be a lot of strong warrior.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Peace_01_10 " );	// Only in case of emergency can a great shaman give orders to brothers.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Peace_01_11 " );	// Usually, this is done by the elders and leaders of the tribes.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Peace_01_12");	//Ясно.
};

instance DIA_Orc_8572_UrHoshNar_Castle(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Castle_condition;
	information = dia_Orc_8572_UrHoshNar_Castle_info;
	permanent = FALSE;
	description = " You have so many strong warriors... " ;
};

func int dia_Orc_8572_UrHoshNar_Castle_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Peace) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Castle_info()
{
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Castle_01_01 " );	// You have so many strong warriors. Why don't you still take the castle in the Valley of Mines?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Castle_01_03 " );	// The first assault on the castle will fail... Then many brothers will die!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Castle_01_04 " );	// How did this happen?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Castle_01_05 " );	// The enemy paladin has a lot of good shooters and very strong magic.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Castle_01_06 " );	// They kill a lot of brothers from the walls and they can't even do anything.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Castle_01_07 " );	// Therefore, the orcs think for a long time and decide that for the time being they will no longer attack the castle.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Castle_01_08 " );	// Wait for the other brothers to bring a big BUDRAK to break down the main gate.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_09");	//БУДРАК?!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Castle_01_10 " );	// Be a big stick, beat her big castle gates!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Castle_01_11 " );	// Ah, you mean the battering ram. And who should bring it?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Castle_01_12 " );	// Orc brothers from the big island! They are already sailing here, already doing BUDRAK!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Castle_01_13 " );	// Hmmm... How smart you are.
};

instance DIA_Orc_8572_UrHoshNar_Myrtana(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Myrtana_condition;
	information = dia_Orc_8572_UrHoshNar_Myrtana_info;
	permanent = FALSE;
	description = " What are these 'brothers from the big island'? " ;
};

func int dia_Orc_8572_UrHoshNar_Myrtana_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Castle) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Myrtana_info()
{
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Myrtana_01_01 " );	// And what are these 'brothers from the big island'?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Myrtana_01_02 " );	// To sail there for many days, to be a big island! The island where the leader of the people lives.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Myrtana_01_03 " );	// So did they come from the mainland?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Myrtana_01_04 " );	// Hmmm...(surprised) Ur Hash Nar doesn't understand what the person is saying. What is it like to be a mat..rick?
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Myrtana_01_05 " );	// Come on, just call it 'big island'. It doesn't matter.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Myrtana_01_06 " );	// I'm interested in something else. It turns out that you communicate with the orcs of the ma ... big island?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Myrtana_01_07 " );	// Many winters ago, their great leader, Kan, will sail to us!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Myrtana_01_08 " );	// He's telling us to go fight the people. Our chieftain Ur-Thrall agrees with him.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Myrtana_01_09 " );	// Now our clans become brothers, have a common enemy, help each other in everything!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Myrtana_01_10 " );	// Then Kahn give us a BUDRAK! Brothers to bring him here.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Myrtana_01_11 " );	// Got it.
};

instance DIA_Orc_8572_UrHoshNar_Dragon(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Dragon_condition;
	information = dia_Orc_8572_UrHoshNar_Dragon_info;
	permanent = FALSE;
	description = " What do you know about dragons? " ;
};

func int dia_Orc_8572_UrHoshNar_Dragon_condition()
{
	if ((Capital <  4 ) && (Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Faith) ==  TRUE )) .
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Dragon_info()
{
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Dragon_01_01 " );	// What do you know about dragons?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Dragon_01_02 " );	// (respectfully) Being very ancient creatures... Very powerful and dangerous!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Dragon_01_03 " );	// The brothers are very afraid of them and never come close to their lair.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Dragon_01_04 " );	// So you're afraid of them, just like Beliara! After all, dragons serve him.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Dragon_01_05 " );	// Man to err... These creatures disobey the will of GRAT BASHAR!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Dragon_01_06 " );	// Their overlords to be much more powerful than himself.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Dragon_01_07 " );	// Hmmm... Are you sure about that?!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Dragon_01_08 " );	// Ur Hash Nar speak only what he himself knows.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_Dragon_01_09 " );	// But if a person does not believe him, then he can go and ask the dragons themselves about it.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_Dragon_01_10 " );	// You know, I don't feel like doing this yet.
	MIS_TrueDragonMasters = LOG_Running;
	Log_CreateTopic(TOPIC_TrueDragonMasters,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrueDragonMasters,LOG_Running);
	B_LogEntry(TOPIC_TrueDragonMasters, " The words of High Shaman Ur Hash Nar confused me a little. He said that dragons do not serve Beliar at all, and their masters are much more powerful than himself. I think I should talk to Xardas about this. His opinion will be important in this matter . " );
};

instance DIA_Orc_8572_UrHoshNar_OrcHolyPlaces(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_condition;
	information = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_info;
	permanent = FALSE;
	description = " Do you need any more help? " ;
};

func int dia_Orc_8572_UrHoshNar_OrcHolyPlaces_condition()
{
	if((MIS_HoshNarBooks == LOG_Success) && (MIS_HeroOrcJoin == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_OrcHolyPlaces_info()
{
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_01 " );	// Do you need any more help?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_02 " );	// (surprised) Human want to help Ur Hash Nar? Why does he need to be?
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_03 " );	// I need to get to your leader. But as long as the orcs don't respect me, Farrok won't let me see him.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_05 " );	// Ur Hash Nar understand...
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_06 " );	// If he wants his brothers to respect him, then he will go to the Big Valley and pray there to the great spirits of his ancestors!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_07 " );	// And how can I do this?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_08 " );	// Orcs build a large sanctuary for each great ancestor. In the Big Valley there are only... mmm... four of them.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_09 " );	// Where can I find these shrines of yours?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_10 " );	// Ur Hash Nar say it's a human...(thoughtfully) One is near the High Rock clan.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_11 " );	// The second is where a lot of water falls high nearby! Another with a large human shaman tower.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_12 " );	// And the last on the high mountain, where the sea should be.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_13 " );	// Okay, I'll try to find them.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_14 " );	// Man to step and pray to the spirits of the ancestors! Then return to Ur Hash Nar.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_15 " );	// He tell the brothers to respect the man.
	MIS_OrcHolyPlaces = LOG_Running;
	Log_CreateTopic(TOPIC_OrcHolyPlaces,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcHolyPlaces,LOG_Running);
	B_LogEntry(TOPIC_OrcHolyPlaces, " Shaman Ur Hash Nar told me that if I want to win the respect of the orcs, I must pray to the great spirits of the ancestors at the orc shrines. According to him, there are four of them - one, as I understand it, is located next to the waterfall, the second - where the High Rock clan settled, the third is next to the magician's tower, and the fourth is high in the mountains, not far from the sea. " );
};

instance DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_condition;
	information = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_info;
	permanent = FALSE;
	description = " I prayed to all your ancestors. " ;
};

func int dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_condition()
{
	if((MIS_OrcHolyPlaces == LOG_Running) && (OrcHolyPlaces_01 == TRUE) && (OrcHolyPlaces_02 == TRUE) && (OrcHolyPlaces_03 == TRUE) && (OrcHolyPlaces_04 == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_01 " );	// I prayed to all your ancestors.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_02 " );	// Ur Hash Nar already know about it...(approvingly) Man do it right!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_03 " );	// How did you know this?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_04 " );	// Ur Hash Nar himself speak with the spirits, they all tell Ur Hash Nar.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_05 " );	// Oh, yes. I forgot that in front of me is a great orc shaman.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_06 " );	// So now your brothers will respect me more?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_07 " );	// Ur Hash Nar tell them about the man, as promised.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_08 " );	// A person can believe Ur Hash Nar, he will not deceive him.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_09");	//Надеюсь.
	ORCRESPECT = ORCRESPECT + 20;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 20 " );
	};

	MIS_OrcHolyPlaces = LOG_Success;
	Log_SetTopicStatus(TOPIC_OrcHolyPlaces,LOG_Success);
	B_LogEntry(TOPIC_OrcHolyPlaces, " Ur Hash Nar will tell the other Orcs about me. It will raise my reputation with them. " );
};

instance DIA_Orc_8572_UrHoshNar_PsicampDemon (C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_PsicampDemon_condition;
	information = dia_Orc_8572_UrHoshNar_PsicampDemon_info;
	permanent = FALSE;
	description = " Is there anything else I can help you with? " ;
};

func int dia_Orc_8572_UrHoshNar_PsicampDemon_condition()
{
	if((MIS_OrcHolyPlaces == LOG_Success) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void day_Orc_8572_UrHoshNar_PsicampDemon_info()
{
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_01 " );	// Is there anything else I can help with?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_02 " );	// Hmmm...(thoughtfully) Yes, a human can.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_03 " );	// But Ur Hash Nar think it's very dangerous for him.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_04 " );	// Tell me.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_05 " );	// Ur Hash Nar a couple of days ago to send a small detachment of brothers to a large swamp.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_06 " );	// The ancestral spirits tell him that very strange things have been happening there lately!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_07 " );	// What's wrong there?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_08 " );	// Ur Hash Nar not to know. The brothers still do not come back.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_09 " );	// If a person still wants to help Ur Hash Nar, then he must go to the big swamp and find out everything.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_10 " );	// Good.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_11 " );	// Then Ur Hash Nar will wait for the return of man! But thats to be very careful.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_12 " );	// Big swamps be a dangerous place - a lot of evil, a lot of dead...
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_13 " );	// Don't worry! I'll figure it out somehow.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_14 " );	// KRAT SHAKA OR... (approvingly) Bon voyage, man.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_PsicampDemon_01_15 " );	// And you don't get sick.
	MIS_PsicampDemon = LOG_Running;
	Log_CreateTopic(TOPIC_PsicampDemon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PsicampDemon,LOG_Running);
	B_LogEntry(TOPIC_PsicampDemon, " Ur Hash Nar has sent an orc reconnaissance party to the swamps. However, there is no news from this squad yet. The shaman asked me to go to the swamps and find out what became of his warriors. " );	
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8572_UrHoshNar_What(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_What_condition;
	information = dia_Orc_8572_UrHoshNar_What_info;
	permanent = FALSE;
	description = " I brought word from Tor Dal. " ;
};

func int dia_Orc_8572_UrHoshNar_What_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (TorDalSentMe == TRUE) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_What_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_What_01_01 " );	// I've brought news from Tor Dal.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_What_01_02 " );	// Ur Khash Nar listen to him... (thoughtfully) Man speak!
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_What_01_03 " );	// The squad you sent to the swamps is almost completely destroyed.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_What_01_04 " );	// All that remained of him was Thor Dal himself and a few other fighters.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_What_01_05 " );	// In the very temple of the Brotherhood of the Sleeper, some terrible evil has settled.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_What_01_06 " );	// However, Thor Dal doesn't know exactly what it is. Only at night hears his terrible moans.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_What_01_07 " );	// He asks you to send him more warriors so he can recapture the temple for the orcs.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_What_01_08 " );	// Hmmm...(unhappy) Be very bad news that you bring, man!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_What_01_09 " );	// Ur Hash Nar to think about building an orc sanctuary in the temple, but now change your mind.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_What_01_00 " );	// And he can't send more warrior brothers there.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_What_01_11 " );	// Who can?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_What_01_12 " );	// Only Great Chieftain Ur-Thrall should allow this!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_What_01_13 " );	// But he will scold Ur Hash Nar if he finds out about the temple in the swamps.
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_What_01_14 " );	// Why is this?
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_What_01_15 " );	// Ur-Thrall consider this to be a bad place for a sanctuary of the brothers.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_What_01_16 " );	// It be cursed by Crushak! There's a lot of evil...
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_What_01_17 " );	// That is, to help Tor Dal, I first need to meet with the great leader.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_What_01_18 " );	// Ur Hash Nar think so. The man go to Ur-Thrall and talk to him about the temple in the swamps.
	HoshNarSentMe = TRUE;
	B_LogEntry(TOPIC_PsicampDemon, " I've given Tor Dal's words to Ur Khash Nar. Unfortunately, he can't send help to him. This requires Ur-Thrall's own permission. So I'll have to talk to the great warchief first. " );	
};

instance DIA_Orc_8572_UrHoshNar_PsicampDemonDone(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_PsicampDemonDone_condition;
	information = dia_Orc_8572_UrHoshNar_PsicampDemonDone_info;
	permanent = FALSE;
	description = " The temple in the swamps is free! " ;
};

func int dia_Orc_8572_UrHoshNar_PsicampDemonDone_condition()
{
	if(MIS_PsicampDemon == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_PsicampDemonDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_01 " );	// Temple in the swamps is free!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_02 " );	// Ur Hash Nar be very happy about this!
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_03 " );	// Orcs can now build their shrine there and pray to the spirits of their ancestors.
	AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_04 " );	// Therefore, a person deserve a great reward from Ur Hash Nar to help brothers.

	if((hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW))
	{
		ORCRESPECT = ORCRESPECT + 50;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 50 " );
		};
		if(ShamanArmor == FALSE)
		{
			AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_05 " );	// Take this armor! Be the armor of the sons of the spirit. Protect people from fire and magic.
			CreateInvItems(other,ItMw_2h_OrcStab,1);
			B_GiveInvItems(self,other,ITAR_SHAMANROBE,1);
			ShamanArmor = TRUE;
		}
		else
		{
			B_GiveInvItems(self,other,ItRu_OrcFireball, 1 );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_06 " );	// Take this drink! He make a man strong like an orc.
		ORCRESPECT = ORCRESPECT + 50;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print( " Respect among orcs + 50 " );
		};

		B_GiveInvItems(self,other,ITPO_XORCPOTION02,1);
	};
	
	AI_Output(other,self, " DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_07 " );	// Thank you.
};


// ------------------------------------------------ -Thor Dahl------------------------------------------------------------ ----

instance DIA_ORC_8216_TorDal_EXIT(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_exit_condition;
	information = dia_ORC_8216_TorDal_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_ORC_8216_TorDal_exit_condition()
{
	return TRUE;
};

func void dia_ORC_8216_TorDal_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8216_TorDal_HELLO(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_hello_condition;
	information = dia_ORC_8216_TorDal_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_ORC_8216_TorDal_hello_condition()
{
	if(MIS_PsicampDemon == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_hello_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_ORC_8216_TorDal_HELLO_01_01 " );	// (belligerently) Stop, man! Why does he come here?
	AI_Output(other,self, " DIA_ORC_8216_TorDal_HELLO_01_02 " );	// What about you, orc?
	AI_Output(self,other, " DIA_ORC_8216_TorDal_HELLO_01_03 " );	// GOR TAK NABAR SHAR... (shaking his head)
	AI_Output(self,other, " DIA_ORC_8216_TorDal_HELLO_01_04 " );	// If a stupid person wants to die, then he can go on!
	AI_Output(self,other, " DIA_ORC_8216_TorDal_HELLO_01_05 " );	// Thor Dal won't stop him.
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8216_TorDal_Meet(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_Meet_condition;
	information = dia_ORC_8216_TorDal_Meet_info;
	permanent = FALSE;
	description = " Did the shaman Ur Hash Nar send you to the swamps? " ;
};

func int dia_ORC_8216_TorDal_Meet_condition()
{
	if ((MY_PsychicampDemon == LOG_Running) && (Npc_KnowsInfo(hero, DIA_ORC_8216_TorDal_HELLO) ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_Meet_info()
{
	AI_Output(other,self, " DIA_ORC_8216_TorDal_Meet_01_01 " );	// Did the shaman Ur Khash Nar send you to the swamps?
	AI_Output(self,other, " DIA_ORC_8216_TorDal_Meet_01_02 " );	// (surprised) KOR RAD... Yes, the great shaman sent Tor Dal to the big swamp.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_Meet_01_03 " );	// But how does a person know this?!
	AI_Output(other,self, " DIA_ORC_8216_TorDal_Meet_01_04 " );	// I'm here on his assignment too. We haven't heard from you in a long time, and Ur Hash Nar wants to know what's going on here.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_Meet_01_06 " );	// Means, the person to come to help Tor Dal.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_Meet_01_07 " );	// But it would be better for Ur Hash Nar to send him more warriors. Being a human is of little use...
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 5 " );
	};
};

instance DIA_ORC_8216_TorDal_Many(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_Many_condition;
	information = dia_ORC_8216_TorDal_Many_info;
	permanent = FALSE;
	description = " There aren't many of you. " ;
};

func int dia_ORC_8216_TorDal_Many_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (Npc_KnowsInfo(hero,DIA_ORC_8216_TorDal_Meet) == TRUE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_Many_info()
{
	AI_Output(other,self, " DIA_ORC_8216_TorDal_Many_01_01 " );	// There aren't many of you.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_Many_01_02 " );	// Many brothers of Tor Dal perish... Dead kill all of them!
	AI_Output(self,other, " DIA_ORC_8216_TorDal_Many_01_03 " );	// Only Thor Dal and a few other warriors survived.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_Many_01_04 " );	// Now wait here, think about what to do next.
};

instance DIA_ORC_8216_TorDal_What(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_What_condition;
	information = dia_ORC_8216_TorDal_What_info;
	permanent = FALSE;
	description = " Why did Ur Hash Nar send you here? " ;
};

func int dia_ORC_8216_TorDal_What_condition()
{
	if ((MY_PsicampDemon == LOG_Running) && (Npc_KnowsInfo(hero,DIA_ORC_8216_TorDal_Meet) ==  TRUE ) && (DemonPsicampIsDead ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_What_info()
{
	AI_Output(other,self, " DIA_ORC_8216_TorDal_What_01_01 " );	// Why did Ur Hash Nar send you here?
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_02 " );	// Thor Dal walk on the big swamp to the Temple, as the great shaman tells him to.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_03 " );	// He wants to build a big sanctuary of the brothers here! Pray to the spirits of the ancestors.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_04 " );	// But then dark shamans come here and cause great evil in the Temple! A very scary evil...
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_05 " );	// Raise many dead to serve him! Those to kill the brothers of Tor Dal.
	AI_Output(other,self, " DIA_ORC_8216_TorDal_What_01_06 " );	// What is this evil?
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_07 " );	// Thor Dal didn't know, he didn't see him... Only hear him at night! The brothers get scared.
	AI_Output(other,self, " DIA_ORC_8216_TorDal_What_01_08 " );	// You need to report this to Ur Hash Nar!
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_09 " );	// Tor Dal can't go back to the city. First he must destroy the evil! Revenge for your brothers.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_10 " );	// But Thor Dal doesn't have many warriors to go back to the Temple. He's dying if you try to do it.
	AI_Output(other,self, " DIA_ORC_8216_TorDal_What_01_11 " );	// Maybe I can help you deal with this evil?
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_12 " );	// Hmmm... Man be weak! Dying faster than Thor Dal.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_13 " );	// He'd better go back to Ur Hash Nar and ask for more warriors.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_What_01_14 " );	// Te come and help Thor Dal kill the evil in the Temple!
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_15");	//Ладно.
	TorDalSentMe = TRUE;
	B_LogEntry(TOPIC_PsicampDemon, " In the swamps, I met the orc Thor Dal and what was left of his squad. It seems that some evil has settled in the Temple. Thor Dal asked me to go to Ur Hash Nar and ask him to send Tor Dal many warriors to try to recapture the temple from the undead... Or I can try to deal with this problem alone... " );	
};

instance DIA_ORC_8216_TorDal_PsiCampDone(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_PsiCampDone_condition;
	information = dia_ORC_8216_TorDal_PsiCampDone_info;
	permanent = FALSE;
	description = " Khram chist! " ;
};

func int dia_ORC_8216_TorDal_PsiCampDone_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (DemonPsicampIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_PsiCampDone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_ORC_8216_TorDal_PsiCampDone_01_01 " );	// The temple is clean!
	AI_Output(self,other, " DIA_ORC_8216_TorDal_PsiCampDone_01_02 " );	// (respectfully) Is the person himself to kill evil there?
	AI_Output(other,self, " DIA_ORC_8216_TorDal_PsiCampDone_01_03 " );	// Yes, I'm done with him.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_PsiCampDone_01_04 " );	// Thor Dal apologize to a person when saying he is weak.
	AI_Output(self,other, " DIA_ORC_8216_TorDal_PsiCampDone_01_05 " );	// That be a strong warrior! Thor gave respect to the man... Orak Shaka!
	ORCRESPECT = ORCRESPECT + 15;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print( " Respect among orcs + 15 " );
	};

	AI_PlayAni(self,"T_GREETGRD");
	MIS_PsicampDemon = LOG_Success;
	Log_SetTopicStatus(TOPIC_PsicampDemon,LOG_Success);
	B_LogEntry(TOPIC_PsicampDemon, " I informed Thor Dal that the evil in the temple is over. The orcs can now safely build their sanctuary here. " );	
};
