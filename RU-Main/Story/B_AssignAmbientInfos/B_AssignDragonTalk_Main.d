

instance DIA_DragonTalk_Main_1(C_Info)
{
	nr = 10;
	condition = DIA_DragonTalk_Main_1_Condition;
	information = DIA_DragonTalk_Main_1_Info;
	permanent = FALSE;
	description = " What made you come here? " ;
};


func int DIA_DragonTalk_Main_1_Condition()
{
	if(MIS_KilledDragons == 0)
	{
		return TRUE;
	};
};

func void DIA_DragonTalk_Main_1_Info()
{
	AI_Output(other,self, " DIA_DragonTalk_Main_1_15_00 " );	// Servant of Evil. What made you come here? Have you come just to spread terror and panic?
	AI_Output(self,other, " DIA_DragonTalk_Main_1_20_01 " );	// Our highest goal in this world, pitiful human, will remain hidden from you.
	Info_AddChoice(DIA_DragonTalk_Main_1, " How can I get other dragons to talk? " ,DIA_DragonTalk_Main_1_reden);
	Info_AddChoice(DIA_DragonTalk_Main_1, " What do I need to do to banish you? " ,DIA_DragonTalk_Main_1_verbannen);
	DragonTalk_Exit_Free = TRUE;
};

func void DIA_DragonTalk_Main_1_banned()
{
	AI_Output(other,self, " DIA_DragonTalk_MAIN_1_verbannen_15_00 " );	// What, in the name of Innos, should I do to expel you from the kingdom of man?
	AI_Output(self,other, " DIA_DragonTalk_MAIN_1_verbannen_20_01 " );	// Before you can act, you must first understand the meaning of our presence here.
	AI_Output(self,other, " DIA_DragonTalk_MAIN_1_verbannen_20_02 " );	// However, no one will reveal this secret to you of their own free will.
	AI_Output(self,other, " DIA_DragonTalk_MAIN_1_verbannen_20_03 " );	// Only the Eye can loosen our tongues and reveal our true purposes to you.
	AI_Output(self,other, " DIA_DragonTalk_MAIN_1_verbannen_20_04 " );	// Sadly, this information will be useless to you when you're dead.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_DragonTalk_MAIN_1_verbannen_20_05 " );	// We have already been informed that you have chosen the path of the dragon hunter.
		AI_Output(self,other, " DIA_DragonTalk_MAIN_1_verbannen_20_06 " );	// That's why we sent our offspring to your world to ensure our lineage continues here.
		AI_Output(self,other, " DIA_DragonTalk_MAIN_1_verbannen_20_07 " );	// You've already lost, pathetic human.
		Log_CreateTopic(TOPIC_DRACHENEIER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER,LOG_Running);
		B_LogEntry( TOPIC_DRACHENEIER , " One of the dragons muttered something about 'offspring' and the continuation of his family tree. I'm afraid they might have spread their brood all over the world. " );
	}
	else
	{
		AI_Output(self,other, " DIA_DragonTalk_MAIN_1_verbannen_20_08 " );	// The eye has given you information. However, only battle will decide whether you are worthy or not.
	};
};

func void DIA_DragonTalk_Main_1_reden()
{
	AI_Output(other,self, " DIA_DragonTalk_MAIN_1_reden_15_00 " );	// How do I get other dragons to talk?
	AI_Output(self,other, " DIA_DragonTalk_MAIN_1_reden_20_01 " );	// Only my heart can help restore the power of the Eye.
	AI_Output(self,other, " DIA_DragonTalk_MAIN_1_reden_20_02 " );	// But you won't take my heart from me.
};


instance DIA_DragonTalk_Main_2(C_Info)
{
	nr = 10;
	condition = DIA_DragonTalk_Main_2_Condition;
	information = DIA_DragonTalk_Main_2_Info;
	permanent = FALSE;
	description = " Who sent you here? " ;
};


func int DIA_DragonTalk_Main_2_Condition()
{
	if(MIS_KilledDragons == 1)
	{
		return TRUE;
	};
};

func void DIA_DragonTalk_Main_2_Info()
{
	AI_Output(other,self, " DIA_DragonTalk_Main_2_15_00 " );	// Whose orders are you following? Who sent you here?
	AI_Output(self,other, " DIA_DragonTalk_Main_2_20_01 " );	// Our future and present are controlled by the Master with the Word of Power. Soon no one will be able to resist him.
	AI_Output(self,other, " DIA_DragonTalk_Main_2_20_02 " );	// His long arm has already reached here from the Realm of the Dead. The spirits of the night gather in anticipation of his imminent appearance.
	AI_Output(self,other, " DIA_DragonTalk_Main_2_20_03 " );	// He will crush you humans and rule this world.
	AI_Output(self,other, " DIA_DragonTalk_Main_2_20_04 " );	// In his shadow, we are nothing more than an instrument of his creative power.
	AI_Output(self,other, " DIA_DragonTalk_Main_2_20_05 " );	// The master will come and raise your lifeless bodies from the ruins and use them to permanently change the face of this world.
	; _ _ _ _ _ _
	DragonTalk_Exit_Free = TRUE;
};


