
instance DIA_Onar_EXIT(C_Info)
{
	npc = Smell_900_Onar;
	nr = 999;
	condition = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Onar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Onar_Hallo (C_Info)
{
	npc = Smell_900_Onar;
	nr = 1;
	condition = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Onar_Hallo_Condition()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DAY_Onar_Hallo_Info()
{
	AI_Output(self,other, " DIA_Onar_Hallo_14_00 " );	// Who let you in here?!
	AI_Output(self,other, " DIA_Onar_Hallo_14_01 " );	// What are you doing on my farm?!
	OnarFM = TRUE;
};


instance DAY_Onar_PERM (C_Info)
{
	npc = Smell_900_Onar;
	nr = 1;
	condition = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent = TRUE;
	description = " Is everything all right here, on your farm? " ;
};


func int DIA_Onar_PERM_Condition()
{
	return TRUE;
};

func void DAY_Onar_PERM_Info()
{
	AI_Output(other,self, " DIA_Onar_PERM_15_00 " );	// Is everything all right here, on your farm?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Onar_PERM_14_01 " );	// I don't see what you care about. You don't work here!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other, " DIA_Onar_PERM_14_02 " );	// I really hope so! After all, that's what I'm paying you for!
		AI_Output(self,other, " DIA_Onar_PERM_14_03 " );	// You'd better go talk to Torlof, maybe he has a job for you.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Onar_PERM_14_04 " );	// Yes, of course. You can go hunt your dragons.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Onar_PERM_14_05 " );	// Your fake monastery henchmen are not welcome here!
		if(other.guild == GIL_KDF)
		{
			AI_Output(other,self, " DIA_Onar_PERM_14_07 " );	// I think your tongue is unhealthy. It's TOO long.
			AI_Output(other,self, " DIA_Onar_PERM_14_08 " );	// As the chosen one of Innos, I see this well.
		};
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Onar_PERM_14_06 " );	// Our hospitality does not extend to the king's troops.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Onar_PERM_14_07 " );	// I think your tongue is unhealthy. It's TOO long.
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Onar_PERM_14_08 " );	// As the chosen one of Innos, I see this well.
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Onar_PERM_14_09 " );	// (voice trembling) All is well.
	};
};


instance DIA_Onar_Work(C_Info)
{
	npc = Smell_900_Onar;
	nr = 2;
	condition = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent = FALSE;
	description = " I want to work for you! " ;
};


