
instance DIA_Niclas_EXIT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 999;
	condition = DIA_Niclas_EXIT_Condition;
	information = DIA_Niclas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Niclas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Niclas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Niclas_Hello(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_Hello_Condition;
	information = DIA_Niclas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Niclas_Hello_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Niclas_Hello_Info()
{
	AI_Output(self,other, " DIA_Niclas_Hello_03_03 " );	// Hail friend. Are you lost?
	AI_Output(other,self, " DIA_Niclas_Hello_15_01 " );	// Do I look lost?
	AI_Output(self,other, " DIA_Niclas_Hello_03_02 " );	// There's nothing much around here, so I was just wondering. (laughs)
};


instance DIA_Niclas_HaveALook(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_HaveALook_Condition;
	information = DIA_Niclas_HaveALook_Info;
	permanent = FALSE;
	description = " I'm just wandering, admiring nature. " ;
};


func int DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};

func void DIA_Niclas_HaveALook_Info()
{
	AI_Output(other,self, " DIA_Niclas_HaveALook_15_00 " );	// I'm just wandering, admiring nature.
	AI_Output(self,other, " DIA_Niclas_HaveALook_03_01 " );	// Okay, be my guest. Do you want a piece of meat?
	CreateInvItems(self,ItFoMutton,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
	Info_AddChoice(DIA_Niclas_HaveALook, " No thanks. " ,DIA_Niclas_HaveALook_No);
	Info_AddChoice(DIA_Niclas_HaveALook, " Yes, thanks. " ,DIA_Niclas_HaveALook_Yes);
};

func void DIA_Niclas_HaveALook_No()
{
	AI_Output(other,self, " DIA_Niclas_HaveALook_No_15_00 " );	// No thanks.
	AI_Output(self,other, " DIA_Niclas_HaveALook_No_03_01 " );	// As you wish. I hope you don't mind if I eat.
	B_UseItem(self,ItFoMutton);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};

func void DIA_Niclas_HaveALook_Yes()
{
	AI_Output(other,self, " DIA_Niclas_HaveALook_Yes_15_00 " );	// Yes, thanks.
	AI_Output(self,other, " DIA_Niclas_HaveALook_Yes_03_01 " );	// Here you go, delicious mole rat leg! Made according to my own recipe.
	B_GiveInvItems(self,other,itfomutton_niclas,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};


instance DIA_Niclas_WhyHere(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_WhyHere_Condition;
	information = DIA_Niclas_WhyHere_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Niclas_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_HaveALook))
	{
		return TRUE;
	};
};

func void DIA_Niclas_WhyHere_Info()
{
	AI_Output(other,self, " DIA_Niclas_WhyHere_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Niclas_WhyHere_01_01 " );	// Being as solitary as possible. The hunting camp is fine of course, but nothing beats this!
	if(HEROISHUNTER == FALSE)
	{
		AI_Output(self,other, " DIA_Niclas_WhyHere_01_02 " );	// By the way, have you been to our camp? If you want to become a real hunter, then you definitely need to go there.
		AI_Output(other,self, " DIA_Niclas_WhyHere_01_03 " );	// Where is your camp?
		AI_Output(self,other, " DIA_Niclas_WhyHere_01_04 " );	// In a small hollow, located on the road between Onar's farm and Bengar's. Don't worry, it's hard to miss.
		AI_Output(self,other, " DIA_Niclas_WhyHere_01_05 " );	// If you find your way there, then talk to Falk - he is our de facto leader.
	};
};


instance DIA_Niclas_ShouldntWork(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_ShouldntWork_Condition;
	information = DIA_Niclas_ShouldntWork_Info;
	permanent = FALSE;
	description = " How's the hunting? " ;
};

func int DIA_Niclas_ShouldntWork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};
};

