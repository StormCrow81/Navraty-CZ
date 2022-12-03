

instance DIA_STRF_8119_Addon_Rollan_EXIT(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 999;
	condition = DIA_STRF_8119_Addon_Rollan_exit_condition;
	information = DIA_STRF_8119_Addon_Rollan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8119_Addon_Rollan_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8119_Addon_Rollan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8119_Addon_Rollan_HELLO(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_hello_condition;
	information = DIA_STRF_8119_Addon_Rollan_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8119_Addon_Rollan_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_hello_info()
{
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_00");	//Хммм...(удивленно)
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Hello_01_01");	//Что?!
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Hello_01_02 " );	// It's not often you see a man calmly walking around the mine.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Hello_01_03 " );	// I wonder how the orcs even let you in here. Or are you working for them?!
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_Hello_01_04 " );	// No, I'm here on my own.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Hello_01_05 " );	// Well, then you're definitely a psycho, since, under good will, you ended up in this hole!
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Hello_01_06 " );	// There's nothing here, mate! Nothing but death...
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Hello_01_07 " );	// By the way, what brings you here anyway?
};

instance DIA_STRF_8119_Addon_Rollan_Who(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Who_condition;
	information = DIA_STRF_8119_Addon_Rollan_Who_info;
	permanent = FALSE;
	description = " I'm looking for a paladin here. " ;
};

func int DIA_STRF_8119_Addon_Rollan_Who_condition()
{
	return TRUE;
};

func void DIA_STRF_8119_Addon_Rollan_Who_info()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_Who_01_00 " );	// I'm looking for a paladin here.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Who_01_01 " );	// (surprised) Paladin?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Who_01_02 " );	// If I were you, I'd be more careful with those words here!
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Who_01_03 " );	// If the orcs hear you, they won't stand on ceremony.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Who_01_04 " );	// They're serious guys! A little something wrong, they immediately begin to wave their axes.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Who_01_05 " );	// At best, this will end up with a couple of broken ribs for you.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Who_01_06 " );	// Well, if you make the orcs very angry, they will send you to the lower level of the mine.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Who_01_07 " );	// And this is certain death! No one has ever returned from there alive.
};

instance DIA_STRF_8119_Addon_Rollan_Time(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Time_condition;
	information = DIA_STRF_8119_Addon_Rollan_Time_info;
	permanent = FALSE;
	description = " Have you been working in the mine for a long time? " ;
};

func int DIA_STRF_8119_Addon_Rollan_Time_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8119_Addon_Rollan_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_Time_info()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_Time_01_00 " );	// How long have you been working in the mine?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Time_01_01 " );	// It's hard to say... (scratches back of head) To be honest, I've already lost count myself.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Time_01_02 " );	// Here, time flies in a completely different way than it does on the surface!
};

instance DIA_STRF_8119_Addon_Rollan_LowLevel(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_LowLevel_condition;
	information = DIA_STRF_8119_Addon_Rollan_LowLevel_info;
	permanent = FALSE;
	description = " What is the lower level of the mine? " ;
};

func int DIA_STRF_8119_Addon_Rollan_LowLevel_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8119_Addon_Rollan_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_LowLevel_info()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_LowLevel_01_00 " );	// What else is the lower level of the mine?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_LowLevel_01_01 " );	// (frightened) Don't scream like that! Otherwise, you will definitely call trouble.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_LowLevel_01_02 " );	// As far as I know, the orcs themselves closed the lower level of the mine.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_LowLevel_01_03 " );	// Nobody has been working there for a long time.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_LowLevel_01_04 " );	// But they send all the guilty ones there, lowering them on a lift.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_LowLevel_01_05 " );	// And when the lift goes back up, there's no one there.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_LowLevel_01_06 " );	// Only pools of blood! Brrr...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_LowLevel_01_07 " );	// Listen, let's change the subject, otherwise I already felt somehow uncomfortable.
};

instance DIA_STRF_8119_Addon_Rollan_TellMore(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_TellMore_condition;
	information = DIA_STRF_8119_Addon_Rollan_TellMore_info;
	permanent = FALSE;
	description = " Can you tell me more about the mine? " ;
};

