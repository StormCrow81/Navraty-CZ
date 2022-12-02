
var int LokiAnsewrOne;
var int LokiAnsewrTwo;
var int LokiAnsewrThree;

instance DIA_SEK_8049_LOKI_EXIT(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 999;
	condition = dia_SEK_8049_LOKI_exit_condition;
	information = dia_SEK_8049_LOKI_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_SEK_8049_LOKI_exit_condition()
{
	return TRUE;
};

func void dia_SEK_8049_LOKI_exit_info()
{
	AI_StopProcessInfos(self);
};

instances DIA_SEK_8049_LOKI_GREET (C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_greet_condition;
	information = dia_SEK_8049_LOKI_greet_info;
	permanent = FALSE;
	description = " I'd like to talk to you, acolyte. " ;
};

func int dia_SEK_8049_LOKI_greet_condition()
{
	return TRUE;
};

func void dia_SEK_8049_LOKI_greet_info()
{
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Greet_01_00 " );	// I'd like to talk to you, acolyte.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Greet_01_01 " );	// About what exactly?
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Greet_01_02 " );	// I'm interested in the details of the recent attack.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Greet_01_03 " );	// Ah, that's... (nervously) I'm trying to forget about it as soon as possible. But apparently I won't be able to do it.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Greet_01_04 " );	// I understand that you have experienced not the most pleasant moments in your life.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Greet_01_05 " );	// But you must realize that your miraculous salvation does not yet guarantee a peaceful life.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Greet_01_06 " );	// And all the other members of the Brotherhood are still in great danger!
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Greet_01_07 " );	// Therefore, you must help me.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Greet_01_08 " );	// Hmmm...(doomed) Okay, I guess you're right. Ask what you want.
};


instances DIA_SEK_8049_LOKI_Survive (C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Survive_condition;
	information = dia_SEK_8049_LOKI_Survive_info;
	permanent = FALSE;
	description = " How did you manage to survive? " ;
};

func int dia_SEK_8049_LOKI_Survive_condition()
{
	if(Npc_KnowsInfo(hero,DIA_SEK_8049_LOKI_Greet))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Survive_info()
{
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Survive_01_00 " );	// How did you manage to survive?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Survive_01_01 " );	// I guess I'm just lucky... (bewildered) You can't say otherwise!
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Survive_01_02 " );	// I found a huge clearing with marsh grass and was so carried away by its collection that I did not notice how I moved away from our camp.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Survive_01_03 " );	// Hearing the sounds of battle, I hid in the nearby thicket and sat there until the attackers left.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Survive_01_04 " );	// That, in fact, is all.
	LokiAnsewrOne = TRUE;
};


instance DIA_SEK_8049_LOKI_Attackers(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Attackers_condition;
	information = dia_SEK_8049_LOKI_Attackers_info;
	permanent = FALSE;
	description = " What did the attackers look like? " ;
};

func int dia_SEK_8049_LOKI_Attackers_condition()
{
	if(Npc_KnowsInfo(hero,DIA_SEK_8049_LOKI_Greet))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Attackers_info()
{
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Attackers_01_00 " );	// What did the attackers look like?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Attackers_01_01 " );	// I don't know... (bewildered) Besides, all their faces were hidden by masks.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Attackers_01_02 " );	// The only thing I remember is the strange kind of drawings that covered their bodies.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Attackers_01_03 " );	// They're a bit similar to what we do here at the Brotherhood camp.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Attackers_01_04 " );	// Did they talk about anything?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Attackers_01_05 " );	// No. In all the time I saw them, they didn't say a word.
	LokiAnsewrTwo = TRUE;
};

instance DIA_SEK_8049_LOKI_Other(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Other_condition;
	information = dia_SEK_8049_LOKI_Other_info;
	permanent = FALSE;
	description = " What happened to the others? " ;
};

func int dia_SEK_8049_LOKI_Other_condition()
{
	if(Npc_KnowsInfo(hero,DIA_SEK_8049_LOKI_Greet))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Other_info()
{
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Other_01_00 " );	// What happened to the others?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Other_01_01 " );	// They took all the acolytes with them. And those who resisted were simply killed on the spot.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Other_01_02 " );	// I don't know anything else.
	LokiAnsewrThree = TRUE;
};

instances DIA_SEK_8049_LOKI_Sign (C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Sign_condition;
	information = dia_SEK_8049_LOKI_Sign_info;
	permanent = FALSE;
	description = " About that amulet that the Namib Idol showed you. " ;
};

