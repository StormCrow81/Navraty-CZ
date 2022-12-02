

instance DIA_Addon_Henry_EXIT(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 999;
	condition = DIA_Addon_Henry_EXIT_Condition;
	information = DIA_Addon_Henry_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Henry_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Henry_Gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other, " DIA_Addon_Henry_Gold500_04_00 " );	// Five hundred gold.
	}
	else if(gold == 400)
	{
		AI_Output(self,other, " DIA_Addon_Henry_Gold400_04_00 " );	// Four hundred gold.
	}
	else if(gold == 300)
	{
		AI_Output(self,other, " DIA_Addon_Henry_Gold300_04_00 " );	// Three hundred gold.
	}
	else if(gold == 200)
	{
		AI_Output(self,other, " DIA_Addon_Henry_Gold200_04_00 " );	// Two hundred gold.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//Сто золотых.
	}
	else
	{
		B_Say_Gold(self,other,gold);
	};
};


instance DIA_Addon_Henry_PICKPOCKET(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 900;
	condition = DIA_Addon_Henry_PICKPOCKET_Condition;
	information = DIA_Addon_Henry_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Henry_PICKPOCKET_Condition()
{
	return  C_Robbery ( 40 , 60 );
};

func void DIA_Addon_Henry_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,Dialog_Back,DIA_Addon_Henry_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Henry_PICKPOCKET_DoIt);
};

func void DIA_Addon_Henry_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};

func void DIA_Addon_Henry_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};


const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";
var int HenryBonusPerm;

instance DIA_Addon_Henry_Hello(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Hello_Condition;
	information = DIA_Addon_Henry_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Hello_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] ==  GP_NONE ) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//Стой!

	if((HenryBonus == TRUE) && (HenryBonusPerm == FALSE))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Addon_Henry_Hello_04_02 " );	// And how did you manage to get into our camp unnoticed?!...(with surprise)
		HenryBonusPerm = TRUE;
	};

	AI_Output(self,other, " DIA_Addon_Henry_Hello_04_01 " );	// Are you friend or foe?
	HenryTalk = TRUE;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
	Info_AddChoice(DIA_Addon_Henry_Hello,"Враг!",DIA_Addon_Henry_Hello_Feind);
	Info_AddChoice(DIA_Addon_Henry_Hello,"Друг!",DIA_Addon_Henry_Hello_Freund);
};


var int Henry_SC_Frech;

func void DIA_Addon_Henry_Hello_Feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Враг!
	AI_Output(self,other, " DIA_Addon_Henry_Hello_Feind_04_01 " );	// Looking for adventure on your ass, clown?
	AI_Output(self,other, " DIA_Addon_Henry_Hello_Feind_04_02 " );	// Say what you want, or get out, but quickly.
	Henry_SC_Frech = TRUE;
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

func void DIA_Addon_Henry_Hello_Friend()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//Друг!
	AI_Output(self,other, " DIA_Addon_Henry_Hello_Freund_04_01 " );	// Anyone can say that! I do not know you. What do you need here?
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

instance DIA_Addon_Henry_SecondWarn(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_SecondWarn_Condition;
	information = DIA_Addon_Henry_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] -  50 ))) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_SecondWarn_Info()
{
	AI_Output(self,other, " DIA_Addon_Henry_SecondWarn_04_00 " );	// One more step forward and I'll feed you to the sharks!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Henry_Attack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Attack_Condition;
	information = DIA_Addon_Henry_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Attack_Condition()
{
	if ((self.aivar[AIV_GuardPassage_Status] == GP_SecondWarnGiven) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] -  50 ))) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_Output(self,other, " DIA_Addon_Henry_Attack_04_00 " );	// Asked for it...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


var int Henry_Zoll_WhatFor;

instance DIA_Addon_Henry_WantEnter(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_WantEnter_Condition;
	information = DIA_Addon_Henry_WantEnter_Info;
	permanent = FALSE;
	description = " I want to get inside. " ;
};


