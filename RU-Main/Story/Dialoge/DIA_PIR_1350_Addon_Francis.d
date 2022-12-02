

instance DIA_Addon_Francis_EXIT(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 999;
	condition = DIA_Addon_Francis_EXIT_Condition;
	information = DIA_Addon_Francis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Francis_EXIT_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Francis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Francis_First(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 1;
	condition = DIA_Addon_Francis_First_Condition;
	information = DIA_Addon_Francis_First_Info;
	permanent = FALSE;
	description = " Is this your cabin? " ;
};


func int DIA_Addon_Francis_First_Condition()
{
	if ((Knows_GregsHut ==  FALSE ) && (Francis_Ausgeschissen ==  FALSE ) && Npc_HasItems(self,ITKE_Greg_MY_ADDON))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Francis_First_Info()
{
	AI_Output(other,self, " DIA_Addon_Francis_GregsHut_15_00 " );	// Is this your hut?
	AI_Output(self,other, " DIA_Addon_Francis_GregsHut_13_01 " );	// No, it belongs to Greg.
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Francis_LetMeIn(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 2;
	condition = DIA_Addon_Francis_LetMeIn_Condition;
	information = DIA_Addon_Francis_LetMeIn_Info;
	permanent = FALSE;
	description = " I have to get to Greg's cabin. " ;
};


func int DIA_Addon_Francis_LetMeIn_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Addon_Francis_First) || (Knows_GregsHut ==  TRUE )) && (Francis_Addon ==  FALSE ) && Npc_HasItems(self,ITKE_Greg_MY_ADDON));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Francis_LetMeIn_Info()
{
	AI_Output(other,self, " DIA_Addon_Francis_LetMeIn_15_00 " );	// I have to get into Greg's cabin.
	AI_Output(self,other, " DIA_Addon_Francis_LetMeIn_13_01 " );	// And forget to think!
	AI_Output(self,other, " DIA_Addon_Francis_LetMeIn_13_02 " );	// Greg is gone now. And I locked the door so that he would not be robbed inadvertently.
	AI_Output(self,other, " DIA_Addon_Francis_LetMeIn_13_03 " );	// So you'd better stay away or you'll regret it!
};


instance DIA_Addon_Francis_AboutGreg(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 3;
	condition = DIA_Addon_Francis_AboutGreg_Condition;
	information = DIA_Addon_Francis_AboutGreg_Info;
	permanent = FALSE;
	description = " Greg - your boss? " ;
};


func int DIA_Addon_Francis_AboutGreg_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Francis_LetMeIn ) && ( Francis_selection ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Francis_AboutGreg_Info()
{
	AI_Output(other,self, " DIA_Addon_Francis_AboutGreg_15_00 " );	// Greg - your boss?
	AI_Output(self,other, " DIA_Addon_Francis_AboutGreg_13_01 " );	// Just don't try to tell me you know him!
	AI_Output(self,other, " DIA_Addon_Francis_AboutGreg_13_02 " );	// Any sailor... even the last land rat knows the terrible Captain Greg!
	AI_Output(self,other, " DIA_Addon_Francis_AboutGreg_13_03 " );	// (arrogantly) And he left ME in charge!
	AI_Output(self,other, " DIA_Addon_Francis_AboutGreg_13_04 " );	// I have to force these lazy people to do his bidding!
	AI_Output(self,other, " DIA_Addon_Francis_AboutGreg_13_05 " );	// Some people think that now, while the captain is gone, they can do whatever they want.
	AI_Output(self,other, " DIA_Addon_Francis_AboutGreg_13_06 " );	// They'll be VERY surprised when Greg comes back.
	AI_Output(self,other, " DIA_Addon_Francis_AboutGreg_13_07 " );	// I'll tell him everything about what happened here, okay?
	AI_Output(self,other, " DIA_Addon_Francis_AboutGreg_13_08 " );	// I'll also tell him about those who tried to break into his home.
	AI_Output(self,other, " DIA_Addon_Francis_AboutGreg_13_09 " );	// So get lost or you'll be in big trouble.
};


var int Francis_paid;

instance DIA_Addon_Francis_Key(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 4;
	condition = DIA_Addon_Francis_Key_Condition;
	information = DIA_Addon_Francis_Key_Info;
	permanent = TRUE;
	description = " Give me the key to Greg's cabin! " ;
};


func int DIA_Addon_Francis_Key_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Francis_Key_Info()
{
	AI_Output(other,self, " DIA_Addon_Francis_Key_15_00 " );	// Give me the key to Greg's cabin!
	AI_Output(self,other, " DIA_Addon_Francis_Key_13_01 " );	// You must be joking!
	Info_ClearChoices(DIA_Addon_Francis_Key);
	Info_AddChoice(DIA_Addon_Francis_Key, " I'll think about it... " ,DIA_Addon_Francis_Key_BACK);
	Info_AddChoice(DIA_Addon_Francis_Key, " I'll give you two thousand gold! " ,DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice(DIA_Addon_Francis_Key, " I'll give you a thousand gold! " ,DIA_Addon_Francis_Key_1000Gold);
};

func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices(DIA_Addon_Francis_Key);
};

func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output(other,self, " DIA_Addon_Francis_Key_1000Gold_15_00 " );	// I'll give you a thousand gold pieces!
	AI_Output(self,other, " DIA_Addon_Francis_Key_1000Gold_13_01 " );	// I'm afraid that's not enough to betray the captain.
	AI_Output(self,other, " DIA_Addon_Francis_Key_1000Gold_13_02 " );	// Watch your words or you'll be in trouble!
};