func void DIA_Niclas_ShouldntWork_Info()
{
	AI_Output(other,self, " DIA_Niclas_ShouldntWork_01_00 " );	// And how is the sport out here?
	AI_Output(self,other, " DIA_Niclas_ShouldntWork_01_01 " );	// Great. I'm telling you, this is a great hunting ground!
	AI_Output(other,self, " DIA_Niclas_ShouldntWork_01_02 " );	// What are you hunting?
	AI_Output(self,other, " DIA_Niclas_ShouldntWork_01_03 " );	// Mostly scavengers - safe, and a lot of meat for the guys in the camp.
	AI_Output(self,other, " DIA_Niclas_ShouldntWork_01_04 " );	// Plus, I'm never averse to practicing archery.
};

instance DIA_Niclas_CanTeachMe(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_CanTeachMe_Condition;
	information = DIA_Niclas_CanTeachMe_Info;
	permanent = FALSE;
	description = " In that case, I'm sure you can teach me something. " ;
};


func int DIA_Niclas_CanTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void DIA_Niclas_CanTeachMe_Info()
{
	AI_Output(other,self, " DIA_Niclas_CanTeachMe_15_00 " );	// In that case, I'm sure you can teach me something.
	AI_Output(self,other, " DIA_Niclas_CanTeachMe_03_01 " );	// Why not? I can at least show you how to hold a bow properly.
	if(HEROISHUNTER == FALSE)
	{
		Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher, " Niklas can teach me how to shoot a bow more accurately. " );
	}
	else
	{
		Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
		B_LogEntry( TOPIC_HUNTERTEACHERS , " Niklas can teach me how to shoot more accurately with a bow. " );
	};
};


instance DIA_Niclas_Teach(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_Teach_Condition;
	information = DIA_Niclas_Teach_Info;
	permanent = TRUE;
	description = " Show me how to hold a bow properly. " ;
};


func int DIA_Niclas_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_CanTeachMe))
	{
		return TRUE;
	};
};

func void DIA_Niclas_Teach_Info()
{
	AI_Output(other,self, " DIA_Niclas_Teach_15_00 " );	// Show me how to hold a bow properly.

	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other, " DIA_Niclas_Teach_03_01 " );	// I taught you everything I could. Now you better look for another teacher.
	}
	else
	{
		Info_ClearChoices(DIA_Niclas_Teach);
		Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
		Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
		Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
	};
};

func void DIA_Niclas_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other, " DIA_Niclas_Teach_03_00 " );	// I have nothing more to teach you.
	};
	Info_ClearChoices(DIA_Niclas_Teach);
};

func void DIA_Niclas_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};

func void DIA_Niclas_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};


instance DIA_NICLAS_MAKEARROWS(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = dia_niclas_makearrows_condition;
	information = dia_niclas_makearrows_info;
	permanent = FALSE;
	description = " Where do you get your arrows from? " ;
};


func int dia_niclas_makearrows_condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void dia_niclas_makearrows_info()
{
	AI_Output(other,self, " DIA_Niclas_MakeArrows_01_00 " );	// Where do you get your arrows from?
	AI_Output(self,other, " DIA_Niclas_MakeArrows_01_01 " );	// I make them myself. It is not as difficult as it seems at first glance.
	AI_Output(other,self, " DIA_Niclas_MakeArrows_01_02 " );	// Fletching... seems like a good skill to have?
	AI_Output(self,other, " DIA_Niclas_MakeArrows_01_03 " );	// Of course. If you are interested, I will gladly share my knowledge with you.
};


instance DIA_NICLAS_MAKEARROWSDO(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = dia_niclas_makearrowsdo_condition;
	information = dia_niclas_makearrowsdo_info;
	permanent = TRUE;
	description = " Teach me how to make arrows. " ;
};


func int dia_niclas_makearrowsdo_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_makearrows) && (KNOWHOWTOMAKEARROWS == FALSE))
	{
		return TRUE;
	};
};

