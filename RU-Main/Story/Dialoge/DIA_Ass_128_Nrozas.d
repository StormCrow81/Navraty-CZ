instance DIA_Ass_128_Nrozas_EXIT(C_Info)
{
	npc = Ass_128_Nrozas;
	No. = 999 ;
	condition = dia_Ass_128_Nrozas_exit_condition;
	information = dia_Ass_128_Nrozas_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Ass_128_Nrozas_exit_condition()
{
	return TRUE;
};

func void dia_Ass_128_Nrozas_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_PreHALLO(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_PreHALLO_condition;
	information = dia_Ass_128_Nrozas_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PreHALLO_condition()
{
	if((MIS_OsairDemand == LOG_SUCCESS) && (NrozasMurid == FALSE))
	{
		return FALSE;
	}
	else if(Npc_IsInState(self,ZS_Talk) && (NrozasMurid == FALSE) && (MeetNrozas == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PreHALLO_info()
{
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PreHALLO_01_00 " );	// (irritated) Why are you bothering me?
};


instance DIA_Ass_128_Nrozas_PreHALLO_Kill(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_PreHALLO_Kill_condition;
	information = dia_Ass_128_Nrozas_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NrozasMurid == FALSE) && (PW_WelcomeToHram == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Ass_128_Nrozas_HALLO(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_hallo_condition;
	information = dia_Ass_128_Nrozas_hallo_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_hallo_condition()
{
	if((Npc_IsDead(SEK_168_SLAVEOBSSEK) == FALSE) && (PW_WelcomeToHram == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_hallo_info()
{
	B_GivePlayerXP(100);
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_01_00 " );	// (enough) Ah, my new slave! Finally. Come here, don't be afraid.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_01_01 " );	// As for you, novice, don't keep me waiting any longer. Otherwise, you will find yourself in his place!
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_01_02 " );	// And now, you will serve me too.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_01_03 " );	// I am running out of healing herbs and seraphis leaves.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_01_04 " );	// So go and get me a dozen stems of each plant. Is that clear?
	B_LogEntry (TOPIC_MasiafStory, "I think I managed to get into the Temple. I should trturn to Gonzalez on occasion. " );
	Info_ClearChoices(DIA_Ass_128_Nrozas_HALLO);
	Info_AddChoice(DIA_Ass_128_Nrozas_HALLO,"...(silence)",DIA_Ass_128_Nrozas_HALLO_Molchat);
	Info_AddChoice (DIA_Ass_128_Nrozas_HALLO, " ... (nod silently) " , DIA_Ass_128_Nrozas_HALLO_Kivok);
	Info_AddChoice (DIA_Ass_128_Nrozas_HALLO, " Yes, I understand. " , DIA_Ass_128_Nrozas_HALLO_Yes);
};

func void DIA_Ass_128_Nrozas_HALLO_Molchat ()
{
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_Molchat_01_00 " );	// And? Why are you staring at me like an idiot?
};

func void DIA_Ass_128_Nrozas_HALLO_Kivok()
{
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_Kivok_01_00 " );	// Good. There's another thing I need from you ...
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_Kivok_01_01 " );	// If you are near Osaira's cave, tell him to send me stronger slaves next time.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_HALLO_Kivok_01_02 " );	// (nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_Kivok_01_03 " );	// The last batch barely survived for two days. They die like flies!
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_Kivok_01_04 " );	// If it goes on like this, I will have no more test subjects. That would be... unfortunate.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_Kivok_01_05 " );	// Now get out of here.
	MIS_NrozasFl = LOG_Running;
	MIS_NrozasToOsair = LOG_Running;
	Log_CreateTopic(TOPIC_NrozasFl,LOG_MISSION);
	Log_CreateTopic(TOPIC_NrozasToOsair,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NrozasFl,LOG_Running);
	Log_SetTopicStatus(TOPIC_NrozasToOsair,LOG_Running);
	B_LogEntry (TOPIC_NrozasFl, " Poison Master Nrozas gave me an order to bring him ten stalks of healing herbs and seraphis. " );
	B_LogEntry_Quiet (TOPIC_NrozasToOsair, " Nrozas told me to ask Prior Osair for stronger slaves to test his poisons on. " );
	MeetNrozas = TRUE;
	AI_StopProcessInfos(self);
	SEK_168_SLAVEOBSSEK .aivar [ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(SEK_168_SLAVEOBSSEK,"Nrozas");
};

func void DIA_Ass_128_Nrozas_HALLO_Yes()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_HALLO_Yes_01_00 " );	// Yes, I got it.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_Yes_01_01 " );	// You dare to speak to me without permission?!
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_Yes_01_02 " );	// Something tells me that you are not who you say you are.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HALLO_Yes_01_03 " );	// Well, then it will cost you your life. You shouldn't have come here!
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	SEK_168_SLAVEOBSSEK .aivar [ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(SEK_168_SLAVEOBSSEK,"Nrozas");
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_128_Nrozas_NrozasFl(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_NrozasFl_condition;
	information = dia_Ass_128_Nrozas_NrozasFl_info;
	permanent = FALSE ;
	description = " (give all plants) " ;
};

func int dia_Ass_128_Nrozas_NrozasFl_condition()
{
	if((MIS_NrozasFl == LOG_Running) && (Npc_HasItems(other,ItPl_Blueplant) >= 10) && (Npc_HasItems(other,ItPl_Health_Herb_01) >= 10))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_NrozasFl_info()
{
	B_GivePlayerXP(100);
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItPl_Blueplant,10);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,10);
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasFl_01_01 " );	// Great! Just what I needed.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasFl_01_02 " );	// And you are not as hopeless as it seemed to me at first glance.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasFl_01_03 " );	// Perhaps you will make a decent servant.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_NrozasFl_01_04 " );	// (nods silently)
	AI_PlayAni(other,"T_YES");
	MIS_NrozasFl = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NrozasFl,LOG_SUCCESS);
	B_LogEntry (TOPIC_NrozasFl, " I brought all the plants he wanted to Nrozas. He seems satisfied with my work. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ass_128_Nrozas_NrozasToOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_NrozasToOsair_condition;
	information = dia_Ass_128_Nrozas_NrozasToOsair_info;
	permanent = FALSE ;
	description = " (deliver letter) " ;
};

func int dia_Ass_128_Nrozas_NrozasToOsair_condition()
{
	if((MIS_NrozasToOsair == LOG_Running) && (Npc_HasItems(other,ItWr_Osair) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_NrozasToOsair_info()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItWr_Osair,1);
	Npc_RemoveInvItems(self,ItWr_Osair,1);
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasToOsair_01_00 " );	// What is this? Ah, a letter from Osair.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasToOsair_01_01 " );	// Ok, give it here. Let's see what he wants.
	B_UseFakeScroll();
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasToOsair_01_02 " );	// Hmmm ... (thoughtfully) And he thinks I will agree to this? Bah.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasToOsair_01_03 " );	// When he sends his men to me for a new batch of poisoned arrows, I will remind him of this letter.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasToOsair_01_04 " );	// As for you, you did a good job.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasToOsair_01_05 " );	// If you continue to carry out my orders in the same way, I will see to your future prospects here.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NrozasToOsair_01_06 " );	// Now go. I don't need you yet.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NrozasToOsair_01_07");	//(nods)
	AI_PlayAni(other,"T_YES");
	MIS_NrozasToOsair = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NrozasToOsair,LOG_SUCCESS);
	B_LogEntry (TOPIC_NrozasToOsair, " I brought Nrozas an answer from Osair. The letter obviously did not suit him, but I did my part. " );
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItWr_Osair_Read,"FP_ITEM_NROZAS_LETTER");
};

instance DIA_Ass_128_Nrozas_NewSlaves(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_NewSlaves_condition;
	information = dia_Ass_128_Nrozas_NewSlaves_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_NewSlaves_condition()
{
	if(MIS_OsairDemand == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_NewSlaves_info()
{
	B_GivePlayerXP(500);
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_01 " );	// (seriously) Stop, novice. Answer me truthfully.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_02 " );	// I heard that you brought Osair the hide of a black cave troll.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_03 " );	// How did you know he wanted one? Did you read the letter he sent to me?
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_04");	//(nods)
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_05 " );	// Stop with the nodding! Answer normally, and don't try to lie to me!
	AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_06");	//Yes, I read it.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_07 " );	// Hmmm. You are brave! Others wouldn’t have had the courage to do that.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_08 " );	// Of course, for such insolence you should be killed on the spot.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_09 " );	// But thanks to your mistake, Osair sent me a whole batch of new slaves today.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_10 " );	// This pleases me. I am feeling... generous.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_11 " );	// You were not only helpful to both of us, but also helped resolve a very longstanding dispute.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_12 " );	// So I made a decision. From now on you are my murid! Chosen from among the novices.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_13 " );	// I hope you understand that this is a great honor. So don't let me down.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_NewSlaves_01_14 " );	// Thank you, master.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_15 " );	// Don't thank me yet.
	NrozasMurid = TRUE;
	Snd_Play("LevelUP");
	B_LogEntry (TOPIC_MasiafStory, " Nrozas was very pleased that I was able to resolve his longstanding dispute with Osair, and at the same time proved to be useful to both. For this he appointed me his murid - chosen novice. " );

	if((OsairMurid == TRUE) && (PlayerSendToTiamant == FALSE))
	{
		AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_16 " );	// Yes, and one more thing ...
		AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_17 " );	// Since you were able to defeat the cave troll, I must assume you are quite a skilled fighter.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_18 " );	// Prior Tiamant is engaged in combat training of the Shadows, and might see potential in you.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_NewSlaves_01_19 " );	// Talk to him. And if he has any questions, just tell me that I sent you.
		AI_Output(other,self,"DIA_Ass_128_Nrozas_NewSlaves_01_20");	//Alright, master.
		PlayerSendToTiamant = TRUE;
	};
};


instance DIA_Ass_128_Nrozas_Murid (C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_Murid_condition;
	information = dia_Ass_128_Nrozas_Murid_info;
	permanent = FALSE ;
	description = " What does it mean to be the chosen one, master? " ;
};

func int dia_Ass_128_Nrozas_Murid_condition()
{
	if((NrozasMurid == TRUE) && (MuridTells == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Murid_info()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Murid_01_01 " );	// What does it mean to be the chosen one, master?
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_02 " );	// Let me explain something to you. Listen carefully.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_03 " );	// Once every four years, one of our novices is honored ascend to the rank of Shadow of Masiaf.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_04 " );	// Shadows are what we call our warriors, bringing death to all those who doubt our power and, most importantly, the power of Beliar himself!
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_05 " );	// Each Masiaf Prior, including myself, chooses from among the novices one who is worthy of it.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_06 " );	// And appoints him as his murid, thereby proposing him as a candidate for the ritual of conversion.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_07 " );	// When the time comes, all murids undergo a series of very difficult and deadly tests.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_08 " );	// And the one who remains alive, in the end, undergoes the rite of initiation into the chosen warrior of Beliar.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_09 " );	// I chose you as my murid. However, others, as far as I know, have not yet made their choice.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Murid_01_10 " );	// What if all the priests choose the same novice?
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_11 " );	// Hmmm. As far as I know, this has never happened before.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_12 " );	// But, most likely, his fate will then be decided by Haniar the Blind himself, as the most powerful and wise of us.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Murid_01_13 " );	// And what he decides is known only to Beliar himself.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Murid_01_14");	//I understand.
	MuridTells = TRUE;
	B_LogEntry (TOPIC_MasiafStory, " Nrozas told me about the ritual of converting selected novices to the ranks of the Shadows, warriors of the Brotherhood of Masiaf. Each prior must choose a murid, and then they compete with each other. If all the priors choose the same person, the fate of this murid will be up to the wisest of them: Haniar the Blind. " );
};

