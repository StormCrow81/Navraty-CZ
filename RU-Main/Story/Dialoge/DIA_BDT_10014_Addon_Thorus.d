
instance DIA_Addon_BDT_10014_Thorus_EXIT(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 999;
	condition = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Thorus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10014_Thorus_Hi(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 2;
	condition = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Hi_Condition()
{
	if ((RavenAway ==  FALSE ) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Hi_Info()
{
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Hi_12_00 " );	// You know the rules. No one can get into the mine unless they have a red stone tile.
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Hi_15_01 " );	// It's not about the mine - I need to see Raven.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Hi_12_02 " );	// This doesn't change anything. Rules are rules, they apply to everyone. And even to you.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Hi_12_03 " );	// Come back. If you try to get to the top floor without permission, the guards will kill you. Those are the rules.
	if ( ! Npc_IsDead(Esteban))
	{
		AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Hi_12_04 " );	// If you don't like it, you can talk to Esteban. He is in charge of the camp.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BDT_10014_Thorus_Raven(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 3;
	condition = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent = FALSE;
	description = " This is very important, I need to get to Raven... " ;
};


func int DIA_Addon_Thorus_Raven_Condition()
{
	if ((RavenAway ==  FALSE ) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raven_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Raven_15_00 " );	// This is very important, I need to get to Raven...
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Raven_12_01 " );	// True? Do you really think you can get through to him?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Raven_12_02 " );	// His guards are firmly following orders to keep ANYONE out. You will die before you even see it.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Raven_12_03 " );	// So you better get that idea out of your head.
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW, " Raven is the leader of the bandits. To get to him, I will have to kill those who stand in my way. " );
};


instance DIA_Addon_BDT_10014_Thorus_Zeit (C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent = FALSE;
	description = " Don't you remember me? I'm from the Old Camp... " ;
};


func int DIA_Addon_Thorus_Zeit_Condition()
{
	if ((RavenAway ==  FALSE ) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Zeit_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Zeit_15_00 " );	// You don't remember me? I'm from the Old Camp...
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Zeit_12_01 " );	// Were you one of the prisoners?! Perhaps you were one of my guards. And... that makes us friends now?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Zeit_12_02 " );	// No, it doesn't.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Zeit_12_03 " );	// Maybe you're the one who destroyed the Barrier, or maybe you're the one who killed my buddies.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//И что?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Zeit_12_05 " );	// Those days are over.
	if ( ! Npc_IsDead(Esteban))
	{
		AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Zeit_12_06 " );	// Do you want to enter? Then get yourself a red stone and don't waste my time again.
	};
};


var int Thorus_GoodOldPerm;

instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent = TRUE;
	description = " Come on, let me in. For the good old days. " ;
};


func int DIA_Addon_Thorus_GoodOldPerm_Condition()
{
	if ((MIS_Send_Buddler !=  LOG_SUCCESS ) && Npc_KnowsInfo(other,DIA_Addon_BDT_10014_Thorus_Zeit) && (RavenAway ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_GoodOldPerm_Info()
{
	AI_Output(other,self, " DIA_Addon_Thorus_Add_15_00 " );	// All right, let me in. In the name of the good old days.
	if(Thorus_GoodOldPerm == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Thorus_Add_12_01 " );	// Let me explain something to you. Do you know why I'm still alive?
		AI_Output(self,other, " DIA_Addon_Thorus_Add_12_02 " );	// Because I've always been loyal to my people.
		AI_Output(self,other, " DIA_Addon_Thorus_Add_12_03 " );	// I don't agree with everything Raven does. But I always follow the rules.
		AI_Output(self,other, " DIA_Addon_Thorus_Add_12_04 " );	// And you will do it too!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(твердо) Нет!
	};
};

func int C_PlayerHasWrongToken()
{
	if((C_ScHasMagicStonePlate() == TRUE) || (Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_02) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_03) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_04) >= 1) || (Npc_HasItems(hero,ItMi_Addon_Stone_05) >= 1))
	{
		return TRUE;
	};
};


instance DIA_Addon_BDT_10014_Thorus_Stein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent = TRUE;
	description = " Here, I have a stone tile... " ;
};


func int DIA_Addon_Thorus_Stein_Condition()
{
	if ((C_PlayerHasWrongToken() ==  TRUE ) && (RavenAway ==  FALSE ) && (MY_Send_Buddler != LOG_Running) && (MY_Send_Buddler !=  LOG_SUCCESS ) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Stein_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Stein_15_00 " );	// Here, I have a stone tile...
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Stein_12_01 " );	// This is the wrong stone. Only red stones are a pass.
};


instance DIA_Addon_BDT_10014_Thorus_Rein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent = FALSE;
	description = " Here, I have a red stone tablet... " ;
};


func int DIA_Addon_Thorus_Rein_Condition()
{
	if ((Npc_HasItems(other,ItMy_Addon_Stone_01) >=  1 ) && (RavenAway ==  FALSE ) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Rein_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Rein_15_00 " );	// Here, I have a red stone tablet...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//Хорошо.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Rein_12_02 " );	// You killed Esteban - so YOU ​​will now do his job.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Rein_12_03 " );	// They're having trouble with the sliders in the shaft.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Rein_12_04 " );	// Three workers have already died. Your task is to find a replacement for them.
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Rein_15_05 " );	// And when will I finally be able to get into this damn mine?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Rein_12_06 " );	// Do your job - and then you can do whatever you want.
	MIS_Send_Buddler = LOG_Running;
	Log_CreateTopic(Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Buddler,LOG_Running);
	B_LogEntry(Topic_Addon_Buddler, " I took Esteban's place, and now I need to send three miners to the mine. " );
};


