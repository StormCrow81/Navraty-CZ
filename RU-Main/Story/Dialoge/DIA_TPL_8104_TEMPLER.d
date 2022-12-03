
instance DIA_TPL_8104_TEMPLER_EXIT(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 999;
	condition = DIA_TPL_8104_TEMPLER_exit_condition;
	information = DIA_TPL_8104_TEMPLER_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_TPL_8104_TEMPLER_exit_condition()
{
	return TRUE;
};

func void DIA_TPL_8104_TEMPLER_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TPL_8104_TEMPLER_NOFOREVER(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_noforever_condition;
	information = DIA_TPL_8104_TEMPLER_noforever_info;
	permanent = FALSE;
	description = " Are you the leader of this squad of guardians? " ;
};

func int DIA_TPL_8104_TEMPLER_noforever_condition()
{
	return TRUE;
};

func void DIA_TPL_8104_TEMPLER_noforever_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_NoForever_01_00 " );	// I take it you're the one leading this squad of guardians?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_NoForever_01_01");	//Да, ты прав. 
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_NoForever_01_02 " );	// Gor Na Tof personally gave me the order to move here to protect our harvesters from a possible attack.
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_NoForever_01_03 " );	// Didn't he explain who you're going to face here?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_NoForever_01_04 " );	// No, he didn't say that.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_NoForever_01_05 " );	// But that doesn't really matter. (calmly) I am ready to carry out his order even at the cost of my own life!
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_NoForever_01_06 " );	// Well, if so, then I'm calm.
};

instance DIA_TPL_8104_TEMPLER_AboutMe(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_AboutMe_condition;
	information = DIA_TPL_8104_TEMPLER_AboutMe_info;
	permanent = FALSE;
	description = " How did you become a Guardian? " ;
};

func int DIA_TPL_8104_TEMPLER_AboutMe_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_noforever))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_AboutMe_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_AboutMe_01_00 " );	// How did you become a guardian?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_AboutMe_01_01 " );	// Very simple. When our Brotherhood settled here in Khorinis...
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_AboutMe_01_02 " );	// ...he needed people capable of holding weapons in their hands to guard the camp, the new novices, and the Gurus themselves.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_AboutMe_01_03 " );	// I was one of those selected by Gor Na Tof as new guard candidates.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_AboutMe_01_04 " );	// Later, he personally took over my training. And now I'm one of them!
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_AboutMe_01_05 " );	// Why do you ask?
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_AboutMe_01_06 " );	// I just don't remember meeting you at the old Brotherhood of the Sleeper camp.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_AboutMe_01_07 " );	// Naturally! You couldn't even remember me... (chuckling) In the old camp, I was an ordinary novice who helped our Gurus work the swamp grass.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_AboutMe_01_08 " );	// But I remember you well. You're the guy who brought Creeper saliva to Cor Galom. Is not it?
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_AboutMe_01_09 " );	// Well, yes, it was.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_AboutMe_01_10 " );	// So, I was not mistaken... (chuckling) I have a good memory for faces! Especially when it came to our Brotherhood.
};

instance DIA_TPL_8104_TEMPLER_WhatDo(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_WhatDo_condition;
	information = DIA_TPL_8104_TEMPLER_WhatDo_info;
	permanent = FALSE;
	description = " It's pretty boring, don't you think? " ;
};

func int DIA_TPL_8104_TEMPLER_WhatDo_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_noforever))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_WhatDo_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_WhatDo_01_00 " );	// It's pretty boring here, don't you think?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_WhatDo_01_01 " );	// That's right, buddy... (dreary) Here, in this wilderness, it's hard to keep yourself busy.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_WhatDo_01_02 " );	// However, I think we shouldn't lose our vigilance for all sorts of things.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_WhatDo_01_03 " );	// Any indulgence will cost us too much!
};

instance DIA_TPL_8104_TEMPLER_HowReady(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_HowReady_condition;
	information = DIA_TPL_8104_TEMPLER_HowReady_info;
	permanent = FALSE;
	description = " Do you think your people are well trained? " ;
};

func int DIA_TPL_8104_TEMPLER_HowReady_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_noforever))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_HowReady_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_HowReady_01_00 " );	// Do you think your people are well trained?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_HowReady_01_01 " );	// Hmmm...(arrogantly) As far as I know, Gor Na Tof personally selected who to send here.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_HowReady_01_02 " );	// I believe that you will not doubt the competence of our teacher.
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_HowReady_01_03 " );	// There's no doubt about that. However, I know who you will have to deal with in the event of an attack. And I just want to make sure your people are ready for it.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_HowReady_01_05 " );	// They're ready...(calmly) Maybe they're a bit lacking in weapon prowess. However, their morale is stronger than ever!
};


