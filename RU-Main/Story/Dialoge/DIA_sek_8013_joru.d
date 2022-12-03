

instance DIA_JORU_EXIT(C_Info)
{
	npc = sek_8013_joru;
	nr = 999;
	condition = dia_joru_exit_condition;
	information = dia_joru_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_joru_exit_condition()
{
	return TRUE;
};

func void dia_joru_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_joru_PICKPOCKET (C_Info)
{
	npc = sek_8013_joru;
	nr = 900;
	condition = dia_joru_PICKPOCKET_Condition;
	information = dia_joru_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_joru_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 43 );
};

func void dia_joru_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_joru_PICKPOCKET);
	Info_AddChoice(dia_joru_PICKPOCKET, Dialog_Back, dia_joru_PICKPOCKET_BACK);
	Info_AddChoice(dia_joru_PICKPOCKET, DIALOG_PICKPOCKET ,dia_joru_PICKPOCKET_DoIt);
};

func void dia_joru_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_joru_PICKPOCKET);
};

func void dia_joru_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_joru_PICKPOCKET);
};

instance DIA_JORU_HELLO (C_Info)
{
	npc = sek_8013_joru;
	nr = TRUE;
	condition = dia_joru_hello_condition;
	information = dia_joru_hello_info;
	permanent = FALSE;
	description = " Hi! I'm new here - tell me about Camp. " ;
};


func int dia_joru_hello_condition()
{
	return TRUE;
};

func void dia_joru_hello_info()
{
	AI_Output(other,self, " DIA_Joru_Hello_15_00 " );	// Hello! I'm new here and I need someone to tell me about Camp.

	if(PSI_TALK == TRUE)
	{
		AI_Output(self,other, " DIA_Joru_Hello_11_01 " );	// You picked the wrong time. The Guardians are preparing for battle, and we are working day and night.
		AI_Output(self,other, " DIA_Joru_Hello_11_02 " );	// I don't have time to chat. So do not distract me - unless, of course, you want to buy something.
		Log_CreateTopic(TOPIC_TRADERPSI,LOG_NOTE);
		B_LogEntry( TOPIC_TRADERPSI , " Blacksmith Yoru forges and sells weapons. He works at the forge most of the time. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Joru_Hello_11_03 " );	// I don't have time to chat. So don't distract me.
	};
};

instances of DIA_JORU_TRADE (C_Info)
{
	npc = sek_8013_joru;
	nr = 800;
	condition = dia_joru_trade_condition;
	information = dia_joru_trade_info;
	permanent = TRUE;
	description = " Show me what you've got. " ;
	trade = TRUE;
};

func int dia_joru_trade_condition()
{
	if (Npc_KnowsInfo(hero, dia_joru_hello) && ( PSI_TALK  ==  TRUE ) && Wld_IsTime( 7 , 0 , 22 , 0 )) ;
	{
		return TRUE;
	};
};

func void dia_joru_trade_info()
{
	where int daynow;
	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Joru_Trade_15_00 " );	// Show what you have.
	AI_Output(self,other, " DIA_Joru_Trade_11_01 " );	// Another thing! Here, here is everything I have today.
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));

	if((SekBelt_01 == FALSE) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)))
	{
		CreateInvItems(self,ItBE_Addon_SEK_01,1);
		SekBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);
};


instances DIA_JORU_ARMORCANTEACH (C_Info)
{
	npc = sek_8013_joru;
	nr = 5;
	condition = dia_joru_armorcanteach_condition;
	information = dia_joru_armorcanteach_info;
	permanent = TRUE;
	description = " Can you forge armor? " ;
};

