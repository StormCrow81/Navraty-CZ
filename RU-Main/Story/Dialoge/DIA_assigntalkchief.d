
instance DIA_AssignTalkChief(C_Info)
{
	nr = 1;
	condition = DIA_AssignTalkChief_condition;
	information = DIA_AssignTalkChief_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_AssignTalkChief_condition()
{
	if(self.vars[0] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_AssignTalkChief_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if(self.voice == 12)
	{
		AI_Output(self,other, " DIA_AssignTalkChief_01_00 " );	// Stinking thief!
	}
	else if(self.voice == 10)
	{
		AI_Output(self,other, " DIA_AssignTalkChief_01_01 " );	// You dirty thief!
	}
	else if(self.voice == 1)
	{
		AI_Output(self,other, " DIA_AssignTalkChief_01_02 " );	// You dirty thief!
	}
	else if(self.voice == 14)
	{
		AI_Output(self,other, " DIA_AssignTalkChief_01_03 " );	// You dirty thief!
	}
	else if(self.voice == 7)
	{
		AI_Output(self,other, " DIA_AssignTalkChief_01_04 " );	// Dirty thief!
	}
	else if(self.voice == 4)
	{
		AI_Output(self,other, " DIA_AssignTalkChief_01_05 " );	// You dirty thief!
	}
	else if((self.voice == 16) || (self.voice == 17))
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_07");	//Ах ты вор!
	}
	else
	{
		AI_Output(self,other, " DIA_AssignTalkChief_01_06 " );	// Dirty thief!	
	};

	if((self.voice == 16) || (self.voice == 17))
	{
	}
	else
	{
		AI_Output(self,other, " DIA_AssignTalkChief_01_08 " );	// Did you really think that I would not notice your theft?!
	};

	Info_ClearChoices(dia_assigntalkchief);
	Info_AddChoice(dia_assigntalkchief, " Well, bite me! " ,dia_assigntalkchief_biteme);
	Info_AddChoice(dia_assigntalkchief, " Shall we forget about this? " ,dia_assigntalkchief_helpyou);

	if(self.aivar[AIV_MM_WuselEnd] < DayNow)
	{
		Info_AddChoice(dia_assigntalkchief, " What are you talking about? I don't understand... " ,dia_assigntalkchief_knowrhetorika);
	};
};

func void dia_assigntalkchief_biteme()
{
	HERO_CANESCAPEFROMGOTCHA = FALSE;
	HERO_PAYPRICEFROMGOTCHA = FALSE;
	self.vars[0] = FALSE;
	AI_Output(other,self, " DIA_AssignTalkChief_BiteMe_01_00 " );	// Well, bite me!

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other, " DIA_AssignTalkChief_BiteMe_F1_01_01 " );	// You'll regret this!
		}
		else
		{
			AI_Output(self,other, " DIA_AssignTalkChief_BiteMe_F2_01_01 " );	// You'll regret this!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_AssignTalkChief_BiteMe_01_01 " );	// You'll regret this!
	};

	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,1);
};

func void dia_assigntalkchief_helpyou()
{
	var int payrand;
	payrand = Hlp_Random(100);
	HERO_CANESCAPEFROMGOTCHA = FALSE;
	self.vars[0] = FALSE;
	AI_Output(other,self, " DIA_AssignTalkChief_HelpYou_01_01 " );	// Can we forget about it?

	if(payrand >= 75)
	{
		HERO_PAYPRICEFROMGOTCHA = 200;
	}
	else if(payrand >= 50)
	{
		HERO_PAYPRICEFROMGOTCHA = 100;
	}
	else if(payrand >= 25)
	{
		HERO_PAYPRICEFROMGOTCHA = 50;
	}
	else
	{
		HERO_PAYPRICEFROMGOTCHA = FALSE;
	};
	if((self.guild == GIL_PAL) || (self.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_01_02 " );	// Servant of Innos doesn't deal with thieves like you!
		AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_01_03 " );	// So it's too late to apologize now.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else if(self.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_01_04 " );	// A servant of Adanos won't deal with thieves!
		AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_01_05 " );	// So it's too late to apologize now.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else if(HERO_PAYPRICEFROMGOTCHA == FALSE)
	{
		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_F1_01_06 " );	// Forget it, you bastard!
				AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_F1_01_07 " );	// You'll regret contacting me.
			}
			else
			{
				AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_F2_01_06 " );	// Forget it, you bastard!
				AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_F2_01_07 " );	// You'll regret contacting me.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_01_06 " );	// Forget it, you bastard!
			AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_01_07 " );	// You'll regret contacting me.
		};

		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else
	{
		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_F1_01_08 " );	// Hmmm... (thinking) All right. I agree.
				AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_F1_01_09 " );	// But you will have to pay for your insolence.
			}
			else
			{
				AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_F2_01_08 " );	// Hmmm... (thinking) All right. I agree.
				AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_F2_01_09 " );	// But you will have to pay for your insolence.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_01_08 " );	// Hmmm... (thinking) All right. I agree.
			AI_Output(self,other, " DIA_AssignTalkChief_HelpYou_01_09 " );	// But you will have to pay for your insolence.
		};

		AI_Output(other,self,"DIA_AssignTalkChief_HelpYou_01_10");	//И сколько?
		B_Say_Gold(self,other,HERO_PAYPRICEFROMGOTCHA);
		Info_ClearChoices(dia_assigntalkchief);

		if(Npc_HasItems(other,ItMi_Gold) >= HERO_PAYPRICEFROMGOTCHA)
		{
			Info_AddChoice(dia_assigntalkchief, " Okay! Keep your gold. " ,dia_assigntalkchief_dealpay);
		};

		Info_AddChoice(dia_assigntalkchief, " Forget it. " ,dia_assigntalkchief_nopay);
	};
};

