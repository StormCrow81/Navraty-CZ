

instance DIA_Cipher_EXIT(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 999;
	condition = DIA_Cipher_EXIT_Condition;
	information = DIA_Cipher_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cipher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_Hello(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 1;
	condition = DIA_Cipher_Hello_Condition;
	information = DIA_Cipher_Hello_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Cipher_Hello_Condition()
{
	return TRUE;
};

func void DIA_Cipher_Hello_Info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Как дела?
	AI_Output(self,other, " DIA_Cipher_Hello_07_01 " );	// Hey, do I know you from somewhere?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//Возможно...
	AI_Output(self,other, " DIA_Cipher_Hello_07_03 " );	// I traded swamp grass in the colony, remember?
};


instance DIA_Cipher_TradeWhat(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_TradeWhat_Condition;
	information = DIA_Cipher_TradeWhat_Info;
	permanent = FALSE;
	description = " What are you trading now? " ;
};


func int DIA_Cipher_TradeWhat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_Hello))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TradeWhat_Info()
{
	AI_Output(other,self, " DIA_Cipher_TradeWhat_15_00 " );	// What are you trading now?
	AI_Output(self,other, " DIA_Cipher_TradeWhat_07_01 " );	// Ah, don't ask.
	AI_Output(self,other, " DIA_Cipher_TradeWhat_07_02 " );	// I brought a whole bale of swamp grass with me from the colony.
	AI_Output(self,other, " DIA_Cipher_TradeWhat_07_03 " );	// Many mercenaries like to smoke weed occasionally. I was even able to make a small fortune from it.
	AI_Output(self,other, " DIA_Cipher_TradeWhat_07_04 " );	// But some bastard stole this herb from my chest!
	Log_CreateTopic(Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherPaket,LOG_Running);
	B_LogEntry(Topic_CipherPaket, " The mercenary Cipher has lost a bale of swamp grass. " );

	if ( ! Npc_IsDead(Bodo))
	{
		AI_Output(self,other, " DIA_Cipher_TradeWhat_07_05 " );	// I'm pretty sure it's Bodo. He sleeps in the same room as me and always grins when he sees me like an idiot...
		B_LogEntry(Topic_CipherPaket, " He suspects Bodo stole it. " );
	};
	MIS_Cipher_Paket = LOG_Running;
};

instance DIA_Cipher_MoreDrugs(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_MoreDrugs_Condition;
	information = DIA_Cipher_MoreDrugs_Info;
	permanent = FALSE;
	description = " A whole bag of bogweed?! " ;
};

func int DIA_Cipher_MoreDrugs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};

func void DIA_Cipher_MoreDrugs_Info()
{
	AI_Output(other,self, " DIA_Cipher_MoreDrugs_01_00 " );	// A whole package of swamps?
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_01_01 " );	// Does that surprise you? It was an extremely hot commodity in the colony.
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_01_02 " );	// And it wasn't just those crazy morons in the swamps that made it.
	AI_Output(self,other,"DIA_Cipher_MoreDrugs_01_03");	//Кстати...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_01_04 " );	// I even know a place where you can get another such package!
	AI_Output(other,self, " DIA_Cipher_MoreDrugs_01_05 " );	// True? And where?
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_01_06 " );	// (smiles) You want to earn extra money, right?
	AI_Output(other,self, " DIA_Cipher_MoreDrugs_01_07 " );	// Wouldn't mind.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_01_08 " );	// At one time, a guy named Jacko set up a bogweed lab near the entrance to the New Camp.
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_01_09 " );	// He had whole deposits of this swamp grass there!
	AI_Output(other,self, " DIA_Cipher_MoreDrugs_01_10 " );	// Do you think there could still be something left?
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_01_11 " );	// Maybe... (thoughtfully) True, it will be quite difficult to check this. After all, there are orcs around now!
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_01_12 " );	// But if you suddenly decide to visit the Valley of Mines, you can try to look there too.
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_01_13 " );	// Just don't forget that I told you about that place!
	AI_Output(other,self, " DIA_Cipher_MoreDrugs_01_14 " );	// Don't worry. I understand.
	MIS_MoreDrugs = LOG_Running;
	Log_CreateTopic(Topic_MoreDrugs,LOG_MISSION);
	Log_SetTopicStatus(Topic_MoreDrugs,LOG_Running);
	B_LogEntry(Topic_MoreDrugs, " Cypher told me about a secret swamp grass lab. It was near the entrance to the New Camp. " );
};

