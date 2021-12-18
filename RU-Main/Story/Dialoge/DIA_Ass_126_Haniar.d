
instance DIA_Ass_126_Haniar_EXIT(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 999;
	condition = dia_Ass_126_Haniar_exit_condition;
	information = dia_Ass_126_Haniar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_Ass_126_Haniar_exit_condition()
{
	return TRUE;
};

func void dia_Ass_126_Haniar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_PreHALLO(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_PreHALLO_condition;
	information = dia_Ass_126_Haniar_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_PreHALLO_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HaniarMurid == FALSE) && (HaniarMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreHALLO_01_00");	//Why are you bothering me?
};

instance DIA_Ass_126_Haniar_PreHALLO_Kill(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_PreHALLO_Kill_condition;
	information = dia_Ass_126_Haniar_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HaniarMurid == FALSE) && (TiamantMurid == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_126_Haniar_HALLO(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_hallo_condition;
	information = dia_Ass_126_Haniar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_hallo_condition()
{
	if(TiamantMurid == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_hallo_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_01");	//Wait, novice. I have heard rumors that Master Tiamant has made you his murid. It's true?
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_01_02");	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_03");	//Well, apparently, you really made a strong impression on him, for him to honor you in such a way.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_04");	//And in truth, I'm glad we finally have a worthy contender for the title of Shadow.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_05");	//But let's not talk about that anymore. This is his decision, and no one else's.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_06");	//But back to you.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_07");	//I'm sure you are asking yourself why I wanted to speak to you.
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_01_08");	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_09");	//Well, don't be surprised. You have attracted the attention of three Masiaf Priests, and this did not slip by me.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_10");	//I offer you a chance to prove yourself to me, now.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_11");	//It is time for me to evaluate you.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_12");	//Are you ready to take my test?
	Info_ClearChoices(DIA_Ass_126_Haniar_HALLO);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"(nod silently)",DIA_Ass_126_Haniar_HALLO_M1);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"I'm not sure I can handle it.",DIA_Ass_126_Haniar_HALLO_M2);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"No, I'm not ready for this.",DIA_Ass_126_Haniar_HALLO_M3);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Of course I'm ready!",DIA_Ass_126_Haniar_HALLO_M4);
};

func void DIA_Ass_126_Haniar_HALLO_M2()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M2_01_01");	//I'm not sure if I can handle it.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M2_01_02");	//You disappoint me, acolyte. I expected more from you.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M2_01_03");	//But if so, then you should know that our Brotherhood has no room for the weak.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M2_01_04");	//I'm sure you understand what this means for you. Prepare yourself.
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill," Haniar was not too happy with my explanations. Now I have only one thing left - to fight for my life against the Brotherhood! " );
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_HALLO_M3()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M3_01_01");	//No, I'm not ready for this.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M3_01_02");	//That is... unfortunate.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M3_01_03");	//This is where you die, weak one!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill," Haniar was not too happy with my explanations. Now I have only one thing left - to fight for my life against the Brotherhood! " );
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_HALLO_M4()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M4_01_01");	//Of course I'm ready!
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_02");	//Have you forgotten our rules so soon?
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_03");	//For an undiscipled answer like that, there can be only one response: Death.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_04");	//However, given your past service to the Brotherhood...
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_05");	//...I will forgive your insolence this once!
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_06");	//However, in the future, choose your words more carefully.
};

func void DIA_Ass_126_Haniar_HALLO_M1()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M1_01_01");	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M1_01_02");	//Very good! Now listen to me carefully.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M1_01_03");	//One of our brothers was killed recently. His name was Hasim Klykol.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M1_01_04");	//Have you heard anything about this?
	Info_ClearChoices(DIA_Ass_126_Haniar_HALLO);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO," Of course. I killed him. ",DIA_Ass_126_Haniar_HALLO_M6);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO," I know he's dead. ",DIA_Ass_126_Haniar_HALLO_Ok);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO," No, I haven't. ",DIA_Ass_126_Haniar_HALLO_M5);
};

func void DIA_Ass_126_Haniar_HALLO_M5()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M5_01_01");	//No, I haven't.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_02");	//One of the most respected brothers has been killed, and you don't even know about it?
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_03");	//I find that quite strange, since absolutely EVERYONE knows about it. Everyone but you.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_04");	//So either you are deaf and blind, an idiot, or a liar.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_05");	//All this tells me only one thing: You cannot be trusted.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_06");	//Observe what we do with those unworthy of our trust...
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill," Haniar was not too happy with my explanations. Now I have only one thing left - to fight for my life with all the Brotherhood! " );
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_HALLO_M6()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M6_01_01");	//Of course. I killed him.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_02");	//You? You killed the elite shadow of Masyaf? You expect me to believe that?
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_03");	//Hasim was a great warrior. Neither careless nor stupid.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_04");	//But okay, let's say I believed you. Answer me this: why did you need to kill him?
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M6_01_05");	//I did it by order of Prior Tiamant.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_06");	//Tiamant? Very interesting.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_07");	//You are either very brave to admit this to me, or you are a madman.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_08");	//Although, on the other hand, you do not give the impression of a madman, ready to easily part with your life.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_09");	//I will need some time to think on this.
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M6_01_12");	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_10");	//For now, go pray to Beliar to assuage your guilt.
	MIS_HasimKill = LOG_SUCCESS;
	HaniarKnowKiller = TRUE;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill," Haniar began to ask me about Hasim's fate, and I decided to tell him the truth. Of course, it may cost me my head, however, if Haniar does make sure that my words are true, perhaps it will play into my hands more. Now, in order to somehow smooth out my guilt, I should pray to Beliar for the soul of Hasim. I'm sure Gonzalez will be interested to know how the whole story ended. ");	
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_HALLO_Ok()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_Ok_01_01");	//I know he's dead.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_02");	//Of course, and as you can imagine, I am not pleased.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_03");	//But what concerns me most is that I knew nothing about it. That is unacceptable.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_04");	//Therefore, your first priority is to find out who is behind this murder. And as quickly as possible.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_05");	//Of course it won't be easy, but I believe in you. Otherwise, you would not have become the murid of the three priori.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_06");	//Now go. Come to me first if you discover anything.
	B_LogEntry(TOPIC_HasimKill," Haniar began to ask me about Hasim's fate, but I did not disclose the whole truth to him, fearing the consequences. Now I am tasked with finding the killer, and it’s even a little fun looking for myself. Perhaps it is worth consulting with Gonzalez about this. " );		
	HaniarSeekKiller = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_Quest1(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_Quest1_condition;
	information = DIA_Ass_126_Haniar_Quest1_info;
	permanent = FALSE;
	description = " About Hasim's killer ... ";
};

func int DIA_Ass_126_Haniar_Quest1_condition()
{
	if((HaniarSeekKiller == TRUE) && (MIS_HasimKill != LOG_SUCCESS) && (HaniarKnowKiller == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_Quest1_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_01_01");	//About Hasim's killer ...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_01_02");	//Good, tell me everything you know!

	Info_ClearChoices(DIA_Ass_126_Haniar_Quest1);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1," I couldn't find out anything about this. ",DIA_Ass_126_Haniar_Quest1_M1);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"I killed Hasim.",DIA_Ass_126_Haniar_Quest1_M2);

	if(Npc_HasItems(other,ItWr_TiamantPaperToHaniar) >= 1)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1," I have a letter for you from Prior Tiamant, master. ",DIA_Ass_126_Haniar_Quest1_Ok);
	};
};