instance DIA_Ass_128_Nrozas_HasimVine(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_HasimVine_condition;
	information = dia_Ass_128_Nrozas_HasimVine_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_HasimVine_condition()
{
	if(HasimNeedRareWine == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_HasimVine_info()
{
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HasimVine_01_01 " );	// Ah, murid! It's good that you're here.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HasimVine_01_02 " );	// I need you to go to the pantry and bring me a bag of sulfur and coal.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HasimVine_01_03 " );	// Here's the key. But don't touch anything else!
	B_GiveInvItems(self,other,ItKe_PW_Sklad,1);
	AI_Output(other,self,"DIA_Ass_128_Nrozas_HasimVine_01_04");	//Of course, master.
	MIS_NrozasPacket = LOG_Running;
	Log_CreateTopic(TOPIC_NrozasPacket,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NrozasPacket,LOG_Running);
	B_LogEntry (TOPIC_NrozasPacket, " I need to go to the warehouse and bring a bag of sulfur and coal to Master Nrozas. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ass_128_Nrozas_HasimVine_Done(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_HasimVine_Done_condition;
	information = dia_Ass_128_Nrozas_HasimVine_Done_info;
	permanent = FALSE ;
	description = " I brought a bag of sulfur and coal. " ;
};

func int dia_Ass_128_Nrozas_HasimVine_Done_condition()
{
	if((MIS_NrozasPacket == LOG_Running) && (Npc_HasItems(other,ItMi_PacketColesulfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_HasimVine_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output (other, self, " DIA_Ass_128_Nrozas_HasimVine_Done_01_01 " );	// I brought a bag of sulfur and coal.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HasimVine_Done_01_02 " );	// Okay, good. Give it here.
	B_GiveInvItems(other,self,ItMi_PacketColesulfur,1);

	if(Npc_HasItems(other,ItKe_PW_Sklad) >= 1)
	{
		Npc_RemoveInvItems(other,ItKe_PW_Sklad,1);
	};

	AI_Output (self, other, " DIA_Ass_128_Nrozas_HasimVine_Done_01_03 " );	// Let's see. Hmmm ... it is as I thought.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HasimVine_Done_01_04 " );	// This amount of sulfur will not be enough for my experiments.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HasimVine_Done_01_05 " );	// I need at least two dozen more pieces.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_HasimVine_Done_01_06 " );	// Where can I get it for you, master?
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HasimVine_Done_01_07 " );	// I can't say for sure. But it seems that in the foothill passage there were once small deposits of sulfur spears.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_HasimVine_Done_01_08 " );	// Look for it there. No need to rush. The amount that you brought will be enough for me for a while.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_HasimVine_Done_01_09 " );	// I got it, master.
	NrozasNeedMoreSulfur = TRUE;
	B_LogEntry (TOPIC_NrozasPacket, " I gave Nrozas the package, but the sulfur was not enough. I need to dig up a couple dozen more pieces of this material. According to Nrozas, there were several sulfur deposits in the foothill pass. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ass_128_Nrozas_Sulfur_Done(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_Sulfur_Done_condition;
	information = dia_Ass_128_Nrozas_Sulfur_Done_info;
	permanent = FALSE ;
	description = " Here are two dozen pieces of sulfuric rock. " ;
};

func int dia_Ass_128_Nrozas_Sulfur_Done_condition()
{
	if((MIS_NrozasPacket == LOG_Running) && (Npc_HasItems(other,ItMi_Sulfur) >= 20) && (NrozasNeedMoreSulfur == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Sulfur_Done_info()
{
	B_GivePlayerXP(450);
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Sulfur_Done_01_01 " );	// Here are two dozen pieces of sulfur.
	B_GiveInvItems(other,self,ItMi_Sulfur,20);
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Sulfur_Done_01_02 " );	// Great. This is more than enough.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Sulfur_Done_01_03 " );	// This will last me for the forseeable future.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Sulfur_Done_01_04 " );	// You did a good job, murid. Now go.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Sulfur_Done_01_05 " );	// If I need you, I'll let you know.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Sulfur_Done_01_06");	//Yes, master.
	MIS_NrozasPacket = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NrozasPacket,LOG_SUCCESS);
	B_LogEntry (TOPIC_NrozasPacket, " I brought Sulfur to Nrozas. He was pleased with my work. " );
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_Poison(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_Poison_condition;
	information = dia_Ass_128_Nrozas_Poison_info;
	permanent = FALSE ;
	description = " I have business with you, master. " ;
};

func int dia_Ass_128_Nrozas_Poison_condition()
{
	if(MIS_PW_PoisonNrozas == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_info()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_01_01 " );	// There is a matter I would like to discuss, master.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_02 " );	// (surprised) And what might that be?
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_03 " );	// Out with it, fool.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_01_04 " );	// Prior Osair told me that you managed to prepare a very powerful poison.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_05 " );	// The man has eyes and ears everywhere it seems...
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_01_06 " );	// Yes, and he would like to get a sample of this poison. With your permission, of course.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_07 " );	// Hmmm. Why not. However, first I need to experience its effect.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_08 " );	// If something goes wrong, understand - my reputation in the Brotherhood will suffer.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_09 " );	// And I can't let that happen.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_01_10");	//Of course.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_11 " );	// I've wanted to send my assistant Kaduin on this mission for a while now.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_12 " );	// But I have a better idea. You will do it.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_13 " );	// Help me test this poison on some very powerful creature.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_14 " );	// And Osair, as a token of my gratitude, will receive his sample.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_15 " );	// Only it should be a truly strong and extremely hardy creature.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_16 " );	// For example, a mountain troll. Or a dragon! No... a troll will do...
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_17 " );	// And don't you dare try it on slaves. Those worthless brutes will die from the vapors alone.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_18 " );	// And I need to evaluate its effects as carefully as possible.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_19 " );	// It's probably not worth mentioning that I need physical evidence of its use on the creature.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_01_20 " );	// Of course. I understood everything, master. You can rely on me.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_21 " );	// Good. Then take this vial.
	B_GiveInvItems(self,other,ItMi_NrozasPoison,1);
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_22 " );	// Be careful with that! Unless, of course, you want to join your ancestors.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_01_23 " );	// Now go. I expect your report as soon as possible.
	B_LogEntry (TOPIC_PW_PoisonNrozas, " Nrozas needs to test the effect of the poison he has created. If I complete this task, he will give me a copy of this potion for Prior Osair. I need to test the effect of the poison on some very strong and hardy creature, for example, a mountain troll . But how to get the troll to swallow a bottle of poison? Maybe it is worth talking about it with Gonzalez? " );
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_Poison_Done(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_Poison_Done_condition;
	information = dia_Ass_128_Nrozas_Poison_Done_info;
	permanent = FALSE ;
	description = " About your poison, master. " ;
};

func int dia_Ass_128_Nrozas_Poison_Done_condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == TRUE) && (OsairGetsNrozasPoison == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_Done_info()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_00 " );	// About your poison, master.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_01 " );	// I'm listening. Have you managed to test my poison?

	if(PoisonDoneFull == TRUE)
	{
		AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_02 " );	// Sorry, I couldn't do it.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_03 " );	// What? Fool! You failed such a middling task?
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_04 " );	// I should never have trusted such a simpleton. Give me the vial back and get out of my sight.
		AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_05 " );	// I'm afraid I have no poison either.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_06 " );	// (angrily) Say that again. Slowly.
		AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_07 " );	// I ... I accidentally spilled it.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_08 " );	// Do you take me for a fool?!
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_09 " );	// Death is too good for you!
		B_LogEntry (TOPIC_PW_PoisonNrozas, " As expected, Nrozas was not pleased. Now I have fight the entire Brotherhood. " );
		PlayerIsPrioratFakeTemp = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else if(PoisonDoneHalf == TRUE)
	{
		AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_10 " );	// As you ordered. I tested it on a young mountain troll.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_11 " );	// Hmmm. An adult nwould have been better, but that will do.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_12 " );	// So what happened?
		AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_13 " );	// The troll died instantly.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_14 " );	// Where is the evidence?

		if(Npc_HasItems(other,ItAt_TrollPoisonTongue) >= 1)
		{	
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_15");	//Here is its tongue.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_16 " );	// Hmmm ... Yes, it looks like it did die of poisoning.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_17 " );	// Well, great job, brother! You, as usual, did not disappoint me.
			AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_18 " );	// What about a small dose of poison for Osair?
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_19 " );	// (inquiringly) You wouldn't, by any chance, have any poison left?
			AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_20 " );	// Please forgive me, master. But I used all the poison in the vial.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_21 " );	// Fine. Osair will have his sample.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_22 " );	// But I need some time to prepare a new batch.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_23 " );	// This will take about a day. So come back tomorrow.
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_24");	//As you wish, master.
			DayOsairPoisonReady = Wld_GetDay();
			B_LogEntry (TOPIC_PW_PoisonNrozas, " As expected, Nrozas was pleased with my success. Now I just have to wait for him to brew new poison and then take it to Osair. " );
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_25 " );	// Ummm ... I don't have them.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_26 " );	// (angrily) How so? I thought I told you to bring evidence of the poison!
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_27 " );	// Or do you just want to trick me?
			AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_28 " );	// No, by no means.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_29 " );	// You know, I appreciate it when my orders are carried out with the proper precision.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_30 " );	// And I hate it when they are not.
			AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_Done_01_31");	//Such a pity. You had potential.
			B_LogEntry (TOPIC_PW_PoisonNrozas, " Nrozas was angry that I did not bring him proof of the use of poison. My carelessness could now cost me my life. " );
			PlayerIsPrioratFakeTemp = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_KILL,1);
		};
	}
	else if(PoisonDoneOneTear == TRUE)
	{
		AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_32 " );	// Sorry, I couldn't do it.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_33 " );	// What? Fool! You failed such a middling task?
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_34 " );	// I should never have trusted such a simpleton. Give me the vial back and get out of my sight.
		
		if(Npc_HasItems(other,ItMi_NrozasPoison) >= 1)
		{	
			B_GivePlayerXP(100);
			AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_Done_01_35");	//Here it is.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_36 " );	// (irritated) Well, at least my poison is intact. Leave now, or die!
			PlayerSafeFromNrozasNo = TRUE;
			B_LogEntry (TOPIC_PW_PoisonNrozas, " Nrozas was angry that I was not able to test his poison. Praise Innos, I managed to keep my head on my shoulders. " );
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_37 " );	// I don't have it with me.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_38 " );	// How so? Where is it? Grew legs and ran off did it?
			AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_Done_01_39 " );	// I... lost it, master.
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_40 " );	// Hmmm ...you think me stupid, do you?
			AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_Done_01_41 " );	// Unfortunate. You had SOME potential at least.
			B_LogEntry (TOPIC_PW_PoisonNrozas, " Nrozas was angry. I couldn’t give him the poison, since I don’t have it with me. Now I must fight the entire Brotherhood. " );
			PlayerIsPrioratFakeTemp = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_KILL,1);
		};
	};

	TellNrozasAboutTest = TRUE;
};