func int DIA_STRF_8119_Addon_Rollan_TellMore_condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_STRF_8119_Rollan_LowLevel ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_TellMore_info()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_TellMore_01_00 " );	// Can you tell me more about the mine?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_TellMore_01_01 " );	// Of course. But first, get me something to eat.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_TellMore_01_02 " );	// And then I almost forgot the taste of normal food.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_TellMore_01_03 " );	// Orcs don't spoil us much here. Here, consider some mushrooms and save yourself!
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_TellMore_01_04 " );	// What do you need?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_TellMore_01_05 " );	// (dreamy) I wouldn't mind... a well-done piece of meat, cheese, and a bottle of wine!
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_TellMore_01_06 " );	// I guess that's enough to get you started. I'll make myself a real feast!
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_TellMore_01_07 " );	// Okay, I'll try to find all this for you.
	MIS_RollanFood = LOG_Running;
	Log_CreateTopic(TOPIC_RollanFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RollanFood,LOG_Running);
	B_LogEntry(TOPIC_RollanFood, " Miner Rollan is hungry. If I bring him a piece of grilled meat, cheese and a bottle of wine, he will tell me more about the mine. " );
};

instance DIA_STRF_8119_Addon_Rollan_RollanFood(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_RollanFood_condition;
	information = DIA_STRF_8119_Addon_Rollan_RollanFood_info;
	permanent = FALSE;
	description = " I brought you some food. " ;
};

func int DIA_STRF_8119_Addon_Rollan_RollanFood_condition()
{
	if((MIS_RollanFood == LOG_Running) && (Npc_HasItems(other,ItFoMutton) >= 1) && (Npc_HasItems(other,ItFo_Cheese) >= 1) && (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_RollanFood_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_RollanFood_01_00 " );	// I brought you food.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_RollanFood_01_01 " );	// Great...(pretty) Is everything as I asked?
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_RollanFood_01_02 " );	// Of course. Here's a piece of meat, cheese and a bottle of wine.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,1);
	Npc_RemoveInvItems(other,ItFo_Cheese,1);
	Npc_RemoveInvItems(other,ItFo_Wine,1);
	CreateInvItems(self,ItFoMutton,1);
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_RollanFood_01_03 " );	// Well, finally I'll sing like a human...
	B_UseItem(self,ItFoMutton);
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_RollanFood_01_04 " );	// Mmmm...(pretty) How delicious! After those damned mushrooms, this meat seems to me just the food of the gods!
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_RollanFood_01_05 " );	// Thank you, buddy.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_06");	//Наслаждайся!
	RT_Respect = RT_Respect + 1;
	MIS_RollanFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_RollanFood,LOG_Success);
	B_LogEntry(TOPIC_RollanFood, " I brought food to Rollan. He enjoyed it like a child! " );
};

instance DIA_STRF_8119_Addon_Rollan_Perm(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Perm_condition;
	information = DIA_STRF_8119_Addon_Rollan_Perm_info;
	permanent = TRUE;
	description = " Well, how are things in the mine? " ;
};

func int DIA_STRF_8119_Addon_Rollan_Perm_condition()
{
	if(MIS_RollanFood == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_Perm_info()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_Perm_01_00 " );	// Well, how are things in the mine?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_Perm_01_01 " );	// As long as nothing changes.
};

var int CountMineAll;
var int RolTellChief;
var int RolTellHowMany;
var int RolTellSlaves;
var int RolTellPal;

instance DIA_STRF_8119_Addon_Rollan_AboutMine(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_AboutMine_condition;
	information = DIA_STRF_8119_Addon_Rollan_AboutMine_info;
	permanent = TRUE;
	description = " Tell me more about the mine. " ;
};

