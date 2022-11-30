
var int DJG_Cipher_DragonKilledNotYet;

instance DIA_CipherDJG_EXIT(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 999;
	condition = DIA_CipherDJG_EXIT_Condition;
	information = DIA_CipherDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_CipherDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_CipherDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_HELLO (C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_Cipher_HALLO_Condition;
	information = DIA_Cipher_HELLO_Info;
	description = " Great camp. " ;
};


func int DIA_Cipher_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Cipher_HALLO_Info()
{
	AI_Output(other, self, " DIA_Cipher_HALLO_15_00 " );	// Great camp.
	AI_Output(self,other, " DIA_Cipher_HALLO_07_01 " );	// Say it too. It smells like a slaughterhouse in here. Animal corpses and rotten trees are everywhere.
};


instance DIA_CipherDJG_HELLOAGAIN(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_HELLOAGAIN_Condition;
	information = DIA_CipherDJG_HELLOAGAIN_Info;
	description = " What are you doing here? " ;
};


func int DIA_CipherDJG_HELLOAGAIN_Condition()
{
	if((Npc_IsDead(SwampDragon) == FALSE) && Npc_KnowsInfo(other,DIA_Cipher_HALLO))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_HELLOAGAIN_Info()
{
	AI_Output(other,self, " DIA_CipherDJG_HELLOAGAIN_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_CipherDJG_HELLOAGAIN_07_01 " );	// I've been sitting here for a long time. I'm waiting for the right moment.
	AI_Output(other,self, " DIA_CipherDJG_HELLOAGAIN_15_02 " );	// Right moment? For what?
	AI_Output(self,other, " DIA_CipherDJG_HELLOAGAIN_07_03 " );	// There must be a dragon hiding somewhere. That stinking swamp flooded the area shortly after he got here.
	AI_Output(self,other, " DIA_CipherDJG_HELLOAGAIN_07_04 " );	// I still remember well the time when it was impossible to get your feet wet here.
	AI_Output(self,other, " DIA_CipherDJG_HELLOAGAIN_07_05 " );	// But now I will never go there alone.
	if (Npc_IsDead(DJG_Rod) ==  FALSE )
	{
		AI_Output(self,other, " DIA_CipherDJG_HELLOAGAIN_07_06 " );	// True, Rod is with me. But he will run headlong even at the sight of a meat bug.
	};
	AI_Output(self,other, " DIA_CipherDJG_HELLOAGAIN_07_07 " );	// What about you? You didn't come here for a walk either, did you? Let's go there together.
	B_LogEntry(TOPIC_Dragonhunter, " Cypher told me that a dragon lives in the swamps of the Valley of Mines. " );
	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN, " I prefer to go it alone. " ,DIA_CipherDJG_HELLOAGAIN_GoAlone);
	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN, " Why not. Help me. " ,DIA_CipherDJG_HELLOAGAIN_GoTogether);
};

func void DIA_CipherDJG_HELLOAGAIN_GoAlone()
{
	AI_Output(other,self, " DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00 " );	// I prefer to go it alone.
	AI_Output(self,other, " DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01 " );	// As you know. So I was wrong about you!
	AI_StopProcessInfos(self);
};

func void DIA_CipherDJG_HELLOAGAIN_GoTogether()
{
	AI_Output(other,self, " DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00 " );	// Why not. Help won't hurt me.
	AI_Output(self,other, " DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01 " );	// This is good. Then I can finally get out of here. This stench is unbearable. Just give me the word!
	DJG_SwampParty = TRUE;
	Info_ClearChoices(DIA_CipherDJG_HELLOAGAIN);
};


instance DIA_CipherDJG_GOTOGETHERAGAIN(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GOTOGETHERAGAIN_Condition;
	information = DIA_CipherDJG_GOTOGETHERAGAIN_Info;
	description = " I changed my mind! Let's go together! " ;
};


