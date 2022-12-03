

instance DIA_Engor_EXIT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 999;
	condition = DIA_Engor_EXIT_Condition;
	information = DIA_Engor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Engor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Engor_HALLO (C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_HALLO_Condition;
	information = DIA_Engor_HI_Info;
	important = TRUE;
};


func int DIA_Engor_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Engor_HALLO_Info()
{
	AI_Output(self,other, " DIA_Engor_HALLO_13_00 " );	// Oh, are you the guy who managed to get through the Passage?
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//Да.
	AI_Output(self,other, " DIA_Engor_HALLO_13_02 " );	// Great! I am Engor - I provide this expedition.
	AI_Output(self,other, " DIA_Engor_HALLO_13_03 " );	// Just don't think you can get anything from me for free!
	AI_Output(self,other, " DIA_Engor_HALLO_13_04 " );	// But if gold tinkles in your pockets, we'll always agree.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, " Angore manages the castle's supplies and runs a small business on the side. " );
};


instance DIA_Engor_HANDELN (C_Info)
{
	npc = VLK_4108_Engor;
	nr = 10;
	condition = DIA_Engor_HANDELN_Condition;
	information = DIA_Engor_HANDELN_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};


func int DIA_Engor_HANDELN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Engor_HALLO))
	{
		return TRUE;
	};
};


var int engorarrowsday;

func void DIA_Engor_HANDELN_Info()
{
	where int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	daynow = Wld_GetDay();

	if(ENGORARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (ENGORARROWSDAY < (daynow - 1)))
		{
			boltamount = (chapter *  100 ) + ( 10  * (daynow -  ENGORARROWSDAY  -  1 ));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			ENGORARROWSDAY = debt;
		};
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};
	if(Npc_HasItems(self,itpo_stamina) != 5)
	{
		Npc_RemoveInvItems(self,itpo_stamina,Npc_HasItems(self,itpo_stamina));
		CreateInvItems(self,itpo_stamina,5);
	};

	AI_Output(other,self, " DIA_Engor_HANDELN_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};


instance DIA_Engor_ABOUTTALK ( C_Info );
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_ABOUTPARLAF_Condition;
	information = DIA_Engor_ABOUTPARLAF_Info;
	description = " You distribute rations, I heard? " ;
};


func int DIA_Engor_ABOUTPARLAF_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlaf_ENGOR))
	{
		return TRUE;
	};
};

func void DIA_Engor_ABOUTPARLAF_Info()
{
	AI_Output(other,self, " DIA_Engor_ABOUTPARLAF_15_00 " );	// You distribute rations, I hear?
	AI_Output(self,other, " DIA_Engor_ABOUTPARLAF_13_01 " );	// That's right. And what? Am I going to have to feed you too?
	AI_Output(self,other, " DIA_Engor_ABOUTPARLAF_13_02 " );	// If you want something, you have to pay for it - just like everyone else.
};

instance DIA_Engor_HELP(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 3;
	condition = DIA_Engor_HELP_Condition;
	information = DIA_Engor_HELP_Info;
	description = " Maybe I can help you with your work? " ;
};

func int DIA_Engor_HELP_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Engor_ABOUTTALK ))
	{
		return TRUE;
	};
};

func void DIA_Engor_HELP_Info()
{
	AI_Output(other,self, " DIA_Engor_HELP_15_00 " );	// Maybe I can help you with your work?
	AI_Output(self,other, " DIA_Engor_HELP_13_01 " );	// Hmm... Of course, why not? I wouldn't mind help.
	AI_Output(other,self, " DIA_Engor_HELP_15_02 " );	// So what should we do?
	AI_Output(self,other, " DIA_Engor_HELP_13_03 " );	// Our food supplies are running low. Worst of all, we have almost no meat left.
	AI_Output(self,other, " DIA_Engor_HELP_13_04 " );	// So if you can get some meat, raw or cooked, ham or sausage, I'd be very grateful. Well, how? Will you help us?
	Info_ClearChoices(DIA_Engor_HELP);
	Info_AddChoice(DIA_Engor_HELP, " I don't have time for this. " ,DIA_Engor_HELP_NO);
	Info_AddChoice(DIA_Engor_HELP, " Don't worry, I'll bring you meat. " ,DIA_Engor_HELP_YES);
};

