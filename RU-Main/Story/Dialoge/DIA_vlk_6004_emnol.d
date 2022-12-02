

instance DIA_EMNOL_EXIT(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 999;
	condition = dia_emnol_exit_condition;
	information = dia_emnol_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_emnol_exit_condition()
{
	return TRUE;
};

func void dia_emnol_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EMNOL_HELLO(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 1;
	condition = dia_emnol_hello_condition;
	information = dia_emnol_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " How are you? " ;
};


func int dia_emnol_hello_condition()
{
	if(MEETEMNOL == FALSE)
	{
		return TRUE;
	};
};

func void dia_emnol_hello_info()
{
	AI_Output(other,self, " DIA_Emnol_Hello_01_01 " );	// How are you?
	AI_Output(self,other, " DIA_Emnol_Hello_01_02 " );	// Hey? wait. You're the guy who just showed up here recently.
	AI_Output(other,self, " DIA_Emnol_Hello_01_03 " );	// ...'and everyone is talking about me' - I've heard that before, mate.
	AI_Output(self,other, " DIA_Emnol_Hello_01_04 " );	// I see you're sick of it...(laughs)
	AI_Output(self,other, " DIA_Emnol_Hello_01_05 " );	// You see, there's nothing really new going on here. Everything is the same.
	AI_Output(self,other, " DIA_Emnol_Hello_01_06 " );	// And suddenly you - like snow on your head! It's understandable that you get so much attention.
	AI_Output(other,self, " DIA_Emnol_Hello_01_07 " );	// What do you do at camp?
	AI_Output(self,other, " DIA_Emnol_Hello_01_08 " );	// I usually hunt like everyone else. And for the most part I hang around here, in a cave.
	AI_Output(other,self, " DIA_Emnol_Hello_01_10 " );	// Tell me, have you by any chance seen a dragon in the valley?
	AI_Output(self,other, " DIA_Emnol_Hello_01_11 " );	// (horrified) Are you kidding me mate? I have never seen such monsters in my life...
	AI_Output(other,self,"DIA_Emnol_Hello_01_12");	//Понятно...
	MEETEMNOL = TRUE;
};


instance DIA_EMNOL_HELLO_TEACH(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 1;
	condition = dia_emnol_hello_teach_condition;
	information = dia_emnol_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = " I heard you're a tough guy. " ;
};


func int dia_emnol_hello_teach_condition()
{
	if((MEETEMNOL == TRUE) && (EMNOLTEACHER == TRUE) && (EMNOLREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_emnol_hello_teach_info()
{
	AI_Output(other,self, " DIA_Emnol_Hello_Teach_01_01 " );	// I hear you're a tough guy, Emnol. Yes, you do look amazing!
	AI_Output(other,self, " DIA_Emnol_Hello_Teach_01_02 " );	// I wouldn't mind getting stronger. Can you train me?
	AI_Output(self,other, " DIA_Emnol_Hello_Teach_01_03 " );	// Well, let's see... Yeah, boy, you could use some muscle gain!
	AI_Output(self,other, " DIA_Emnol_Hello_Teach_01_04 " );	// But don't worry, we'll fix that quickly. It's hard for the weak to survive in this valley.
	AI_Output(self,other, " DIA_Emnol_Hello_Teach_01_05 " );	// Even though you don't come across as a wimp, you really could use a couple of workouts.
	EMNOLREADYTEACH = TRUE;
};


var int emnol_markestr;

instance DIA_EMNOL_TEACH(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 20;
	condition = dia_emnol_teach_condition;
	information = dia_emnol_teach_info;
	permanent = TRUE;
	description = " Let's start training. " ;
};


func int dia_emnol_teach_condition()
{
	if((MEETEMNOL == TRUE) && (EMNOLREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_emnol_teach_info()
{
	AI_Output(other,self, " DIA_Emnol_Teach_01_01 " );	// Let's start training.
	EMNOL_MERKESTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_emnol_teach);
	Info_AddChoice(dia_emnol_teach,Dialog_Back,dia_emnol_teach_back);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_emnol_teachstr_1);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_emnol_teachstr_5);
};

func void dia_emnol_teach_back()
{
	if(other.attribute[ATR_STRENGTH] > EMNOL_MERKESTR)
	{
		AI_Output(self,other, " DIA_Emnol_Teach_Back_01_01 " );	// (appreciatively) Now, much better. You have become stronger!
	};
	Info_ClearChoices(dia_emnol_teach);
};

func void dia_emnol_teachstr_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_emnol_teach);
	Info_AddChoice(dia_emnol_teach,Dialog_Back,dia_emnol_teach_back);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_emnol_teachstr_1);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_emnol_teachstr_5);
};

func void dia_emnol_teachstr_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_emnol_teach);
	Info_AddChoice(dia_emnol_teach,Dialog_Back,dia_emnol_teach_back);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_emnol_teachstr_1);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_emnol_teachstr_5);
};


instance DIA_EMNOL_HELLO_ORK(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 1;
	condition = dia_emnol_hello_ork_condition;
	information = dia_emnol_hello_ork_info;
	permanent = TRUE;
	important = FALSE;
	description = " Ask about orcs. " ;
};


func int dia_emnol_hello_ork_condition()
{
	if (( MEETEMNOL  ==  TRUE ) && ( MEETHARUMFOUR  ==  TRUE ) && ( EMNOLORKKNOWN  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_emnol_hello_ork_info()
{
	AI_Output(other,self, " DIA_Emnol_Hello_Ork_01_01 " );	// Elvais said that you met orcs in this valley.
	AI_Output(self,other, " DIA_Emnol_Hello_Ork_01_02 " );	// Yes, on the other side of the gorge, I saw creatures that looked like orcs.
	AI_Output(self,other, " DIA_Emnol_Hello_Ork_01_03 " );	// But those were some weird orcs... they looked more like ghosts!
	AI_Output(other,self, " DIA_Emnol_Hello_Ork_01_04 " );	// Ghost orcs?
	AI_Output(self,other, " DIA_Emnol_Hello_Ork_01_05 " );	// I can't say for sure, but they looked exactly like ghosts! But I did not dare to come closer, it was too dangerous.
	AI_Output(other,self, " DIA_Emnol_Hello_Ork_01_06 " );	// And where is the gorge in which you saw these ghosts?
	AI_Output(self,other, " DIA_Emnol_Hello_Ork_01_07 " );	// If you go west from our camp, you will soon run right into it.
	AI_Output(self,other, " DIA_Emnol_Hello_Ork_01_08 " );	// Just be careful if you're going there. The gorge is a very dangerous place!
	AI_Output(self,other, " DIA_Emnol_Hello_Ork_01_09 " );	// In addition to ghosts, there are also monsters that are always best avoided. This is my advice to you!
	AI_Output(other,self,"DIA_Emnol_Hello_Ork_01_10");	//Спасибо.
	EMNOLORKKNOWN = TRUE;
	B_LogEntry( TOPIC_URNAZULRAGE , " I talked to Emnol about the orcs here. He told me that he saw creatures that looked like orcs near the camp in the gorge. But even more they looked like ghosts. " );
	B_LogEntry( TOPIC_URNAZULRAGE , " It looks like I should visit the gorge. Maybe I'll find something there that can help in my search. If, of course, these ghosts are friendly towards me. And if Ulu-Mulu still means something to them. " );
};