func void DIA_Ass_126_Haniar_Quest1_Ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_Ok_01_01");	//I have a letter for you from Prior Tiamant, Master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_02");	//Letter? Let me see.
	B_GiveInvItems(other,self,ItWr_TiamantPaperToHaniar,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_03");	//So Tiamant himself is standing up for you.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_04");	//All right, we will set this matter aside for now.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_05");	//But first I must know.Why did you hide this from me?
	Info_ClearChoices(DIA_Ass_126_Haniar_Quest1);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"The order came from Prior Tiamant.",DIA_Ass_126_Haniar_Quest1_M3);	
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Unlike Prior Tiamant's, my word is worth little.",DIA_Ass_126_Haniar_Quest1_M7);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"I was afraid to tell the truth.",DIA_Ass_126_Haniar_Quest1_M4);	
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"I made a mistake. It won't happen again.",DIA_Ass_126_Haniar_Quest1_M5);	
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"I decided to investigate the situation first.",DIA_Ass_126_Haniar_Quest1_M6);
};


func void DIA_Ass_126_Haniar_Quest1_M1()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M1_01_01");	//I couldn't find out anything about this, prior.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_02");	//Then wy bother me with this?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_03");	//Is my time a trifling thing to be wasted?
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M1_01_04");	//But I...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_04");	//You are clearly an incompetent fool.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_05");	//In the name of Beliar, you must die!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill," Haniar was not too happy with my explanation. Now I have only one thing left - to fight for my life with all the Brotherhood! " );	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M2()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_01");	//I killed Hasim.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_02");	//You? You killed the elite shadow of Masyaf? You expect me to believe that?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_03");	//Hasim was a great warrior. Neither careless nor stupid.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_04");	//But okay, let's say I believed you. Answer me this: why did you need to kill him?
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_05");	//I did it by order of Prior Tiamant.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_06");	//Tiamant? (thoughtfully) Can you prove this?

	if(Npc_HasItems(other,ItWr_TiamantPaperToHaniar) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_07");	//I have a letter for you from Prior Tiamant, Master.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_08");	//Letter? Let me see.
		B_GiveInvItems(other,self,ItWr_TiamantPaperToHaniar,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_09");	//So Tiamant himself is standing up for you.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_10");	//All right, we will set this matter aside for now.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_11");	//But first I must know.Why did you hide this from me?
		Info_ClearChoices(DIA_Ass_126_Haniar_Quest1);
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"The order came from Prior Tiamant.",DIA_Ass_126_Haniar_Quest1_M3);	
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Unlike Prior Tiamant's, my word is worth little.",DIA_Ass_126_Haniar_Quest1_M7);
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"I was afraid to tell the truth.",DIA_Ass_126_Haniar_Quest1_M4);	
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"I made a mistake. It won't happen again..",DIA_Ass_126_Haniar_Quest1_M5);	
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"I decided to investigate the situation first.",DIA_Ass_126_Haniar_Quest1_M6);
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_12");	//I... I'm going to need more time...
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_13");	//I'm sorry novice, but time is the one thing you no longer have.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_14");	//No one is allowed to kill anyone in our Brotherhood without my knowledge and permission.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_15");	//This is Masyaf's law. The punisment is death.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_16");	//In the name of Beliar!
		MIS_HasimKill = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
		B_LogEntry(TOPIC_HasimKill," Haniar was not too happy with my explanations. Now I have only one thing left - to fight for my life against the Brotherhood! " );
		PlayerIsPrioratFakeTemp = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};
	
func void DIA_Ass_126_Haniar_Quest1_M6()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M6_01_01");	//I decided to investigate the situation first.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M6_01_02");	//"Investigate the situation"? Is that what betrayal is called nowadays?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M6_01_03");	//Then let me "investigate the situation" in my own way.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M6_01_04");	//In the name of Beliar!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill," Haniar was not too happy with my explanations. Now I have only one thing left - to fight for my life against the Brotherhood! " );
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};
	
func void DIA_Ass_126_Haniar_Quest1_M5()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M5_01_01");	//I made a mistake. It won't happen again.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_02");	//Interesting ... But it always seemed to me that competence is the quality that distinguishes a masyaf warrior from a simple assassin.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_03");	//The incompetent and untrustworthy can so easily betray their principles and, most importantly, their faith.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_04");	//There is no room in the brotherhood for such people, I'm sure you understand.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M5_01_05");	//But master...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_06");	//After all, weakness, once it has shown itself, usually returns again.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_07");	//Better to kill you now, than risk your incompetence later.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_08");	//In the name of Beliar!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill," Haniar was not too happy with my explanations. Now I have only one thing left - to fight for my life against the Brotherhood! " );
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M4()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M4_01_01");	//I was afraid to tell the truth.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_02");	//So you let fear guide you?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_03");	//You know well that this is an unforgivable sin in our Brotherhood.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_04");	//Fortress of spirit and fearlessness in the face of danger - this is what distinguishes the Masiaf warrior from a simple hired killer.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_05");	//There is no place for cowards among us. Do not take this too personally.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_06");	//In the name of Beliar!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,	" Haniar was not too happy with my explanations. Now I have only one thing left - to fight for my life against the Brotherhood! " );
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M3()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M3_01_01");	//Prior Tiamant asked me to do this.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_02");	//(angrily) WHAT ?! What the hell are you talking about, novice?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_03");	//No prior of the Brotherhood would ever ask a Murid to do such a thing.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_04");	//You must take me for a complete idiot if you thought I would believe such garbage.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_05");	//This is beyond forgiveness. Die, in the name of Beliar!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,	" Haniar was not too happy with my explanations. Now I have only one thing left - to fight for my life against the Brotherhood! " );
	PlayerIsPrioratFakeTemp = TRUE;
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M7()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_01");	//Unlike Prior Tiamant's, my word is worth little.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_02");	//And if I had told you everything, most likely you would have killed me on the spot.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_03");	//Although it would have been your right, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_04");	//(staring intently) You're not stupid after all, murid.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_05"); 	//I should kill you on the spot.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_06");	//Even though Tiamant protects you.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_07");	//I will put any rash action off for now.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_08");	//You may still prove useful to me, in time.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_09");	//If I were you I would pray to Beliar for guidance.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_10");	//This is the best thing you can do right now as a form of penance.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_12");	//(nods silently)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_11");	//Then go.
	MIS_HasimKill = LOG_SUCCESS;
	HaniarKnowKiller = TRUE;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill," It was not easy, but I managed to avoid Haniar's wrath. In order to somehow mitigate my guilt, I should pray to Beliar for the soul of Hasim I killed. I'm sure Gonzalez will be interested to know how this whole story ended. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_FollowMe(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_FollowMe_condition;
	information = dia_Ass_126_Haniar_FollowMe_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_FollowMe_condition()
{
	if((GonsalesFinishHasimStory == TRUE) && (PrayForHasim == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_FollowMe_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_FollowMe_01_01");	//It's good you're here. We need to discuss something.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FollowMe_01_02");	//But not here. Follow me, novice.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FollowMe_01_03");	//(nods silently
	AI_PlayAni(other,"T_YES");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HideMeet");
};

instance DIA_Ass_126_Haniar_ANGEKOMMEN(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 55;
	condition = DIA_Ass_126_Haniar_ANGEKOMMEN_Condition;
	information = DIA_Ass_126_Haniar_ANGEKOMMEN_Info;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_ANGEKOMMEN_Condition()
{
	if((GonsalesFinishHasimStory == TRUE) && (PrayForHasim == TRUE) && (Npc_GetDistToWP(self,"PW_HANIAR_HIDE") < 500))
	{
		return TRUE;
	};
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_Info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_01_00");	//Good, no one will bother us here.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_01_01");	//Now answer my question: are you afraid of death, novice?
	Info_ClearChoices(DIA_Ass_126_Haniar_ANGEKOMMEN);
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,	" No.", DIA_Ass_126_Haniar_ANGEKOMMEN_No);
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN," Yes, I am.", DIA_Ass_126_Haniar_ANGEKOMMEN_Yes);
		       ;

