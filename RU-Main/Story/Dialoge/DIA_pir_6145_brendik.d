

instance DIA_BRENDIK_EXIT(C_Info)
{
	npc = pir_6145_brand;
	nr = 999;
	condition = dia_brendik_exit_condition;
	information = dia_brendik_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_brendik_exit_condition()
{
	return TRUE;
};

func void dia_brendik_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRENDIK_HELLO(C_Info)
{
	npc = pir_6145_brand;
	nr = 8;
	condition = dia_brendik_hello_condition;
	information = dia_brendik_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_brendik_hello_condition()
{
	return TRUE;
};

func void dia_brendik_hello_info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_Brendik_Hello_01_00 " );	// Hey, you - stop!!!
	AI_Output(other,self,"DIA_Brendik_Hello_01_01");	//Кто? Я?
	AI_Output(self,other, " DIA_Brendik_Hello_01_02 " );	// Do you see anyone else here?
	AI_Output(self,other, " DIA_Brendik_Hello_01_04 " );	// Tell me - what do you need here and who are you anyway?!
	AI_Output(other,self, " DIA_Brendik_Hello_01_05 " );	// Yes, I am - just strolling here.
	AI_Output(self,other, " DIA_Brendik_Hello_01_06 " );	// Smart guy, huh? Are you a bandit by any chance?
	AI_Output(other,self, " DIA_Brendik_Hello_01_07 " );	// Of course not! Do I look like him?
	AI_Output(self,other, " DIA_Brendik_Hello_01_08 " );	// Hmmm...(looks closely) Okay. But look at me - if anything, I will quickly blow your head off! Understood?
	AI_RemoveWeapon(self);
	AI_Output(other,self,"DIA_Brendik_Hello_01_10");	//Понял.
	MEETBRENDIK = TRUE;
};


instance DIA_BRENDIK_FINDLOSTHUSB(C_Info)
{
	npc = pir_6145_brand;
	nr = 8;
	condition = dia_brendik_findlosthusb_condition;
	information = dia_brendik_findlosthusb_info;
	permanent = FALSE;
	description = " Is your name Brandyck? " ;
};


func int dia_brendik_findlosthusb_condition()
{
	if(MIS_FINDLOSTHUSB == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_brendik_findlosthusb_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Brendik_FindLostHusb_01_00 " );	// Is that your name Brandyck?
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_01 " );	// Well, let's say... (incredulously) What do you need?
	AI_Output(other,self, " DIA_Brendik_FindLostHusb_01_02 " );	// Your wife, Gritta, sent me. Do you remember her?
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_03 " );	// WHAT?! MY WIFE?! (panicked) Oh no! Only not this!
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_04");	//Не понял?!
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_05 " );	// Look, I want to live a normal life, so you better kill me!
	AI_Output(other,self, " DIA_Brendik_FindLostHusb_01_06 " );	// You're afraid of your wife more than the devil, but she seems to be a very nice woman...
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_07 " );	// She is simply unbearable: she always had only money and clothes on her mind.
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_08 " );	// 'Brandik, buy me a new dress!', 'Brandik, I want this hat!', 'Brandik, buy me boots made of oster leather'... Can you imagine how much these things cost?!
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_09 " );	// I worked like an ox, and she only did what she demanded money, and then complained that she made a mistake by marrying me.
	AI_Output(other,self, " DIA_Brendik_FindLostHusb_01_10 " );	// To be honest, she hasn't changed much. I met her because she owed money to a merchant.
	AI_Output(other,self, " DIA_Brendik_FindLostHusb_01_11 " );	// But I can also tell that she's really bored because she doesn't know if you're alive or dead.
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_12 " );	// (with a sneer) Oh, of course, her uncle Torben probably does not indulge her every whim.
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_13 " );	// Look, even if she just misses me and not the opportunity to drink my blood, I won't check it out.
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_14 " );	// In Khorinis I was a nobody, a rag, but here I am a Man!!! The guys in the camp respect me, Greg listens to me.
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_15 " );	// There's no way I'm going back to my old life!
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_16 " );	// Tell her I'm alive and well - period!
	AI_Output(other,self, " DIA_Brendik_FindLostHusb_01_17 " );	// As you wish, I don't care.
	AI_Output(self,other, " DIA_Brendik_FindLostHusb_01_18 " );	// That's great!
	; _ _ _ _ _ _
	BRENDIKNOTBACK = TRUE ;
};


instance DIA_BRENDIK_WHATDO(C_Info)
{
	npc = pir_6145_brand;
	nr = 8;
	condition = dia_brendik_whatdo_condition;
	information = dia_brendik_whatdo_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int dia_brendik_whatdo_condition()
{
	return TRUE;
};

func void dia_brendik_whatdo_info()
{
	AI_Output(other,self, " DIA_Brendik_WhatDo_01_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Brendik_WhatDo_01_01 " );	// Watching the bandits - Greg's orders!
	AI_Output(other,self, " DIA_Brendik_WhatDo_01_02 " );	// And why exactly in this place?
	AI_Output(self,other, " DIA_Brendik_WhatDo_01_03 " );	// From up here, the entrance to their camp is clearly visible!
	AI_Output(self,other, " DIA_Brendik_WhatDo_01_04 " );	// And besides, there are too many dangerous creatures in the swamps, and they simply won't get here.
	AI_Output(other,self, " DIA_Brendik_WhatDo_01_05 " );	// Got it.
};


instances DIA_BRENDIK_GOTOGREG (C_Info)
{
	npc = pir_6145_brand;
	nr = 8;
	condition = dia_brendik_gotogreg_condition;
	information = dia_brendik_gotogreg_info;
	permanent = FALSE;
	description = " Greg needs you! " ;
};


func int dia_brendik_gotogreg_condition()
{
	if(MEETBRENDIKGREG == TRUE)
	{
		return TRUE;
	};
};

func void dia_brendik_gotogreg_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Brendik_GoToGreg_01_00 " );	// Greg needs you!
	AI_Output(self,other, " DIA_Brendik_GoToGreg_01_01 " );	// Why else?
	AI_Output(other,self, " DIA_Brendik_GoToGreg_01_02 " );	// He's telling you to get back to camp.
	AI_Output(other,self, " DIA_Brendik_GoToGreg_01_03 " );	// Looks like he has another task for you.
	AI_Output(self,other, " DIA_Brendik_GoToGreg_01_04 " );	// Okay, I got it. Finally, I'll get out of this damn swamp!
	BRENDIKGOCAMP = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BRENDIK_HOW(C_Info)
{
	npc = pir_6145_brand;
	nr = 8;
	condition = dia_brendik_how_condition;
	information = dia_brendik_how_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_brendik_how_condition()
{
	if(BRENDIKNOTBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_brendik_how_info()
{
	AI_Output(other,self, " DIA_Brendik_How_01_01 " );	// How are you?
	AI_Output(self,other, " DIA_Brendik_How_01_02 " );	// Everything is fine. Just a little boring.
	AI_Output(self,other, " DIA_Brendik_How_01_03 " );	// Eh...(sadly) If only we had our ship! We certainly wouldn't be sitting here doing nothing.
};


instances DIA_BRENDIK_PICKPOCKET (C_Info)
{
	npc = pir_6145_brand;
	nr = 900;
	condition = dia_brendik_pickpocket_condition;
	information = dia_brendik_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_brendik_pickpocket_condition()
{
	return  C_Robbery ( 105 , 350 );
};

func void dia_brendik_pickpocket_info()
{
	Info_ClearChoices(dia_brendik_pickpocket);
	Info_AddChoice(dia_brendik_pickpocket, Dialog_Back, dia_brendik_pickpocket_back);
	Info_AddChoice(dia_brendik_pickpocket, DIALOG_PICKPOCKET , dia_brendik_pickpocket_doit);
};

func void dia_brendik_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_brendik_pickpocket);
};

func void dia_brendik_pickpocket_back()
{
	Info_ClearChoices(dia_brendik_pickpocket);
};