instance DIA_DragonTalk_Main_3(C_Info)
{
	nr = 10;
	condition = DIA_DragonTalk_Main_3_Condition;
	information = DIA_DragonTalk_Main_3_Info;
	permanent = FALSE;
	description = " How can I defeat your master? " ;
};


func int DIA_DragonTalk_Main_3_Condition()
{
	if(MIS_KilledDragons == 2)
	{
		return TRUE;
	};
};

func void DIA_DragonTalk_Main_3_Info()
{
	AI_Output(other,self, " DIA_DragonTalk_Main_3_15_00 " );	// How can I defeat your master?
	AI_Output(self,other, " DIA_DragonTalk_Main_3_20_01 " );	// He is omnipotent and virtually invulnerable. If you are foolish enough to meet him in person, you will die a slow and painful death.
	AI_Output(other,self, " DIA_DragonTalk_Main_3_15_02 " );	// This isn't the first time I've heard this. Nearly invulnerable doesn't mean I can't kill him.
	AI_Output(other,self, " DIA_DragonTalk_Main_3_15_03 " );	// So tell me: What should I do?
	AI_Output(self,other, " DIA_DragonTalk_Main_3_20_04 " );	// To confront my Master, you'll need things you can never get your hands on.
	AI_Output(other,self, " DIA_DragonTalk_Main_3_15_05 " );	// And what are those things?
	AI_Output(self,other, " DIA_DragonTalk_Main_3_20_06 " );	// You must obtain the finest armor found in your earthly world and put it on yourself.
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other, " DIA_Dragons_Add_20_01 " );	// You will need a sword blessed by your god.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other, " DIA_Dragons_Add_20_02 " );	// You'll need a rune made just for you.
	}
	else
	{
		AI_Output(self,other, " DIA_Dragons_Add_20_00 " );	// You'll need a weapon that's made just for you.
	};
	AI_Output(self,other, " DIA_DragonTalk_Main_3_20_08 " );	// But the most difficult condition of all - you must find five companions who are ready to follow you to death.
	AI_Output(self,other, " DIA_DragonTalk_Main_3_20_09 " );	// Then and only then can you dare to meet the Master.
	DragonTalk_Exit_Free = TRUE;
};


instance DIA_DragonTalk_Main_4(C_Info)
{
	nr = 10;
	condition = DIA_DragonTalk_Main_4_Condition;
	information = DIA_DragonTalk_Main_4_Info;
	permanent = FALSE;
	description = " How can I find your host? " ;
};


func int DIA_DragonTalk_Main_4_Condition()
{
	if(MIS_KilledDragons == 3)
	{
		return TRUE;
	};
};

func void DIA_DragonTalk_Main_4_Info()
{
	AI_Output(other,self, " DIA_DragonTalk_Main_4_15_00 " );	// Where can I find your master?
	AI_Output(self,other, " DIA_DragonTalk_Main_4_20_01 " );	// He has erected a fortress for himself in a strong rock in the holy halls of Irdorath and awaits the fulfillment of his destiny there.
	AI_Output(self,other, " DIA_DragonTalk_Main_4_20_02 " );	// In order to establish the order he desires in this world, he spends a lot of time there in deep meditation...
	if(KNOWABOUTIRDORAT == FALSE)
	{
		AI_Output(other,self, " DIA_DragonTalk_Main_4_15_03 " );	// Spare me the details. Tell me how to find the holy halls of Irdorath.
		AI_Output(self,other, " DIA_DragonTalk_Main_4_20_04 " );	// Ha, ha, ha. You disappoint me, human. Even after having gone through all the trials and dangers, having convinced almost all of us, you suffer defeat due to the inability to turn to higher knowledge.
		AI_Output(self,other, " DIA_DragonTalk_Main_4_20_05 " );	// If the word Irdorath means nothing to you, then you should go to your magicians and ask them to let you tear them away from their affairs of worldly importance.
		AI_Output(self,other, " DIA_DragonTalk_Main_4_20_06 " );	// Because it is clear that you are not ready to carry the burden of high knowledge.
	}
	else
	{
		AI_Output(other,self, " DIA_DragonTalk_Main_4_20_07 " );	// I've heard of the halls of Irdorath! Now everything is clear to me.
		AI_Output(self,other, " DIA_DragonTalk_Main_4_20_08 " );	// Even so, your knowledge is still unlikely to help you, human.
		AI_Output(other,self, " DIA_DragonTalk_Main_4_20_09 " );	// We'll see about that!
	};
	Log_CreateTopic(TOPIC_BuchHallenVonIrdorath,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath,LOG_Running);
	B_LogEntry(TOPIC_BuchHallenVonIrdorath, " The dragon lord is in the rocks of the hallowed halls of Irdorath. Hmm... This sounds familiar to me. Have I read about it somewhere? " );
	B_NPC_IsAliveCheck(OldWorld_Zen);
	DragonTalk_Exit_Free = TRUE;
};

func void B_AssignDragonTalk_Main(var C_Npc slf)
{
	DIA_DragonTalk_Main_1.npc = Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc = Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc = Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc = Hlp_GetInstanceID(slf);
};