func void DIA_Ass_126_Haniar_ANGEKOMMEN_No()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_01");	//No.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_02");	//Good. This is what I wanted to hear from you.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_03");	//Now let's get back to the murder of Hasim again.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_04");	//As you already know, his death did not make me very happy.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_05");	//Not only was he one of our brothers...
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_06");	//...but he was also my own personal spy and confidant.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_07");	//Through him, I was aware of all the events taking place in the Brotherhood and among the Shadows.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_08");	//He was able to extract any information I might have needed without raising suspicion.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_09");	//Which made him an extremely useful person both for me and for the Masiaf Brotherhood itself.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_10");	//His death was a serious loss.
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_11");	//I didn't know about this, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_12");	//Of course you didn't. No one did.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_13");	//You have become a blunt instrument in the hands of Beliar.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_14");	//Something else is bothering me right now.
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_15");	//What?
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_16");	//(thoughtfully) Recently, Hasim was busy digging through Prior Tiamant's dirty laundry.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_17");	// And I think his death was not accidental. He clearly found something!
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_18");	//You will find out what.
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_19");	//You want me to work for you?
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_20");	//You could say so. You are brave, quick-witted and, most importantly, you have access to Prior Tiamant.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_21");	//He trusts you - no doubt about that.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_22");	//So it would be foolish not to take advantage of this. So what do you say?
	Info_ClearChoices(DIA_Ass_126_Haniar_ANGEKOMMEN);
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"I'm not interested in this.",DIA_Ass_126_Haniar_ANGEKOMMEN_None);	
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"What will I get from this?",DIA_Ass_126_Haniar_ANGEKOMMEN_What);	
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"Okay, I agree.",DIA_Ass_126_Haniar_ANGEKOMMEN_Ok);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_Yes()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_Yes_01_01");	//Yes, I am.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Yes_01_02");	//So I was wrong about you after all. Well, it happens to everyone.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Yes_01_03");	//I'll make this quick. You won't suffer.
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_None()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_None_01_01");	//I'm not interested in this.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_None_01_02");	//(grimly) Well, then you leave me no choice.
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_What()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_01");	//What will I get from this?
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_02");	//A logical, and expected question. In simple terms: a lot.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_03");	//For a start, you can count on my support in everything.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_04");	//And this, as you know, I do not offer to everyone.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_05");	//Secondly, you will become my murid and, naturally, you will receive my consent to elevate you to the rank of Shadow.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_06");	//Well, if you are only interested in gold, then I have always paid Hasim well for the information provided.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_07");	//I'm not going to cheat you either, because good information is priceless in our line of work.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_08");	//Is that good enough for you?
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_Ok()
{
	HaniarMurid = TRUE;
	MasiafShadowRitual = Wld_GetDay();
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_01");	//Ok, I agree.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_02");	//(imperiously) Well, then, according to the law of Masyaf, I call you my murid!
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_03");	//From now on, you are my chosen one from among the novices, and I am your mentor.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_04");	//Well, since you are also a murid among the rest of the Priors of the Brotherhood ...
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_05");	//... then you will no longer have to pass the tests to enter the rank of the Shadow.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_06");	//We will perform the initiation ritual itself when we return back to the temple.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_07");	//For now, go and rest.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_08");	//As for your new responsibilities, here - take this letter.
	B_GiveInvItems(self,other,ItWr_HaniarOrder,1);
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_09");	//Read it at your leisure and you will find all the instructions you need for your next assignment.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_10");	//Now go.
	B_LogEntry(TOPIC_MasiafStory,"Итак, теперь я мюрид самого Ханиара Слепца, а завтра он и его приоры возведут меня в ранг Тени. Я стану одним из полноправных членов Братства Масиаф. Думаю, что после этого стоит поговорить с Гонсалесом и обсудить с ним дальнейший план наших действий.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(Ass_183_Adept,"PW_TEMPLE_KADUIN");
	Wld_InsertNpc(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
};

instance DIA_Ass_126_Haniar_MasiafShadowRitual(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_MasiafShadowRitual_condition;
	information = DIA_Ass_126_Haniar_MasiafShadowRitual_info;
	permanent = TRUE;
	description = " I am ready to become the Shadow of the Masiaf. " ;
};

func int DIA_Ass_126_Haniar_MasiafShadowRitual_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((HaniarMurid == TRUE) && (MasiafShadowRitual < daynow) && (PriorDipost == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_MasiafShadowRitual_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_01");	//I am ready to become the Shadow of Masiaf.

 	if(Wld_IsTime(10,0,20,0))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_02");	//(domineering) Okay. However, first you need to wait for all the priors.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_03");	//I have already sent for Prior Osair. He will be arriving soon.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_04");	//When everyone is in place, we will begin your initiation.
		AI_Output(other,self,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_05");	//What do I need to do?
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_06");	//When everyone has gathered, stand in the circle of power.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_07");	//Understood?
		PriorDipost = TRUE;
		Info_ClearChoices(DIA_Ass_126_Haniar_MasiafShadowRitual);
		Info_AddChoice(DIA_Ass_126_Haniar_MasiafShadowRitual,Dialog_Ende,DIA_Ass_126_Haniar_MasiafShadowRitual_Ok);	

	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_08");	//(irritated) You should have showed up at midnight! The sun will rise soon.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_09");	//So let's postpone the initiation ceremony until tomorrow.
		AI_Output(other,self,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_10");	//When?
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_11");	//Around noon. Until then, keep yourself busy.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Ass_126_Haniar_MasiafShadowRitual_Ok()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_138_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_139_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_140_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_141_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_125_Tiamant,"MasiafRitual");
	Npc_ExchangeRoutine(Ass_126_Haniar,"MasiafRitual");
	Npc_ExchangeRoutine(Ass_127_Osair,"MasiafRitual");
	Npc_ExchangeRoutine(Ass_128_Nrozas,"MasiafRitual");
	AI_Teleport(Ass_127_Osair,"PW_OUTSIDE_15");
	AI_GotoWP(Ass_126_Haniar,"PW_HANIAR_RITUAL");
};

instance DIA_Ass_126_Haniar_MasiafShadowRitual_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_MasiafShadowRitual_Done_condition;
	information = DIA_Ass_126_Haniar_MasiafShadowRitual_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_MasiafShadowRitual_Done_condition()
{
	if(ReadyForMasiafRitual == TRUE)
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_MasiafShadowRitual_Done_info()
{
	Snd_Play("OPEN_PORTAL");
	Wld_SendTrigger("EVT_CAM_03");
	AI_ReadyMeleeWeapon(Ass_125_Tiamant);
	AI_ReadyMeleeWeapon(Ass_126_Haniar);
	AI_ReadyMeleeWeapon(Ass_127_Osair);
	AI_ReadyMeleeWeapon(Ass_128_Nrozas);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	AI_Wait(self,25);
	Snd_Play("LEVELUP");
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_01");	//Brothers! We are gathered here today to elevate this acolyte to the rank of Shadow!
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_02");	//What will happen here today is unheard of in the history of our brotherhhod.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_03");	//Namely, that the applicant was accepted into the ranks of the Brotherhood without passing the test.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_04");	//But given the fact that he is the murid of every prior present here ...
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_05");	//...as well as the only candidate for membership.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_06");	//Therefore, by the authority given to me by the supreme council of Masyaf's priori, I bestow upon him the title of Shadow!
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_07");	//From now on, your fate is inextricably linked with this Brotherhood, its laws and orders.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_08");	//Follow them and honor them! And may your faith be strong and your blade sharp, smashing our enemies in the name of Beliar!
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_09");	//Wear this armor and blade of Shadows as a symbol of the fact that you are now one of us.
	CreateInvItems(hero,ItMw_1H_AssBlade_Hero,1);
	CreateInvItems(hero,ITAR_ASSASINS_04,1);
	AI_EquipArmor(hero,ITAR_ASSASINS_04);
	Npc_RemoveInvItems(other,ITAR_ASSASINS_03,1);
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_10");	//... Ler Ilah Il Alu Ta Masiaf Masuli Beliar! ...
	B_LogEntry(TOPIC_MasiafStory,"The Priors have ordained me to the Shadow Masiaf status. Which means that I am now one of them. I need to bring this news to Gonzalez - I am sure it will impress him. " );
	PlayerIsAssNow = TRUE;
	Info_ClearChoices(DIA_Ass_126_Haniar_MasiafShadowRitual_Done);
	Info_AddChoice(DIA_Ass_126_Haniar_MasiafShadowRitual_Done,Dialog_Ende,DIA_Ass_126_Haniar_MasiafShadowRitual_Done_Ok);	
};