func int dia_joru_armorcanteach_condition()
{
	if((JORU_TEACHARMOR == FALSE) && Npc_KnowsInfo(hero,dia_joru_hello) && (PSI_TALK == TRUE) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_SEK) || (hero.guild == GIL_NONE) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_joru_armorcanteach_info()
{
	AI_Output(other,self, " DIA_Joru_ArmorCanTeach_01_00 " );	// Can you forge armor?
	AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_01 " );	// I'm not very good at this. Not like Darrion!
	AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_02 " );	// He was a real master of this craft and forged armor for all the Guardians of the Swamp Brotherhood.
	AI_Output(other,self, " DIA_Joru_ArmorCanTeach_01_03 " );	// Where is Darrion now?
	AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_04 " );	// Nobody knows this. Nothing has been heard of him for a long time, and who knows what became of him!
	AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_05 " );	// So, if you wanted to learn how to forge good durable armor, it's unlikely that anyone could help you except him.
	AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_06 " );	// The only thing I can do is show you how to improve the beginner's loincloth a little...
	AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_07 " );	// ...or, say, I could sell you one of our acolytes' armor. Of course, provided that you are one of our brothers.
	AI_Output(other,self, " DIA_Joru_ArmorCanTeach_01_08 " );	// What does it take for you to show me how to upgrade the loincloth?
	AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_09 " );	// Well, you need to know at least a little about forging first.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self, " DIA_Joru_ArmorCanTeach_01_10 " );	// I know a little about forging.
		AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_11 " );	// Well, not bad already!
		AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_12 " );	// True, you probably understand yourself, you will have to pay for this.
		AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_13 " );	// And so, just tell us, and we will begin your training.
	}
	else
	{
		AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_14 " );	// As far as I can see, you don't even know how to hold a hammer.
		AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_15 " );	// So boy, go learn to forge first. Learn - then come.
		AI_Output(self,other, " DIA_Joru_ArmorCanTeach_01_16 " );	// And more. You understand that you will have to pay for my lessons.
	};
	JORU_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	; _ _ _ _ _ _
};

func void b_joru_teacharmor_1()
{
	AI_Output(self,other, " DIA_Joru_TeachArmor_1_01_01 " );	// So let's get started. Make sure you have all the necessary materials at hand. You take a heated steel billet ...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_PSICAMP_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Joru_TeachArmor_1_01_02 " );	// ...on the anvil you give it the shape of a plate and forge a piece of the workpiece into it....
		AI_Output(self,other, " DIA_Joru_TeachArmor_1_01_03 " );	// ...then you make fasteners and connect the plate to it, carefully forging the vanishing points...
		AI_Output(self,other, " DIA_Joru_TeachArmor_1_01_04 " );	// ...after that, carefully fasten the resulting element to the body of the armor - like this... look... (shows)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_05");	//...готово!
		AI_Output(self,other, " DIA_Joru_TeachArmor_1_01_06 " );	// That's all you need to know to upgrade this armor.
	};
};

func void b_joruarmorchoices()
{
	Info_ClearChoices(dia_joru_armorteach);
	Info_AddChoice(dia_joru_armorteach,Dialog_Back,dia_joru_armorteach_back);

	if(PLAYER_TALENT_SMITH[28] == FALSE)
	{
		Info_AddChoice(dia_joru_armorteach, " Brotherhood Girdle (Training Cost: 200 Coins) " ,dia_joru_armorteach_itar_sekbed_v1);
	};
	if((PLAYER_TALENT_SMITH[29] == FALSE) && (BuyTemplerLight == TRUE))
	{
		Info_AddChoice(dia_joru_armorteach,B_BuildLearnStringEx( " Guardian Light Armor (Training Cost: 3000 Coins " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_TPL_L_V1 )),dia_joru_armorteach_itar_tpl_l_v1);
	};
};

instance DIA_JORU_ARMORTEACH(C_Info)
{
	npc = sek_8013_joru;
	nr = 5;
	condition = dia_joru_armorteach_condition;
	information = dia_joru_armorteach_info;
	permanent = TRUE;
	description = " Teach me how to upgrade my armor. " ;
};

func int dia_joru_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (JORU_TEACHARMOR == TRUE) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_SEK) || (other.guild == GIL_TPL)))
	{
		if((PLAYER_TALENT_SMITH[28] == FALSE) || (PLAYER_TALENT_SMITH[29] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_joru_armorteach_info()
{
	AI_Output(other,self, " DIA_Joru_ArmorTeach_01_00 " );	// Teach me how to upgrade armor.
	if (Wld_IsTime( 7 , 0 , 22 , 0 ))
	{
		AI_Output(self,other, " DIA_Joru_ArmorTeach_01_01 " );	// And what do you want to know?
		b_joruarmorchoices();
	}
	else
	{
		AI_Output(self,other, " DIA_Joru_ArmorTeach_01_02 " );	// I've already finished working at the forge for today.
		AI_Output(self,other, " DIA_Joru_ArmorTeach_01_03 " );	// Come tomorrow morning, then we'll talk about it.
	};
};

func void dia_joru_armorteach_back()
{
	Info_ClearChoices(dia_joru_armorteach);
};

func void dia_joru_armorteach_itar_sekbed_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SEKBED_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,200);
			b_joru_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Joru_TeachArmor_04_00 " );	// You don't have enough gold! Come when you have it.
	};

	b_joruarmorchoices();
};

func void dia_joru_armorteach_itar_tpl_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3000);
			b_joru_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Joru_TeachArmor_04_00 " );	// You don't have enough gold! Come when you have it.
	};

	b_joruarmorchoices();
};


