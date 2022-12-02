

instance DIA_GRAVO_EXIT(C_Info)
{
	npc = vlk_988_gravo;
	nr = 999;
	condition = dia_gravo_exit_condition;
	information = dia_gravo_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_grave_exit_condition()
{
	return TRUE;
};

func void dia_gravo_exit_info()
{
	AI_StopProcessInfos(self);
};

instances DIA_GRAVO_PICKPOCKET (C_Info)
{
	npc = vlk_988_gravo;
	nr = 900;
	condition = DIA_GRAVO_PICKPOCKET_Condition;
	information = DIA_GRAVO_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_GRAVO_PICKPOCKET_Condition()
{
	return  C_Robbery ( 45 , 88 );
};

func void DIA_GRAVO_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_GRAVO_PICKPOCKET);
	Info_AddChoice( DIA_GRAVO_PICKPOCKET ,Dialog_Back, DIA_GRAVO_PICKPOCKET_BACK );
	Info_AddChoice( DIA_GRAVO_PICKPOCKET , DIALOG_PICKPOCKET ,DIA_GRAVO_PICKPOCKET_DoIt);
};

func void DIA_GRAVO_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_GRAVO_PICKPOCKET);
};

func void DIA_GRAVO_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_GRAVO_PICKPOCKET);
};

DIA_GRAVO_FIRSTMEET (C_Info) instances
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_firstmeet_condition;
	information = dia_gravo_firstmeet_info;
	permanent = FALSE;
	description = " Looks like we know each other? " ;
};


func int dia_gravo_firstmeet_condition()
{
	return TRUE;
};

func void dia_gravo_firstmeet_info()
{
	AI_Output(other,self, " DIA_Gravo_FirstMeet_01_00 " );	// Seems like we know each other?
	AI_Output(self,other, " DIA_Gravo_FirstMeet_01_01 " );	// Yes? Hmmm...( peering) Maybe you're right. Your face is really familiar to me.
	AI_Output(self,other, " DIA_Gravo_FirstMeet_01_03 " );	// Oh, yes, exactly! Now I remember you.
	AI_Output(self,other, " DIA_Gravo_FirstMeet_01_04 " );	// You're the guy who always got into trouble. And I helped you sort them out!
	AI_Output(self,other, " DIA_Gravo_FirstMeet_01_06 " );	// Really, don't go into too much detail on this. Otherwise, you can easily be mistaken for a bandit.
	AI_Output(self,other, " DIA_Gravo_FirstMeet_01_07 " );	// Escaped convicts are not particularly favored here.
};


instance DIA_GRAVO_HOWHERE(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_howhere_condition;
	information = dia_gravo_howhere_info;
	permanent = FALSE;
	description = " How did you end up here? " ;
};


func int dia_gravo_howhere_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_firstmeet))
	{
		return TRUE;
	};
};

func void dia_gravo_howhere_info()
{
	AI_Output(other,self, " DIA_Gravo_HowHere_01_00 " );	// How did you get here?
	AI_Output(self,other, " DIA_Gravo_HowHere_01_01 " );	// Strange question... Just like everyone else. Passed through the passage leading out of the Valley.
	AI_Output(self,other, " DIA_Gravo_HowHere_01_02 " );	// After that magical barrier collapsed, there was hardly anything to keep me there.
};


DIA_GRAVO_HALLO (C_Info) instances
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_hallo_condition;
	information = dia_gravo_hello_info;
	permanent = FALSE;
	description = " How are things going? " ;
};


func int dia_gravo_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_firstmeet))
	{
		return TRUE;
	};
};

func void dia_gravo_hallo_info()
{
	AI_Output(other,self, " DIA_Gravo_Hallo_01_00 " );	// How are things going?
	AI_Output(self,other, " DIA_Gravo_Hallo_01_01 " );	// Since I stopped bending my back in the mine, there is nothing to complain about.
	AI_Output(other, self, " DIA_Gravo_Hallo_01_02 " );	// What do you live on?
	AI_Output(self,other, " DIA_Gravo_Hallo_01_03 " );	// I still help people solve their problems.
	AI_Output(other,self, " DIA_Gravo_Hallo_01_05 " );	// And what problems can you solve?
	AI_Output(self,other, " DIA_Gravo_Hallo_01_06 " );	// Well, different kinds. See what your problem is.
	AI_Output(self,other, " DIA_Gravo_Hallo_01_08 " );	// Let's say you went a bit too far somewhere and they started to consider you a criminal!
	AI_Output(self,other, " DIA_Gravo_Hallo_01_09 " );	// I could help you sort this out by talking to the right people. Put in a good word for you.
	AI_Output(self,other, " DIA_Gravo_Hallo_01_10 " );	// Believe me, there are always strings that you can pull if necessary.
	AI_Output(self,other, " DIA_Gravo_Hallo_01_11 " );	// And there, you see, people will begin to treat you quite differently. And you are already in honor again!
	AI_Output(self,other, " DIA_Gravo_Hallo_01_12 " );	// Of course, I won't do it for free.
	Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
	B_LogEntry( TOPIC_DIPLOM , " If I get into trouble, Gravo will help me solve these problems. Of course, for a fee. " );
};


