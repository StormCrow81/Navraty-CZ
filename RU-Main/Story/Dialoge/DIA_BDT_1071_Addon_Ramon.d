
instance DIA_Addon_Ramon_EXIT(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 999;
	condition = DIA_Addon_Ramon_EXIT_Condition;
	information = DIA_Addon_Ramon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Ramon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1071_Checkpoint = "BL_UP_CHECK";

instance DIA_Addon_Ramon_FirstWarn(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 1;
	condition = DIA_Addon_Ramon_FirstWarn_Condition;
	information = DIA_Addon_Ramon_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,BDT_1071_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return  FALSE ;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};

	return  FALSE ;
};

func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if (Npc_IsDead(Franco))
	{
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_00 " );	// Hey, what happened there?
		AI_Output(other,self, " DIA_Addon_Ramon_FirstWarn_15_01 " );	// I killed Franko.
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_02 " );	// So what? So it's YOUR job now to get these lazy people to do their job.
		AI_Output(other,self, " DIA_Addon_Ramon_FirstWarn_15_03 " );	// Hey, I'm not here to babysit hunters. I need to get to the camp.
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_04 " );	// Forget it. You killed Franco - now you're the senior, so do your job.
		AI_Output(other,self, " DIA_Addon_Ramon_FirstWarn_15_05 " );	// If I'm the eldest, then I decide who enters next.
		AI_Output(other,self, " DIA_Addon_Ramon_FirstWarn_15_06 " );	// And I figured I'd be next in.
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_07 " );	// It's not that easy. We didn't ask for ANYONE, so NOBODY will come in.
		AI_Output(other,self, " DIA_Addon_Ramon_FirstWarn_15_08 " );	// Torus can send a new hunter commander to make room for me.
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_09 " );	// (laughs) You won't be left behind, right? Okay, then come here.
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_10 " );	// Torus will make sure that the hunters are not left without a commander.
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_11 " );	// What are you waiting for? And don't forget to take a pickaxe.
		self.aivar[ AIV_PASSGATE ] = TRUE ;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP(XP_Addon_In);
		AI_StopProcessInfos(self);
		AI_Teleport(Carlos,"BL_WAIT_FINN");
		B_StartOtherRoutine(Carlos,"START");
		B_StartOtherRoutine(Finn,"START");
	}
	else if(Ramon_News == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_12 " );	// Hey, what do you need? I can't imagine you have permission to enter the camp.
		if(Npc_KnowsInfo(other,DIA_Addon_Franco_HI))
		{
			AI_Output(other,self, " DIA_Addon_Ramon_FirstWarn_15_13 " );	// Franco sent me. He wants to know if you need more men.
		};
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_14 " );	// Yes, needed. Yesterday another guy gave up the ghost.
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_15 " );	// This idiot had a fight with Esteban.
		AI_Output(other,self, " DIA_Addon_Ramon_FirstWarn_15_16 " );	// Who is Esteban?
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_17 " );	// Commander of the lower camp. He determines who goes to the mine.
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_18 " );	// So tell Franco that Torus needs a new man. Understood?
		Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
		B_LogEntry(Topic_Addon_Franco, " Torus needs another person. Franco might be interested in this. " );
		Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice(DIA_Addon_Ramon_FirstWarn, " Torus? Torus himself? " ,DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice(DIA_Addon_Ramon_FirstWarn, " Torus? Never heard of him... " ,DIA_Addon_Ramon_FirstWarn_NO);
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_07_19 " );	// Hey, slow down. You won't make it here, so get out!
		AI_StopProcessInfos(self);
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

func void DIA_Addon_Ramon_FirstWarn_YES()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Ramon_FirstWarn_YES_15_00 " );	// Torus? Torus himself?
	AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_YES_07_01 " );	// Yes. SAM Torus. The one who accepts new people.
	AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_YES_07_02 " );	// The one who decides when a new person leaves the swamp and comes to the camp.
	AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_YES_07_03 " );	// Maybe you're saying that you've known Torus before?
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_04");	//Well... Yeah...
	AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_YES_07_05 " );	// Look, EVERYONE knows Torus.
	AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_YES_07_06 " );	// And that means you won't get in - and I won't even send word to him!
	Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
};

func void DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output(other,self, " DIA_Addon_Ramon_FirstWarn_NO_15_00 " );	// Torus? Never heard of him...
	AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_NO_07_01 " );	// Oh boy, you don't know him? He was head of the guard at the Old Camp.
	AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_NO_07_02 " );	// Everyone trusts the man.
	AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_NO_07_03 " );	// He calls new people in and decides who gets into the camp.
	AI_Output(self,other, " DIA_Addon_Ramon_FirstWarn_NO_07_04 " );	// If you live long enough, you'll get to know him.
	Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
};


instance DIA_Addon_Ramon_SecondWarn(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 2;
	condition = DIA_Addon_Ramon_SecondWarn_Condition;
	information = DIA_Addon_Ramon_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_GuardPass_Status] == GP_FirstWarnGiven) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Help_StrengthCmp(Npc_GetNearestWP(self),self.wp) ==  TRUE ) && (Npc_GetDistToWP(other,BDT_1071_Checkpoint); < ( other . aivar [ AIV_LastDistToWP ] -  50 ))) .
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output(self,other, " DIA_Addon_Ramon_SecondWarn_07_00 " );	// The next step will be your last!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Ramon_Attack(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 3;
	condition = DIA_Addon_Ramon_Attack_Condition;
	information = DIA_Addon_Ramon_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Ramon_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_Output(self,other, " DIA_Addon_Ramon_Attack_07_00 " );	// Some people are completely unteachable...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Addon_Ramon_News(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 10;
	condition = DIA_Addon_Ramon_News_Condition;
	information = DIA_Addon_Ramon_News_Info;
	permanent = FALSE;
	description = " I'm that new person. " ;
};


func int DIA_Addon_Ramon_News_Condition()
{
	if ( ! Npc_IsDead(Franco))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Ramon_News_Info()
{
	AI_Output(other,self, " DIA_Addon_Ramon_News_15_00 " );	// I'm the new guy.
	AI_Output(self,other, " DIA_Addon_Ramon_News_07_01 " );	// Hey, don't try to fool me. Franco decides which of you will go to the camp.
};


instance DIA_Addon_Ramon_Lie(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 10;
	condition = DIA_Addon_Ramon_Lie_Condition;
	information = DIA_Addon_Ramon_Lie_Info;
	permanent = FALSE;
	description = " Franco sent me... " ;
};


func int DIA_Addon_Ramon_Lie_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Ramon_News ) &&  ! Npc_IsDead ( Franco ) )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output(other,self, " DIA_Addon_Ramon_Lie_15_00 " );	// Franco sent me...
	AI_Output(self,other, " DIA_Addon_Ramon_Lie_07_01 " );	// Nope. Get out, or I'll break your face...
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Ramon_Perm(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 99;
	condition = DIA_Addon_Ramon_Perm_Condition;
	information = DIA_Addon_Ramon_Perm_Info;
	permanent = TRUE;
	description = " Situation under control? " ;
};


func int DIA_Addon_Ramon_Perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Ramon_News ) &&  ! Npc_IsDead ( Franco ) )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output(other,self, " DIA_Addon_Ramon_Perm_15_00 " );	// Is the situation under control?
	AI_Output(self,other, " DIA_Addon_Ramon_Perm_07_01 " );	// Everything is fine here until someone who is not allowed tries to enter the camp. Then it gets fun.
	AI_StopProcessInfos(self);
};