func int DIA_CipherDJG_GOTOGETHERAGAIN_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_CipherDJG_HELLOAGAIN ) && ( DJG_SwampParty ==  FALSE ) && ( Npc_IsDead ( SwampDragon ) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GOTOGETHERAGAIN_Info()
{
	AI_Output(other,self, " DIA_CipherDJG_GOTOGETHERAGAIN_15_00 " );	// I changed my mind! Let's go together!
	AI_Output(self,other, " DIA_CipherDJG_GOTOGETHERAGAIN_07_01 " );	// Just give me the floor!
	DJG_SwampParty = TRUE;
};


instance DIA_CipherDJG_GO(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GO_Condition;
	information = DIA_CipherDJG_GO_Info;
	description = " Now is the best time to go there! " ;
};


func int DIA_CipherDJG_GO_Condition()
{
	if((DJG_SwampParty == TRUE) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};


var int DJG_SwampParty_GoGoGo;

func void DIA_CipherDJG_GO_Info()
{
	AI_Output(other,self, " DIA_CipherDJG_GO_15_00 " );	// Now is the best time to go there!
	AI_Output(self,other, " DIA_CipherDJG_GO_07_01 " );	// Then let's go!
	AI_StopProcessInfos(self);
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	DJG_Rod.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"SwampWait1");
	B_StartOtherRoutine(DJG_Rod,"SwampWait1");
};


instance DIA_CipherDJG_SwampWait2(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_SwampWait2_Condition;
	information = DIA_CipherDJG_SwampWait2_Info;
	important = TRUE;
};


func int DIA_CipherDJG_SwampWait2_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT1_01") < 700) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SwampWait2_Info()
{
	AI_Output(self,other, " DIA_CipherDJG_SwampWait2_07_00 " );	// The swamp starts right after the next turn. I suggest going straight there.
	AI_Output(self,other, " DIA_CipherDJG_SwampWait2_07_01 " );	// Well, you might as well check that passage over there to make sure those creatures don't attack us from behind. What you choose?
	AI_Output(other,self, " DIA_CipherDJG_SwampWait2_15_02 " );	// Let's not waste time!
	Info_AddChoice(DIA_CipherDJG_SwampWait2,Dialog_Ende,DIA_CipherDJG_SwampWait2_weiter);
};

func void DIA_CipherDJG_SwampWait2_weiter()
{
	AI_StopProcessInfos(self);
	DJG_SwampParty = TRUE;
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	DJG_Rod.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"SwampWait2");
	B_StartOtherRoutine(DJG_Rod,"SwampWait2");
};


instance DIA_CipherDJG_GoForSwampDragon(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GoForSwampDragon_Condition;
	information = DIA_CipherDJG_GoForSwampDragon_Info;
	important = 1;
	permanent = 0;
};


func int DIA_CipherDJG_GoForSwampDragon_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_01") < 1000) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GoForSwampDragon_Info()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Exit))
	{
		AI_Output(self,other, " DIA_CipherDJG_GoForSwampDragon_07_00 " );	// (growls) Attack!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SwampDragon");
		B_StartOtherRoutine(DJG_Rod,"SwampDragon");
	}
	else
	{
		AI_Output(self,other, " DIA_CipherDJG_GoForSwampDragon_07_01 " );	// I can already hear this creature. We must be careful!
		AI_Output(self,other, " DIA_CipherDJG_GoForSwampDragon_07_02 " );	// Go ahead and see if we can attack.
		AI_StopProcessInfos(self);
	};
	self.flags = 0;
	DJG_Rod.flags = 0;
};


instance DIA_CipherDJG_SWAMPDRAGONDEAD(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_SWAMPDRAGONDEAD_Condition;
	information = DIA_CipherDJG_SWAMPDRAGONDEAD_Info;
	important = TRUE;
};