func int DIA_Onar_Work_Condition()
{
	if((Lee_SendToOnar == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};

	return  FALSE ;
};

func void DIA_Onar_Work_Info()
{
	AI_Output(other,self, " DIA_Onar_Work_15_00 " );	// I want to work for you!
	AI_Output(self,other, " DIA_Onar_Work_14_01 " );	// I don't need workers right now.
	AI_Output(self,other, " DIA_Onar_Work_14_02 " );	// My people are doing great.
	AI_Output(self,other, " DIA_Onar_Work_14_03 " );	// You have nothing to do in my house, get out!
};


instance DIA_Onar_WorkAsSld(C_Info)
{
	npc = Smell_900_Onar;
	nr = 2;
	condition = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent = FALSE;
	description = " I want to work here as a mercenary! " ;
};


func int DIA_Onar_WorkAsSld_Condition()
{
	if ((Lee_SendToOnar ==  FALSE ) && (hero.guild ==  GIL_NONE ) && (Onar_WegenSoldWorth ==  FALSE ) && Npc_KnowsInfo(other,DIA_Onar_Work));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Onar_WorkAsSld_Info()
{
	AI_Output(other,self, " DIA_Onar_WorkAsSld_15_00 " );	// I want to work here as a mercenary!
	AI_Output(self,other, " DIA_Onar_WorkAsSld_14_01 " );	// You? Mercenary? Do not make me laugh! If you could make a good mercenary, Lee would surely tell me about you.
	AI_Output(self,other, " DIA_Onar_WorkAsSld_14_02 " );	// Now get out of here, and live!
	Onar_WegenSldWerden = TRUE ;
};


instance DIA_Onar_Aufstand (C_Info)
{
	npc = Smell_900_Onar;
	nr = 3;
	condition = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent = FALSE;
	description = " You are against the city, I heard? " ;
};

func int DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};

func void DIA_Onar_Aufstand_Info()
{
	AI_Output(other,self, " DIA_Onar_Aufstand_15_00 " );	// You're opposing the city, I heard?
	AI_Output(self,other, " DIA_Onar_Aufstand_14_01 " );	// And now listen to you. I inherited this farm and this land from my father.
	AI_Output(self,other, " DIA_Onar_Aufstand_14_02 " );	// He inherited it from his father.
	AI_Output(self,other, " DIA_Onar_Aufstand_14_03 " );	// I won't let that greedy idiot who calls himself king ruin me just to feed his useless armies.
	AI_Output(self,other, " DIA_Onar_Aufstand_14_04 " );	// The war against the orcs has been going on for ages. And what have we come to? We are on the verge of defeat.
	AI_Output(self,other, " DIA_Onar_Aufstand_14_05 " );	// No - I prefer to defend my farm myself! The money I save in this way will be used to pay for my own army.
};


instance DIA_Onar_WegenPepe (C_Info)
{
	npc = Smell_900_Onar;
	nr = 4;
	condition = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent = FALSE;
	description = " You can thank Bulko, you've got a few sheep less. " ;
};


func int DIA_Onar_WegenPepe_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Onar_WegenPepe_Info()
{
	AI_Output(other,self, " DIA_Onar_WegenPepe_15_00 " );	// You can thank Bulko, you have a few sheep less.
	AI_Output(self,other, " DIA_Onar_WegenPepe_14_01 " );	// What are you talking about? Who is Bulko?
	AI_Output(other,self, " DIA_Onar_WegenPepe_15_02 " );	// One of the mercenaries.
	AI_Output(self,other, " DIA_Onar_WegenPepe_14_03 " );	// What do I care? If he touches my sheep, he will answer to Lee.
	AI_Output(self,other, " DIA_Onar_WegenPepe_14_04 " );	// Why are you distracting me with such trifles?
	Onar_WegenPepe = TRUE ;
};


instance DIA_Onar_WegenSekob (C_Info)
{
	npc = Smell_900_Onar;
	nr = 5;
	condition = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent = FALSE;
	description = " I'm here about Sekob's rent... " ;
};


func int DIA_Onar_WegenSekob_Condition()
{
	if ( MIS_Sekob_RedeMyHonor == LOG_Running )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Onar_WegenSekob_Info()
{
	AI_Output(other,self, " DIA_Onar_WegenSekob_15_00 " );	// I'm here about Sekob's rent...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Onar_WegenSekob_14_01 " );	// What the hell do you want here? Take the money to Torlof.
	}
	else
	{
		AI_Output(self,other, " DIA_Onar_WegenSekob_14_02 " );	// What the hell are you getting into?
		AI_Output(other,self, " DIA_Onar_WegenSekob_15_03 " );	// I want to become a mercenary. Collecting rent is my test.
		Onar_WegenSldWerden = TRUE ;
	};
	AI_Output(other,self, " DIA_Onar_WegenSekob_15_04 " );	// But Sekob has no money. I even tried to beat them out of him.
	AI_Output(other,self, " DIA_Onar_WegenSekob_15_05 " );	// He said it was because of the bad harvest...
	AI_Output(self,other, " DIA_Onar_WegenSekob_14_06 " );	// (yells) You brainless cretin! Do you think he carries money with him? He hides them somewhere!
	AI_Output(self,other, " DIA_Onar_WegenSekob_14_07 " );	// Do you know how much it rained this year? Bad harvest! Wow!
	AI_Output(self,other, " DIA_Onar_WegenSekob_14_08 " );	// Go and find a way to get that money out of him.
	Onar_WegenSekob = TRUE ;
};


var int onartomm;
var int onartomm1;

instance DIA_Onar_LeeSentMe(C_Info)
{
	npc = Smell_900_Onar;
	nr = 6;
	condition = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent = FALSE;
	description = " Lee sent me. I want to work as a mercenary! " ;
};


func int DIA_Onar_LeeSentMe_Condition()
{
	if((Lee_SendToOnar == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Onar_LeeSentMe_Info()
{
	AI_Output(other,self, " DIA_Onar_LeeSentMe_15_00 " );	// Lee sent me. I want to work as a mercenary!
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_01 " );	// He already talked to me.
	if (Onar_WegenSldWerden ==  TRUE )
	{
		AI_Output(self,other, " DIA_Onar_LeeSentMe_14_02 " );	// When we first met, I didn't have the best opinion of you.
	};
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_03 " );	// But since Lee thinks you can do it, I'll probably give you a chance.
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_08 " );	// Come tomorrow at noon, I'll need you.
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_09 " );	// In the meantime, you must clear the area around the crypt from the monsters.
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_10 " );	// And then we'll see if you're good for something.
	ONARTOMM = Wld_GetDay();
	ONARTOMM1 = TRUE;
	B_LogEntry(TOPIC_BecomeSLD, " Onar is waiting for me tomorrow at noon. He has some task. And today I have to clear the area of ​​the crypt from monsters. " );
	AI_StopProcessInfos(self);
};


instance DIA_ONAR_LEESENTMEPASS(C_Info)
{
	npc = Smell_900_Onar;
	nr = 6;
	condition = dia_onar_leesentmepass_condition;
	information = dia_onar_leesentmepass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_onar_leesentmepass_condition()
{
	if(((ONARTOMM + 1) == Wld_GetDay()) && (other.guild == GIL_NONE) && Wld_IsTime(11,45,12,15))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void dia_onar_leesentmepass_info()
{
	AI_Output(self,other, " DIA_Onar_LeeSentMePass_14_01 " );	// Here you are! Almost on time.
	AI_Output(self,other, " DIA_Onar_LeeSentMePass_14_02 " );	// Let's see what you're good for.
	AI_Output(self,other, " DIA_Onar_LeeSentMePass_14_03 " );	// See my ladies, and God forbid something happens to them!
	ONARTOMM1 = 5 ;
	B_LogEntry(TOPIC_BecomeSLD, " Onar ordered to accompany and protect his ladies. " );
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(BAU_910_Maria,"StartPass");
	B_StartOtherRoutine(BAU_911_Elena,"StartPass");
};

instance DIA_ONAR_LEESENTMEPASSGO (C_Info)
{
	npc = Smell_900_Onar;
	nr = 6;
	condition = dia_onar_leesentmepassgo_condition;
	information = dia_onar_leesentmepassgo_info;
	permanent = FALSE;
	description = " I misunderstood something here... " ;
};


func int dia_onar_leesentmepassgo_condition()
{
	if ((( ONARTOMM1  ==  6 ) || ( ONARTOMM1  ==  5 )) &&  ! Npc_IsDead(BAU_910_Maria) &&  ! Npc_IsDead(BAU_911_Elena))
	{
		return TRUE;
	};
};

func void dia_onar_leesentmepassgo_info()
{
	if(GLOBAL_FARM_ATTACK >= 10)
	{
		AI_Output(self,other, " DIA_Onar_LeeSentMePassGo_14_01 " );	// Get out of my sight, pathetic marauder!
		AI_Output(self,other, " DIA_Onar_LeeSentMe_14_06 " );	// As for everything else, talk to Lee.
	}
	else if(ONARTOMM1 == 5)
	{
		AI_Output(self,other, " DIA_Onar_LeeSentMePassGo_14_08 " );	// Where are my ladies, motherfucker?!
		AI_Output(self,other, " DIA_Onar_LeeSentMePassGo_14_09 " );	// You can't even follow a simple order!
		AI_Output(self,other, " DIA_Onar_LeeSentMe_14_03 " );	// But since Lee thinks you can do it, I'll probably give you a chance.
		AI_Output(self,other, " DIA_Onar_LeeSentMe_14_04 " );	// After all, he's responsible for you. So get on with your duties.
		AI_Output(self,other, " DIA_Onar_LeeSentMe_14_05 " );	// But don't piss me off! Leave the farmers and maids alone, and don't even think about stealing anything, okay?
		AI_Output(self,other, " DIA_Onar_LeeSentMe_14_06 " );	// As for everything else, talk to Lee.
		AI_Output(self,other, " DIA_Onar_LeeSentMe_14_07 " );	// And you and I need to discuss only your salary.
		ONARTOMM1 = 15 ;
		Onar_Approved = TRUE;
		B_LogEntry(TOPIC_BecomeSLD, " Onar was very dissatisfied, but he gave me his approval. Now there is nothing to prevent me from joining the ranks of the mercenaries. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Onar_LeeSentMePassGo_14_02 " );	// Great! So there were no problems? You have fulfilled my conditions.
		AI_Output(self,other, " DIA_Onar_LeeSentMe_14_06 " );	// As for everything else, talk to Lee.
		AI_Output(self,other, " DIA_Onar_LeeSentMe_14_07 " );	// And you and I need to discuss only your salary.
		ONARTOMM1 = 20 ;
		Onar_Approved = TRUE;
		B_LogEntry(TOPIC_BecomeSLD, " Onar was very pleased and gave me his approval. Now there is nothing to prevent me from joining the ranks of the mercenaries. " );
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(BAU_910_Maria,"Start");
	B_StartOtherRoutine(BAU_911_Elena,"Start");
};


instance DIA_ONAR_LEESENTMEPASSNO(C_Info)
{
	npc = Smell_900_Onar;
	nr = 6;
	condition = dia_onar_leesentmepassno_condition;
	information = dia_onar_leesentmepassno_info;
	permanent = FALSE;
	description = " I'm here. " ;
};


func int dia_onar_leesentmepassno_condition()
{
	if(((ONARTOMM + 1) <= Wld_GetDay()) && (other.guild == GIL_NONE) && (ONARTOMM1 == 1) && !Wld_IsTime(11,45,12,15) && (ONARTOMM1 != 5))
	{
		if ((( ONARTOMM  +  1 ) == Wld_GetDay()) && Wld_IsTime( 0 , 0 , 12 , 15 ))
		{
			return  FALSE ;
		}
		else
		{
			return TRUE;
		};
	};
};

func void dia_onar_leesentmepassno_info()
{
	AI_Output(other,self, " DIA_Onar_LeeSentMePassNO_15_00 " );	// I'm here.
	AI_Output(self,other, " DIA_Onar_LeeSentMePassNO_14_01 " );	// So what? You are late!
	AI_Output(self,other, " DIA_Onar_LeeSentMePassNO_14_02 " );	// You can't even complete a simple task!
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_03 " );	// But since Lee thinks you can do it, I'll probably give you a chance.
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_04 " );	// After all, he's responsible for you. So get on with your duties.
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_05 " );	// But don't piss me off! Leave the farmers and maids alone, and don't even think about stealing anything, okay?
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_06 " );	// As for everything else, talk to Lee.
	AI_Output(self,other, " DIA_Onar_LeeSentMe_14_07 " );	// And you and I need to discuss only your salary.
	ONARTOMM1 = 15 ;
	Onar_Approved = TRUE;
	B_LogEntry(TOPIC_BecomeSLD, " Onar was very dissatisfied, but he gave me his approval. Now there is nothing to prevent me from joining the ranks of the mercenaries. " );
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(BAU_910_Maria,"Start");
	B_StartOtherRoutine(BAU_911_Elena,"Start");
};

var int Onar_SOLD_Day;
var int Onar_SOLD_XP;

instance DIA_Onar_HowMuch (C_Info)
{
	npc = Smell_900_Onar;
	nr = 7;
	condition = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent = FALSE;
	description = " So what about my salary? " ;
};


func int DIA_Onar_HowMuch_Condition()
{
	if(Onar_Approved == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Onar_HowMuch_Info()
{
	var int temp1;
	AI_Output(other,self, " DIA_Onar_HowMuch_15_00 " );	// So what about my salary?
	AI_Output(self,other, " DIA_Onar_HowMuch_14_01 " );	// Ok, let's see...
	SOLD = 50;

	if (Onar_WegenSldWerden ==  TRUE )
	{
		AI_Output(self,other, " DIA_Onar_HowMuch_14_02 " );	// I don't have the best opinion of you.
		SOLD = SOLD - 10;
	};
	if (Onar_WegenSekob ==  TRUE )
	{
		AI_Output(self,other, " DIA_Onar_HowMuch_14_03 " );	// You're not particularly smart. It's obvious from your adventures with Sekob.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_Farm > 1) || ((B_GetGreatestPetzCrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0)))
	{
		AI_Output(self,other, " DIA_Onar_HowMuch_14_04 " );	// You've caused trouble here on the farm more than once.
		SOLD = SOLD - 10;
	};
	if ((Onar_WegenPepe ==  TRUE ) && ((Onar_WegenSekob ==  TRUE ) || (Onar_WegenSldWerden ==  TRUE )))
	{
		AI_Output(self,other, " DIA_Onar_HowMuch_14_05 " );	// And you keep pestering me with all sorts of nonsense.
		SOLD = SOLD - 10;
	};
	if(ONARTOMM1 == 20)
	{
		SOLD = SOLD + 15;
	};
	if(ONARTOMM1 == 15)
	{
		AI_Output(self,other, " DIA_Onar_HowMuch_14_08 " );	// You are especially lazy and forgetful.
		AI_Output(self,other, " DIA_Onar_HowMuch_14_09 " );	// Work for nothing for now.
		SOLD = 0;
	};
	AI_Output(self,other, " DIA_Onar_HowMuch_14_06 " );	// Let me think...
	temp1 = other.level * SOLD;

	if(temp1 == 0)
	{
		SOLD = 10;
	};
	if(temp1 <= 250)
	{
		SOLD = 50;
	};
	if((temp1 > 250) && (temp1 <= 500))
	{
		SOLD = 100;
	};
	if((temp1 > 500) && (temp1 <= 750))
	{
		SOLD = 150;
	};
	if((temp1 > 750) && (temp1 <= 1000))
	{
		SOLD = 200;
	};
	if(temp1 > 1000)
	{
		SOLD = 250;
	};

	B_Say_Gold(self,other,SOLD);
	Honor_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	AI_Output(self,other, " DIA_Onar_HowMuch_14_07 " );	// What do you say?
	Info_ClearChoices(DIA_Onar_HowMuch);
	Info_AddChoice(DIA_Onar_HowMuch, " Good! " ,DIA_Onar_HowMuch_Ok);
	Info_AddChoice(DIA_Onar_HowMuch, " Not everyone is here... " ,DIA_Onar_HowMuch_More);
	Info_AddChoice(DIA_Onar_HowMuch, " В день? " ,DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//В день?
	AI_Output(self,other, " DIA_Onar_HowMuch_PerDay_14_01 " );	// Who do you think you are? In Week! Yes, and this is a lot for you.

	if(RhetorikSkillValue[1] >= 30)
	{
		AI_Output(other,self, " DIA_Onar_HowMuch_New_00_02 " );	// It's just that I could be more useful to your farm, but I sometimes have problems with equipment.
		AI_Output(self,other, " DIA_Onar_HowMuch_New_00_03 " );	// Beliar would take you! OK. You can get paid every day.
		AI_Output(self,other, " DIA_Onar_HowMuch_New_00_04 " );	// But just don't talk nonsense anymore.
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus, " I can collect my due reward from Onar whenever I feel like it. " );
		Info_ClearChoices(DIA_Onar_HowMuch);
		SOLD = SOLD + 20;
	}
	else
	{
		AI_Output(self,other, " DIA_Onar_HowMuch_PerDay_14_02 " );	// Come on, come over here and get your money.
		AI_Output(self,other, " DIA_Onar_HowMuch_PerDay_14_03 " );	// I'm not going to bring them to you.
	};
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output(other,self, " DIA_Onar_HowMuch_More_15_00 " );	// Not everything here...
	AI_Output(self,other, " DIA_Onar_HowMuch_More_14_01 " );	// Sure, but you can work for me for free if you want.
	AI_Output(self,other, " DIA_Onar_HowMuch_More_14_02 " );	// That's all you get!
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus, " I can collect my due reward from Onar whenever I feel like it. " );
	Info_ClearChoices(DIA_Onar_HowMuch);
};

func void DIA_Onar_HowMuch_Ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//Хорошо!
	AI_Output(self,other, " DIA_Onar_HowMuch_Ok_14_01 " );	// I think so too. Now go talk to Lee.
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus, " I can collect my due reward from Onar whenever I feel like it. " );
	Info_ClearChoices(DIA_Onar_HowMuch);
};

var int OnarPissOffGold;

instance DIA_Onar_CollectGold(C_Info)
{
	npc = Smell_900_Onar;
	nr = 8;
	condition = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent = TRUE;
	description = " Pay me my salary! " ;
};

func int DIA_Onar_CollectGold_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Onar_HowMuch ) && ( OnarPissOffGold ==  FALSE ) && ( ( other . guild ==  GIL_SLD ) || ( other . guild ==  GIL_DJG )))
	{
		return TRUE;
	};
};

func void DIA_Onar_CollectGold_Info()
{
	AI_Output(other,self, " DIA_Onar_CollectGold_15_00 " );	// Pay me my salary!

	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Onar_CollectGold_14_01 " );	// I pay mercenaries, not dragon hunters.
		OnarPissOffGold = TRUE;
	}
	else if(Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output(self,other, " DIA_Onar_CollectGold_14_02 " );	// You're not doing your job well!
		AI_Output(self,other, " DIA_Onar_CollectGold_14_03 " );	// I asked Torlof how you're doing. And he told me that it takes you forever to get the job done.
		AI_Output(self,other, " DIA_Onar_CollectGold_14_04 " );	// I'm not going to pay slackers.
		AI_Output(self,other, " DIA_Onar_CollectGold_14_05 " );	// Now you have to work a few weeks without pay! Maybe then you will learn this lesson.
	}
	else if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other, " DIA_Onar_CollectGold_14_06 " );	// I heard you made a mess. Go to Lee first and settle this matter.
	}
	else if(Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output(self,other, " DIA_Onar_CollectGold_14_07 " );	// Are you crazy?
		AI_Output(self,other, " DIA_Onar_CollectGold_14_08 " );	// You must work for me for at least a day. You will receive your salary tomorrow.
	}
	else  if (Wld_GetDay() > Honor_SOLD_Day)
	{
		if(other.exp > Onar_SOLD_XP)
		{
			AI_Output(self,other, " DIA_Onar_CollectGold_14_13 " );	// Oh, okay... (contritely) Here's your salary.
			B_GiveInvItems(self,other,ItMi_Gold,SOLD);
			B_Say_Gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other, " DIA_Onar_CollectGold_14_14 " );	// What? But you didn’t do anything, just slept and wandered from corner to corner!
			AI_Output(self,other, " DIA_Onar_CollectGold_14_15 " );	// I'm not going to pay for this!
		};
		Honor_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};

instance DIA_Onar_MariaGold (C_Info)
{
	npc = Smell_900_Onar;
	nr = 9;
	condition = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent = FALSE;
	description = " Maria thinks I'm not getting enough. " ;
};

func int DIA_Onar_MariaGold_Condition()
{
	if(Maria_MehrGold == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Onar_MariaGold_Info()
{
	AI_Output(other,self, " DIA_Onar_MariaGold_15_00 " );	// Maria thinks I'm not getting enough.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//Что?
	AI_Output(other,self, " DIA_Onar_MariaGold_15_02 " );	// She said you should pay me more.
	AI_Output(self,other, " DIA_Onar_MariaGold_14_03 " );	// This woman sticks her nose in all the cracks!
	AI_Output(self,other, " DIA_Onar_MariaGold_14_04 " );	// She said how much?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//Нет.
	AI_Output(self,other, " DIA_Onar_MariaGold_14_06 " );	// Okay, next time you'll get fifty more gold.
	AI_Output(self,other, " DIA_Onar_MariaGold_14_07 " );	// But no more gold, okay?
	SOLD = SOLD + 50;
};


var int Onar_SellSheep;

instance DIA_Onar_WannaSheep(C_Info)
{
	npc = Smell_900_Onar;
	nr = 10;
	condition = DIA_Onar_WannaSheep_Condition;
	information = DIA_Onar_WannaSheep_Info;
	permanent = TRUE;
	description = " I want to buy a sheep! " ;
};


func int DIA_Onar_WannaSheep_Condition()
{
	if(Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Onar_WannaSheep_Info()
{
	AI_Output(other,self, " DIA_Onar_WannaSheep_15_00 " );	// I want to buy a sheep!
	AI_Output(self,other, " DIA_Onar_WannaSheep_14_01 " );	// What are you doing here then? Do you see a sheep around here somewhere?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//Я...
	AI_Output(self,other, " DIA_Onar_WannaSheep_14_03 " );	// If you want to buy a sheep, go to the pasture. It is located to the right of my house.
	AI_Output(self,other, " DIA_Onar_WannaSheep_14_04 " );	// Pepe will sell you one.
	if (Npc_IsDead(Pepe))
	{
		AI_Output(other,self, " DIA_Onar_WannaSheep_15_05 " );	// I'm afraid Pepe is dead.
		AI_Output(self,other, " DIA_Onar_WannaSheep_14_06 " );	// Oh! In that case... (indifferent) Leave two hundred gold coins to me and choose your own sheep for pasture.
		Onar_SellSheep = TRUE;
	};
};


instance DIA_Onar_BuyLiesel (C_Info)
{
	npc = Smell_900_Onar;
	nr = 10;
	condition = DIA_Onar_BuyLiesel_Condition;
	information = DIA_Onar_BuyLiesel_Info;
	permanent = TRUE;
	description = " Here, have two hundred gold coins! Give me a sheep. " ;
};


func int DIA_Onar_BuyLiesel_Condition()
{
	if(Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_BuyLiesel_Info()
{
	AI_Output(other,self, " DIA_Onar_BuyLiesel_15_00 " );	// Here, have two hundred gold coins! Give me a sheep.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other, " DIA_Onar_BuyLiesel_14_01 " );	// You can choose your own sheep in the pasture.
		AI_Output(self,other, " DIA_Onar_BuyLiesel_14_02 " );	// One of them will definitely follow you. Most of my sheep go by the name Betsy.
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	}
	else
	{
		AI_Output(self,other, " DIA_Onar_BuyLiesel_14_03 " );	// You don't have much money. So don't waste my precious time!
	};
};


instance DIA_ONAR_ONARBUSINESS(C_Info)
{
	npc = Smell_900_Onar;
	nr = 10;
	condition = dia_onar_onarbusiness_condition;
	information = dia_onar_onarbusiness_info;
	permanent = FALSE;
	description = " One merchant offers you a deal. " ;
};


func int dia_onar_onarbusiness_condition()
{
	if(MIS_ONARBUSINESS == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_onar_onarbusiness_info()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_01_00 " );	// One merchant offers you a deal.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_01_01 " );	// What? And what is the name of that merchant?
	AI_Output(other,self, " DIA_Onar_OnarBusiness_01_02 " );	// His name is Luthero. Do you know him?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_01_03 " );	// Yes, I know him - a large bird. What does he want from me?
	AI_Output(other,self, " DIA_Onar_OnarBusiness_01_04 " );	// He wants to conclude a contract with you for the supply of a large consignment of food.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_01_05 " );	// WHAT?! He should know I'm not selling anything to the city!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_01_06 " );	// Why did he think I'd make an exception for him?
	AI_Output(other,self, " DIA_Onar_OnarBusiness_01_07 " );	// Because he's willing to offer you some pretty good deals!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_01_08 " );	// (with contempt) I have very good conditions without him.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_01_09 " );	// And I don't see much need to change anything.
	Info_ClearChoices(dia_onar_onarbusiness);
	Info_AddChoice(dia_onar_onarbusiness, " Okay, forget about it. " ,dia_onar_onarbusiness_forget);
	Info_AddChoice(dia_onar_onarbusiness, " What are your terms? " ,dia_onar_onarbusiness_case);
	Info_AddChoice(dia_onar_onarbusiness, " Luthero really needs this deal. " ,dia_onar_onarbusiness_need);
	Info_AddChoice(dia_onar_onarbusiness, " Are you interested in extra gold? " ,dia_onar_onarbusiness_gold);
};

func void dia_onar_onarbusiness_gold()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Gold_01_01 " );	// Are you interested in extra gold?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Gold_01_02 " );	// Do you, insolent, consider me a dirty ragamuffin, ready to throw himself at any handout, like a dog on a bone?!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Gold_01_03 " );	// I have as much gold as neither you nor your Luthero even dreamed of!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Gold_01_04 " );	// It's even enough to buy your entire city and those snickering paladins with giblets. So know!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Gold_01_05 " );	// Now get out of my yard! And so that your spirit is no longer here!
	ONARNOTAGREED = TRUE;
	B_LogEntry( TOPIC_ONARBUSINESS , " I couldn't negotiate with Onar about food supplies for the guild. " );
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_need()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Need_01_01 " );	// Luther really needs this deal.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Need_01_02 " );	// These are his personal problems, and I have little interest in this.
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Need_01_03 " );	// But all your barns are bursting with excess food!
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Need_01_04 " );	// Why should you sell him some food?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Need_01_05 " );	// I told you I didn't intend to sell anything to him or the city. What's incomprehensible here?!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Need_01_06 " );	// Maybe then all of you there will quickly rest from hunger!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Need_01_07 " );	// This is especially true for your paladins, don't worry!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Need_01_08 " );	// So get the hell out of my yard and don't you dare ask me questions like that again.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Need_01_09 " );	// Hurry up before my guys count your ribs!
	ONARNOTAGREED = TRUE;
	B_LogEntry( TOPIC_ONARBUSINESS , " I couldn't negotiate with Onar about food supplies for the guild. " );
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_case()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Case_01_01 " );	// Your conditions?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Case_01_02 " );	// What?! What conditions? Did I negotiate something with you?
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Case_01_03 " );	// I was just asking on what terms you would be willing to sell this food to Luthero.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Case_01_04 " );	// Yes, boy, don't be arrogant.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Case_01_05 " );	// So now listen to me - there will be no conditions!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Case_01_06 " );	// I won't sell Luthero anything he wants!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Case_01_07 " );	// So you can pass it on to him.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Case_01_08 " );	// Now get the hell out of my yard before I lose my temper!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Case_01_09 " );	// Get out, I said!
	ONARNOTAGREED = TRUE;
	B_LogEntry( TOPIC_ONARBUSINESS , " I couldn't negotiate with Onar about food supplies for the guild. " );
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_forget()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Forget_01_01 " );	// Okay, forget about it.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Forget_01_02 " );	// Wait! We haven't finished this conversation yet.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Forget_01_03 " );	// Answer me: why did Luthero need so much food?
	Info_ClearChoices(dia_onar_onarbusiness);
	Info_AddChoice(dia_onar_onarbusiness, " I don't know that. " ,dia_onar_onarbusiness_dontknow);
	Info_AddChoice(dia_onar_onarbusiness, " He just wants to make more money from the needs of the city. " ,dia_onar_onarbusiness_deal);
	Info_AddChoice(dia_onar_onarbusiness, " Because his warehouses are empty. " ,dia_onar_onarbusiness_empty);
	Info_AddChoice(dia_onar_onarbusiness, " This is paladin food. " ,dia_onar_onarbusiness_paladin);
};