instance DIA_Ass_128_Nrozas_Poison_DoneForOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_Poison_DoneForOsair_condition;
	information = dia_Ass_128_Nrozas_Poison_DoneForOsair_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_Poison_DoneForOsair_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == TRUE) && (OsairGetsNrozasPoison == FALSE) && (DayOsairPoisonReady != FALSE) && (DayOsairPoisonReady < daynow))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_DoneForOsair_info()
{
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_00 " );	// Wait. Here, take this bottle.
	B_GiveInvItems(self,other,ItMi_NrozasPoisonOsair,1);
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_01 " );	// There is enough poison here to satisfy Osair.
	AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_02");	//Thank you, master.
	AI_Output(self,other,"DIA_Ass_128_Nrozas_Poison_DoneForOsair_01_03");	//No need for that.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_Poison_NoDone(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_Poison_NoDone_condition;
	information = dia_Ass_128_Nrozas_Poison_NoDone_info;
	permanent = FALSE ;
	description = " About your poison, master. " ;
};

func int dia_Ass_128_Nrozas_Poison_NoDone_condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == FALSE) && (OsairGetsNrozasPoison == FALSE) && ((NoTrollPoison == TRUE) || (TrollSeeMe == TRUE)))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_NoDone_info()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_NoDone_01_00 " );	// About your poison, master.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_NoDone_01_01 " );	// I'm listening. Have you managed to test my poison?
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_NoDone_01_02 " );	// Sorry, I couldn't do it.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_NoDone_01_03 " );	// What? Fool! You failed such a middling task?
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_NoDone_01_04 " );	// I should never have trusted such a simpleton. Give me the vial back and get out of my sight.
		
	if(Npc_HasItems(other,ItMi_NrozasPoison) >= 1)
	{	
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Ass_128_Nrozas_Poison_NoDone_01_05");	//Here it is.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_NoDone_01_06 " );	// (irritated) Well, at least my poison is intact. Leave now, or die!
		PlayerSafeFromNrozasNo = TRUE;
		B_LogEntry (TOPIC_PW_PoisonNrozas, " Nrozas was angry that I was not able to test his poison. Praise Innos, I managed to keep my head on my shoulders. " );
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_NoDone_01_07 " );	// I don't have it with me.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_NoDone_01_08 " );	// How so? Where is it? Grew legs and ran off did it?
		AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_NoDone_01_09 " );	// I... lost it, master.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_NoDone_01_10 " );	// Hmmm ...you think me stupid, do you?
		AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_NoDone_01_11 " );	// Unfortunate. You had SOME potential at least.
		B_LogEntry (TOPIC_PW_PoisonNrozas, " Nrozas was angry. I couldn’t give him the poison, since I don’t have it with me. Now I must fight the whole Brotherhood. " );
		PlayerIsPrioratFakeTemp = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};

	TellNrozasAboutTest = TRUE;
};

