instance DIA_Ass_125_Tiamant_EXIT(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 999;
	condition = dia_Ass_125_Tiamant_exit_condition;
	information = dia_Ass_125_Tiamant_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Ass_125_Tiamant_exit_condition()
{
	return TRUE;
};

func void dia_Ass_125_Tiamant_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ass_125_Tiamant_PreHALLO(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_PreHALLO_condition;
	information = dia_Ass_125_Tiamant_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_PreHALLO_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((PW_RecoverDeadBodyDay <= (Daynow - 1)) && (MIS_Orc_Pw == LOG_SUCCESS) && (HasimAmuls == TRUE))
	{
		return FALSE;
	}
	else if((MIS_HasimKill == LOG_Running) && (HasimKilled == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return FALSE;
	}
	else if((MIS_OreBugs == LOG_Running) && (Npc_IsInState(self,ZS_Talk)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_02)) && (Npc_IsDead(OreBug_Tiamant_03)) && (Npc_IsDead(OreBug_Tiamant_04)) && (Npc_IsDead(OreBug_Tiamant_05)) && (Npc_IsDead(OreBug_Tiamant_06)))
	{
		return FALSE;
	}
	else if(Npc_IsInState(self,ZS_Talk) && (TiamantMurid == FALSE) && (TiamantMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_PreHALLO_01_00");	//(irritated) What do you want?
};

instance DIA_Ass_125_Tiamant_PreHALLO_Kill(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_PreHALLO_Kill_condition;
	information = dia_Ass_125_Tiamant_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TiamantMurid == FALSE) && (PlayerSendToTiamant == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Ass_125_Tiamant_HALLO(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_hallo_condition;
	information = dia_Ass_125_Tiamant_hallo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerSendToTiamant == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_hallo_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_00");	//So you are the acolyte who caught the attention of the Priors of Nrozas and Osair?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_01");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_02");	//(appraisingly) And you impressed them enough to become their "murid".
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_03");	//And I understand you managed to kill the black cave troll?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_04");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_05");	//It seems you're actually worth something. That's good enough for now.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_06");	//Now let's get down to business.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_07");	//If you have not yet understood who is in front of you, then ...
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_08");	//... my name is Tiamant the Bloody! And I am one of the four priori of our sacred Brotherhood.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_09");	//My main duty here is the combat training of our warriors.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_10");	//And it's not about teaching them how to hold a sword and shoot a bow.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_11");	//A Shadow of Masyaf must be skilled in everything that can help them fulfill their mission.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_12");	//Since even the thought of failure is an offence, and tantamount to death!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_13");	//But I tire of talking.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_14");	//As for you, now you have to impress me too.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_15");	//If, of course, you want to achieve something here,
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_16");	//So listen well, and take to heart what I am about to tell you.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_17");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_18");	//So. You have already dealt with the cave black troll.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_19");	//But now you need to track down and kill a much more cunning and dangerous creature - the Muritan.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_20");	//During the day, this beast is extremely difficult to track down, since it usually leaves its lair only at night.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_21");	//Then he hunts. And believe me: a meeting with him will be deadly for you.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_22");	//Only one of my warriors has ever been able to bring me the head of such a beast.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_23");	//The rest came home missing parts of themselves, or not at all.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_24");	//So as you can see, impressing me won't be easy.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_25");	//Although I'm sure you suspected that.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_26");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_27");	//Now go. Don't make me regret the trust I've put in you.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_28");	//Oh, one more thing...
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_29");	//If you're wondering who managed to kill the Muritan, his name is Hasim.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_30");	//He seems to have recently returned with a new batch of slaves for Osair and is now resting in the main hall.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_31");	//Speak to him. If anyone will have advice for you, he will.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_32");	//(nods)
	AI_PlayAni(other,"T_YES");
	TiamantMeet = TRUE;
	MIS_TiamantMuritan = LOG_Running;
	Log_CreateTopic(TOPIC_TiamantMuritan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TiamantMuritan,LOG_Running);
	B_LogEntry(TOPIC_TiamantMuritan,"Prior Tiamant instructed me to track down and kill a Muritan. This beast can only be found at night. And in all the time only one of his warriors, Hasim, managed to do this. Perhaps I should talk to him. " );
	AI_StopProcessInfos(self);

	if(HasimInserted == FALSE)
	{
		HasimInserted = TRUE;
		Wld_InsertNpc(Ass_170_Adept,"PW_TEMPLE_HASIM");
	};
};

