
instance DIA_Morgahard_EXIT(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 999;
	condition = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Morgahard_HALLO (C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_HALLO_Condition;
	information = DIA_Morgahard_HELLO_Info;
	description = " You are Morgahard. " ;
};


func int DIA_Morgahard_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info()
{
	AI_Output(other,self, " DIA_Morgahard_HALLO_15_00 " );	// You are Morgahard?
	AI_Output(self,other, " DIA_Morgahard_HALLO_07_01 " );	// How do you know my name?
	AI_Output(other,self, " DIA_Morgahard_HALLO_15_02 " );	// The judge is looking for you. You escaped from prison.
	AI_Output(other,self, " DIA_Morgahard_HALLO_15_03 " );	// What did you do? Steal his wallet?
	AI_Output(self,other, " DIA_Morgahard_HALLO_07_04 " );	// Not him! The heads of the city, on his orders.
	AI_Output(self,other, " DIA_Morgahard_HALLO_07_05 " );	// And after we struck, he did not want to share the loot with us and put us behind bars.
	AI_Output(self,other, " DIA_Morgahard_HALLO_07_06 " );	// We didn't want to hang, so we ran away.
	AI_Output(self,other, " DIA_Morgahard_HALLO_07_07 " );	// We thought we wouldn't be found here. But it looks like we were wrong.
	Info_ClearChoices(DIA_Morgahard_HALLO);
	Info_AddChoice(DIA_Morgahard_HALLO, " Stop whining! Draw your weapon. " ,DIA_Morgahard_HALLO_attack);
	Info_AddChoice(DIA_Morgahard_HALLO, " What can we do about the judge? " ,DIA_Morgahard_HALLO_richter);
	Info_AddChoice(DIA_Morgahard_HALLO, " The judge ordered me to kill you. " ,DIA_Morgahard_HALLO_tot);
	B_LogEntry(TOPIC_RichterLakai, " I found Morgahard, the leader of the tramps. " );
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP(XP_FoundMorgahard);
};

func void DIA_Morgahard_HELLO_tot()
{
	AI_Output(other,self, " DIA_Morgahard_HALLO_tot_15_00 " );	// The judge ordered me to kill you.
	AI_Output(self,other, " DIA_Morgahard_HALLO_tot_07_01 " );	// Yes, of course. That's what you came here for, right?
};

func void DIA_Morgahard_HELLO_richter()
{
	AI_Output(other,self, " DIA_Morgahard_HALLO_richter_15_00 " );	// What can we do about the judge?
	AI_Output(self,other, " DIA_Morgahard_HALLO_richter_07_01 " );	// Nothing. He settled in the upper quarter of the city like a spider in a web. Untouchable.
	AI_Output(other,self, " DIA_Morgahard_HALLO_richter_15_02 " );	// No one is untouchable. We need proof of his guilt in the mayor's case.
	AI_Output(self,other, " DIA_Morgahard_HALLO_richter_07_03 " );	// Proof you say? I have it. But who will listen to a fugitive?
	AI_Output(other,self, " DIA_Morgahard_HALLO_richter_15_04 " );	// Give me this proof and I'll make sure no one else hunts you.
	AI_Output(self,other, " DIA_Morgahard_HALLO_richter_07_05 " );	// Are you sure? Good. Here, take this letter. It is signed by the judge.
	B_GiveInvItems(self,other,ItWr_RichterKomproBrief_MIS,1);
	AI_Output(self,other, " DIA_Morgahard_HALLO_richter_07_06 " );	// If this doesn't exonerate me, it will prove that the judge is a crook.
	B_LogEntry(TOPIC_RichterLakai, " Morgahard gave me a paper with the judge's order. This piece of paper proves that the judge robbed the mayor of Larius. I think that's what Lee wanted to find. " );
	AI_StopProcessInfos(self);
};

var int MorgahardSucked;

func void DIA_Morgahard_HALLO_attack()
{
	AI_Output(other,self, " DIA_Morgahard_HALLO_attack_15_00 " );	// Stop whining! Grab your weapon. We will put an end to this now.
	AI_Output(self,other, " DIA_Morgahard_HALLO_attack_07_01 " );	// Great. I have nothing to lose.
	AI_StopProcessInfos(self);
	MorgahardSucked = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

instance DIA_Morgahard_Nickname(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Nickname_Condition;
	information = DIA_Morgahard_Nickname_Info;
	permanent = FALSE;
	description = " Adelhard, isn't your relative? " ;
};

func int DIA_Morgahard_Nickname_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Morgahard_HALLO) && (MorgahardSucked == FALSE) && (AlehardHere == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Nickname_Info()
{
	AI_Output(other,self, " DIA_Morgahard_Nickname_01_00 " );	// Adelhard, isn't your relative?
	AI_Output(self,other, " DIA_Morgahard_Nickname_01_01 " );	// Who?! Alehard?... I don't know any Alehard.
	AI_Output(other,self, " DIA_Morgahard_Nickname_01_02 " );	// Actually, I said 'Adelhard'.
	AI_Output(self,other, " DIA_Morgahard_Nickname_01_03 " );	// I don't know him.
	AI_Output(other,self, " DIA_Morgahard_Nickname_01_04 " );	// Yes, there are not two of them, but only one - A-del-hard!
	AI_Output(self,other, " DIA_Morgahard_Nickname_01_05 " );	// I think you're fucking with me! Go to hell!
	AI_Output(other,self, " DIA_Morgahard_Nickname_01_06 " );	// Whoa, whoa, take it easy! I just asked without any ulterior motive.
	AI_Output(self,other, " DIA_Morgahard_Nickname_01_07 " );	// Yeah, you're not the first 'just asker' in my lifetime. I don't know anyone, you understand?
	AI_Output(self,other, " DIA_Morgahard_Nickname_01_08 " );	// Neither Alehard, nor Leonard, nor Bernard, nor Fernando... although, I know a Fernando... Does he interest you by any chance?!
	AI_Output(other,self,"DIA_Morgahard_Nickname_01_09");	//No.
	AI_Output(self,other,"DIA_Morgahard_Nickname_01_10");	//Pity.
	AI_Output(other,self, " DIA_Morgahard_Nickname_01_11 " );	// You and Adelhard have similar names, so I thought...
	AI_Output(self,other, " DIA_Morgahard_Nickname_01_12 " );	// Oh! He thought! Look, Larius and Cornelius also have the same names! Maybe they are husband and wife? Ask at the meeting!
	AI_Output(other,self, " DIA_Morgahard_Nickname_01_13 " );	// That's an idea.
};

instance DIA_Morgahard_Perm(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Perm_Condition;
	information = DIA_Morgahard_Perm_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Morgahard_Perm_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Morgahard_HALLO) && (MorgahardSucked == FALSE) && (AlehardHere == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm_Info()
{
	AI_Output(self,other, " DIA_Morgahard_Perm_07_00 " );	// And this scoundrel judge... I'll see him doing a gallows jig, mark my words.
	AI_StopProcessInfos(self);
};


instance DIA_Morgahard_Perm2(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Perm2_Condition;
	information = DIA_Morgahard_Perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Morgahard_Perm2_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MorgahardSucked == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm2_Info()
{
	AI_Output(self,other, " DIA_Morgahard_Perm2_07_00 " );	// Why don't you just disappear?
	AI_StopProcessInfos(self);
};


instance DIA_Morgahard_PICKPOCKET(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 900;
	condition = DIA_Morgahard_PICKPOCKET_Condition;
	information = DIA_Morgahard_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Morgahard_PICKPOCKET_Condition()
{
	return  C_Robbery ( 73 , 45 );
};

func void DIA_Morgahard_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice(DIA_Morgahard_PICKPOCKET,Dialog_Back,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Morgahard_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
};

func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
};
