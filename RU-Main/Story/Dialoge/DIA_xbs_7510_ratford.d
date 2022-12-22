

instance DIA_RATFORD_EXIT(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 999;
	condition = dia_ratford_exit_condition;
	information = dia_ratford_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_ratford_exit_condition()
{
	return TRUE;
};

func void dia_ratford_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RATFORD_HELLO (C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = dia_ratford_hallo_condition;
	information = dia_ratford_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ratford_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DRAXHASRING == FALSE) && (RatfordCap == FALSE))
	{
		return TRUE;
	};
};

func void dia_ratford_hello_info()
{
	AI_Output(self,other, " DIA_Ratford_Hallo_01_00 " );	// Any questions, speak to Drax.
	AI_Output(self,other, " DIA_Ratford_Hallo_01_01 " );	// He is the talkative one.
	AI_Output(other,self, " DIA_Ratford_Hallo_15_00 " );	// Hmmm...
	AI_StopProcessInfos(self);
};


instance DIA_RATFORD_FISK (C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = dia_ratford_fisk_condition;
	information = dia_ratford_fish_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_ratford_fisk_condition()
{
	if (( DRAXHASRING  ==  TRUE ) && (Chapter <  5 )) .
	{
		return TRUE;
	};
};

func void dia_ratford_fisk_info()
{
	AI_Output(self,other, " DIA_Ratford_Fisk_01_00 " );	// I see you can be trusted.
	AI_Output(self,other, " DIA_Ratford_Fisk_01_01 " );	// Tell me, did you meet a guy named Fisk in the camp there?
	AI_Output(other,self, " DIA_Ratford_Fisk_01_02 " );	// Fisk? Of course. What of it?

	if ( FISK_ISDEAD  ==  TRUE )
	{
		AI_Output(other,self, " DIA_Ratford_Fisk_15_07 " );	// Only he.... how to put it... in essence...
		AI_Output(self,other, " DIA_Ratford_Fisk_01_10 " );	// WHAT? Out with it man!
		AI_Output(other,self, " DIA_Ratford_Fisk_15_08 " );	// He died.
		AI_Output(self,other, " DIA_Ratford_Fisk_01_11 " );	// Damn!
		AI_Output(other,self, " DIA_Ratford_Fisk_15_09 " );	// You seem broken up about it?
		AI_Output(self,other, " DIA_Ratford_Fisk_01_13 " );	// Ah, never mind - forget about it.
	}
	else
	{
		AI_Output(self,other, " DIA_Ratford_Fisk_01_03 " );	// And how is he?
		AI_Output(other,self, " DIA_Ratford_Fisk_15_02 " );	// He still trades in all sorts of junk.
		AI_Output(self,other, " DIA_Ratford_Fisk_01_04 " );	// If you ever see him again, give him Ratford's regards.
		AI_Output(other,self,"DIA_Ratford_Fisk_15_03");	//Will do. Anything else?
		AI_Output(self,other, " DIA_Ratford_Fisk_01_05 " );	// Nope.
		AI_Output(other,self, " DIA_Ratford_Fisk_01_08 " );	// Okay, if I see him I'll send your regards.
		AI_Output(self,other, " DIA_Ratford_Fisk_15_05 " );	// Thanks man.
		MIS_RATFORDFISK = LOG_Running;
		Log_CreateTopic(TOPIC_RATFORDFISK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RATFORDFISK,LOG_Running);
		B_LogEntry( TOPIC_RATFORDFISK , " Ratford asked me to say hi to Fisk when we meet. " );
	};

	AI_StopProcessInfos(self);
};


instance DIA_RATFORD_FISKOK(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = dia_ratford_fiskok_condition;
	information = dia_ratford_fiskok_info;
	permanent = FALSE;
	description = " I said hi to Fisk... " ;
};

func int dia_ratford_fiskok_condition()
{
	if((MIS_RATFORDFISK == LOG_Running) && (HIFROMRATFORD == TRUE) && (Npc_HasItems(other,itmi_fiskpacket) > 0))
	{
		return TRUE;
	};
};

func void dia_ratford_fiskok_info()
{
	AI_Output(other,self, " DIA_Ratford_FiskOk_01_00 " );	// I said hello to Fisk for you.
	AI_Output(self,other,"DIA_Ratford_FiskOk_01_01");	//What did he say?
	AI_Output(other,self, " DIA_Ratford_FiskOk_01_02 " );	// He asked me to give you this package.
	B_GiveInvItems(other,self,itmi_fiskpacket,1);
	Npc_RemoveInvItems(self,itmi_fiskpacket,1);
	AI_Output(self,other, " DIA_Ratford_FiskOk_01_03 " );	// Now that's another matter! Oh, he's an old rascal... (laughs)
	AI_Output(other,self, " DIA_Ratford_FiskOk_01_04 " );	// What's your deal with Fisk?
	AI_Output(self,other, " DIA_Ratford_FiskOk_01_05 " );	// Before the Barrier collapsed, I sold Fisk all sorts of junk - mostly hunting trophies.
	AI_Output(self,other, " DIA_Ratford_FiskOk_01_06 " );	// It so happened that Fisk did not have time to pay for the last batch of goods due to all these recent events.
	AI_Output(self,other, " DIA_Ratford_FiskOk_01_07 " );	// Well, he owes me some money. 
	AI_Output(other,self, " DIA_Ratford_FiskOk_01_08 " );	// So that's why he had such a displeased face when I hinted about you.
	AI_Output(self,other, " DIA_Ratford_FiskOk_01_09 " );	// M-yes, still the same old miser - what do you want from a merchant.
	AI_Output(self,other, " DIA_Ratford_FiskOk_01_10 " );	// Oh well. I should probably thank you for your help...
	if (Player_IsApprentice == APP_Bosper)
	{
		AI_Output(self,other, " DIA_Ratford_FiskOk_01_11 " );	// You're a hunter too, I see. Here, take these hunting trophies. Surely you will find someone to sell them to.
		CreateInvItems(self,ItAt_ShadowHorn,5);
		B_GiveInvItems(self,other,ItAt_ShadowHorn,5);
	}
	else if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other, " DIA_Ratford_FiskOk_01_12 " );	// I see you're good at forging. Take these steel blanks. Surely you can make something sensible out of them.
		CreateInvItems(self,ItMiSwordraw,5);
		B_GiveInvItems(self,other,ItMiSwordraw,5);
	}
	else if(Player_IsApprentice == APP_Constantino)
	{
		AI_Output(self,other, " DIA_Ratford_FiskOk_01_13 " );	// I see you're pretty good with herbs. Here, take this rare piece. They say it's incredibly valuable!
		CreateInvItems(self,ItPl_Perm_Herb,1);
		B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Ratford_FiskOk_01_14 " );	// A little bit of gold is all I can give.
		CreateInvItems(self,ItMi_Gold,200);
		B_GiveInvItems(self,other,ItMi_Gold,200);
	};
	B_LogEntry( TOPIC_RATFORDFISK , " I gave Ratford the package that Fisk gave me. " );
	Log_CreateTopic(TOPIC_RATFORDFISK,LOG_SUCCESS);
	MIS_RATFORDFISK = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_Capitan(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = DIA_Ratford_Capitan_condition;
	information = DIA_Ratford_Capitan_info;
	permanent = FALSE;
	description = " I heard you were the captain of the ship. " ;
};