func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output(other,self, " DIA_Addon_Francis_Key_2000Gold_15_00 " );	// I'll give you two thousand gold pieces!
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		AI_Output(self,other, " DIA_Addon_Francis_Key_2000Gold_13_01 " );	// Look, you're asking me to riot on the ship.
		AI_Output(self,other, " DIA_Addon_Francis_Key_2000Gold_13_02 " );	// Although, on the other hand...
		AI_Output(self,other, " DIA_Addon_Francis_Key_2000Gold_13_03 " );	// Okay, let's get the money. After all, we won't tell anyone.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_04");	//Вот ключ!
		AI_Output(self,other, " DIA_Addon_Francis_Key_2000Gold_13_05 " );	// Hurry before Greg comes back. And don't you dare tell anyone about this, you understand?!
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
		francis_paid = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_FrancisNotEnoughGold_13_05 " );	// (laughs) Ha! I bet you don't have that much!
	};
	Info_ClearChoices(DIA_Addon_Francis_Key);
};


instance DIA_Addon_Francis_AufsMaul(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_AufsMaul_Condition;
	information = DIA_Addon_Francis_AufsMaul_Info;
	permanent = TRUE;
	description = " Well... Let's see what you can do. " ;
};


func int DIA_Addon_Francis_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AufsMaul_Info()
{
	AI_Output(other,self, " DIA_Addon_Francis_AufsMaul_15_00 " );	// Well then, let's see how you're going to stop me.
	AI_Output(self,other, " DIA_Addon_Francis_AufsMaul_13_01 " );	// What?! Here I am the captain!
	AI_Output(self,other, " DIA_Addon_Francis_AufsMaul_13_02 " );	// Oh, you land rat! I'll teach you to show respect!
	FRANCISIGNORME = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Francis_Buch(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_Buch_Condition;
	information = DIA_Addon_Francis_Buch_Info;
	permanent = TRUE;
	description = " I found your hideout. " ;
};


func int DIA_Addon_Francis_Buch_Condition()
{
	if(Npc_HasItems(other,ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Buch_Info()
{
	AI_Output(other,self, " DIA_Addon_Francis_Key_Business_15_03 " );	// I found your hiding place. Your money and ledger. This is your book, isn't it?
	AI_Output(self,other, " DIA_Addon_Francis_Buch_13_01 " );	// Uh...Never seen this book before.
	AI_Output(self,other, " DIA_Addon_Francis_Buch_13_02 " );	// And...uh...even IF it was my book...
	AI_Output(self,other, " DIA_Addon_Francis_Buch_13_03 " );	// You don't think the boys will believe YOU, do you?
	AI_Output(other,self, " DIA_Addon_Francis_Key_Business_15_01 " );	// You deceived them and deprived them of their legitimate prey.
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_04");	//Эээ...подожди немного...
	if(Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn))
		{
			AI_Output(self,other, " DIA_Addon_Francis_Buch_13_05 " );	// (ingratiatingly) You needed the key to Greg's cabin, didn't you?
		};
		AI_Output(self,other, " DIA_Addon_Francis_Buch_13_06 " );	// I'LL GIVE YOU THIS KEY!
		AI_Output(self,other, " DIA_Addon_Francis_Buch_13_07 " );	// There's a lot of value inside...
		AI_Output(self,other, " DIA_Addon_Francis_Buch_13_08 " );	// (nervously) But you have to give me the book and keep your mouth shut, okay?
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		Npc_RemoveInvItems(self,ITWR_Addon_FrancisAbrechnung_Mis,Npc_HasItems(self,ITWR_Addon_FrancisAbrechnung_Mis));
		B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
		FRANCISIGNORME = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Francis_Buch_13_09 " );	// Don't do stupid things!

		if (( Francis_bought ==  TRUE ) && ( Npc_HasItems ( self , It'sMy_Gold ) >=  2000 )) ;
		{
			AI_Output(self,other, " DIA_Addon_Francis_Buch_13_10 " );	// Here's your two thousand gold pieces!
			AI_Output(self,other, " DIA_Addon_Francis_Buch_13_11 " );	// On my own, I'll add another five hundred gold pieces.
			B_GiveInvItems(self,other,ItMi_Gold,2500);
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Francis_Buch_13_12 " );	// Here, take five hundred gold pieces!
			B_GiveInvItems(self,other,ItMi_Gold,500);
		};
		AI_Output(self,other, " DIA_Addon_Francis_Buch_13_13 " );	// (hurriedly) Now give me this thing here...
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		Npc_RemoveInvItems(self,ITWR_Addon_FrancisAbrechnung_Mis,Npc_HasItems(self,ITWR_Addon_FrancisAbrechnung_Mis));
	};
	AI_StopProcessInfos(self);
};


instance DIA_Francis_PICKPOCKET(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 900;
	condition = DIA_Francis_PICKPOCKET_Condition;
	information = DIA_Francis_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};


func int DIA_Francis_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ITKE_Greg_ADDON_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Francis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
	Info_AddChoice(DIA_Francis_PICKPOCKET,Dialog_Back,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Francis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Francis_PICKPOCKET_DoIt);
};

func void DIA_Francis_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Francis_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
};


instance DIA_Francis_Ausschissen (C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 900;
	condition = DIA_Francis_Ausschissen_Condition;
	information = DIA_Francis_Ausschissen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Francis_Ausgeschissen_Condition()
{
	if((Francis_ausgeschissen == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Francis_Ausschissen_Info()
{
	if ( ! Npc_IsDead(Greg))
	{
		AI_Output(self,other, " DIA_Addon_Francis_Ausgeschissen_13_00 " );	// (angrily) Thanks to you, Greg made me cut wood until there are no trees left on the island.
	};
	AI_Output(self,other, " DIA_Addon_Francis_Ausgeschissen_13_01 " );	// Leave me alone!
	AI_StopProcessInfos(self);
};

