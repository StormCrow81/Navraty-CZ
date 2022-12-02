

instance DIA_Opolos_Kap1_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap1_EXIT_Condition;
	information = DIA_Opolos_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap1_EXIT_Condition()
{
	if (chapter <=  1 )
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Hello(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_Hello_Condition;
	information = DIA_Opolos_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Opolos_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Hello_Info()
{
	AI_Output(self,other, " DIA_Opolos_Hello_12_00 " );	// Hi, you must be that newbie.
	AI_Output(self,other, " DIA_Opolos_Hello_12_01 " );	// I'm Opolos! I look after the sheep.
};


instance DIA_Opolos_Wurst (C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_Wurst_Condition;
	information = DIA_Opolos_Sausage_Info;
	permanent = FALSE;
	description = " I brought lamb sausage. " ;
};


func int DIA_Opolos_Wurst_Condition()
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Sausage_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_Opolos_Wurst_15_00 " );	// I brought lamb sausage.
	AI_Output(self,other, " DIA_Opolos_Wurst_12_01 " );	// Oh, fantastic! Finally! Delicious lamb sausage!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_Opolos_HowLong(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_HowLong_Condition;
	information = DIA_Opolos_HowLong_Info;
	permanent = FALSE;
	description = " How long have you been in the monastery? " ;
};


func int DIA_Opolos_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowLong_Info()
{
	AI_Output(other,self, " DIA_Opolos_HowLong_15_00 " );	// How long have you been in the monastery?
	AI_Output(self,other, " DIA_Opolos_HowLong_12_01 " );	// Already three years. But still they don't let me into the library. And I so want...
	AI_Output(other,self, " DIA_Opolos_HowLong_15_02 " );	// Why?
	AI_Output(self,other, " DIA_Opolos_HowLong_12_03 " );	// My job here is to herd sheep - not to study the scriptures.
	AI_Output(self,other, " DIA_Opolos_HowLong_12_04 " );	// And until Master Parlan releases me from this duty, I won't be allowed to start teaching in the library.
	MIS_HelpOpolos = LOG_Running;
	Log_CreateTopic(Topic_OpolosStudy,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosStudy,LOG_Running);
	B_LogEntry(Topic_OpolosStudy, " Opolos is looking after the sheep. He would like to study the scrolls in the library. " );
};


instance DIA_Opolos_Monastery(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_Monastery_Condition;
	information = DIA_Opolos_Monastery_Info;
	permanent = FALSE;
	description = " How should I behave in the monastery? " ;
};


func int DIA_Opolos_Monastery_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Opolos_Hello ) && ( hero . guild ==  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Monastery_Info()
{
	AI_Output(other,self, " DIA_Opolos_Monastery_15_00 " );	// How should I behave in the monastery?
	AI_Output(self,other, " DIA_Opolos_Monastery_12_01 " );	// Never lie to mages. Respect your brothers in the community.
	AI_Output(self,other, " DIA_Opolos_Monastery_12_02 " );	// Respect the property of the monastery. If you break these rules, you will have to answer to Master Parlan.
	AI_Output(self,other, " DIA_Opolos_Monastery_12_03 " );	// Other than that, I can advise you to be careful with Agon. If you are not vigilant, you may end up like Babo.
};


instance DIA_Opolos_teach (C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_teach_Condition;
	information = DIA_Opolos_teach_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int DIA_Opolos_teach_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Opolos_Hello ) && ( ( other . guild ==  GIL_NOV ) || ( other . guild ==  GIL_KDF )))
	{
		return TRUE;
	};
};

func void DIA_Opolos_teach_Info()
{
	AI_Output(other,self, " DIA_Opolos_beibringen_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Opolos_beibringen_12_01 " );	// Of course, I often had to fight. I can teach you how to get stronger.
	AI_Output(self,other, " DIA_Opolos_beibringen_12_02 " );	// But I'd like to know something about potions, especially magical ones.
	AI_Output(other,self, " DIA_Opolos_beibringen_15_03 " );	// How can I help you with this?
	AI_Output(self,other, " DIA_Opolos_beibringen_12_04 " );	// Well, if you're working for Neoras, you'll probably be able to 'borrow' one of his recipes for a little while.
	AI_Output(self,other, " DIA_Opolos_beibringen_12_05 " );	// If you bring it to me so I can study it, then I'll train you.
	Log_CreateTopic(Topic_OpolosRezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosRezept,LOG_Running);
	B_LogEntry(Topic_OpolosRezept, " Opolos wants to look at the mana potion recipe. Maybe I can borrow it while working for Neoras. " );
};