instance DIA_Addon_BDT_10014_Thorus_Sent(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent = FALSE;
	description = " I sent three new guys. " ;
};


func int DIA_Addon_Thorus_Sent_Condition()
{
	if (( Player_SentBuddler >=  3 ) && ( RavenAway ==  FALSE ) && ( THORUS_TP  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Sent_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Sent_15_00 " );	// I sent three new guys.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Sent_12_01 " );	// Good. Then I have no reason not to let you in.
	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_BDT_10014_Thorus_Armor(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent = FALSE;
	description = " Hey, what kind of armor are you wearing? Where can I get the same ones? " ;
};


func int DIA_Addon_Thorus_Armor_Condition()
{
	if ((RavenAway ==  FALSE ) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Armor_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Armor_15_00 " );	// Hey, what's that armor you're wearing? Where can I get the same ones?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Armor_12_01 " );	// Nowhere. This armor is made especially for the guards of the Raven.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Armor_12_02 " );	// I guess there is no entrance exam for new people. But the final decision is not made by me, but by Raven.
	THORUSACCEPTMEGUARD = LOG_Running;
	Log_CreateTopic(TOPIC_THORUSGUARD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORUSGUARD,LOG_Running);
	; _ _ _ _ _ _
};


instance DIA_Addon_Thorus_Prisoners (C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 88;
	condition = DIA_Addon_Thorus_Prisoners_Condition;
	information = DIA_Addon_Thorus_Prisoners_Info;
	permanent = FALSE;
	description = " How are the prisoners? " ;
};


func int DIA_Addon_Thorus_Prisoners_Condition()
{
	if ( ! Npc_IsDead(Bloodwyn) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi) && ( THORUS_TP  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Prisoners_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Gefangene_15_00 " );	// How are the prisoners?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Gefangene_12_01 " );	// They did their job! As far as I know, they should be looking for gold now.
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Gefangene_15_02 " );	// What if they run away?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Gefangene_12_03 " );	// Bloodwyn will send guards after them. But I highly doubt they are stupid enough to run.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Gefangene_12_04 " );	// If only... (thoughtfully)
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Gefangene_15_05 " );	// If only - what?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Gefangene_12_06 " );	// ...someone won't beat them to this! But I don't know anyone who would be stupid enough for that. At least as long as Bloodwin is here!
	B_Say(other,self,"$VERSTEHE");
};