func void dia_niclas_makearrowsdo_info()
{
	AI_Output(other,self, " Dia_Niclas_MakeArrowsDo_01_00 " );	// Teach me how to make arrows.
	Info_ClearChoices(dia_niclas_makearrowsdo);
	Info_AddChoice(dia_niclas_makearrowsdo,Dialog_Back,dia_niclas_makearrowsdo_Back);
	Info_AddChoice(dia_niclas_makearrowsdo,b_buildlearnstringformakearrows( " Making arrows and bolts " ,B_GetLearnCostTalent(other, NPC_TALENT_MAKEARROWS , 1 )),dia_niclas_makearrowsdo_MAKEARROWS);
};

func void dia_niclas_makearrowsdo_Back()
{
	Info_ClearChoices(dia_niclas_makearrowsdo);
};

func void dia_niclas_makearrowsdo_MAKEARROWS()
{
	if(b_teachplayertalentmakearrows(self,other,NPC_TALENT_MAKEARROWS))
	{
		AI_Output(self,other, " Dia_Niclas_MakeArrowsDo_01_01 " );	// As you wish. First you need a good saw.
		AI_Output(self,other, " Dia_Niclas_MakeArrowsDo_01_02 " );	// Sawing the right log into pieces of the right size.
		AI_Output(self,other, " Dia_Niclas_MakeArrowsDo_01_03 " );	// Then you carve them into wooden poles. After that, you need to cut steel tips from a piece of steel and connect to the shaft.
		AI_Output(self,other, " Dia_Niclas_MakeArrowsDo_01_04 " );	// The same principle applies to crossbow bolts, they just require more steel to produce.
	};

	Info_ClearChoices(dia_niclas_makearrowsdo);
};

instance DIA_Niclas_PICKPOCKET(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 900;
	condition = DIA_Niclas_PICKPOCKET_Condition;
	information = DIA_Niclas_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Niclas_PICKPOCKET_Condition()
{
	return  C_Robbery ( 27 , 20 );
};

func void DIA_Niclas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,Dialog_Back,DIA_Niclas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Niclas_PICKPOCKET_DoIt);
};

func void DIA_Niclas_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};

func void DIA_Niclas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};


instance DIA_NICLAS_RESPECT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = dia_niclas_respect_condition;
	information = dia_niclas_respect_info;
	permanent = FALSE;
	description = " I could use your help. " ;
};


func int dia_niclas_respect_condition()
{
	if (( CANHUNTERCHALLANGE  ==  TRUE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ) && ( NICLAS_RESPECT  ==  FALSE ) && Npc_KnowsInfo(other,DIA_Niclas_WhyHere));
	{
		return TRUE;
	};
};

func void dia_niclas_respect_info()
{
	AI_Output(other,self, " DIA_Niclas_Respect_01_00 " );	// I need your help.
	AI_Output(self,other, " DIA_Niclas_Respect_01_01 " );	// Asking is free.
	AI_Output(other,self, " DIA_Niclas_Respect_01_02 " );	// I want to compete with Falk for the title of the best hunter in the camp.
	AI_Output(self,other, " DIA_Niclas_Respect_01_03 " );	// Why are you doing this, boy?
	AI_Output(self,other, " DIA_Niclas_Respect_01_04 " );	// Falk is a very skilled hunter, and it's unlikely you'll be able to defeat him.
	AI_Output(other,self, " DIA_Niclas_Respect_01_05 " );	// I'm still going to try.
	AI_Output(self,other, " DIA_Niclas_Respect_01_06 " );	// Okay, whatever you say. But first, do me one small favor.
	AI_Output(self,other, " DIA_Niclas_Respect_01_08 " );	// My last hunt wasn't very successful...
	AI_Output(self,other, " DIA_Niclas_Respect_01_09 " );	// I haven't been able to get most of the required amount of meat for the guys in the camp.
	AI_Output(self,other, " DIA_Niclas_Respect_01_10 " );	// So if you can get me even a dozen fresh pieces, then consider my voice on your side.
	AI_Output(self,other, " DIA_Niclas_Respect_01_11 " );	// In addition, this way you will also prove to me that you are a good hunter. Well, do you agree?
	B_LogEntry( TOPIC_HUNTERSWORK , " Niklas will support me in arguing with Falk if I bring him a dozen pieces of fresh meat. " );
};