instance DIA_Opolos_recipe (C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_rezept_Condition;
	information = DIA_Opolos_recipe_Info;
	permanent = TRUE;
	description = " Recipe... " ;
};


var int DIA_Opolos_rezept_permanent;

func int DIA_Opolos_rezept_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Opolos_behave) && (other.guild ==  GIL_NOV ) && (DIA_Opolos_rezept_permanent ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Opolos_recipe_Info()
{
	if(Npc_HasItems(other,ItWr_ManaRezept) >= 1)
	{
		AI_Output(other,self, " DIA_Opolos_rezept_15_00 " );	// I brought the recipe, just like you wanted.
		AI_Output(self,other, " DIA_Opolos_rezept_12_01 " );	// Okay, let me read it.
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Opolos_rezept_12_02 " );	// Yeah...hmm...yeah...I see...so, so...
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_Opolos_rezept_12_03 " );	// Good! Thank you so much. If you want, you can practice with me.
		DIA_Opolos_rezept_permanent = TRUE ;
		Opolos_TeachSTR = TRUE;
		Opolos_Recipe = LOG_SUCCESS ;
		B_GivePlayerXP(XP_Ambient);
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher, " Hollos can help me get stronger. " );
	}
	else if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(other,self, " DIA_Opolos_rezept_15_04 " );	// I already returned this recipe to Neoras.
		AI_Output(self,other, " DIA_Opolos_rezept_12_05 " );	// Oh shit - I'll probably never get to learn anything here. OK. I will still train you.
		Opolos_Rezept = LOG_FAILED;
		DIA_Opolos_rezept_permanent = TRUE ;
		Opolos_TeachSTR = TRUE;
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher, " Hollos can help me get stronger. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Opolos_rezept_15_06 " );	// We'll come back to this later.
	};
};


instance DIA_Opolos_TEACH_STR(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 99;
	condition = DIA_Opolos_TEACH_STR_Condition;
	information = DIA_Opolos_TEACH_STR_Info;
	permanent = TRUE;
	description = " I want to get stronger. " ;
};


func int DIA_Opolos_TEACH_STR_Condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV)) && (Opolos_TeachSTR == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_TEACH_STR_Info()
{
	AI_Output(other,self, " DIA_Opolos_TEACH_STR_15_00 " );	// I want to get stronger.
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_MED)
	{
		AI_Output(self,other, " DIA_Opolos_TEACH_STR_12_00 " );	// You have become very strong. I have nothing more to teach you.
	};
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
};

func void DIA_Opolos_TEACH_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};


instance DIA_Opolos_Agon (C_Info) .
{
	npc = NOV_605_Opolos;
	nr = 4;
	condition = DIA_Opolos_Agon_Condition;
	information = DIA_Opolos_Agon_Info;
	permanent = FALSE;
	description = " Who are Agon and Babo? " ;
};


func int DIA_Opolos_Agon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Agon_Info()
{
	AI_Output(other,self, " DIA_Opolos_Agon_15_00 " );	// And who are Agon and Babo?
	AI_Output(self,other, " DIA_Opolos_Agon_12_01 " );	// Agon is in charge of the garden. He is also a novice, but he acts like he is already the Chosen One.
	AI_Output(self,other, " DIA_Opolos_Agon_12_02 " );	// Babo came to the monastery shortly before you. And at first he helped Agon in the garden.
	AI_Output(self,other, " DIA_Opolos_Agon_12_03 " );	// Looks like they didn't share something, and Babo has been sweeping the yard ever since.
	AI_Output(other,self, " DIA_Opolos_Agon_15_04 " );	// Do you know what happened?
	AI_Output(self,other, " DIA_Opolos_Agon_12_05 " );	// I don't know exactly. You better ask them yourself. But the words of Agon carry more weight than the word of any other acolyte, because he is the nephew of the head of the city.
};


instance DIA_Opolos_LIESEL (C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_LIESEL_Condition;
	information = DIA_Opolos_LIESEL_Info;
	permanent = TRUE;
	description = " Look, I brought Betsy. " ;
};


