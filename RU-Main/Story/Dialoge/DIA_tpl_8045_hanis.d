

instance DIA_HANIS_EXIT(C_Info)
{
	npc = tpl_8045_hanis;
	nr = 999;
	condition = dia_hanis_exit_condition;
	information = dia_hanis_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hanis_exit_condition()
{
	return TRUE;
};

func void dia_hanis_exit_info()
{
	AI_StopProcessInfos(self);
};


DIA_HANIS_NOFOREVER (C_Info) instances
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_noforever_condition;
	information = dia_hanis_noforever_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_hanis_noforever_condition()
{
	if (MIS_PrioratStart ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_hanis_noforever_info()
{
	AI_Output(other,self,"DIA_Hanis_NoForever_01_00");	//Кто вы?
	AI_Output(self,other, " DIA_Hanis_NoForever_01_01 " );	// (proudly) I am Khanis, Guardian of the Brotherhood. And those guys you see are swamp collectors.
};


DIA_HANIS_PSIINFO (C_Info) instances
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_psiinfo_condition;
	information = dia_hanis_psiinfo_info;
	permanent = FALSE;
	description = " Brotherhood? Which Brotherhood? " ;
};


func int dia_hanis_psiinfo_condition()
{
	if ( ! Npc_KnowsInfo(hero , dia_tpl_8014_templer_first ) &&  ! Npc_KnowsInfo ( hero , dia_hanis_psiinfo ) &&  ! 
	{
		return TRUE;
	};
};

func void dia_hanis_psiinfo_info()
{
	AI_Output(other,self, " DIA_Hanis_PsiInfo_01_00 " );	// Brotherhood? What Brotherhood?
	AI_Output(self,other, " DIA_Hanis_PsiInfo_01_01 " );	// Brotherhood of the Sleeper! Although now we just call it the Brotherhood.
	AI_Output(other,self, " DIA_Hanis_PsiInfo_01_02 " );	// But I thought that after the fall of the barrier, the Brotherhood of the Sleeper ceased to exist?
	AI_Output(self,other, " DIA_Hanis_PsiInfo_01_03 " );	// Not really. Of course, some of our brothers died, and others succumbed to the evil influence of demonic forces...
	AI_Output(self,other, " DIA_Hanis_PsiInfo_01_04 " );	// But still, many managed to survive.
	AI_Output(other,self, " DIA_Hanis_PsiInfo_01_05 " );	// Where is your camp?
	AI_Output(self,other, " DIA_Hanis_PsiInfo_01_06 " );	// Go towards the passage to the Valley of Mines. Not far from the passage itself there is a small farm.
	AI_Output(self,other, " DIA_Hanis_PsiInfo_01_07 " );	// There, at a distance from it, is our new abode.
};


instance DIA_HANIS_HELLO (C_Info)
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_hello_condition;
	information = dia_hanis_hello_info;
	permanent = TRUE;
	description = " How is the bog harvest going? " ;
};


func int dia_hanis_hello_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_hanis_noforever ) && ( MIS_PriorityStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hanis_hello_info()
{
	AI_Output(other,self, " DIA_Hanis_Hello_01_00 " );	// How is the bog harvest going?
	AI_Output(self,other,"DIA_Hanis_Hello_01_01");	//Неплохо.
	AI_Output(other,self, " DIA_Hanis_Hello_01_02 " );	// You're not one of the talkative ones, are you?
	AI_Output(self,other,"DIA_Hanis_Hello_01_03");	//Да.
};


DIA_HANIS_GIVEPLANT (C_Info) instances
{
	npc = tpl_8045_hanis;
	nr = 5;
	condition = dia_hanis_giveplant_condition;
	information = dia_hanis_giveplant_info;
	permanent = TRUE;
	description = " Idol Kadar sent me. " ;
};

func int dia_hanis_giveplant_condition()
{
	if (( MY_PLANTFORBAALCADAR  == LOG_Running) && ( FIRSTGROUPCHECK  ==  FALSE ) && (other.guild ==  GIL_CHECK ) && Npc_KnowsInfo(hero,dia_hanis_noforever) && (MY_PriorityStart ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_hanis_giveplant_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self, " DIA_Hanis_GivePlant_01_00 " );	// Idol Kadar sent me.
	AI_Output(self,other, " DIA_Hanis_GivePlant_01_01 " );	// What does the Guru want?
	AI_Output(other,self, " DIA_Hanis_GivePlant_01_02 " );	// He asked me to deliver him a new batch of bogweed that you collected.

	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE))
	{
		AI_Output(self,other, " DIA_Hanis_GivePlant_01_03 " );	// Okay, so I don't have to go myself. Here, take it.
		B_GiveInvItems(self,other,ItPl_SwampHerb,100);
		AI_Output(self,other, " DIA_Hanis_GivePlant_01_04 " );	// Don't forget to check out other faucets if you haven't already.
		AI_Output(self,other, " DIA_Hanis_GivePlant_01_05 " );	// Otherwise, the daily fee may seem too small to some, and some may even think that you sold half, hehe.
		FIRSTGROUPSEK = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Hanis_GivePlant_01_06 " );	// I doubt Idol Kadar sent you. You do not look like a man from our Brotherhood.
		AI_Output(self,other, " DIA_Hanis_GivePlant_01_07 " );	// I won't give you a swamp - don't even dream!
	};
};

instances of DIA_Hanis_NewPlants (C_Info)
{
	npc = tpl_8045_hanis;
	nr = 1;
	condition = DIA_Hanis_NewPlants_condition;
	information = DIA_Hanis_NewPlants_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Hanis_NewPlants_condition()
{
    if((Kapitel < 3) && (FIRSTGROUPSEK == TRUE) && (hero.attribute[ATR_STRENGTH] >= 100))
	{
		return TRUE;
	};
};

func void DIA_Hanis_NewPlants_info()
{
	AI_Output(self,other,"DIA_Hanis_NewPlants_01_01");	//Постой...
	AI_Output(other,self, " DIA_Hanis_NewPlants_01_02 " );	// What else?
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_03 " );	// (appreciatively) You just seem like a pretty tough guy.
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_04 " );	// And now I could use the help of such a strong person as you.
	AI_Output(other,self, " DIA_Hanis_NewPlants_01_05 " );	// Let's get down to business.
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_06 " );	// Good. The fact is that one of the mentors of our Brotherhood, Idol Kadar, gave me one small assignment.
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_07 " );	// In the name of the prosperity of our community, he commissioned me to explore nearby places to establish a new plantation of the herb of insight and enlightenment of consciousness.
	AI_Output(other,self, " DIA_Hanis_NewPlants_01_08 " );	// Hmmm... And if it's simpler?
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_09 " );	// In other words, I needed to find a new place for a bogweed plantation.
	AI_Output(other,self, " DIA_Hanis_NewPlants_01_10 " );	// And what's the matter?
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_11 " );	// I found a place, but a pack of huge lizards has recently settled there.
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_12 " );	// Of course, I could handle them myself... (thoughtfully) But...
	AI_Output(other,self, " DIA_Hanis_NewPlants_01_13 " );	// And what confuses you?
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_14 " );	// It's just that while I'm tinkering with their giblets, no one knows what might happen in the camp during my absence.
	AI_Output(other,self, " DIA_Hanis_NewPlants_01_15 " );	// What can happen?
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_16 " );	// Why, these novices, except for their hoes, do not really know how to hold anything in their hands.
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_17 " );	// Recently, a small mole rat crawled into their tent... (shaking his head)
	AI_Output(self,other, " DIA_Hanis_NewPlants_01_18 " );	// So these sluts raised such an op, as if Beliar himself had come to them!
	Info_ClearChoices(DIA_Hanis_NewPlants);
	Info_AddChoice(DIA_Hanis_NewPlants, " What do you want me to do? " ,DIA_Hanis_NewPlants_yes);
	Info_AddChoice(DIA_Hanis_NewPlants, " I'm not interested in the Brotherhood. " ,DIA_Hanis_NewPlants_no);
};
	
func void DIA_Hanis_NewPlants_yes()
{
	AI_Output(other,self, " DIA_Hanis_NewPlants_yes_01_00 " );	// What is required of me?
	AI_Output(self,other, " DIA_Hanis_NewPlants_yes_01_01 " );	// Isn't that clear? Go and kill all those vile creatures instead of me, of course.
	AI_Output(self,other, " DIA_Hanis_NewPlants_yes_01_02 " );	// In gratitude for this, I'll give you some gold or some stalks of swamp grass.
	AI_Output(other,self, " DIA_Hanis_NewPlants_yes_01_03 " );	// Okay, I can handle a couple of lizards. Where is that place?
	AI_Output(self,other, " DIA_Hanis_NewPlants_yes_01_04 " );	// Just keep walking up this slope. I'm sure you won't miss it.
	AI_Output(other,self, " DIA_Hanis_NewPlants_yes_01_05 " );	// Okay, I'll be right back.
	MIS_HanisPlants = LOG_Running;
	Log_CreateTopic(TOPIC_HanisPlants,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HanisPlants,LOG_Running);
	B_LogEntry(TOPIC_HanisPlants, " Guardian Hanis has asked for a place he likes to be cleared of lizards for a new bog plantation. If I go further down the slope from the harvester's tent, I won't miss this place. " );
    	AI_StopProcessInfos(self);
	Wld_InsertNpc(HanisWaran_01,"FP_ROAM_HANISLIZARD_02");
	Wld_InsertNpc(HanisWaran_02,"FP_ROAM_HANISLIZARD_04");
	Wld_InsertNpc(HanisWaran_03,"FP_ROAM_HANISLIZARD_06");
	Wld_InsertNpc(HanisWaran_04,"FP_ROAM_HANISLIZARD_08");
	Wld_InsertNpc(HanisWaran_05,"FP_ROAM_HANISLIZARD_10");
};

func void DIA_Hanis_NewPlants_no()
{
	AI_Output(other,self, " DIA_Hanis_NewPlants_no_01_00 " );	// The affairs of the Brotherhood do not interest me.
	AI_Output(self,other, " DIA_Hanis_NewPlants_no_01_01 " );	// How do you say...
	AI_StopProcessInfos(self);
};

instances DIA_Hanis_NewPlants_Done (C_Info)
{
	npc = tpl_8045_hanis;
	nr = 1;
	condition = DIA_Hanis_NewPlants_Done_condition;
	information = DIA_Hanis_NewPlants_Done_info;
	permanent = FALSE;
	description = " All lizards are dead! " ;
};

func int DIA_Hanis_NewPlants_Done_condition()
{
	if ((MIS_HanisPlants == LOG_Running) && (Npc_IsDead(HanisWaran_01) ==  TRUE ) && (Npc_IsDead(HanisWaran_02) ==  TRUE ) && (Npc_IsDead(HanisWaran_03) ==  TRUE ) && (Npc_IsDead(HanisWaran_04) ==  TRUE ) && ( Npc_IsDead(HanisWaran_05) ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Hanis_NewPlants_Done_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self, " DIA_Hanis_NewPlants_Done_01_01 " );	// All lizards are dead!
	AI_Output(self,other, " DIA_Hanis_NewPlants_Done_01_02 " );	// Are you sure about this?
	AI_Output(other,self, " DIA_Hanis_NewPlants_Done_01_03 " );	// Why does no one ever believe me from the first word? That's why?
	AI_Output(self,other, " DIA_Hanis_NewPlants_Done_01_04 " );	// Okay, I believe you. I hope Idol Kadar likes this place too.
	AI_Output(other,self, " DIA_Hanis_NewPlants_Done_01_05 " );	// What about my reward?
	AI_Output(self,other, " DIA_Hanis_NewPlants_Done_01_06 " );	// As we agreed. What you choose?
	MIS_HanisPlants = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HanisPlants,LOG_SUCCESS);
	B_LogEntry(TOPIC_HanisPlants, " Hanis was pleased that I managed to deal with the lizards. " );
	Info_ClearChoices(DIA_Hanis_NewPlants_Done);
	Info_AddChoice(DIA_Hanis_NewPlants_Done, " I need gold. " ,DIA_Hanis_NewPlants_Done_Gold);
	Info_AddChoice(DIA_Hanis_NewPlants_Done, " Give me a swamp. " ,DIA_Hanis_NewPlants_Done_Herb);
	Info_AddChoice(DIA_Hanis_NewPlants_Done, " What else can you suggest me? " ,DIA_Hanis_NewPlants_Done_More);
};

func void DIA_Hanis_NewPlants_Done_Gold()
{
	AI_Output(other,self, " DIA_Hanis_NewPlants_Done_Gold_01_00 " );	// I need gold.
	AI_Output(self,other, " DIA_Hanis_NewPlants_Done_Gold_01_01 " );	// Good. Here is all the gold I have.
	B_GiveInvItems(self,other,ItMi_Gold,350);
	AI_StopProcessInfos(self);
};

func void DIA_Hanis_NewPlants_Done_Herb()
{
	AI_Output(other,self, " DIA_Hanis_NewPlants_Done_Herb_01_00 " );	// Give me a swamp.
	AI_Output(self,other, " DIA_Hanis_NewPlants_Done_Herb_01_01 " );	// Good. Here are your fifty stems.
	B_GiveInvItems(self,other,ItPl_SwampHerb,50);
	AI_Output(self,other, " DIA_Hanis_NewPlants_Done_Herb_01_02 " );	// By the way, that's almost a daily allowance for our pickers! So use it wisely.
	AI_StopProcessInfos(self);
};
	
func void DIA_Hanis_NewPlants_Done_More()
{
	AI_Output(other,self, " DIA_Hanis_NewPlants_Done_More_01_00 " ); // What else can you offer me?

	if(hero.attribute[ATR_STRENGTH] >= 150)
	{
		AI_Output(self,other, " DIA_Hanis_NewPlants_Done_More_01_01 " ); // (appreciatively) You don't seem to care much for a simple reward.
		AI_Output(other,self, " DIA_Hanis_NewPlants_Done_More_01_02 " ); // You're right. I need something special.
		AI_Output(self,other, " DIA_Hanis_NewPlants_Done_More_01_03 " ); // Okay. I will give you an elixir of strength. This is a great reward for a warrior like you!
		B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Hanis_NewPlants_Done_More_01_06 " ); // Nothing. Isn't that enough for you?
		AI_Output(other,self, " DIA_Hanis_NewPlants_Done_More_01_07 " ); // Of course! I need more than just swamp grass or gold.
		AI_Output(other,self, " DIA_Hanis_NewPlants_Done_More_01_08 " ); // So go ahead - turn your pockets inside out! And I'll see what suits me.
		AI_Output(self,other, " DIA_Hanis_NewPlants_Done_More_01_09 " ); // Guess I should teach you some manners, brat!
		AI_Output(self,other, " DIA_Hanis_NewPlants_Done_More_01_10 " ); // But so be it - I won't break your jaw today.
		AI_Output(self,other, " DIA_Hanis_NewPlants_Done_More_01_11 " ); // Consider that this is your worthy reward...
		AI_StopProcessInfos(self);
	};
};

// -----------------PRIORITY--------------------



instance DIA_Hanis_PrioratStart (C_Info)
{
	npc = tpl_8045_hanis;
	nr = 1;
	condition = DIA_Hanis_PrioratStart_condition;
	information = DIA_Hanis_PrioratStart_info;
	permanent = FALSE;
	description = " What happened here? " ;
};

func int DIA_Hanis_PrioratStart_condition()
{

	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hanis_PrioratStart_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Hanis_PrioratStart_01_00 " );		// What happened here?
	AI_Output(self,other, " DIA_Hanis_PrioratStart_01_01 " );		// At us... (overcoming pain) We were attacked! I don't know who it was.
	AI_Output(self,other, " DIA_Hanis_PrioratStart_01_02 " );		// They took us by surprise... The only thing I managed to do was seriously injure one of the attackers.
	AI_Output(other,self, " DIA_Hanis_PrioratStart_01_03 " );		// What happened to the others?
	AI_Output(self,other, " DIA_Hanis_PrioratStart_01_04 " );		// I don't know... It looks like they took them with them.
	AI_Output(other,self, " DIA_Hanis_PrioratStart_01_05 " );		// Okay, hold on! I'll get help soon.
	AI_Output(self,other, " DIA_Hanis_PrioratStart_01_06 " );		// It's not worth it... I already feel that my days are numbered. My body is getting weaker every second...
	AI_Output(self,other, " DIA_Hanis_PrioratStart_01_07 " );		// Most likely, this is some kind of potent poison. Only the strength of my spirit does not allow him to completely master my body.
	AI_Output(other,self, " DIA_Hanis_PrioratStart_01_08 " );		// Then how can I help?
	AI_Output(self,other, " DIA_Hanis_PrioratStart_01_09 " );		// Better promise me you'll try to save our acolytes.
	AI_Output(other,self, " DIA_Hanis_PrioratStart_01_10 " );		// Good. Do you know where the attackers went?
	AI_Output(self,other, " DIA_Hanis_PrioratStart_01_11 " );		// Nooo...(choking blood) But I'm pretty sure whoever I hurt must be bleeding.
	AI_Output(self,other, " DIA_Hanis_PrioratStart_01_12 " );		// And... maybe you can... track him down...

	if(MIS_HanisPlants == LOG_Running)
	{
		MIS_HanisPlants = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_HanisPlants);
	};

	self.aivar[ 93 ] = FALSE ;
	B_LogEntry_Quiet(TOPIC_PrioratStart, " I arrived too late. Unknown people attacked Khanis' guard camp! They mortally wounded him and took the acolytes with them. I think I need to report this to the Namib Idol immediately. This treacherous attack and the recent loss of acolytes from the Brotherhood camp may not random. However, before I do that, I should try to track down the attackers. Hanis badly wounded one of them, and he certainly could not get far. " );
	Info_ClearChoices(DIA_Hanis_PrioratStart);
	Info_AddChoice(DIA_Hanis_PrioratStart, " Эй... " ,DIA_Hanis_PrioratStart_Death);
};

func void DIA_Hanis_PrioratStart_Death()
{
	AI_StopProcessInfos(self);
	PsiCamp_03_Ok = TRUE;
	Wld_SendTrigger("NW_ASS_BLOOD_02");
	Wld_InsertNpc(Ass_120_Adept,"NW_FOREST_VINOSKELLEREI_01");
};