instance DIA_Ass_128_Nrozas_PoisonGiveOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_PoisonGiveOsair_condition;
	information = dia_Ass_128_Nrozas_PoisonGiveOsair_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PoisonGiveOsair_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_PW_PoisonNrozas == LOG_Success) && (OsairGetsNrozasPoison == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PoisonGiveOsair_info()
{
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonGiveOsair_01_01 " );	// How dare you give my poison to Osair without my permission?!
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonGiveOsair_01_02 " );	// For such insolence you will die in agony, hitherto unimaginable to you ...
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Ass_128_Nrozas_PoisonTellOsair(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_PoisonTellOsair_condition;
	information = dia_Ass_128_Nrozas_PoisonTellOsair_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_PoisonTellOsair_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_PW_PoisonNrozas == LOG_Success) && (OsairTellNrozasPoison == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_PoisonTellOsair_info()
{
	AI_Output(self,other,"DIA_Ass_128_Nrozas_PoisonTellOsair_01_01");	//Wait!
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_02 " );	// Tell me, scruffy  looking one, are you the bastard who started the rumor about the failure of my latest poison?
	AI_Output (other, self, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_03 " );	// No, it wasn't me.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_04 " );	// Are you lying to me?!
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_05 " );	// I know it was YOU! There is simply no one mistake.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_06 " );	// And now everyone in the Brotherhood is laughing at me behind my back!
	AI_Output (other, self, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_07 " );	// Prove it, oh master of poisons.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_08 " );	// (angrily) What? You bastard, I will rip out your heart and feed it to the slaves!
	AI_Output (other, self, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_09 " );	// I don't think the rest of the priori will like that very much.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_10 " );	// Beliar take you! However, I know how to silence you permanently.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_11 " );	// I challenge you to the duel of Truth! Prior Haniar will judge us.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_12 " );	// What is that?
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_13 " );	// It's very simple. You will have to prove your innocence in battle with me, or die as the lying dog you are.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_14 " );	// I will wait for you in the arena of the Brotherhood. I hope you have the backbone to face me.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PoisonTellOsair_01_16 " );	// And if not, then my brothers will find you and show you pleasures even Beliar could not imagine!
	MIS_TrueBattle = LOG_Running;
	Log_CreateTopic(TOPIC_TrueBattle,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrueBattle,LOG_Running);
	B_LogEntry (TOPIC_TrueBattle, " For my lies, Nrozas challenged me to a duel of Truth. Now everything depends on me. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_128_Nrozas,"TrueBattle");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TrueBattle");
	Npc_ExchangeRoutine(Ass_144_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_145_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_146_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_147_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_148_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_149_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_138_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_139_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_140_Adept,"DeathMatch");
	Npc_ExchangeRoutine(Ass_141_Adept,"DeathMatch");
};

instance DIA_Ass_128_Nrozas_TrueBattle(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 2 ;
	condition = dia_Ass_128_Nrozas_TrueBattle_condition;
	information = dia_Ass_128_Nrozas_TrueBattle_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_TrueBattle_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Running) && (NrozasStartTrueBattle == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TrueBattle_info()
{
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TrueBattle_01_00 " );	// Soon you'll drown in your bloody vomit, bastard!
	AI_StopProcessInfos(self);
};

instance DIA_Ass_128_Nrozas_TrueBattle_Ready(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_TrueBattle_Ready_condition;
	information = dia_Ass_128_Nrozas_TrueBattle_Ready_info;
	permanent = FALSE ;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_TrueBattle_Ready_condition()
{
	if((MIS_TrueBattle == LOG_Running) && (Npc_GetDistToWP(hero,"PW_HANIAR_DEATHMATCH") <= 500) && (NrozasStartTrueBattle == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TrueBattle_Ready_info()
{
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TrueBattle_Ready_01_00 " );	// I see that you had the courage to face me.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TrueBattle_Ready_01_01 " );	// Now let's see if your sword is as sharp as your rotten tongue.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TrueBattle_Ready_01_02 " );	// And yes ... if you leave the arena, you lose! Which will be tantamount to death.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TrueBattle_Ready_01_03 " );	// Now die, syphilitic dog!
	NrozasStartTrueBattle = TRUE;
	AI_StopProcessInfos(self);
	Wld_SendTrigger("EVT_TRUEBATTLE_DEATHMATCH");
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_128_Nrozas_TrueBattle_Repeat(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_TrueBattle_Repeat_condition;
	information = dia_Ass_128_Nrozas_TrueBattle_Repeat_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_128_Nrozas_TrueBattle_Repeat_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NrozasStartTrueBattle == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TrueBattle_Repeat_info()
{
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TrueBattle_Repeat_01_01 " );	// Come here, scum!
	NrozasStartTrueBattle = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_128_Nrozas_Poison_KillNrozas(C_Info)
{
	npc = Ass_128_Nrozas;
	no. = 1 ;
	condition = dia_Ass_128_Nrozas_Poison_KillNrozas_condition;
	information = dia_Ass_128_Nrozas_Poison_KillNrozas_info;
	permanent = FALSE ;
	description = " Prior Osair is sending you a bottle of wine, master. " ;
};

func int dia_Ass_128_Nrozas_Poison_KillNrozas_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && ((Npc_HasItems(hero,ItFo_BeliarTear) >= 1) || (Npc_HasItems(hero,ItFo_BeliarTear_Haniar) >= 1)))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_Poison_KillNrozas_info()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_KillNrozas_01_00 " );	// Prior Osair sends you a bottle of wine, master.
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_KillNrozas_01_01 " );	// In gratitude for the poison.

	if(HaniarGetGift == FALSE)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ItFo_BeliarTear,1);
		Npc_RemoveInvItems(self,ItFo_BeliarTear,1);
		B_LogEntry (TOPIC_NrozasPoisonGift, " I took the bottle of wine that Osair gave to Nrozas. " );
	}
	else
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(other,self,ItFo_BeliarTear_Haniar,1);
		Npc_RemoveInvItems(self,ItFo_BeliarTear_Haniar,1);
		B_LogEntry (TOPIC_NrozasPoisonGift, " I took the bottle of wine that Osair handed over to Nrozas as Haniar asked me to. " );
	};
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_KillNrozas_01_02 " );	// (admiringly) I can't believe my eyes! Is this 'Beliar's Tear'?
	AI_Output (other, self, " DIA_Ass_128_Nrozas_Poison_KillNrozas_01_03 " );	// I don't really know wine. I just drink it.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_KillNrozas_01_04 " );	// (casually) It's noticeable. After all, 'Beliar's Tear' is not just any wine.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_KillNrozas_01_05 " );	// It is akin to divine nectar! Only a select few are worthy of such ambrosia.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_KillNrozas_01_06 " );	// Even Zuben himself would have envied me this.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_KillNrozas_01_07 " );	// Apparently, Osair finally recognized my genius, and realises I am worthy of such a gift.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_Poison_KillNrozas_01_08 " );	// To my genius!
	MIS_NrozasPoisonGift = LOG_Success;
	Log_SetTopicStatus(TOPIC_NrozasPoisonGift,LOG_Success);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WineDrink");
};

instance DIA_Ass_128_Nrozas_PRETEACH(C_Info)
{
	npc = Ass_128_Nrozas;
	No. = 10 ;
	condition = DIA_Ass_128_Nrozas_PRETEACH_Condition;
	information = DIA_Ass_128_Nrozas_PRETEACH_Info;
	permanent = FALSE ;
	description = " Can I learn something from you, master? " ;
};

func int DIA_Ass_128_Nrozas_PRETEACH_Condition ()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_128_Nrozas_PRETEACH_Info ()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_PRETEACH_01_00 " );	// Can I learn something from you, master?
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PRETEACH_01_01 " );	// Of course. I can teach you the secrets of alchemy.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PRETEACH_01_02 " );	// However, you will need some experience to master it.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_PRETEACH_01_03 " );	// Otherwise, nothing I teach you will make sense.
	NrozasTeachMe = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_PrioratTeacher, " Prior Nrozas can teach me the art of alchemy. " );
};