func void DIA_Ass_126_Haniar_MasiafShadowRitual_Done_Ok()
{
	AI_StopProcessInfos(self);
	AI_RemoveWeapon(Ass_125_Tiamant);
	AI_RemoveWeapon(Ass_126_Haniar);
	AI_RemoveWeapon(Ass_127_Osair);
	AI_RemoveWeapon(Ass_128_Nrozas);
	B_StartOtherRoutine(Ass_125_Tiamant,"Start");
	B_StartOtherRoutine(Ass_126_Haniar,"Start");
	B_StartOtherRoutine(Ass_127_Osair,"Start");
	B_StartOtherRoutine(Ass_128_Nrozas,"Start");
	B_StartOtherRoutine(Ass_138_Adept,"Start");
	B_StartOtherRoutine(Ass_139_Adept,"Start");
	B_StartOtherRoutine(Ass_140_Adept,"Start");
	B_StartOtherRoutine(Ass_141_Adept,"Start");
	AI_GotoWP(Ass_126_Haniar,"PW_HANIAR");
};

var int HaniarRefuseFirstTime;

instance DIA_Ass_126_Haniar_BlameTiamant(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_BlameTiamant_condition;
	information = DIA_Ass_126_Haniar_BlameTiamant_info;
	permanent = TRUE;
	description = " About your assignment, master. " ;
};

func int DIA_Ass_126_Haniar_BlameTiamant_condition()
{
	if((MIS_Intriges == LOG_Running) && (HaniarBlameTiamant == FALSE) && ((KnowOsairToTiamant == TRUE) || (KnowNrozasToTiamant == TRUE) || (KnowWhyHasimDead == TRUE)))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_BlameTiamant_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_01_01");	//About your assignment, master.

	if(Wld_IsTime(9,0,10,0) || Wld_IsTime(21,0,22,0))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_02");	//I'm listening?
		Info_ClearChoices(DIA_Ass_126_Haniar_BlameTiamant);
		Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant," I have nothing to tell you yet. ",DIA_Ass_126_Haniar_BlameTiamant_None);

		if((HaniarKnowOsair == FALSE) && (KnowOsairToTiamant == TRUE))
		{
			Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant," I learned something about Prior Osair. ",DIA_Ass_126_Haniar_BlameTiamant_Osair);	
		};
		if((HaniarKnowNrozas == FALSE) && (KnowNrozasToTiamant == TRUE))
		{
			Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant," I have information about Prior Nrozas. ",DIA_Ass_126_Haniar_BlameTiamant_Nrozas);	
		};
		if((HaniarKnowHasim == FALSE) && (KnowWhyHasimDead == TRUE) && (Npc_HasItems(other,ItWr_Luka) >= 1))
		{
			Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant," I know why Hasim was killed. ",DIA_Ass_126_Haniar_BlameTiamant_Hasim);
		};
	}
	else
	{
		if(HaniarRefuseFirstTime == FALSE)
		{
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_03");	//(Irritated) This is not the place to discuss this.
			AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_04");	//We will talk about this another time, out of earshot.
			B_LogEntry(TOPIC_Intriges," Haniar didn’t listen to me. I have to wait for the moment when no one will be near him. It seems that Haniar sometimes comes out of the temple to get some fresh air. " );
			HaniarRefuseFirstTime = TRUE;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_05");	//What did you not understand from what I said?
			AI_StopProcessInfos(self);
		};
	};
};