func int DIA_Addon_Henry_WantEnter_Condition()
{
	if (self.aivar[ AIV_PASSGATE ] ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WantEnter_Info()
{
	var C_Item itm;
	AI_Output(other,self, " DIA_Addon_Henry_WantEnter_15_00 " );	// I want to get inside.
	AI_Output(self,other, " DIA_Addon_Henry_WantEnter_04_01 " );	// True? Well, in that case, you have to pay.
	B_Henry_Gold(500);

	if(Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Да? А за что?
		AI_Output(self,other, " DIA_Addon_Henry_WantEnter_04_03 " );	// Don't be an idiot.
		AI_Output(self,other, " DIA_Addon_Henry_WantEnter_04_04 " );	// The camp is full of everything that might interest you...
		Henry_Zoll_WhatFor = TRUE;
	};

	AI_Output(self,other, " DIA_Addon_Henry_WantEnter_04_10 " );	// You have the gold, don't you?
};

func void B_Henry_NoJoin()
{
	AI_Output(self,other, " DIA_Addon_Henry_Add_04_00 " );	// If you're going to join us, you're out of luck.
	AI_Output(self,other, " DIA_Addon_Henry_Add_04_01 " );	// Only the captain deals with such matters. And now he and half of the team went to sea for prey.
	AI_Output(self,other, " DIA_Addon_Henry_Add_04_02 " );	// But you can wait for his return.
	AI_Output(self,other, " DIA_Addon_Henry_Add_04_03 " );	// Just don't create any trouble!
};


instance DIA_Addon_Henry_Einigen2 (C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_Einigen2_Condition;
	information = DIA_Addon_Henry_Einigen2_Info;
	description = " Here's your five hundred gold. " ;
};


func int DIA_Addon_Henry_Einigen2_Condition()
{
	if ((self.aivar [ AIV_PASSGATE ] == FALSE  ) && Npc_KnowsInfo ( other , DIA_Addon_Henry_WantEnter ) &&  ! 
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen2_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Einigen2_15_00 " );	// Here's your five hundred gold pieces.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	AI_Output(self,other, " DIA_Addon_Henry_Einigen2_04_01 " );	// Great! Welcome to camp.
	B_Henry_NoJoin();
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	Knows_HenrysEntertrupp = TRUE ;
};


instance DIA_Addon_Henry_Einigen (C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Einigen_Condition;
	information = DIA_Addon_Henry_Some_Info;
	description = " Can we agree somehow? " ;
};


func int DIA_Addon_Henry_Some_Condition()
{
	if (( self . aivar [ AIV_PASSGATE ] ==  FALSE ) && Npc_KnowsInfo( other , DIA_Addon_Henry_WantEnter )) .
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Some_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Einigen_15_00 " );	// Can we somehow agree?
	AI_Output(self,other, " DIA_Addon_Henry_Einigen_04_01 " );	// Hmmm...(thoughtfully) Give me a good reason and I'll give you a discount.
};


instance DIA_Addon_Henry_MeatForMorgan(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 4;
	condition = DIA_Addon_Henry_MeatForMorgan_Condition;
	information = DIA_Addon_Henry_MeatForMorgan_Info;
	permanent = FALSE;
	description = " I have to give Morgan the meat. " ;
};


func int DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if ((self.aivar[ AIV_PASSGATE ] ==  FALSE ) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MY_AlligatorJack_BringMeat == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_MeatForMorgan_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_MeatForMorgan_15_00 " );	// I have to give Morgan the meat.
	AI_Output(self,other, " DIA_Addon_Henry_MeatForMorgan_04_01 " );	// Yeah. And who sent you?
	AI_Output(other,self, " DIA_Addon_Henry_MeatForMorgan_15_02 " );	// Alligator Jack. He says that Morgan is already waiting for this meat.
	AI_Output(self,other, " DIA_Addon_Henry_MeatForMorgan_04_03 " );	// Clear. He's not in the mood himself, is he?
};


instance DIA_Addon_Henry_Malcom(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Malcom_Condition;
	information = DIA_Addon_Henry_Malcom_Info;
	description = " Malcom sent me. " ;
};


func int DIA_Addon_Henry_Malcom_Condition()
{
	if (( self . aivar [ AIV_PASSGATE ] ==  FALSE ) && Npc_KnowsInfo( other , DIA_Addon_Henry_Einigen ) && ( MalcomBotschaft ==  TRUE )) .
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Malcom_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Malcom_15_00 " );	// Malcolm sent me. He said that the tree would have to wait a little longer.
	AI_Output(self,other, " DIA_Addon_Henry_Malcom_04_01 " );	// (grunts) Of course... I knew it. He's always digging.
	B_MalcomExident();
};


instance DIA_Addon_Henry_BaltramPack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_BaltramPack_Condition;
	information = DIA_Addon_Henry_BaltramPack_Info;
	description = " I have a package for Skip. Is he here? " ;
};


func int DIA_Addon_Henry_BaltramPack_Condition()
{
	if ((self.aivar[ AIV_PASSGATE ] ==  FALSE ) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && Npc_HasItems(other,ItMy_Packet_Baltram4Skip_Addon));
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_BaltramPack_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_BaltramPack_15_00 " );	// I have a package for Skip. He is here?
	AI_Output(self,other, " DIA_Addon_Henry_BaltramPack_04_01 " );	// Yes, Skip is here. So what?
};


var int Henry_Amount;

instance DIA_Addon_Henry_Tribut(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 7;
	condition = DIA_Addon_Henry_Tribut_Condition;
	information = DIA_Addon_Henry_Tribut_Info;
	permanent = TRUE;
	description = " Let me in. " ;
};


func int DIA_Addon_Henry_Tribut_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Henry_Einigen ) && ( self . aivar [ AIV_PASSGATE ] ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Tribut_Info()
{
	Henry_Amount = 500;
	AI_Output(other,self, " DIA_Addon_Henry_Tribut_15_00 " );	// Let me in.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Хммм...(задумчиво)

	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other, " DIA_Addon_Henry_Tribut_04_02 " );	// You brought me a message from one of the lumberjacks.
		Henry_Amount = Henry_Amount - 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output(self,other, " DIA_Addon_Henry_Tribut_04_03 " );	// Alligator Jack is using you as an errand boy to deliver meat to Morgan.
		Henry_Amount = Henry_Amount - 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_BaltramPack))
	{
		AI_Output(self,other, " DIA_Addon_Henry_Tribut_04_04 " );	// You have a package for Skip.
		Henry_Amount = Henry_Amount - 100;
	};
	if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if(Henry_Amount < 500)
		{
			AI_Output(self,other, " DIA_Addon_Henry_Tribut_Add_04_00 " );	// And what's best:
		};
		AI_Output(self,other, " DIA_Addon_Henry_Tribut_Add_04_01 " );	// You've dealt with those scum in the tower.
		AI_Output(self,other, " DIA_Addon_Henry_Tribut_Add_04_02 " );	// I didn't think it was possible to deal with this alone.
		Henry_Amount = Henry_Amount - 200;
	};
	if(Henry_Amount <= 0)
	{
		AI_Output(self,other, " DIA_Addon_Henry_Tribut_Add_04_03 " );	// You know what? You can go for free.
		self.aivar[ AIV_PASSGATE ] = TRUE ;
		Knows_HenrysEntertrupp = TRUE ;
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold(Henry_Amount);
		AI_Output(self,other, " DIA_Addon_Henry_Tribut_04_05 " );	// If you don't agree, you can get lost. Everything is simple.
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
		Info_AddChoice(DIA_Addon_Henry_Tribut, " I think this is too much. " ,DIA_Addon_Henry_Tribut_nein);
		if(Npc_HasItems(other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice(DIA_Addon_Henry_Tribut, " Okay. Here's gold. " ,DIA_Addon_Henry_Tribut_ja);
		};
	};
};