instance DIA_Addon_Thorus_Speech(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Speech_Condition()
{
	if (Npc_IsDead(Bloodwyn) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Speech_Info()
{
	AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_00 " );	// What are you up to?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//Что???
	if(RavenAway == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_02 " );	// Now you've got Bloodwin out of the way too. I'm already wondering who will be next. Crow? Or maybe me?
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Ты боишься?
		AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_04 " );	// I'm not afraid of fights. But I'm afraid of what your actions might lead to.
	};
	AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_05 " );	// This camp is all we have left.
	AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_06 " );	// Maybe it didn't always work perfectly, but it works.
	AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_07 " );	// But with every person you kill, a piece of our society disappears.
	AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_08 " );	// We are bandits. Thugs, criminals, exiles.
	AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_09 " );	// Wherever we go, we'll be hunted down, caught, and killed.
	AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_10 " );	// There's no better place for us than this, and there's no better time than now.
	AI_Output(other,self, " DIA_Addon_Thorus_Speech_15_11 " );	// Where are you going?
	AI_Output(self,other, " DIA_Addon_Thorus_Speech_12_12 " );	// These people need a leader. Who is capable of becoming one? Maybe you? You, the person who never stays in one place for long?
};


instance DIA_Addon_Thorus_Answer(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent = FALSE;
	description = " Then why don't you become the head of the camp? " ;
};


func int DIA_Addon_Thorus_Answer_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Thorus_Speech ) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Answer_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Answer_15_00 " );	// Then why don't you become the head of the camp?
	if(RavenAway == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Answer_12_01 " );	// Let's say, what about Raven?
		AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Answer_15_02 " );	// Raven will soon have other things to worry about. I will take care of it.
	};
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Answer_15_03 " );	// Oh, yes... And make sure the prisoners leave the camp quietly.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Answer_12_04 " );	// Okay, I'll deal with the guards.
	B_LogEntry(TOPIC_Addon_Sklaven, " Bloodwin is dead and Thorus will make sure the slaves can leave the camp. " );

	if ( ! Npc_IsDead(PrisonGuard))
	{
		B_LogEntry(TOPIC_Addon_Sklaven, " Now we need to talk to the slave guard again. After that, Patrick and his guys will be able to leave this place unhindered. " );
	}
	else
	{
		B_LogEntry(TOPIC_Addon_Sklaven, "The slaves are no longer guarded! Now Patrick and his guys can leave this place unhindered. " );
	};
};


instance DIA_Addon_Thorus_Raventot (C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent = FALSE;
	description = " The raven is gone! " ;
};


func int DIA_Addon_Thorus_Raventot_Condition()
{
	if (( RavenAway ==  TRUE ) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raventot_Info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Raventot_15_98 " );	// The raven is gone!
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Raventot_12_99 " );	// (surprised) What do you mean by that? Although Beliar is with him! We would all be better off without him.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Raventot_12_02 " );	// Will you move on now?
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Raventot_15_97 " );	// You know me.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Raventot_12_04 " );	// (laughs) Yes, you are constantly moving somewhere. Happy journey!
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_Raventot_15_05 " );	// Who knows, maybe our paths will cross again.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_Raventot_12_06 " );	// Who knows! You will have many gates and many crossings on your way. And on one of them you can meet me.
	THORUSACCEPTME = TRUE;
};

instance DIA_ADDON_THORUS_PICKPOCKET(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 900;
	condition = dia_addon_thorus_pickpocket_condition;
	information = dia_addon_thorus_pickpocket_info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int dia_addon_thorus_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ITKE_Addon_Thorus) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_pickpocket_info()
{
	Info_ClearChoices(dia_addon_thorus_pickpocket);
	Info_AddChoice(dia_addon_thorus_pickpocket,Dialog_Back,dia_addon_thorus_pickpocket_back);
	Info_AddChoice(dia_addon_thorus_pickpocket,DIALOG_PICKPOCKET,dia_addon_thorus_pickpocket_doit);
};

