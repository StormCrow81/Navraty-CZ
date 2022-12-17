

var int luzian_enter;

instance XOR_8001_WARRIORNATURE_EXIT(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 999;
	condition = xor_8001_warriornature_exit_condition;
	information = xor_8001_warriornature_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int xor_8001_warriornature_exit_condition()
{
	return TRUE;
};

func void xor_8001_warriornature_exit_info()
{
	AI_StopProcessInfos(self);
};


instance XOR_8001_WARRIORNATURE_FOUND(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 1;
	condition = xor_8001_warriornature_found_condition;
	information = xor_8001_warriornature_found_info;
	important = TRUE;
	permanent = FALSE;
};


func int xor_8001_warriornature_found_condition()
{
	if (( GUARDIAN_RING  ==  TRUE ) &&  ! Npc_IsDead(luzian_demon))
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_found_info()
{
	LUZIAN_BETRETEN = FALSE ;
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_01 " );	// So that's who the Guardians sent to help me... You don't seem like much of a warrior.
	AI_Output(other,self, " XOR_8001_WarriorNature_Found_02 " );	// Guardians... How did you know?
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_03 " );	// Do you have any idea what kind of ring you have on your hand? Who gave it to you?
	AI_Output(other,self, " XOR_8001_WarriorNature_Found_04 " );	// Dagoth gave it to me.
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_05 " );	// This ring is their symbol of power. That is why I spoke to you.
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_06 " );	// Judging by your confusion, you have just entered the path. What brought you here?
	AI_Output(other,self, " XOR_8001_WarriorNature_Found_07 " );	// I'm looking for an ancient demon - Lucian. Can you help me in my search?
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_08 " );	// (laughs) I didn't think so.
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_09 " );	// Especially considering that you have already found him. He is in the cave behind me.
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_10 " );	// Don't go in there alone though - the demon will tear you apart!
	AI_Output(other,self, " XOR_8001_WarriorNature_Found_11 " );	// How do you know he's there?
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_12 " );	// He's there, trust me. I have hunted him for over a thousand years.
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_13 " );	// And finally, I managed to drive the beast into a trap. But Lucian is strong, and it will be difficult for me alone to cope with him.
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_14 " );	// That's why I asked the Guardians to send someone to help me - and they sent you.
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_15 " );	// Yes, boy, it looks like you have no choice but to go into the cave with me.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_16");	//Are you ready?
	Info_ClearChoices(xor_8001_warriornature_found);
	B_LogEntry( TOPIC_GUARDIANSTEST , " I met a warrior in the valley near the tower of Xardas. And it looks like we have similar goals. We both need to take a walk into the cave where the demon Lucian is. " );
	Info_AddChoice(xor_8001_warriornature_found, " Wait! I need some time to gather myself. " ,xor_8001_warriornature_found_no);
	Info_AddChoice(xor_8001_warriornature_found, " Let's go to the cave - a demon dies this day! " ,xor_8001_warriornature_found_yes);
};

func void xor_8001_warriornature_found_no()
{
	AI_Output(other,self, " XOR_8001_WarriorNature_Found_17 " );	// Wait, I need some time to gather myself and check my gear.
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_18 " );	// A little scared? That's good. You should be.
	LUZIAN_BETRETEN = TRUE ;
	Info_ClearChoices(xor_8001_warriornature_found);
};

func void xor_8001_warriornature_found_yes()
{
	AI_Output(other,self, " XOR_8001_WarriorNature_Found_19 " );	// Okay, let's go.
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_20 " );	// May the Guardians protect us!
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"Guide");
	LUZIAN_BETRETEN = FALSE ;
};

instance XOR_8001_WARRIORNATURE_PLATION (C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 1;
	condition = xor_8001_warriornature_PLATIE_condition;
	information = xor_8001_warriornature_PLATION_info;
	permanent = FALSE;
	description = " What armor are you wearing? " ;
};

func int xor_8001_warriornature_PLATIE_condition()
{
	if(Npc_KnowsInfo(hero,XOR_8001_WarriorNature_Found) == TRUE)
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_PLATION_info()
{
	AI_Output(other,self, " XOR_8001_WarriorNature_PLATIE_01 " );	// What kind of armor are you wearing? Looks a bit like a dress.
	AI_Output(self,other,"XOR_8001_WarriorNature_PLATIE_02");	//Hmmm...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance XOR_8001_WARRIORNATURE_LUZIAN (C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 1;
	condition = xor_8001_warriornature_luzian_condition;
	information = xor_8001_warriornature_luzian_info;
	important = FALSE;
	permanent = TRUE;
	description = " Let's go to the cave - kill Lucian! " ;
};

func int xor_8001_warriornature_luzian_condition()
{
	if ( LUZIAN_BETRETEN  ==  TRUE )
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_luzian_info()
{
	AI_Output(other,self, " XOR_8001_WarriorNature_Found_21 " );	// Let's go to the cave - the demon dies this day!
	AI_Output(self,other, " XOR_8001_WarriorNature_Found_22 " );	// Okay, let's go. Get ready! May the Guardians protect us...
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"Guide");
	LUZIAN_BETRETEN = FALSE ;
};

instance XOR_8001_WARRIORNATURE_DEMON_DEAD(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	condition = xor_8001_warriornature_demon_dead_condition;
	information = xor_8001_warriornature_demon_dead_info;
	important = TRUE;
	permanent = FALSE;
};


func int xor_8001_warriornature_demon_dead_condition()
{
	if ( Npc_KnowsInfo ( hero , xor_8001_warriornature_found ) && Npc_IsDead ( luzian_demon ) )
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_demon_dead_info()
{
	AI_Output(self,other, " XOR_8001_WarriorNature_Demon_Dead_01 " );	// He's dead! Finally... I didn't think it would ever happen.
	AI_Output(other,self, " XOR_8001_WarriorNature_Demon_Dead_02 " );	// Yes, Lucian is dead. I have never seen such a creature before!
	AI_Output(self,other, " XOR_8001_WarriorNature_Demon_Dead_03 " );	// How much strength and malice was in this demon - I still can't believe that everything is over.
	AI_Output(other,self, " XOR_8001_WarriorNature_Demon_Dead_04 " );	// Yes, I will never forget this fight!
	AI_Output(self,other, " XOR_8001_WarriorNature_Demon_Dead_05 " );	// Me too, my friend! Thanks for helping me. Now goodbye. Maybe we'll meet again.
	B_LogEntry( TOPIC_GUARDIANSTEST , " Lucian is dead. The ancient demon turned out to be a very serious opponent, and the fight with him has taken all my strength. But everything is over, and now I need to return to Dagoth to give him the heart of the demon we defeated. " ) ;
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"Guard");
};