func void DIA_Addon_Henry_Tribut_ja()
{
	AI_Output(other,self, " DIA_Addon_Henry_Tribut_ja_15_00 " );	// Good. Here is gold.
	B_GiveInvItems(other,self,ItMi_Gold,Henry_Amount);
	AI_Output(self,other, " DIA_Addon_Henry_Tribut_ja_04_01 " );	// Thank you. Welcome to camp!
	B_Henry_NoJoin();
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
	self.aivar[ AIV_PASSGATE ] = TRUE ;
};

func void DIA_Addon_Henry_Tribut_nein()
{
	AI_Output(other,self, " DIA_Addon_Henry_Tribut_nein_15_00 " );	// I think this is too much.
	if(Henry_Amount < 500)
	{
		AI_Output(self,other, " DIA_Addon_Henry_Tribut_nein_04_03 " );	// Stop it! I already gave you a discount.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Henry_Tribut_nein_04_04 " );	// In that case, you can get out of here.
	};
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
};


instance DIA_Addon_Henry_Palisade(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Condition;
	information = DIA_Addon_Henry_Palisade_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Henry_Palisade_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Palisade_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_04_01 " );	// What do you think? I have to see to it that these miserable sluggards build the stockade on time.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_04_02 " );	// If it's not built, Captain Greg will give me a good kick in the ass.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_04_03 " );	// I also decide whether to let rascals like you into the camp.
};


