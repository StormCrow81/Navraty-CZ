
instance DIA_Bronko_EXIT(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 999;
	condition = DIA_Bronko_EXIT_Condition;
	information = DIA_Bronko_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bronko_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bronko_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Bronko_HALLO (C_Info)
{
	npc = BAU_935_Bronko;
	nr = 1;
	condition = DIA_Bronko_HALLO_Condition;
	information = DIA_Bronko_HALLO_Info;
	important = TRUE;
};


func int DIA_Bronko_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Bronko_HALLO_Info()
{
	AI_Output(self,other, " DIA_Bronko_HALLO_06_00 " );	// And where are we going?
	AI_Output(other,self, " DIA_Bronko_HALLO_15_01 " );	// Are you the senior here?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Bronko_HALLO_06_02 " );	// I'll cave your face in, fool!
	};
	AI_Output(self,other, " DIA_Bronko_HALLO_06_03 " );	// If you want to walk freely on my land, you must pay me 5 gold or I send you to the nearest landfill!
	Info_ClearChoices(DIA_Bronko_HALLO);
	Info_AddChoice(DIA_Bronko_HALLO, " Forget it. You won't get anything from me. " ,DIA_Bronko_HALLO_vergisses);
	Info_AddChoice(DIA_Bronko_HALLO, " Looks like I have no choice - here's your money. " ,DIA_Bronko_HALLO_hiergeld);
	Info_AddChoice(DIA_Bronko_HALLO, " Your land? Are you a local farmer? " ,DIA_Bronko_HALLO_deinland);
};

func void DIA_Bronko_HALLO_deinland()
{
	AI_Output(other,self, " DIA_Bronko_HALLO_deinland_15_00 " );	// Your land? Are you a local farmer?
	AI_Output(self,other, " DIA_Bronko_HALLO_deinland_06_01 " );	// Naturally. Why else would you have to pay me my due?
	AI_Output(self,other, " DIA_Bronko_HALLO_deinland_06_02 " );	// You should ask the others about me. Hehe!
};

func void DIA_Bronko_HALLO_hiergeld()
{
	AI_Output(other,self, " DIA_Bronko_HALLO_hiergeld_15_00 " );	// Looks like I have no choice - here's your money.
	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		B_GiveInvItems(other,self,ItMi_Gold,5);
		AI_Output(self,other, " DIA_Bronko_HALLO_hiergeld_06_01 " );	// Why thank you. Have a good trip.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Bronko_HALLO_hiergeld_06_02 " );	// You don't even have 5 coins. What's your game shithead?
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Bronko_HALLO_vergisses()
{
	AI_Output(other,self, " DIA_Bronko_HALLO_vergisses_15_00 " );	// Forget it. You won't get anything from me.
	if((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Bronko_HALLO_vergisses_06_01 " );	// Then I'm afraid I'll have to remove your teeth.
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other, " DIA_Bronko_HALLO_vergisses_06_02 " );	// You guys from the city guard are in financial trouble, huh?
		};
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
		{
			AI_Output(self,other, " DIA_Bronko_HALLO_vergisses_06_03 " );	// I don't care that you're a mage. You still have to pay. Clear?
		};
		if((hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM))
		{
			AI_Output(self,other, " DIA_Bronko_HALLO_vergisses_06_04 " );	// What, another broke novice? It doesn't matter, you'll still pay!
		};
		if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
		{
			AI_Output(self,other, " DIA_Bronko_HALLO_vergisses_06_05 " );	// Hey, I don't know who you are or where you come from, but you'll pay like everybody else.
		};
	};
	Info_ClearChoices(DIA_Bronko_HALLO);
	Info_AddChoice(DIA_Bronko_HALLO, " Looks like I have no choice - here's your money. " ,DIA_Bronko_HALLO_hiergeld);
	Info_AddChoice(DIA_Bronko_HALLO, " Then try and take it from me. " ,DIA_Bronko_HALLO_attack);
};