func void DIA_Ass_126_Haniar_BlameTiamant_None()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_None_01_01");	//I have nothing to tell you yet.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_None_01_02");	//(angrily) Then why are you wasting my time?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_None_01_03");	//Forgive me master. I will go.
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_BlameTiamant_Osair()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_01");	//I learned something about Prior Osair.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_02");	//What, exactly?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_03");	//Recently, he has been very angry with Prior Tiamant for failing to keep the ore mine safe.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_04");	//And now he is asking Osair for new slaves to get the ore flowing again.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_05");	//Did someone attack the mine?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_06");	//All the slaves and the mine guard were devoured by Crawlers.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_07");	//This is news to me.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_08");	//Tiamant hid this from me. Very foolish of him.
	HaniarKnowOsair = TRUE;

	if((HaniarKnowOsair == TRUE) && (HaniarKnowNrozas == TRUE) && (HaniarKnowHasim == TRUE))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_09");	//Okay, we'll figure it out later. Any more news?
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_10");	//That's all, master.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_11");	//Good work. My trust in you seems to be well placed.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_12");	//And what will happen now?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_13");	//(grim) Nothing good. At least for Tiamant.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_14");	//If only half of what you have told me is true, a death sentence is warranted according to the laws of Masyaf!
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_15");	//Shall I kill him, my master?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_16");	//No. You do not have the right, according to the law.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_17");	//He shall die at the hands of an equal.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_18");	//Besides, he is one of the best fighters of Masyaf, you are no match for him!
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_19");	//Or do you think he trains Shadows for nothing?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_20");	//No, I shan't need your help here.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_21");	//I will handle this personally. You may sit back and enjoy the show.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_22");	//You are free for now. Go rest.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_23");	//Take this gold. I meant it when I said I pay my people well.
		B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_24");	//Now, leave me.
		HaniarBlameTiamant = TRUE;
		MIS_Intriges = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Intriges,LOG_SUCCESS);
		B_LogEntry(TOPIC_Intriges," I told Haniar everything I could find out about Prior Tiamant. It looks like Tiamant will soon have to answer for all his mistakes. This turn of events only suits me. " );
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_186_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_01");
		Wld_InsertNpc(SEK_387_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_02");

		if(HoakinIsDead == FALSE)
		{
			Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
			AI_Teleport(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_25");	//Okay, we'll figure it out later. Any more news?
	};
};


func void DIA_Ass_126_Haniar_BlameTiamant_Nrozas()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_01");	//I have information about Prior Nrozas.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_02");	//What, exactly?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_03");	//It looks like Nrozas and Tiamant don't get along very well.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_04");	//Especially since Tiamant refused one of Nrozas's requests recently.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_05");	//Interesting. What happened?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_06");	//Nrozas needs a rare muritan fang poison. Tiamant had one, but he elected not to share it.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_07");	//Now Nrozas is just waiting for an opportunity to make his displeasure felt.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_08");	//Tiamant is quite foolish to incur the wrath of the master of poisons.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_09");	//Even I go to see Nrozas occasionally.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_10");	//Men like him are to be feared most.
	HaniarKnowNrozas = TRUE;

	if((HaniarKnowOsair == TRUE) && (HaniarKnowNrozas == TRUE) && (HaniarKnowHasim == TRUE))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_11");	//Okay, we'll figure it out later. Any more news?
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_12");	//That's all, master.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_13");	//Good work. My trust in you seems to be well placed.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_14");	//And what will happen now?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_15");	//(grim) Nothing good. At least for Tiamant.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_16");	//If only half of what you have told me is true, a death sentence is warranted according to the laws of Masyaf!
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_17");	//Shall I kill him, my master?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_18");	//No. You do not have the right, according to the law.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_19");	//He shall die at the hands of an equal.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_20");	//Besides, he is one of the best fighters of Masyaf, you are no match for him!
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_21");	//Or do you think he trains Shadows for nothing?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_22");	//No, I shan't need your help here.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_23");	//I will handle this personally. You may sit back and enjoy the show.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_24");	//You are free for now. Go rest.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_25");	//Take this gold. I meant it when I said I pay my people well.
		B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_26");	//Now, leave me.
		HaniarBlameTiamant = TRUE;
		MIS_Intriges = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Intriges,LOG_SUCCESS);
		B_LogEntry(TOPIC_Intriges," I told Haniar everything I could find out about Prior Tiamant. It looks like Tiamant will soon have to answer for all his mistakes. This turn of events only suits me. " );
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_186_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_01");
		Wld_InsertNpc(SEK_387_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_02");

		if(HoakinIsDead == FALSE)
		{
			Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
			AI_Teleport(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_27");	//But enough about that. Do you have anything else for me?
	};
};


func void DIA_Ass_126_Haniar_BlameTiamant_Hasim()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_01");	//I know why Hasim had to die.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_02");	//Tell me everything you know.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_03");	//There is a large gold mine in the foothill pass.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_04");	//However, only Tiamant was aware of its existence.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_05");	//Most likely he wished to keep it that way, however, Hasim caught wind of it.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_06");	//Thanks to me, he never had the time to report it to you.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_07");	//At first, Tiamant would have asked Luke to kill Hasim.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_08");	//But then decided to use me, as you already know.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_09");	//And as proof: this letter.
	B_GiveInvItems(other,self,ItWr_Luka,1);
	B_UseFakeScroll();
	HaniarKnowHasim = TRUE;

	if((HaniarKnowOsair == TRUE) && (HaniarKnowNrozas == TRUE) && (HaniarKnowHasim == TRUE))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_11");	//Hmmm ... Anything else?
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_12");	//That's all, master.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_13");	//Good work. My trust in you seems to be well placed.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_14");	//And what will happen now?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_15");	//(grim) Nothing good. At least for Tiamant.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_16");	//If only half of what you have told me is true, a death sentence is warranted according to the laws of Masyaf!
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_17");	//Shall I kill him, my master?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_18");	//No. You do not have the right, according to the law.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_19");	//He shall die at the hands of an equal.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_20");	//Besides, he is one of the best fighters of Masyaf, you are no match for him!
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_21");	//Or do you think he trains Shadows for nothing?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_22");	//No, I shan't need your help here.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_23");	//I will handle this personally. You may sit back and enjoy the show.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_24");	//You are free for now. Go rest.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_25");	//Take this gold. I meant it when I said I pay my people well.
		B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_26");	//Now, leave me.
		HaniarBlameTiamant = TRUE;
		MIS_Intriges = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Intriges,LOG_SUCCESS);
		B_LogEntry(TOPIC_Intriges," I told Haniar everything I could find out about Prior Tiamant. It looks like Tiamant will soon have to answer for all his mistakes. This turn of events only suits me. " );
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_186_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_01");
		Wld_InsertNpc(SEK_387_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_02");

		if(HoakinIsDead == FALSE)
		{
			Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
			AI_Teleport(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_27");	//(grimly) Anything else?
	};
};

instance DIA_Ass_126_Haniar_DeadTiamant(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_DeadTiamant_condition;
	information = DIA_Ass_126_Haniar_DeadTiamant_info;
	permanent = FALSE;
	description = " That was impressive, master! " ;
};

func int DIA_Ass_126_Haniar_DeadTiamant_condition()
{
	if((TiamantIsDead == TRUE) && (MIS_PW_FollowGoldOre == LOG_Success))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_DeadTiamant_info()
{
	OsairSeekYou = TRUE;
	AI_Output(other,self,"DIA_Ass_126_Haniar_DeadTiamant_01_01");	//That was impressive, master!
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_02");	//(grimly) Maybe. Though I take no joy from it.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_03");	//The loss of one of the Priors, especially one like Tiamant, will certainly affect the Brotherhood.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_04");	//And certainly not for the better.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_05");	//(imperiously) But I had to do it, for it was required by the laws of Masyaf. Everyone understands this.
	AI_Output(other,self,"DIA_Ass_126_Haniar_DeadTiamant_01_06");	//What happens now?
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_07");	//Nothing yet. Over time, we will select a new Prior from among those brothers who will be worthy of it.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_08");	//In the meantime, Prior Osair will take over Tiamant's duties 
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_09");	//By the way. It seems he was looking for you. You should not keep him waiting.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_10");	//Off you go.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_TrueBattle(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_TrueBattle_condition;
	information = dia_Ass_126_Haniar_TrueBattle_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_TrueBattle_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Running) && (NrozasIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_TrueBattle_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_01_00");	// Not now! Let's talk after the fight.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_NrozasPoisonGift(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_info;
	permanent = FALSE;
	description = " You wanted to see me, master? " ;
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_01");	//You wanted to see me, master?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_02");	//Ah, it's good that you're here. I heard that you helped Prior Nrozas in his research.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_03");	//That's right. I tried one very strong and fast-acting poison for him.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_04");	//And how did it go?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_05");	//It took down a huge mountain troll in a matter of seconds.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_06");	//Good. His success pleases me.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_07");	//Yet it also causes me concern.
	AI_PlayAni(other,"T_SEARCH");
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_08");	//What do you mean, master?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_09");	//I do not doubt Nrozas's loyalty, however with a weapon as powerful as this new poison...
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_10");	//... perhaps he will want to use it for more than just the good of the Brotherhood.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_11");	//Temptation comes for us all, at one time or another.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_12");	//Besides, starnge things have been happening in the Brotherhood lately.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_13");	//Sometimes I get the impression that some unknown force has begun to interfere in our affairs.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_14");	//The behavior of many of the brothers is causing me serious concern.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_15");	//As in the case of Tiamant! A betrayal never even thoght possible!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_16");	//(abstractly) By the way. Do you have any assignments right now?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_17");	//I just have to take this bottle of wine to Nrozas.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_18");	//Bottle of wine?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_19");	//Prior Osair gave it to me as a token of gratitude for the vial of poison.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_20");	//(surprised) So Osair showed interest in him?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_21");	//I think he wants to order more of this poison from Nrozas.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_22");	//Strange ... I didn't know anything about this.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_23");	//Did he mention why he might need this poison?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_24");	//It's for his men. He reckons it will make them invincible killers.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_25");	//I certainly don't want to jump to conclusions yet...
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_26");	//But it seems to me that our Brotherhood is in great danger.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_27");	//Nrozas may onle be interested in his concoctions, but Osair is a completely different matter.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_28");	//His drug of choice has always been... power.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_29");	//Even when we arrived here, he chose to settle in a separate cave.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_30");	//And I have no doubt that he would gladly take my place.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_31");	//(seriously) Listen, is this bottle of wine with you?

	if(Npc_HasItems(other,ItFo_BeliarTear) >= 1)
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_32");	//Yes, here it is.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_33");	//Show it to me!
		AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_34");	//Of course master. Here it is.
		B_GiveInvItems(other,self,ItFo_BeliarTear,1);
		Npc_RemoveInvItems(self,ItFo_BeliarTear,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_35");	//'Beliar's Tear'? This wine is fit for kings!
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_36");	//Did Osair part with such a treasure so easily just to thank Nrozas?
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_37");	//This is all very odd. I need to think on this.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_38");	//Lets talk later, in private.
		HaniarGetGift = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_39");	//I don't have it.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_40");	//What are you carrying to Osair then?
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_41");	//Bring me that bottle! Immediately!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_126_Haniar_NrozasPoisonGift_Lol(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_info;
	permanent = FALSE;
	description = "Вот бутылка вина Осаира, мастер.";
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == FALSE) && (Npc_HasItems(hero,ItFo_BeliarTear) >= 1) && (Npc_KnowsInfo(hero,DIA_Ass_126_Haniar_NrozasPoisonGift)))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_01");	//Here's a bottle of Osair's wine, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_02");	//Give it here!
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_03");	//Of course, here it is.
	B_GiveInvItems(other,self,ItFo_BeliarTear,1);
	Npc_RemoveInvItems(self,ItFo_BeliarTear,1);
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_04");	//'Beliar's Tear'? This wine is fit for kings!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_05");	//Did Osair part with such a treasure so easily just to thank Nrozas?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_06");	//This is all very odd. I need to think on this.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_07");	//Lets talk later, in private.
	HaniarGetGift = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_NrozasPoisonGift_Ok(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == TRUE) && (Wld_IsTime(9,0,10,0) || Wld_IsTime(21,0,22,0)))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_01");	//(grim) So. My fears were fully confirmed. That wine was poisoned.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_02");	//Really
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_03");	//You're lucky you didn't have time to give it to Nrozas. More precisely, you are both lucky.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_04");	//The fool would surely have drunk it it, oblivious to the fact that the poisoner could also be the poisoned.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_05");	//Thank you, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_06");	//Osair has begun a very dangerous game, and it seems Tiamant's death has only emboldened him.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_07");	//Nrozas's death would have been blamed on you, and thus Osair would have removed two threats to his power in one fell swoop.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_08");	//And then only I would have been left to stand in his way.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_09");	//But if he thinks me weak, he is dearly mistaken.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_10");	//He has no inkling of the powers that protect me!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_11");	//But Osair's threat should not be underestimated either, as our brothers may suffer in this massacre.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_12");	//And I will not allow someone's ambitions to instantly destroy what has taken centuries to create.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_13");	//What are you going to do, master?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_14");	//I cannot accuse Osair of anything without substantial evidence.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_15");	//Therefore, we must force him to show his hand, and thus start on the path to his own downfall.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_16");	//You will help me in this.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_17");	//I will do my best.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_18");	//Great! First, I'll take care of Nrozas. And his death will play into our hands.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_19");	//You're going to kill him?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_20");	//No, Nrozas is too valuable to lose.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_21");	//I will send Nrozas to the inner sanctum of our temple, where he can continue his experiments on his own for the benefit of the Brotherhood.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_22");	//But as far as the brotherhood is concerned, he will be dead.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_23");	//Inner sanctum?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_24");	//I understand your surprise. It is a secret known only to me.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_25");	//It is a place of dark secrets.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_26");	//What's in there
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_27");	//Something you better pray you never face. You need know no more.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_28");	//As for Osair, I will write him a letter, which you will take to him.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_29");	//I will invite him to discuss the situation in the Brotherhood in private.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_30");	//I'm sure he will not miss this opportunity to deal with me.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_31");	//And then it will end!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_32");	//However, I need some time to write this letter.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_33");	//In the meantime, go to Nrozas and take this wine to him.
	B_GiveInvItems(self,other,ItFo_BeliarTear_Haniar,1); 
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_34");	//And, of course, present it as a gift from Osair.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_35");	//Won't it kill him?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_36");	//Don't worry. It is now completely safe.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_37");	//Let the old man finally indulge himself with this divine nectar.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_38");	//Go, now. I will see you later.
	B_LogEntry(TOPIC_NrozasPoisonGift," Haniar said that the wine was poisoned. It looks like Osair wanted to kill Nrozas with my hands, and at the same time me. After all, all suspicions will immediately fall on me. Apparently, Osair wants to deal with all the Priors of the Brotherhood in order to clean up power into their own hands. However, Haniar foresaw this and came up with some plan to stop Osair. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_NrozasPoisonGift_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_Done_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_Done_info;
	permanent = FALSE;
	description = "Я передал вино Нрозасу, мастер.";
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_Done_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Success) && (HaniarGetGift == TRUE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_Done_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_01");	//I gave the wine to Nrozas, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_02");	//Good.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_03");	//Here is the letter for Osair. Take it to him.
	B_GiveInvItems(self,other,ItWr_HaniarToOsair,1); 
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_04");	//I guess he won't be too happy to see me.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_05");	//Don't worry. He won't dare touch my messenger.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_06");	//What about you? Will you go there alone?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_07");	//Exactly.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_08");	//Otherwise, he will not be comfortable enough to reveal his plans to me.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_09");	//Will you be able to fight him and all his men?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_10");	//I truly hope Osair thinks the same.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_11");	//Enough talk. Take him the letter.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_12");	//Of course master.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_TrueBattle_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_TrueBattle_Done_condition;
	information = dia_Ass_126_Haniar_TrueBattle_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_TrueBattle_Done_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_TrueBattle_Done_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_00");	//Well. Nrozas lost. Who would have thought.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_01");	//So, apparently, the truth was on your side.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_02");	//I have no doubt that these events will come back to haunt us.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_03");	//But what's done is done.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Ass_126_Haniar,"Start");
};

