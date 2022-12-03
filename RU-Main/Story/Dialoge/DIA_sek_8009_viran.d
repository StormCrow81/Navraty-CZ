

instance DIA_VIRAN_EXIT(C_Info)
{
	npc = sek_8009_viran;
	nr = 999;
	condition = dia_viran_exit_condition;
	information = dia_viran_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_viran_exit_condition()
{
	return TRUE;
};

func void dia_viran_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_viran_PICKPOCKET(C_Info)
{
	npc = sek_8009_viran;
	nr = 900;
	condition = dia_viran_PICKPOCKET_Condition;
	information = dia_viran_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_viran_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void dia_viran_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_viran_PICKPOCKET);
	Info_AddChoice(dia_viran_PICKPOCKET, Dialog_Back, dia_viran_PICKPOCKET_BACK);
	Info_AddChoice(dia_viran_PICKPOCKET,DIALOG_PICKPOCKET,dia_viran_PICKPOCKET_DoIt);
};

func void dia_viran_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_viran_PICKPOCKET);
};

func void dia_viran_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_viran_PICKPOCKET);
};

instance DIA_VIRAN_MAGICSYMBOLS(C_Info)
{
	npc = sek_8009_viran;
	nr = 1;
	condition = dia_viran_magicsymbols_condition;
	information = dia_viran_magicsymbols_info;
	permanent = TRUE;
	important = FALSE;
	description = " I have business with you. " ;
};