func void DIA_Bronko_HALLO_attack()
{
	AI_Output(other,self, " DIA_Bronko_HALLO_attack_15_00 " );	// Then try and take it from me.
	AI_Output(self,other, " DIA_Bronko_HALLO_attack_06_01 " );	// Well, since you're like that...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instances DIA_Bronko_KEINBAUER (C_Info)
{
	npc = BAU_935_Bronko;
	nr = 2;
	condition = DIA_Bronko_KEINBAUER_Condition;
	information = DIA_Bronko_KEINBAUER_Info;
	permanent = TRUE;
	description = " You?! A farmer?! Don't make me laugh. " ;
};


var int DIA_Bronko_KEINBAUER_noPerm;

func int DIA_Bronko_KEINBAUER_Condition();
{
	if (((MIS_Sekob_Bronko_is_noPerm == LOG_Running) || (Babera_BronkoKeinBauer ==  TRUE )) && (self.aivar[AIV_LastFightAgainstPlayer] !=  FIGHT_LOST ) && (DIA_Bronko_KEINBAUER_noPerm ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Bronko_KEINBAUER_Info()
{
	AI_Output(other,self, " DIA_Bronko_KEINBAUER_15_00 " );	// You?! A farmer?! Don't make me laugh. You're a nobody.
	AI_Output(self,other, " DIA_Bronko_KEINBAUER_06_01 " );	// Say that again? You are begging for it you bastard!
	Info_ClearChoices(DIA_Bronko_KEINBAUER);
	if(hero.guild == GIL_NONE)
	{
		if (Babera_BronkoKeinBauer ==  TRUE )
		{
			Info_AddChoice(DIA_Bronko_KEINBAUER, " (threaten Bronko with mercenaries) " ,DIA_Bronko_KEINBAUER_SLD);
		};
		if (MIS_Sekob_Bronko_einschuechtert == LOG_Running)
		{
			Info_AddChoice(DIA_Bronko_KEINBAUER, "The farmer here is Sekob, and you're just a petty crook. " ,DIA_Bronko_KEINBAUER_sekobderbauer);
		};
	};
	Info_AddChoice(DIA_Bronko_KEINBAUER, " Well... Let's see what you can do. " ,DIA_Bronko_KEINBAUER_attack);
	Info_AddChoice(DIA_Bronko_KEINBAUER, " Forget it! " ,DIA_Bronko_KEINBAUER_schongut);
};

func void DIA_Bronko_KEINBAUER_attack()
{
	AI_Output(other,self, " DIA_Bronko_KEINBAUER_attack_15_00 " );	// Well... Let's see what you can do.
	AI_Output(self,other, " DIA_Bronko_KEINBAUER_attack_06_01 " );	// I was hoping you'd say that.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Bronko_KEINBAUER_sekobderbauer()
{
	AI_Output(other,self, " DIA_Bronko_KEINBAUER_sekobderbauer_15_00 " );	// The farmer here is Sekob, and you're just a petty crook fleecing innocent people.
	AI_Output(self,other, " DIA_Bronko_KEINBAUER_sekobderbauer_06_01 " );	// Is that right? Says who?
	AI_Output(other,self, " DIA_Bronko_KEINBAUER_sekobderbauer_15_02 " );	// Says me. Sekob wants you back to work, not hanging around here stinking up the place.
	AI_Output(self,other, " DIA_Bronko_KEINBAUER_sekobderbauer_06_03 " );	// Oh? Why don't you make me?
};

func void DIA_Bronko_KEINBAUER_schongut()
{
	AI_Output(other,self, " DIA_Bronko_KEINBAUER_schongut_15_00 " );	// Forget it!
	AI_Output(self,other, " DIA_Bronko_KEINBAUER_schongut_06_01 " );	// Get lost then!
	AI_StopProcessInfos(self);
};

func void DIA_Bronko_KEINBAUER_SLD()
{
	AI_Output(other,self, " DIA_Bronko_KEINBAUER_SLD_15_00 " );	// Okay, then maybe I'll have to tell Onar that there's an impudent farmer here who refuses to pay rent.
	AI_Output(self,other, " DIA_Bronko_KEINBAUER_SLD_06_01 " );	// Damn. Wait a minute. Onar will send mercenaries here.
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_02");	//So what?
	AI_Output(self,other, " DIA_Bronko_KEINBAUER_SLD_06_03 " );	// Okay, okay. I'll give you whatever you want, but just don't involve the mercenaries in this, okay?
	if(B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold)))
	{
		AI_Output(self,other, " DIA_Bronko_KEINBAUER_SLD_06_04 " );	// Here, I'll even give you all my gold.
	};
	AI_Output(self,other, " DIA_Bronko_KEINBAUER_SLD_06_05 " );	// And I'll go back to the field and work. Anything, just keep those bastards away from me, ok?
	AI_StopProcessInfos(self);
	DIA_Bronko_KEINBAUER_noPerm = TRUE ;
	self.guild = GIL_BAU;
	Npc_ExchangeRoutine(self,"Start");
	MIS_Sekob_Bronko_einschuechtert = LOG_SUCCESS ;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bronko_FLEISSIG (C_Info)
{
	npc = BAU_935_Bronko;
	nr = 3;
	condition = DIA_Bronko_FLEISSIG_Condition;
	information = DIA_Bronko_FLEISSIG_Info;
	permanent = TRUE;
	description = " (tease Bronco) " ;
};


func int DIA_Bronko_FLEISSIG_Condition()
{
	if ((MIS_Sekob_Bronko_einschuechtert ==  LOG_SUCCESS ) || (self.aivar[AIV_LastFightAgainstPlayer] ==  FIGHT_LOST ))
	{
		return TRUE;
	};
};

func void DIA_Bronko_DILIGIOUS_Info()
{
	if (MIS_Sekob_Bronko_einschuechtert ==  LOG_SUCCESS )
	{
		AI_Output(other,self, " DIA_Bronko_FLEISSIG_15_00 " );	// How are you? You work like a bee, right?
	}
	else
	{
		AI_Output(other,self, " DIA_Bronko_FLEISSIG_15_01 " );	// How are you? Have you lost the desire to screw around yet?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Bronko_FLEISSIG_06_02 " );	// You're a mercenary, aren't you? Its obvious.
	}
	else  if (MIS_Sekob_Bronko_einschuechtert ==  LOG_SUCCESS )
	{
		AI_Output(self,other, " DIA_Bronko_FLEISSIG_06_03 " );	// (in fear) You're not bringing the mercenaries here, are you?
	};
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Bronko_FLEISSIG_06_04 " );	// Don't hurt me, please.
	};
	AI_Output(self,other, " DIA_Bronko_FLEISSIG_06_05 " );	// I'll even get back to work, okay?
	MIS_Sekob_Bronko_einschuechtert = LOG_SUCCESS ;
	AI_StopProcessInfos(self);
	self.guild = GIL_BAU;
	Npc_ExchangeRoutine(self,"Start");
};


instances DIA_Bronko_PICKPOCKET (C_Info)
{
	npc = BAU_935_Bronko;
	nr = 900;
	condition = DIA_Bronko_PICKPOCKET_Condition;
	information = DIA_Bronko_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bronko_PICKPOCKET_Condition()
{
	return  C_Robbery ( 54 , 80 );
};

func void DIA_Bronko_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bronko_PICKPOCKET);
	Info_AddChoice(DIA_Bronko_PICKPOCKET,Dialog_Back,DIA_Bronko_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bronko_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Bronko_PICKPOCKET_DoIt);
};

func void DIA_Bronko_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Bronko_PICKPOCKET);
};

func void DIA_Bronko_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bronko_PICKPOCKET);
};