instance DIA_Ass_125_Tiamant_TiamantMuritan(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_TiamantMuritan_condition;
	information = dia_Ass_125_Tiamant_TiamantMuritan_info;
	permanent = FALSE;
	description = "(give up poisonous fang)";
};

func int dia_Ass_125_Tiamant_TiamantMuritan_condition()
{
	if((MIS_TiamantMuritan == LOG_Running) && (Npc_HasItems(other,ItAt_PW_MuritanTooth) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_TiamantMuritan_info()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAt_PW_MuritanTooth,1);
	Npc_RemoveInvItems(self,ItAt_PW_MuritanTooth,1);

	if(Trophy_MuritanTooth  == TRUE)
	{
		if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
			Trophy_MuritanTooth  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_00");	//As far as I understand, you managed to track down this creature?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_TiamantMuritan_01_01");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_02");	//Well, that's worthy of respect, novice.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_03");	//Now I know for sure that there is a fairly skilled fighter in front of me.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_04");	//However, this does not mean that I am ready to immediately make you my murid.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_05");	//So you have to do a little more work for me. And then there is just one more assignment for you.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_06");	//Recently a small detachment of orcs has appeared in the valley.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_07");	//Apparently, they came down here from the mountains.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_08");	//We don't usually fight those green skinned bastards.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_09");	//However, we seem to have a problem here.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_10");	//I sent a messenger to them, but he still hasn't returned.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_11");	//So I want you to go to the orcs and find out their intentions.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_12");	//If they bare their teeth at you, show them what men are capable of.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_13");	//Be careful about it though. No one needs to know about this. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_14");	//Do you understand?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_TiamantMuritan_01_15");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_16");	//Good. Then I look forward to hearing from you. Go on.
	MIS_Orc_Pw = LOG_Running;
	MIS_TiamantMuritan = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TiamantMuritan,LOG_SUCCESS);
	Log_CreateTopic(TOPIC_Orc_Pw,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Orc_Pw,LOG_Running);
	B_LogEntry(TOPIC_TiamantMuritan,"I informed Tiamant that I was able to kill the Muritan, and by doing so it seems I was able to win his respect.");
	B_LogEntry_Quiet(TOPIC_Orc_Pw,"Tiamant has instructed me to find a group of orcs that have appeared in the valley and find out their intentions.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(ORCWARRIOR4_PW_01,"PW_ORC_01");
	Wld_InsertNpc(ORCWARRIOR4_PW_02,"PW_ORC_02");
	Wld_InsertNpc(ORCWARRIOR4_PW_03,"PW_ORC_03");
	Wld_InsertNpc(ORCWARRIOR4_PW_04,"PW_ORC_04");
	Wld_InsertNpc(ORC_PW_SCOUT,"PW_ORC_05");
	Wld_InsertNpc(ORCWARRIOR4_COWARD,"PW_ORC_06");
};


instance DIA_Ass_125_Tiamant_Orc_Pw(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_Orc_Pw_condition;
	information = dia_Ass_125_Tiamant_Orc_Pw_info;
	permanent = FALSE;
	description = "(give the acolyte's head)";
};