func int DIA_Ratford_Capitan_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (RatfordCap == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ratford_Capitan_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Ratford_Capitan_01_00 " );	// I heard you were the captain of the ship.
	AI_Output(self,other, " DIA_Ratford_Capitan_01_01 " );	// (grinning) Well, yes, there was once.
	AI_Output(other,self, " DIA_Ratford_Capitan_01_02 " );	// Don't you want to go on a little sea trip again?
	AI_Output(self,other, " DIA_Ratford_Capitan_01_03 " );	// What? What are you talking about, boy?
	AI_Output(other,self, " DIA_Ratford_Capitan_01_04 " );	// About the fact that I desperately need a captain who is ready to go to the open sea.
	AI_Output(self,other, " DIA_Ratford_Capitan_01_05 " );	// Hmmm...(grinning) You need a ship to do that. You have one?
	AI_Output(other,self, " DIA_Ratford_Capitan_01_06 " );	// Of course. And you can see it if you look down right now.
	AI_Output(self,other, " DIA_Ratford_Capitan_01_07 " );	// Do you mean that orc drakar?
	AI_Output(other,self,"DIA_Ratford_Capitan_01_08");	//The same!
	AI_Output(self,other, " DIA_Ratford_Capitan_01_09 " );	// Are you crazy, mate! The orcs won't let you near it?
	AI_Output(other,self, " DIA_Ratford_Capitan_01_10 " );	// They're too dead to care.
	AI_Output(other,self, " DIA_Ratford_Capitan_01_11 " );	// So right now the dracar is empty and waiting for someone to use it.
	AI_Output(self,other, " DIA_Ratford_Capitan_01_12 " );	// Well, if so, then we're certainly in business.
	AI_Output(other,self, " DIA_Ratford_Capitan_01_13 " );	// Are you sure you can handle it?
	AI_Output(self,other, " DIA_Ratford_Capitan_01_14 " );	// I'll manage, don't you worry! And where do you want to sail?
	AI_Output(other,self, " DIA_Ratford_Capitan_01_15 " );	// I'm not going anywhere yet. Your boss will be a mercenary named Silvio.
	AI_Output(other,self, " DIA_Ratford_Capitan_01_16 " );	// And with him a dozen more thugs.
	AI_Output(other,self, " DIA_Ratford_Capitan_01_17 " );	// And as far as I know, they planned to sail to the mainland.
	AI_Output(self,other, " DIA_Ratford_Capitan_01_18 " );	// Then I need a map. Otherwise, we can easily go astray in open water.
	AI_Output(self,other, " DIA_Ratford_Capitan_01_19 " );	// And another five hundred gold for the job. I won't help him for free.
	AI_Output(other,self, " DIA_Ratford_Capitan_01_20 " );	// Good. I will arrange payment. What card do you need?
	AI_Output(self,other, " DIA_Ratford_Capitan_01_21 " );	// Usual nautical chart showing the course to the mainland.
	AI_Output(other,self, " DIA_Ratford_Capitan_01_22 " );	// And where can I get one?
	AI_Output(self,other, " DIA_Ratford_Capitan_01_23 " );	// You can probably get it in the city. And without one, I will not go out to sea. Do not even ask.
	AI_Output(other,self, " DIA_Ratford_Capitan_01_24 " );	// Okay, I'll try to get it for you.
	RatfordNeedMap = TRUE;
	B_LogEntry(Topic_SylvioCrew, " Ratford has agreed to be captain. But to sail to the mainland, he needs a chart with a map of his course. " );
};