func void dia_onar_onarbusiness_paladin()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Paladin_01_01 " );	// This is paladin food.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Paladin_01_02 " );	// (angrily) WHAT?! Yes, he's crazy!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Paladin_01_03 " );	// And he thinks that after that I will sell him something?!
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Paladin_01_04 " );	// What's wrong with that?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Paladin_01_05 " );	// You know, I'm not out of my mind yet to start selling food to my enemies.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Paladin_01_06 " );	// Tell him so. Now get the hell out of my yard!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Paladin_01_07 " );	// Get out, I said!
	ONARNOTAGREED = TRUE;
	B_LogEntry( TOPIC_ONARBUSINESS , " I couldn't negotiate with Onar about food supplies for the guild. " );
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_empty()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Empty_01_01 " );	// Because its warehouses are empty.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Empty_01_02 " );	// Yes?! Hmmm. Somehow I hardly believe it.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Empty_01_03 " );	// Especially considering that many other farms sell almost all food to him.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Empty_01_04 " );	// You know, I think you're just fooling me and trying to cheat.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Empty_01_05 " );	// And more than anything, I don't like liars.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Empty_01_06 " );	// So get the hell out of my yard, you pathetic liar.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Empty_01_07 " );	// Otherwise, my guys will count your ribs!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Empty_01_08 " );	// Get out, I said!
	ONARNOTAGREED = TRUE;
	B_LogEntry( TOPIC_ONARBUSINESS , " I couldn't negotiate with Onar about food supplies for the guild. " );
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_dontknow()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_DontKnow_01_01 " );	// I don't know this.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DontKnow_01_02 " );	// Yes?! Hmmm. Very strange!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DontKnow_01_03 " );	// Send a man to me and don't tell him why.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DontKnow_01_04 " );	// You know, I think you're just taking me for an idiot!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DontKnow_01_05 " );	// And I really don't like it!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DontKnow_01_06 " );	// So you better get out of my sight before I tell my guys to kick you out of here.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DontKnow_01_07 " );	// I said everything!
	ONARNOTAGREED = TRUE;
	B_LogEntry( TOPIC_ONARBUSINESS , " I couldn't negotiate with Onar about food supplies for the guild. " );
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_deal()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Deal_01_01 " );	// He just wants to make more money on the needs of the city.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Deal_01_02 " );	// Hmmm. And I'll take a look, this Luthero is still that businessman.
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Deal_01_03 " );	// Does that surprise you?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Deal_01_04 " );	// Not at all! I would have done exactly the same.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Deal_01_05 " );	// Okay, and the last question: tell me why he did not come here himself, but sent you to me?
	Info_ClearChoices(dia_onar_onarbusiness);
	Info_AddChoice(dia_onar_onarbusiness, " How should I know? " ,dia_onar_onarbusiness_dntknw);
	Info_AddChoice(dia_onar_onarbusiness, " He's too much of a figure for this sort of thing. " ,dia_onar_onarbusiness_secret);
	Info_AddChoice(dia_onar_onarbusiness, " None of your business. " ,dia_onar_onarbusiness_noneyou);
};

