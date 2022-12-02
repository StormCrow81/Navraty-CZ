

instances DIA_DIA_VLK_6130_BENCHEL_EXIT (C_Info)
{
	npc = vlk_6130_benchel;
	nr = 999;
	condition = dia_vlk_6130_benchel_exit_condition;
	information = dia_vlk_6130_benchel_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6130_benchel_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6130_benchel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6130_BENCHEL_MISSBRENDI (C_Info)
{
	npc = vlk_6130_benchel;
	nr = 1;
	condition = dia_vlk_6130_benchel_missbrendi_condition;
	info = dia_vlk_6130_benchel_missbrendi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_6130_benchel_missbrendi_condition()
{
	if(BENCHELTELLTHANKS == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_missbrendi_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_01 " );	// (breathing) Thanks for helping me!
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_02 " );	// If it wasn't for you, these bastards would have sent me to the next world!
	AI_Output(other,self, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_04 " );	// Calm down, boy. Is your name Benchel?
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_05 " );	// Yes, it's me Benchel.
	AI_Output(other,self, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_06 " );	// Then I want to tell you, Benchel, that Luthero has been waiting for you.
	AI_Output(other,self, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_08 " );	// You were supposed to take him the black brandy that Orlan gave you.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_13 " );	// Yes, yes. I was already on my way back to town to take Luthero the damn swill.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_14 " );	// But then these guys ran out from behind those bushes and surrounded me.
	AI_Output(other,self, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_18 " );	// What did they want from you?
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_24 " );	// In the tavern, I blurted out that I was carrying a very expensive product to a large merchant in Khorinis.
	AI_Output(other,self, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_25 " );	// Let me guess - black brandy?
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_28 " );	// Exactly. One bottle costs a fortune - to say the least!
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_30 " );	// It used to be brought from the mainland, but after merchant ships stopped entering our harbor, new shipments stopped coming.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendi_Info_01_31 " );	// That's why the price of this black brandy soared!
	B_LogEntry( TOPIC_BLACKBRENDI , " I helped Benchel deal with the bandits. " );
};


instance DIA_VLK_6130_BENCHEL_MISSBRENDIFOLLOW(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 1;
	condition = dia_vlk_6130_benchel_missbrendifollow_condition;
	information = dia_vlk_6130_benchel_missbrendifollow_info;
	permanent = FALSE;
	description = " We need to take this brandy to Luthero. " ;
};


func int dia_vlk_6130_benchel_missbrendifollow_condition()
{
	if (Npc_KnowsInfo(hero,dia_vlk_6130_benchel_missbrendi))
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_missbrendifollow_info()
{
	AI_Output(other,self, " DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_01 " );	// We need to take this brandy to Luthero.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_02 " );	// You're right! But ... but the city is still so far away, and the local area is simply teeming with bandits!
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_04 " );	// So I figured I'd rather stay here.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_07 " );	// I don't want to risk my life for junk anymore.
	AI_Output(other,self, " DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_11 " );	// What do you say if I help you get to the city gates?
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_12 " );	// Will you come with me?
	AI_Output(self,other, " DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_18 " );	// (thinks) Alright, let's go!
	B_LogEntry( TOPIC_BLACKBRENDI , " I've agreed to escort Benchel to the city gates. Looks like he's not going anywhere alone. So I'll have to babysit him for a while. " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	BENCHELFOLLOWME = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};

instance DIA_VLK_6130_BENCHEL_ARRIVED (C_Info)
{
	npc = vlk_6130_benchel;
	nr = 55;
	condition = dia_vlk_6130_benchel_arrived_condition;
	information = dia_vlk_6130_benchel_arrived_info;
	important = TRUE;
};

func int dia_vlk_6130_benchel_angekommen_condition()
{
	if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELFOLLOWME == TRUE) && (Npc_GetDistToWP(self,"CITY2") < 6000))
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_angekommen_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_00 " );	// Wait! I think I can do it myself.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_01 " );	// Oh, and by the way, while we were walking, I was thinking a little here...
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_02 " );	// ...and decided I've had enough of all this!
	AI_Output(other,self, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_03 " );	// What do you mean?
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_04 " );	// I've had enough of all these adventures!
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_05 " );	// I still can't come to my senses after that showdown with the bandits.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_06 " );	// So if you see Luthero, tell him I don't work for him anymore.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_09 " );	// Here, take these five bottles of Doomtrey black brandy and give them to him yourself!
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_10 " );	// He'll probably thank you for this. Or maybe even get a job. Hehe...
	B_GiveInvItems(self,other,itmi_blackbrendi,5);
	AI_Output(other,self, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_12 " );	// And what are you going to do now?
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_13 " );	// Absolutely nothing.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_14 " );	// I will sit all day in a tavern, drink beer and enjoy peace.
	AI_Output(other,self, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_15 " );	// Well, as you know. I'll pass on your words to Luther.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_16 " );	// Then good luck, mate! We will surely see you again.
	BENCHELLEAVEME = TRUE;
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"RestInTavern");
};

instances DIA_VLK_6130_BENCHEL_HALLO (C_Info)
{
	npc = vlk_6130_benchel;
	nr = 55;
	condition = dia_vlk_6130_benchel_hallo_condition;
	information = dia_vlk_6130_benchel_hallo_info;
	permanent = TRUE;
	description = " How are you, Benchel? " ;
};

func int dia_vlk_6130_benchel_hallo_condition()
{
	if(BENCHELLEAVEME == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_hallo_info()
{
	AI_Output(other,self, " DIA_VLK_6130_Benchel_Hallo_01_00 " );	// How are you?
	AI_Output(self,other, " DIA_VLK_6130_Benchel_Hallo_01_01 " );	// You can't do better, mate.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_Hallo_01_02 " );	// Never felt so calm!
};


instance DIA_VLK_6130_BENCH_GO (C_Info) .
{
	npc = vlk_6130_benchel;
	nr = 55;
	condition = dia_vlk_6130_benchel_go_condition;
	information = dia_vlk_6130_benchel_go_info;
	permanent = TRUE;
	description = " Let's go, I'll show you. " ;
};


func int dia_vlk_6130_benchel_go_condition()
{
	if((BENCHELLEAVEME == FALSE) && (BENCHELFOLLOWME == TRUE) && (MIS_BLACKBRENDI == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_go_info()
{
	AI_Output(other,self, " DIA_VLK_6130_Benchel_Go_01_00 " );	// Don't be afraid, let's go! I will accompany you.
	AI_Output(self,other, " DIA_VLK_6130_Benchel_Go_01_01 " );	// Okay, let's go...
	BENCHELFOLLOWME = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"FOLLOW");
};