instance DIA_Addon_Henry_Palisade_WhatFor(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 12;
	condition = DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information = DIA_Addon_Henry_Palisade_WhatFor_Info;
	permanent = FALSE;
	description = " Why do you need a stockade? " ;
};


func int DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_WhatFor_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Palisade_WhatFor_15_00 " );	// Why do you need a stockade?
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_WhatFor_04_10 " );	// We don't want to be easy prey for bandits!
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_WhatFor_04_02 " );	// These bastards are getting bolder every day! Lately they've taken to circling the camp like sharks around the wreck of a shipwreck.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_WhatFor_04_11 " );	// A few bandits have even taken up residence in a tower south of here.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_WhatFor_04_12 " );	// I'm sure it's the advance party.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_WhatFor_04_03 " );	// But if they are stupid enough to attack us, we will welcome them in such a way that they will not soon forget it.
	Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
	B_LogEntry(TOPIC_Addon_BanditsTower, " Several bandits have taken over the tower south of the pirate camp. " );
};

func void B_Henry_WhereIsTower()
{
	AI_Output(other,self, " DIA_Addon_Francis_BanditsDead_15_08 " );	// Where exactly is the tower?
	AI_Output(self,other, " DIA_Addon_Henry_Entercrew_Add_04_07 " );	// Go south and keep to the right.
	AI_Output(self,other, " DIA_Addon_Henry_Entercrew_Add_04_08 " );	// You will see a tower on a small cliff.
};


instance DIA_Addon_Henry_Turmbanditen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 13;
	condition = DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information = DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent = TRUE;
	description = " About the bandits in the tower... " ;
};


func int DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor) && (MIS_Henry_FreeBDTTower != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Turmbanditen_15_00 " );	// About the bandits in the tower...
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Да?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//Они мертвы.
		if(MIS_Henry_FreeBDTTower == LOG_Running)
		{
			AI_Output(self,other, " DIA_Addon_Henry_Turmbanditen_04_02 " );	// Great! Well, one less problem.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Henry_Turmbanditen_04_03 " );	// Did you deal with them alone? Let me show you my respect!
			AI_Output(self,other, " DIA_Addon_Henry_Turmbanditen_04_04 " );	// Maybe someday you'll even become a real pirate!
		};
		SawPirate.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		Npc_ExchangeRoutine(SawPirate,"START");
		HammerPirate.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		Npc_ExchangeRoutine(HammerPirate,"START");
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		B_LogEntry(TOPIC_Addon_BanditsTower, " Tower bandits killed. " );
		B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
	}
	else if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		AI_Output(self,other, " DIA_Addon_Henry_Turmbanditen_04_07 " );	// What else do you want?
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Henry_Turmbanditen_04_05 " );	// If you're planning on dealing with them yourself, forget it!
		AI_Output(self,other, " DIA_Addon_Henry_Turmbanditen_04_06 " );	// Soon I will send two people from my squad there. They will take care of the bandits.
	};
};


instance DIA_Addon_Henry_Palisade_Bandits(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 14;
	condition = DIA_Addon_Henry_Palisade_Bandits_Condition;
	information = DIA_Addon_Henry_Palisade_Bandits_Info;
	permanent = FALSE;
	description = " Why do you think the bandits might attack you? " ;
};