func void dia_onar_onarbusiness_dntknw()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_DntKnw_01_01 " );	// How should I know?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DntKnw_01_02 " );	// Yes?! Hmmm. Very strange!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DntKnw_01_03 " );	// Send a man to me and don't tell him why.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DntKnw_01_04 " );	// You know, I think you're just taking me for an idiot!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DntKnw_01_05 " );	// And I really don't like it!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DntKnw_01_06 " );	// So you better get out of my sight before I tell my guys to kick you out of here.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_DntKnw_01_07 " );	// I said everything!
	ONARNOTAGREED = TRUE;
	B_LogEntry( TOPIC_ONARBUSINESS , " I couldn't negotiate with Onar about food supplies for the guild. " );
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_secret()
{
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Secret_01_01 " );	// He's way too high profile for this sort of thing.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Secret_01_02 " );	// That is? What do you mean?
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Secret_01_03 " );	// If the city militia or paladins find out he's doing business with you, they'll put him in jail right away.
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Secret_01_04 " );	// Therefore, in order not to give rise to any gossip once again, he sent me.
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Secret_01_05 " );	// Is there something you don't like?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Secret_01_06 " );	// Hmmm. Yes, there are some things I don't like.
	AI_Output(other,self, " DIA_Onar_OnarBusiness_Secret_01_07 " );	// And what exactly?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Secret_01_08 " );	// Well, for starters, I'm usually used to negotiating with the owner himself, and not with his watchdog!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Secret_01_09 " );	// Further, it turns out that he acts at his own peril and risk, and this is all too unreliable!
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Secret_01_10 " );	// I don't tend to give paladins an excuse to visit here again.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Secret_01_11 " );	// So tell Luthero I refuse his offer.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Secret_01_12 " );	// And you and I, as you understand, have nothing more to discuss.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_Secret_01_13 " );	// Get lost!
	ONARNOTAGREED = TRUE;
	B_LogEntry( TOPIC_ONARBUSINESS , " I couldn't negotiate with Onar about food supplies for the guild. " );
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_noneyou()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Onar_OnarBusiness_NoneYou_01_01 " );	// none of your business.
	AI_Output(other,self, " DIA_Onar_OnarBusiness_NoneYou_01_02 " );	// And stop asking me all sorts of leading questions - I'm already tired of them.
	AI_Output(other,self, " DIA_Onar_OnarBusiness_NoneYou_01_03 " );	// Just say: do you agree to this deal or not?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_NoneYou_01_04 " );	// Okay, okay, don't get excited.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_NoneYou_01_05 " );	// You understand yourself, until you talk to a person, you will not understand what kind of dough he is made of.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_NoneYou_01_06 " );	// And I see that you are a guy like nothing. If Luthero has such people, I think it is possible to do business with him.
	AI_Output(other,self, " DIA_Onar_OnarBusiness_NoneYou_01_07 " );	// So what to tell Luthero?
	AI_Output(self,other, " DIA_Onar_OnarBusiness_NoneYou_01_08 " );	// Okay. Tell him that I gave the go-ahead.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_NoneYou_01_09 " );	// I think this will be a profitable business for us with him.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_NoneYou_01_10 " );	// And the extra gold won't hurt me at all now.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_NoneYou_01_11 " );	// However, warn him right away that this food will cost him dearly.
	AI_Output(self,other, " DIA_Onar_OnarBusiness_NoneYou_01_12 " );	// Three times more expensive than I usually sell.
	ONARAGREED = TRUE;
	
	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	B_LogEntry( TOPIC_ONARBUSINESS , " I've made arrangements with Onar to supply food for the guild. " );
	Info_ClearChoices(dia_onar_onarbusiness);
};