func int DIA_STRF_8119_Addon_Rollan_AboutMine_condition()
{
	if(MIS_RollanFood == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_info()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_01_00 " );	// Tell me more about the mine.

	if(CountMineAll == FALSE)
	{
		AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_01_01 " );	// What do you want to know?
		Info_ClearChoices(DIA_STRF_8119_Addon_Rollan_AboutMine);
		Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,Dialog_Back,DIA_STRF_8119_Addon_Rollan_AboutMine_Back);

		
		if(RolTellChief == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine, " Who's in charge here? " ,DIA_STRF_8119_Addon_Rollan_AboutMine_Chief);
		};
		if(RolTellHowMany == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine, " How Many Does It Make? " ,DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany);
		};
		if(RolTellSlaves == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine, " Where does it matter, what? " ,DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves);
		};
		if (( MIS_TrustMe ==  FALSE ) && ( RoleTellPal ==  FALSE ))
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine, " So what about a paladin? " ,DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin);
		};
		if ( MIS_LowLevel ==  FALSE )
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine, " What's on the bottom of the mine? " ,DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev);
		};
		if(MIS_EscapeMine == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine, " Have you tried to get out of here? " ,DIA_STRF_8119_Addon_Rollan_AboutMine_Escape);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_01_02 " );	// Everything I knew, I already told you.
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Back()
{
	Info_ClearChoices(DIA_STRF_8119_Addon_Rollan_AboutMine);
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Chief()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_01 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_02 " );	// This beast named Ar Dagar! He is the leader among the orcs.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_03 " );	// But it's better not to catch his eye. He doesn't really like people!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_04");	//Понимаю.
	RolTellChief = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_01 " );	// Are there many orcs here?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_02 " );	// Eh, buddy... (shaking his head) There's plenty of good stuff here!
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_03 " );	// Of course, I did not count myself, but I believe that at least a dozen or two.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_04 " );	// If not more...
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_05");	//Ясно.
	RolTellHowMany = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_01 " );	// Are there many of you slaves here?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_02 " );	// Rumor has it that there used to be a lot. Until the orcs went completely berserk.
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_03 " );	// What happened?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_04 " );	// It's all Ar Dagar! He brought such monstrous orders here that many simply could not stand it.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_05 " );	// I guess there are no more than fifty of us left here now. And look even less.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_06");	//Все ясно.
	RolTellSlaves = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_01 " );	// So what about the paladin?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_02 " );	// I'll tell you so... (thoughtfully) Even if he's here, no one will tell you about it anyway.
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_03 " );	// Why is this?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_04 " );	// It's simple. First of all, you're new here, no one knows you.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_05 " );	// Secondly, it looks like you're doing some business with the orcs, since they let you in here.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_06 " );	// And this, you understand, leads to certain thoughts.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_07 " );	// So until most of us start to trust you, asking questions like this here will be a dead number.
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_08 " );	// And how can I earn your trust?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_09 " );	// How, how... Go ask the guys. Maybe some of them need help.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_10 " );	// Prove that you are your own person and that you can be relied upon!
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_11 " );	// Then, look, and find out what you need. Are you savvy?
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_12 " );	// Yes, I understand you.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_13 " );	// Well, that's nice! Let's end this conversation then.
	RolTellPal = TRUE;
	B_LogEntry(TOPIC_LostPaladins, " Until I earn the trust of the slaves, asking about the paladin will be completely useless. " );

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_01 " );	// What's on the lower level of the mine?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_02 " );	// I don't really go out of my way, so there's not much I can say about him.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_03 " );	// Better talk to Hildur about it. He definitely knows more about it!
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_04 " );	// And who is Hildur?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_05 " );	// This is our ore smelter. You'll find him downstairs, not far from the warehouse.
	MIS_LowLevel = LOG_Running;
	Log_CreateTopic(TOPIC_LowLevel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LowLevel,LOG_Running);
	B_LogEntry(TOPIC_LowLevel, " Rolland mentioned the lower level of the mines, where miners who are guilty of the orcs are sent. According to him, this is a very scary place. Hildur, the ore smelter, can tell you more about it. " );

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Escape()
{
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_01 " );	// Have you tried to get out of here?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_02 " );	// Are you kidding, buddy?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_03 " );	// We won't even make it to the exit of the mine before we're all slaughtered by the orcs.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_04 " );	// Especially the ones with crossbows. Have you seen what a bolt fired from an orc crossbow does to a person?!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_05");	//Ну...
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_06 " );	// It's better for you not to know... (frightened) Vidocq, I'll tell you straight, not pleasant!
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_07 " );	// On top of that, we don't have the right weapons. Not with bare fists to climb on their axes.
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_08 " );	// Has anyone tried an escape before?
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_09 " );	// Hmmm... (thoughtfully) I remember someone already tried to arrange something like this.
	AI_Output(self,other, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_10 " );	// But Ferd will tell you about it better. He was then a witness to all this.
	AI_Output(other,self, " DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_11 " );	// Okay, I'll talk to him.
	MIS_EscapeMine = LOG_Running;
	Log_CreateTopic(TOPIC_EscapeMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EscapeMine,LOG_Running);
	B_LogEntry(TOPIC_EscapeMine, " The slaves don't seem to be thinking of escaping. They don't have the weapons or the inclination to fight the elite orcs. Miner Ferd knows more about it, according to Rolland. " );

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};