instance DIA_Ass_128_Nrozas_TEACH(C_Info)
{
	npc = Ass_128_Nrozas;
	No. = 10 ;
	condition = DIA_Ass_128_Nrozas_TEACH_Condition;
	information = DIA_Ass_128_Nrozas_TEACH_Info;
	permanent = TRUE;
	description = " Teach me alchemy, master. " ;
};

func int DIA_Ass_128_Nrozas_TEACH_Condition()
{
	if(NrozasTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_128_Nrozas_TEACH_Info()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_TEACH_01_00 " );	// Teach me alchemy, master.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TEACH_01_01 " );	// Good. What do you want to know?

	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
	Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,Dialog_Back,DIA_Ass_128_Nrozas_TEACH_BACK);

	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Ass_128_Nrozas_TEACH_HEALTH_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Ass_128_Nrozas_TEACH_Health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Лечебный эликсир ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Ass_128_Nrozas_TEACH_Health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Ass_128_Nrozas_TEACH_Perm_Health);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Ass_128_Nrozas_TEACH_Mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Ass_128_Nrozas_TEACH_Mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Ass_128_Nrozas_TEACH_Mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир духа ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Ass_128_Nrozas_TEACH_Perm_Mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир силы ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Ass_128_Nrozas_TEACH_Perm_STR);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Ass_128_Nrozas_TEACH,b_buildlearnstringforalchemy("Эликсир ловкости ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Ass_128_Nrozas_TEACH_Perm_DEX);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Напиток ускорения ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Ass_128_Nrozas_TEACH_stamina);
	};
	if((PLAYER_TALENT_ALCHEMY[18] == FALSE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Эликсир выносливости ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STAMINA)),DIA_Ass_128_Nrozas_TEACH_perm_stamina);
	};
};

