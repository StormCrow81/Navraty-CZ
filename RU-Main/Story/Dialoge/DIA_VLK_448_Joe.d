

instance DIA_Joe_EXIT(C_Info)
{
	npc = VLK_448_Joe;
	nr = 999;
	condition = DIA_Joe_EXIT_Condition;
	information = DIA_Joe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Joe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Joe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Joe_PICKPOCKET(C_Info)
{
	npc = VLK_448_Joe;
	nr = 900;
	condition = DIA_Joe_PICKPOCKET_Condition;
	information = DIA_Joe_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Joe_PICKPOCKET_Condition()
{
	return  C_Robbery ( 25 , 25 );
};

func void DIA_Joe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
	Info_AddChoice(DIA_Joe_PICKPOCKET,Dialog_Back,DIA_Joe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Joe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Joe_PICKPOCKET_DoIt);
};

func void DIA_Joe_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,30);
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

func void DIA_Joe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
};


instance DIA_Joe_Hello (C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Hallo_Condition;
	information = DIA_Joe_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Joe_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Joe_Hallo_Info()
{
	AI_Output(self,other, " DIA_Joe_Hallo_10_00 " );	// Hey, thanks man. Indeed, many thanks. I thought I'd never get out of here...
	TOPIC_END_Joe = TRUE;
	B_GivePlayerXP(XP_Ambient * 4);
	AI_Output(other,self, " DIA_Joe_Hallo_15_01 " );	// What are you doing HERE?
	AI_Output(self,other, " DIA_Joe_Hallo_10_02 " );	// I'm locked up. The door was open, and I just wanted to rummage around in there - but as soon as I went inside, a guard came and locked the damn door.
	AI_Output(self,other, " DIA_Joe_Hallo_10_03 " );	// I'm in a stupid position - and would be very grateful if all this remained between us.
	AI_Output(other,self, " DIA_Joe_Hallo_15_04 " );	// I understand. Yes, there really is nothing to be proud of.
	AI_Output(self,other, " DIA_Joe_Hallo_10_05 " );	// I wouldn't mind a drink right now.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Joe_Perm(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Perm_Condition;
	information = DIA_Joe_Perm_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Joe_Perm_Condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Joe_Perm_Info()
{
	AI_Output(other,self, " DIA_Joe_Perm_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Joe_Perm_10_01 " );	// Thank you for freeing me.
	AI_StopProcessInfos(self);
};


instance DIA_Joe_Sign(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Sign_Condition;
	information = DIA_Joe_Sign_Info;
	permanent = FALSE;
	description = " (Show thief alert) " ;
};


func int DIA_Joe_Sign_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500) && (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Joe_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other, " DIA_Joe_Sign_10_00 " );	// Hey, hi - we have mutual friends. And I would like to express my gratitude for the salvation.
	AI_Output(self,other, " DIA_Joe_Sign_10_01 " );	// Here, take these lock picks - I'm sure you'll need them.
	B_GiveInvItems(self,other,ItKE_lockpick,5);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	AI_StopProcessInfos(self);
};


instance DIA_JOE_INPRISOIN(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = dia_joe_inprisoin_condition;
	information = dia_joe_inprisoin_info;
	permanent = TRUE;
	description = " They say you tried to pay with the ring. " ;
};


func int dia_joe_inprisoin_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (CORAGONTELLJO == TRUE) && (JOTELLSGASPAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_joe_inprisoin_info()
{
	AI_Output(other,self, " DIA_Joe_InPrisoin_01_00 " );	// They say you tried to pay with the ring.
	AI_Output(self,other, " DIA_Joe_InPrisoin_01_01 " );	// Which ring?!
	if (Npc_HasItems(other,itri_hakonmissring) >=  1 )
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_02 " );	// With this ring. Do you recognize?
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_03 " );	// Well... well, yes, I gave it to the innkeeper Koragon for a drink.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_04 " );	// What's wrong with that?
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_05 " );	// Where did you get it from?
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_06 " );	// (nervous) I... I found him.
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_07 " );	// You're lying! Can you still tell the truth?
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_08 " );	// What other truth? I do not know anything. I swear by mom!
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_09 " );	// Look, boy, this ring was stolen from a merchant.
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_10 " );	// And if you don't tell me now where you got it, I'll just turn you in to the city militia.
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_12 " );	// Some guards are said to be very fond of torturing people these days.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_13 " );	// (panicked) But... but I didn't steal anything, I swear! I didn't steal that ring!
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_14 " );	// Then just tell me who gave it to you, and I'll let you go.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_15 " );	// Damn! Okay, I'll tell you everything.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_16 " );	// A trader named Gaspar gave it to me.
		AI_Output(other,self,"DIA_Joe_InPrisoin_01_97");	//Зачем?
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_18 " );	// Well, I... I did one errand for him, and he gave me this ring as payment.
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_19 " );	// What did you do for him?
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_20 " );	// He said he had to get to the inn, but he didn't want Hanna, the hostess there, to see him.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_21 " );	// He also said that by doing so, he wants to make one pleasant surprise for her.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_22 " );	// That's why he asked me to distract her with a conversation for a while.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_23 " );	// Well, he promised, of course, to pay well.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_25 " );	// I did everything as he said. And then he gave me this ring as payment.
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_26 " );	// Everything is clear. I'm going to need your testimony soon enough to put that bastard in jail.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_27 " );	// What?! But you promised!
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_28 " );	// You misunderstood me - I don't want to hand you over to the city militia.
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_29 " );	// I just need a witness to accuse Gasper of stealing. Are you savvy?
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_30 " );	// Well, I...(bewildered) okay, I'll do it.
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_31 " );	// That's great! Don't worry, you won't be arrested. But you can help me put this bastard in jail.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_33 " );	// I understand... you can count on me.
		JOTELLSGASPAR = TRUE;
		B_LogEntry( TOPIC_ABIGEILHELPHANNA , " I talked to Joe and he told me everything. Gaspard used it to distract Hannah while he sneaked into the inn and robbed Hakon the merchant. Then he planted things for Hannah and paid off Joe with the ring. Now we need to go and report about this to Lord Andre. I think after that, he will drop all charges against Hannah. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Joe_InPrisoin_01_35 " );	// What's the difference what?
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_36 " );	// I don't know what you mean, man.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_37 " );	// I didn't give anyone any ring.
		AI_Output(self,other, " DIA_Joe_InPrisoin_01_38 " );	// You must be wrong. So leave me alone.
		AI_StopProcessInfos(self);
	};
};

