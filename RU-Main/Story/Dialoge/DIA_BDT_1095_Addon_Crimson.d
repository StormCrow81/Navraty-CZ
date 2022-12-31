
instance DIA_Addon_Crimson_EXIT(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 999;
	condition = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Crimson_PICKPOCKET(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 900;
	condition = DIA_Addon_Crimson_PICKPOCKET_Condition;
	information = DIA_Addon_Crimson_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Crimson_PICKPOCKET_Condition()
{
	return  C_Robbery ( 66 , 66 );
};

func void DIA_Addon_Crimson_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET,Dialog_Back,DIA_Addon_Crimson_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Crimson_PICKPOCKET_DoIt);
};

func void DIA_Addon_Crimson_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};

func void DIA_Addon_Crimson_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};


instance DIA_Addon_Crimson_Hi(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Hi_Condition;
	information = DIA_Addon_Crimson_Hi_Info;
	permanent = FALSE;
	description = " What are you doing? Are you melting our gold? " ;
};


func int DIA_Addon_Crimson_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_Crimson_Hi_15_00 " );	// What are you doing? Are you melting our gold?
	AI_Output(self,other, " DIA_Addon_Crimson_Hi_10_01 " );	// No, I'm making vegetable stew. Of course, I'm melting gold. I cast coins from it.
	AI_Output(self,other, " DIA_Addon_Crimson_Hi_10_02 " );	// Imagine, one evening Raven came up to me and threw me a casting mold.
	AI_Output(self,other, " DIA_Addon_Crimson_Hi_10_03 " );	// I can make a handful of coins out of one nugget. They are of such quality that you can't tell them from the real ones!
};


instance DIA_Addon_Crimson_How(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent = FALSE;
	description = " How many coins will you give me for a nugget? " ;
};


func int DIA_Addon_Crimson_How_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_Hi))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Crimson_How_Info()
{
	AI_Output(other,self, " DIA_Addon_Crimson_How_15_00 " );	// How many coins will you give me for a nugget?
	AI_Output(self,other, " DIA_Addon_Crimson_How_10_01 " );	// Well, I don't know you and all, but I like your spirit. For one nugget I'll give you...
	AI_Output(self,other, " DIA_Addon_Crimson_How_10_02 " );	// ...eight gold coins?
	AI_Output(other,self, " DIA_Addon_Crimson_How_10_03 " );	// Just eight gold pieces?
	AI_Output(self,other, " DIA_Addon_Crimson_How_10_04 " );	// You heard me! If that doesn't suit you, then you can keep your gold for yourself.
};

var int CrimsonMoreGold;

instance DIA_Addon_Crimson_Feilsch (C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent = FALSE;
	description = " Let's bargain! " ;
};


func int DIA_Addon_Crimson_Feilsch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Feilsch_Info()
{
	AI_Output(other,self, " DIA_Addon_Crimson_Feilsch_15_00 " );	// Let's bargain!

	if(RhetorikSkillValue[1] >= 40)
	{
		AI_Output(self,other, " DIA_Addon_Crimson_Feilsch_10_50 " );	// Hmmm... (shaking head) You're good at scamming people, am I right?
		AI_Output(self,other, " DIA_Addon_Crimson_Feilsch_10_51 " );	// Okay, I'll give you ten coins for every gold nugget. Are you satisfied now?
		AI_Output(other,self, " DIA_Addon_Crimson_Feilsch_10_52 " );	// Quite.
		CrimsonMoreGold = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Crimson_Feilsch_10_01 " );	// Hmmm... (thoughtfully) No! That's how much I give to every miner.
		AI_Output(other,self, " DIA_Addon_Crimson_Feilsch_15_02 " );	// But you said it was a special price.
		AI_Output(self,other, " DIA_Addon_Crimson_Feilsch_10_03 " );	// That's right! The special price everyone gets. Haha!
	};
};


instance DIA_Addon_Crimson_Gold(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 99;
	condition = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent = TRUE;
	description = " Sell gold bars... " ;
};


func int DIA_Addon_Crimson_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Crimson_Gold_Info()
{
	AI_Output(other,self, " DIA_Addon_Crimson_Gold_15_00 " );	// Let's trade...
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange all gold bars " ,DIA_Addon_Crimson_Gold_ALLE);

		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange ten gold bars " ,dia_addon_crimson_gold_10);
		};

		Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange one gold bar " ,DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Crimson_Gold_10_01 " );	// But you don't have a single nugget with you.
	};
};