func int dia_viran_magicsymbols_condition()
{
	if((CANMAKESYMBOLS == TRUE) && (SYMBOLSMAKEDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_viran_magicsymbols_info()
{
	AI_Output(other,self, " DIA_Viran_MagicSymbols_01_00 " );	// I have business with you.

	if(VIRANFIRSTTALKSYMBOLS == FALSE)
	{
		AI_Output(self,other, " DIA_Viran_MagicSymbols_01_01 " );	// (angrily) What else is this? Spread, but only quickly.
		AI_Output(other,self, " DIA_Viran_MagicSymbols_01_02 " );	// Idol Oran said that you could help me put the magic symbols on the body.
		AI_Output(other,self, " DIA_Viran_MagicSymbols_01_03 " );	// As one of the members of the Brotherhood, I can now wear them too!
		AI_Output(self,other, " DIA_Viran_MagicSymbols_01_04 " );	// Ah, here's the thing. Of course I will help you. It does not take a lot of time.
		AI_Output(self,other, " DIA_Viran_MagicSymbols_01_05 " );	// Are you sure you want to do this?
		VIRANFIRSTTALKSYMBOLS = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Viran_MagicSymbols_01_06 " );	// (grouchily) So what this time?
		AI_Output(other,self, " DIA_Viran_MagicSymbols_01_07 " );	// I still decided to put magic symbols on my body. Will you help me?
		AI_Output(self,other, " DIA_Viran_MagicSymbols_01_08 " );	// Okay...(doubtfully) Are you sure about that?
	};
	Info_ClearChoices(dia_viran_magicsymbols);
	Info_AddChoice(dia_viran_magicsymbols, " Yes, of course! " ,dia_viran_magicsymbols_yes);
	Info_AddChoice(dia_viran_magicsymbols, " No, that's not for me. " ,dia_viran_magicsymbols_no);
};

func void dia_viran_magicsymbols_yes()
{
	PlayVideo("RET2_BlackScreen.bik");
	other.protection[PROT_MAGIC] += 5;
	REALPROTMAGIC += 5;
	AI_Print(NAME_SEK_MAGIC);
	Snd_Play("LevelUp");
	SYMBOLSMAKEDONE = TRUE;
	HelmIsUpTemp = FALSE ;
	AI_Output(self,other, " DIA_Viran_MagicSymbols_Yes_01_01 " );	// That's all and done! The magic of these sacred symbols will now protect you.
	AI_Output(other,self,"DIA_Viran_MagicSymbols_Yes_01_02");	//Спасибо.
	Info_ClearChoices(dia_viran_magicsymbols);
};

func void day_viran_magicsymbols_no()
{
	AI_Output(other,self, " DIA_Viran_MagicSymbols_No_01_01 " );	// No, it's probably not for me.
	AI_Output(self,other, " DIA_Viran_MagicSymbols_No_01_02 " );	// Okay, whatever you say.
	Info_ClearChoices(dia_viran_magicsymbols);
};

instance DIA_Viran_Bold(C_Info)
{
	npc = sek_8009_viran;
	nr = 899;
	condition = DIA_Viran_Bold_condition;
	information = DIA_Viran_Bold_info;
	permanent = TRUE;
	description = " Shave my head. " ;
};

func int DIA_Viran_Bold_condition()
{
	if((HeroBoldHead == FALSE) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_SEK) || (hero.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void DIA_Viran_Bold_info()
{
	AI_Output(other,self, " DIA_Viran_Bold_01_00 " );	// Shave my head.
	AI_Output(self,other, " DIA_Viran_MagicSymbols_01_08 " );	// Okay...(doubtfully) Are you sure about that?
	Info_ClearChoices(DIA_Viran_Bold);
	Info_AddChoice(DIA_Viran_Bold, " Yes, of course! " ,DIA_Viran_Bold_Yes);
	Info_AddChoice(DIA_Viran_Bold, " No, this is not for me. " ,DIA_Viran_Bold_No);
};

func void DIA_Viran_Bold_Yes()
{
	PlayVideo("RET2_BlackScreen.bik");
	HeroBoldHead = TRUE;
	Ext_RemoveFromSlot(hero,"BIP01 HEAD");
	Npc_RemoveInvItems(hero,ITMI_GERALTHAIR,Npc_HasItems(hero,ITMI_GERALTHAIR));
	GeraltHead = FALSE ;

	if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
	}
	else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
	}
	else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
	}
	else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
	};

	AI_Output(other,self,"DIA_Viran_MagicSymbols_Yes_01_02");	//Спасибо.
	Info_ClearChoices(DIA_Viran_Bold);
};

func void DIA_Viran_Bold_No()
{
	AI_Output(other,self, " DIA_Viran_MagicSymbols_No_01_01 " );	// No, it's probably not for me.
	AI_Output(self,other, " DIA_Viran_MagicSymbols_No_01_02 " );	// Okay, whatever you say.
	Info_ClearChoices(DIA_Viran_Bold);
};

instance DIA_VIRAN_WHATYOUDO(C_Info)
{
	npc = sek_8009_viran;
	nr = 1;
	condition = dia_viran_whatyoudo_condition;
	information = dia_viran_whatyoudo_info;
	permanent = FALSE;
	important = FALSE;
	description = " What are you doing? " ;
};

func int dia_viran_whatyoudo_condition()
{
	return TRUE;
};

func void dia_viran_whatyoudo_info()
{
	AI_Output(other,self, " DIA_Viran_WhatYouDo_01_00 " );	// What are you doing?
	AI_Output(self,other, " DIA_Viran_WhatYouDo_01_01 " );	// Can't you see? Helping Yora sharpen blades for Guardian swords.
	AI_Output(other,self, " DIA_Viran_WhatYouDo_01_02 " );	// Why do you need so many weapons?
	AI_Output(self,other, " DIA_Viran_WhatYouDo_01_03 " );	// Guy, open your eyes! The entire Valley of Mines is simply teeming with orcs, and a few days ago they were already seen not far from the passage.
	AI_Output(self,other, " DIA_Viran_WhatYouDo_01_04 " );	// I'm sure they'll be here soon too. And we don't want to be taken by surprise.
};


instance DIA_VIRAN_NEEDWEAPONS(C_Info)
{
	npc = sek_8009_viran;
	nr = 4;
	condition = dia_viran_needweapons_condition;
	information = dia_viran_needweapons_info;
	permanent = FALSE;
	description = " Can I buy weapons here? " ;
};


func int dia_viran_needweapons_condition()
{
	return TRUE;
};

func void dia_viran_needweapons_info()
{
	AI_Output(other,self, " DIA_Viran_NeedWeapons_01_00 " );	// Can I buy weapons here?
	AI_Output(self,other, " DIA_Viran_NeedWeapons_01_01 " );	// I don't have one. Yoru is doing it - talk to him.
};


instance DIA_VIRAN_HOWTHINGS(C_Info)
{
	npc = sek_8009_viran;
	nr = 4;
	condition = dia_viran_howthings_condition;
	information = dia_viran_howthings_info;
	permanent = TRUE;
	description = " So, how are the preparations for the defense going? " ;
};


func int dia_viran_howthings_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_viran_whatyoudo ) & & Wld_IsTime ( 8 , 0 , 22 , 0 ))
	{
		return TRUE;
	};
};