instance DIA_Ratford_Capitan_Done(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 2;
	condition = DIA_Ratford_Capitan_Done_condition;
	information = DIA_Ratford_Capitan_Done_info;
	permanent = FALSE;
	description = " Here's your map. " ;
};

func int DIA_Ratford_Capitan_Done_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (Npc_HasItems(hero,ItWr_Seamap_Mirtana) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ratford_Capitan_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Ratford_Capitan_Done_01_00 " );	// Here is your map.
	B_GiveInvItems(other,self,ItWr_Seamap_Mirtana,1);
	Npc_RemoveInvItems(self,ItWr_Seamap_Mirtana,1);
	AI_Output(self,other, " DIA_Ratford_Capitan_Done_01_01 " );	// Come on, let's take a look at it.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Ratford_Capitan_Done_01_02 " );	// Yes, great! What you need.
	AI_Output(other,self, " DIA_Ratford_Capitan_Done_01_03 " );	// Now are you ready to take the helm of the drakar?
	AI_Output(self,other, " DIA_Ratford_Capitan_Done_01_04 " );	// Naturally. As we agreed.
	AI_Output(self,other, " DIA_Ratford_Capitan_Done_01_05 " );	// But don't forget that guy still owes me five hundred gold!
	AI_Output(other,self, " DIA_Ratford_Capitan_Done_01_06 " );	// Of course. You will get them, you can be sure.
	AI_Output(self,other, " DIA_Ratford_Capitan_Done_01_07 " );	// Then I'll go to the ship and wait for them there.
	AI_Output(self,other, " DIA_Ratford_Capitan_Done_01_08 " );	// Drax, by the way, also expressed a desire to leave this island.
	AI_Output(self,other, " DIA_Ratford_Capitan_Done_01_09 " );	// So he's coming with me.
	AI_Output(other,self, " DIA_Ratford_Capitan_Done_01_10 " );	// The Drakar is big. I think there is enough space for everyone.
	AI_Output(self,other, " DIA_Ratford_Capitan_Done_01_11 " );	// Okay, see you then.
	RatfordAgree = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_SylvioDebts(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 1;
	condition = DIA_Ratford_SylvioDebts_condition;
	information = DIA_Ratford_SylvioDebts_info;
	permanent = FALSE;
	description = " Something wrong? " ;
};

func int DIA_Ratford_SylvioDebts_condition()
{
	if((MoveDracarBoard == TRUE) && (RatfordOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ratford_SylvioDebts_info()
{
	AI_Output(other,self, " DIA_Ratford_SylvioDebts_01_00 " );	// Is something wrong?
	AI_Output(self,other, " DIA_Ratford_SylvioDebts_01_01 " );	// That damn mechanism... looks like it's broken!
	AI_Output(other,self, " DIA_Ratford_SylvioDebts_01_02 " );	// Can you fix it?
	AI_Output(self,other, " DIA_Ratford_SylvioDebts_01_03 " );	// I think so. But it will take some time.
	AI_Output(self,other, " DIA_Ratford_SylvioDebts_01_04 " );	// By the way, your buddy Silvio never paid me.
	AI_Output(self,other, " DIA_Ratford_SylvioDebts_01_05 " );	// There was an agreement - five hundred coins!
	AI_Output(self,other, " DIA_Ratford_SylvioDebts_01_06 " );	// And he constantly asks me for breakfast.
	AI_Output(other,self, " DIA_Ratford_SylvioDebts_01_07 " );	// I'll talk to him.
	MIS_SylvioDebts = LOG_Running;
	Log_CreateTopic(Topic_SylvioDebts,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioDebts,LOG_Running);
	B_LogEntry(Topic_SylvioDebts, " Sylvio still hasn't paid Ratford. I have to deal with this because I gave him my word. " );
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_SylvioDebts_Done(C_Info)
{
	npc = xbs_7510_ratford;
	nr = 1;
	condition = DIA_Ratford_SylvioDebts_Done_condition;
	information = DIA_Ratford_SylvioDebts_Done_info;
	permanent = FALSE;
	description = " Here's your money. " ;
};

func int DIA_Ratford_SylvioDebts_Done_condition()
{
	if((SylvioIsDead == TRUE) && (MIS_SylvioDebts == LOG_Running) && (Npc_HasItems(hero,ItMi_Gold) >= 500))
	{
		return TRUE;
	};
};

func void DIA_Ratford_SylvioDebts_Done_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Ratford_SylvioDebts_Done_01_00 " );	// Here's your money.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItMi_Gold,500);
	AI_Output(self,other, " DIA_Ratford_SylvioDebts_Done_01_01 " );	// Thank you. How did you manage to knock them out of him?
	AI_Output(other,self, " DIA_Ratford_SylvioDebts_Done_01_02 " );	// I just finished off the bastard.
	AI_Output(self,other, " DIA_Ratford_SylvioDebts_Done_01_03 " );	// (laughs) I see you are not to be trifled with.
	AI_Output(other,self, " DIA_Ratford_SylvioDebts_Done_01_04 " );	// Yes - especially when people don't keep their word.
	AI_Output(self,other, " DIA_Ratford_SylvioDebts_Done_01_05 " );	// Okay. I hope you don't kill me.
	AI_Output(other,self, " DIA_Ratford_SylvioDebts_Done_01_06 " );	// Well, you haven't broken a promise to me, yet.
	AI_Output(self,other, " DIA_Ratford_SylvioDebts_Done_01_07 " );	// That's right, mate. And I won't!
	MIS_SylvioDebts = LOG_Success;
	Log_SetTopicStatus(Topic_SylvioDebts,LOG_Success);
	B_LogEntry(Topic_SylvioDebts, " I gave the money to Ratford. " );
	AI_StopProcessInfos(self);
};

instance DIA_Ratford_Drakar_Perm (C_Info)
{
	npc = xbs_7510_ratford;
	nr = 1;
	condition = DIA_Ratford_Drakar_Perm_condition;
	info = DIA_Ratford_Drakar_Perm_info;
	permanent = TRUE;
	description = " How is the repair going? " ;
};

func int DIA_Ratford_Drakar_Perm_condition()
{
	if((MIS_SylvioDebts == LOG_Success) && (RatfordOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ratford_Drakar_Perm_info()
{
	AI_Output(other,self, " DIA_Ratford_Drakar_Perm_01_00 " );	// How are the repairs progressing?
	AI_Output(self,other, " DIA_Ratford_Drakar_Perm_01_01 " );	// Doing what I can... (shrugging) It's not that simple!
	AI_Output(other,self,"DIA_Ratford_Drakar_Perm_01_02");	//I see.
};