func void DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
};

func void DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems(other,ItMi_Addon_GoldNugget);
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,CurrentNuggets);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,Npc_HasItems(self,ItMi_Addon_GoldNugget));

	if(CrimsonMoreGold == TRUE)
	{
		B_GiveInvItems(self,other,ItMi_Gold,CurrentNuggets * 10);
	}
	else
	{
		B_GiveInvItems(self,other,ItMi_Gold,CurrentNuggets * 8);
	};

	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange all gold bars " ,DIA_Addon_Crimson_Gold_ALLE);
		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange ten gold bars " ,dia_addon_crimson_gold_10);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange one gold bar " ,DIA_Addon_Crimson_Gold_1);
	};
};

func void dia_addon_crimson_gold_10()
{
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,10);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,Npc_HasItems(self,ItMi_Addon_GoldNugget));

	if(CrimsonMoreGold == TRUE)
	{
		B_GiveInvItems(self,other,ItMi_Gold,100);
	}
	else
	{
		B_GiveInvItems(self,other,ItMi_Gold,80);
	};

	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange all gold bars " ,DIA_Addon_Crimson_Gold_ALLE);
		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange ten gold bars " ,dia_addon_crimson_gold_10);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange one gold bar " ,DIA_Addon_Crimson_Gold_1);
	};
};

func void DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,1);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,Npc_HasItems(self,ItMi_Addon_GoldNugget));

	if(CrimsonMoreGold == TRUE)
	{
		B_GiveInvItems(self,other,ItMi_Gold,10);
	}
	else
	{
		B_GiveInvItems(self,other,ItMi_Gold,8);
	};

	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange all gold bars " ,DIA_Addon_Crimson_Gold_ALLE);
		if(Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 10)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange ten gold bars " ,dia_addon_crimson_gold_10);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold, " Exchange one gold bar " ,DIA_Addon_Crimson_Gold_1);
	};
};

func void B_Say_CrimsonBeliar()
{
	AI_Output(self,other, " DIA_Addon_Crimson_FATAGN_LOS_10_00 " );	// (incantatory) KHARDIMON FATAGN SHATAR FATAGN BELIAR.
};


instance DIA_Addon_Crimson_Raven(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 9;
	condition = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent = FALSE;
	description = " What do you know about Raven? " ;
};

func int DIA_Addon_Crimson_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Crimson_Raven_Info()
{
	AI_Output(other,self, " DIA_Addon_Crimson_Raven_15_00 " );	// What do you know about Raven?
	AI_Output(self,other, " DIA_Addon_Crimson_Raven_10_01 " );	// You won't believe it! I was there. I saw what he was doing in the tomb!
	AI_Output(self,other, " DIA_Addon_Crimson_Raven_10_02 " );	// He mumbled and shouted some strange words. Over and over...
	B_Say_CrimsonBeliar();
	AI_Output(self,other, " DIA_Addon_Crimson_Raven_10_03 " );	// And then a column of light burst out of the grave, and I heard a terrible scream.
	AI_Output(self,other, " DIA_Addon_Crimson_Raven_10_04 " );	// Oh gods... That voice... It sounded like the voice of the void itself!
	AI_Output(self,other, " DIA_Addon_Crimson_Raven_10_05 " );	// Then Raven spoke to it! They were talking - Raven and that voice!
	AI_Output(self,other, " DIA_Addon_Crimson_Raven_10_06 " );	// I don't remember what they were talking about. My head started hurting and my sight became blurry. I went outside to puke.
};


instance DIA_Addon_Crimson_FATAGN(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 98;
	condition = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent = TRUE;
	description = " Can you repeat Raven's words? " ;
};


func int DIA_Addon_Crimson_FATAGN_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Crimson_Raven ) && ( Crimson_SayBeliar <  4 )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Crimson_FATAGN_Info()
{
	Crimson_SayBeliar = Crimson_SayBeliar + 1;
	AI_Output(other,self, " DIA_Addon_Crimson_FATAGN_15_00 " );	// Can you repeat Raven's words?
	if(Crimson_SayBeliar <= 3)
	{
		AI_Output(self,other, " DIA_Addon_Crimson_FATAGN_10_01 " );	// I think so. Are you ready?
		Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
		Info_AddChoice(DIA_Addon_Crimson_FATAGN,"Я готов.",DIA_Addon_Crimson_FATAGN_LOS);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Crimson_FATAGN_10_02 " );	// I think we'd better not get involved in this...
	};
};