func int dia_Ass_125_Tiamant_Orc_Pw_condition()
{
	if((MIS_Orc_Pw == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Masiafadept_Kopf) >= 1) && (Npc_IsDead(ORCWARRIOR4_PW_01)) && (Npc_IsDead(ORCWARRIOR4_PW_02)) && (Npc_IsDead(ORCWARRIOR4_PW_03)) && (Npc_IsDead(ORCWARRIOR4_PW_04)) && (Npc_IsDead(ORC_PW_SCOUT)))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_Orc_Pw_info()
{

	B_GiveInvItems(other,self,ItMi_Addon_Masiafadept_Kopf,1);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_00");	//(grimly) So they killed my acolyte. It is as I feared.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_01");	//You made them pay, I hope? Spilt greenskin blood in the name of my fallen student? Good.
	B_GiveInvItems(self,other,ItMi_Addon_Masiafadept_Kopf,1);

	if(Npc_IsDead(ORCWARRIOR4_COWARD))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Orc_Pw_01_02");	//(nods)
		AI_PlayAni(other,"T_YES");
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_03");	//Good. One less thing to worry about.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_04");	//As for you, you deserve a rest.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_05");	//I'll let you know when I need you again.
		MIS_Orc_Pw = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Orc_Pw,LOG_SUCCESS);
		B_LogEntry(TOPIC_Orc_Pw,"I informed Tiamant that I dealt with the orcs.");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Orc_Pw_01_06");	//(silence)
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_07");	//Speak!
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Orc_Pw_01_08");	//A single orc escaped us, master.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_09");	//This is not good news, novice.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_10");	//I fear they are aware of us now, and will seek revenge.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_11");	//Good. My warriors need a warm up.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_12");	//It will be great training for them if the orc scum do decide to attack.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_13");	//Perhaps this is for the best.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_14");	//As for you, take a break.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_15");	//I'll let you know when I need you again.
		PW_OrcRevengeDay = Wld_GetDay();
		PW_OrcRevenge = TRUE;
		MIS_Orc_Pw = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Orc_Pw,LOG_SUCCESS);
		B_LogEntry(TOPIC_Orc_Pw," I informed Tiamant that I had dealt with the orcs, mentioning that one of the orcs managed to get away. " );
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_125_Tiamant_HasimKill(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HasimKill_condition;
	information = dia_Ass_125_Tiamant_HasimKill_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_HasimKill_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((PW_RecoverDeadBodyDay <= (Daynow - 1)) && (MIS_Orc_Pw == LOG_SUCCESS) && (HasimAmuls == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HasimKill_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_00");	//It's good you're here, novice!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_01");	//I have an assignment for you. A very delicate one.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_02");	//This is about one of our fighters. His name is Hasim. I think you've already met him.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKill_01_03");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_04");	//I won't waste words on this.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_05");	//Hasim must die. The reason is irrelevant.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_06");	//Do this for me. Silently, away from prying eyes.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_07");	//Do you understand?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKill_01_08");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_09");	//Good. I know you won't dissapoint me. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_10");	//After all, in many ways your own destiny depends on it.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_11");	//Now go.
	MIS_HasimKill = LOG_Running;
	Log_CreateTopic(TOPIC_HasimKill,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_Running);
	B_LogEntry(TOPIC_HasimKill, " Tiamant ordered me to kill Shadow Hasim. He did not explain why this is necessary, but it seems serious. This should be done away from prying eyes. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ass_125_Tiamant_HasimKillDone(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HasimKillDone_condition;
	information = dia_Ass_125_Tiamant_HasimKillDone_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_HasimKillDone_condition()
{
	if((MIS_HasimKill == LOG_Running) && (HasimKilled == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HasimKillDone_info()
{
	B_GivePlayerXP(400);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_00");	//Greeting, novice. Has the matter with Hasim been concluded?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKillDone_01_01");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_02");	//Good. I hope he didn't suffer overlong.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_03");	//You and I have some more business.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_04");	//Recently Prior Osair sent me a message that there were some creatures in the mine that devoured all of his slaves.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_05");	//Our soldiers depend on the iron ore for their weapons and armor.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_06");	//Osair cannot send his people there, because then there is simply no one to watch over the rest of the slaves.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_07");	//So he asked me to deal with this problem. And I, in turn, give this assignment to you.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_08");	//Kill the beasts. Every last one.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKillDone_01_09");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_10");	//If you've no questions, I suggest you get to work.
	MIS_OreBugs = LOG_Running;
	B_LogEntry(TOPIC_HasimKill, " I told Tiamant that Hasim was finished. I was surprised how calmly he reacted to this news. But the main thing is that the work is done. However, the Prior's motives are still unclear. " );
	Log_CreateTopic(TOPIC_OreBugs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OreBugs,LOG_Running);
	B_LogEntry_Quiet(TOPIC_OreBugs, " I need to go to the mine and deal with the creatures that devoured all the slaves there. Time is of the essence, since Tiamant doesn't like to wait. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OreBug_Tiamant_01,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_02,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_03,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_04,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_05,"PW_CAVEORE_01_TEMP");
	Wld_InsertNpc(OreBug_Tiamant_06,"PW_CAVEORE_02_TEMP");
	B_KillNpc(SEK_179_SLAVEOBSSEK);
	B_KillNpc(SEK_180_SLAVEOBSSEK);
	B_KillNpc(SEK_181_SLAVEOBSSEK);
	B_KillNpc(Ass_182_Adept);
};

instance DIA_Ass_125_Tiamant_OreBugsKilled(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_OreBugsKilled_condition;
	information = dia_Ass_125_Tiamant_OreBugsKilled_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_OreBugsKilled_condition()
{
	if((MIS_OreBugs == LOG_Running) && (Npc_IsInState(self,ZS_Talk)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_02)) && (Npc_IsDead(OreBug_Tiamant_03)) && (Npc_IsDead(OreBug_Tiamant_04)) && (Npc_IsDead(OreBug_Tiamant_05)) && (Npc_IsDead(OreBug_Tiamant_06)))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_OreBugsKilled_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_00");	//Ah, it's you, novice. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_01");	//You are here to report on your mission at the mine, yes?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_OreBugsKilled_01_02");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_03");	//No need to bother.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_04");	//Osair has already sent word of your success. His slaves are preparing to return to the mines as we speak.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_05");	//My faith in you was well placed, as always.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_06");	//It is time we talk about your future.
	MIS_OreBugs = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OreBugs,LOG_SUCCESS);
	B_LogEntry(TOPIC_OreBugs, " Tiamant has already been informed that I have dealt with the problem in the iron mine. He was pleased with it. " );
	Info_ClearChoices(DIA_Ass_125_Tiamant_OreBugsKilled);
	Info_AddChoice(DIA_Ass_125_Tiamant_OreBugsKilled,"...(nods)",DIA_Ass_125_Tiamant_OreBugsKilled_Murid);

};

func void DIA_Ass_125_Tiamant_OreBugsKilled_Murid()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_01");	//Good. Listen well.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_02");	//Since you've started carrying out your orders you have proven your tenacity and skill.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_03");	//But mostly, you haven't dissapointed me. And that is worth much more than gold.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_04");	//Therefore, you have proven that you are worthy of becoming my Murid.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_05");	//I'm certain you understand what this means, and that you will not dishonor me or yourself.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_06");	//Thank you, master.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_07");	//It is well deserved.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_08");	//What happens now?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_09");	//I have no other assignments for you right now.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_10");	//But stay close. Something always comes up, given enough time.
	TiamantMurid = TRUE;
	Snd_Play("LevelUP");
	B_LogEntry_Quiet(TOPIC_MasiafStory," Master Tiamant ordained me to his murids. This means that little remains to be done. And, perhaps, soon I can become one of the Masiaf assassins. This will greatly increase my prospects. " );
	AI_StopProcessInfos(self);
};


//---------------------------------------------------------------------


instance DIA_Ass_125_Tiamant_HaniarQuest1(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HaniarQuest1_condition;
	information = dia_Ass_125_Tiamant_HaniarQuest1_info;
	permanent = FALSE;
	description = "About Hasim...";
};

func int dia_Ass_125_Tiamant_HaniarQuest1_condition()
{
	if((GonsalesAdvice == TRUE) && (HaniarKnowKiller == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HaniarQuest1_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest1_01_01");	//I'm sorry to disturb you master, but I need to talk to you about Hasim.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_02");	//(удивленно) Why would we speak of the dead, my apprentice?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest1_01_03");	//That's exactly the problem.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_04");	//Elaborate?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest1_01_05");	//Prior Haniar is deeply concerned about Hasim's death, so he sent me to find out who was behind it.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_06");	//Ah, of course he is. I forgot to inform Haniar about the... plan.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_07");	//Can I help in any way?.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_08");	//I will write a letter to Haniar, he will understand.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_09");	//You will take it to him. Where is my parchment...
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_10");	//Where is it, by Beliar! Curse me for a fool, I must have left it somewhere.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_11");	//Murid! Go to the warehouse and get me a new pack of writing paper. I will not write on rags!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_12");	//Be quick about it, this concerns you too.
	B_LogEntry(TOPIC_HasimKill, " I spoke to Tiamant. It turns out he just forgot to warn the priori about the hit. Now I need to find him paper so Tiamant can write a note explaining the situation. I think I got off easy this time. " );
	AI_StopProcessInfos(self);
	Wld_insertitem(ItWr_TiamantPaperBlank,"FP_ITEM_TIAMANT_LETTER");
};

instance DIA_Ass_125_Tiamant_HaniarQuest2(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HaniarQuest2_condition;
	information = dia_Ass_125_Tiamant_HaniarQuest2_info;
	permanent = FALSE;
	description = "Here is a stack of writing paper. " ;

func int dia_Ass_125_Tiamant_HaniarQuest2_condition()
{
	if(Npc_HasItems(hero,ItWr_TiamantPaperBlank) >= 1)
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HaniarQuest2_info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest2_01_01");	//Here is the stack of writing paper you requested, master.
	B_GiveInvItems(other,self,ItWr_TiamantPaperBlank,1);
	Npc_RemoveInvItems(self,ItWr_TiamantPaperBlank,1);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest2_01_02");	//Thank you, murid. Give me a moment to write the letter.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest2_01_03");	//Take this to Haniar. Make haste.
	B_GiveInvItems(self,other,ItWr_TiamantPaperToHaniar,1);
	AI_StopProcessInfos(self);
};

instance DIA_Ass_125_Tiamant_HelpWithAssair(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HelpWithAssair_condition;
	information = dia_Ass_125_Tiamant_HelpWithAssair_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_HelpWithAssair_condition()
{
	if((TiamantNeedsSlaves == TRUE) && (PlayerIsAssNow == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HelpWithAssair_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_01");	//Ah, you've come. Good, I need your help.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HelpWithAssair_01_02");	//I am your servant, master.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_03");	//Prior Osair still has not sent slaves to the mine. You will find out why.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_04");	//He knows how much we need that ore! This delay is unacceptable.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_05");	//And now Haniar the Blind is starting to ask questions. I refuse to look like a fool!
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HelpWithAssair_01_06");	//I will do as you ask, master.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_07");	//Good. Hurry up, this is extremely important to us all.
	TiamantSendsToOsair = TRUE;
	B_LogEntry(TOPIC_Intriges," Tiamant asked me to remind Osair that he still hasn't sent new slaves to the mine. Haniar the Blind was personally interested in this matter, and Tiamant doesn't like that. He seems to be afraid of Haniar. " ););
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
};

instance DIA_Ass_125_Tiamant_WhatTeach(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_WhatTeach_condition;
	information = dia_Ass_125_Tiamant_WhatTeach_info;
	permanent = FALSE;
	description = " Can I learn something from you, master? " ;
};

func int dia_Ass_125_Tiamant_WhatTeach_condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_WhatTeach_info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_WhatTeach_01_01");	//Can I learn something from you, master? 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_02");	//Of course, you are one of us now.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_03");	//Soon, your mastery of the blade will be unparalleled.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_04");	//You will need enough experience, of course.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_05");	//I don't teach beginners.
	TiamantTeachMe = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher, " Prior Tiamant will help me increase my strength and agility, and can also teach me how to use a sword. " );
};

