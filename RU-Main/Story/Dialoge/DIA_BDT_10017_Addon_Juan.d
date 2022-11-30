
instance DIA_Addon_Juan_EXIT(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 999;
	condition = DIA_Addon_Juan_EXIT_Condition;
	information = DIA_Addon_Juan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Juan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Juan_PICKPOCKET(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 900;
	condition = DIA_Addon_Juan_PICKPOCKET_Condition;
	information = DIA_Addon_Juan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Juan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 65 , 73 );
};

func void DIA_Addon_Juan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,Dialog_Back,DIA_Addon_Juan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Juan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Juan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};

func void DIA_Addon_Juan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};


instances DIA_Addon_Juan_HI (C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_HI_Condition;
	information = DIA_Addon_Juan_HI_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Addon_Juan_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//Как дела?
	AI_Output(self,other, " DIA_Addon_Juan_HI_13_01 " );	// What do you need? If you have nothing to say to me, move on.
	if ( ! Npc_IsDead(friend))
	{
		AI_Output(self,other, " DIA_Addon_Juan_HI_13_02 " );	// Otherwise my buddy will make mincemeat out of you. So what do you need?
		B_StartOtherRoutine(Freund,"STAND");
	};
};


instance DIA_Addon_Juan_Solution (C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_Losung_Condition;
	information = DIA_Addon_Juan_Solution_Info;
	permanent = FALSE;
	description = " They say you have interesting things... " ;
};


func int DIA_Addon_Juan_Losung_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Juan_HI ) && ( ( Tom_Tells ==  TRUE ) || ( MIS_Huno_Stahl == LOG_Running )))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Juan_Solution_Info()
{
	AI_Output(other,self, " DIA_Addon_Juan_Losung_15_00 " );	// They say you have interesting things...
	AI_Output(self,other, " DIA_Addon_Juan_Losung_13_01 " );	// So what? Esteban wants to put on my shoes? I work all the time, I don't leave this miserable hole all day long...
	AI_Output(self,other, " DIA_Addon_Juan_Losung_13_02 " );	// ...and he just sends someone to pick up my stuff? I'm not a warehouse!
	AI_Output(other,self, " DIA_Addon_Juan_Losung_15_03 " );	// So what? These are not my problems.
	AI_Output(self,other, " DIA_Addon_Juan_Losung_13_04 " );	// It's me who's causing you trouble. You want to deliver goods - great, pay for them!
	AI_Output(self,other, " DIA_Addon_Juan_Losung_13_05 " );	// Take the gold from Esteban or Raven, or I don't know where else. I do not care. If someone needs these goods, they will have to pay for them!
};


instance DIA_Addon_Juan_AufsMaul (C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_AufsMaul_Condition;
	information = DIA_Addon_John_AufsMaul_Info;
	permanent = FALSE;
	description = " I didn't come from Esteban! " ;
};

func int DIA_Addon_Juan_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Juan_AufsMaul_Info()
{
	AI_Output(other,self, " DIA_Addon_Juan_AufsMaul_15_00 " );	// I didn't come from Esteban!
	AI_Output(self,other, " DIA_Addon_Juan_AufsMaul_13_01 " );	// Yes? Well then... uh... Wait a second! Freeze! You have a midge on your shoulder.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Juan_Trade(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 99;
	condition = DIA_Addon_Juan_Trade_Condition;
	information = DIA_Addon_Juan_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};

func int DIA_Addon_Juan_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Juan_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_3");
};
