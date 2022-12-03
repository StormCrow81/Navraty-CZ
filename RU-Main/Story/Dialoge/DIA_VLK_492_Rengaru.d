

instance DIA_Rengaru_EXIT(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 999;
	condition = DIA_Rengaru_EXIT_Condition;
	information = DIA_Rengaru_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rengaru_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rengaru_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Rengaru_PICKPOCKET (C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 900;
	condition = DIA_Rengaru_PICKPOCKET_Condition;
	information = DIA_Rengaru_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Rengaru_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 5 );
};

func void DIA_Rengaru_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET,Dialog_Back,DIA_Rengaru_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Rengaru_PICKPOCKET_DoIt);
};

func void DIA_Rengaru_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Rengaru_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};


instances of DIA_Rengaru_Hauab (C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_Hauab_Condition;
	information = DIA_Rengaru_Hauab_Info;
	permanent = TRUE;
	description = " What are you doing here? " ;
};


func int DIA_Rengaru_Hauab_Condition()
{
	if (( Close_Load != LOG_Running ) && ( Npc_KnowsInfo ( other , DIA_Come_to_GOTYOU ) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Hauab_Info()
{
	AI_Output(other,self, " DIA_Rengaru_Hauab_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Rengaru_Hauab_07_01 " );	// I don't understand why you care. Get out!
	AI_StopProcessInfos(self);
};

instance DIA_Rengaru_HALLODIEB (C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_HALLODIEB_Condition;
	information = DIA_Rengaru_HALLODIEB_Info;
	permanent = FALSE;
	description = " Jora says you stole money from him... " ;
};

func int DIA_Rengaru_HALLODIEB_Condition()
{
	if(Jora_Dieb == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Rengaru_HALLODIEB_Info()
{
	AI_Output(other,self, " DIA_Rengaru_HALLODIEB_15_00 " );	// Jora says you stole money from him...
	AI_Output(self,other, " DIA_Rengaru_HALLODIEB_07_01 " );	// Damn! I'm getting out of here!
	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMi_Gold,50);
	Npc_ExchangeRoutine(self,"RunAway");
};

instances DIA_Rengaru_GOTYOU (C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 3;
	condition = DIA_Rengaru_GOTYOU_Condition;
	information = DIA_Rengaru_GOTYOU_Info;
	permanent = FALSE;
	description = " Got it! " ;
};

func int DIA_Rengaru_GOTYOU_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB) == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_05_01") < 500))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_GOTYOU_Info()
{
	B_GivePlayerXP(XP_RengaruGotThief);
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//Поймал!
	AI_Output(self,other, " DIA_Rengaru_GOTYOU_07_01 " );	// What do you want from me?
	AI_Output(other,self, " DIA_Rengaru_GOTYOU_15_02 " );	// You stole Jora's wallet in broad daylight and he even saw you do it.
	AI_Output(other,self, " DIA_Rengaru_GOTYOU_15_03 " );	// That's why I came to tell you that you're a dirty thief and that...
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
	Info_AddChoice(DIA_Rengaru_GOTYOU, " ...I deserve a share of the loot. " ,DIA_Rengaru_GOTYOU_Anteil);
	Info_AddChoice(DIA_Rengaru_GOTYOU, " ...you'd better get Jora's gold back. Now. " ,DIA_Rengaru_GOTYOU_YouThief);
	Info_AddChoice(DIA_Rengaru_GOTYOU, " ...and now you tell me who you are. " ,DIA_Rengaru_GOTYOU_WhoAreYou);
};

func void DIA_Rengaru_GOTYOU_YouThief()
{
	AI_Output(other,self, " DIA_Rengaru_GOTYOU_YouThief_15_00 " );	// ...you'd better get Jora's gold back. And immediately.

	if(Npc_HasItems(self,ItMi_Gold) >= 1)
	{
		AI_Output(self,other, " DIA_Rengaru_GOTYOU_YouThief_07_01 " );	// Here's the gold, man! But now let me go. I will never do this again.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	}
	else
	{
		AI_Output(self,other, " DIA_Rengaru_GOTYOU_YouThief_07_02 " );	// I no longer have this gold.

		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other, " DIA_Rengaru_GOTYOU_YouThief_07_03 " );	// But why am I telling you this? After all, it was you who robbed me!
		};
	};

	Info_ClearChoices(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil()
{
	AI_Output(other,self, " DIA_Rengaru_GOTYOU_Anteil_15_00 " );	// ...I deserve a share of the loot.

	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (Npc_HasItems(self,ItMi_Gold) < 1))
	{
		AI_Output(self,other, " DIA_Rengaru_GOTYOU_Anteil_07_01 " );	// You already took everything I had after knocking me out! Let it go!
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other, " DIA_Rengaru_GOTYOU_Anteil_15_02 " );	// Okay, looks like I don't have a choice. Let's split it in half.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
		Info_AddChoice(DIA_Rengaru_GOTYOU, " No, you'll give me everything! " ,DIA_Rengaru_GOTYOU_Anteil_alles);
		Info_AddChoice(DIA_Rengaru_GOTYOU, " Okay, give me half then. " ,DIA_Rengaru_GOTYOU_Anteil_GehtKlar);
	};
};

func void DIA_Rengeru_GOTYOU_Share_everything()
{
	AI_Output(other,self, " DIA_Rengaru_GOTYOU_Anteil_alles_15_00 " );	// No, you'll give me everything!

	if(Npc_HasItems(self,ItMi_Gold) >= 2)
	{
		AI_Output(self,other, " DIA_Rengaru_GOTYOU_Anteil_alles_07_02 " );	// You're just robbing me. Okay, take this gold. Now leave me alone.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other, " DIA_Rengaru_GOTYOU_Anteil_alles_07_03 " );	// I'd give you the gold, but I don't have anything else.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengeru_GOTYOU_Share_GehtKlar()
{
	AI_Output(other,self, " DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00 " );	// Okay, give me half then.

	if(B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold) / 2))
	{
		AI_Output(self,other, " DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01 " );	// Here's your half! Now let me go!
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other, " DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02 " );	// I wouldn't mind giving you half, but I don't have anything else.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_WhoAreYou()
{
	AI_Output(other,self, " DIA_Rengaru_GOTYOU_WhoAreYou_15_00 " );	// ...and now you tell me who you are.
	AI_Output(self,other, " DIA_Rengaru_GOTYOU_WhoAreYou_07_01 " );	// I'm just a poor man trying to make ends meet.
	AI_Output(self,other, " DIA_Rengaru_GOTYOU_WhoAreYou_07_02 " );	// What else should I do? I can't find a job in the city...
	AI_Output(other,self, " DIA_Rengaru_GOTYOU_WhoAreYou_15_03 " );	// ...okay, I understand. Stop whining.
};

instances of DIA_Rengaru_INKNAST (C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 4;
	condition = DIA_Rengaru_INKNAST_Condition;
	information = DIA_Rengaru_INKNAST_Info;
	permanent = FALSE;
	description = " I have to turn you in to the militia. " ;
};

func int DIA_Rengaru_INKNAST_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Come_to_GOTYOU ))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_INKNAST_Info()
{
	AI_Output(other,self, " DIA_Rengaru_INKNAST_15_00 " );	// I have to hand you over to the militia.
	AI_Output(self,other, " DIA_Rengaru_INKNAST_07_01 " );	// What else do you need? I have nothing left! Let me go, huh?!
	Info_AddChoice(DIA_Rengaru_INKNAST, " Why should I let you go? " ,DIA_Rengaru_INKNAST_keinKnast);
	Info_AddChoice(DIA_Rengaru_INKNAST, " I'll make sure you get locked up. " ,DIA_Rengaru_INKNAST_Knast);
	Info_AddChoice(DIA_Rengaru_INKNAST, " Get out! And never see you here again! " ,DIA_Rengaru_INKNAST_HauAb);
};

func void DIA_Rengaru_INKNAST_HauAb()
{
	AI_Output(other,self, " DIA_Rengaru_INKNAST_HauAb_15_00 " );	// Get lost! And I don't want to see you here again!
	AI_Output(self,other, " DIA_Rengaru_INKNAST_HauAb_07_01 " );	// You won't regret it! Thanks boy!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	Thieves Guild_Okay = Thieves Guild_Okay +  1 ;
};

func void DIA_Rengaru_INKNAST_Knast()
{
	AI_Output(other,self, " DIA_Rengaru_INKNAST_Knast_15_00 " );	// I'll make sure you get locked up.
	AI_Output(self,other, " DIA_Rengaru_INKNAST_Knast_07_01 " );	// (wearily) I'm already tired of all this. If you feel like you have to do it, do as you please.
	AI_Output(self,other, " DIA_Rengaru_INKNAST_Knast_07_02 " );	// (warning) But beware: my friends won't let this go...
	Rengaru_InKnast = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Rengaru_INKNAST_keinKnast()
{
	AI_Output(other,self, " DIA_Rengaru_INKNAST_keinKnast_15_00 " );	// Why should I let you go?
	AI_Output(self,other, " DIA_Rengaru_INKNAST_keinKnast_07_01 " );	// In the city, it never hurts to connect with the right people - and have a good relationship with them.
	AI_Output(self,other, " DIA_Rengaru_INKNAST_keinKnast_07_02 " );	// I could put in a good word for you. I can't and don't want to say more. You decide.
};


instances DIA_Rengaru_LastInfoKap1 (C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 6;
	condition = DIA_Rengaru_LastInfoKap1_Condition;
	information = DIA_Rengaru_LastInfoKap1_Info;
	permanent = TRUE;
	description = " How are you? Are you all right? " ;
};


func int DIA_Rengaru_LastInfoKap1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_INKNAST))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_LastInfoKap1_Info()
{
	AI_Output(other,self, " DIA_Rengaru_LastInfoKap1_15_00 " );	// How are you? Are you all right?
	if(Rengaru_InKnast == TRUE)
	{
		AI_Output(self,other, " DIA_Rengaru_LastInfoKap1_07_01 " );	// Come on, come on, tease. Someday, you will pay for this. I swear!
	}
	else
	{
		AI_Output(self,other, " DIA_Rengaru_LastInfoKap1_07_02 " );	// What else do you need? I didn't steal anything else, honestly!
	};
};