instance DIA_TPL_8104_TEMPLER_LetsTrain(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_LetsTrain_condition;
	information = DIA_TPL_8104_TEMPLER_LetsTrain_info;
	permanent = FALSE;
	description = " How about some sword practice? " ;
};

func int DIA_TPL_8104_TEMPLER_LetsTrain_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_HowReady))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_LetsTrain_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_LetsTrain_01_00 " );	// How about some sword practice?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_01_01 " );	// What do you mean?
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_LetsTrain_01_02 " );	// I guess your fighters could do with some weapon practice while they have time.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_01_03 " );	// Hmmm...(thoughtfully) That would be a really good idea! I think it's worth asking them about it.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_01_04 " );	// However, the question remains - who will train them?
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_LetsTrain_01_05 " );	// Maybe you?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_01_06 " );	// Well...(embarrassed) I'm pretty good with two-handed guardians, but I've never had the opportunity to be a mentor myself.
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_LetsTrain_01_07 " );	// And what does Gor Na Tof think of you?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_01_08 " );	// My teacher? As far as I know, he thinks that I lack concentration in combat a little.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_01_09 " );	// But you'd better talk to him about it yourself.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_01_10 " );	// Perhaps if he gives his consent, then I'll train the guards here at the gathering camp.
	Log_CreateTopic(TOPIC_TrainInCamp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrainInCamp,LOG_Running);
	B_LogEntry(TOPIC_TrainInCamp, " I've suggested to Tirax that he train guards at the Gatherer Camp. But first, I should talk to his teacher, Gor Na Toph, to give his consent. " );
	MIS_TrainInCamp = LOG_Running;
};

instance DIA_TPL_8104_TEMPLER_LetsTrain_Done(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_LetsTrain_Done_condition;
	information = DIA_TPL_8104_TEMPLER_LetsTrain_Done_info;
	permanent = FALSE;
	description = " Gor Na Tof has given you his consent. " ;
};

func int DIA_TPL_8104_TEMPLER_LetsTrain_Done_condition()
{
	if((GorNaTotAgreeTiraks == TRUE) && (MIS_TrainInCamp == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_LetsTrain_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_00 " );	// Gor Na Tof has given you his consent, so you can start training guardians.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_01 " );	// Hmmm...(surprised) So he thinks my fighting skills are pretty high.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_02 " );	// Okay, let's start tomorrow then.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_03 " );	// Here, take this scroll as my thanks.
	B_GiveInvItems(self,other,ITSC_TRFMEATBUG,1);
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_04 " );	// As a warrior, I don't need him. And you might find it useful!
	B_LogEntry(TOPIC_TrainInCamp, " I have conveyed Gor Na Tof's words to Tirax and he will start training guardians from tomorrow. " );
	Log_CreateTopic(TOPIC_TrainInCamp,LOG_SUCCESS);
	MIS_TrainInCamp = LOG_SUCCESS;
	CampTrainingTimer = Wld_GetDay();
};


instance DIA_TPL_8104_TEMPLER_TrainDay(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_TrainDay_condition;
	information = DIA_TPL_8104_TEMPLER_TrainDay_info;
	permanent = FALSE;
	description = " How is the training going? " ;
};

func int DIA_TPL_8104_TEMPLER_TrainDay_condition()
{
	be int Daynow;

	Daynow = Wld_GetDay();

	if((CampTrainingTimer < Daynow) && (MIS_TrainInCamp == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_TrainDay_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_TrainDay_01_00 " );	// How is the learning going?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_TrainDay_01_01 " );	// As you can see... (chuckling) We're not wasting our time here.
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_TrainDay_01_02 " );	// Got it. Why isn't everyone exercising?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_TrainDay_01_03 " );	// Well, someone has to guard our bog harvesters at this time.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_TrainDay_01_04 " );	// Therefore, the guards train in turn at the strictly allotted time for this. And the rest are watching the camp.
};

instance DIA_TPL_8104_TEMPLER_Relax(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_Relax_condition;
	information = DIA_TPL_8104_TEMPLER_Relax_info;
	permanent = FALSE;
	description = " You look a little tired. " ;
};

func int DIA_TPL_8104_TEMPLER_Relax_condition()
{
	if((MIS_TrainInCamp == LOG_SUCCESS) && (Wld_IsTime(23,59,7,59)))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_Relax_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_Relax_01_00 " );	// You look a little tired.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_01_01 " );	// (sullenly) Really? Maybe you're right.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_01_02 " );	// It's just that all this uncertainty is exhausting as hell. Yes, and the nerves themselves are already at the limit.
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_Relax_01_03 " );	// You just need to relax a bit.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_01_04 " );	// Eh, buddy... That's how it is. Just how to do it?
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_Relax_01_05 " );	// What's the problem?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_01_06 " );	// You see, if I were in the Brotherhood camp right now, I would immediately go to Talas.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_01_07 " );	// A couple of puffs on those joints he's handing out to acolytes would probably bring me back to life.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_01_08 " );	// But where in this wilderness, tell me, will you take at least one shoal of swamp grass?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_01_09 " );	// So for now, apparently, we will have to wait a little with the rest.
	Log_CreateTopic(TOPIC_TiraksRelax,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TiraksRelax,LOG_Running);
	B_LogEntry(TOPIC_TiraksRelax, " Tirax needs a few bogweed shoals to release his tension. " );
	MIS_TiraksRelax = LOG_Running;
};