func void DIA_Ass_128_Nrozas_TEACH_BACK()
{
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

func void DIA_Ass_128_Nrozas_TEACH_perm_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_STAMINA);
	Info_ClearChoices(DIA_Ass_128_Nrozas_TEACH);
};

instance Ass_129_DeadNrozas_PreHALLO(C_Info)
{
	npc = Ass_129_DeadNrozas;
	no. = 1 ;
	condition = Ass_129_DeadNrozas_PreHALLO_condition;
	information = Ass_129_DeadNrozas_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int Ass_129_DeadNrozas_PreHALLO_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void Ass_129_DeadNrozas_PreHALLO_info()
{
	Snd_Play("MYSTERY_04");
	AI_StopProcessInfos(self);
};

var int NrozasTeachMakePoison;

instance DIA_Ass_128_Nrozas_TeachPoisonMake(C_Info)
{
	npc = Ass_128_Nrozas;
	No. = 10 ;
	condition = DIA_Ass_128_Nrozas_TeachPoisonMake_Condition;
	information = DIA_Ass_128_Nrozas_TeachPoisonMake_Info;
	permanent = FALSE ;
	description = " Is there anything special that I can only learn from you? " ;
};

func int DIA_Ass_128_Nrozas_TeachPoisonMake_Condition()
{
	if(NrozasTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_128_Nrozas_TeachPoisonMake_Info()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_TeachPoisonMake_01_00 " );	// Is there anything special that I can only learn from you?
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoisonMake_01_01 " );	// Hmmm ... (appraising) As you probably already know, my true talent is the preparation of various poisons.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoisonMake_01_02 " );	// I have no equal in this, for any of my poisons is a work of art.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoisonMake_01_03 " );	// I can show you how you can make the simplest of them.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoisonMake_01_04 " );	// Or teach you how to cover blades or arrows with it.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoisonMake_01_05 " );	// But all of this will require your utmost attention.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoisonMake_01_06 " );	// Because the slightest mistake can easily kill you.
	NrozasTeachMakePoison = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_PrioratTeacher, " Prior Nrozas can teach me how to make poisons, and also show me how to coat blades or arrows with poison. " );
};

