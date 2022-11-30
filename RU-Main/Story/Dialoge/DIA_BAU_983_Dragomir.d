
instance DIA_Dragomir_EXIT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 999;
	condition = DIA_Dragomir_EXIT_Condition;
	information = DIA_Dragomir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dragomir_Hello(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Hello_Condition;
	information = DIA_Dragomir_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragomir_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Hello_Info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_Leather_L) == TRUE) || (HEROISHUNTER == TRUE))
	{
		AI_Output(self,other, " DIA_Dragomir_Hello_12_00 " );	// Traveling this far from home?
		AI_Output(self,other, " DIA_Dragomir_Hello_12_01 " );	// You can't be careful here, especially when you're all alone.
	}
	else
	{
		AI_Output(self,other, " DIA_Dragomir_Hello_01_00 " );	// Who let YOU in?
		AI_Output(self,other, " DIA_Dragomir_Hello_01_01 " );	// And what the hell are you doing here?
		AI_Output(other,self, " DIA_Dragomir_Hello_01_02 " );	// Just came by to take a look.
		AI_Output(self,other, " DIA_Dragomir_Hello_01_03 " );	// Very funny.
	};
};


instance DIA_Dragomir_OutHere(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int DIA_Dragomir_OutHere_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_OutHere_Info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_Leather_L) == TRUE) || (HEROISHUNTER == TRUE))
	{
		AI_Output(other,self,"DIA_Dragomir_OutHere_01_00");	//Кто ты?
		AI_Output(self,other, " DIA_Dragomir_OutHere_01_01 " );	// I'm a hunter! (laughs) Is it imperceptible?
		AI_Output(self,other, " DIA_Dragomir_OutHere_01_02 " );	// Well, here, as you can see, our camp is a great place for guys like us.
	}
	else
	{
		AI_Output(other,self,"DIA_Dragomir_OutHere_01_03");	//Кто ты?
		AI_Output(self,other, " DIA_Dragomir_OutHere_01_04 " );	// Who do you think I look like? I don't think it's a clown. (irritated)
		AI_Output(self,other, " DIA_Dragomir_OutHere_01_05 " );	// So stop asking your stupid questions and leave me alone.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Dragomir_Settlers(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent = FALSE;
	description = " How would you like to be a hunter? " ;
};