instance DIA_GRAVO_HELPANGRYNOW(C_Info)
{
	npc = vlk_988_gravo;
	nr = 1;
	condition = dia_gravo_helpangrynow_condition;
	information = dia_gravo_helpangrynow_info;
	permanent = TRUE;
	description = " I seem to have a problem. Can you help me? " ;
};


func int dia_gravo_helpangrynow_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_hallo) && ((VatrasPissedOffForever == TRUE) || (GLOBAL_MAKE_BANDIT_FORCITY == TRUE) || (GLOBAL_MAKE_BANDIT_FORMON == TRUE) || (GLOBAL_MAKE_BANDIT_FORFARM == TRUE) || (GLOBAL_MAKE_BANDIT_FORCOAST == TRUE) || (GLOBAL_MAKE_BANDIT_FORPSICAMP == TRUE)))
	{
		return TRUE;
	};
};

func void dia_gravo_helpangrynow_info()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_15_00 " );	// I seem to have a problem. Can you help me?
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_04_01 " );	// I think so! But my help doesn't come cheap.
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow,Dialog_Back,dia_gravo_helpangrynow_back);

	if(GLOBAL_MAKE_BANDIT_FORFARM == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " I'm having trouble at Onar's farm. " ,dia_gravo_helpangrynow_bigfarm);
	};
	if(GLOBAL_MAKE_BANDIT_FORMON == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " I'm having trouble at the monastery. " ,dia_gravo_helpangrynow_kloster);
	};
	if(GLOBAL_MAKE_BANDIT_FORCITY == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " I'm having trouble with paladins. " ,dia_gravo_helpangrynow_city);
	};
	if(GLOBAL_MAKE_BANDIT_FORPSICAMP == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " I'm having trouble at the Brotherhood camp. " ,dia_gravo_helpangrynow_psicamp);
	};
	if(GLOBAL_MAKE_BANDIT_FORCOAST == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " I'm in trouble at the Netbek camp. " ,dia_gravo_helpangrynow_netbek);
	};
	if(VatrasPissedOffForever == TRUE)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " I'm having trouble with the waterbender, Vatras. " ,dia_gravo_helpangrynow_vatras);
	};
};

func void dia_gravo_helpangrynow_back()
{
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_vatras()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_Vatras_01_00 " );	// I'm having trouble with the waterbender, Vatras.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_BigFarm_01_01 " );	// Hmmm...(thoughtfully) I guess they can be solved without much difficulty.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_01_03");	//Сколько?
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_BigFarm_01_04 " );	// Three thousand gold coins!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow, " I don't have that much. " ,dia_gravo_helpangrynow_nomoney);

	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " Хорошо! Вот золото. " ,dia_gravo_helpangrynow_vatras_takeit);
	};
};

func void dia_gravo_helpangrynow_bigfarm()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_BigFarm_01_00 " );	// I'm in trouble at Onar's farm.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_BigFarm_01_01 " );	// Hmmm...(thoughtfully) I guess they can be solved without much difficulty.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_BigFarm_01_02 " );	// However, in order to regain the trust of these people, you will have to pay me.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_BigFarm_01_03");	//Сколько?
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_BigFarm_01_04 " );	// Three thousand gold coins!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow, " I don't have that much. " ,dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " Хорошо! Вот золото. " ,dia_gravo_helpangrynow_bigfarm_takeit);
	};
};

func void dia_gravo_helpangrynow_kloster()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_Kloster_01_00 " );	// I'm having problems at the monastery.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Kloster_01_01 " );	// With the Fire Mages? Hmmm... (thoughtfully) Well, you're in trouble, buddy!
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Kloster_01_02 " );	// Mages are extremely stubborn and proud. Therefore, it will be extremely difficult to persuade them to forgive you.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Kloster_01_03 " );	// You'll just have to pay me a huge pile of gold to take on this case.
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_Kloster_01_04 " );	// How much?
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Kloster_01_05 " );	// Ten thousand gold coins!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow, " I don't have that much. " ,dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 10000)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " Вот, возьми свои деньги. " ,dia_gravo_helpangrynow_monastery_takeit);
	};
};