var int Tiamant_MerkeDEX;
var int Tiamant_MerkeSTR;

instance DIA_Ass_125_Tiamant_Teach(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 20;
	condition = DIA_Ass_125_Tiamant_Teach_Condition;
	information = DIA_Ass_125_Tiamant_Teach_Info;
	permanent = TRUE;
	description = " I want to become stronger and more agile. " ;
};

func int DIA_Ass_125_Tiamant_Teach_Condition()
{
	if(TiamantTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_15_00");	//I want to become stronger and more agile. 
	Tiamant_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Tiamant_MerkeSTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_Teach_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Tiamant_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_BACK_09_00");	//As you can see, you've already become more nimble.
	};
	if(other.attribute[ATR_STRENGTH] > Tiamant_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_BACK_Add_09_00");	//(appraising) Very good. You have become much stronger.
	};
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
};

func void DIA_Ass_125_Tiamant_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_TeachSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_TeachSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

instance DIA_Ass_125_Tiamant_Teach_Weapon(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 7;
	condition = DIA_Ass_125_Tiamant_Teach_Weapon_Condition;
	information = DIA_Ass_125_Tiamant_Teach_Weapon_Info;
	permanent = TRUE;
	description = " I want to learn the art of using a sword. " ;
};

func int DIA_Ass_125_Tiamant_Teach_Weapon_Condition()
{
	if(TiamantTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_Weapon_15_00");	//I want to learn the art of sword handling.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Weapon_15_01");	//No problem.
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
};

