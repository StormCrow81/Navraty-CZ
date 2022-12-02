

instance DIA_Boltan_EXIT(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 999;
	condition = DIA_Boltan_EXIT_Condition;
	information = DIA_Boltan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Boltan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Boltan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Boltan_PICKPOCKET(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 998;
	condition = DIA_Boltan_PICKPOCKET_Condition;
	information = DIA_Boltan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Boltan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 18 , 10 );
};

func void DIA_Boltan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Boltan_PICKPOCKET);
	Info_AddChoice(DIA_Boltan_PICKPOCKET,Dialog_Back,DIA_Boltan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Boltan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Boltan_PICKPOCKET_DoIt);
};

func void DIA_Boltan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Boltan_PICKPOCKET);
};

func void DIA_Boltan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Boltan_PICKPOCKET);
};

instance DIA_Boltan_HELLO (C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HALLO_Condition;
	information = DIA_Boltan_HELLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Boltan_HELLO_Info()
{
	AI_Output(self,other, " DIA_Boltan_Add_05_00 " );	// What do you need?
};


instance DIA_Boltan_ToConvicts(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 2;
	condition = DIA_Boltan_ToConvicts_Condition;
	information = DIA_Boltan_ToConvicts_Info;
	permanent = TRUE;
	description = " I want to see the prisoners. " ;
};


func int DIA_Boltan_ToConvicts_Condition()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info()
{
	AI_Output(other,self, " DIA_Boltan_Add_15_01 " );	// I want to see the prisoners.
	if ((Chapter ==  3 ) && (MY_RescueBennet !=  LOG_SUCCESS ))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other, " DIA_Boltan_Add_05_07 " );	// Yeah, go say goodbye to your buddy.
		}
		else
		{
			AI_Output(self,other, " DIA_Boltan_Add_05_06 " );	// We arrested the pig that killed the paladin Lothar.
		};
	}
	if  _ _ _  _ _ _ _ _  _ _ _ _ _  _ _ _ _ _  _ _ _ _ _  _ _ _ _ _  _  _ _
	{
		AI_Output(self,other, " DIA_Boltan_Add_05_02 " );	// All chambers are now empty.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Boltan_Add_05_04 " );	// Okay, mate.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//Конечно.
	}
	else
	{
		AI_Output(self,other, " DIA_Boltan_Add_05_03 " );	// Go, but don't stay there too long, okay?
	};
};