instance DIA_Cipher_MoreDrugs_Done(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_MoreDrugs_Done_Condition;
	information = DIA_Cipher_MoreDrugs_Done_Info;
	permanent = FALSE;
	description = " I have another bag of bogweed with me. " ;
};

func int DIA_Cipher_MoreDrugs_Done_Condition()
{
	if((MIS_MoreDrugs == LOG_Running) && (Npc_HasItems(hero,ItMi_JointPacket_OW) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cipher_MoreDrugs_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_Cipher_MoreDrugs_Done_01_00 " );	// I have another bog bag with me.
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_Done_01_01 " );	// (smiling) You still went there! Well, you're a daredevil.
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_Done_01_02 " );	// Let's do this: you give me this package, and I'll give you half of the amount that can be obtained for it.
	AI_Output(other,self, " DIA_Cipher_MoreDrugs_Done_01_03 " );	// And how much is that in gold?
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_Done_01_04 " );	// Let me think... Well, about a thousand coins! Well, what about hands?
	AI_Output(other,self, " DIA_Cipher_MoreDrugs_Done_01_05 " );	// Agreed! Here, take the package.
	B_GiveInvItems(other,self,ItMi_JointPacket_OW,1);
	Npc_RemoveInvItems(self,ItMi_JointPacket_OW,1);
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_Done_01_06 " );	// Great! (satisfied) Now my life on this farm will not be so boring.
	AI_Output(self,other, " DIA_Cipher_MoreDrugs_Done_01_07 " );	// Here's your share. Just don't drink it right away! (laughs)
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	MIS_MoreDrugs = LOG_Success;
	Log_SetTopicStatus(Topic_MoreDrugs,LOG_Success);
	B_LogEntry(Topic_MoreDrugs, " I sold a package of bogweed to Cypher for a thousand gold coins. " );
	AI_StopProcessInfos(self);
};

instance DIA_Cipher_DoWithThief(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DoWithThief_Condition;
	information = DIA_Cipher_DoWithThief_Info;
	permanent = FALSE;
	description = " And what are you going to do with the thief? " ;
};

func int DIA_Cipher_DoWithThief_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DoWithThief_Info()
{
	AI_Output(other,self, " DIA_Cipher_DoWithThief_15_00 " );	// And what are you going to do with the thief?
	AI_Output(self,other, " DIA_Cipher_DoWithThief_07_01 " );	// Someday I'll catch him smoking my weed.
	AI_Output(self,other, " DIA_Cipher_DoWithThief_07_02 " );	// And then, I will find a secluded place and teach him a lesson that he will not soon forget.
	AI_Output(self,other, " DIA_Cipher_DoWithThief_07_03 " );	// If I cut it down right here in the middle of the yard, in front of the farmers, I could pay for it.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//Это почему?
	AI_Output(self,other, " DIA_Cipher_DoWithThief_07_05 " );	// Weight is simple. We can't annoy the farmers or Lee will make us pay a hefty fine. So ordered Onar.
	AI_Output(self,other, " DIA_Cipher_DoWithThief_07_06 " );	// And the more witnesses, the more noise will rise. And there will be more fines.
	AI_Output(self,other, " DIA_Cipher_DoWithThief_07_07 " );	// So this will need to be done carefully and quietly...
};


instance DIA_Cipher_WannaJoin(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_WannaJoin_Condition;
	information = DIA_Cipher_WannaJoin_Info;
	permanent = FALSE;
	description = " I want to join Lee's people! " ;
};


func int DIA_Cipher_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_Hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Cipher_WannaJoin_15_00 " );	// I want to join Lee's people!
	AI_Output(self,other, " DIA_Cipher_WannaJoin_07_01 " );	// LI people?! If Lee continues like this, they will soon cease to be his people!
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//Почему?
	AI_Output(self,other, " DIA_Cipher_WannaJoin_07_03 " );	// Lee has always been very calm. And in the colony, he behaved the same way.
	AI_Output(self,other, " DIA_Cipher_WannaJoin_07_04 " );	// But lately it's gotten too much. He wants to just sit here and wait until the paladins starve to death.
	AI_Output(self,other, " DIA_Cipher_WannaJoin_07_05 " );	// Silvio thinks we should shave a little on the small farms near the city.
	AI_Output(self,other, " DIA_Cipher_WannaJoin_07_06 " );	// I think that would be an excellent change of scenery.
	AI_Output(self,other, " DIA_Cipher_WannaJoin_07_07 " );	// And now most of us are just twiddling our thumbs here. And you still want to join?
};


instance DIA_Cipher_YesJoin(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_YesJoin_Condition;
	information = DIA_Cipher_YesJoin_Info;
	permanent = FALSE;
	description = " I still want to be one of you! " ;
};


func int DIA_Cipher_YesJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_YesJoin_Info()
{
	AI_Output(other,self, " DIA_Cipher_YesJoin_15_00 " );	// I still want to be one of you!
	AI_Output(self,other, " DIA_Cipher_YesJoin_07_01 " );	// Did you already know that we vote for every new recruit?
	AI_Output(other,self, " DIA_Cipher_YesJoin_15_02 " );	// What are you implying?
	AI_Output(self,other, " DIA_Cipher_YesJoin_07_03 " );	// Well, I haven't smoked in a long time. Bring me some swamp grass and you'll have my vote.
	AI_Output(self,other, " DIA_Cipher_YesJoin_07_04 " );	// I'm sure you'll be able to find something.
	MIS_Cipher_BringWeed = LOG_Running;
	Log_CreateTopic(Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_Running);
	B_LogEntry(Topic_CipherHerb, " Cipher will vote for me if I bring him some swamp grass. " );
};


instance DIA_Cipher_Joints(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_Joints_Condition;
	information = DIA_Cipher_Joints_Info;
	permanent = TRUE;
	description = " About the swamp grass... " ;
};


func int DIA_Cipher_Joints_Condition()
{
	if(MIS_Cipher_BringWeed == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cipher_Joints_Info()
{
	AI_Output(other,self, " DIA_Cipher_Joints_15_00 " );	// About swamp grass...
	if(MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Cipher_Joints_07_01 " );	// You brought back my bale! Now everything will be great!

		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other, " DIA_Cipher_Joints_07_02 " );	// I will definitely vote for you.
			B_LogEntry(TOPIC_SLDRespekt, " Cypher will vote for me when I decide to join the mercenaries. " );
		};

		MIS_Cipher_BringWeed = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(DIA_Cipher_Joints);
		Info_AddChoice(DIA_Cipher_Joints, " I'll see what I can do. " ,DIA_Cipher_Joints_Running);

		if(Npc_HasItems(other,ItMi_Joint) > 0)
		{
			Info_AddChoice(DIA_Cipher_Joints, " Here are some joints for you... " ,DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output(other,self, " DIA_Cipher_Joints_Running_15_00 " );	// Let's see what we can do.
	Info_ClearChoices(DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output(other,self, " DIA_Cipher_Joints_Success_15_00 " );	// Here are some bugs for you.
	if(B_GiveInvItems(other,self,ItMi_Joint,10))
	{
		AI_Output(self,other, " DIA_Cipher_Joints_Success_07_01 " );	// Ah! You are our man!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other, " DIA_Cipher_Joints_Success_07_02 " );	// You will get my vote.
			B_LogEntry(TOPIC_SLDRespekt, " Cypher will vote for me when I decide to join the mercenaries. " );
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_GivePlayerXP(XP_CipherWeed);
	}
	else
	{
		AI_Output(self,other, " DIA_Cipher_Joints_Success_07_03 " );	// Is that all? Yes, I'll smoke it in one sitting!
		AI_Output(self,other, " DIA_Cipher_Joints_Success_07_04 " );	// I need at least ten joints.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other, " DIA_Cipher_Joints_Success_07_05 " );	// Okay, you get my vote.
		};
	};
	Info_ClearChoices(DIA_Cipher_Joints);
};

instance DIA_Cipher_TRADE(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_TRADE_Condition;
	information = DIA_Cipher_TRADE_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};

func int DIA_Cipher_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && Wld_IsTime(7,35,23,35))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Cipher_TRADE_15_00 " );	// Show me your products.

	if(Npc_HasItems(self,ItMi_Joint) > 0)
	{
		AI_Output(self,other, " DIA_Cipher_TRADE_07_01 " );	// Of course! Choose.
	}
	else
	{
		AI_Output(self,other, " DIA_Cipher_TRADE_07_02 " );	// I don't have swamp grass right now. Do you want anything else?
	};
};


instance DIA_Cipher_DarDieb(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DarDieb_Condition;
	information = DIA_Cipher_DarDieb_Info;
	permanent = FALSE;
	description = " I know who took your weed. " ;
};


func int DIA_Cipher_DarDieb_Condition()
{
	if(((Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE)) && !Npc_IsDead(Dar))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarDieb_Info()
{
	AI_Output(other,self, " DIA_Cipher_DarDieb_15_00 " );	// I know who took your weed.
	AI_Output(self,other, " DIA_Cipher_DarDieb_07_01 " );	// Who? Was it Bodo?
	AI_Output(other,self, " DIA_Cipher_DarDieb_15_02 " );	// No, one of the mercenaries did it - Dar.
	AI_Output(self,other, " DIA_Cipher_DarDieb_07_03 " );	// That bastard! Where is he?
	AI_Output(other,self, " DIA_Cipher_DarDieb_15_04 " );	// Even if you find him, it won't help you, he doesn't have that bale anymore. He sold it in Khorinis.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//ГДЕ ОН?!

	if(Npc_GetDistToWP(Dar,"NW_BIGFARM_KITCHEN_DAR") < 300)
	{
		AI_Output(other,self, " DIA_Cipher_DarDieb_15_06 " );	// Behind the kitchen, on the corner...
	};

	AI_Output(self,other, " DIA_Cipher_DarDieb_07_07 " );	// I WILL FINISH HIM!
	AI_StopProcessInfos(self);
	CipherGoDar = TRUE;
};

instance DIA_Cipher_DarLOST (C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DarLOST_Condition;
	information = DIA_Cipher_DarLOST_Info;
	permanent = FALSE;
	description = " You made a chop out of the Gift... Are you feeling better now? " ;
};


func int DIA_Cipher_DarLOST_Condition()
{
	if(Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cipher_GiveLOST_Info()
{
	AI_Output(other,self, " DIA_Cipher_DarLOST_15_00 " );	// You made a chop out of Dar... Are you feeling better now?
	AI_Output(self,other, " DIA_Cipher_DarLOST_07_01 " );	// (sighs) Yeah, a little better.
	AI_Output(other,self, " DIA_Cipher_DarLOST_15_02 " );	// But not for HIM, I guess...
	AI_Output(self,other, " DIA_Cipher_DarLOST_07_03 " );	// That nasty thief shouldn't have been in my chest!
	B_GivePlayerXP(XP_Ambient * 2);
};


instances of DIA_Cipher_KrautPaket (C_Info)
{
	npc = Sld_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_KrautPaket_Condition;
	information = DIA_Cipher_Krautpaket_Info;
	permanent = FALSE;
	description = " Is this your bale of swamp grass by any chance? " ;
};


func int DIA_Cipher_KrautPaket_Condition()
{
	if((Npc_HasItems(other,ItMi_HerbPaket) > 0) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cipher_KrautPaket_Info()
{
	AI_Output(other,self, " DIA_Cipher_KrautPaket_15_00 " );	// Isn't that your swamp grass bale by any chance?
	B_GiveInvItems(other,self,ItMi_HerbPaket,1);
	AI_Output(self,other, " DIA_Cipher_KrautPaket_07_01 " );	// Yes, mine! Where did you find it?
	AI_Output(other,self, " DIA_Cipher_KrautPaket_15_02 " );	// It's a long story...
	AI_Output(self,other, " DIA_Cipher_KrautPaket_07_03 " );	// Okay, it doesn't matter, but now I know you're our man.
	AI_Output(self,other, " DIA_Cipher_KrautPaket_07_04 " );	// Hey, take this as a reward.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Joint,10);
	B_GivePlayerXP(XP_Cipher_KrautPaket);
	AI_Output(self,other, " DIA_Cipher_KrautPaket_07_05 " );	// Now I'm going to twist a couple of joints...
	CreateInvItems(self,ItMi_Joint,40);
	Npc_RemoveInvItems(self,ItMi_HerbPaket,1);
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP(XP_CipherPaket);
};


instance DIA_CipherSLD_PICKPOCKET(C_Info)
{
	npc = Sld_803_Cipher;
	nr = 900;
	condition = DIA_CipherSLD_PICKPOCKET_Condition;
	information = DIA_CipherSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_CipherSLD_PICKPOCKET_Condition()
{
	return  C_Robbery ( 65 , 65 );
};

func void DIA_CipherSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET,Dialog_Back,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
};

func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
};