instance DIA_NICLAS_RESPECTDONE(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = dia_niclas_respectdone_condition;
	information = dia_niclas_respectdone_info;
	permanent = FALSE;
	description = " Here's your meat. " ;
};


func int dia_niclas_respectdone_condition()
{
	if ( Npc_KnowsInfo ( other , dia_niclas_respect ) && ( CANHUNTERCHALLANGE  ==  TRUE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ) && ( NICLAS_RESPECT  ==  FALSE ) && ( Npc_HasItems ( other , ItFoMuttonRaw ) >=  12 )) ;
	{
		return TRUE;
	};
};

func void dia_niclas_respectdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Niclas_RespectDone_01_00 " );	// Here's your meat.
	B_GiveInvItems(other,self,ItFoMuttonRaw,12);
	AI_Output(self,other, " DIA_Niclas_RespectDone_01_01 " );	// Great, man! You seem to be a really good hunter.
	AI_Output(other,self, " DIA_Niclas_RespectDone_01_02 " );	// How about your consent now?
	AI_Output(self,other, " DIA_Niclas_RespectDone_01_03 " );	// Of course. I will support you in your dispute with Falk, as promised.
	NICLAS_RESPECT = TRUE;
	B_LogEntry( TOPIC_HUNTERSWORK , " I brought the meat to Niklas, and he did what he promised. " );
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
};

instance DIA_NICLAS_RECRUITDT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_recruitdt_condition;
	information = dia_niclas_recruitdt_info;
	permanent = FALSE;
	description = " How are you? " ;
};

func int dia_niclas_recruitdt_condition()
{
	if(HURRAYICANHIRE == TRUE)
	{
		return TRUE;
	};
};

func void dia_niclas_recruitdt_info()
{
	AI_Output(other,self, " Dia_Niclas_RecruitDT_15_00 " );	// How are you?
	AI_Output(self,other, " Dia_Niclas_RecruitDT_01_01 " );	// Not bad. Did I mention this is a great hunting ground?
	AI_Output(self,other, " Dia_Niclas_RecruitDT_01_02 " );	// Unfortunately it is getting more dangerous by the day.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_01_03 " );	// The restless dead prowl in the old graveyard below, and the orcs roar constantly from the forest.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_01_04 " );	// And how did they get in here? Aren't paladins guarding the Passage?
	AI_Output(other,self, " Dia_Niclas_RecruitDT_15_05 " );	// Not anymore, I'm afraid. The paladins guarding the Passage are dead.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_01_06 " );	// Damn, that is indeed troubling news. Perhaps I should return to camp.
	AI_Output(other,self, " Dia_Niclas_RecruitDT_15_07 " );	// Wait... I have an offer for you. Do you want to work for me?
	AI_Output(self,other, " Dia_Niclas_RecruitDT_01_08 " );	// For you? Doing what?
	AI_Output(other,self, " Dia_Niclas_RecruitDT_15_09 " );	// I now own an old tower next to Onar's farm where I'm trying to set up a sort of small camp.
	AI_Output(other,self, " Dia_Niclas_RecruitDT_15_10 " );	// But the camp needs food. We could use a man like you.
	AI_Output(other,self, " Dia_Niclas_RecruitDT_15_11 " );	// You will live in the tower, hunt in the neighboring forest. All the trophies are yours, I only need the meat from you.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_01_12 " );	// Hmm... How much will you pay?
	AI_Output(other,self, " Dia_Niclas_RecruitDT_15_13 " );	// Thirty gold per day.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_01_14 " );	// Interesting. Ok, I agree. But with one condition. In the future, you will find me a partner.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_01_15 " );	// The forest near Onar's farm is not much safer than the Dark Forest. It's quite dangerous to go there alone.
	Info_ClearChoices(dia_niclas_recruitdt);
	Info_AddChoice(dia_niclas_recruitdt, " Agreed. " ,dia_niclas_recruitdt_yes);
	Info_AddChoice(dia_niclas_recruitdt, " I still need to think on it. " ,dia_niclas_recruitdt_no);
};