func void dia_assigntalkchief_dealpay()
{
	AI_Output(other,self, " DIA_AssignTalkChief_DealPay_01_01 " );	// Okay! Keep your gold.
	B_GiveInvItems(other,self,ItMi_Gold,HERO_PAYPRICEFROMGOTCHA);

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other, " DIA_AssignTalkChief_DealPay_F1_01_02 " );	// That's nice. Think I didn't see anything.
		}
		else
		{
			AI_Output(self,other, " DIA_AssignTalkChief_DealPay_F2_01_02 " );	// That's nice. Think I didn't see anything.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_AssignTalkChief_DealPay_01_02 " );	// That's nice. Think I didn't see anything.
	};

	HERO_PAYPRICEFROMGOTCHA = FALSE;
	AI_StopProcessInfos(self);
};

func void dia_assigntalkchief_nopay()
{
	AI_Output(other,self, " DIA_AssignTalkChief_NoPay_01_01 " );	// Forget it.

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other, " DIA_AssignTalkChief_NoPay_F1_01_02 " );	// Well, whatever you want! Then don't be offended.
		}
		else
		{
			AI_Output(self,other, " DIA_AssignTalkChief_NoPay_F2_01_02 " );	// Well, whatever you want! Then don't be offended.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_AssignTalkChief_NoPay_01_02 " );	// Well, whatever you want! Then don't be offended.
	};

	HERO_PAYPRICEFROMGOTCHA = FALSE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,1);
};

func void dia_assigntalkchief_knowrhetorika()
{
	AI_Output(other,self, " DIA_AssignTalkChief_KnowRhetorika_01_01 " );	// What are you talking about? I do not understand...

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other, " DIA_AssignTalkChief_KnowRhetorika_F1_01_02 " );	// Unthinkable! You've been caught by the hand and you still have the audacity to deny it!
		}
		else
		{
			AI_Output(self,other, " DIA_AssignTalkChief_KnowRhetorika_F2_01_02 " );	// Unthinkable! You've been caught by the hand and you still have the audacity to deny it!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_AssignTalkChief_KnowRhetorika_01_02 " );	// Unthinkable! You've been caught by the hand and you still have the audacity to deny it!
	};

	AI_Output(other,self, " DIA_AssignTalkChief_KnowRhetorika_01_03 " );	// I didn't mean to steal anything from you! It seemed to you.

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other, " DIA_AssignTalkChief_KnowRhetorika_F1_01_04 " );	// And you naively think that I will believe this nonsense?!
		}
		else
		{
			AI_Output(self,other, " DIA_AssignTalkChief_KnowRhetorika_F2_01_04 " );	// And you naively think that I will believe this nonsense?!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_AssignTalkChief_KnowRhetorika_01_04 " );	// And you naively think that I will believe this nonsense?!
	};

	Info_ClearChoices(dia_assigntalkchief);
	Info_AddChoice(dia_assigntalkchief, " (try to persuade) " ,dia_assigntalkchief_tellme);
};

func void dia_assigntalkchief_tellme()
{
	var int rhetoricand;

	rhetoricand = Hlp_Random( 50 );
	AI_Output(other,self, " DIA_AssignTalkChief_TellMe_01_01 " );	// Well, do you believe now?
	self.aivar[AIV_MM_WuselEnd] = Wld_GetDay();

	if(RhetorikSkillValue[1] > rhetorikarand)
	{
		HERO_CANESCAPEFROMGOTCHA = FALSE;
		HERO_PAYPRICEFROMGOTCHA = FALSE;
		self.vars[0] = FALSE;
		TempRhetLearnSuccess += 1;

		if(TempRhetLearnSuccess >= 10)
		{
			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};

			TempRhetLearnSuccess = FALSE;
		};

		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other, " DIA_AssignTalkChief_TellMe_F1_01_02 " );	// Okay, okay... You've convinced me! Perhaps I really just imagined it all.
			}
			else
			{
				AI_Output(self,other, " DIA_AssignTalkChief_TellMe_F2_01_02 " );	// Okay, okay... You've convinced me! Perhaps I really just imagined it all.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_AssignTalkChief_TellMe_01_02 " );	// Okay, okay... You've convinced me! Perhaps I really just imagined it all.
		};

		AI_Output(other,self, " DIA_AssignTalkChief_TellMe_01_03 " );	// Of course.
		Info_ClearChoices(dia_assigntalkchief);
	}
	else
	{
		TempRhetLearnFail += 1;

		if(TempRhetLearnFail >= 20)
		{
			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};

			TempRhetLearnFail = FALSE;
		};
		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other, " DIA_AssignTalkChief_TellMe_F1_01_04 " );	// No! You have absolutely not convinced me of the correctness of your words.
			}
			else
			{
				AI_Output(self,other, " DIA_AssignTalkChief_TellMe_F2_01_04 " );	// No! You have absolutely not convinced me of the correctness of your words.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_AssignTalkChief_TellMe_01_04 " );	// No! You have absolutely not convinced me of the correctness of your words.
		};

		AI_Output(other,self, " DIA_AssignTalkChief_TellMe_01_05 " );	// Well, that's a pity.
		Info_ClearChoices(dia_assigntalkchief);
		Info_AddChoice(dia_assigntalkchief, " Well, bite me! " ,dia_assigntalkchief_biteme);
		Info_AddChoice(dia_assigntalkchief, " Can we sort this out somehow then? " ,dia_assigntalkchief_helpyou);
	};
};

func void B_AssignTalkChief(var C_Npc slf)
{
	if(slf.vars[0] == TRUE)
	{
		DIA_AssignTalkChief.npc = Hlp_GetInstanceID(slf);
	};
};
