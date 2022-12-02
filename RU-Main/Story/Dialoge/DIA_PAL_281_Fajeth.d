

func int C_SnapperDeath()
{
	if (Npc_IsDead(NewMine_Snapper1) && Npc_IsDead(NewMine_Snapper2) && Npc_IsDead(NewMine_Snapper3) && Npc_IsDead(NewMine_Snapper4) && Npc_IsDead(NewMine_Snapper5) && Npc_IsDead(NewMine_Snapper6) && Npc_IsDead(NewMine_Snapper7) && Npc_IsDead(NewMine_Snapper8)
	{
		return TRUE;
	};
	return  FALSE ;
};


instance DIA_Fajeth_EXIT(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 999;
	condition = DIA_Fajeth_EXIT_Condition;
	information = DIA_Fajeth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_First(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_First_Condition;
	information = DIA_Fajeth_First_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fajeth_First_Condition()
{
	if (Garond.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Fajeth_First_Info()
{
	AI_Output(self,other, " DIA_Fajeth_First_12_00 " );	// Who are you and what are you doing here?
	AI_Output(other,self, " DIA_Fajeth_First_15_01 " );	// I have come by order of Lord Hagen.
	AI_Output(self,other, " DIA_Fajeth_First_12_02 " );	// Then you should try to get to the castle. Commander Garond is there. He is the commander-in-chief of this expedition.
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_Hallo(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_Hallo_Condition;
	information = DIA_Fajeth_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fajeth_Hallo_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Hallo_Info()
{
	AI_Output(self,other, " DIA_Fajeth_Hallo_12_00 " );	// Where did you come from?
	AI_Output(other,self, " DIA_Fajeth_Hallo_15_01 " );	// I came by order of Garond.
	AI_Output(self,other, " DIA_Fajeth_Hallo_12_02 " );	// Very good. I really need new people.
	AI_Output(other, self, " DIA_Fajeth_Hallo_15_03 " );	// I'm not here to help you.
	AI_Output(self,other, " DIA_Fajeth_Hallo_12_04 " );	// No? Then why did you come?
	AI_Output(other,self, " DIA_Fajeth_Hallo_15_05 " );	// It's my job to find out how much ore has been mined so far.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_06 " );	// Oh, venerable mage. Your presence gives me and my people confidence.
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_07 " );	// We would be very grateful if you could use the power Innos gave you to help us.
		Info_AddChoice(DIA_Fajeth_Hallo, " What can I do for you? " ,DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo, " My task is more important. " ,DIA_Fajeth_Hallo_KDFNein);
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_08 " );	// And it is my mandate to do everything to facilitate the transportation and protection of the ore.
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_09 " );	// This includes protecting people. You are in the service of Innos, so you will follow my orders.
		Info_AddChoice(DIA_Fajeth_Hallo, " What can I do for you? " ,DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo, " I already have an order from Garond. " ,DIA_Fajeth_Hallo_MILNein);
	}
	else if(other.guild == GIL_SLD)
	{
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_10 " );	// Look - I don't know why Garond sent me a mercenary - but he must have had his reasons.
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_11 " );	// But before I send you back, you must complete one task for me.
		Info_AddChoice(DIA_Fajeth_Hallo, " Everything has a price. " ,DIA_Fajeth_Hallo_SLDJa);
		Info_AddChoice(DIA_Fajeth_Hallo, " No, I don't have time... " ,DIA_Fajeth_Hallo_SLDNein);
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_12 " );	// Look - I don't know why Garond sends me a Watermage instead of a band of paladins - but he probably knows what he's doing.
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_13 " );	// However, before I send you back, you'll do one thing for me.
		Info_AddChoice(DIA_Fajeth_Hallo, " What can I do for you?. " ,DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo, " No, I don't have time... " ,dia_fajeth_hallo_kdwnein);
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_14 " );	// Look - I don't know why Garond sends me a NECROMANCE instead of a band of paladins - but he probably knows what he's doing.
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_15 " );	// However, before I send you back, you'll do one thing for me.
		Info_AddChoice(DIA_Fajeth_Hallo, " What can I do for you?. " ,DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo, " No, I don't have time... " ,dia_fajeth_hallo_kdmnein);
	}
	else
	{
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_16 " );	// Look - I don't know why Garond sends you alone to me instead of a band of paladins - but he probably knows what he's doing.
		AI_Output(self,other, " DIA_Fajeth_Hallo_12_17 " );	// However, before I send you back, you'll do one thing for me.
		Info_AddChoice(DIA_Fajeth_Hallo, " What can I do for you?. " ,DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo, " No, I don't have time... " ,dia_fajeth_hallo_seknein);
	};
};

func void DIA_Fajeth_Hallo_Tun()
{
	AI_Output(other,self, " DIA_Fajeth_Hallo_Tun_15_00 " );	// What can I do for you?
	AI_Output(self,other, " DIA_Fajeth_Hallo_Tun_12_01 " );	// For several days now, a horde of Snappers has been wandering around our camp. They seem to be just waiting for the right opportunity to attack.
	AI_Output(self,other, " DIA_Fajeth_Hallo_Tun_12_02 " );	// I don't know what they're waiting for - but as long as they're here, there won't be peace in the camp.
	if (Npc_IsDead(Fed) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Fajeth_Hallo_Tun_12_03 " );	// Fed is, among other things, scared to death of them - and drives the rest of the convicts crazy.
	};
	if (Npc_IsDead(Bilgot) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Fajeth_Hallo_Tun_12_04 " );	// And who should I send? Bilgoth? Ha - he's weak too.
	};
	if (Npc_IsDead(Tengron) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Fajeth_Hallo_Tun_12_05 " );	// Tengron? Of course, he knows how to fight, but he does not have the cunning of a hunter.
	};
	AI_Output(self,other, " DIA_Fajeth_Hallo_Tun_12_06 " );	// You are the only one who can do this. I want you to hunt down those damn creatures and kill them.
	MIS_Fajeth_Kill_Snapper = LOG_Running;
	Log_CreateTopic(TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FajethKillSnapper,LOG_Running);
	B_LogEntry(TOPIC_FajethKillSnapper, " Fajeth has assigned me to hunt the Snappers that have been roaming around the camp for several days. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(NewMine_Snapper7,"OW_PATH_333");
	Wld_InsertNpc(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
};

func void DIA_Fajeth_Hallo_KDFNo()
{
	AI_Output(other,self, " DIA_Fajeth_Hallo_KDFNein_15_00 " );	// My task is more important. I can not help you.
	AI_Output(self,other, " DIA_Fajeth_Hallo_KDFNein_12_01 " );	// Of course, oh venerable one. I will tell you everything you want to know.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void DIA_Fajeth_Hello_MILNo()
{
	AI_Output(other,self, " DIA_Fajeth_Hallo_MILNein_15_00 " );	// I already have an order. From Garon.
	AI_Output(self,other, " DIA_Fajeth_Hallo_MILNein_12_01 " );	// And you will complete it. But only after I let you go.
	AI_Output(self,other, " DIA_Fajeth_Hallo_MILNein_12_02 " );	// The only thing I want to hear from you is 'What can I do?' Clear?
};

func void DIA_Fajeth_Hallo_SLDJa()
{
	AI_Output(other,self, " DIA_Fajeth_Hallo_SLDJa_15_00 " );	// Everything has a price. If you pay me, maybe I'll take it.
	AI_Output(self,other, " DIA_Fajeth_Hallo_SLDJa_12_01 " );	// I'm not used to doing business with mercenaries. I hate haggling to get the price down.
	AI_Output(self,other, " DIA_Fajeth_Hallo_SLDJa_12_02 " );	// But as a token of my goodwill, I will pay you a hundred gold if you do this job for me.
	AI_Output(self,other, " DIA_Fajeth_Hallo_SLDJa_12_03 " );	// Well, how's the deal?
	Fajeth_Pay = TRUE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
	Info_AddChoice(DIA_Fajeth_Hallo, " What can I do for you? " ,DIA_Fajeth_Hallo_Tun);
	Info_AddChoice(DIA_Fajeth_Hallo, " No, I don't have time. " ,DIA_Fajeth_Hallo_SLDNein);
};

func void DIA_Fajeth_Hallo_SLDNein()
{
	AI_Output(other,self, " DIA_Fajeth_Hallo_SLDNein_15_00 " );	// No, I don't have time to take care of your problem.
	AI_Output(self,other, " DIA_Fajeth_Hallo_SLDNein_12_01 " );	// Are you making easy money? I did not expect this from a mercenary.
	AI_Output(self,other, " DIA_Fajeth_Hallo_SLDNein_12_02 " );	// Since you don't want to help us, ask questions and disappear.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void dia_fajeth_hello_kdwnein()
{
	AI_Output(other,self, " DIA_Fajeth_Hallo_KDWNein_15_00 " );	// No, I don't have time to take care of your problem.
	AI_Output(self,other, " DIA_Fajeth_Hallo_KDWNein_12_01 " );	// Well! Then you have to solve the problem yourself. Thank you at least for listening to me.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void dia_fajeth_hello_kdmnein()
{
	AI_Output(other,self, " DIA_Fajeth_Hallo_KDMNein_15_00 " );	// No, I don't have time to take care of your problem.
	AI_Output(self,other, " DIA_Fajeth_Hallo_KDMNein_12_01 " );	// Well! Then you have to solve the problem yourself. Thank you at least for listening to me.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void dia_fajeth_hello_seknein()
{
	AI_Output(other,self, " DIA_Fajeth_Hallo_SEKNein_15_00 " );	// No, I don't have time to take care of your problem.
	AI_Output(self,other, " DIA_Fajeth_Hallo_SEKNein_12_01 " );	// Well! Then you have to solve the problem yourself. Thank you at least for listening to me.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};


instance DIA_Fajeth_Leader(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_Leader_Condition;
	information = DIA_Fajeth_Leader_Info;
	permanent = FALSE;
	description = " I killed the leader of the pack. " ;
};


func int DIA_Fajeth_Leader_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) && Npc_IsDead(NewMine_LeadSnapper))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Leader_Info()
{
	AI_Output(other,self, " DIA_Fajeth_Leader_15_00 " );	// I killed the snapper leader.
	AI_Output(self,other, " DIA_Fajeth_Leader_12_01 " );	// Good. Without a leader, they are not so dangerous. I think now maybe they won't attack us anymore.
	B_GivePlayerXP(150);
};


instance DIA_Fajeth_SNAPPER_KILLED(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_SNAPPER_KILLED_Condition;
	information = DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent = TRUE;
	description = " Snappers are over. " ;
};


func int DIA_Fajeth_SNAPPER_KILLED_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_Running) && (C_SnapperDeath() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_SNAPPER_KILLED_Info()
{
	AI_Output(hero,self, " DIA_Fajeth_SNAPPER_KILLED_15_00 " );	// Snappers are done.
	AI_Output(self,hero, " DIA_Fajeth_SNAPPER_KILLED_12_01 " );	// Great job. And we will deal with the rest of the animals ourselves.
	if(Fajeth_Pay == TRUE)
	{
		AI_Output(self,hero, " DIA_Fajeth_SNAPPER_KILLED_12_02 " );	// You've earned your gold - here's 100 coins, as agreed.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP(XP_FajethKillSnapper);
};


instance DIA_Fajeth_Running(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_Running_Condition;
	information = DIA_Fajeth_Running_Info;
	permanent = TRUE;
	description = " How are your people feeling? " ;
};


func int DIA_Fajeth_Running_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Running_Info()
{
	AI_Output(other,self, " DIA_Fajeth_Running_15_00 " );	// How are your people feeling?
	AI_Output(self,other, " DIA_Fajeth_Running_12_01 " );	// Do you want to know what the mood of my people is? Yes, they can barely work from fear!
	AI_Output(self,other, " DIA_Fajeth_Running_12_02 " );	// Deal with these snappers or someone's going to snap!
};


instance DIA_Fajeth_REWARD (C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 3;
	condition = DIA_Fajeth_REWARD_Condition;
	information = DIA_Fajeth_REWARD_Info;
	permanent = FALSE;
	description = " Tell me how much ore you have mined. " ;
};


func int DIA_Fajeth_REWARD_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) || (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_REWARD_Info()
{
	AI_Output(other,self, " DIA_Fajeth_BELOHNUNG_15_00 " );	// Tell me how much ore you have mined.
	AI_Output(self,other, " DIA_Fajeth_BELOHNUNG_12_01 " );	// Report to Garond that we've only been able to mine TWO crates of ore.
	AI_Output(self,other, " DIA_Fajeth_BELOHNUNG_12_02 " );	// Because of the constant attacks on us, we lost a lot of people.
	AI_Output(self,other, " DIA_Fajeth_BELOHNUNG_12_03 " );	// If Garond can send reinforcements, we can mine more ore.
	AI_Output(other,self, " DIA_Fajeth_BELOHNUNG_15_04 " );	// Got it. I will pass it on to him.
	AI_Output(self,other, " DIA_Fajeth_BELOHNUNG_12_05 " );	// Good. We rely on you. And we will hold our positions to the last.
	Fajeth_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine, " Fudget's miners were able to mine TWO crates of ore. " );
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_Perm2(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_Perm2_Condition;
	information = DIA_Fajeth_Perm2_Info;
	permanent = TRUE;
	description = " How is the ore mining going? " ;
};


func int DIA_Fajeth_Perm2_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Fajeth_BELOW ) && ( Capital ==  2 )) ;
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Perm2_Info()
{
	AI_Output(other,self, " DIA_Fajeth_Perm2_15_00 " );	// How is ore mining going?
	AI_Output(self,other, " DIA_Fajeth_Perm2_12_01 " );	// Bad. Almost no progress.
	AI_Output(self,other, " DIA_Fajeth_Perm2_12_02 " );	// When we got here, everything went well at first - but now my guys mine almost nothing but debris. Nothing worthwhile.
	AI_Output(self,other, " DIA_Fajeth_Perm2_12_03 " );	// But we won't back down - at least not as long as I'm in command here.
};


instance DIA_Fajeth_ERZABBAU(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 11;
	condition = DIA_Fajeth_ERZABBAU_Condition;
	information = DIA_Fajeth_ERZABBAU_Info;
	permanent = TRUE;
	description = " How is the ore mining going? " ;
};


func int DIA_Fajeth_ERZABBAU_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Fajeth_BELOW ) && ( Capital >=  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info()
{
	AI_Output(other,self, " DIA_Fajeth_ERZABBAU_15_00 " );	// How is ore mining going?
	if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other, " DIA_Fajeth_ERZABBAU_12_01 " );	// It's calmer here. Why did it happen?
		AI_Output(other,self, " DIA_Fajeth_ERZABBAU_15_02 " );	// The dragons are dead.
		AI_Output(self,other, " DIA_Fajeth_ERZABBAU_12_03 " );	// Oh, then I hope reinforcements don't take long. I lose my people all the time.
	}
	else
	{
		AI_Output(self,other, " DIA_Fajeth_ERZABBAU_12_04 " );	// Yes, you can see it yourself...
	};
};


instance DIA_Fajeth_PICKPOCKET(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 900;
	condition = DIA_Fajeth_PICKPOCKET_Condition;
	information = DIA_Fajeth_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fajeth_PICKPOCKET_Condition()
{
	return  C_Robbery ( 56 , 95 );
};

func void DIA_Fajeth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
	Info_AddChoice(DIA_Fajeth_PICKPOCKET,Dialog_Back,DIA_Fajeth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fajeth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fajeth_PICKPOCKET_DoIt);
};

func void DIA_Fajeth_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
};

func void DIA_Fajeth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
};

