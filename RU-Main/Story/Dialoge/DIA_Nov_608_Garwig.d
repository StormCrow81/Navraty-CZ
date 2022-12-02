

instance DIA_Garwig_EXIT(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 999;
	condition = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garwig_Wurst (C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Wurst_Condition;
	information = DIA_Garwig_Sausage_Info;
	permanent = FALSE;
	description = " Would you like some sausage? " ;
};

func int DIA_Garwig_Wurst_Condition()
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Sausage_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_Garwig_Wurst_15_00 " );	// Do you want sausages?
	AI_Output(self,other, " DIA_Garwig_Wurst_06_01 " );	// Oh, how delicious. Thank you very much, brother.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_Garwig_Hello(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Garwig_Hello_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hello_Info()
{
	AI_Output(self,other, " DIA_Garwig_Hello_06_00 " );	// May Innos be with you, I've never seen you before. Are you new here?
	AI_Output(other,self, " DIA_Garwig_Hello_15_01 " );	// Yes, I just became a novice.
	AI_Output(self,other, " DIA_Garwig_Hello_06_02 " );	// Then I wish you to get comfortable here quickly. Let me know if you need help.
};


instance DIA_Garwig_Room(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 5;
	condition = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent = FALSE;
	description = " What room is this? " ;
};

func int DIA_Garwig_Room_Condition()
{
	return TRUE;
};

func void DIA_Garwig_Room_Info()
{
	AI_Output(other,self, " DIA_Garwig_Room_15_00 " );	// What is this room?
	AI_Output(self,other, " DIA_Garwig_Room_06_01 " );	// The sacred relics of the monastery are kept here.
	AI_Output(other,self, " DIA_Garwig_Room_15_02 " );	// What relics?
	AI_Output(self,other, " DIA_Garwig_Room_06_03 " );	// The Hammer of Innos rests here, as well as the Shield of Fire! These are the most important relics of the Church of Innos here, away from the capital of the kingdom.
};

instance DIA_Garwig_Hammer(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 99;
	condition = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent = TRUE;
	description = " Tell me about this hammer. " ;
};


func int DIA_Garwig_Hammer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hammer_Info()
{
	AI_Output(other,self, " DIA_Garwig_Hammer_15_00 " );	// Tell me about this hammer.
	AI_Output(self,other, " DIA_Garwig_Hammer_06_01 " );	// It's the sacred Hammer of Innos! With this hammer, Saint Robar hit the Stone Sentinel.
	AI_Output(self,other, " DIA_Garwig_Hammer_06_02 " );	// The scriptures say that the Stone Sentinel was invulnerable. He towered over the battlefield like a tower, and the weapons of his enemies shattered against his stone skin.
	AI_Output(self,other, " DIA_Garwig_Hammer_06_03 " );	// With the name of Innos on his lips, Rhobar rushed at this monster and struck him with one mighty blow of his hammer.
};


instance DIA_Garwig_Shield(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 98;
	condition = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent = FALSE;
	description = " Tell me about this shield. " ;
};


func int DIA_Garwig_Shield_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Shield_Info()
{
	AI_Output(other,self, " DIA_Garwig_Shield_15_00 " );	// Tell me about this shield.
	AI_Output(self,other, " DIA_Garwig_Shield_06_01 " );	// Shield of Fire belonged to Dominic in the Battle of the Southern Isles.
	AI_Output(self,other, " DIA_Garwig_Shield_06_02 " );	// But the power of this shield shouldn't be used anymore - so we've nailed it to the wall.
};


instance DIA_Garwig_Eye (C_Info)
{
	npc = Nov_608_Garwig;
	nr = 4;
	condition = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent = FALSE;
	description = " Is the Eye of Innos also kept here? " ;
};


func int DIA_Garwig_Auge_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Garwig_Room ) && ( Capital <=  2 )) ;
	{
		return TRUE;
	};
};

func void DIA_Garwig_Eye_Info()
{
	AI_Output(other,self, " DIA_Garwig_Auge_15_00 " );	// Is the Eye of Innos also kept here?
	AI_Output(self,other, " DIA_Garwig_Auge_06_01 " );	// Of course not. What a strange thought. No one knows where this divine artifact is stored.
};


instance DIA_Garwig_SLEEP(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 23;
	condition = DIA_Garwig_SLEEP_Condition;
	information = DIA_Garwig_SLEEP_Info;
	permanent = TRUE;
	description = " What are you doing here? " ;
};