instance DIA_Ass_126_Haniar_TrueBattle_Next(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_TrueBattle_Next_condition;
	information = dia_Ass_126_Haniar_TrueBattle_Next_info;
	permanent = FALSE;
	description = " Will there be more errands for me, master? " ;
};

func int dia_Ass_126_Haniar_TrueBattle_Next_condition()
{
	if((MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_TrueBattle_Next_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_TrueBattle_Next_01_00");	//Will there be more errands for me, master?
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_01");	//Yes. I need you to go to Beliar's altar.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_02");	//I will give you gold to make as an offering.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_03");	//The Brotherhood is facing a storm right now, unlike any we've seen.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_04");	//Perhaps this offering will make the Dark One notice us again.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_05");	//If you take this gold for yourself, you will be flayed alive.
	AI_Output(other,self,"DIA_Ass_126_Haniar_TrueBattle_Next_01_06");	//I understand.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_07");	//Take it and go.
	B_GiveInvItems(self,other,ItMi_Gold,2000); 
	MIS_BeliarTribe = LOG_Running;
	Log_CreateTopic(TOPIC_BeliarTribe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BeliarTribe,LOG_Running);
	B_LogEntry(TOPIC_BeliarTribe," I need to go to Beliar's altar and bring him the gold of Haniar the Blind. " );
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_BeliarTribe(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_BeliarTribe_condition;
	information = dia_Ass_126_Haniar_BeliarTribe_info;
	permanent = FALSE;
	description = " Beliar has accepted your gift, master. " ;
};

func int dia_Ass_126_Haniar_BeliarTribe_condition()
{
	if(MIS_BeliarTribe == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_BeliarTribe_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BeliarTribe_01_00");	//Beliar has accepted your gift, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BeliarTribe_01_01");	//Good. May darkness shield us.
};

instance DIA_Ass_126_Haniar_OsairTrait(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_OsairTrait_condition;
	information = dia_Ass_126_Haniar_OsairTrait_info;
	permanent = FALSE;
	description = " I have bad news for you, master. " ;
};

func int dia_Ass_126_Haniar_OsairTrait_condition()
{
	if((MIS_OsairTrait == LOG_Running) && (Wld_IsTime(9,0,10,0) || Wld_IsTime(21,0,22,0)))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_OsairTrait_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_00");	//I have bad news for you, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_01");	//What are you talking about?
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_02");	//Prior Osair seems to be gathering his loyalists to attack the temple.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_03");	//You are saying very dangerous things, brother. Are you sure?
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_04");	//Osair spoke to me personally and tried to win me over to his side.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_05");	//Did he succeed?
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_06");	//I pretended to agree.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_07");	//Well, you are here. That speaks volumes.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_08");	//And it's good that you were smart enough to tell me about this in private.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_09");	//Osair has begun a very dangerous game, and it seems Tiamant's death has only emboldened him.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_10");	//And then only I would have been left to stand in his way.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_11");	//So this is how it all has turned out.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_12");	//But if he thinks me weak, he is dearly mistaken.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_13");	//He has no inkling of the powers that protect me!
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_14");	//But Osair's threat should not be underestimated either, as our brothers may suffer in this massacre.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_15");	//And I will not allow someone's ambitions to instantly destroy what has taken centuries to create.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_16");	//What are you going to do, master?
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_17");	//I cannot blame Osair for something without substantial evidence.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_18");	//Therefore, we must force him to show his hand, and thus start on the path to his own downfall.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_19");	//You will help me in this.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_20");	//I will do my best.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_21");	//I will write him a letter, which you will take to him.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_22");	//I will invite him to discuss the situation in the Brotherhood in private.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_23");	//I'm sure he will not miss this opportunity to deal with me.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_24");	//And then, it will end!
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_25");	//However, I need some time to write this letter.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_26");	//So wait a minute here.
	B_LogEntry(TOPIC_OsairTrait," I told Haniar about Osair's plans. However, Haniar foresaw this and came up with a plan to stop him. I have to wait a little while Haniar writes a letter to Osair. " );
	HaniarWriteLetter = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LetterWrite");
};

