

instance DIA_Bilgot_EXIT(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 999;
	condition = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Bilgot_HALLO (C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_HALLO_Condition;
	information = DIA_Bilgot_HALLO_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Bilgot_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_HALLO_Info()
{
	AI_Output(self,other, " DIA_Bilgot_HALLO_05_00 " );	// Hey, where did you come from? Have you come from the castle?
	Info_AddChoice(DIA_Bilgot_HALLO, " Yes, I came from the castle - so what? " ,DIA_Bilgot_HALLO_Burg);
	Info_AddChoice(DIA_Bilgot_HALLO, " I just wandered in here by accident... " ,DIA_Bilgot_HALLO_Zufall);
};

func void DIA_Bilgot_HELLO_Random()
{
	AI_Output(other,self, " DIA_Bilgot_HALLO_Zufall_15_00 " );	// I just wandered in here by accident...
	AI_Output(self,other, " DIA_Bilgot_HALLO_Zufall_05_01 " );	// Man, no one walks in here RANDOMLY. We're locked in here - surrounded by snappers!
	AI_Output(self,other, " DIA_Bilgot_HALLO_Zufall_05_02 " );	// Not a day goes by that they don't kill one of ours.
	AI_Output(self,other, " DIA_Bilgot_HALLO_Zufall_05_03 " );	// So won't you tell me where you came from? Good - let the snappers eat you then!
	AI_StopProcessInfos(self);
};

func void DIA_Bilgot_HALLO_Burg()
{
	AI_Output(other,self, " DIA_Bilgot_HALLO_Burg_15_00 " );	// Yes, I came from the castle - so what?
	AI_Output(self,other, " DIA_Bilgot_HALLO_Burg_05_01 " );	// How are things?
	AI_Output(other,self, " DIA_Bilgot_HALLO_Burg_15_02 " );	// No better than here. The orcs are still there, if that's what you mean.
	AI_Output(self,other, " DIA_Bilgot_HALLO_Burg_05_03 " );	// Damn. Nowhere can you feel safe.
	AI_Output(self,other, " DIA_Bilgot_HALLO_Burg_05_04 " );	// I'll tell you something. If I hadn't been scared to death, I would have fled from here.
	Info_ClearChoices(DIA_Bilgot_HALLO);
};


instance DIA_Bilgot_Job(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Job_Condition;
	information = DIA_Bilgot_Job_Info;
	permanent = FALSE;
	description = " What are you even doing here, by the way? " ;
};


func int DIA_Bilgot_Job_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_Job_Info()
{
	AI_Output(other,self, " DIA_Bilgot_Job_15_00 " );	// What are you even doing here, by the way?
	AI_Output(self,other, " DIA_Bilgot_Job_05_01 " );	// I'm here as an errand boy. Bring it, give it, see where the snappers are, Bilgot there, Bilgot here.
	AI_Output(self,other, " DIA_Bilgot_Job_05_02 " );	// I should have stayed at home with my old woman. It wasn't any better, but at least it had decent food.
	AI_Output(self,other, " DIA_Bilgot_Job_05_03 " );	// And now I'm all that's left of the squad led by Fudget.
	AI_Output(self,other, " DIA_Bilgot_Job_05_04 " );	// How was I to know that this expedition was not destined to return?
	AI_Output(self,other, " DIA_Bilgot_Job_05_05 " );	// My friend Olav slipped away. Maybe at least he managed to escape...
};


instance DIA_Bilgot_Help (C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Help_Condition;
	information = DIA_Bilgot_Help_Info;
	permanent = FALSE;
	description = " What do you know about snappers? " ;
};


func int DIA_Bilgot_Help_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Help_Info()
{
	AI_Output(other, self, " DIA_Bilgot_Hilfe_15_00 " );	// What do you know about snappers?
	AI_Output(self,other, " DIA_Bilgot_Hilfe_05_01 " );	// Why do you need to know this? And don't tell me it's just out of curiosity!
	AI_Output(other,self, " DIA_Bilgot_Hilfe_15_02 " );	// I'm going to hunt these snappers,
	AI_Output(self,other, " DIA_Bilgot_Hilfe_05_03 " );	// This is crazy. I watched them - what bloodthirsty creatures!
	AI_Output(other,self, " DIA_Bilgot_Hilfe_15_04 " );	// Then tell me what you know about them.
	AI_Output(self,other, " DIA_Bilgot_Hilfe_05_05 " );	// Hmm... I could help you, but only on one condition!
	AI_Output(other,self, " DIA_Bilgot_Hilfe_15_06 " );	// What do you want?
	AI_Output(self,other, " DIA_Bilgot_Hilfe_05_07 " );	// If you manage to kill the snappers, you have to get me out of here!
	if (Npc_IsDead(Fed) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Bilgot_Hilfe_05_08 " );	// I can't last long here - have you talked to Fed? This guy is crazy and I don't want to end up like him!
	};
};


instance DIA_Bilgot_KNOWSLEADSNAPPER(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 4;
	condition = DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information = DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent = FALSE;
	description = " Tell me what you know. I'll get you out of here! " ;
};


func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_Hilfe) && (MIS_Fajeth_Kill_Snapper == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info()
{
	AI_Output(other,self, " DIA_Bilgot_KNOWSLEADSNAPPER_15_00 " );	// Tell me what you know. And I'll get you out of here!
	AI_Output(self,other, " DIA_Bilgot_KNOWSLEADSNAPPER_05_01 " );	// I knew I could count on you. So be careful. I've been watching Snappers for quite some time.
	AI_Output(self,other, " DIA_Bilgot_KNOWSLEADSNAPPER_05_02 " );	// They are very cunning and can, well, sort of... communicate. They never walk alone and only attack in packs. But there is more. There is one special among them!
	AI_Output(self,other, " DIA_Bilgot_KNOWSLEADSNAPPER_05_03 " );	// It rarely shows up, but I've seen it.
	AI_Output(self,other, " DIA_Bilgot_KNOWSLEADSNAPPER_05_04 " );	// Other snappers bow low when they pass him, but never go far.
	AI_Output(self,other, " DIA_Bilgot_KNOWSLEADSNAPPER_05_05 " );	// As long as this beast doesn't move, no snappers nearby will even move.
	AI_Output(other,self, " DIA_Bilgot_KNOWSLEADSNAPPER_15_06 " );	// Where can I find this bloodthirsty beast?
	AI_Output(self,other, " DIA_Bilgot_KNOWSLEADSNAPPER_05_07 " );	// I saw him on the steps of the old watchtower.
	AI_Output(other,self, " DIA_Bilgot_KNOWSLEADSNAPPER_15_08 " );	// Great. I think I understand. Thank you!
	AI_Output(self,other, " DIA_Bilgot_KNOWSLEADSNAPPER_05_09 " );	// Remember, you gave me your word!
	B_LogEntry(TOPIC_FajethKillSnapper, " Bilgoth told me about the leader of the Snapper pack. He should be on the steps of the old watchtower. " );
	Log_CreateTopic(TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BilgotEscort,LOG_Running);
	B_LogEntry_Quiet(TOPIC_BilgotEscort, " Bilgot wants me to lead him out of the valley. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01");
};


instance DIA_Bilgot_TAKEYOUWITHME(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_TAKEYOUWITHME_Condition;
	information = DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent = FALSE;
	description = " (Keep the promise) " ;
};


func int DIA_Bilgot_TAKEYOUWITHME_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_TAKEYOUWITHME_Info()
{
	AI_Output(other,self, " DIA_Bilgot_TAKEYOUWITHME_15_00 " );	// The time has come, Bilgot! Pack your things, we're on our way.
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//Я готов!
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
	Bilgot.flags = 0;
	MIS_RescueBilgot = LOG_Running;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_Bilgot_RUN FASTER (C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 5;
	condition = DIA_Bilgot_LAUFSCHNELLER_Condition;
	information = DIA_Bilgot_RUN FASTER_Info;
	permanent = FALSE;
	description = " Could you walk a little faster?! " ;
};


func int DIA_Bilgot_FAST_RUNNING_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bilgot_TAKEYOUWITHME ) && ( Npc_KnowsInfo ( other , DIA_Bilgot_CREATED_WITHME ) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_RUN FASTER_Info()
{
	AI_Output(other,self, " DIA_Bilgot_LAUFSCHNELLER_15_00 " );	// Could you walk a little faster?!
	AI_Output(self,other, " DIA_Bilgot_LAUFSCHNELLER_05_01 " );	// I'm walking as fast as I can.
};


instance DIA_Bilgot_BEIBRUECKEANGECOMMEN (C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information = DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition()
{
	if(Npc_GetDistToWP(self,"START") < 8000)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info()
{
	AI_Output(other,self, " DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00 " );	// Okay, here we go. Then go alone. But be careful!
	AI_Output(self,other, " DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01 " );	// Thank you!
	AI_Output(other,self, " DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02 " );	// Be careful not to get eaten. I will be very upset.
	AI_Output(self,other, " DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03 " );	// Goodbye!
	TschuessBilgot = TRUE;
	BilgotDayOut = Wld_GetDay();
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP(XP_BilgotEscort);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};

instance DIA_Bilgot_Olav(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Olav_Condition;
	information = DIA_Bilgot_Olav_Info;
	permanent = FALSE;
	description = " I found Olaf. " ;
};

func int DIA_Bilgot_Olav_Condition()
{
	if ((Npc_HasItems(Olav,It_Is_Olav) ==  0 ) && Npc_KnowsInfo(other,DIA_Bilgot_Job))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info()
{
	AI_Output(other,self, " DIA_Bilgot_Olav_15_00 " );	// I found Olaf.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//И как он?
	AI_Output(other,self, " DIA_Bilgot_Olav_15_02 " );	// He's dead! The wolves ate him.
	AI_Output(self,other, " DIA_Bilgot_Olav_05_03 " );	// Oh shit... (nervously) I hope I can at least get out of here.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bilgot_PICKPOCKET(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 900;
	condition = DIA_Bilgot_PICKPOCKET_Condition;
	information = DIA_Bilgot_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bilgot_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 30 );
};

func void DIA_Bilgot_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice(DIA_Bilgot_PICKPOCKET,Dialog_Back,DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bilgot_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
};

func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
};


// ---------------------new Billgot------------------------- ----------------------

instance DIA_Bilgot_NW_EXIT(C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 999;
	condition = DIA_Bilgot_NW_EXIT_Condition;
	information = DIA_Bilgot_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Bilgot_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Bilgot_NW_LastPause (C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 1;
	condition = DIA_Bilgot_NW_LastPause_Condition;
	information = DIA_Bilgot_NW_LastPause_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};

func int DIA_Bilgot_NW_LastPause_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_NW_LastPause_Info()
{
	AI_Output(other,self, " DIA_Biff_HALLO_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Bilgot_LetztePause_05_01 " );	// I just can't walk. I need to rest a little. I can handle. Do not worry!
	AI_Output(other,self, " DIA_Bilgot_LetztePause_15_02 " );	// As you say.
	AI_Output(self,other, " DIA_Bilgot_LetztePause_05_03 " );	// Just take a break.
};

instance DIA_Bilgot_NW_FREEDOM(C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 1;
	condition = DIA_Bilgot_NW_FREEDOM_condition;
	information = DIA_Bilgot_NW_FREEDOM_info;
	permanent = FALSE;
	description = " How long are you going to be here? " ;
};

func int DIA_Bilgot_NW_FREEDOM_condition()
{
	if ((Npc_KnowsInfo(other,DIA_Bilgot_NW_LatestPause) ==  TRUE ) && ( BILGOTRCRUITEDDT  ==  FALSE ) && ( HURRAYICANHIRE  ==  TRUE ) && Npc_IsInState(self,ZS_Talk));
	{
		return TRUE;
	};
};

func void DIA_Bilgot_NW_FREEDOM_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Bilgot_NW_FREEDOM_01_00 " );	// And how long will you stay here?
	AI_Output(self,other, " DIA_Bilgot_NW_FREEDOM_01_01 " );	// I don't know... I still have nowhere to go yet.
	AI_Output(other,self, " DIA_Bilgot_NW_FREEDOM_01_02 " );	// Then come to my camp! There you will find everything you need - shelter, food and you can get some rest.
	AI_Output(self,other, " DIA_Bilgot_NW_FREEDOM_01_03 " );	// And sitting here, you will only wait for some predatory creature to devour you.
	AI_Output(self,other, " DIA_Bilgot_NW_FREEDOM_01_04 " );	// And that's true... Okay, let's go.
	AI_Output(other,self, " DIA_Bilgot_NW_FREEDOM_01_05 " );	// Follow me.
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
};

instance DIA_Bilgot_NW_FINALLYINTOWER(C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 1;
	condition = DIA_Bilgot_NW_finallyintower_condition;
	information = DIA_Bilgot_NW_finallyintower_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bilgot_NW_finallyintower_condition()
{
	if((HURRAYICANHIRE == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_02") < 2000))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_NW_finallyintower_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Bilgot_NW_FinallyInTower_01_00 " );	// Here we are.
	AI_Output(self,other, " DIA_Bilgot_NW_FinallyInTower_01_01 " );	// Is this your camp?! Impressive...
	AI_Output(other,self, " DIA_Bilgot_NW_FinallyInTower_01_02 " );	// Here you can feel safe.
	AI_Output(other,self, " DIA_Bilgot_NW_FinallyInTower_01_03 " );	// In the meantime, go out and rest by the fire. And then you can barely stand on your feet!
	AI_Output(self,other, " DIA_Bilgot_NW_FinallyInTower_01_04 " );	// I'll do that. Thank you.
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Bilgot will now live and work at my camp. " );
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	BILGOTRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Bilgot_NW_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_41200_Bilgot;
	nr = 22;
	condition = DIA_Bilgot_NW_intower_orckap_condition;
	information = DIA_Bilgot_NW_intower_orckap_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};

func int DIA_Bilgot_NW_intower_orckap_condition()
{
	if(BILGOTRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_NW_intower_orckap_info()
{
	AI_Output(other,self, " DIA_Bilgot_NW_InTower_OrcKap_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Bilgot_NW_InTower_OrcKap_01_01 " );	// Better than you can imagine. Thank you for helping me get out of that damned valley.
};
