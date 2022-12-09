

instance DIA_Addon_BL_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_BL_BDT_13_EXIT_Condition;
	information = DIA_Addon_BL_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_EXIT_Info()
{
	BDT_13_Nerves = 0 ;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BL_BDT_13_Chef(C_Info)
{
	nr = 2;
	condition = DIA_Addon_BL_BDT_13_Chef_Condition;
	information = DIA_Addon_BL_BDT_13_Chef_Info;
	permanent = TRUE;
	description = " Who's in charge here? " ;
};

func int DIA_Addon_BL_BDT_13_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Chef_Info()
{
	AI_Output(other,self, " DIA_Addon_BL_BDT_13_Chef_15_00 " );	// Who's in charge here?
	if(RavenAway == TRUE)
	{
		if (Npc_IsDead(Thorus))
		{
			AI_Output(self,other, " DIA_Addon_BL_BDT_13_Chef_13_01 " );	// Our glorious commander Thorus. He will make us all rich!
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_BL_BDT_13_Chef_13_02 " );	// Our glorious leader... uh... I don't even know...
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_BL_BDT_13_Chef_13_03 " );	// Our glorious Commander Raven. He will make us all rich!
	};
};


instance DIA_Addon_BL_BDT_13_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_13_Lager_Condition;
	information = DIA_Addon_BL_BDT_13_Lager_Info;
	permanent = TRUE;
	description = " What do you know about the camp? " ;
};


func int DIA_Addon_BL_BDT_13_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Lager_Info()
{
	AI_Output(other,self, " DIA_Addon_BL_BDT_13_Lager_15_00 " );	// What do you know about the camp?
	AI_Output(self,other, " DIA_Addon_BL_BDT_13_Lager_13_01 " );	// Talk to Snaf if you need information. That fat bastard knows a lot.
	AI_Output(self,other, " DIA_Addon_BL_BDT_13_Lager_13_02 " );	// If you need to buy something, talk to Fisk. He has all sorts of things...
};


instance DIA_Addon_BL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_BL_BDT_13_News_Condition;
	information = DIA_Addon_BL_BDT_13_News_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_Addon_BL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_News_Info()
{
	AI_Output(other,self, " DIA_Addon_BL_BDT_13_News_15_00 " );	// What's the news?
	if(RavenAway == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_BL_BDT_13_News_13_01 " );	// They say that Raven up and disappeared! Now we will NEVER get off this island.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_BL_BDT_13_News_13_02 " );	// The pirates set sail and sailed away.
		AI_Output(self,other, " DIA_Addon_BL_BDT_13_News_13_03 " );	// Now only a couple of idiots are sitting on the shore, without so much as a flimsy raft.
		AI_Output(self,other, " DIA_Addon_BL_BDT_13_News_13_04 " );	// Beliar himself doesn't know how we'll get out of here.
	};
};


instance DIA_Addon_BL_BDT_13_Gold(C_Info)
{
	nr = 5;
	condition = DIA_Addon_BL_BDT_13_Gold_Condition;
	information = DIA_Addon_BL_BDT_13_Gold_Info;
	permanent = TRUE;
	description = " How can I get a lot of gold and quickly? " ;
};


func int DIA_Addon_BL_BDT_13_Gold_Condition()
{
	if((MIS_Send_Buddler != LOG_Running) || (MIS_Send_Buddler != LOG_SUCCESS))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_BL_BDT_13_Gold_Info()
{
	BDT_13_Nerves = BDT_13_Nerves +  1 ;
	AI_Output(other,self, " DIA_Addon_BL_BDT_13_Gold_15_00 " );	// How can I get a lot of gold quickly?
	if(BDT_13_Nerver <= 2)
	{
		AI_Output(self,other, " DIA_Addon_BL_BDT_13_Gold_13_01 " );	// Good question. Isn't that what we're all here for?
		AI_Output(self,other, " DIA_Addon_BL_BDT_13_Gold_13_02 " );	// You need to take a red stone from Torus, then you can enter the mine.
	}
	else if(BDT_13_Kill == FALSE)
	{
		BDT_13_Nerves = 0 ;
		BDT_13_Kill = TRUE;
		AI_Output(self,other, " DIA_Addon_BL_BDT_13_Gold_13_03 " );	// Hey, why are you hanging around me? Go away!
		AI_StopProcessInfos(self);
	}
	else
	{
		BDT_13_Nerves = 0 ;
		AI_Output(self,other, " DIA_Addon_BL_BDT_13_Gold_13_04 " );	// No more games!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_13(var C_Npc slf)
{
	DIA_Addon_BL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Gold.npc = Hlp_GetInstanceID(slf);
};