func int DIA_Dragomir_Settlers_Condition()
{
	if (( HEROISHUNTER  ==  TRUE ) && Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Settlers_Info()
{
	AI_Output(other,self, " DIA_Dragomir_Settlers_01_00 " );	// And how do you be a hunter?
	AI_Output(self,other, " DIA_Dragomir_Settlers_01_01 " );	// Quite tolerable, especially in the company of these guys, what do you see around you.
	AI_Output(self,other, " DIA_Dragomir_Settlers_01_02 " );	// It's quiet and peaceful here.
	DRAGOMIRCANGIVEQUEST = TRUE;
};


instance DIA_Dragomir_Dangerous(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent = FALSE;
	description = " Isn't it dangerous here in the forest? " ;
};


func int DIA_Dragomir_Dangerous_Condition()
{
	if((HEROISHUNTER == TRUE) && (DRAGOMIRCANGIVEQUEST == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Dangerous_Info()
{
	AI_Output(other,self, " DIA_Dragomir_Dangerous_15_00 " );	// Isn't it dangerous here?
	AI_Output(self,other, " DIA_Dragomir_Dangerous_12_01 " );	// Well... Not really, if you can stand up for yourself. My crossbow has already saved me many times.
	AI_Output(other,self, " DIA_Dragomir_Dangerous_15_02 " );	// Hmm. He's not that big.
	AI_Output(self,other, " DIA_Dragomir_Dangerous_12_03 " );	// But deadly if you know how to handle it. Yes, I had a bigger crossbow. But unfortunately I lost it.
	AI_Output(self,other, " DIA_Dragomir_Dangerous_12_04 " );	// I wandered too far north, into the mountains. There is a large stone circle with a sacrificial altar.
	AI_Output(self,other, " DIA_Dragomir_Dangerous_12_05 " );	// While I was out there hunting scavengers, those damned skeletons came running out of the woods and attacked me.
	AI_Output(self,other, " DIA_Dragomir_Dangerous_12_06 " );	// I had to run as fast as I could.
	AI_Output(self,other, " DIA_Dragomir_Dangerous_12_07 " );	// And as I ran, the crossbow slipped out of my hand. I think he's still lying there, by that strange circle to the north.
	MIS_DragomirsArmbrust = LOG_Running;
	Log_CreateTopic(TOPIC_DragomirsArmbrust,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_Running);
	B_LogEntry(TOPIC_DragomirsArmbrust, " Dragomir lost his crossbow somewhere near a strange rock in the high northern mountains. " );
};


instance DIA_Dragomir_Crossbow (C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Crossbow_Info;
	permanent = FALSE;
	description = " Here, I found your crossbow. " ;
};


func int DIA_Dragomir_Armbrust_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_Running) && Npc_HasItems(other,ItRw_DragomirsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Crossbow_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Dragomir_Armbrust_15_00 " );	// Here, I found your crossbow.
	B_GiveInvItems(other,self,ItRw_DragomirsArmbrust_MIS,1);
	AI_Output(self,other, " DIA_Dragomir_Armbbrust_12_01 " );	// Exactly, that's my crossbow. Just don't tell me you went to that stone circle.
	AI_Output(other,self, " DIA_Dragomir_Armbbrust_15_02 " );	// What's wrong with that?
	AI_Output(self,other, " DIA_Dragomir_Armbrust_12_03 " );	// That was very reckless of you. But thanks anyway.
	AI_Output(self,other, " DIA_Dragomir_Armbbrust_12_05 " );	// A hunter is not an example of wealth these days, and I don't even know how to thank you.
	AI_Output(self,other, " DIA_Dragomir_Armbbrust_12_06 " );	// Although... here, take this old book.
	B_GiveInvItems(self,other,ITWR_CBOW_T1,1);
	AI_Output(self,other, " DIA_Dragomir_Armbbrust_12_07 " );	// I hope you learn something from it - I learned a lot.
	MIS_DragomirsArmbrust = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_SUCCESS);
	B_LogEntry(TOPIC_DragomirsArmbrust, " I returned Dragomir's crossbow he lost. " );
};

var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;

instance DIA_Dragomir_Learn(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Learn_Condition;
	information = DIA_Dragomir_Learn_Info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};

func int DIA_Dragomir_Learn_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_SUCCESS) && (Dragomir_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Learn_Info()
{
	AI_Output(other,self, " DIA_Dragomir_Learn_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Dragomir_Learn_12_02 " );	// If you can pay. Like I said, I'm a bit on a tight budget right now.
	AI_Output(other,self, " DIA_Dragomir_Learn_15_03 " );	// How much do you want?
	B_Say_Gold(self,other,Dragomir_TeachingCost);
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	Log_AddEntry( TOPIC_HUNTERTEACHERS , " Dragomir will teach me how to shoot with a crossbow. " );
	Info_ClearChoices(DIA_Dragomir_Learn);
	Info_AddChoice(DIA_Dragomir_Learn, " Maybe later. " ,DIA_Dragomir_Learn_Later);

	if(Npc_HasItems(other,ItMi_Gold) >= Dragomir_TeachingCost)
	{
		Info_AddChoice(DIA_Dragomir_Learn, " Come on ! Show me how to handle him. " ,DIA_Dragomir_Learn_Here);
	};
};

func void DIA_Dragomir_Learn_Later()
{
	AI_Output(other,self, " DIA_Dragomir_Learn_Later_15_00 " );	// Maybe later.
	Info_ClearChoices(DIA_Dragomir_Learn);
};

func void DIA_Dragomir_Learn_Here()
{
	AI_Output(other,self, " DIA_Dragomir_Learn_Here_15_01 " );	// Deal! Show me how to handle it.
	B_GiveInvItems(other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output(self,other, " DIA_Dragomir_Learn_Here_12_01 " );	// Okay, we can start right now.
	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Dragomir_Learn);
};

var int DIA_Dragomir_Teach_permanent;

instance DIA_Dragomir_Teach(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Teach_Condition;
	information = DIA_Dragomir_Teach_Info;
	permanent = TRUE;
	description = " Show me how to shoot a crossbow. " ;
};

func int DIA_Dragomir_Teach_Condition()
{
	if((Dragomir_TeachPlayer == TRUE) && (DIA_Dragomir_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Teach_Info()
{
	AI_Output(other,self, " DIA_Dragomir_Teach_15_01 " );	// Show me how to shoot a crossbow.
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_crossbow_1);
	Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_crossbow_5);
};

func void DIA_Dragomir_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other, " DIA_Dragomir_Teach_12_00 " );	// There's nothing more I can teach you. You should look for another teacher.
		DIA_Dragomir_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Dragomir_Teach);
};

func void dia_dragomir_teach_crossbow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,75))
	{
		if ( DRAGOMIRTEACHFT  ==  FALSE )
		{
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_1_01_01 " );	// Okay, let's get started.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_1_01_02 " );	// You grab the handle and rest it against your shoulder. This will help you aim better.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_1_01_03 " );	// For the first few days, your shoulder will feel like it's about to fall off.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_1_01_04 " );	// But in a week it will be like a stone!
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_1_01_05 " );	// Aim accurately at the target and pull the arrow back. It will fly much stronger than from a bow, which means it will deal more damage!
			DRAGOMIRTEACHFT = TRUE;
		};
		if((DRAGOMIRTEACHST == FALSE) && (other.HitChance[NPC_TALENT_CROSSBOW] >= 60))
		{
			AI_Output(other,self, " DIA_Dragomir_Teach_CrossBow_1_01_06 " );	// Tell me more about the crossbow.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_1_01_07 " );	// Okay. Your shots will be more accurate if you crouch before shooting.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_1_01_08 " );	// You have to learn how to calculate the speed at which the target is moving.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_1_01_09 " );	// Fire an arrow with proper lead in the path of a moving target to slow or stop it.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_1_01_10 " );	// If there are multiple targets, don't waste your time - shoot them one after the other with a continuous series of shots.
			DRAGOMIRTEACHST = TRUE;
		};
		Info_ClearChoices(DIA_Dragomir_Teach);
		Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_crossbow_1);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_crossbow_5);
	};
};