func int DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Bandits_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Palisade_Bandits_15_00 " );	// Why do you think the bandits might attack you?
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Bandits_04_04 " );	// Because there is a war between us and the bandits! What did you think?
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Bandits_04_05 " );	// Everything was fine at first. We brought bandits here, they went to their swamp and left us alone.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Bandits_04_06 " );	// But now these bastards attack every outsider.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Bandits_04_07 " );	// Only the devil knows what's gotten into them.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Bandits_04_08 " );	// I think they want our ships. Because there is no other way to get out of here.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Bandits_04_09 " );	// About the bandits, you better talk to Skip. He did some business with them - and miraculously survived.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Bandits_04_10 " );	// He can tell you a lot of interesting things.
	if (self.aivar[ AIV_PASSGATE ] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Henry_Palisade_Bandits_04_11 " );	// (mockingly) The only pity is that you won't be able to talk to him. You didn't pay to get in...
		Henry_Zoll_WhatFor = TRUE;
	};
};


var int Henry_EnterCrewMember;

instance DIA_Addon_Henry_Entercrew(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 31;
	condition = DIA_Addon_Henry_Entercrew_Condition;
	information = DIA_Addon_Henry_Entercrew_Info;
	permanent = TRUE;
	description = " I want to join your squad. " ;
};


func int DIA_Addon_Henry_Entercrew_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_EnterCrewMember == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Entercrew_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Entercrew_15_00 " );	// I want to join your squad.
	if (self.aivar[ AIV_PASSGATE ] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Henry_Entercrew_Add_04_00 " );	// (laughs) No, that's not going to work, mate!
		AI_Output(self,other, " DIA_Addon_Henry_Entercrew_Add_04_01 " );	// You need to get to the camp first!
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Henry_Entercrew_04_06 " );	// Well, welcome!
		AI_Output(self,other, " DIA_Addon_Henry_Entercrew_04_07 " );	// One more fighter won't hurt us.
		if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Addon_Henry_Entercrew_Add_04_02 " );	// Hmmm... (thoughtfully) I'd order you to take one of my guys and smoke out the bandits who have settled in the tower.
			AI_Output(self,other, " DIA_Addon_Henry_Entercrew_Add_04_03 " );	// But you already did.
		}
		else
		{
			if (Npc_IsDead(SawPirate) && Npc_IsDead(HammerPirate))
			{
				AI_Output(self,other, " DIA_Addon_Henry_Entercrew_Add_04_04 " );	// Both of my warriors are dead, so you'll have to deal with this alone.
				AI_Output(self,other, " DIA_Addon_Henry_Entercrew_Add_04_05 " );	// You must get rid of the bandits who have settled in the tower!
				B_LogEntry(TOPIC_Addon_BanditsTower, " Henry wants me to deal with the bandits occupying the tower. He can't help me. " );
			}
			else
			{
				AI_Output(self,other, " DIA_Addon_Henry_Entercrew_Add_04_06 " );	// Take one of my guys and deal with these bandits.
				Henry_GetPartyMember = TRUE;
				B_LogEntry(TOPIC_Addon_BanditsTower, " Henry wants me to deal with the bandits in the tower. I can take one of his guys with me. " );
			};
			B_Henry_WhereIsTower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//Есть, сэр!
			MIS_Henry_FreeBDTTower = LOG_Running;
		};
		Henry_EnterCrewMember = TRUE;
	};
};


instance DIA_Addon_Henry_Owen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 32;
	condition = DIA_Addon_Henry_Owen_Condition;
	information = DIA_Addon_Henry_Owen_Info;
	description = " Any other tasks for me? " ;
};


func int DIA_Addon_Henry_Owen_Condition()
{
	if((MIS_Henry_FreeBDTTower == LOG_SUCCESS) && (Henry_EnterCrewMember == TRUE) && !Npc_IsDead(Malcom))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Owen_15_01 " );	// Any other tasks for me?
	AI_Output(self,other, " DIA_Addon_Henry_Owen_04_01 " );	// We've been waiting a few days for a new batch of wood for the palisade.
	AI_Output(self,other, " DIA_Addon_Henry_Owen_04_05 " );	// It was supposed to be delivered by Malcolm and Owen.
	if(!Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other, " DIA_Addon_Henry_Owen_04_06 " );	// Their camp is not far from here, by the valley to the southeast.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Henry_Owen_04_07 " );	// Malcolm said that harvesting the tree would take some time. But not forever!
	};
	AI_Output(self,other, " DIA_Addon_Henry_Owen_04_08 " );	// Tell him I'm tired of waiting!
	AI_Output(self,other, " DIA_Addon_Henry_Owen_04_09 " );	// No, wait! Better tell that to Owen. Malcolm is too unreliable.
	B_MalcomExident();
	MIS_Henry_HolOwen = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_Running);
	B_LogEntry(TOPIC_Addon_HolOwen, " Henry needs wood to build the stockade. I should tell Owen about it. He and Malcolm can be found in the lowlands. " );
};