var int TiamantTellFirst;

func void B_TiamantTellFirst()
{
	if(TiamantTellFirst == FALSE)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_00");	//A true warrior doesn't just strike his opponent.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_01");	//He uses his entire body, his feelings, to keep his enemy in sight.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_02");	//Keep your enemy in mind at all times.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_03");	//Some blows can be blocked, others can not.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_04");	//Learn the difference. Then you can anticipate, and evade, incoming attacks.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_05");	//If you learn this, and remember it, you will live much longer.
		TiamantTellFirst = TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_Back()
{
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

instance DIA_Ass_125_Tiamant_WhatAbout2X2(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_WhatAbout2X2_condition;
	information = dia_Ass_125_Tiamant_WhatAbout2X2_info;
	permanent = FALSE;
	description = " Can I learn something special? " ;
};

func int dia_Ass_125_Tiamant_WhatAbout2X2_condition()
{
	if((TiamantTeachMe == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_WhatAbout2X2_info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_01");	//Can I learn something special?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_02");	//Of course. I can teach you how wield dual swords.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_03");	//However I must warn you. This technique requires much skill and experience.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_04");	//For it is the mark of a true master of the sword!
	TiamantTeachMe2X2 = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher," Prior Tiamant can also show me dual wielding techniques if I get good enough. " );
};

var int RuleTwoHands1H;
var int RuleTwoHands2H;
var int RuleTwoHandsDex;
var int RuleTwoHandsStr;

instance DIA_Ass_125_Tiamant_Teach_2X2(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 20;
	condition = DIA_Ass_125_Tiamant_Teach_2X2_Condition;
	information = DIA_Ass_125_Tiamant_Teach_2X2_Info;
	permanent = TRUE;
	description = " I want to learn how to dual wield. " ;
};

func int DIA_Ass_125_Tiamant_Teach_2X2_Condition()
{
	if((TiamantTeachMe2X2 == TRUE) && (TiamantTeachMe2X2_Done == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_2X2_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_00");	//I want to learn how to dual wield.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_01");	//Good. But first, let's see what you can do.

	if(other.attribute[ATR_DEXTERITY] >= 150)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_02");	//(appraisingly) Well, you really deserve to master this knowledge.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_03");	//Your skills are truly worthy of respect.
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_04");	//Teach me!
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_05");	//(important) Okay. Listen to me carefully.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_06");	//The secret of dual wielding lies primarily in the perfect balance.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_07");	//This applies to everything - your weapons, your movements, your fighting style.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_08");	//First you need to understand that not all weapons are suitable for doubles.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_09");	//Your sword in one hand should be a smooth continuation of the sword in the other.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_10");	//That is why paired blades, first of all, should be as close to each other as two twin brothers.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_11");	//Moreover, it should be noted that each warrior is capable of this sense of balance.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_12");	//You and your weapon should be a reflection of each other.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_13");	//This makes your movements faster and more accurate.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_14");	//The inertia of one sword strike entails the inertia of the other, making it even more powerful.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_15");	//And which, in turn, allows for a series of deadly strikes almost at lightning speed.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_16");	//As for the fighting style, this is a separate topic altogether.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_17");	//Dual wielding is more like a dance than mere movement.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_18");	//One movement flows into the next, and the next, and so on.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_19");	//This is basically all you need to know about dual wielding.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_20");	//If you can piece together everything I just told you ...
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_21");	//... then you will be unmatched on the battlefield!
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_22");	//Here, take this scroll.
		B_GiveInvItems(self,other,ItWr_DualFight,1);
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_23");	//It contains the final notes regarding this technique.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_24");	//From now on, it is up to you.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_25");	//Thank you, master.
		TiamantTeachMe2X2_Done = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_26");	//(appraisingly) No! You are not ready for this yet.
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_27");	//But why, master?
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_28");	//You lack the skill.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_32");	//Do you see?
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_33");	//Yes...
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_34");	//You need more training.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_35");	//Only through strenuous work can you master this knowledge.

		if(RuleTwoHandsDex == FALSE)
		{
			B_LogEntry_Quiet(TOPIC_PrioratTeacher," I'm not very good at dual wielding . (Requires: 150 or more agility) " );
			RuleTwoHandsDex = TRUE;
		};
	};
};

instance DIA_Ass_125_Tiamant_DualWeapon(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 20;
	condition = DIA_Ass_125_Tiamant_DualWeapon_Condition;
	information = DIA_Ass_125_Tiamant_DualWeapon_Info;
	permanent = FALSE;
	description = " Where can I find a dual weapon? " ;
};

func int DIA_Ass_125_Tiamant_DualWeapon_Condition()
{
	if(TiamantTeachMe2X2_Done == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_DualWeapon_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_DualWeapon_01_00");	//Where can I find a dual weapon?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_01");	//Each master of the two blades has his own. And it is unlikely to suit you.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_02");	//You will have to make your own weapon.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_DualWeapon_01_03");	//How?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_04");	//Hmmm ... Sorry, but I can't tell you that.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_05");	//However, I heard that Prior Osair has a very rare recipe for making legendary moon blades.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_06");	//Perhaps he will shre this secret knowledge with you.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_07");	//If you are convincing enough, of course.
	MIS_MoonBlades = LOG_Running;
	Log_CreateTopic(TOPIC_MoonBlades,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MoonBlades,LOG_Running);
	B_LogEntry(TOPIC_MoonBlades, " Tiamant mentioned that Prior Osair has rare blueprints for the legendary twin weapon - moonblades. " );
};
