

instance DIA_Richter_EXIT (C_Info)
{
	npc = Wolf_402_Richter;
	nr = 999;
	condition = DIA_Richter_EXIT_Condition;
	information = DIA_Richter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Richter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


DIA_RICHTER_TALIASAN (C_Info) instance
{
	npc = Wolf_402_Richter;
	nr = 1;
	condition = dia_richter_taliasan_condition;
	information = dia_richter_taliasan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_richter_taliasan_condition()
{
	if ( METALLIC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_richter_taliasan_info()
{
	AI_Output(self,other, " DIA_Richter_Taliasan_01_00 " );	// What are you doing here? Who are you? And who let you in here?!
	AI_Output(other,self, " DIA_Richter_Taliasan_01_01 " );	// Well... I... this...
	AI_Output(self,other, " DIA_Richter_Taliasan_01_02 " );	// I see that you weren't even taught how to talk properly.
	AI_Output(self,other, " DIA_Richter_Taliasan_01_03 " );	// You can immediately see - no dignity, no manners!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Richter_Taliasan_01_0A " );	// And I don't understand how you got accepted as a Firebender...
	};
	AI_Output(other,self, " DIA_Richter_Taliasan_01_04 " );	// Perhaps I should have taught you a lesson in manners!
	AI_Output(self,other, " DIA_Richter_Taliasan_01_05 " );	// What?! Are you still going to threaten me? Ha! Also me, another Gallahad turned up!
	AI_Output(other,self, " DIA_Richter_Taliasan_01_06 " );	// Gallahad? And who is it?
	AI_Output(self,other, " DIA_Richter_Taliasan_01_07 " );	// Yes, we had one such smart guy here. I thought if he is a magician, then he can do anything.
	AI_Output(self,other, " DIA_Richter_Taliasan_01_08 " );	// Well, where is he now, you ask?!
	AI_Output(other,self,"DIA_Richter_Taliasan_01_09");	//Где?
	AI_Output(self,other, " DIA_Richter_Taliasan_01_10 " );	// How should I know? Vzashey kicked out a couple of years ago. And serve him right!
	AI_Output(self,other, " DIA_Richter_Taliasan_01_11 " );	// Maybe now he's hanging out somewhere in the port district among the various dregs of society. In general, there it is the place.
	AI_Output(self,other, " DIA_Richter_Taliasan_01_12 " );	// So if you don't want to be treated the same way, get the hell out of here!
	AI_Output(self,other, " DIA_Richter_Taliasan_01_13 " );	// This is no place for people like you!
	KNOWSABOUTTALIASAN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Hello(C_Info)
{
	npc = Wolf_402_Richter;
	nr = 4;
	condition = DIA_Richter_Hello_Condition;
	information = DIA_Richter_Hello_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Richter_Hello_Condition()
{
	if(MIS_Lee_JudgeRichter == 0)
	{
		return TRUE;
	};
};

func void DIA_Richter_Hello_Info()
{
	AI_Output(other,self, " DIA_Richter_Hello_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Richter_Hello_10_01 " );	// What do you want from me? Who are you anyway?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//Я, э-э...
	AI_Output(self,other, " DIA_Richter_Hello_10_03 " );	// Tell me, have we met anywhere before?
	Info_ClearChoices(DIA_Richter_Hello);
	Info_AddChoice(DIA_Richter_Hello, " I don't remember that. " ,DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice(DIA_Richter_Hello, " Maybe so. " ,DIA_Richter_Hello_MayBe);
};

func void DIA_Richter_Hello_DontThinkSo()
{
	AI_Output(other,self, " DIA_Richter_Hello_DontThinkSo_15_00 " );	// I don't remember that.
	AI_Output(self,other, " DIA_Richter_Hello_DontThinkSo_10_01 " );	// Funny. I'd swear I've seen you somewhere before.
	AI_Output(self,other, " DIA_Richter_Hello_DontThinkSo_10_02 " );	// Okay, all you dregs of society look alike.
};

func void DIA_Richter_Hello_MayBe()
{
	AI_Output(other,self, " DIA_Richter_Hello_MayBe_15_00 " );	// Maybe so.
	AI_Output(self,other, " DIA_Richter_Hello_MayBe_10_01 " );	// Are you completely insolent?! Do you even know who you're talking to?
	AI_Output(self,other, " DIA_Richter_Hello_MayBe_10_02 " );	// At least you could address me more respectfully.
	AI_Output(self,other, " DIA_Richter_Hello_MayBe_10_03 " );	// Now get out of my sight!
	AI_StopProcessInfos(self);
};


instance DIA_Richter_Perm(C_Info)
{
	npc = Wolf_402_Richter;
	nr = 800;
	condition = DIA_Richter_Perm_Condition;
	information = DIA_Richter_Perm_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Richter_Perm_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Richter_Hello) || (MIS_Lee_JudgeRichter == LOG_Running)) && (SCIstRichtersLakai ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Richter_Perm_Info()
{
	AI_Output(other,self, " DIA_Richter_Perm_15_00 " );	// How are you?
	if((MIS_Lee_JudgeRichter == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other, " DIA_Richter_Perm_10_01 " );	// You'd better get out of here, you dirty mercenary, before I call the guards.
		AI_Output(other,self, " DIA_Richter_Perm_15_02 " );	// Relax. I'm not here to rob you. I'm looking for a job.
		AI_Output(self,other, " DIA_Richter_Perm_10_03 " );	// Ah. So you want to work for me. Hmm. This, of course, changes things.
		AI_Output(self,other, " DIA_Richter_Perm_10_04 " );	// Yes, I have a little problem. But I don't know if I can trust you. First you must prove that you can be relied upon.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Richter_Perm_10_05 " );	// Didn't I already say I don't want to have anything to do with you?
		AI_Output(other,self, " DIA_Richter_Perm_15_06 " );	// No, at least not in that detail.
		AI_Output(self,other, " DIA_Richter_Perm_10_07 " );	// But now, I hope you finally get it.
	};
};


instance DIA_Richter_RichtersLakai (C_Info)
{
	npc = Wolf_402_Richter;
	nr = 2;
	condition = DIA_Richter_RichtersLakai_Condition;
	information = DIA_Richter_RichtersLakai_Info;
	description = " Test me. " ;
};


func int DIA_Richter_RichtersLakai_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_Richter_Hello ) || ( MIS_Lee_JudgeRichter !=  0 )) && ( SCIstRichtersLakai ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Richter_RichtersLakai_Info()
{
	AI_Output(other,self, " DIA_Richter_RichtersLakai_15_00 " );	// Test me.
	AI_Output(self,other, " DIA_Richter_RichtersLakai_10_01 " );	// Mmm. Good. Listen. Bring me the sacred hammer of the Fire Mages. They keep it somewhere in the cellars of the monastery.
	AI_Output(self,other, " DIA_Richter_RichtersLakai_10_02 " );	// If you succeed, I'll consider accepting you as a bodyguard.
	Info_ClearChoices(DIA_Richter_RichtersLakai);
	Info_AddChoice(DIA_Richter_RichtersLakai, " Should I steal from mages? You've gone crazy. " ,DIA_Richter_RichtersLakai_nein);
	Info_AddChoice(DIA_Richter_RichtersLakai, " Good. " ,DIA_Richter_RichtersLakai_ja);
	B_LogEntry(TOPIC_RichterLakai, " The Judge does not trust me. I must prove my allegiance to him. I must steal the sacred hammer from the basement of the firebender monastery and bring the hammer to him. " );
	MIS_Richter_BringHolyHammer = LOG_Running;
};

func void DIA_Richter_RichtersLakai_nein()
{
	AI_Output(other,self, " DIA_Richter_RichtersLakai_nein_15_00 " );	// Should I steal from mages? Yes, your roof has gone.
	AI_Output(self,other, " DIA_Richter_RichtersLakai_nein_10_01 " );	// Then go to hell! Stop wasting my time.
	AI_StopProcessInfos(self);
};

func void DIA_Richter_RichtersLakai_ja()
{
	AI_Output(other,self, " DIA_Richter_RichtersLakai_ja_15_00 " );	// Good.
	AI_Output(self,other, " DIA_Richter_RichtersLakai_ja_10_01 " );	// Great! But remember - if you get caught, I never heard of you.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KillMorgahard(C_Info)
{
	npc = Wolf_402_Richter;
	nr = 2;
	condition = DIA_Richter_KillMorgahard_Condition;
	information = DIA_Richter_KillMorgahard_Info;
	description = " Here is the sacred hammer of the mages. " ;
};


func int DIA_Richter_KillMorgahard_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) && (MIS_Richter_BringHolyHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KillMorgahard_Info()
{
	AI_Output(other,self, " DIA_Richter_KillMorgahard_15_00 " );	// Here is the sacred hammer of the mages.
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	AI_Output(self,other, " DIA_Richter_KillMorgahard_10_01 " );	// I'm amazed! Sounds like you're really serious. Here is your reward.
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(self,other, " DIA_Richter_KillMorgahard_10_02 " );	// Great. Since everything went well, I have one more task for you.
	AI_Output(self,other, " DIA_Richter_KillMorgahard_10_03 " );	// A few days ago, several prisoners escaped from the local prison.
	AI_Output(self,other, " DIA_Richter_KillMorgahard_10_04 " );	// Those sons of bitches went to the mountains. Most likely towards the new tower of Xardas.
	AI_Output(self,other, " DIA_Richter_KillMorgahard_10_05 " );	// Their leader's name is Morgahard. I want you to kill him.
	AI_Output(self,other, " DIA_Richter_KillMorgahard_10_06 " );	// Hurry before they disappear somewhere else.
	Wld_InsertNpc(BDT_1030_Morgahard,"REICH");
	Wld_InsertNpc(BDT_1031_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1032_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1033_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1034_Fluechtling,"REICH");
	Wld_InsertNpc(BDT_1035_Fluechtling,"REICH");
	B_InitNpcGlobals();
	B_GivePlayerXP(XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry(TOPIC_RichterLakai, " Several prisoners escaped the judge. I must find them and finish them off, and also finish off their leader, Morgahard. They are supposedly hiding in the mountains, somewhere towards the new tower of Xardas. " );
	MIS_Richter_KillMorgahard = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Richter_KilledMorgahard(C_Info)
{
	npc = Wolf_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahard_Condition;
	information = DIA_Richter_KilledMorgahard_Info;
	description = " Morgahard is dead. " ;
};


func int DIA_Richter_KilledMorgahard_Condition()
{
	if(Npc_IsDead(Morgahard) && (MIS_Richter_KillMorgahard == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahard_Info()
{
	AI_Output(other,self, " DIA_Richter_KilledMorgahard_15_00 " );	// Morgahard is dead.
	AI_Output(self,other, " DIA_Richter_KilledMorgahard_10_01 " );	// Ah! You are a good guy. Here is your reward.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_KillMorgahard);
	B_LogEntry(TOPIC_RichterLakai, "The Judge seems to be upset by the news of Morgahard's death. Oh well, I don't care. My main goal is to complete Lee's task. " );
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};


instance DIA_Richter_KilledMorgahardPERM(C_Info)
{
	npc = Wolf_402_Richter;
	nr = 2;
	condition = DIA_Richter_KilledMorgahardPERM_Condition;
	information = DIA_Richter_KilledMorgahardPERM_Info;
	permanent = TRUE;
	description = " Is there anything else I can do for you? " ;
};


func int DIA_Richter_KilledMorgahardPERM_Condition()
{
	if((MIS_Richter_KillMorgahard == LOG_SUCCESS) && (MIS_RichtersPermissionForShip == 0))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahardPERM_Info()
{
	AI_Output(other,self, " DIA_Richter_KilledMorgahardPERM_15_00 " );	// Is there anything else I can do for you?
	AI_Output(self,other, " DIA_Richter_KilledMorgahardPERM_10_01 " );	// Not yet. Perhaps later.
};


instance DIA_Richter_PermissionForShip(C_Info)
{
	npc = Wolf_402_Richter;
	nr = 2;
	condition = DIA_Richter_PermissionForShip_Condition;
	information = DIA_Richter_PermissionForShip_Info;
	description = " Give me written confirmation of authority to command the paladin ship. " ;
};


func int DIA_Richter_PermissionForShip_Condition()
{
	if(MIS_RichtersPermissionForShip == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Richter_PermissionForShip_Info()
{
	AI_Output(other,self, " DIA_Richter_PermissionForShip_15_00 " );	// Give me written confirmation of authority to command the paladin ship.
	AI_Output(self,other, " DIA_Richter_PermissionForShip_10_01 " );	// (laughs) You must be out of your mind. What do you want me to do?
	AI_Output(other,self, " DIA_Richter_PermissionForShip_15_02 " );	// You already heard. Either you give me this paper, or I will hand you over to the militia.
	AI_Output(self,other, " DIA_Richter_PermissionForShip_10_03 " );	// (growls) No one dares to blackmail me! Especially you! I'll feed you to the wolves, you despicable piece of shit!
	AI_Output(other,self, " DIA_Richter_PermissionForShip_15_04 " );	// Morgahard attacked the governor on your orders. I have a document confirming this.
	AI_Output(self,other, " DIA_Richter_PermissionForShip_10_05 " );	// (Growls) Ahh.
	AI_Output(self,other, " DIA_Richter_PermissionForShip_10_06 " );	// You'll regret this. This blackmail will not get away with you just like that.
	AI_Output(self,other, " DIA_Richter_PermissionForShip_10_07 " );	// Here's your paper. Now get lost. I'll deal with you later.
	CreateInvItems(self,ITWr_ForgedShipLetter_MIS,1);
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	B_LogEntry(Topic_Ship, " Authentication letter should allow for easy takeover of the ship. I wonder what Lee has to say about that. " );
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP(XP_RichtersPermissionForShip);
};


instance DIA_Richter_perm2(C_Info)
{
	npc = Wolf_402_Richter;
	nr = 2;
	condition = DIA_Richter_perm2_Condition;
	information = DIA_Richter_perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Richter_perm2_Condition()
{
	if((MIS_RichtersPermissionForShip == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Richter_perm2_Info()
{
	AI_Output(self,other, " DIA_Richter_perm2_10_00 " );	// Get out of my sight.
	AI_StopProcessInfos(self);
};


instance DIA_Richter_PICKPOCKET(C_Info)
{
	npc = Wolf_402_Richter;
	nr = 900;
	condition = DIA_Richter_PICKPOCKET_Condition;
	information = DIA_Richter_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};


func int DIA_Richter_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Richter) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Richter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
	Info_AddChoice(DIA_Richter_PICKPOCKET,Dialog_Back,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Richter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_Richter,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Richter_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
};