func void dia_addon_thorus_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		B_GiveInvItems(self,other,ITKE_Addon_Thorus,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(dia_addon_thorus_pickpocket);
	}
	else
	{
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void dia_addon_thorus_pickpocket_back()
{
	Info_ClearChoices(dia_addon_thorus_pickpocket);
};


instance DIA_ADDON_THORUS_ORCINVASION(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = dia_addon_thorus_orcinvasion_condition;
	information = dia_addon_thorus_orcinvasion_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_orcinvasion_condition()
{
	if (( RavenAway ==  TRUE ) && ( THORUS_TP  ==  TRUE ) &&  !
	{
		return TRUE;
	};
};

func void dia_addon_thorus_orcinvasion_info()
{
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_00 " );	// (surprised) You again! Sometimes it seems to me that there is no such place where you could not be met.
	if(ORCSHAMAN4ISDEAD == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_02 " );	// Torus, what are you doing here?! I thought the orcs killed everyone in the camp.
		AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_03 " );	// Me and a few other guys from the camp still managed to get out of that mess alive.
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_05 " );	// Torus, what are you doing here?!
		AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_06 " );	// Don't you know? Our camp was attacked by orcs.
		AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_07 " );	// These green-skinned creatures attacked us so unexpectedly that we didn't even have time to prepare for defense!
		AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_08 " );	// But me and a few other guys from the camp still managed to get out of that mess alive.
	};
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_10 " );	// If it wasn't for one kid named Tom, we'd all be finished. But he knew the secret path leading out of the camp - that's why we left from there.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_11 " );	// I still don't understand how we did it!
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_13 " );	// Where's everyone else?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_14 " );	// There in the cave behind me. There is all that remains of our camp ... (with sadness)
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_15 " );	// Got it. And what are you going to do now?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_16 " );	// Now I don't even know. One thing I can say for sure: all the guys, just like me, are thinking of getting out of here as soon as possible.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_17 " );	// Sooner or later, the orcs will get here. And then surely no one will save us.
	if(AWORCINVASIONSTOP == TRUE)
	{
		B_GivePlayerXP(150);
		AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_18 " );	// Orcs are no longer dangerous! Their leaders are dead, and most likely they will leave the valley soon.
		AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_19 " );	// This is good news. But it's pointless to return to the camp anyway. There are too few of us, and it is not a fact that the invasion will not happen again.
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_21 " );	// All possible.
	};
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_22 " );	// And what are you going to do now?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_23 " );	// I don't know. I think to talk to the pirates. I heard sometimes they swim to another part of the island.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_OrcInvasion_01_24 " );	// As far as I remember, they still love gold. Maybe they'll agree to take us there.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_THORUS_RAVENGUARD(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = dia_addon_thorus_ravenguard_condition;
	information = dia_addon_thorus_ravenguard_info;
	permanent = FALSE;
	description = " One more thing... " ;
};


func int dia_addon_thorus_ravenguard_condition()
{
	if (( RavenAway ==  TRUE ) && ( THORUSACCEPTME  ==  TRUE ) && ( THORUS_TP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_ravenguard_info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Thorus_RavenGuard_01_02 " );	// Now that the Raven is gone, how about taking me into YOUR guard. Now you make a decision on this matter. Is not it?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_RavenGuard_01_05 " );	// Oh boy. You won't leave, will you?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_RavenGuard_01_06 " );	// Okay. Consider that you have passed your entrance exam. (laughs)
	AI_Output(self,other, " DIA_Addon_BDT_10014_Thorus_RavenGuard_01_07 " );	// Here, take your armor. In general, you honestly deserve them.
	AI_Print( " Received Guard Heavy Armor " );
	CreateInvItems(other,ITAR_Thorus_Addon,1);
	THORUSACCEPTMEGUARD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_THORUSGUARD,LOG_SUCCESS);
	B_LogEntry( TOPIC_THORUSGUARD , " In gratitude for being freed from the Raven, Thorus made me one of his lieutenants and gave me heavy guard armor. " );
};