instance DIA_TPL_8104_TEMPLER_Relax_Done(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_Relax_Done_condition;
	information = DIA_TPL_8104_TEMPLER_Relax_Done_info;
	permanent = FALSE;
	description = " I have something here for you. " ;
};

func int DIA_TPL_8104_TEMPLER_Relax_Done_condition()
{
	if((MIS_TiraksRelax == LOG_Running) && (Npc_HasItems(hero,ItMi_Joint) >= 1))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_Relax_Done_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_Relax_Done_01_00 " );	// I have something here for you.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_Done_01_01 " );	// What are you talking about?
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_Relax_Done_01_02 " );	// This will help you relax a bit. Here.

	if(Npc_HasItems(other,ItMi_Joint) >= 3)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ItMi_Joint,3);
		B_LogEntry(TOPIC_TiraksRelax, " Tirax was over the moon when he heard that I got him marsh grass joints. " );
	}
	else if(Npc_HasItems(other,ItMi_Joint) >= 2)
	{
		B_GivePlayerXP(200);
		B_GiveInvItems(other,self,ItMi_Joint,2);
		B_LogEntry(TOPIC_TiraksRelax, " Tirax was over the moon when he heard that I got him marsh grass joints. " );
	}
	else
	{
		B_GivePlayerXP(100);
		B_GiveInvItems(other,self,ItMi_Joint,1);
		B_LogEntry(TOPIC_TiraksRelax, " Tirax was over the moon when he heard that I got him a marsh grass joint. " );
	};

	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_Done_01_03 " );	// I can't believe my eyes! You got me a swamp.
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_Relax_Done_01_04 " );	// As you can see.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_Relax_Done_01_05 " );	// Well, you really helped me out, mate. And I won't forget it!
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_Done_01_06");	//...Мммм
	Log_CreateTopic(TOPIC_TiraksRelax,LOG_SUCCESS);
	MIS_TiraksRelax = LOG_SUCCESS;
};

instance DIA_TPL_8104_TEMPLER_GetFurs(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_GetFurs_condition;
	information = DIA_TPL_8104_TEMPLER_GetFurs_info;
	permanent = FALSE;
	description = " Is there anything else I can help you with? " ;
};

func int DIA_TPL_8104_TEMPLER_GetFurs_condition()
{
	if ((MIS_BalamProviant ==  LOG_SUCCESS ) && (chapter <  6 ) && ( ! Npc_IsDead(BAU_982_Grimbald))) .
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_GetFurs_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_01_00 " );	// Is there anything else I can help you with?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_01_01 " );	// Hmmm...(thoughtfully) I suppose you could get us a couple of sheepskins or two.
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_01_02 " );	// Why else?
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_01_03 " );	// Well, you see, it's pretty cold here at night. And guys generally have to sleep right on the ground.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_01_04 " );	// A pair of warm sheepskins will brighten up their already meager rest a little.
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_01_05 " );	// Okay, I understand. But where can I get them? There are no farms nearby.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_01_06 " );	// So yes. But as far as I know, one of the hunters is hunting somewhere nearby.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_01_07 " );	// We saw him a few days ago, up there on the plateau.
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_01_08 " );	// So maybe he has everything he needs.
	Log_CreateTopic(TOPIC_TiraksFur,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TiraksFur,LOG_Running);
	B_LogEntry(TOPIC_TiraksFur, " Tirax asked me to get him some warm sheepskins to keep the guys at camp warm at night. " );
	MIS_TiraksFur = LOG_Running;
};


instance DIA_TPL_8104_TEMPLER_GetFurs_Done(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_GetFurs_Done_condition;
	information = DIA_TPL_8104_TEMPLER_GetFurs_Done_info;
	permanent = TRUE;
	description = " About the skins you need... " ;
};