func void DIA_Addon_Crimson_FATAGN_LOS()
{
	Snd_Play("Mystery_09");
	B_Say_CrimsonBeliar();

	if(Crimson_SayBeliar == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",self,self,0,0,0,FALSE);
		//Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};

	Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
};


instance DIA_CRIMSON_ARMORCANTEACH(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 5;
	condition = dia_crimson_armorcanteach_condition;
	information = dia_crimson_armorcanteach_info;
	permanent = TRUE;
	description = " Can you forge armor? " ;
};

func int dia_crimson_armorcanteach_condition()
{
	if((CRIMSON_TEACHARMOR == FALSE) && (SCATTY_CANTRADEARMOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_crimson_armorcanteach_info()
{
	AI_Output(other,self, " DIA_Crimson_ArmorCanTeach_01_00 " );	// Can you forge armor?
	AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_01 " );	// Maybe I can. Why do you ask?
	AI_Output(other,self, " DIA_Crimson_ArmorCanTeach_01_02 " );	// Can you teach me how?
	AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_03 " );	// Hmm... the gall! Why did you think that I would teach you?
	AI_Output(other,self, " DIA_Crimson_ArmorCanTeach_01_06 " );	// I will pay you for your lessons.
	AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_07 " );	// Well now, that changes everything!
	AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_08 " );	// For the right price I could show you some ways to improve your armor?
	AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_09 " );	// However, you need to understand a little about forging.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self, " DIA_Crimson_ArmorCanTeach_01_10 " );	// I'm pretty good at forging.
		AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_11 " );	// I can see that...
		AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_12 " );	// I'll teach you what I know. And remember - you will have to pay for your education. I don't do charity work!
		AI_Output(other,self, " DIA_Crimson_ArmorCanTeach_01_14 " );	// Okay, I got it.
	}
	else
	{
		AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_15 " );	// You don't know your forge from your ass hole!
		AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_16 " );	// Here's the thing, man. Go learn how to forge first. After that we'll talk about your training.
		AI_Output(self,other, " DIA_Crimson_ArmorCanTeach_01_17 " );	// I'll teach you what I know. And remember - you will have to pay for your education. I don't do charity work!
		AI_Output(other,self, " DIA_Crimson_ArmorCanTeach_01_18 " );	// Understood.
	};
	CRIMSON_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ARMORTEACHER , " Crimson can teach me how to upgrade guard armor. " );
};

func void b_crimson_teacharmor_1()
{
	AI_Output(self,other, " DIA_Crimson_TeachArmor_1_01_01 " );	// Okay, watch carefully how this is done. Get the materials you need and...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Crimson_TeachArmor_1_01_02 " );	// ...on the anvil, you add them in the desired sequence to the heated steel billet...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_1_01_03 " );	// ...after which you give it the necessary shape and fasten it with the existing armor...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_1_01_04 " );	// ...this is how I do it now...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_1_01_05");	//...Tha's about it!
		AI_Output(self,other, " DIA_Crimson_TeachArmor_1_01_06 " );	// Now you can try it yourself.
	};
};

func void b_crimson_teacharmor_2()
{
	AI_Output(self,other, " DIA_Crimson_TeachArmor_2_01_01 " );	// Great. Remember carefully everything that I will show you now. First of all, you need to have on hand all the materials for forging...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Crimson_TeachArmor_2_01_02 " );	// ...you take a hot steel billet and break it into several component parts...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_2_01_03 " );	// ...in a certain sequence, mixing each part with the next material...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_2_01_04 " );	// ...then you forge them into the frame of the existing armor, especially carefully forging the exit points. That's it, see?
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Crimson_TeachArmor_2_01_05 " );	// ...and that's all!
		AI_Output(self,other, " DIA_Crimson_TeachArmor_2_01_06 " );	// Nothing complicated, trust me. The main thing is to remember the correct sequence of actions.
	};
};

func void b_crimson_teacharmor_3()
{
	AI_Output(self,other, " DIA_Crimson_TeachArmor_3_01_01 " );	// Watch and remember everything that I will show you now. In fact, there is nothing complicated here ...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Crimson_TeachArmor_3_01_02 " );	// ...working a hot steel billet on an anvil...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_3_01_03 " );	// ...bring the alloy to a homogeneous substance, after which you mix it with the rest of the components...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_3_01_04 " );	// ...then you give it a finished shape and forge it with the contour of the armor...Look, you see how I do it...(shows)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Crimson_TeachArmor_3_01_05 " );	// ...that's it!
		AI_Output(self,other, " DIA_Crimson_TeachArmor_3_01_06 " );	// You can see for yourself, it's simple. Now go try it yourself.
	};
};