func void DIA_Engor_HELP_NO()
{
	AI_Output(other,self, " DIA_Engor_HELP_NO_15_00 " );	// I don't have time for this.
	AI_Output(self,other, " DIA_Engor_HELP_NO_13_01 " );	// Then why are you wasting my time?
	MIS_Engor_BringMeat = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void DIA_Engor_HELP_YES()
{
	AI_Output(other,self, " DIA_Engor_HELP_YES_15_00 " );	// Don't worry, I'll bring you meat.
	AI_Output(self,other, " DIA_Engor_HELP_YES_13_01 " );	// Two dozen pieces would be enough to feed all those hungry mouths. Come back when you have that meat. And I need to work.
	Log_CreateTopic(TOPIC_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_BringMeat, " Angor needs two dozen pieces of meat to feed the people in the castle. It doesn't matter if it's sausage, ham, raw or roasted meat. Anything as long as it's chewable. " );
	MIS_Engor_BringMeat = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Engor_BRINGMEAT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 4;
	condition = DIA_Engor_BRINGMEAT_Condition;
	information = DIA_Engor_BRINGMEAT_Info;
	permanent = TRUE;
	description = " Here, I brought you something. " ;
};


func int DIA_Engor_BRINGMEAT_Condition()
{
	if((MIS_Engor_BringMeat == LOG_Running) && (Meat_Counter < Meat_Amount) && ((Npc_HasItems(hero,ItFo_Bacon) >= 1) || (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) || (Npc_HasItems(hero,ItFoMutton) >= 1) || (Npc_HasItems(hero,ItFo_Sausage) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Engor_BRINGMEAT_Info()
{
	var string ConcatRaw;
	var string ConcatMutton;
	var string ConcatBacon;
	var string ConcatSausage;
	var string TotalMeat;
	AI_Output(other,self, " DIA_Engor_BRINGMEAT_15_00 " );	// Here, I brought you something.
	if(Npc_HasItems(hero,ItFoMuttonRaw) >= 1)
	{
		if((Npc_HasItems(hero,ItFoMuttonRaw) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFoMuttonRaw,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFoMuttonRaw) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFoMuttonRaw);
			ConcatRaw = IntToString(Npc_HasItems(other,ItFoMuttonRaw));
			ConcatRaw = ConcatStrings(ConcatRaw, " Raw Meat Transferred " );
			AI_Print(ConcatRaw);
			Npc_RemoveInvItems(other,ItFoMuttonRaw,Npc_HasItems(other,ItFoMuttonRaw));
		};
	};
	if(Npc_HasItems(hero,ItFoMutton) >= 1)
	{
		if((Npc_HasItems(hero,ItFoMutton) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFoMutton,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFoMutton) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFoMutton);
			ConcatMutton = IntToString(Npc_HasItems(other,ItFoMutton));
			ConcatMutton = ConcatStrings(ConcatMutton, " Grilled meat given " );
			AI_Print(ConcatMutton);
			Npc_RemoveInvItems(other,ItFoMutton,Npc_HasItems(other,ItFoMutton));
		};
	};
	if(Npc_HasItems(hero,ItFo_Bacon) >= 1)
	{
		if((Npc_HasItems(hero,ItFo_Bacon) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFo_Bacon,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFo_Bacon) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFo_Bacon);
			ConcatBacon = IntToString(Npc_HasItems(other,ItFo_Bacon));
			ConcatBacon = ConcatStrings(ConcatBacon, " Ham given " );
			AI_Print(ConcatBacon);
			Npc_RemoveInvItems(other,ItFo_Bacon,Npc_HasItems(other,ItFo_Bacon));
		};
	};
	if(Npc_HasItems(hero,ItFo_Sausage) >= 1)
	{
		if((Npc_HasItems(hero,ItFo_Sausage) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFo_Sausage,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFo_Sausage) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFo_Sausage);
			ConcatSausage = IntToString(Npc_HasItems(other,ItFo_Sausage));
			ConcatSausage = ConcatStrings(ConcatSausage, " give Sausage " );
			AI_Print(ConcatSausage);
			Npc_RemoveInvItems(other,ItFo_Sausage,Npc_HasItems(other,ItFo_Sausage));
		};
	};
	if(Meat_Amount > Meat_Counter)
	{
		AI_Output(self,other, " DIA_Engor_BRINGMEAT_13_01 " );	// This is a good start, but I need more.
		TotalMeat = IntToString(Meat_Counter);
		GesamtFleisch = ConcatStrings( " all meat given: " ,GesamtFleisch);
		AI_Print(TotalMeat);
	};
	if(Meat_Counter >= Meat_Amount)
	{
		B_GivePlayerXP(XP_BringMeat);
		AI_Output(self,other, " DIA_Engor_BRINGMEAT_13_02 " );	// Great, you brought enough meat. This will be enough for a while.
		AI_Output(self,other, " DIA_Engor_BRINGMEAT_13_03 " );	// But don't expect me to give you anything for free now!
		MIS_Engor_BringMeat = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_BringMeat,LOG_SUCCESS);
		B_LogEntry(TOPIC_BringMeat, " Angor has got his meat. He will divide it among the castle's defenders. " );
	};
};