func void dia_dragomir_teach_crossbow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,75))
	{
		if ( DRAGOMIRTEACHFT  ==  FALSE )
		{
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_5_01_01 " );	// Okay, let's get started.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_5_01_02 " );	// You grab the handle and rest it against your shoulder. This will help you aim better.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_5_01_03 " );	// For the first few days, your shoulder will feel like it's about to fall off.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_5_01_04 " );	// But in a week it will be like a stone!
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_5_01_05 " );	// Aim accurately at the target and pull the arrow back. It will fly much stronger than from a bow, which means it will deal more damage!
			DRAGOMIRTEACHFT = TRUE;
		};
		if((DRAGOMIRTEACHST == FALSE) && (other.HitChance[NPC_TALENT_CROSSBOW] >= 60))
		{
			AI_Output(other,self, " DIA_Dragomir_Teach_CrossBow_5_01_06 " );	// Tell me more about the crossbow.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_5_01_07 " );	// Okay. Your shots will be more accurate if you crouch before shooting.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_5_01_08 " );	// You have to learn how to calculate the speed at which the target is moving.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_5_01_09 " );	// Fire an arrow with proper lead in the path of a moving target to slow or stop it.
			AI_Output(self,other, " DIA_Dragomir_Teach_CrossBow_5_01_10 " );	// If there are multiple targets, don't waste your time - shoot them one after the other with a continuous series of shots.
			DRAGOMIRTEACHST = TRUE;
		};
		Info_ClearChoices(DIA_Dragomir_Teach);
		Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_crossbow_1);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_crossbow_5);
	};
};


instance DIA_Dragomir_PICKPOCKET(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 900;
	condition = DIA_Dragomir_PICKPOCKET_Condition;
	information = DIA_Dragomir_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Dragomir_PICKPOCKET_Condition()
{
	return  C_Robbery ( 47 , 70 );
};

func void DIA_Dragomir_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,Dialog_Back,DIA_Dragomir_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dragomir_PICKPOCKET_DoIt);
};

func void DIA_Dragomir_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

func void DIA_Dragomir_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};


instance DIA_DRAGOMIR_RESPECT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = dia_dragomir_respect_condition;
	information = dia_dragomir_respect_info;
	permanent = FALSE;
	description = " Will you vote for me? " ;
};


func int dia_dragomir_respect_condition()
{
	if (( CANHUNTERCHALLANGE  ==  TRUE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ) && ( DRAGOMIR_RESPECT  ==  FALSE ) && Npc_KnowsInfo(other,DIA_Dragomir_OutHere));
	{
		return TRUE;
	};
};