instance DIA_Boltan_HalloBennet(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloBennet_Condition;
	information = DIA_Boltan_HalloBennet_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloBennet_Condition()
{
	if ((Chapter ==  3 ) && (MY_RescueBennet !=  LOG_SUCCESS ) && (other.guild ==  GIL_SLD ))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloBennet_Info()
{
	AI_Output(self,other, " DIA_Boltan_Add_05_08 " );	// You didn't come here to get your friend out of here, did you?
	AI_Output(self,other, " DIA_Boltan_Add_05_09 " );	// Forget it! As soon as I raise the alarm, the boys will be here in no time!
	AI_Output(self,other, " DIA_Boltan_Add_05_10 " );	// And then we'll make a cutlet out of you! (dirty laugh)
};


instance DIA_Boltan_HalloCanthar(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloCanthar_Condition;
	information = DIA_Boltan_HalloCanthar_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloCanthar_Condition()
{
	if (((Chapter !=  3 ) || ((Chapter ==  3 ) && ((MY_RescueBennet ==  LOG_SUCCESS ) || (other.guild !=  GIL_SLD )))) && (Canthar_WiederRaus ==  TRUE ) && (Canthar_Ausgeliefert = =  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloCanthar_Info()
{
	AI_Output(self,other, " DIA_Boltan_Add_05_11 " );	// Hey, you're the guy who filed the complaint against Kantar, the merchant.
	AI_Output(self,other, " DIA_Boltan_Add_05_12 " );	// A lot of people came to plead for him. Dear people.
	AI_Output(self,other, " DIA_Boltan_Add_05_13 " );	// There must have been some misunderstanding. It happens.
	AI_Output(self,other, " DIA_Boltan_Add_05_14 " );	// In the future, you should be more careful about who you want to put in jail.
};


instance DIA_BOLTAN_SARAHELPSTWO (C_Info) .
{
	npc = Mil_313_Boltan;
	nr = 2;
	condition = dia_boltan_sarahelpstwo_condition;
	information = dia_boltan_sarahelpstwo_info;
	permanent = FALSE;
	description = " I need something from you! " ;
};


func int dia_boltan_sarahelpstwo_condition()
{
	if(MIS_SARAHELPSTWO == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_boltan_sarahelpstwo_info()
{
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_01_02 " );	// You took the ring from the merchant Sarah. Give it to me!
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_01_03 " );	// What? Where did you even get this from?
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_01_04 " );	// She told me about it herself.
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_01_05 " );	// Yes?! (angrily) That's rubbish!
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_01_06 " );	// So don't play the fool and bring him here.
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_01_07 " );	// (brazenly) Aha! Of course!
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_01_08 " );	// This ring is mine! So forget about it.
	Info_ClearChoices(dia_boltan_sarahelpstwo);
	Info_AddChoice(dia_boltan_sarahelpstwo, " Give me the ring or you'll regret it! " ,dia_boltan_sarahelpstwo_kill);
	Info_AddChoice(dia_boltan_sarahelpstwo, " Sell it to me then! " ,dia_boltan_sarahelpstwo_buy);
	if(other.guild == GIL_KDF)
	{
		Info_AddChoice(dia_boltan_sarahelpstwo, " Do you dare oppose the will of the Firebender? " ,dia_boltan_sarahelpstwo_kdf);
	};
	if(other.guild == GIL_PAL)
	{
		Info_AddChoice(dia_boltan_sarahelpstwo, " Do you dare disobey a paladin's command? " ,dia_boltan_sarahelpstwo_pal);
	};
	if(other.guild == GIL_MIL)
	{
		Info_AddChoice(dia_boltan_sarahelpstwo, " Then I'll tell Lord Andre that you stole this ring. " ,dia_boltan_sarahelpstwo_mil);
	};
};

func void dia_boltan_sarahelpstwo_kdf()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_KDF_01_00 " );	// Do you dare to oppose the will of the servant Innos?
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_KDF_01_01 " );	// No! What you! I... (stammering)
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_KDF_01_04 " );	// Here, sir, hold him.
	B_GiveInvItems(self,other,itri_sarafamilyring,1);
	B_LogEntry( TOPIC_SARAHELPSTWO , " Dumpty didn't argue with me because I'm a Firebender. He gave me Sarah's ring. " );
	AI_StopProcessInfos(self);
};

func void dia_boltan_sarahelpstwo_pal()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_PAL_01_00 " );	// Do you dare to oppose the will of the servant Innos?
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_PAL_01_01 " );	// No! What you! I... (stammering)
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_PAL_01_04 " );	// Here, hold it.
	B_GiveInvItems(self,other,itri_sarafamilyring,1);
	B_LogEntry( TOPIC_SARAHELPSTWO , " Dumpty didn't argue with me because I'm a paladin. He gave me Sarah's ring. " );
	AI_StopProcessInfos(self);
};

func void dia_boltan_sarahelpstwo_mil()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_MIL_01_00 " );	// Then I'll tell Lord Andre that you stole that ring.
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_MIL_01_01 " );	// And you think he'll believe you?
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_MIL_01_02 " );	// Why not? After all, I am a militia soldier just like you.
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_MIL_01_06 " );	// Okay...(viciously) Damn you! Here, take it!
	B_GiveInvItems(self,other,itri_sarafamilyring,1);
	B_LogEntry( TOPIC_SARAHELPSTWO , " I managed to 'convince' Boltan to give me the ring. Now I need to take it to Sarah. " );
	AI_StopProcessInfos(self);
};

func void dia_boltan_sarahelpstwo_buy()
{
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_Buy_01_00 " );	// Then sell it to me!
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_Buy_01_05 " );	// How much do you want for it?
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_Buy_01_06 " );	// Well... (thoughtfully) suppose I want for him...
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_Buy_01_07 " );	// Five hundred gold coins!
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_Buy_01_09 " );	// (snickeringly) That's a good price for something like this, isn't it?
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_Buy_01_11 " );	// Okay, I'll think about your suggestion.
	Info_ClearChoices(dia_boltan_sarahelpstwo);
	B_LogEntry( TOPIC_SARAHELPSTWO , " I managed to get Boltan to sell me Sarah's ring for five hundred gold pieces. " );
	BOLT ATTACHMENT = TRUE ;
};

func void dia_boltan_sarahelpstwo_kill()
{
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_Kill_01_00 " );	// Give me the ring or you'll regret it!
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_Kill_01_01 " );	// True? (laughs) And what are you going to do?
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwo_Kill_01_02 " );	// I'll just kick your ass, you bastard!
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_Kill_01_04 " );	// WHAT?!...(viciously) You still dare to threaten me?
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwo_Kill_01_05 " );	// Well, I'll show you now, sucker!
	CreateInvItems(self,itri_sarafamilyring,1);
	B_LogEntry( TOPIC_SARAHELPSTWO , " I couldn't get Boltan to give me Sarah's ring. Now the only way to get it back is to beat him. " );
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_BOLTAN_SARAHELPSTWOBUYRING(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = dia_boltan_sarahelpstwobuyring_condition;
	information = dia_boltan_sarahelpstwobuyring_info;
	permanent = TRUE;
	description = " Sell me Sarah's ring. " ;
};


func int dia_boltan_sarahelpstwobuyring_condition()
{
	if((MIS_SARAHELPSTWO == LOG_Running) && (BOLTANTRADERING == TRUE) && (BOLTANTRADERINGDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_boltan_sarahelpstwobuyring_info()
{
	AI_Output(other,self, " DIA_Boltan_SaraHelpsTwoBuyRing_01_00 " );	// Sell me Sarah's ring.
	AI_Output(self,other, " DIA_Boltan_SaraHelpsTwoBuyRing_01_01 " );	// Where's my five hundred gold pieces?
	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		B_GivePlayerXP(200);
		Npc_RemoveInvItems(other,ItMi_Gold,500);
		AI_Output(other,self, " DIA_Boltan_SaraHelpsTwoBuyRing_01_02 " );	// Here's your money.
		AI_Output(self,other, " DIA_Boltan_SaraHelpsTwoBuyRing_01_03 " );	// Good! Here, have your trinket.
		B_GiveInvItems(self,other,itri_sarafamilyring,1);
		B_LogEntry( TOPIC_SARAHELPSTWO , " I bought a ring from Boltan. Now I need to take it to Sarah. " );
		BOLT ATTRACTING DONE = TRUE ;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Boltan_SaraHelpsTwoBuyRing_01_06 " );	// I don't have them yet.
		AI_Output(self,other, " DIA_Boltan_SaraHelpsTwoBuyRing_01_07 " );	// Then come back when you have them.
		AI_StopProcessInfos(self);
	};
};