instance DIA_Engor_Business(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 1;
	condition = DIA_Engor_Business_Condition;
	information = DIA_Engor_Business_Info;
	permanent = FALSE;
	description = " How is trading? " ;
};


func int DIA_Engor_Business_Condition()
{
	if ((Chapter >=  4 ) && (MY_Engor_BringMeat ==  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void DIA_Engor_Business_Info()
{
	AI_Output(other, self, " DIA_Engor_Business_15_00 " );	// How's business?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Engor_Business_13_01 " );	// Doesn't matter. I hope at least those dragon hunters have some gold.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Engor_Business_13_02 " );	// Bad! Paladins don't buy anything.
	};
	AI_Output(self,other, " DIA_Engor_Business_13_03 " );	// What about you? Do you want to buy something?
};

instance DIA_Engor_StoreKey(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 1;
	condition = DIA_Engor_StoreKey_Condition;
	information = DIA_Engor_StoreKey_Info;
	permanent = FALSE;
	description = " I have your key here. " ;
};

func int DIA_Engor_StoreKey_Condition()
{
	if(Npc_HasItems(hero,ItKe_OC_Store) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Engor_StoreKey_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Engor_StoreKey_01_00 " );	// I have your key here.
	AI_Output(self,other, " DIA_Engor_StoreKey_01_01 " );	// Did you manage to find him?!
	AI_Output(other,self, " DIA_Engor_StoreKey_01_02 " );	// Guessed! Here, take it and try not to lose it again.
	B_GiveInvItems(other,self,ItKe_OC_Store,1);
	Npc_RemoveInvItems(self,ItKe_OC_Store,1);
	AI_Output(self,other, " DIA_Engor_StoreKey_01_03 " );	// Thank you, mate! You can't imagine how much you helped me out.
	AI_Output(self,other, " DIA_Engor_StoreKey_01_04 " );	// And then Garond has already eaten all my baldness because of this key.
	AI_Output(self,other, " DIA_Engor_StoreKey_01_05 " );	// Oh well, take these drinks as thanks for your help. A simple reward, but do not let you go empty-handed.
	B_GiveInvItems(self,other,ItPo_Health_02,3);
};

instance DIA_Engor_Ruestung(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_Ruestung_Condition;
	information = DIA_Engor_Ruestung_Info;
	permanent = FALSE;
	description = " Do you have anything interesting for me? " ;
};

func int DIA_Engor_Ruestung_Condition()
{
	if((other.guild == GIL_MIL) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Engor_Ruestung_Info()
{
	AI_Output(other,self, " DIA_Engor_Ruestung_15_00 " );	// Do you have anything interesting for me?
	AI_Output(self,other, " DIA_Engor_Ruestung_13_01 " );	// I can sell you good paladin squire armor. Unless, of course, you're interested.
	AI_Output(self,other, " DIA_Engor_Ruestung_13_02 " );	// They're not cheap, of course. But if you have gold, you will get them.
};

instances DIA_Engor_RSkaufen (C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_RSkaufen_Condition;
	information = DIA_Engor_RSkaufen_Info;
	permanent = TRUE;
	description = " Buy a paladin squire armor. (Price: 4000 coins) " ;
};

var int DIA_Engor_RSkaufen_perm;

func int DIA_Engor_RSkaufen_Condition()
{
	if (( other . guild ==  GIL_MIL ) && Npc_KnowsInfo ( other , DIA_Engor_Country ) && ( DIA_Engor_RScaufen_perm ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Engor_RSkaufen_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,4000))
	{
		AI_Output(other,self, " DIA_Engor_RSkaufen_15_00 " );	// Give me the armor.
		AI_Output(self,other, " DIA_Engor_RSkaufen_13_01 " );	// Here, take this, they will protect you well - it's damn good armor.
		B_GiveInvItems(self,other,ItAr_PAL_L,1);
		DIA_Engor_RSkaufen_perm = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Engor_RSkaufen_13_02 " );	// Bring the gold first.
	};
};