func int DIA_Garwig_SLEEP_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_SLEEP_Info()
{
	AI_Output(other, self, " DIA_Garwig_SLEEP_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Garwig_SLEEP_06_01 " );	// I am the guardian of sacred artifacts.
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP,Dialog_Back,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice(DIA_Garwig_SLEEP, " What if I take over for a little while? " ,DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice(DIA_Garwig_SLEEP, " Why are these artifacts protected? " ,DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice(DIA_Garwig_SLEEP, " Do you ever sleep? " ,DIA_Garwig_SLEEP_NEVER);
};

func void DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices(DIA_Garwig_SLEEP);
};

func void DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output(other,self, " DIA_Garwig_SLEEP_EXCHANGE_15_00 " );	// What if I take over for a little while?
	AI_Output(self,other, " DIA_Garwig_SLEEP_EXCHANGE_06_01 " );	// Is this a test? The magicians sent you to test me, right? Ooh, I knew it!
	AI_Output(self,other, " DIA_Garwig_SLEEP_EXCHANGE_06_02 " );	// But I will pass this test. Tell your mages that I was rock solid and that I will resist all temptations. That I am a good guard.
};

func void DIA_Garwig_SLEEP_THIEF()
{
	AI_Output(other,self, " DIA_Garwig_SLEEP_THIEF_15_00 " );	// Why are these artifacts guarded? Any reason to believe they might be stolen?
	AI_Output(self,other, " DIA_Garwig_SLEEP_THIEF_06_01 " );	// What a crazy idea. Why do you think so?
	AI_Output(self,other, " DIA_Garwig_SLEEP_THIEF_06_02 " );	// Only those who serve Innos may enter the monastery. And none of the true believers can even have such an idea.
};

func void DIA_Garwig_SLEEP_NEVER()
{
	AI_Output(other,self, " DIA_Garwig_SLEEP_NEVER_15_00 " );	// Do you ever sleep?
	AI_Output(self,other, " DIA_Garwig_SLEEP_NEVER_06_01 " );	// What an unusual remark. Of course, I never sleep. Innos himself grants me the strength to go without sleep.
	AI_Output(self,other, " DIA_Garwig_SLEEP_NEVER_06_02 " );	// How else could I fulfill the sacred duties of a guardian?
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP, " Do you really NEVER sleep? " ,DIA_Garwig_SLEEP_AGAIN);
};

func void DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output(other,self, " DIA_Garwig_SLEEP_AGAIN_15_00 " );	// Do you really NEVER sleep?
	AI_Output(self,other, " DIA_Garwig_SLEEP_AGAIN_06_01 " );	// No. If the guardian falls asleep, he will fail his test.
	AI_Output(self,other, " DIA_Garwig_SLEEP_AGAIN_06_02 " );	// But I won't fail, because Innos gives me strength and endurance, and I never get tired.
};


instance DIA_Garwig_THIEF(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_THIEF_Condition;
	information = DIA_Garwig_THIEF_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Garwig_THIEF_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(hero,Holy_Hammer_MIS) == 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_THIEF_Info()
{
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other, " DIA_Garwig_THIEF_06_00 " );	// (disappointed) Thief! You have dishonored not only yourself and me, but the whole monastery!
		AI_Output(self,other, " DIA_Garwig_THIEF_06_01 " );	// You will pay for this sacrilege. And, I conjure Innos - RETURN THIS HAMMER to me!
	}
	else
	{
		AI_Output(self,other, " DIA_Garwig_THIEF_06_02 " );	// (in desperation) The hammer is gone! How could this happen?
		AI_Output(self,other, " DIA_Garwig_THIEF_06_03 " );	// I failed the test. Innos will punish me!
	};
};

instance DIA_Garwig_Give away (C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_Abgabe_Condition;
	information = DIA_Garwig_Abmachen_Info;
	permanent = TRUE;
	description = " I brought the hammer back. " ;
};

func int DIA_Garwig_Release_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Give_Info()
{
	AI_Output(other,self, " DIA_Garwig_Abgeben_15_00 " );	// I brought the hammer back.
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other, " DIA_Garwig_Abgeben_06_01 " );	// Oh, you vile thief!
	}
	else
	{
		AI_Output(self,other, " DIA_Garwig_Abgeben_06_02 " );	// So you took it...
	};
	AI_Output(self,other, " DIA_Garwig_Abgeben_06_03 " );	// But I have no right to judge you! Let Innos condemn you, and you will suffer the punishment you deserve.
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE ;
};

instance DIA_Garwig_PICKPOCKET(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 900;
	condition = DIA_Garwig_PICKPOCKET_Condition;
	information = DIA_Garwig_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};

func int DIA_Garwig_PICKPOCKET_Condition()
{
	return  C_Robbery ( 52 , 80 );
};

func void DIA_Garwig_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,Dialog_Back,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 70)
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
		Info_ClearChoices(dia_lord_hagen_pickpocket);
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

func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};
