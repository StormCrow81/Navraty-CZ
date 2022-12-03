

instance DIA_NONE_105_CORRISTO_EXIT (C_Info)
{
	npc = none_105_corrected;
	nr = 999;
	condition = dia_none_105_corristo_exit_condition;
	information = dia_none_105_corristo_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_none_105_corristo_exit_condition()
{
	return TRUE;
};

func void dia_none_105_corristo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_105_CORRISTO_HALLO (C_Info)
{
	npc = none_105_corrected;
	nr = 1;
	condition = dia_none_105_corristo_hallo_condition;
	information = dia_none_105_corristo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_none_105_corristo_hello_condition()
{
	if((TALKTOCORRISTO == FALSE) && (FIREMAGECOMES == TRUE) && (RESCUEGOMEZSTEPTHREE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_none_105_corristo_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	TALKTOCORRISTO = TRUE;
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_01_00 " );	// (dead voice) Who called us?.. Who disturbed our sacred rest?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_01_02");	//Кто ты?
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_01_03 " );	// Don't you remember me?
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_01_04 " );	// (thoughtfully) Yes, your face seems familiar to me. But it's been so long...
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_01_05 " );	// Won't you remind me who you used to be?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo, " I was a guard at the Old Camp. " ,dia_none_105_corristo_hallo_gomezwatch);
	Info_AddChoice(dia_none_105_corristo_hallo, " I was a mercenary in the New Camp. " ,dia_none_105_corristo_hallo_naemniklee);
	Info_AddChoice(dia_none_105_corristo_hallo, " I was a Guardian in the Brotherhood. " ,dia_none_105_corristo_hallo_sleeper);
	Info_AddChoice(dia_none_105_corristo_hallo, " I was a waterbender. " ,dia_none_105_corristo_hallo_watermage);
	Info_AddChoice(dia_none_105_corristo_hallo, " I was a firebender, master. " ,dia_none_105_corristo_hallo_firemage);
};

func void dia_none_105_corristo_hallo_gomezwatch()
{
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_GomezWatch_01_00 " );	// I was a guard at the Old Camp.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_GomezWatch_01_01 " );	// Exactly! You were Torus's man and you were part of Gomez's guard.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_GomezWatch_01_02 " );	// Now I remember you... (dead voice)
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_GomezWatch_01_03 " );	// Now tell us what's the matter that made you come to us? Why are you looking to meet us?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo, " I need your help. " ,dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_naemniklee()
{
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_00 " );	// I was a mercenary at the New Camp.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_01 " );	// Oh yeah. You were one of General Lee's men...
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_02 " );	// Now I remember you, mercenary... (dead voice)

	if(other.guild == GIL_SLD)
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(250);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
		MEMORYBONUS = TRUE;
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_03 " );	// And as I see it, you're still under him.
		AI_Output(other, self, " DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_04 " );	// You're right
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_05 " );	// (thoughtfully) Well, such devotion to one's ideals is worthy of respect!
	};

	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_06 " );	// Now tell us what's the matter that made you come to us? Why are you looking to meet us?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo, " I need your help. " ,dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_sleeper()
{
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Sleeper_01_00 " );	// I was a guard in the Brotherhood.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Sleeper_01_01 " );	// Oh yeah - you were one of those who worshiped this Sleeper... (dead voice)
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Sleeper_01_02 " );	// Now I remember you, swamp.
	if((other.guild == GIL_TPL) && (other.guild == GIL_SEK) && (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Sleeper_01_03 " );	// And I also see that you've stayed true to this path.
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Sleeper_01_04 " );	// (thoughtfully) Well, such devotion to one's ideals is worthy of respect!
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Sleeper_01_05 " );	// Even though your god turned out to be just an evil demon...
		B_GivePlayerXP(250);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
	};
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Sleeper_01_08 " );	// Now tell us what's the matter that made you come to us? Why are you looking to meet us?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo, " I need your help. " ,dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_watermage()
{
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_WaterMage_01_00 " );	// I was a waterbender.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_WaterMage_01_01 " );	// Oh yeah. Now I remember you... (dead voice)
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_WaterMage_01_02 " );	// It seems that Saturas initiated and set you on the path of service to Adanos...
	if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_WaterMage_01_04 " );	// And as I see it, you still haven't broken that vow.
		B_GivePlayerXP(250);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
	};
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_WaterMage_01_07 " );	// Now tell us what's the matter that made you come to us? Why are you looking to meet us?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo, " I need your help. " ,dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_firemage()
{
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_FireMage_01_00 " );	// I was a firebender, master. And you were my mentor.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_FireMage_01_01 " );	// Oh yeah! You were my student - and how could I forget that... (dead voice)
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_FireMage_01_02 " );	// Now I remember you, my son.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_FireMage_01_03 " );	// And, as I see it, you still haven't broken your vow to Fire and Innos!
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_FireMage_01_04 " );	// Such devotion to Innos is worthy of respect!
		B_GivePlayerXP(500);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
	}
	else
	{
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_FireMage_01_08 " );	// But, as I see it, you have broken your vow to Innos and Fire.
		AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_FireMage_01_09 " );	// And this makes me very sad...
	};
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_FireMage_01_10 " );	// Now tell us what's the matter that made you come to us? Why are you looking to meet us?
	Info_ClearChoices(dia_none_105_corristo_hallo);