func void B_Addon_Henry_MalcomsDead()
{
	AI_Output(self,other, " DIA_Addon_Henry_Owen2_Add_04_00 " );	// What's up with Malcolm?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//Он мертв.
	AI_Output(self,other, " DIA_Addon_Henry_Owen2_Add_04_02 " );	// Poor guy. Looks like luck has run out on him...
};


instance DIA_Addon_Henry_Owen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 33;
	condition = DIA_Addon_Henry_Owen2_Condition;
	information = DIA_Addon_Henry_Owen2_Info;
	permanent = TRUE;
	description = " About Owen the lumberjack... " ;
};


func int DIA_Addon_Henry_Owen2_Condition()
{
	if(MIS_Henry_HolOwen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen2_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Owen2_15_00 " );	// About Owen the lumberjack...
	if(Npc_IsDead(PIR_1367_Addon_Owen) == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//Он мертв.
		AI_Output(self,other, " DIA_Addon_Henry_Owen2_04_02 " );	// Damn it! Apparently, I'll have to send a new person there.
		AI_Output(self,other, " DIA_Addon_Henry_Owen2_04_03 " );	// Morgan was just in time to take care of the wild animals that flooded the entire district.
		B_Addon_Henry_MalcomsDead();
		MIS_Henry_HolOwen = LOG_OBSOLETE;
		B_LogEntry(TOPIC_Addon_HolOwen, " Owen and Malcom are dead. " );
		Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	}
	else if(Owen_ComesToHenry == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Henry_Owen2_15_03 " );	// Owen will bring the tree soon.
		AI_Output(self,other, " DIA_Addon_Henry_Owen2_04_04 " );	// Very good. And very timely.
		B_Addon_Henry_MalcomsDead();
		AI_Output(self,other, " DIA_Addon_Henry_Owen2_04_05 " );	// Here's your reward.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		B_StartOtherRoutine(PIR_1367_Addon_Owen,"PostStart");
		B_LogEntry(TOPIC_Addon_HolOwen, " Owen will take the tree to Henry. " );
		MIS_Henry_HolOwen = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Henry_Owen2_15_06 " );	// Repeat, where is the lumberjack camp?
		AI_Output(self,other, " DIA_Addon_Henry_Owen2_04_07 " );	// Not far from here, by the valley to the southeast.
	};
};


var int Henry_PERM_Once;

instance DIA_Addon_Henry_Palisade_CanHelp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 34;
	condition = DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information = DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent = TRUE;
	description = " Do you need help? " ;
};


func int DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if((MIS_Henry_HolOwen == LOG_SUCCESS) || (MIS_Henry_HolOwen == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_CanHelp_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Palisade_CanHelp_15_00 " );	// Do you need help?
	if(Henry_PERM_Once == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Henry_Palisade_CanHelp_04_01 " );	// Do you know anything about building palisades?
		AI_Output(other,self, " DIA_Addon_Henry_Palisade_CanHelp_15_02 " );	// Honestly, no.
		AI_Output(self,other, " DIA_Addon_Henry_Palisade_CanHelp_04_03 " );	// Then you won't be useful here. Help someone else.
		Henry_PERM_Once = TRUE;
	};
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_CanHelp_04_04 " );	// You can drink yourself out of memory, I don't mind. Just don't interfere with my workers.
};


instance DIA_Addon_Henry_WhatTeach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 21;
	condition = DIA_Addon_Henry_WhatTeach_Condition;
	information = DIA_Addon_Henry_WhatTeach_Info;
	permanent = TRUE;
	description = " Can you teach me how to fight better? " ;
};