func void dia_gravo_helpangrynow_city()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_City_01_00 " );	// I'm having trouble with paladins.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_City_01_01 " );	// Hmmm... (thoughtfully) This is serious! It will not be easy for me to persuade them to forget their old grievances.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_City_01_02 " );	// Yes, and you will need much more gold than usual.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_City_01_03");	//Сколько?
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_City_01_04 " );	// Five thousand gold coins!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow, " I don't have that much. " ,dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " Хорошо! Вот золото. " ,dia_gravo_helpangrynow_city_takeit);
	};
};

func void dia_gravo_helpangrynow_psicamp()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_Psicamp_01_00 " );	// I'm in trouble at the Brotherhood camp.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Psicamp_01_01 " );	// Hmmm...(thoughtfully) I guess they can be solved without much difficulty.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Psicamp_01_02 " );	// However, in order to regain the trust of these people, you will have to pay me.
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_Psicamp_01_03 " );	// How much?
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Psicamp_01_04 " );	// Four thousand gold coins!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow, " I don't have that much. " ,dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 4000)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " Good! Here's gold. " ,dia_gravo_helpangrynow_psicamp_takeit);
	};
};

func void dia_gravo_helpangrynow_netbek()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_NetBek_01_00 " );	// I'm having trouble at the Netback camp.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_NetBek_01_01 " );	// Hmmm...(thoughtfully) I guess they can be solved without much difficulty.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_NetBek_01_02 " );	// However, in order to regain the trust of these people, you will have to pay me.
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_NetBek_01_03 " );	// How much?
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_NetBek_01_04 " );	// Two thousand gold coins!
	Info_ClearChoices(dia_gravo_helpangrynow);
	Info_AddChoice(dia_gravo_helpangrynow, " I don't have that much. " ,dia_gravo_helpangrynow_nomoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(dia_gravo_helpangrynow, " Хорошо! Вот золото. " ,dia_gravo_helpangrynow_netbek_takeit);
	};
};