func int dia_SEK_8049_LOKI_Sign_condition()
{
	if((LokiAnsewrOne == TRUE) && (LokiAnsewrTwo == TRUE) && (LokiAnsewrThree == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Sign_info()
{
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Sign_01_00 " );	// About that amulet that the Namib Idol showed you.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Sign_01_01 " );	// Do you know anything about him?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Sign_01_02 " );	// No, I don't know anything about him.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Sign_01_03 " );	// True... it seemed to me that I had already seen the symbol depicted on it in the center somewhere.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Sign_01_04 " );	// I just can't remember where.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Sign_01_05 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Sign_01_06 " );	// Yes, otherwise I wouldn't attach much importance to this drawing.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Sign_01_07 " );	// But why didn't you tell the Namib Idol himself about this?!
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Sign_01_08 " );	// You see... I was too scared then and I was afraid to make a mistake in my guesses.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Sign_01_09 " );	// Well, then we need to help you remember everything. This can be very important!
	AI_Output(self,other, " DIA_SEK_8049_LOKI_Sign_01_10 " );	// Here's how to do it?...(bewildered) I'm afraid that for now I can't help you with anything else.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_Sign_01_11 " );	// I'll think of something.
	B_LogEntry(TOPIC_PrioratStart, " I was able to find out that Loki has already seen the symbol that the Namib Idol showed him on the amulet. However, Loki cannot remember where and when it was. He needs help to refresh his memory. Perhaps one of the Guru knows a way, how to do it. " );
	LokiNeedMemory = TRUE;
};



instance DIA_SEK_8049_LOKI_SPECIALPOTION(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_SPECIALPOTION_condition;
	information = dia_SEK_8049_LOKI_SPECIALPOTION_info;
	permanent = FALSE;
	description = " Here, drink this drink. " ;
};


func int dia_SEK_8049_LOKI_SPECIALPOTION_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (LokiMemoriesAlive == FALSE) && (Npc_HasItems(other,ItPo_Memories) >= 1))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_SPECIALPOTION_info()
{
	AI_Output(other,self, " DIA_SEK_8049_LOKI_SPECIALPOTION_01_00 " );	// Here, drink this drink.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_SPECIALPOTION_01_01 " );	// What is this?
	AI_Output(other, self, " DIA_SEK_8049_LOKI_SPECIALPOTION_01_02 " );	// Don't worry. It will help you refresh your memory a little.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_SPECIALPOTION_01_03 " );	// Well, well... (fearfully) Give it here.
	AI_StopProcessInfos(self);
	B_GiveInvItems(other,self,ItPo_Memories,1);

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_UseItem(self,ItPo_Memories);
	LokiMemoriesAlive = TRUE;
	Npc_SetRefuseTalk(self,5);
	hero.aivar[ AIV_INVINCIBLE ] = FALSE ;
};


instance DIA_SEK_8049_LOKI_SPECIALPOTION_OK(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = DIA_SEK_8049_LOKI_SPECIALPOTION_OK_condition;
	information = DIA_SEK_8049_LOKI_SPECIALPOTION_OK_info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_SEK_8049_LOKI_SPECIALPOTION_OK_condition()
{
	if(LokiMemoriesAlive == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SEK_8049_LOKI_SPECIALPOTION_OK_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_00 " );	// Oh...(recovering) What the hell was that?!
	AI_Output(other,self, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_01 " );	// So how do you feel?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_02 " );	// I can't say that they are too pleasant... (staggering) This drink of yours is a good brain hit!
	AI_Output(self,other, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_03 " );	// Looks like I was unconscious for several minutes.
	AI_Output(other, self, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_04 " );	// So it was. But let's get straight to the point.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_05 " );	// Now do you remember where you saw that sign on the amulet?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_06 " );	// Yes, I remember everything. And even more than it should.
	AI_Output(other, self, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_07 " );	// And can you take me there?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_08 " );	// I think so. Oddly enough, but this place is located very close to our camp.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_09 " );	// Then let's not waste time - lead me.
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_Output(self,other, " DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_10 " );	// Good! Follow me.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	LokiGuide = TRUE;
	Loki_GuideDay = Wld_GetDay();
};


instances DIA_SEK_8049_LOKI_GUIDE (C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = DIA_SEK_8049_LOKI_GUIDE_Condition;
	information = DIA_SEK_8049_LOKI_GUIDE_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SEK_8049_LOKI_GUIDE_Condition()
{
	if((LokiGuide == TRUE) && (Npc_GetDistToWP(self,"NW_TO_NEWCAMPPSI_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_SEK_8049_LOKI_GUIDE_Info()
{
	B_GivePlayerXP(500);

	if ( Loki_GuideDay > ( Wld_GetDay () -  2 ))
	{
		AI_Output(self,other, " DIA_SEK_8049_LOKI_GUIDE_01_00 " );	// Here we are.
	}
	else
	{
		AI_Output(self,other, " DIA_SEK_8049_LOKI_GUIDE_01_01 " );	// There you are! And I already began to think that you were bitten by wolves.
	};

	AI_Output(other,self, " DIA_SEK_8049_LOKI_GUIDE_01_02 " );	// And what do we have here?
	AI_Output(self,other, " DIA_SEK_8049_LOKI_GUIDE_01_03 " );	// ...(looking around) Behind me is a strange kind of stone, on which I saw the symbol you are interested in.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_GUIDE_01_04 " );	// Okay, I'll take a look.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_GUIDE_01_05 " );	// Come on... (nervously) I'd better get back to camp. I feel a little uncomfortable with this place.
	AI_Output(self,other, " DIA_SEK_8049_LOKI_GUIDE_01_06 " );	// See you later, mate.
	AI_Output(other,self, " DIA_SEK_8049_LOKI_GUIDE_01_07 " );	// Of course.
	Assasins_Door_Found = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PsiCamp");
};