func int DIA_TPL_8104_TEMPLER_GetFurs_Done_condition()
{
	if(MIS_TiraksFur == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_GetFurs_Done_info()
{
	AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_00 " );	// About the skins you need...
	AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_01 " );	// Yes? What do you say? Did you manage to get them for us?

	if((Npc_HasItems(other,ItAt_ShadowFur) >= 2) && ((GrimbaldTellSellFur == TRUE) || (GrimbaldSellFur == TRUE) || (GrimbaldSellFurAll == TRUE)))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_02 " );	// Here, here are a couple of mrakoris skins. I hope this is enough?
		B_GiveInvItems(other,self,ItAt_ShadowFur,2);
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_03 " );	// Hmmm... (surprised) To me, these are just excellent skins, and besides, excellent workmanship!
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_04 " );	// Now my guys won't have to freeze here at night.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_05 " );	// However, let me know where you got them from? Are you hunting these creatures?!
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_06 " );	// I don't, but that hunter you saw near the camp does it in these parts. I received them from him.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_08 " );	// Got it. And I suppose you had to shell out a huge pile of gold for them?
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);

		if(GrimbaldTellSellFur == TRUE)
		{
			Info_AddChoice(DIA_TPL_8104_TEMPLER_GetFurs_Done, " I got them for free. " ,DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale);
		};

		if(GrimbaldSellFur == TRUE)
		{
			Info_AddChoice(DIA_TPL_8104_TEMPLER_GetFurs_Done, " I had to pay for one skin. " ,DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale);
		};

		if(GrimbaldSellFurAll == TRUE)
		{
			Info_AddChoice(DIA_TPL_8104_TEMPLER_GetFurs_Done, " You're right! They cost me dearly. " ,DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale);
		};
	}
	else if(Npc_HasItems(other,ItAt_SheepFur) >= 2)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_09 " );	// Here, here are a couple of sheepskins. I hope this is enough?
		B_GiveInvItems(other,self,ItAt_SheepFur,2);
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_10 " );	// Of course, buddy... (enough) Now my guys won't have to freeze here at night.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_11 " );	// Take this gold as my thanks. I'm sorry, but I have nothing else to thank you.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_12");	//Спасибо.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_13 " );	// There's a lot more here than any merchant could offer you for them. Be sure!
		B_LogEntry(TOPIC_TiraksFur, " I got sheep skins for Tiraks. " );
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
	}
	else
	{
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_14");	//Пока нет.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_01_15 " );	// Okay, no, no. The main thing is that you have not forgotten about my request.
	}; 
};


func void DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale()
{
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_00 " );	// I got them for nothing.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_01 " );	// Well, if that's the case... (thoughtfully) Then, as my thanks, I'll give you some rare magic elixirs.
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_02 " );	// That would be pretty generous of you.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_03 " );	// Well, you helped us, and that's much more valuable.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_04 " );	// Here, take these magical drinks. I hope they are of use to you.
		B_GiveInvItemsManyThings(self,other);
		CreateInvItems(other,ItPo_Perm_Health,1);
		CreateInvItems(other,ItPo_Perm_Mana,1);
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_05");	//Спасибо.
		B_LogEntry(TOPIC_TiraksFur, " I gave Tirax the Tirakoris skins. " );
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);
};


func void DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale()
{
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_00 " );	// I had to pay for one skin.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_01 " );	// Well, if that's the case... (thoughtfully) Then I'll compensate your expenses and give you a few more magical elixirs.
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_02 " );	// How generous of you!
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_03 " );	// Well, you helped us, and that's much more valuable. How much was this skin?
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_04 " );	// Two hundred gold.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_05 " );	// Good. Here, take your gold and these magical drinks.
		B_GiveInvItemsManyThings(self,other);
		CreateInvItems(other,ItMi_Gold,200);
		CreateInvItems(other,ItPo_Health_02,5);
		CreateInvItems(other,ItPo_Mana_02,5);
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_06 " );	// I hope this is enough for you as our thanks.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_07");	//Вполне.
		B_LogEntry(TOPIC_TiraksFur, " I gave Tirax the Tirakoris skins. " );
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);
};

func void DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale()
{
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_00 " );	// You're right! They cost me dearly.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_01 " );	// Well, if that's the case... (thoughtfully) Then I'll double your costs. How much does each skin cost?
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_02 " );	// Two hundred gold.
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_03 " );	// Good. Here, take your gold. I believe that no merchant in Khorinis will offer you such a price.
		B_GiveInvItems(self,other,ItMi_Gold,800);
		AI_Output(other,self, " DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_04 " );	// How generous of you!
		AI_Output(self,other, " DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_05 " );	// Well, you helped us, and that's much more valuable.
		B_LogEntry(TOPIC_TiraksFur, " I gave Tirax the mrakoris pelts. He was very pleased and paid a lot of gold for them. " );
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);
};