func void dia_viran_howthings_info()
{
	AI_Output(other,self, " DIA_Viran_HowThings_01_00 " );	// Well, how are the preparations for the defense going?
	AI_Output(self,other, " DIA_Viran_HowThings_01_01 " );	// (annoyed) Don't disturb my work!
};


instance DIA_VIRAN_NEEDSTEEL(C_Info)
{
	npc = sek_8009_viran;
	nr = 4;
	condition = dia_viran_needsteel_condition;
	information = dia_viran_needsteel_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_viran_needsteel_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_become_whatyoudo ) && ( PSI_TALK  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_viran_needsteel_info()
{
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_00 " );	// Wait a minute...
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_01");	//Что еще?
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_02 " );	// There's one job here, just right for a guy like you.
	AI_Output(other,self, " DIA_Viran_NeedSteel_01_03 " );	// And what is it?
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_05 " );	// You see, lately we have been experiencing an extreme shortage of material for the production of weapons and armor.
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_06 " );	// Namely, steel billets.
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_07");	//И что же?
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_08 " );	// And the fact that if you managed to get a small amount of steel for us, it would be quite good.
	AI_Output(other,self, " DIA_Viran_NeedSteel_01_09 " );	// And what will I get for my service?
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_13 " );	// Say, for your help, I could give you... mmm...
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_14 " );	// ...one very good weapon from our arsenal.
	AI_Output(other,self, " DIA_Viran_NeedSteel_01_15 " );	// Which one exactly?
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_16 " );	// Do what I asked you to do first. And then you'll know which one.
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_17 " );	// I can only say one thing. How much steel you bring - you will receive such a weapon.
	AI_Output(self,other, " DIA_Viran_NeedSteel_01_18 " );	// Well, what do you say?
	Info_ClearChoices(dia_viran_needsteel);
	Info_AddChoice(dia_viran_needsteel, " Okay. But just try to fool me! " ,dia_viran_needsteel_ja);
	Info_AddChoice(dia_viran_needsteel, " This is out of the question. " ,dia_viran_needsteel_nein);
};

func void dia_viran_needsteel_ja()
{
	AI_Output(other,self, " DIA_Viran_NeedSteel_Ja_01_00 " );	// Good. But just try to fool me!
	AI_Output(self,other, " DIA_Viran_NeedSteel_Ja_01_01 " );	// What are you doing! Trust me, you won't regret it.
	AI_Output(other,self,"DIA_Viran_NeedSteel_Ja_01_02");	//Надеюсь.
	VIRAN_BRINGSTEEL = LOG_Running;
	Log_CreateTopic(TOPIC_VIRANBRINGSTEEL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VIRANBRINGSTEEL,LOG_Running);
	B_LogEntry( TOPIC_VIRANBRINGSTEEL , " Viran asked me to bring him as many steel pieces as possible. " );
	Info_ClearChoices(dia_viran_needsteel);
};

func void dia_viran_needsteel_nein()
{
	AI_Output(other,self, " DIA_Viran_NeedSteel_Nein_01_00 " );	// I'm not satisfied with these conditions.
	AI_Output(self,other, " DIA_Viran_NeedSteel_Nein_01_01 " );	// Well, as you know.
	Info_ClearChoices(dia_viran_needsteel);
};


instance DIA_VIRAN_BRINGSTEEL(C_Info)
{
	npc = sek_8009_viran;
	nr = 5;
	condition = dia_viran_bringsteel_condition;
	information = dia_viran_bringsteel_info;
	permanent = TRUE;
	description = " I brought steel. " ;
};


func int dia_viran_bringsteel_condition()
{
	if((VIRAN_BRINGSTEEL == LOG_Running) && (Npc_HasItems(other,ItMiSwordraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_viran_bringsteel_info()
{
	var C_Item EquipWeap;
	var int countsteel;
	AI_Output(other,self, " DIA_Viran_BringSteel_01_00 " );	// I brought steel.
	AI_Output(self,other, " DIA_Viran_BringSteel_01_01 " );	// Okay, let's see how much steel you brought in.
	countsteel = Npc_HasItems(other,ItMiSwordraw);
	if((countsteel >= 1) && (countsteel <= 3))
	{
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other, " DIA_Viran_BringSteel_01_02 " );	// (indignantly) Is that all you could get?!
		AI_Output(self,other, " DIA_Viran_BringSteel_01_03 " );	// Yes, this is not even enough to forge a more or less decent blade!
		AI_Output(other,self, " DIA_Viran_BringSteel_01_04 " );	// Where is my reward?
		AI_Output(self,other, " DIA_Viran_BringSteel_01_05 " );	// Oh yeah, your reward... (snidely)
		AI_Output(self,other, " DIA_Viran_BringSteel_01_06 " );	// Here - take it. Just to your credit.
		if(countsteel == 1)
		{
			B_GiveInvItems(self,other,itmw_1h_misc_gsword,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_ShortSword3,1);
			B_GivePlayerXP(50);
		};
	}
	else if((countsteel > 3) && (countsteel <= 5))
	{
		B_GivePlayerXP(200);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other, " DIA_Viran_BringSteel_01_07 " );	// Not bad. Although, to be honest, I was expecting more...
		AI_Output(self,other, " DIA_Viran_BringSteel_01_08 " );	// But it's still better than nothing.
		AI_Output(other,self, " DIA_Viran_BringSteel_01_09 " );	// Where is my reward?
		AI_Output(self,other, " DIA_Viran_BringSteel_01_10 " );	// Oh yeah, your reward... (sigh)
		AI_Output(self,other, " DIA_Viran_BringSteel_01_11 " );	// Here, take this. You still don't deserve more!
		B_GiveInvItems(self,other,ItMw_Schwert, 1 );
	}
	else if((countsteel > 5) && (countsteel <= 7))
	{
		B_GivePlayerXP(400);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other, " DIA_Viran_BringSteel_01_12 " );	// Oh! Quite good!
		AI_Output(self,other, " DIA_Viran_BringSteel_01_13 " );	// That's about as much as I expected from you.
		AI_Output(other,self, " DIA_Viran_BringSteel_01_14 " );	// How about my reward?
		AI_Output(self,other, " DIA_Viran_BringSteel_01_16 " );	// Here, take this thing. I think it will serve you well.
		B_GiveInvItems(self,other,ItMw_Bartaxt,1);
	}
	else if((countsteel > 7) && (countsteel <= 15))
	{
		B_GivePlayerXP(600);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other, " DIA_Viran_BringSteel_01_17 " );	// Man, where did you get all these steel billets from?
		AI_Output(self,other, " DIA_Viran_BringSteel_01_18 " );	// This is way more than I expected.
		AI_Output(other,self, " DIA_Viran_BringSteel_01_19 " );	// How about my reward?
		AI_Output(self,other, " DIA_Viran_BringSteel_01_20 " );	// Of course! Believe me, I will not remain in debt.
		AI_Output(self,other, " DIA_Viran_BringSteel_01_21 " );	// Here, take this. Excellent thing.
		B_GiveInvItems(self,other,ItMw_Schwert4, 1 );
	}
	else if(countsteel > 15)
	{
		B_GivePlayerXP(1000);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other, " DIA_Viran_BringSteel_01_22 " );	// I can't believe my eyes! Where do you get so many steel blanks from?
		AI_Output(self,other, " DIA_Viran_BringSteel_01_23 " );	// This exceeded all my expectations. I didn't even think you'd be able to get that much steel.
		AI_Output(other,self, " DIA_Viran_BringSteel_01_24 " );	// How about my reward?
		AI_Output(self,other, " DIA_Viran_BringSteel_01_25 " );	// No problem, man!
		AI_Output(self,other, " DIA_Viran_BringSteel_01_26 " );	// Here, take this thing. Believe me, this is the best weapon that I have!
		B_GiveInvItems(self,other,itmw_1h_mace_107,1);
	};
	Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
	VIRAN_BRINGSTEEL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_VIRANBRINGSTEEL,LOG_SUCCESS);
};


DIA_VIRAN_SEKTEHEILEN (C_Info) instances
{
	npc = sek_8009_viran;
	nr = 1;
	condition = dia_viran_sekteheilen_condition;
	information = dia_viran_sekteheilen_info;
	permanent = FALSE;
	description = " Drink a drink! It helps with a headache. " ;
};


func int dia_viran_sekteheilen_condition()
{
	if ((Npc_HasItems(other,ItPo_Heal_Obsession_MY) >  0 ) && ( MY_SECTS_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero, dia_heal_sectarian_obsession));
	{
		return TRUE;
	};
};

func void dia_viran_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Viran_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Output(self,other, " DIA_Viran_SekteHeilen_01_01 " );	// My head...it's gone!
	AI_Output(self,other, " DIA_Viran_SekteHeilen_01_02 " );	// Thank you brother.
};