instance DIA_Rengaru_character (C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_Character_Condition;
	information = DIA_Rengaru_Character_Info;
	permanent = FALSE;
	description = " (Show thief alert) " ;
};


func int DIA_Rengeru_Character_Condition()
{
	if (( Knows_SecretSign ==  TRUE ) && ( Come_InKnast ==  FALSE ) && Npc_KnowsInfo (other, DIA_Come_GOTYOU ))
	{
		return TRUE;
	};
};

func void DIA_Rengeru_Character_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other, " DIA_Rengaru_Zeichen_07_00 " );	// Hey, you're one of us.
	AI_Output(self,other, " DIA_Rengaru_Zeichen_07_01 " );	// I'll tell you something. If you intend to reach into someone's pocket in the city, be especially careful of merchants!
	AI_Output(self,other, " DIA_Rengaru_Zeichen_07_02 " );	// They are very vigilant and keep an eye on their belongings. But I can give you advice.
	AI_Output(self,other, " DIA_Rengaru_Zeichen_07_03 " );	// Try picking up the item you want with one hand while swinging it with the other. It will distract them.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};


var int is_rengaru_trade;

instance DIA_RENGARU_ISTRADE (C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 1;
	condition = dia_rengaru_istrade_condition;
	information = dia_rengaru_istrade_info;
	permanent = TRUE;
	description = " Do you have anything for sale? " ;
	trade = TRUE;
};


func int dia_rengaru_istrade_condition()
{
	if (( Knows_SecretSign ==  TRUE ) && ( Come_InKnast ==  FALSE ) && Npc_KnowsInfo (other, DIA_Come_GOTYOU ))
	{
		return TRUE;
	};
};

func void dia_rengaru_istrade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Rengaru_Trade_00 " );	// Do you have anything for sale?
	AI_Output(self,other, " DIA_Rengaru_Trade_01 " );	// Okay. I have some extra junk..

	if(IS_RENGARU_TRADE != 1)
	{
		B_LogEntry(TOPIC_CityTrader, " If I need lockpicks or something like that, I can contact Rengar " );
		IS_RENGARU_TRADE = 1;
	};

	B_GiveTradeInv(self);
};