instance DIA_Ass_126_Haniar_OsairTrait_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_OsairTrait_Done_condition;
	information = DIA_Ass_126_Haniar_OsairTrait_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_OsairTrait_Done_condition()
{
	if((MIS_OsairTrait == LOG_Running) && (HaniarWriteLetter == TRUE) && (HaniarWriteLetterDone == TRUE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_OsairTrait_Done_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_01");	//Here is the letter for Osair. Take it to him.
	B_GiveInvItems(self,other,ItWr_HaniarToOsair,1); 
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_02");	//I guess he won't be too happy to see me.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_03");	//Don't worry. He won't dare touch my messenger.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_04");	//What about you? Will you go there alone?
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_05");	//Exactly.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_06");	//Otherwise, he will not be comfortable enough to reveal his plans to me.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_07");	//Will you be able to fight him and all his men?
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_08");	//I truly hope Osair thinks the same.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_09");	//Enough talk. Take him the letter.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_10");	//Of course master.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Ass_126_Haniar_PRETEACH_MANA(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 23;
	condition = dia_Ass_126_Haniar_preteach_mana_condition;
	information = dia_Ass_126_Haniar_preteach_mana_info;
	permanent = FALSE;
	description = " What can I learn from you, master? " ;
};

func int dia_Ass_126_Haniar_preteach_mana_condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_preteach_mana_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_PreTeach_Mana_01_00");	//What can I learn from you, master?
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_01");	//(seriously) My path of teaching our brothers is their spiritual strength.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_02");	//We certainly do not practice Beliar's magic on our own, as the dark mages of Varant do.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_03");	//But this does not mean that the fortress of the spirit is absolutely useless for us.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_04");	//So if you want, I can train you too.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_05");	//In addition, my training will be able to temper your body and increase its endurance.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_06");	//Provided, of course, that you have enough experience for this.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_07");	//If you want to better master the skills of fighting, then you better turn to Tiamant.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_08");	//Only he is engaged in the combat training of our brothers.
	HaniarTeachMe = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher," Prior Haniar will help me increase my spiritual strength, vitality and stamina. " );
};


instance DIA_Ass_126_Haniar_TEACH_MANA(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 10;
	condition = dia_Ass_126_Haniar_teach_mana_condition;
	information = dia_Ass_126_Haniar_teach_mana_info;
	permanent = TRUE;
	description = " I want to train. " ;
};

func int dia_Ass_126_Haniar_teach_mana_condition()
{
	if(HaniarTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_teach_mana_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_TEACH_MANA_01_00");	//I want to exercise.
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

	if(VATRAS_TEACHREGEN == FALSE)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA," Health Regeneration (Training Points: 5) ",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
	};
};

func void dia_Ass_126_Haniar_teach_mana_back()
{
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
};

func void DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth()
{
	var int kosten;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_04");	//Teach me how to regenerate health.
	kosten = 5;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print(" Training: Health Regeneration " );
		VATRAS_TEACHREGEN = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);
};

func void dia_Ass_126_Haniar_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

	if(VATRAS_TEACHREGEN == FALSE)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA," Health Regeneration (Training Points: 5) ",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
	};
};

func void dia_Ass_126_Haniar_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

	if(VATRAS_TEACHREGEN == FALSE)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA," Health Regeneration (Training Points: 5) ",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
	};
};

func void dia_Ass_126_Haniar_teach_mana_stamina_1()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,1))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA," Health Regeneration (Training Points: 10) ",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};

func void dia_Ass_126_Haniar_teach_mana_stamina_5()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,5))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA," Health Regeneration (Training Points: 10) ",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};

func void dia_Ass_126_Haniar_teach_mana_hp_1()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA," Health Regeneration (Training Points: 10) ",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};

func void dia_Ass_126_Haniar_teach_mana_hp_5()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA," Health Regeneration (Training Points: 10) ",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};


instance DIA_Ass_126_Haniar_FinalHaniar(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_FinalHaniar_condition;
	information = DIA_Ass_126_Haniar_FinalHaniar_info;
	permanent = FALSE;
	description = " Prior Osair has agreed to a meeting, Master. " ;
};