func int DIA_Addon_Henry_WhatTeach_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_Addon_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WhatTeach_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_WhatTeach_Add_15_00 " );	// Can you teach me how to fight better?

	if (self.aivar[ AIV_PASSGATE ] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Henry_WhatTeach_Add_04_01 " );	// (laughs) First, pay for the entrance to the camp, and then we'll talk about it.
		AI_Output(self,other, " DIA_Addon_Henry_WhatTeach_Add_04_02 " );	// Tuition price included in the entrance fee.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Henry_WhatTeach_Add_04_03 " );	// Of course, why not?
		Henry_Addon_TeachPlayer = TRUE;
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	};
};


var int Henry_merke2h;
var int Henry_Labercount;

func void B_Henry_CommentFightSkill()
{
	if(Henry_Labercount == 0)
	{
		AI_Output(self,other, " DIA_Addon_Henry_CommentFightSkill_04_01 " );	// You're a fast learner. Maybe you can become a real pirate.
		Henry_Labercount = 1;
	}
	else if(Henry_Labercount == 1)
	{
		AI_Output(self,other, " DIA_Addon_Henry_CommentFightSkill_04_02 " );	// If you keep going like this, you'll soon be able to single-handedly take over an entire ship.
		Henry_Labercount = 2;
	}
	else if(Henry_Labercount == 2)
	{
		AI_Output(self,other, " DIA_Addon_Henry_CommentFightSkill_04_03 " );	// Never Forget: Those Who Remember to Parry Live Longer!
		Henry_Labercount = 0;
	};
};


instance DIA_Addon_Henry_Teach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_Teach_Condition;
	information = DIA_Addon_Henry_Teach_Info;
	permanent = TRUE;
	description = " Teach me! " ;
};


func int DIA_Addon_Henry_Teach_Condition()
{
	if(Henry_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//Учи меня!
	Henry_merke2h = other.HitChance[NPC_TALENT_2H];
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] > Henry_merke2h)
	{
		B_Henry_CommentFightSkill();
	}
	else if(other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other, " DIA_Addon_Henry_Teach_Back_04_00 " );	// Your skill grows.
	};
	Info_ClearChoices(DIA_Addon_Henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_CB_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,75);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,75);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};


instance DIA_Addon_Henry_Palisade_Train(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Train_Condition;
	information = DIA_Addon_Henry_Palisade_Train_Info;
	permanent = FALSE;
	description = " Greg - vash commander? " ;
};


func int DIA_Addon_Henry_Palisade_Train_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Henry_Palisade ) && ( GregIsBack ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Train_Info()
{
	AI_Output(other,self, " DIA_Addon_Henry_Palisade_Train_15_00 " );	// Greg - vash commander?
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Train_04_01 " );	// Yes. But to you, he is CAPTAIN Greg. This is clear?
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Train_04_02 " );	// He is a great person. When you meet him, you'd better not be on the side of his enemies. You won't even have time to regret it.
	if (PIR_1300_Addon_Greg_NW.aivar[AIV_TalkedToPlayer] ==  TRUE )
	{
		AI_Output(other,self, " DIA_Addon_Henry_Palisade_Train_15_03 " );	// I've already met him.
		AI_Output(self,other, " DIA_Addon_Henry_Palisade_Train_04_04 " );	// Very good. So you understand what I'm talking about.
	};
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Train_04_05 " );	// However, he is not in the camp now.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Train_04_06 " );	// We're in command of Francis.
	AI_Output(self,other, " DIA_Addon_Henry_Palisade_Train_04_07 " );	// He sits in front of Greg's cabin all day and watches us work.
};


instance DIA_Addon_Henry_YourOwnTrupp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_YourOwnTrupp_Condition;
	information = DIA_Addon_Henry_YourOwnTrupp_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_YourOwnTrupp_Info()
{
	AI_Output(self,other, " DIA_Addon_Henry_Add_04_04 " );	// So, the captain gave you your own squad.
	AI_Output(self,other, " DIA_Addon_Henry_Add_04_05 " );	// Make sure your people don't sit idly by!
	AI_StopProcessInfos(self);
};