instance DIA_ONAR_ORCS (C_Info)
{
	npc = Smell_900_Onar;
	nr = 5;
	condition = dia_onar_orcs_condition;
	information = dia_onar_orcs_info;
	permanent = FALSE;
	description = " And how do you like this whole situation? " ;
};


func int dia_onar_orcs_condition()
{
	if ( KAPITELORCATC  ==  TRUE )
	{
		return TRUE;
	};
};

func void day_onar_orcs_info()
{
	AI_Output(other,self, " DIA_Onar_Orcs_01_00 " );	// And how do you like this whole situation?
	AI_Output(self,other, " DIA_Onar_Orcs_01_01 " );	// What are you talking about?
	AI_Output(other,self, " DIA_Onar_Orcs_01_02 " );	// I'm talking about orcs! Are you not afraid that they may soon visit your farm?
	AI_Output(self,other, " DIA_Onar_Orcs_01_03 " );	// (nervously) Maybe so. But I hope Lee doesn't let that happen.
	AI_Output(self,other, " DIA_Onar_Orcs_01_04 " );	// Or maybe you think I'm paying his people for nothing for my own safety?
	AI_Output(other,self, " DIA_Onar_Orcs_01_05 " );	// But there are far more orcs than mercenaries. I don't think they can stop a whole army of these creatures.
	AI_Output(self,other, " DIA_Onar_Orcs_01_06 " );	// In that case, we're all finished. However, I'm not going to sit and whine about it!
	AI_Output(self,other, " DIA_Onar_Orcs_01_07 " );	// If I am destined to die, then at least it will happen here, on the land of my ancestors.
	AI_Output(self,other, " DIA_Onar_Orcs_01_08 " );	// And trust me, I won't give myself to the orcs with my bare hands!
};