func int DIA_Opolos_LIESEL_Condition()
{
	if((other.guild == GIL_NOV) && (Liesel_Giveaway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_LIESEL_Info()
{
	AI_Output(other,self, " DIA_Opolos_LIESEL_15_00 " );	// Look, I brought Betsy. Can I leave her with you?
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 800))
	{
		other.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		other.aivar[ AIV_TAPOSITION ] = TRUE ;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = ZS_MM_AllScheduler;
		Liesel_Giveaway = TRUE;
		AI_Output(self,hero, " DIA_Opolos_LIESEL_12_01 " );	// Yes, of course. What a beautiful sheep. I'll take care of her.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Opolos_Add_15_00 " );	// Hmm... where did I put it. I'll come later.
	};
};


instance DIA_Opolos_Library (C_Info)
{
	npc = NOV_605_Opolos;
	nr = 98;
	condition = DIA_Opolos_Biblothek_Condition;
	information = DIA_Opolos_Library_Info;
	permanent = TRUE;
	description = " About the library... " ;
};


func int DIA_Opolos_Biblothek_Condition()
{
	if ((other.guild ==  GIL_NOV ) && Npc_KnowsInfo(other,DIA_Opolos_HowLong))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Library_Info()
{
	AI_Output(other,self, " DIA_Opolos_Biblothek_15_00 " );	// About the library...
	if (parlan_permission ==  FALSE )
	{
		AI_Output(self,other, " DIA_Opolos_Biblothek_12_01 " );	// This is the locked room on the left, next to the gate.
		AI_Output(self,other, " DIA_Opolos_Biblothek_12_02 " );	// The key to it can only be obtained when Master Parlan decides that you are ready to study the scriptures.
	}
	else
	{
		AI_Output(self,other, " DIA_Opolos_Biblothek_12_03 " );	// You're lucky! You got the key to the library without being here for a few days.
		AI_Output(self,other, " DIA_Opolos_Biblothek_12_04 " );	// Don't miss your chance to study ancient scriptures!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_HelloAgain(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_HelloAgain_Condition;
	information = DIA_Opolos_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Opolos_HelloAgain_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_HelpOpolos == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HelloAgain_Info()
{
	AI_Output(self,other, " DIA_Opolos_HelloAgain_12_00 " );	// Hello. Thanks for helping me. Now I won't miss my chance.
	AI_Output(self,other, " DIA_Opolos_HelloAgain_12_01 " );	// But you probably don't have time to talk to a mere acolyte now, Master.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_HowIsIt(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_HowIsIt_Condition;
	information = DIA_Opolos_HowIsIt_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Opolos_HowIsIt_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowIsIt_Info()
{
	AI_Output(other,self, " DIA_Opolos_HowIsIt_15_00 " );	// How are you?
	if(MIS_HelpOpolos == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Opolos_HowIsIt_12_01 " );	// Great. Ever since I was allowed to visit the library, everything has been great.
	}
	else
	{
		AI_Output(self,other, " DIA_Opolos_HowIsIt_12_02 " );	// I humbly do whatever I'm assigned, Master.
		AI_Output(self,other, " DIA_Opolos_HowIsIt_12_03 " );	// Every day Innos puts me to new trials. I will continue to work on myself.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap2_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap2_EXIT_Condition;
	information = DIA_Opolos_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap2_EXIT_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap3_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap3_EXIT_Condition;
	information = DIA_Opolos_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap3_PERM(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 39;
	condition = DIA_Opolos_Kap3_PERM_Condition;
	information = DIA_Opolos_Kap3_PERM_Info;
	permanent = TRUE;
	description = " How are your sheep? " ;
};


func int DIA_Opolos_Kap3_PERM_Condition()
{
	if ((Capital >=  3 ) && (other.guild !=  GIL_KDF ))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_PERM_Info()
{
	AI_Output(other,self, " DIA_Opolos_Kap3_PERM_15_00 " );	// How are your sheep?
	AI_Output(self,other, " DIA_Opolos_Kap3_PERM_12_01 " );	// What do you think? They stand around and chew grass.
	AI_Output(self,other, " DIA_Opolos_Kap3_PERM_12_02 " );	// I wish I knew what was going on outside. The mages seem to be very nervous.
	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,Dialog_Back,DIA_Opolos_Kap3_PERM_BACK);
	Info_AddChoice(DIA_Opolos_Kap3_PERM, " Dragons have appeared in the Valley of Mines. " ,DIA_Opolos_Kap3_PERM_DRAGONS);
	Info_AddChoice(DIA_Opolos_Kap3_PERM, " Strangers in black robes stand at every intersection. " ,DIA_Opolos_Kap3_PERM_DMT);
	if(MIS_NovizenChase == LOG_Running)
	{
		Info_AddChoice(DIA_Opolos_Kap3_PERM, " Pedro betrayed us. " ,DIA_Opolos_Kap3_PERM_PEDRO);
	};
};

func void DIA_Opolos_Kap3_PERM_BACK()
{
	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
};


var int Opolos_Dragons;

func void DIA_Opolos_Kap3_PERM_DRAGONS()
{
	AI_Output(other,self, " DIA_Opolos_Kap3_PERM_DRAGONS_15_00 " );	// Dragons have appeared in the Valley of Mines. Together with an army of orcs, they besiege the royal troops.
	AI_Output(self,other, " DIA_Opolos_Kap3_PERM_DRAGONS_12_01 " );	// Dragons - I always thought they only existed in children's fairy tales.
	AI_Output(other,self, " DIA_Opolos_Kap3_PERM_DRAGONS_15_02 " );	// They're here, trust me.
	AI_Output(self,other, " DIA_Opolos_Kap3_PERM_DRAGONS_12_03 " );	// But the royal paladins will deal with them, won't they?
	AI_Output(other,self, " DIA_Opolos_Kap3_PERM_DRAGONS_15_04 " );	// Let's see.
	if(Opolos_Dragons == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_Dragons = TRUE;
	};
};


var int Opolos_DMT;

func void DIA_Opolos_Kap3_PERM_DMT()
{
	AI_Output(other,self, " DIA_Opolos_Kap3_PERM_DMT_15_00 " );	// Strangers in black cassocks stand at every crossroads.
	AI_Output(self,other, " DIA_Opolos_Kap3_PERM_DMT_12_01 " );	// What do you mean? What are the other unknowns?
	AI_Output(other,self, " DIA_Opolos_Kap3_PERM_DMT_15_02 " );	// Nobody knows where they came from. They wear long black robes and hide their faces.
	AI_Output(other,self, " DIA_Opolos_Kap3_PERM_DMT_15_03 " );	// Looks like some kind of mage. At least they have magic.
	AI_Output(self,other, " DIA_Opolos_Kap3_PERM_DMT_12_04 " );	// This is all very troubling, but I'm sure the High Council will address this issue.
	if(Opolos_DMT == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_DMT = TRUE;
	};
};


var int Opolos_Peter;

func void DIA_Opolos_Kap3_PERM_PEDRO()
{
	AI_Output(other,self, " DIA_Opolos_Kap3_PERM_PEDRO_15_00 " );	// Pedro betrayed us.
	AI_Output(self,other, " DIA_Opolos_Kap3_PERM_PEDRO_12_01 " );	// I heard about it, but I thought you knew about it too. That's why I didn't say anything.
	AI_Output(self,other, " DIA_Opolos_Kap3_PERM_PEDRO_12_02 " );	// Is the enemy stronger than us - I mean, can we defeat him?
	AI_Output(other,self, " DIA_Opolos_Kap3_PERM_PEDRO_15_03 " );	// We're not dead yet.
	if ( Opollos_Peter ==  FALSE )
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_Pedro = TRUE;
	};
};


instance DIA_Opolos_Kap4_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap4_EXIT_Condition;
	information = DIA_Opolos_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap5_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap5_EXIT_Condition;
	information = DIA_Opolos_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_PICKPOCKET(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 900;
	condition = DIA_Opolos_PICKPOCKET_Condition;
	information = DIA_Opolos_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Opolos_PICKPOCKET_Condition()
{
	return  C_Robbery ( 54 , 70 );
};

func void DIA_Opolos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
	Info_AddChoice(DIA_Opolos_PICKPOCKET,Dialog_Back,DIA_Opolos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Opolos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Opolos_PICKPOCKET_DoIt);
};

func void DIA_Opolos_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};

func void DIA_Opolos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};


instance DIA_OPOLOS_KAP6_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = dia_opolos_kap6_exit_condition;
	information = dia_opolos_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_opolos_kap6_exit_condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void dia_opolos_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