func int DIA_Ass_126_Haniar_FinalHaniar_condition()
{
	if(OsairReadyMeeting == TRUE)
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_FinalHaniar_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalHaniar_01_01");	//Prior Osair agreed to a meeting, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_02");	//(зловеще) I expected nothing less.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_03");	//May he keep making such mistakes.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_04");	//As for you, good work.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_05");	//Rest for now, and go about your business.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_06");	//Ater I settle the matter with Osair, I may have more assignments for you.

	if(MIS_OsairTrait == LOG_Running)
	{
		MIS_OsairTrait = LOG_Success;
		Log_SetTopicStatus(TOPIC_OsairTrait,LOG_Success);
	};

	B_LogEntry(TOPIC_MasiafStory," I need to tell Gonzalez about the meeting between Osair and Haniar. I think a serious mess is brewing in the Brotherhood. " );
	HaniarReadyMeeting = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_Meeting(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_Meeting_condition;
	information = DIA_Ass_126_Haniar_Meeting_info;
	permanent = FALSE;
	description = " Can I help you deal with Osair's people? " ;
};

func int DIA_Ass_126_Haniar_Meeting_condition()
{
	if((HaniarReadyMeeting == TRUE) && (HideMeetCome == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_Meeting_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Meeting_01_01");	//Can I help you deal with Osair's people?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Meeting_01_02");	//If you value your life, stay out of this.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Meeting_01_03");	//That is the only thing I can tell you.
};

instance DIA_Ass_126_Haniar_CareOsair(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_CareOsair_condition;
	information = DIA_Ass_126_Haniar_CareOsair_info;
	permanent = FALSE;
	description = " I have news that will interest you. " ;
};

func int DIA_Ass_126_Haniar_CareOsair_condition()
{
	if((MIS_CareOsair == LOG_Running) && (NazimNeedGetOutCave == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_CareOsair_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_01");	//I have news that will interest you, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_02");	//(with interest) Continue.
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_03");	//Prior Osair has instructed me to enlist the support of several Shadows.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_04");	//(thoughtfully) Their names?
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_05");	//Famid, Rafat, Nazim and Kudir.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_06");	//Very interesting. He, by chance, did not mention why he needed these men?
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_07");	//I thought YOU would might know that.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_08");	//No... but he chose those specific men for a reason.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_09");	//Try to find out if the opportunity presents itself. This can be important.
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_10");	//I will do my best.
	HaniarKnowsOsairPlans_01 = TRUE;
};

instance DIA_Ass_126_Haniar_NazimNeedGetOutCave(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NazimNeedGetOutCave_condition;
	information = DIA_Ass_126_Haniar_NazimNeedGetOutCave_info;
	permanent = FALSE;
	description = " Can you replace Nazim in the mine? " ;
};

func int DIA_Ass_126_Haniar_NazimNeedGetOutCave_condition()
{
	if((NazimNeedGetOutCave == TRUE) && (MIS_CareOsair == LOG_Running) && (NazimGetOutCave == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_01_01");	//Is it possible to replace Nazim in the mine?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_01_02");	//(surprised) What do you even care?
	Info_ClearChoices(DIA_Ass_126_Haniar_NazimNeedGetOutCave);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave," He just doesn't like this activity. " , DIA_Ass_126_Haniar_NazimNeedGetOutCave_None);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave," I need his help. ",DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave, " He's seriously ill, master. ",DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave," Prior Osair wants to see him. ",DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_None()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_01");	//He just doesn't like this activity.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_02");	//Then he will have to put up with it. Because he will remain where he is now.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_03");	//And, apparently, for a longer period than planned.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_04");	//I understand.
	B_LogEntry(TOPIC_CareOsair,"I think I just made Nazim's situation worse. I hope he doesn't know about this conversation with Haniar. " );
	NazimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_01");	//I need his help.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_02");	//Truly? Why might that be?

	if(HaniarKnowsOsairPlans_01 == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_03");	//Something that would be interesting for both of us to know.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_04");	//I see.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_05");	//You can tell Nazim that he can leave his post in the mine for now.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_06");	//Don't make me regret this decision.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_07");	//Rest assured, master.
		NazimGetOutCave = TRUE;
		B_LogEntry(TOPIC_CareOsair," Haniar has agreed to release Nazim from the mine. We need to tell him this good news. " );
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_08");	//I want to go hunting.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_09");	//And I need someone to watch my back.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_10");	//An experienced fightern like you needs no help.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_11");	//Nazim stays where he is.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_12");	//Будет больше толку.
 		NazimStayInCave = TRUE;
		B_LogEntry(TOPIC_CareOsair," Haniar refused to let Nazim leave the mine. I think that now he will not be able to work for Osair. " );
	};
	
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_01");	//He's seriously ill, master.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_02");	//Really? What is wrong with him?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_03");	//It is a disease that could disfigure him for life.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_04");	//Disfigure his face? Luckily he doesn't need it.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_05");	//The shadow never shows its true face. This is the Masiaf law.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_06");	//He will stay where he is.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_07");	//Go and tell him that.
	NazimStayInCave = TRUE;
	B_LogEntry(TOPIC_CareOsair," Haniar refused to let Nazim leave the mine. I think that now he will not be able to work for Osair. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_01");	//Prior Osair wants to see him.

	if(HaniarKnowsOsairPlans_01 == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_02");	//Hmmm... alright.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_03");	//You can tell Nazim that he can leave his post in the mine for now.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_04");	//Perhaps it will do him good.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_05");	//Undoubtedly, master.
		NazimGetOutCave = TRUE;
		B_LogEntry(TOPIC_CareOsair," Haniar has agreed to release Nazim from the mine. We need to tell him this good news. " );
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_06");	//If Osair wants to see him so much, let him come to the mine himself.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_07");	//Nazim stays where he is.
 		NazimStayInCave = TRUE;
		B_LogEntry(TOPIC_CareOsair," Haniar refused to let Nazim leave the mine. I think that now he will not be able to work for Osair. " );
	};

	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_FinalTalk(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_FinalTalk_condition;
	information = DIA_Ass_126_Haniar_FinalTalk_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_FinalTalk_condition()
{
	if(HaniarFinalTalk == TRUE)
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_FinalTalk_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_01");	//You dare appear before me? I warned you!
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_02");	//As you can see, it didn't stop me..
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_03");	//Insolent fool. Wait, who is that with you?
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_04");	//Don't you recognise him?
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_05");	//Ah, my old friend Gonzalez. So you are here too?
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_06");	//Now I understand how you were able to deal with my servants.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_07");	//And you, Gonzalez, still dream of revenge on me?
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_08");	//I can see it in your eyes. However, I must dissapoint you.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_09");	//I am still your superior, and can crush you both with no effort.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_10");	//We'll see about that.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_11");	//Your overconfidence betrays your stupidity!
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_12");	//Soon you will feel my master's wrath!
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_13");	//So you are nothing but a servant yourself? Where is this master of yours?
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_14");	//His chambers are in the inner sanctuary of the temple. But you'll never get there.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_15");	//We shall see, after I kill you.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_16");	//Miserable worm! Then come and get me! In the name of Beliar!
	PlayerIsPrioratFake = TRUE;
	self.flags = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	Info_ClearChoices(DIA_Ass_126_Haniar_FinalTalk);
	Info_AddChoice(DIA_Ass_126_Haniar_FinalTalk,Dialog_Ende,DIA_Ass_126_Haniar_FinalTalk_None);
};

func void DIA_Ass_126_Haniar_FinalTalk_None()
{
	AI_StopProcessInfos(self);
	TempleIsClear = TRUE;
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_KILL,0);
};