func int DIA_CipherDJG_SWAMPDRAGONDEAD_Condition()
{
	if((Npc_IsDead(SwampDragon) == TRUE) && (DJG_SwampParty == TRUE) && (DJG_SwampParty_GoGoGo == TRUE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SWAMPDRAGONDEAD_Info()
{
	AI_Output(self,other, " DIA_CipherDJG_SWAMPDRAGONDEAD_07_00 " );	// Damn. He is dead?
	AI_Output(other,self, " DIA_CipherDJG_SWAMPDRAGONDEAD_15_01 " );	// Calm down. Its end!
	AI_Output(self,other, " DIA_CipherDJG_SWAMPDRAGONDEAD_07_02 " );	// Wow, what a hulk.
	AI_StopProcessInfos(self);
	B_GivePlayerXP(XP_CipherDJGDeadDragon);
	DJG_SwampParty = FALSE;
	DJG_SwampParty_GoGoGo = FALSE;
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	DJG_Rod.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Rod,"Start");
};


instance DIA_CipherDJG_WHATNEXT(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_WHATNEXT_Condition;
	information = DIA_CipherDJG_WHATNEXT_Info;
	permanent = FALSE;
	description = " The swamp dragon is dead! " ;
};


func int DIA_CipherDJG_WHATNEXT_Condition()
{
	if (Npc_IsDead(SwampDragon) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_WHATNEXT_Info()
{
	AI_Output(other,self, " DIA_CipherDJG_WHATNEXT_15_00 " );	// The swamp dragon is dead! What are you going to do next?
	AI_Output(self,other, " DIA_CipherDJG_WHATNEXT_07_01 " );	// I have no idea. I haven't thought about it yet. And now you can return to Khorinis as a hero.
	AI_Output(self,other, " DIA_CipherDJG_WHATNEXT_07_02 " );	// I bet you can make a fortune on this. Think about it.
	B_LogEntry(TOPIC_Dragonhunter, " Cypher thinks that now that the swamp dragon is dead, he can make a lot of money as a great 'hero'. Well, we'll see. " );
	AI_StopProcessInfos(self);
};


instance DIA_CipherDJG_PICKPOCKET(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 900;
	condition = DIA_CipherDJG_PICKPOCKET_Condition;
	information = DIA_CipherDJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_CipherDJG_PICKPOCKET_Condition()
{
	return  C_Robbery ( 79 , 220 );
};

func void DIA_CipherDJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_CipherDJG_PICKPOCKET);
	Info_AddChoice(DIA_CipherDJG_PICKPOCKET,Dialog_Back,DIA_CipherDJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_CipherDJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_CipherDJG_PICKPOCKET_DoIt);
};

func void DIA_CipherDJG_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_CipherDJG_PICKPOCKET);
};

func void DIA_CipherDJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_CipherDJG_PICKPOCKET);
};


instance DIA_CipherDJG_FUCKOFF(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 2;
	condition = DIA_CipherDJG_fuckoff_condition;
	information = DIA_CipherDJG_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_CipherDJG_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_CipherDJG_MoreDrugs_Done(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 2;
	condition = DIA_CipherDJG_MoreDrugs_Done_Condition;
	information = DIA_CipherDJG_MoreDrugs_Done_Info;
	permanent = FALSE;
	description = " I have another bag of bogweed with me. " ;
};

func int DIA_CipherDJG_MoreDrugs_Done_Condition()
{
	if((MIS_MoreDrugs == LOG_Running) && (Npc_HasItems(hero,ItMi_JointPacket_OW) >= 1))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_MoreDrugs_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_CipherDJG_MoreDrugs_Done_01_00 " );	// I have another bog bag with me.
	AI_Output(self,other, " DIA_CipherDJG_MoreDrugs_Done_01_01 " );	// Have you been there yet? Well, you're a daredevil!
	AI_Output(self,other, " DIA_CipherDJG_MoreDrugs_Done_01_02 " );	// Let's do this: you give me this package, and I'll give you half of the amount that can be obtained for it.
	AI_Output(other,self, " DIA_CipherDJG_MoreDrugs_Done_01_03 " );	// And how much is that in gold?
	AI_Output(self,other, " DIA_CipherDJG_MoreDrugs_Done_01_04 " );	// Let me think... Well, about a thousand coins! Well, what about hands?
	AI_Output(other,self, " DIA_CipherDJG_MoreDrugs_Done_01_05 " );	// Agreed! Here, take the package.
	B_GiveInvItems(other,self,ItMi_JointPacket_OW,1);
	Npc_RemoveInvItems(self,ItMi_JointPacket_OW,1);
	AI_Output(self,other, " DIA_CipherDJG_MoreDrugs_Done_01_06 " );	// Great! Now my life on this farm will not be so boring.
	AI_Output(self,other, " DIA_CipherDJG_MoreDrugs_Done_01_07 " );	// Here's your share. Just don't drink it right away! (laughs)
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	MIS_MoreDrugs = LOG_Success;
	Log_SetTopicStatus(Topic_MoreDrugs,LOG_Success);
	B_LogEntry(Topic_MoreDrugs, " I sold a package of bogweed to Cypher for a thousand gold coins. " );
	AI_StopProcessInfos(self);
};