func void dia_dragomir_respect_info()
{
	AI_Output(other,self, " DIA_Dragomir_Respect_01_00 " );	// Will you vote for me?
	AI_Output(self,other, " DIA_Dragomir_Respect_01_01 " );	// What's the reason?
	AI_Output(other,self, " DIA_Dragomir_Respect_01_02 " );	// I want to challenge Falk to compete with him in the art of hunting.
	AI_Output(self,other, " DIA_Dragomir_Respect_01_03 " );	// You? Falk? Do you believe that you can get the better of him in a case in which he is much more experienced than you?
	AI_Output(other,self, " DIA_Dragomir_Respect_01_06 " );	// I'll try. So will you help me?
	AI_Output(self,other, " DIA_Dragomir_Respect_01_07 " );	// Okay, I'll help - it's not difficult for me.
	AI_Output(self,other, " DIA_Dragomir_Respect_01_08 " );	// But first, prove to me that you're really worth something in our cause.
	AI_Output(self,other, " DIA_Dragomir_Respect_01_09 " );	// Otherwise, in words, we are all great hunters.
	AI_Output(other,self, " DIA_Dragomir_Respect_01_10 " );	// And what exactly do you want me to prove?
	AI_Output(self,other, " DIA_Dragomir_Respect_01_11 " );	// Well, at least you're a good shooter.
	AI_Output(self,other, " DIA_Dragomir_Respect_01_12 " );	// After all, without this skill, you are more likely to be easy prey for animals, and not a hunter.
	AI_Output(self,other, " DIA_Dragomir_Respect_01_13 " );	// I'm not very good at archery, of course, but I can tell how good you are at crossbow shooting.
	AI_Output(other,self, " DIA_Dragomir_Respect_01_14 " );	// And who should I shoot for you?
	AI_Output(self,other, " DIA_Dragomir_Respect_01_15 " );	// Nobody! Just show me how well you treat him. This will be enough.
	AI_Output(other,self, " DIA_Dragomir_Respect_01_16 " );	// Good. Why not?
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 55)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Dragomir_Respect_01_17 " );	// Hmmm... (respectfully) I see that's pretty good. You made an impression on me.
		AI_Output(other,self, " DIA_Dragomir_Respect_01_18 " );	// Does this mean I can now count on your vote?
		AI_Output(self,other, " DIA_Dragomir_Respect_01_19 " );	// Of course! Such a good shooter simply cannot be a bad hunter.
		AI_Output(self,other, " DIA_Dragomir_Respect_01_20 " );	// So I'm here for you.
		AI_Output(other,self, " DIA_Dragomir_Respect_01_21 " );	// Thank you.
		DRAGOMIR_RESPECT = TRUE;
		B_LogEntry( TOPIC_HUNTERSWORK , " I was able to impress Dragomir with my crossbow skills, and now he will support me in an argument with Falk. " );
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_Dragomir_Respect_01_22 " );	// Hmmm... I see that it doesn't matter at all.
		AI_Output(self,other, " DIA_Dragomir_Respect_01_23 " );	// No, boy - you have nothing to do with such shooting on the hunt.
		AI_Output(self,other, " DIA_Dragomir_Respect_01_24 " );	// So if you want to impress me and earn my respect, you better go train.
		AI_Output(self,other, " DIA_Dragomir_Respect_01_25 " );	// We'll see.
	};
};


instance DIA_DRAGOMIR_RESPECTDONE(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = dia_dragomir_respectdone_condition;
	information = dia_dragomir_respectdone_info;
	permanent = TRUE;
	description = " How do you like my crossbow shooting now? " ;
};


func int dia_dragomir_respectdone_condition()
{
	if ( Npc_KnowsInfo ( other , dia_dragomir_respect ) && ( CANHUNTERCHALLANGE  ==  TRUE ) && ( DRAGOMIR_RESPECT  ==  FALSE ) && ( MY_HUNTERCHALLANGE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_dragomir_respectdone_info()
{
	AI_Output(other,self, " DIA_Dragomir_RespectDone_01_00 " );	// How do you like my crossbow shooting now?
	AI_Output(self,other, " DIA_Dragomir_RespectDone_01_01 " );	// Okay, let's see.
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 55)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Dragomir_RespectDone_01_03 " );	// Hmmm... (respectfully) Well, I see that it's pretty good. You made an impression on me.
		AI_Output(other,self, " DIA_Dragomir_RespectDone_01_04 " );	// Does this mean I can now count on your vote?
		AI_Output(self,other, " DIA_Dragomir_RespectDone_01_05 " );	// Of course! Such a good shooter simply cannot be a bad hunter.
		AI_Output(self,other, " DIA_Dragomir_RespectDone_01_06 " );	// So I'm here for you.
		AI_Output(other,self, " DIA_Dragomir_RespectDone_01_07 " );	// Thank you.
		DRAGOMIR_RESPECT = TRUE;
		B_LogEntry( TOPIC_HUNTERSWORK , " I was able to impress Dragomir with my crossbow skills. And now he will support me in an argument with Falk. " );
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_Dragomir_RespectDone_01_08 " );	// Hmmm... Well, what did you want to surprise me with?
		AI_Output(self,other, " DIA_Dragomir_RespectDone_01_09 " );	// She's still no good.
		AI_Output(self,other, " DIA_Dragomir_RespectDone_01_10 " );	// If you want to impress me, you need to learn how to do it much better than now.
		AI_Output(self,other, " DIA_Dragomir_RespectDone_01_11 " );	// So go train.
	};
};
