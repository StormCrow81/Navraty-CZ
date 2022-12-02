

instance DIA_NOFELD_EXIT(C_Info)
{
	npc = vlk_6003_nofeld;
	nr = 999;
	condition = dia_nofeld_exit_condition;
	information = dia_nofeld_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nofeld_exit_condition()
{
	return TRUE;
};

func void dia_nofeld_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOFELD_HELLO(C_Info)
{
	npc = vlk_6003_nofeld;
	nr = 1;
	condition = dia_nofeld_hello_condition;
	information = dia_nofeld_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " Hello " ;
};


func int dia_nofeld_hello_condition()
{
	if(MEETNOFELD == FALSE)
	{
		return TRUE;
	};
};

func void dia_nofeld_hello_info()
{
	AI_Output(other,self,"DIA_Nofeld_Hello_01_01");	//Привет.
	AI_Output(self,other, " DIA_Nofeld_Hello_01_02 " );	// Ah, you're the new one. How do you like our camp?
	AI_Output(other,self, " DIA_Nofeld_Hello_01_03 " );	// Well, so... cute.
	AI_Output(self,other, " DIA_Nofeld_Hello_01_04 " );	// Yes, the place is warm. The main thing is that it is warm here and here you can not be afraid for your life.
	AI_Output(self,other, " DIA_Nofeld_Hello_01_05 " );	// Not what's out there. Every now and then, someone prowls around the cave. You have to keep your eyes open!
	AI_Output(self,other, " DIA_Nofeld_Hello_01_06 " );	// Relax a little and that's it, consider that you are already a corpse. You won’t even notice how someone sneaks up behind you and chop off your head.
	AI_Output(other,self, " DIA_Nofeld_Hello_01_07 " );	// Were the monsters trying to attack you here in the camp?
	AI_Output(self,other, " DIA_Nofeld_Hello_01_08 " );	// No, it didn't get to that point. And for that matter, guys, that at the entrance they will quickly deal with an uninvited guest.
	AI_Output(other, self, " DIA_Nofeld_Hello_01_10 " );	// Have you seen something that looks like a dragon here by any chance?
	AI_Output(self,other, " DIA_Nofeld_Hello_01_11 " );	// Dragon? No, bro, I haven't. And in general, I always thought that these were all fairy tales.
	AI_Output(other,self,"DIA_Nofeld_Hello_01_12");	//Ясно.
	MEETNOFELD = TRUE;
};


instance DIA_NOFELD_HELLO_TEACH(C_Info)
{
	npc = vlk_6003_nofeld;
	nr = 1;
	condition = dia_nofeld_hello_teach_condition;
	information = dia_nofeld_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = " I heard you're a smart guy. " ;
};


func int dia_nofeld_hello_teach_condition()
{
	if((MEETNOFELD == TRUE) && (NOFELDTEACHER == TRUE) && (NOFELDREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_nofeld_hello_teach_info()
{
	AI_Output(other,self, " DIA_Nofeld_Hello_Teach_01_01 " );	// I heard you're a smart guy.
	AI_Output(self,other,"DIA_Nofeld_Hello_Teach_01_02");	//И что?
	AI_Output(other,self, " DIA_Nofeld_Hello_Teach_01_03 " );	// Well, I was wondering if you could help me become more agile?
	AI_Output(self,other, " DIA_Nofeld_Hello_Teach_01_04 " );	// Well... I could show you a couple of tricks that would definitely increase your dexterity.
	AI_Output(other,self,"DIA_Nofeld_Hello_Teach_01_05");	//Покажешь?
	AI_Output(self,other, " DIA_Nofeld_Hello_Teach_01_06 " );	// Why not? Tell me when you're ready.
	NOFELDREADYTEACH = TRUE;
};


var int nofeld_markedex;

instance DIA_NOFELD_TEACH(C_Info)
{
	npc = vlk_6003_nofeld;
	nr = 20;
	condition = dia_nofeld_teach_condition;
	information = dia_nofeld_teach_info;
	permanent = TRUE;
	description = " Let's start training. " ;
};


func int dia_nofeld_teach_condition()
{
	if((MEETNOFELD == TRUE) && (NOFELDREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_nofeld_teach_info()
{
	AI_Output(other,self, " DIA_Nofeld_Teach_01_01 " );	// Let's start training.
	NOFELD_MERKEDEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_nofeld_teach);
	Info_AddChoice(dia_nofeld_teach,Dialog_Back,dia_nofeld_teach_back);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_nofeld_teach_1);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_nofeld_teach_5);
};

func void dia_nofeld_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > NOFELD_MERKEDEX)
	{
		AI_Output(self,other, " DIA_Nofeld_Teach_Back_01_01 " );	// Here. Now you have become more dexterous!
	};
	Info_ClearChoices(dia_nofeld_teach);
};

func void dia_nofeld_teach_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(dia_nofeld_teach);
	Info_AddChoice(dia_nofeld_teach,Dialog_Back,dia_nofeld_teach_back);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_nofeld_teach_1);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_nofeld_teach_5);
};

func void dia_nofeld_teach_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(dia_nofeld_teach);
	Info_AddChoice(dia_nofeld_teach,Dialog_Back,dia_nofeld_teach_back);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_nofeld_teach_1);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_nofeld_teach_5);
};