instance DIA_JORU_TRADEEARMOR (C_Info)
{
	npc = sek_8013_joru;
	nr = 3;
	condition = dia_joru_tradearmor_condition;
	information = dia_joru_tradearmor_info;
	permanent = TRUE;
	description = " Sell me the acolyte's armor. " ;
};


func int dia_joru_tradearmor_condition()
{
	if((other.guild == GIL_SEK) && (PSI_TALK == TRUE) && ((JORU_TRADEARMOR_MIDDLE == FALSE) || (JORU_TRADEARMOR_MIDDLE2 == FALSE)))
	{
		return TRUE;
	};
};

func void dia_joru_tradearmor_info()
{
	AI_Output(other,self, " DIA_Joru_TradeArmor_01_00 " );	// Sell me the acolyte's armor.
	Info_ClearChoices(dia_joru_tradearmor);
	Info_AddChoice(dia_joru_tradearmor,Dialog_Back,dia_joru_tradearmor_back);
	if(JORU_TRADEARMOR_MIDDLE == FALSE)
	{
		Info_AddChoice(dia_joru_tradearmor, " Acolyte Heavy Armor (Price: 1000 coins) " ,dia_joru_tradearmor_buy1);
	};
	if ( JORU_TRADEARMOR_MIDDLE2  ==  FALSE )
	{
		Info_AddChoice(dia_joru_tradearmor, " Acolyte Armor (Price: 450 coins) " ,dia_joru_tradearmor_buy11);
	};
};

func void dia_joru_tradearmor_back()
{
	Info_ClearChoices(dia_joru_tradearmor);
};

func void dia_joru_tradearmor_buy1()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_SLP_L))
	{
		AI_Output(self,other, " DIA_Joru_TradeArmor_Buy1_01_01 " );	// Great!
		AI_Print( " Obtained Heavy Acolyte Armor " );
		CreateInvItems(other,itar_slp_l,1);
		JORU_TRADEARMOR_MIDDLE = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Joru_TradeArmor_Buy1_01_02 " );	// No money - no armor.
	};
	Info_ClearChoices(dia_joru_tradearmor);
};

func void dia_joru_tradearmor_buy11()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,450))
	{
		AI_Output(self,other, " DIA_Joru_TradeArmor_Buy1_01_01 " );	// Great!
		AI_Print( " Obtained Acolyte Armor " );
		CreateInvItems(other,itar_slp_ul,1);
		JORU_TRADEARMOR_MIDDLE2 = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Joru_TradeArmor_Buy1_01_02 " );	// No money - no armor.
	};
	Info_ClearChoices(dia_joru_tradearmor);
};


instances DIA_JORU_SEKTEHEILEN (C_Info)
{
	npc = sek_8013_joru;
	nr = 1;
	condition = dia_joru_sekteheilen_condition;
	information = dia_joru_sekteheilen_info;
	permanent = FALSE;
	description = " Drink a drink! It helps with a headache. " ;
};


func int dia_joru_sekteheilen_condition()
{
	if ((Npc_HasItems(other,ItPo_Heal_Obsession_MY) >  0 ) && ( MY_SECTS_HEALTH  == LOG_Running) && Npc_KnowsInfo(hero, dia_heal_sectarian_obsession));
	{
		return TRUE;
	};
};

func void dia_joru_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Joru_SekteHeilen_01_00 " );	// Have a drink! It helps with headaches.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SECTEHEILENCOUNT = SECTEHEILENCOUNT  +  1 ;
	AI_Output(self,other, " DIA_Joru_SekteHeilen_01_01 " );	// My health has improved!
	AI_Output(self,other, " DIA_Joru_SekteHeilen_01_02 " );	// Thank you very much!
};

instance DIA_Joru_DoCrossBow(C_Info)
{
	npc = sek_8013_joru;
	nr = 1;
	condition = DIA_Joru_DoCrossBow_condition;
	information = DIA_Joru_DoCrossBow_info;
	permanent = FALSE;
	description = " Can you make crossbows? " ;
};

func int DIA_Joru_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Joru_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Joru_DoCrossBow_01_01 " );	// Can you make crossbows?
	AI_Output(self,other, " DIA_Joru_DoCrossBow_01_02 " );	// Crossbows? Nope. It's up to you to find a carpenter or joiner.
	AI_Output(other,self, " DIA_Joru_DoCrossBow_01_05 " );	// Got it.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap, " Only a carpenter or joiner can teach me how to make crossbows. " );
};
