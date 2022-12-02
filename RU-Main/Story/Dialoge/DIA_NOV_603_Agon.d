

instance DIA_Agon_EXIT(C_Info)
{
	npc = NOV_603_Agon;
	nr = 999;
	condition = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Agon_Hello(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_Hello_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( MIS_SCHNITZELJAGD  ==  FALSE ) && ( other . guild ==  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DIA_Agon_Hello_Info()
{
	AI_Output(self,other, " DIA_Agon_Hello_07_00 " );	// What do you need?
};


instance DIA_Agon_Wurst (C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Wurst_Condition;
	information = DIA_Agon_Sausage_Info;
	permanent = FALSE;
	description = " Here, I have lamb sausage for you. " ;
};

func int DIA_Agon_Wurst_Condition();
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Agon_Sausage_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_Agon_Wurst_15_00 " );	// Here, I have lamb sausage for you.
	AI_Output(self,other, " DIA_Agon_Wurst_07_01 " );	// Sheep sausage, sheep cheese... sheep milk... just looking at them makes me sick.
	AI_Output(other,self, " DIA_Agon_Wurst_15_02 " );	// So do you want sausage or not?
	AI_Output(self,other, " DIA_Agon_Wurst_07_03 " );	// Okay, give it here!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};

instance DIA_Agon_New(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent = FALSE;
	description = " I'm new here. " ;
};

func int DIA_Agon_New_Condition()
{
	if (( MIS_SCHNITZELJAGD  ==  FALSE ) && (other.guild ==  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DIA_Agon_New_Info()
{
	AI_Output(other,self, " DIA_Agon_New_15_00 " );	// I'm new here.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//Я вижу.
	AI_Output(self,other, " DIA_Agon_New_07_02 " );	// If you don't have a job yet, talk to Parlan. He will give you something.
};


instance DIA_Agon_YouAndBabo(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent = FALSE;
	description = " What happened between you and Babo? " ;
};


func int DIA_Agon_YouAndBabo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Opolos_Monastery ) && ( MIS_SCHNITZELJAGD  ==  FALSE ) && ( other . guild ==  GIL_NOV )) ;
	{
		return TRUE;
	};
};

func void DIA_Agon_YouAndBabo_Info()
{
	AI_Output(other,self, " DIA_Agon_YouAndBabo_15_00 " );	// What happened between you and Babo?
	AI_Output(self,other, " DIA_Agon_YouAndBabo_07_01 " );	// You shouldn't believe everything you hear.
	AI_Output(self,other, " DIA_Agon_YouAndBabo_07_02 " );	// Let's get one thing straight: I'll do as I see fit. Just as Innos ordained for me.
	AI_Output(self,other, " DIA_Agon_YouAndBabo_07_03 " );	// I'm not going to let anyone get in my way, and certainly not that simpleton Babo.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
	Info_AddChoice(DIA_Agon_YouAndBabo, " Shouldn't we acolytes support each other? " ,DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice(DIA_Agon_YouAndBabo, " Innos alone knows which way we should go. " ,DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice(DIA_Agon_YouAndBabo, " I think we can get along. " ,DIA_Agon_YouAndBabo_Understand);
};

func void DIA_Agon_YouAndBabo_AllTogether()
{
	AI_Output(other,self, " DIA_Agon_YouAndBabo_AllTogether_15_00 " );	// Shouldn't we acolytes support each other?
	AI_Output(self,other, " DIA_Agon_YouAndBabo_AllTogether_07_01 " );	// You others can support each other as much as you want.
	AI_Output(self,other, " DIA_Agon_YouAndBabo_AllTogether_07_02 " );	// But please don't waste my time. (coldly) No one dares to stand in my way.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_InnosWay()
{
	AI_Output(other,self, " DIA_Agon_YouAndBabo_InnosWay_15_00 " );	// Only Innos knows which way we should go.
	AI_Output(self,other, " DIA_Agon_YouAndBabo_InnosWay_07_01 " );	// My family has always been favored by Innos, and nothing will change that.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_Understand()
{
	AI_Output(other,self, " DIA_Agon_YouAndBabo_Understand_15_00 " );	// I think we'll get along.
	AI_Output(self,other, " DIA_Agon_YouAndBabo_Understand_07_01 " );	// I hope. When I become a magician, I will put in a good word for you.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};


instance DIA_Agon_GetHerb(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent = TRUE;
	description = " What are you growing here? " ;
};


func int DIA_Agon_GetHerb_Condition()
{
	if ( MIS_SCHNITZELJAGD  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Agon_GetHerb_Info()
{
	AI_Output(other,self, " DIA_Agon_GetHerb_15_00 " );	// What are you growing here?
	AI_Output(self,other, " DIA_Agon_GetHerb_07_01 " );	// We're trying to grow medicinal herbs that Master Neoras uses to make potions.
};

instance DIA_Agon_GolemDead(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Agon_GolemDead_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (Npc_IsDead(Magic_Golem) == TRUE) && (Npc_GetDistToWP(self,"NW_MAGECAVE_RUNE") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemDead_Info()
{
	AI_Output(self,other, " DIA_Agon_GolemDead_07_00 " );	// You're late!
	AI_Output(self,other, " DIA_Agon_GolemDead_07_01 " );	// I was here first! I won!
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead, " Only if you make it out of here alive. " ,DIA_Agon_GolemDead_NoWay);
	Info_AddChoice(DIA_Agon_GolemDead, " Shut up! " ,DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice(DIA_Agon_GolemDead, " Congratulations, you really deserve it! " ,DIA_Agon_GolemDead_Congrat);
};

func void DIA_Agon_GolemDead_NoWay()
{
	AI_Output(other,self, " DIA_Agon_GolemDead_NoWay_15_00 " );	// Only if you make it out of here alive.
	AI_Output(self,other, " DIA_Agon_GolemDead_NoWay_07_01 " );	// Do you want to kill me? You won't succeed.
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_ShutUp()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//Заткнись!
	AI_Output(self,other, " DIA_Agon_GolemDead_ShutUp_07_01 " );	// It's useless, you lost! Deal with it.
	AI_Output(self,other, " DIA_Agon_GolemDead_ShutUp_07_02 " );	// Only I am destined to become a magician.
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead, " Damn it ! This chest is mine. " ,DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice(DIA_Agon_GolemDead,"Ты победил.",DIA_Agon_GolemDead_ShutUp_YouWin);
};

func void DIA_Agon_GolemDead_ShutUp_MyChest()
{
	AI_Output(other,self, " DIA_Agon_GolemDead_ShutUp_MyChest_15_00 " );	// The hell with it. This chest is mine.
	AI_Output(self,other, " DIA_Agon_GolemDead_ShutUp_MyChest_07_01 " );	// No, you won't. I'll kill you!
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_ShutUp_YouWin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//Ты победил.
	AI_Output(self,other, " DIA_Agon_GolemDead_ShutUp_YouWin_07_01 " );	// No, you can't fool me. You are trying to get rid of me.
	AI_Output(self,other, " DIA_Agon_GolemDead_ShutUp_YouWin_07_02 " );	// I won't let this happen!
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_Congrat()
{
	AI_Output(other,self, " DIA_Agon_GolemDead_Congrat_15_00 " );	// Congratulations, you really deserve it.
	AI_Output(self,other, " DIA_Agon_GolemDead_Congrat_07_01 " );	// What does this mean? What did you think?
	AI_Output(other,self, " DIA_Agon_GolemDead_Congrat_15_02 " );	// What are you talking about?
	AI_Output(self,other, " DIA_Agon_GolemDead_Congrat_07_03 " );	// You want to challenge my victory. You want to kill me and take all the glory for yourself!
	AI_Output(self,other, " DIA_Agon_GolemDead_Congrat_07_04 " );	// You won't succeed!
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Agon_GolemLives(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Agon_GolemLives_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_02") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemLives_Info()
{
	AI_Output(self,other, " DIA_Agon_GolemLives_07_00 " );	// You found this place before me. This can't be...
	AI_Output(self,other, " DIA_Agon_GolemLives_07_01 " );	// This can't be! I won't allow it.
	AI_Output(self,other, " DIA_Agon_GolemLives_07_02 " );	// Your corpse will never be found.
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,0);
};

instance DIA_Agon_Perm(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int DIA_Agon_Perm_Condition()
{
	if ((Capital >=  3 ) && (other.guild !=  GIL_KDF ))
	{
		return TRUE;
	};
};

func void DIA_Agon_Perm_Info()
{
	AI_Output(other,self, " DIA_Agon_Perm_15_00 " );	// How are you?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Agon_Perm_07_01 " );	// Oh, thanks for your concern, oh paladin. I enjoy my work and I am sure that soon I will be chosen as a magician.
	}
	else
	{
		AI_Output(self,other, " DIA_Agon_Perm_07_02 " );	// You're just a guest here at the monastery of Innos. Therefore, you must behave accordingly and not interrupt me from work. Goodbye.
	};
};


instance DIA_Agon_PICKPOCKET(C_Info)
{
	npc = NOV_603_Agon;
	nr = 900;
	condition = DIA_Agon_PICKPOCKET_Condition;
	information = DIA_Agon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Agon_PICKPOCKET_Condition()
{
	return  C_Robbery ( 23 , 12 );
};

func void DIA_Agon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
	Info_AddChoice(DIA_Agon_PICKPOCKET,Dialog_Back,DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Agon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