func void b_crimson_teacharmor_4()
{
	AI_Output(self,other, " DIA_Crimson_TeachArmor_4_01_01 " );	// So let's get started. Make sure you have all the necessary materials at hand. You take a heated steel billet ...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Crimson_TeachArmor_4_01_02 " );	// ...on the anvil you give it the shape of a plate and forge another piece of steel into it....
		AI_Output(self,other, " DIA_Crimson_TeachArmor_4_01_03 " );	// ...then you make fasteners and connect the plate to them, carefully forging the vanishing points...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_4_01_04 " );	// ...after that, you carefully fasten the resulting element to the body of the armor - like this... look... (shows)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Crimson_TeachArmor_4_01_05");	//...готово!
		AI_Output(self,other, " DIA_Crimson_TeachArmor_4_01_06 " );	// That's all you need to know to upgrade this armor.
	};
};

func void b_crimson_teacharmor_5()
{
	AI_Output(self,other, " DIA_Crimson_TeachArmor_5_01_01 " );	// Well, let's get started. It will take a lot of time and effort to create this armor - but trust me, it's worth it...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"ADW_MINE_HOEHLE_01");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Crimson_TeachArmor_5_01_02 " );	// ...take a hot steel billet and divide it into several equal parts. Try to keep them about the same size...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_5_01_03 " );	// ...next, take each part and process it sequentially with a resin solution. After fasten the two parts and forge the places of convergence ...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_5_01_04 " );	// ...and then fasten the resulting element to the armor on the sides using a metal plate. Watch me do it...
		AI_Output(self,other, " DIA_Crimson_TeachArmor_5_01_05 " );	// ...you see how he sat down clearly, practically flowing around the surface of the armor. Strengthen the fastening with metal bolts and ...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Crimson_TeachArmor_5_01_06 " );	// ...done! So how do you like the process? (laughs) Nothing, just a little practice and you'll get it right.
		AI_Output(self,other, " DIA_Crimson_TeachArmor_5_01_07 " );	// Now go try it yourself.
	};
};

func void b_crimsonarmorchoices()
{
	Info_ClearChoices(dia_crimson_armorteach);
	Info_AddChoice(dia_crimson_armorteach,Dialog_Back,dia_crimson_armorteach_back);
	if((PLAYER_TALENT_SMITH[25] == FALSE) && (Npc_HasItems(other,itar_grd_l) > 0))
	{
		Info_AddChoice(dia_crimson_armorteach, " Guard Light Armor (Price: 750 coins) " ,dia_crimson_armorteach_itar_grd_l_v1);
	};
	if((PLAYER_TALENT_SMITH[26] == FALSE) && (Npc_HasItems(other,ITAR_Bloodwyn_Addon) > 0))
	{
		Info_AddChoice(dia_crimson_armorteach, " Guard's Armor (Price: 1000 coins) " ,dia_crimson_armorteach_itar_bloodwyn_addon_v1);
	};
	if((PLAYER_TALENT_SMITH[27] == FALSE) && (Npc_HasItems(other,ITAR_Thorus_Addon) > 0))
	{
		Info_AddChoice(dia_crimson_armorteach, " Heavy Guard Armor (Price: 1500 coins) " ,dia_crimson_armorteach_itar_thorus_addon_v1);
	};
};


instance DIA_CRIMSON_ARMORTEACH(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 5;
	condition = dia_crimson_armorteach_condition;
	information = dia_crimson_armorteach_info;
	permanent = TRUE;
	description = " Teach me how to upgrade my armor. " ;
};