func void dia_gravo_helpangrynow_nomoney()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_NoMoney_01_00 " );	// I don't have enough gold.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_NoMoney_01_01 " );	// I'm sorry, boy... (shrugs) But then there's nothing I can do for you!
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_vatras_takeit()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_00 " );	// Good! Here is gold.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_01 " );	// You can consider that the issue is resolved.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_02 " );	// And don't tell anyone about this! Act like nothing happened.
	VatrasPissedOffForever = FALSE;
	B_LogEntry( TOPIC_DIPLOM , " Now Vatras must forgive me. " );
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_bigfarm_takeit()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_00 " );	// Good! Here is gold.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_01 " );	// You can consider that the issue is resolved.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_BigFarm_TakeIt_01_02 " );	// And don't tell anyone about this! Act like nothing happened.
	B_GrantAbsolution(LOC_FARM);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_Farm = ABSOLUTIONLEVEL_Farm + 1;
	PETZCOUNTER_Farm_Murder = 0;
	PETZCOUNTER_Farm_Theft = 0;
	PETZCOUNTER_Farm_Attack = 0;
	PETZCOUNTER_Farm_Sheepkiller = 0;
	GLOBAL_FARM_MURDER = 0;
	GLOBAL_FARM_THEFT = 0;
	GLOBAL_FARM_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORFARM = FALSE;
	B_LogEntry( TOPIC_DIPLOM , " I have restored my relationship with the mercenaries. " );
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_kloster_takeit()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_Kloster_TakeIt_01_00 " );	// Good! Here is gold.
	B_GiveInvItems(other,self,ItMi_Gold,10000);
	Npc_RemoveInvItems(self,ItMi_Gold,10000);
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Kloster_TakeIt_01_01 " );	// You can consider that the issue is resolved.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Kloster_TakeIt_01_02 " );	// And don't tell anyone about this! Act like nothing happened.
	B_GrantAbsolution(LOC_MONASTERY);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_Monastery = ABSOLUTIONLEVEL_Monastery + 1;
	PETZCOUNTER_Monastery_Murder = 0;
	PETZCOUNTER_Monastery_Theft = 0;
	PETZCOUNTER_Monastery_Attack = 0;
	PETZCOUNTER_Monastery_Sheepkiller = 0;
	GLOBAL_MONASTERY_MURDER = 0;
	GLOBAL_MONASTERY_THEFT = 0;
	GLOBAL_MONASTERY_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORMON = FALSE ;
	B_LogEntry( TOPIC_DIPLOM , " I have restored my relationship with the Firebenders. " );
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_city_takeit()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_City_TakeIt_01_00 " );	// Good! Here is gold.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_City_TakeIt_01_01 " );	// You can consider that the issue is resolved.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_City_TakeIt_01_02 " );	// And don't tell anyone about this! Act like nothing happened.
	if(GARONDTROUBLE == TRUE)
	{
		B_GrantAbsolution(LOC_OLDCAMP);
		ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
		PETZCOUNTER_BL_Murder = 0;
		PETZCOUNTER_BL_Theft = 0;
		PETZCOUNTER_BL_Attack = 0;
		ABSOLUTIONLEVEL_OldCamp = ABSOLUTIONLEVEL_OldCamp + 1;
		PETZCOUNTER_OldCamp_Murder = 0;
		PETZCOUNTER_OldCamp_Theft = 0;
		PETZCOUNTER_OldCamp_Attack = 0;
		PETZCOUNTER_OldCamp_Sheepkiller = 0;
		GLOBAL_OLDCAMP_MURDER = 0;
		GLOBAL_OLDCAMP_THEFT = 0;
		GLOBAL_OLDCAMP_ATTACK = 0;
		GARONDTROUBLE = FALSE ;
		B_LogEntry( TOPIC_DIPLOM , " I have restored my relationship with the paladins in the stronghold. " );
	}
	else
	{
		B_GrantAbsolution(LOC_CITY);
		ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
		PETZCOUNTER_BL_Murder = 0;
		PETZCOUNTER_BL_Theft = 0;
		PETZCOUNTER_BL_Attack = 0;
		ABSOLUTIONLEVEL_City = ABSOLUTIONLEVEL_City + 1;
		PETZCOUNTER_City_Murder = 0;
		PETZCOUNTER_City_Theft = 0;
		PETZCOUNTER_City_Attack = 0;
		PETZCOUNTER_City_Sheepkiller = 0;
		GLOBAL_CITY_MURDER = 0;
		GLOBAL_CITY_THEFT = 0;
		GLOBAL_CITY_ATTACK = 0;
		B_LogEntry( TOPIC_DIPLOM , " I have restored my relationship with the paladins in the city. " );
	};
	GLOBAL_MAKE_BANDIT_FORCITY = FALSE;
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_psicamp_takeit()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_Psicamp_TakeIt_01_00 " );	// Good! Here is gold.
	B_GiveInvItems(other,self,ItMi_Gold,4000);
	Npc_RemoveInvItems(self,ItMi_Gold,4000);
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Psicamp_TakeIt_01_01 " );	// You can consider that the issue is resolved.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Psicamp_TakeIt_01_02 " );	// And don't tell anyone about this! Act like nothing happened.
	B_GrantAbsolution(LOC_PSICAMP);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_PSICAMP = ABSOLUTIONLEVEL_PSICAMP + 1;
	PETZCOUNTER_PSICAMP_MURDER = 0;
	PETZCOUNTER_PSICAMP_THEFT = 0;
	PETZCOUNTER_PSICAMP_ATTACK = 0;
	GLOBAL_PSICAMP_MURDER = 0;
	GLOBAL_PSICAMP_THEFT = 0;
	GLOBAL_PSICAMP_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORPSICAMP = FALSE;
	B_LogEntry( TOPIC_DIPLOM , " I have restored my relationship with the Brotherhood camp. " );
	Info_ClearChoices(dia_gravo_helpangrynow);
};

func void dia_gravo_helpangrynow_netbek_takeit()
{
	AI_Output(other,self, " DIA_Gravo_HelpAngryNow_Psicamp_NetBek_01_00 " );	// Good! Here is gold.
	B_GiveInvItems(other,self,ItMi_Gold,4000);
	Npc_RemoveInvItems(self,ItMi_Gold,4000);
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Psicamp_NetBek_01_01 " );	// You can consider that the issue is resolved.
	AI_Output(self,other, " DIA_Gravo_HelpAngryNow_Psicamp_NetBek_01_02 " );	// And don't tell anyone about this! Act like nothing happened.
	B_GrantAbsolution(LOC_COAST);
	ABSOLUTIONLEVEL_BL = ABSOLUTIONLEVEL_BL + 1;
	PETZCOUNTER_BL_Murder = 0;
	PETZCOUNTER_BL_Theft = 0;
	PETZCOUNTER_BL_Attack = 0;
	ABSOLUTIONLEVEL_COAST = ABSOLUTIONLEVEL_COAST + 1;
	PETZCOUNTER_COAST_MURDER = 0;
	PETZCOUNTER_COAST_THEFT = 0;
	PETZCOUNTER_COAST_ATTACK = 0;
	GLOBAL_COAST_MURDER = 0;
	GLOBAL_COAST_THEFT = 0;
	GLOBAL_COAST_ATTACK = 0;
	GLOBAL_MAKE_BANDIT_FORCOAST = FALSE;
	B_LogEntry( TOPIC_DIPLOM , " I have restored my relationship with the Netback camp. " );
	Info_ClearChoices(dia_gravo_helpangrynow);
};