instance DIA_ONAR_PALADINHERE (C_Info)
{
	npc = Smell_900_Onar;
	nr = 5;
	condition = dia_onar_paladinhere_condition;
	information = dia_onar_paladinhere_info;
	permanent = FALSE;
	description = " Lord Hagen's paladins have arrived at the farm. " ;
};


func int dia_onar_paladinhere_condition()
{
	if(MOVEFORCESCOMPLETE_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_paladinhere_info()
{
	AI_Output(other,self, " DIA_Onar_PaladinHere_01_00 " );	// Lord Hagen's paladins have arrived at the farm.
	AI_Output(self,other, " DIA_Onar_PaladinHere_01_01 " );	// Yes, I already know this. And, to tell the truth, for the first time in my life I am glad of this fact!
	AI_Output(self,other, " DIA_Onar_PaladinHere_01_02 " );	// Perhaps with their help we can really fight back against the orcs.
	AI_Output(self,other, " DIA_Onar_PaladinHere_01_03 " );	// However, it would be better if it happened much faster!
	AI_Output(other,self, " DIA_Onar_PaladinHere_01_04 " );	// Why such a hurry?
	AI_Output(self,other, " DIA_Onar_PaladinHere_01_05 " );	// To the fact that otherwise my food supply may soon turn into dust.
	AI_Output(self,other, " DIA_Onar_PaladinHere_01_06 " );	// They eat, I tell you, no less than my mercenaries!
	AI_Output(other,self, " DIA_Onar_PaladinHere_01_07 " );	// I think your barns can easily feed more people.
	AI_Output(other,self, " DIA_Onar_PaladinHere_01_08 " );	// So don't complain. Rather, say thank you that someone else is ready to give their life for you.
	AI_Output(other,self, " DIA_Onar_PaladinHere_01_09 " );	// Are you clear?
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_10");	//Хммм...(прикусив язык)
	AI_Output(other,self, " DIA_Onar_PaladinHere_01_11 " );	// Good! I see that you understand me.
};

instance DIA_ONAR_TOWER_APP_GOOD(C_Info)
{
	npc = Smell_900_Onar;
	nr = 11;
	condition = dia_onar_tower_app_good_condition;
	information = dia_onar_tower_app_good_info;
	permanent = FALSE;
	description = " South of your farm is an old tower. " ;
};

func int dia_onar_tower_app_good_condition()
{
	if((MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == FALSE)) 
	{
		return TRUE;
	};
};

func void dia_onar_tower_app_good_info()
{
	AI_Output(other,self, " DIA_Onar_Tower_App_Good_15_00 " );	// South of your farm is an old tower. Have dark personalities from there bothered you lately?
	AI_Output(self,other, " DIA_Onar_Tower_App_Good_14_01 " );	// What do you care? Well, the peasants complained about them, so what?
	AI_Output(other,self, " DIA_Onar_Tower_App_Good_15_02 " );	// Thanks to me, they won't bother you anymore.
	AI_Output(self,other, " DIA_Onar_Tower_App_Good_14_03 " );	// Ahh, it's you. I have already been informed that someone managed to cut out all these gangsters.
	AI_Output(self,other, " DIA_Onar_Tower_App_Good_14_04 " );	// Here, hold on to your work. Now get out, I've got a lot of work to do.
	B_GiveInvItems(self,other,ItMi_Gold,25);
	AI_Output(other,self, " DIA_Onar_Tower_App_Good_15_05 " );	// Wait, that's not all.
	AI_Output(self,other, " DIA_Onar_Tower_App_Good_14_06 " );	// What else do you want from me?
	AI_Output(other,self, " DIA_Onar_Tower_App_Good_15_07 " );	// I would like to live in this tower.
	AI_Output(self,other, " DIA_Onar_Tower_App_Good_14_08 " );	// Ahh, so it's you. What are you, all my people on the ears raised? First, Lee reported about you, then Maria soared my brains.
	AI_Output(self,other, " DIA_Onar_Tower_App_Good_14_09 " );	// I confess that what they told me interested me.
	AI_Output(self,other, " DIA_Onar_Tower_App_Good_14_10 " );	// But not enough to just give you the tower.
	AI_Output(self,other, " DIA_Onar_Tower_App_Good_14_11 " );	// You can live in it if you're willing to pay the rent. One hundred gold per day. I agree?
	Info_ClearChoices(dia_onar_tower_app_good);
	Info_AddChoice(dia_onar_tower_app_good, " One hundred coins is too much price. " ,dia_onar_tower_app_good_maybe);
	Info_AddChoice(dia_onar_tower_app_good, " Good! Deal. " ,dia_onar_tower_app_good_yes);
	Info_AddChoice(dia_onar_tower_app_good, " Too expensive. " ,dia_onar_tower_app_good_no);
};

func void dia_onar_tower_app_good_maybe()
{
	if((RhetorikSkillValue[1] >= 50) || ((MARIA_APPROVES_TOWER == TRUE) && (LEE_APPROVES_TOWER == TRUE)))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self, " DIA_Onar_Tower_App_Good_maybe_15_00 " );	// One hundred coins is too high a price.
		AI_Output(other,self, " DIA_Onar_Tower_App_Good_maybe_15_01 " );	// Your tower stands for years without bringing you a coin. A couple more years - and she will collapse from old age.
		AI_Output(other,self, " DIA_Onar_Tower_App_Good_maybe_15_02 " );	// Only scum like bandits are ready to settle in it, from which your farm is nothing but problems.
		AI_Output(other,self, " DIA_Onar_Tower_App_Good_maybe_15_03 " );	// I propose to rid you of them. Putting the tower in order will require huge expenses, which I propose to undertake.
		AI_Output(other,self, " DIA_Onar_Tower_App_Good_maybe_15_04 " );	// You don't need to lift a finger to improve the situation in that area, you still want to charge me for this.
		AI_Output(other,self, " DIA_Onar_Tower_App_Good_maybe_15_05 " );	// So no, I won't pay you a dime.
		AI_Output(other,self, " DIA_Onar_Tower_App_Good_maybe_15_06 " );	// If you want more trouble with bandits, if you want to keep losing money, keep the tower! You can choke on it.
		AI_Output(self,other, " DIA_Onar_Tower_App_Good_maybe_14_07 " );	// What?! What?! How dare you?! Yes I you...
		AI_Output(self,other, " DIA_Onar_Tower_App_Good_maybe_14_08 " );	// Umm... hmmm... Ahh, okay! Get the damn tower! Still some problems because of her.
		AI_Output(self,other, " DIA_Onar_Tower_App_Good_maybe_14_09 " );	// Well, since Lee and my wife vouch for you, then I will trust you too. But that I never hear of any bandits in that area again!
		AI_Output(other,self, " DIA_Onar_Tower_App_Good_maybe_15_10 " );	// I promise you you won't regret your decision.
		AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_00 " );	// Good. So, we settled the issue with money.
		AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_01 " );	// Do you need anything else from me? If necessary, speak now and do not bother me again.
		AI_Output(other,self, " DIA_Onar_We_Made_Deal_15_02 " );	// Must. To live properly in that tower, I'll have to find security for her.
		AI_Output(other,self, " DIA_Onar_We_Made_Deal_15_03 " );	// I'll probably hire a few people to do this. I may also need someone else.
		AI_Output(other,self, " DIA_Onar_We_Made_Deal_15_04 " );	// In a word, I don't want your mercenaries to somehow interfere with the people who come to me.
		AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_05 " );	// Good. You can invite anyone there, as long as they do not pull the tower apart brick by brick or in any way interfere with the work on my farm.
		AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_06 " );	// Any more requests?
		AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_07");	//Пока нет.
		AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_08 " );	// Goodbye then. I hope you won't give me any problems and I won't regret my decision.
		B_LogEntry( TOPIC_MYNEWMANSION , " Onar's problem is fixed, it remains to tell Hagen. " );
		DECISION_TOWER_MADE = TRUE;
		DT_TOTAL_DAILY_PAYMENTS_ONAR = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Onar_Tower_App_Good_maybe_15_12 " );	// One hundred coins is too high a price. Maybe we can negotiate a discount?
		AI_Output(self,other, " DIA_Onar_Tower_App_Good_maybe_14_13 " );	// WHAT? Are you still trading? Get out of here and I don't want to see your spirit here again.
	};
};

