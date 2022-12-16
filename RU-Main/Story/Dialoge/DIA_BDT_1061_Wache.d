
instance DIA_1061_Wache_EXIT(C_Info)
{
	npc = BDT_1061_Wache;
	nr = 999;
	condition = DIA_1061_Wache_EXIT_Condition;
	information = DIA_1061_Guard_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_1061_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_1061_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1061_Wache_Hello (C_Info)
{
	npc = BDT_1061_Wache;
	nr = 1;
	condition = DIA_1061_Wache_Hallo_Condition;
	information = DIA_1061_Wache_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1061_Wache_Hallo_Condition()
{
	return TRUE;
};

func void DIA_1061_Guard_Hello_Info()
{
	AI_Output(self,other, " DIA_1061_Wache_Hallo_01_00 " );	// Stop! You can't come here.
	AI_Output(other,self, " DIA_1061_Wache_Hallo_15_01 " );	// I want to talk to your leader.
	AI_Output(self,other, " DIA_1061_Wache_Hallo_01_02 " );	// Oh, I see, you want to talk to my boss. Well, then OF COURSE, I'll let you pass.
	AI_Output(self,other, " DIA_1061_Wache_Hallo_01_03 " );	// But only if you say his name. And if not, I'll have to kill you! Good?
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	Info_AddChoice(DIA_1061_Guard_Hello, " Ли " ,DIA_1061_Guard_Hello_Lee);
	if((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
	{
		Info_AddChoice(DIA_1061_Wache_Hallo, " Dexter " ,DIA_1061_Wache_Hallo_Dexter);
	};
	Info_AddChoice(DIA_1061_Wache_Hello, " Diego" ,DIA_1061_Wache_Hello_Diego);
	Info_AddChoice(DIA_1061_Wache_Hello, " No idea " ,DIA_1061_Wache_Hello_Huhnung);
};

func void DIA_1061_Guard_Hello_Lee()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Lee_15_00");	//Lee?
	AI_Output(self,other, " DIA_1061_Wache_Hallo_Lee_01_01 " );	// Well, what can I say? You just signed your own death warrant, boy!
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,0);
};

func void DIA_1061_Guard_Hello_Dexter()
{
	AI_Output(other,self, " DIA_1061_Wache_Hallo_Dexter_15_00 " );	// Dexter.
	AI_Output(self,other, " DIA_1061_Wache_Hallo_Dexter_01_01 " );	// Well... it looks like you really do know our boss. Okay, I'll let you through. But I'm warning you.
	AI_Output(self,other, " DIA_1061_Wache_Hallo_Dexter_01_02 " );	// If you get too close to someone, you won't get out of there alive!
	AI_Output(self,other, " DIA_1061_Wache_Hallo_Dexter_01_03 " );	// So take a deep breath and keep your sword sheathed. You will find Dexter in the house.
	Knows_Dexter = TRUE;
	BanditGuard.aivar[ AIV_PASSGATE ] = TRUE ;
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
};

func void DIA_1061_Guard_Hello_Diego()
{
	AI_Output(other,self, " DIA_1061_Wache_Hallo_Diego_15_00 " );	// Diego.
	AI_Output(self,other, " DIA_1061_Wache_Hallo_Diego_01_01 " );	// Right!
	AI_Output(self,other, " DIA_1061_Wache_Hallo_Diego_01_02 " );	// No, it was a joke. You have no idea who our boss is.
	AI_Output(self,other, " DIA_1061_Wache_Hallo_Diego_01_03 " );	// So I see no reason to keep you alive.
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,0);
};

func void DIA_1061_Guard_Hello_Hudson()
{
	AI_Output(other,self, " DIA_1061_Wache_Hallo_Ahnung_15_00 " );	// I have no idea.
	AI_Output(self,other, " DIA_1061_Wache_Hallo_Ahnung_01_01 " );	// Then you will die in ignorance.
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,0);
};


instance DIA_1061_Wache_Perm(C_Info)
{
	npc = BDT_1061_Wache;
	nr = 2;
	condition = DIA_1061_Wache_Perm_Condition;
	information = DIA_1061_Wache_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_1061_Wache_Perm_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_1061_Wache_Perm_Info()
{
	AI_Output(self,other, " DIA_1061_Wache_Perm_01_00 " );	// Remember: control yourself, and maybe you'll get out of here alive.
	AI_StopProcessInfos(self);
};