Info_AddChoice(dia_none_105_corristo_hallo, " I need your help. " ,dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_rescue()
{
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Rescue_01_00 " );	// I need help.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_01 " );	// And what do you want from us?
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Rescue_01_02 " );	// I want you to grant your forgiveness to the soul of one person.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_03 " );	// You don't have to continue...
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_04");	//Почему?
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_05 " );	// Because I can guess what you want to ask all of us.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_07 " );	// (dead breath) Only one person can ask us for forgiveness for their deeds.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_08 " );	// The one whose fault we are now here as ghosts, not living people...
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_09 " );	// ...one who, for the sake of gold and power, dared to raise a sword against the sacred servants of Innos...
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_10 " );	// ...and the one who has no forgiveness, and whose soul was cursed by the gods for his atrocities... (dead voice)
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_14 " );	// DO YOU WANT WE TO GIVE FORGIVENESS TO THE ONE WHO IS OUR EXECUTIONER?!
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Rescue_01_15 " );	// I realize that my request sounds rather strange.
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Rescue_01_16 " );	// But I feel like anyone, no matter who they are or what they've done, deserves at least one chance to redeem themselves.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_18 " );	// You're too stupid to judge, man! Only Innos has the right to decide who deserves what.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_19 " );	// However, there is some truth in your words - indeed, everyone is given the opportunity to atone for their guilt.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_21 " );	// (thoughtfully) Honestly, I'm at a loss as to how Gomez can earn our forgiveness.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_22 " );	// And besides, his cursed soul can't do much right now...
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Rescue_01_23 " );	// Well, then maybe I can do something for you, after which you will grant him freedom.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_26 " );	// (dead voice) All right. Then listen to me carefully...
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_27 " );	// In the west of the valley, not far from the old tower of Xardas, there is an old abandoned crypt.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_28 " );	// The entrance to it is securely hidden by a stone slab, and it is not possible to get there just like that...
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Rescue_01_29 " );	// And what is in this crypt?
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_33 " );	// What is in this crypt can only have one name - Evil...
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_34 " );	// We don't know exactly what's in this crypt. But there is no doubt that it really exists there!
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_35 " );	// Therefore, after considering your request, I came to the conclusion that if one evil should be forgiven by us...
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_36 " );	// ...that other existing evil must be destroyed by us!
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_37 " );	// As you understand, we cannot do this ourselves. So we need some help.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_38 " );	// I hope I don't need to explain that these are my conditions under which I will forgive Gomez?
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Rescue_01_39 " );	// Are you saying that I will have to go to this crypt and destroy the evil that lives there?
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_40 " );	// You are quick-witted... (dead voice)
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Rescue_01_41 " );	// If you can complete this task, Gomez will be forgiven. Do you agree?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo, " Wait. I need to think. " ,dia_none_105_corristo_hallo_no);
	Info_AddChoice(dia_none_105_corristo_hallo, " Ok, I agree. " ,dia_none_105_corristo_hallo_yes);
};

func void dia_none_105_corristo_hallo_no()
{
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_No_01_00 " );	// I need to think.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_No_01_01");	//Нет...(мертвым голосом)
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_No_01_05 " );	// You have already made your choice by contacting us for help.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_No_01_06 " );	// Now it's time to pay for it... (dead voice)
};