func void dia_onar_tower_app_good_yes()
{
	AI_Output(other,self, " DIA_Onar_Tower_App_Good_yes_15_00 " );	// Good! Deal.
	AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_00 " );	// That's nice. So, we settled the issue with money.
	AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_01 " );	// Do you need anything else from me? If necessary, speak now and do not bother me again.
	AI_Output(other,self, " DIA_Onar_We_Made_Deal_15_02 " );	// Must. To live properly in that tower, I'll have to find security for her.
	AI_Output(other,self, " DIA_Onar_We_Made_Deal_15_03 " );	// I'll probably hire a few people to do this. I may also need someone else.
	AI_Output(other,self, " DIA_Onar_We_Made_Deal_15_04 " );	// In a word, I don't want your mercenaries to somehow interfere with the people who come to me.
	AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_05 " );	// Good. You can invite anyone there, as long as they do not pull the tower apart brick by brick or in any way interfere with the work on my farm.
	AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_06 " );	// Any more requests?
	AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_07");	//Пока нет.
	AI_Output(self,other, " DIA_Onar_We_Made_Deal_14_08 " );	// Goodbye then. I hope you won't give me any problems and I won't regret my decision.
	B_LogEntry( TOPIC_MYNEWMANSION , " Looks like I managed to convince Onar, though not for free. I should report this to Hagen. " );
	DECISION_TOWER_MADE = TRUE;
	DT_TOTAL_DAILY_PAYMENTS_ONAR = 100;
	AI_StopProcessInfos(self);
};

func void dia_onar_tower_app_good_no()
{
	AI_Output(other,self, " DIA_Onar_Tower_App_Good_no_15_00 " );	// No, your price is too high. I refuse.
	AI_Output(self,other, " DIA_Onar_Tower_App_Good_no_14_01 " );	// Since you can't afford such penny expenses, there's nothing to take up my time either. Get out.
	B_LogEntry( TOPIC_MYNEWMANSION , " I failed to persuade Onar. Without his consent, attempts to settle in the tower turn into big problems. " );
	MIS_MYNEWMANSION = LOG_FAILED;
	MIS_DTOLDNEWMINE = LOG_FAILED;
	AI_StopProcessInfos(self);
};