instance DIA_Ass_128_Nrozas_TeachPoison(C_Info)
{
	npc = Ass_128_Nrozas;
	n ° = 800 ;
	condition = dia_Ass_128_Nrozas_TeachPoison_condition;
	information = dia_Ass_128_Nrozas_TeachPoison_info;
	permanent = TRUE;
	description = " Teach me how to handle poisons. " ;
};

func int dia_Ass_128_Nrozas_TeachPoison_condition()
{
	if((NrozasTeachMakePoison == TRUE) && ((PoisonArrowKnow == FALSE) || (PoisonBladeKnow == FALSE) || (MakePoisonKnow == FALSE)))
	{
		return TRUE;
	};
};

func void dia_Ass_128_Nrozas_TeachPoison_info()
{
	AI_Output (other, self, " DIA_Ass_128_Nrozas_TeachPoison_01_01 " );	// Teach me how to handle poisons.
	AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_01_02 " );	// What do you want to know?
	Info_ClearChoices(DIA_Ass_128_Nrozas_TeachPoison);
	Info_AddChoice(DIA_Ass_128_Nrozas_TeachPoison,Dialog_Back,DIA_Ass_128_Nrozas_TeachPoison_BACK);
	
	if(PoisonArrowKnow == FALSE)
	{
		Info_AddChoice (DIA_Ass_128_Nrozas_TeachPoison, " Making Poisoned Arrows (Training Points: 5, Cost: 2500 Coins) " , DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow);
	};
	if(PoisonBladeKnow == FALSE)
	{
		Info_AddChoice (DIA_Ass_128_Nrozas_TeachPoison, " Cover the blade of my weapon with poison (Training points: 5, Cost: 3000 coins) " , DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade);
	};
	if(MakePoisonKnow == FALSE)
	{
		Info_AddChoice (DIA_Ass_128_Nrozas_TeachPoison, " Teach me to cook poisons (Training points: 3, Cost: 1500 coins) " , DIA_Ass_128_Nrozas_TeachPoison_MakePoison);
	};
	if(ResistPoisonKnow == FALSE)
	{
		Info_AddChoice (DIA_Ass_128_Nrozas_TeachPoison, " Teach Me To Resist Poison (Training Points: 10, Cost: 3000 Coins) " , DIA_Ass_128_Nrozas_TeachPoison_Resist);
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_BACK()
{
	Info_ClearChoices(DIA_Ass_128_Nrozas_TeachPoison);
};

func void DIA_Ass_128_Nrozas_TeachPoison_Resist()
{
	var int diet;
	var int money;

	AI_Output (other, self, " DIA_Constantino_TeachPoison_Resist_01_00 " );	// Teach me to resist poison.

	cost = 10 ;
	money = 3000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output (self, other, " DIA_Constantino_TeachPoison_Resist_01_01 " );	// Sorry, but you don't have enough experience for this yet!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output (self, other, " DIA_Constantino_TeachPoison_Resist_01_02 " );	// Sorry, but I won't do this for free!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output (self, other, " DIA_Constantino_TeachPoison_Resist_01_03 " );	// Poison takes time to work its deadly magic.
		AI_Output (self, other, " DIA_Constantino_TeachPoison_Resist_01_04 " );	// You must make sure that your body expels it as quickly as possible.
		AI_Output (self, other, " DIA_Constantino_TeachPoison_Resist_01_05 " );	// Keep moving and sweat more! Then you increase your chance of survival.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print ( " Learned : Poison Resistance " );
		ResistPoisonKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow()
{
	var int diet;
	var int money;

	AI_Output (other, self, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_00 " );	// Teach me how to make poison arrows.

	cost = 5 ;
	money = 2500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_01 " );	// You don't have enough experience!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_02 " );	// You are low on gold!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_03 " );	// You need poison and some arrows.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_04 " );	// Carefully dip the arrowheads into the flask.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_05 " );	// You need a steady hand. So be careful.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print ( " Crafting recipe studied - 'Poisoned Arrows' " );
		PoisonArrowKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry (TOPIC_TalentAlchemy, " Ingredients for making poison arrows: twenty arrows and a bottle of poison. " );
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade()
{
	var int diet;
	var int money;

	AI_Output (other, self, " DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_00 " );	// Teach me to cover weapons with poison.

	cost = 5 ;
	money = 3000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_01 " );	// You don't have enough experience!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_02 " );	// You are low on gold!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_03 " );	// First of all, you need poison and weapons.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_04 " );	// Don't put the whole blade in the poison.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_05 " );	// Apply it thinly to the blade and tip.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonBlade_01_06 " );	// And don't cut yourself!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print ( " Learned : Poisoned Weapon Making " );
		PoisonBladeKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry (TOPIC_TalentAlchemy, " Ingredients for making poisoned weapons: blade and poison bottle. " );
	};
};

func void DIA_Ass_128_Nrozas_TeachPoison_MakePoison()
{
	var int diet;
	var int money;

	AI_Output (other, self, " DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_00 " );	// Teach me how to make poisons.

	cost = 3 ;
	money = 1500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_01 " );	// You don't have enough experience!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_PoisonArrow_01_02 " );	// You are low on gold!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_03 " );	// In fact, poison is nothing more than an ordinary healing potion, corrupted.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_04 " );	// You need a recipe and ingredients.
		AI_Output (self, other, " DIA_Ass_128_Nrozas_TeachPoison_MakePoison_01_05 " );	// Mix everything together well. When the mixture becomes sticky, you're done.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print ( " Alchemy recipe researched - 'Poison' " );
		MakePoisonKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry (TOPIC_TalentAlchemy, " Ingredients for making poison: bottle of water, stem of marsh grass, spider mandible, or blood fly sting. " );
	
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print ( " Intellect + 1 " );
		};
	};
};