func void dia_none_105_corristo_hallo_yes()
{
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Yes_01_00 " );	// Okay, I agree.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Yes_01_01 " );	// Then immediately go there and destroy all the evil that you meet on your way.
	AI_Output(other,self, " DIA_NONE_105_Corristo_HALLO_Yes_01_02 " );	// But wait. You said that the entrance to this crypt is closed. How will I get there?
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Yes_01_03 " );	// Don't worry about this. The stone slab that blocks the way there will no longer be a barrier for you.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Yes_01_04 " );	// Once you get to where you want to be, you'll figure it out for yourself.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Yes_01_06 " );	// Go! We will be waiting for you here.
	AI_Output(self,other, " DIA_NONE_105_Corristo_HALLO_Yes_01_07 " );	// May Innos protect you!
	CORRISTOSENDKILLDEMON = TRUE;
	B_LogEntry( TOPIC_RESCUEGOMEZ , " Master Corristo and the other Firebenders have agreed to pardon Gomez on the condition that I complete their request. I will need to head west towards the old tower of Xardas and find an abandoned crypt there, not far from it. According to Corristo , there is some evil in this crypt that I must destroy. " );
	AI_StopProcessInfos(self);
};


instance DIA_NONE_105_CORRISTO_DEMONDONE (C_Info)
{
	npc = none_105_corrected;
	nr = 1;
	condition = dia_none_105_corristo_demondone_condition;
	information = dia_none_105_corristo_demondone_info;
	permanent = FALSE;
	description = " Sklep chist! " ;
};


func int dia_none_105_corristo_demondone_condition()
{
	if((TALKTOCORRISTO == TRUE) && (CORRISTOSENDKILLDEMONDONE == TRUE) && (MIS_RESCUEGOMEZ == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_none_105_corristo_demondone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_NONE_105_Corristo_DemonDone_01_00 " );	// Склеп чист!
	AI_Output(self,other, " DIA_NONE_105_Corristo_DemonDone_01_01 " );	// I already know about it... (dead voice)
	AI_Output(self,other, " DIA_NONE_105_Corristo_DemonDone_01_06 " );	// Gomez will receive our forgiveness.
	AI_Output(self,other, " DIA_NONE_105_Corristo_DemonDone_01_07 " );	// And now his soul can finally find the long-awaited peace...
	B_LogEntry( TOPIC_RESCUEGOMEZ , " Now that I've been to the crypt and destroyed the evil that was there, the Firebenders have agreed to pardon Gomez's soul. " );
	Info_ClearChoices(dia_none_105_corristo_demondone);
	Info_AddChoice(dia_none_105_corristo_demondone, " ...? " ,dia_none_105_corristo_demondone_free);
};

func void dia_none_105_corristo_demondone_free()
{
	RESCUEGOMEZSTEPTHREEDONE = TRUE;
	if((RESCUEGOMEZSTEPONEDONE == TRUE) && (RESCUEGOMEZSTEPTWODONE == TRUE) && (RESCUEGOMEZSTEPTHREEDONE == TRUE) && (MIS_RESCUEGOMEZ == LOG_Running))
	{
		GOMEZISFREE = TRUE;
		B_LogEntry( TOPIC_RESCUEGOMEZ , " Now I have to go back to Gomez and let him know that his soul is free. " );
	};
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	Npc_ExchangeRoutine(none_105_corristo,"TOT");
	Npc_ExchangeRoutine(none_106_rodriguez,"TOT");
	Npc_ExchangeRoutine(none_107_damarok,"TOT");
	Npc_ExchangeRoutine(none_108_drago,"TOT");
	Npc_ExchangeRoutine(none_109_torrez,"TOT");
	AI_Output(self,other, " DIA_NONE_105_Corristo_DemonDone_Free_01_00 " );	// Gomez has received our forgiveness... Now he's free.
	AI_Output(self,other, " DIA_NONE_105_Corristo_DemonDone_Free_01_01 " );	// Go to him and tell him about it.
	AI_Output(self,other, " DIA_NONE_105_Corristo_DemonDone_Free_01_02 " );	// And it's time for us... The world of the living is hard for us.
	AI_Output(self,other, " DIA_NONE_105_Corristo_DemonDone_Free_01_03 " );	// Farewell, mortal. May Innos protect you!
	AI_StopProcessInfos(self);
};