func int dia_crimson_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (CRIMSON_TEACHARMOR == TRUE) && (SCATTY_CANTRADEARMOR == TRUE))
	{
		if((PLAYER_TALENT_SMITH[23] == FALSE) || (PLAYER_TALENT_SMITH[24] == FALSE) || (PLAYER_TALENT_SMITH[25] == FALSE) || (PLAYER_TALENT_SMITH[26] == FALSE) || (PLAYER_TALENT_SMITH[27] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_crimson_armorteach_info()
{
	AI_Output(other,self, " DIA_Crimson_ArmorTeach_01_00 " );	// Teach me how to upgrade armor.
	AI_Output(self,other, " DIA_Crimson_ArmorTeach_01_01 " );	// And what do you want to know?
	b_crimsonarmorchoices();
};

func void dia_crimson_armorteach_back()
{
	Info_ClearChoices(dia_crimson_armorteach);
};

func void dia_crimson_armorteach_itar_grd_l_v1()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 750)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_GRD_L_V1))
		{
			Npc_RemoveInvItems(other,ItMi_Gold,750);
			b_crimson_teacharmor_3();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Crimson_TeachArmor_03_00 " );	// Do you think that I can be fooled just like that? Bring the gold, then we'll talk.
	};
	b_crimsonarmorchoices();
};

func void dia_crimson_armorteach_itar_bloodwyn_addon_v1()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_BLOODWYN_ADDON_V1))
		{
			Npc_RemoveInvItems(other,ItMi_Gold,1000);
			b_crimson_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Crimson_TeachArmor_04_00 " );	// Do you think that I can be fooled just like that? Bring the gold, then we'll talk.
	};
	b_crimsonarmorchoices();
};

func void dia_crimson_armorteach_itar_thorus_addon_v1()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_THORUS_ADDON_V1))
		{
			Npc_RemoveInvItems(other,ItMi_Gold,1500);
			b_crimson_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Crimson_TeachArmor_05_00 " );	// Do you think that I can be fooled just like that? Bring the gold, then we'll talk.
	};
	b_crimsonarmorchoices();
};


instance DIA_Addon_Crimson_GoldStuck(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_GoldStuck_Condition;
	information = DIA_Addon_Crimson_GoldStuck_Info;
	permanent = FALSE;
	description = " Can you teach me how to melt gold? " ;
};


func int DIA_Addon_Crimson_GoldStuck_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Addon_Crimson_Hi) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_GoldStuck_Info()
{
	AI_Output(other,self, " DIA_Addon_Crimson_GoldStuck_01_00 " );	// Can you teach me how to smelt gold?
	AI_Output(self,other, " DIA_Addon_Crimson_GoldStuck_01_01 " );	// I can, but not for free.
	AI_Output(self,other, " DIA_Addon_Crimson_GoldStuck_01_02 " );	// The process isn't particularly difficult, but a little practice can't hurt.
	B_LogEntry( TOPIC_STEELDRAW , " Crimson can teach me how to melt gold nuggets. " );
};

instance DIA_Addon_Crimson_DoGoldStuck ( C_Info ) ;
{
	npc = BDT_1095_Addon_Crimson;
	nr = 5;
	condition = DIA_Addon_Crimson_DoGoldStuck_condition;
	information = DIA_Addon_Crimson_DoGoldStuck_info;
	permanent = TRUE;
	description = " Teach me how to smelt gold. (Training Points: 5, Cost: 1500 coins) " ;
};

func int DIA_Addon_Crimson_DoGoldStuck_condition();
{
	if (( Npc_KnowsInfo( hero , DIA_Addon_Crimson_GoldStuck ) ==  TRUE ) && ( KNOWHOWTOOREFUSGOLD  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_DoGoldStuck_info()
{
	var int cost;
	var int money;
	AI_Output(other,self, " DIA_Addon_Crimson_DoGoldStuck_01_00 " );	// Teach me how to melt gold!
	cost = 5 ;
	money = 1500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Addon_Crimson_DoGoldStuck_03_90 " );	// You don't have enough gold to train! Come back later.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		AI_Output(self,other, " DIA_Addon_Crimson_DoGoldStuck_01_01 " );	// Okay, look. It's actually quite simple.
		AI_Output(self,other, " DIA_Addon_Crimson_DoGoldStuck_01_02 " );	// You take about a quarter of a hundred gold nuggets and throw them into the forge.
		AI_Output(self,other, " DIA_Addon_Crimson_DoGoldStuck_01_03 " );	// You bring the alloy to the desired temperature and pour it into the mold, then let it cool.
		AI_Output(self,other, " DIA_Addon_Crimson_DoGoldStuck_01_04 " );	// That's it. The gold bar is ready.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Learned : gold smelting " );
		KNOWHOWTOOREFUSGOLD = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry( TOPIC_STEELDRAW , " Now I can smelt gold into bars. It takes twenty-five gold nuggets to smelt one bar. " );
	};
};