func void dia_niclas_recruitdt_yes()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " Dia_Niclas_RecruitDT_yes_15_00 " );	// Deal. The password to enter the tower is 'Dragon Treasures'.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_yes_01_00 " );	// Well, as agreed, from now on I will provide the camp with meat every day.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_yes_01_01 " );	// Now it's time to hit the road.
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Niklas agreed to work for me. He will provide food for the camp, but it's better to find him a hunting partner. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	NICLASRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(BAU_984_Niclas,"InCastle");
};

func void day_niclas_recruitdt_no()
{
	AI_Output(other,self, " Dia_Niclas_RecruitDT_no_15_00 " );	// I still need to think on this.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_no_01_01 " );	// Good. I'll stay here for a while then.
	AI_StopProcessInfos(self);
};

instance DIA_NICLAS_RECRUITDT_AGREE(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_recruitdt_agree_condition;
	information = dia_niclas_recruitdt_agree_info;
	permanent = FALSE;
	description = " I agree with your terms. " ;
};

func int dia_niclas_recruitdt_agree_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_niclas_recruit ) && ( NICLAS_RECRUITEDT  ==  FALSE ) && ( HURRAYICANHIRE  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_niclas_recruitdt_agree_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " Dia_Niclas_RecruitDT_Agree_15_00 " );	// I agree with your condition.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_Agree_01_00 " );	// Well, as agreed, from now on I will provide the camp with meat every day.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_Agree_01_01 " );	// Now it's time to hit the road.
	AI_Output(other,self, " Dia_Niclas_RecruitDT_Agree_15_02 " );	// Wait. Last moment. The tower is guarded, the password is 'Dragon Treasures'.
	AI_Output(self,other, " Dia_Niclas_RecruitDT_Agree_01_03 " );	// I'll try not to forget. See you.
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Niklas agreed to work for me. He will provide food for the camp, but it's better to find him a hunting partner. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	NICLASRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(BAU_984_Niclas,"InCastle");
};

instance DIA_NICLAS_HIREDASSIST(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_hiredassist_condition;
	information = dia_niclas_hiredassist_info;
	permanent = FALSE;
	description = " I found you a partner. " ;
};

func int dia_niclas_hiredassist_condition()
{
	if(TALBINRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_niclas_hiredassist_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " Dia_Niclas_HiredAssist_15_00 " );	// I found you a partner. This is the hunter Talbin.
	AI_Output(self,other, " Dia_Niclas_HiredAssist_01_01 " );	// I know him! He is not one of the bravest, but he shoots well enough.
};

instance DIA_NICLAS_INTOWER(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 22;
	condition = dia_niclas_intower_condition;
	information = dia_niclas_intower_info;
	permanent = TRUE;
	description = " How are you doing here? " ;
};

func int dia_niclas_intower_condition()
{
	if((NICLASRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 12000))
	{
		return TRUE;
	};
};

func void dia_niclas_intower_info()
{
	AI_Output(other,self, " DIA_Niclas_InTower_15_00 " );	// How do you like it here?
	AI_Output(self,other, " DIA_Niclas_InTower_01_01 " );	// It's not bad. It's good to have a roof over your head.
};

instance DIA_NICLAS_INTOWER_ORCKAP(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 22;
	condition = dia_niclas_intower_orckap_condition;
	information = dia_niclas_intower_orckap_info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int dia_niclas_intower_orckap_condition()
{
	if (( NICLASRECRUITEDDT  ==  TRUE ) && ( CAPITELORCATC  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_niclas_intower_orckap_info()
{
	AI_Output(other,self, " DIA_Niclas_InTower_OrcKap_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Niclas_InTower_OrcKap_01_01 " );	// It's good that we managed to stock up on provisions in advance. Hunting has become too dangerous lately.
};
