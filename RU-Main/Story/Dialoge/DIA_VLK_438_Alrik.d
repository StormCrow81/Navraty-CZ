
instance DIA_Alrik_EXIT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 999;
	condition = DIA_Alrik_EXIT_Condition;
	information = DIA_Alrik_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alrik_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alrik_PICKPOCKET (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 900;
	condition = DIA_Alrik_PICKPOCKET_Condition;
	information = DIA_Alrik_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Alrik_PICKPOCKET_Condition()
{
	return  C_Robbery ( 55 , 50 );
};

func void DIA_Alrik_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,Dialog_Back,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alrik_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};

func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};


instance DIA_Alrik_Hello (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Hello_Condition;
	information = DIA_Alrik_Hello_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Alrik_Hello_Condition()
{
	return TRUE;
};

func void DIA_Alrik_Hello_Info()
{
	AI_Output(other,self, " DIA_Alrik_Hallo_15_00 " );	// What are you doing here?

	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other, " DIA_Alrik_Hallo_09_01 " );	// (laughs) This is my house!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other, " DIA_Alrik_Hallo_09_02 " );	// What else can I do here? I drink.
	}
	else
	{
		AI_Output(self,other, " DIA_Alrik_Hallo_09_03 " );	// I'm going to take a little walk.
	};

	if(AlrikRECRUITEDDT == FALSE)
	{
		AI_Output(self,other, " DIA_Alrik_Hallo_09_04 " );	// But if you mean what I do during the day, then I make fights.
	};
};


instances of DIA_Alrik_YouFight (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_YouFight_Condition;
	info = DIA_Alrik_YouFight_Info;
	permanent = FALSE;
	description = " Do you make fights? " ;
};

func int DIA_Alrik_YouFight_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Alrik_Hello ) && ( Alrik_RECRUITEDT ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_Alrik_YouFight_Info()
{
	AI_Output(other,self, " DIA_Alrik_YouFight_15_00 " );	// Do you make fights?
	AI_Output(self,other, " DIA_Alrik_YouFight_09_01 " );	// Every day, from noon to evening.

	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other, " DIA_Alrik_YouFight_09_02 " );	// And right here!
	};
	AI_Output(self,other, " DIA_Alrik_YouFight_09_03 " );	// Behind the warehouse in the port district - this is my home!
};


instance DIA_Alrik_Rules (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Regeln_Condition;
	information = DIA_Alrik_Rules_Info;
	permanent = FALSE;
	description = " What are the rules of combat? " ;
};


func int DIA_Alrik_Rule_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Alrik_YouFight ) && ( Alrik_RECRUITEDT ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Rules_Info()
{
	AI_Output(other,self, " DIA_Alrik_Regeln_15_00 " );	// What are the combat rules?
	AI_Output(self,other, " DIA_Alrik_Regeln_09_01 " );	// It's easy! All conventional weapons are allowed. No bows, crossbows and NO magic!
	AI_Output(self,other, " DIA_Alrik_Regeln_09_02 " );	// We fight until one of us falls. As soon as one of us is prone on the ground, the fight is over, okay?
	AI_Output(self,other, " DIA_Alrik_Regeln_09_03 " );	// Whoever runs away loses! That is, if you left the battle, then I won!
	AI_Output(self,other, " DIA_Alrik_Regeln_09_04 " );	// The bet is fifty gold! If you win, you will get one hundred coins. If not... (grins) Well, then I'll keep your money.
	AI_Output(self,other, " DIA_Alrik_Regeln_09_05 " );	// Got it?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Да!
};

func void B_Alrik_Again()
{
	AI_Output(self,other, " DIA_Alrik_Add_09_03 " );	// How are you? Do you want to fight me again? I think I've gotten better over the years...
};


instance DIA_Alrik_NewFights3(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights3_Condition;
	info = DIA_Alrik_NewFights3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights3_Condition()
{
	if ((Chapter >=  3 ) && (Chapter <=  4 ) && (Alrik_ArenaBattlefVerloren <=  6 ))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,5);
	B_SetAttributesToChapter(self,5);
	B_Alrik_Again();
};


instance DIA_Alrik_NewFights5(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights5_Condition;
	information = DIA_Alrik_NewFights5_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights5_Condition()
{
	if ((Chapter >=  5 ) && (Alrik_ArenaBattlefLord <=  9 ))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,5);
	B_SetAttributesToChapter(self,6);
	B_Alrik_Again();
};

func void B_Alrik_Enough()
{
	AI_Output(self,other, " DIA_Alrik_WannaFight_09_05 " );	// I think you win too often.
	AI_Output(self,other, " DIA_Alrik_WannaFight_09_06 " );	// Don't get me wrong, but my head is still buzzing from last time...
};

func void B_Alrik_ComeBackLater()
{
	AI_Output(self,other, " DIA_Alrik_Add_09_02 " );	// Come back later. And while I practice...
};


instance DIA_Alrik_WannaFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WannaFight_Condition;
	information = DIA_Alrik_WannaFight_Info;
	permanent = TRUE;
	description = " I want to fight you! " ;
};

func int DIA_Alrik_WannaFight_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Alrik_Rule ) && ( self . aivar [ AIV_ArenaFight ] ==  OF_NONE ) && ( Alrik RECRUITED ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Alrik_WannaFight_Info()
{
	AI_Output(other,self, " DIA_Alrik_WannaFight_15_00 " );	// I want to fight you!
	Info_ClearChoices(DIA_Alrik_WannaFight);

	if ((Alrik_ArenaKampfVerloren >  0 ) && (Npc_HasItems(self,ItMw_AlriksSword_Mis) ==  0 ))
	{
		if(MIS_Alrik_Sword == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Alrik_WannaFight_09_01 " );	// First, give me back my sword. And then we'll see...

			if(Npc_HasItems(other,ItMw_AlriksSword_Mis) >= 1)
			{
				Info_ClearChoices(DIA_Alrik_WannaFight);
				Info_AddChoice(DIA_Alrik_WannaFight, " ...(отдать меч) " ,DIA_Alrik_WannaFight_GiveSword);
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Alrik_WannaFight_09_02 " );	// No, no. Before I go against you again, I need to get a better weapon!
			AI_Output(self,other, " DIA_Alrik_WannaFight_09_03 " );	// I had to sell my sword a few days ago.
			AI_Output(self,other, " DIA_Alrik_WannaFight_09_04 " );	// With him, I'm invincible! If you return it to me, I'm ready to fight you again!
			Alrik_Told by the Sword = TRUE ;
		};
	}
	else  if ((Chapter <=  2 ) && (Alrik_ArenaKampfVerloren >  3 ))
	{
		AI_Output(self,other, " DIA_Alrik_Add_09_00 " );	// I think that's enough for now...
		AI_Output(self,other, " DIA_Alrik_Add_09_01 " );	// Give me a break.
		B_Alrik_ComeBackLater();
	}
	else  if ((Chapter >=  3 ) && (Chapter <=  4 ) && (Alrik_ArenaKampfVerloren >  6 ))
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	else  if (chapter >=  5 )
	{
		if (Alrik_ArenaKampfVerloren >  9 )
		{
			B_Alrik_Enough();
			AI_Output(self,other, " DIA_Alrik_Add_09_04 " );	// Besides, I already have enough gold.
		}
		else
		{
			AI_Output(self,other, " DIA_Alrik_Add_09_04A " );	// I already have enough gold.
		};
		if (Npc_IsDead(edda) ==  FALSE )
		{
			AI_Output(self,other, " DIA_Alrik_Add_09_05 " );	// And I quit this business and even found a common language with Edda.
			AI_Output(self,other, " DIA_Alrik_Add_09_06 " );	// Ahem... I think you understand what I mean...
		}
		else
		{
			AI_Output(self,other, " DIA_Alrik_Add_09_05A " );	// And I'm done with this business! Bought Edda's shack.
			AI_Output(self,other, " DIA_Alrik_Add_09_06A " );	// And now I don't live behind a warehouse.
		};
	}
	else  if (Wld_IsTime( 11 , 0 , 19 , 0 ))
	{
		AI_Output(self,other, " DIA_Alrik_WannaFight_09_07 " );	// Do you have fifty gold coins?
		Info_ClearChoices(DIA_Alrik_WannaFight);
		Info_AddChoice(DIA_Alrik_WannaFight,"Хм...",DIA_Alrik_WannaFight_NoGold);

		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			Info_AddChoice(DIA_Alrik_WannaFight,"Вот они...",DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Alrik_WannaFight_09_08 " );	// I only fight from noon to evening.
		AI_Output(self,other, " DIA_Alrik_WannaFight_09_09 " );	// Fights only make sense if there are enough spectators to bet!
		if (Wld_IsTime( 19 , 0 , 3 , 30 ))
		{
			AI_Output(self,other, " DIA_Alrik_WannaFight_09_10 " );	// It's too late now. Come tomorrow at noon!
		}
		else
		{
			AI_Output(self,other, " DIA_Alrik_WannaFight_09_11 " );	// It's still too early, come back later!
		};
	};
};

func void DIA_Alrik_WannaFight_GiveSword()
{
	AI_Output(other,self, " DIA_Alrik_WannaFight_Gold_15_00 " );	// Here, take this...
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output(other,self, " DIA_Alrik_WannaFight_Gold_15_00 " );	// Here, take this...
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(self,other, " DIA_Alrik_WannaFight_Gold_09_01 " );	// (loudly) We have a new fighter!
	AI_Output(self,other, " DIA_Alrik_WannaFight_Gold_09_02 " );	// Bets are placed...
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	AI_Output(self,other, " DIA_Alrik_WannaFight_Gold_09_03 " );	// Are you ready?
	self.aivar[AIV_ArenaFight] = AF_RUNNING ;
	Alrik_Battles = Alrik_Battles +  1 ;
	Info_ClearChoices(DIA_Alrik_WannaFight);
	Info_AddChoice(DIA_Alrik_WannaFight, " Wait a second... " ,DIA_Alrik_WannaFight_Moment);
	Info_AddChoice(DIA_Alrik_WannaFight,"Иди сюда!",DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Нет...
	AI_Output(self,other, " DIA_Alrik_WannaFight_NoGold_09_01 " );	// Then find them! There will be no fight without stakes!
	Info_ClearChoices(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output(other,self, " DIA_Alrik_WannaFight_NOW_15_00 " );	// Come here!
	AI_Output(self,other, " DIA_Alrik_WannaFight_NOW_09_01 " );	// Let's see what you can do!

	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};

	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMi_Gold,100);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output(other,self, " DIA_Alrik_WannaFight_Moment_15_00 " );	// Wait a second...
	AI_Output(self,other, " DIA_Alrik_WannaFight_Moment_09_01 " );	// As you wish... and I'm starting now!

	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};

	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMi_Gold,100);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Alrik_AfterFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_AfterFight_Condition;
	info = DIA_Alrik_AfterFight_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Alrik_AfterFight_Condition()
{
	if((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if (self.aivar[AIV_ArenaFight] !=  AF_NONE )
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_AfterFight_Info()
{
	if ((self.aivar[AIV_ArenaFight] !=  AF_NONE ) && (self.aivar[AIV_ArenaFight] !=  AF_AFTER_PLUS_DAMAGE ))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			B_GivePlayerXP(100);
			AI_Output(self,other, " DIA_Alrik_AfterFight_09_00 " );	// Oh boy. Well, you've got hits!

			if(Npc_HasItems(self,ItMi_Gold) >= 100)
			{
				AI_Output(self,other, " DIA_Alrik_AfterFight_09_01 " );	// Here's your hundred gold! You have earned them!
				B_GiveInvItems(self,other,ItMi_Gold,100);
			}
			else if(Npc_HasItems(self,ItMi_Gold) == 0)
			{
				AI_Output(self,other, " DIA_Alrik_AfterFight_09_02 " );	// I see you've already taken your gold.
				AI_Output(self,other, " DIA_Alrik_AfterFight_09_03 " );	// You could wait until I give it to you myself - I keep my word!
			}
			else
			{
				AI_Output(self,other, " DIA_Alrik_AfterFight_09_04 " );	// You rummaged through my pockets while I was unconscious!
				AI_Output(self,other, " DIA_Alrik_AfterFight_09_05 " );	// This is bad manners! But okay, that money was still yours! Here's the rest.
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
			};

			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren +  1 ;

			if (Alrik_Ok_01 ==  FALSE )
			{
				Alrik_Ok_01 = TRUE ;
			};
		}
		else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self,other, " DIA_Alrik_AfterFight_09_06 " );	// You fought well. But your bet is gone - don't be especially upset, it will go to a good deed! (grins)
		}
		else
		{
			AI_Output(self,other, " DIA_Alrik_AfterFight_09_07 " );	// Hey, I told you, whoever runs around the corner loses! If you want to try again, I'm at your service!
		};
		if (Alrik_Kaempfe ==  1 )
		{
			AI_Output(self,other, " DIA_Alrik_AfterFight_09_08 " );	// And one more thing: no one talks about what's going on behind the warehouse.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other, " DIA_Alrik_AfterFight_09_09 " );	// The militia is ready to put you behind bars for the slightest transgression. And these guys don't like betting on a fight.
			};
		};
		self.aivar[AIV_ArenaFight] = AF_NONE ;
		self.aivar[AIV_LastFightComment] = TRUE ;
	}
	else
	{
		if (self.aivar[AIV_ArenaFight] ==  ​​AF_AFTER_PLUS_DAMAGE )
		{
			AI_Output(self,other, " DIA_Alrik_AfterFight_09_10 " );	// The fight was over, you nerd!
			AI_Output(self,other, " DIA_Alrik_AfterFight_09_11 " );	// I don't like it when someone doesn't follow my rules.
			AI_Output(self,other, " DIA_Alrik_AfterFight_09_12 " );	// Get out of here!
		}
		else
		{
			if (Alrik_Battles ==  0 )
			{
				AI_Output(self,other, " DIA_Alrik_AfterFight_09_13 " );	// If you wanted to fight me, you should have called me.
			}
			else
			{
				AI_Output(self,other, " DIA_Alrik_AfterFight_09_14 " );	// If you wanted to fight again, you should have called me!
			};

			AI_Output(self,other, " DIA_Alrik_AfterFight_09_15 " );	// I don't want to deal with shit like you! Get out!
		};

		self.aivar[AIV_ArenaFight] = AF_NONE ;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Alrik_DuWohnst (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_DuWohnst_Condition;
	information = DIA_Alrik_DuWohnst_Info;
	permanent = FALSE;
	description = " Do you 'live' behind this warehouse? " ;
};


func int DIA_Alrik_DuWohnst_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Alrik_YouFight ) && ( Chapter <  5 ) && ( AlrikRECRUITEDT ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Alrik_DuWohnst_Info()
{
	AI_Output(other,self, " DIA_Alrik_DuWohnst_15_00 " );	// (surprised)...Do you live behind this warehouse?
	AI_Output(self,other, " DIA_Alrik_DuWohnst_09_01 " );	// Only temporarily. (grins) When you have as much money as I do, you can afford a little luxury!
	AI_Output(self,other, " DIA_Alrik_DuWohnst_09_02 " );	// I used to be an instructor in the army, but I quit and chose to be an adventurer.
	AI_Output(self,other, " DIA_Alrik_DuWohnst_09_03 " );	// And now I'm stuck in this hole. My last hundred gold went into the pocket of the guards at the city gates.
	AI_Output(self,other, " DIA_Alrik_DuWohnst_09_04 " );	// Now I'm trying to get rich again! I even had to sell my sword.
	Alrik_Told by the Sword = TRUE ;
};


instance DIA_Alrik_WerSchwert (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WerSchwert_Condition;
	information = DIA_Alrik_WerSchwert_Info;
	permanent = FALSE;
	description = " Who did you sell your sword to? " ;
};

func int DIA_Alrik_WerSchwert_Condition()
{
	if (Alrik_VomSchwertErzaehlt ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Alrik_WerSchwert_Info()
{
	AI_Output(other,self, " DIA_Alrik_WerSchwert_15_00 " );	// Who did you sell your sword to?
	AI_Output(self,other, " DIA_Alrik_WerSchwert_09_01 " );	// I traded it with the marketplace merchant for some items.
	AI_Output(self,other, " DIA_Alrik_WerSchwert_09_02 " );	// His name is Jora. The torches and the meat he gave me are long gone.
	AI_Output(other,self, " DIA_Alrik_WerSchwert_15_03 " );	// He's not likely to give me this sword just like that...
	AI_Output(self,other, " DIA_Alrik_WerSchwert_09_04 " );	// This is an old sword. He is unlikely to ask much for it. Just think of this money as an extra bet. (grins)
	MIS_Alrik_Sword = LOG_Running;
	Log_CreateTopic(TOPIC_AlrikSchwert,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_Running);
	B_LogEntry(TOPIC_AlrikSchwert, " Alrik has sold his sword to the merchant Jora. He will only fight me if I return his sword to him. " );
};

var int Alrik_OneSwordBonus;

instance DIA_Alrik_HaveSword (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_HaveSword_Condition;
	info = DIA_Alrik_HaveSword_Info;
	permanent = FALSE;
	description = " I brought your sword! " ;
};

func int DIA_Alrik_HaveSword_Condition()
{
	if((Npc_HasItems(other,ItMw_AlriksSword_Mis) >= 1) && (MIS_Alrik_Sword == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Alrik_HaveSword_Info()
{
	B_GivePlayerXP(XP_AlriksSword);
	AI_Output(other,self, " DIA_Alrik_HaveSword_15_00 " );	// I brought your sword!
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	AI_Output(self,other, " DIA_Alrik_HaveSword_09_01 " );	// Ah! They are much more comfortable to fight than with a stick!
	AI_Output(self,other, " DIA_Alrik_HaveSword_09_02 " );	// Great! I wonder if you dare to call me now!
	MIS_Alrik_Sword = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_SUCCESS);
	B_LogEntry(TOPIC_AlrikSchwert, " I gave Alrik back his sword. " );

	if (Alrik_OneSwordBonus ==  FALSE )
	{
		B_AddFightSkill(self,NPC_TALENT_1H,5);
		Alrik_OnceSwordBonus = TRUE ;
	};
	if (Alrik_Ok_02 ==  FALSE )
	{
		Alrik_Ok_02 = TRUE ;
	};

	AI_EquipBestMeleeWeapon(self);
};

instance DIA_Alrik_Krieg (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Krieg_Condition;
	information = DIA_Alrik_Krieg_Info;
	permanent = FALSE;
	description = " What do you know about the orc war? " ;
};


func int DIA_Alrik_Krieg_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Alrik_DuWohnst ) || ( hero . guild !=  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Alrik_War_Info()
{
	AI_Output(other,self, " DIA_Alrik_Krieg_15_00 " );	// What do you know about the war with the orcs?
	AI_Output(self,other, " DIA_Alrik_Krieg_09_01 " );	// I don't have much to say. This war has been going on for a very long time.
	AI_Output(self,other, " DIA_Alrik_Krieg_09_02 " );	// The people are starving. Peasant uprisings are rising everywhere, which are ruthlessly suppressed by the king.
	AI_Output(self,other, " DIA_Alrik_Krieg_09_03 " );	// But there are too many of them. If the war does not end soon, the kingdom will fall apart.
};

var int Alrik_Predicted;

instance DIA_Alrik_Ausbildungen (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Ausbilden_Condition;
	information = DIA_Alrik_Ausbildung_Info;
	permanent = TRUE;
	description = " Can you teach me? " ;
};

func int DIA_Alrik_Ausbilden_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild !=  GIL_NONE )) && (Alrik_Teach1H ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Ausbildung_Info()
{
	AI_Output(other,self, " DIA_Alrik_Ausbilden_15_00 " );	// Can you teach me?

	if (( Hero_Hero ==  0 ) && ( hero . guild ==  GIL_NONE ))
	{
		AI_Output(self,other, " DIA_Alrik_Ausbilden_09_01 " );	// If you really want to learn how to fight, then come out against me... (grins) I won't charge extra for this lesson.
		Alrik_Predicted = TRUE ;
	}
	else
	{
		if (Alrik_VorausErzaehlt ==  TRUE )
		{
			AI_Output(self,other, " DIA_Alrik_Ausbilden_09_02 " );	// I keep my word. I will teach you everything I know - if you have enough experience.
		}
		else
		{
			AI_Output(self,other, " DIA_Alrik_Ausbilden_09_03 " );	// As soon as you have the necessary experience - please.
		};
		Alrik_Teach1H = TRUE ;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher, " Alrik can teach me the art of one-handed weapons. He hangs around behind a warehouse in the waterfront. " );
	};
};


var int Alrik_Brand_1h;

instance DIA_Alrik_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Teach_Condition;
	information = DIA_Alrik_Teach_Info;
	permanent = TRUE;
	description = " Teach me how to fight. " ;
};

func int DIA_Alrik_Teach_Condition()
{
	if(Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_Teach_Info()
{
	AI_Output(other,self, " DIA_Cord_Teach_15_00 " );	// Teach me how to fight.
	Alrik_Merke_1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,DIA_Alrik_Teach_Shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,DIA_Alrik_Teach_Shield_5);
	};
};

func void DIA_Alrik_Teach_Back()
{
	Info_ClearChoices(DIA_Alrik_Teach);
};

func void DIA_Alrik_Teach_Shield_1()
{
	B_TeachShield(self,other,1,50);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_Shield_5()
{
	B_TeachShield(self,other,5,50);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,40);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,40);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

instance DIA_Alrik_Shield(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Shield_Condition;
	info = DIA_Alrik_Shield_Info;
	permanent = FALSE;
	description = " Are you fighting with a shield? " ;
};

func int DIA_Alrik_Shield_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Shield_Info()
{
	AI_Output(other,self, " DIA_Alrik_Shield_01_00 " );	// Are you fighting with a shield?
	AI_Output(self,other, " DIA_Alrik_Shield_01_01 " );	// Of course! I will never part with him ... (proudly) He is my main hope and support in battle!
	AI_Output(other,self, " DIA_Alrik_Shield_01_02 " );	// Could you teach me how to use a shield?

	if ((Alrik_Ok_01 ==  TRUE ) && (Alrik_Ok_02 ==  TRUE ))
	{
		AI_Output(self,other, " DIA_Alrik_Shield_01_03 " );	// Hmmm... (appreciatively) Why not? You seem like a pretty capable student.
		AI_Output(self,other, " DIA_Alrik_Shield_01_04 " );	// But you will need to have some experience to master this combat technique.
		AI_Output(self,other, " DIA_Alrik_Shield_01_05 " );	// And some gold. I won't do it for free.
		Alrik_Ok_Final = TRUE ;
	}
	else  if (Alrik_Ok_01 ==  FALSE )
	{
		AI_Output(self,other, " DIA_Alrik_Shield_01_06 " );	// First, show me what you can do. And there you will see!
	}
	else  if (Alrik_Ok_02 ==  FALSE )
	{
		AI_Output(self,other, " DIA_Alrik_Shield_01_07 " );	// First I need to get a normal weapon instead of this club.
		AI_Output(self,other, " DIA_Alrik_Shield_01_08 " );	// Otherwise, I simply won't be able to teach you anything.
	};

	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, " Alric can teach me the art of shielding. " );
};

instance DIA_Alrik_Shield_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Shield_Teach_Condition;
	information = DIA_Alrik_Shield_Teach_Info;
	permanent = TRUE;
	description = " Teach me how to use a shield. (Training Points: 10, Cost: 1000 coins) " ;
};

func int DIA_Alrik_Shield_Teach_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Alrik_Shield ) && ( hero . attribute [ ATR_REGENERATETHEME ] ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Alrik_Shield_Teach_Info()
{
	AI_Output(other,self, " DIA_Alrik_Shield_Teach_01_00 " );	// Teach me how to use a shield.

	if ((Alrik_Ok_Final ==  TRUE ) || ((Alrik_Ok_01 ==  TRUE ) && (Alrik_Ok_02 ==  TRUE )))
	{
		if((hero.lp >= 10) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
		{
			hero.lp = hero.lp - 10;
			RankPoints = RankPoints + 10;
			B_GiveInvItems(other,self,ItMi_Gold,1000);
			Npc_RemoveInvItems(self,ItMi_Gold,1000);
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_01 " );	// Good! Listen carefully. (Seriously)
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_02 " );	// A shield is something that in difficult times can cover your ass from a fatal blow.
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_03 " );	// Not everyone knows how to fight with a shield! But this knowledge is definitely worth it.
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_04 " );	// Most importantly, try to keep your shield at eye level. Not lower and not higher.
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_05 " );	// This will simultaneously help you see your opponent and securely cover your body from a blow.
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_06 " );	// Sword strikes should be quick and short. Opened, struck and again covered himself with a shield!
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_07 " );	// The enemy will have to pretty rack their brains on how to pass your defense.
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_08 " );	// And sooner or later he will make a mistake, which you will have to use.
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_09 " );	// If you do it right, you'll definitely be able to become a real shield-bearer someday!
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_10 " );	// And one more thing. Take this wooden shield as a small gift from me.
			B_GiveInvItems(self,other,ItAr_Shield_01,1);
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_11 " );	// After all, you have to train with something!
			AI_Print( " Shield combat trained! " );
			Snd_Play("LevelUP");
			hero.attribute[ATR_REGENERATEMANA] = TRUE;
			Npc_SetTalentSkill(hero,NPC_TALENT_RHETORIKA,1);
			Npc_SetTalentValue(hero,NPC_TALENT_RHETORIKA,hero.attribute[ATR_REGENERATEMANA]);
		}
		else
		{
			if(hero.lp < 10)
			{
				AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_16 " );	// You don't have enough experience, mate! I'm sorry.
			}
			else if(Npc_HasItems(other,ItMi_Gold) < 1000)
			{
				AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_17 " );	// You don't have enough gold, mate! I'm sorry.	
			};
		};
	}
	else
	{
		if (Alrik_Ok_01 ==  FALSE )
		{
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_12 " );	// I told you - show me what you can do first!
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_13 " );	// And then we'll talk.
		}
		else  if (Alrik_Ok_02 ==  FALSE )
		{
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_14 " );	// Can't you see I still have that damn club in my hand?
			AI_Output(self,other, " DIA_Alrik_Shield_Teach_01_15 " );	// Without a proper weapon, I won't teach you anything!
		};
	};
};

instance DIA_Alrik_Armor (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Armor_Condition;
	information = DIA_Alrik_Armor_Info;
	permanent = FALSE;
	description = " Your armor is pretty good. " ;
};

func int DIA_Alrik_Armor_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_Alrik_YouFight ) ==  TRUE ) && ( Alrik_RECRUITEDT ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Armor_Info()
{
	AI_Output(other,self, " DIA_Alrik_Armor_01_00 " );	// You have good armor.
	AI_Output(self,other, " DIA_Alrik_Armor_01_01 " );	// Like it, huh? (smiling) I bet you won't find them anywhere else around here.
	AI_Output(other,self, " DIA_Alrik_Armor_01_02 " );	// Yes, I would love to try them on.
	AI_Output(self,other, " DIA_Alrik_Armor_01_03 " );	// Nothing easier, mate! Looks like I have one more set left.
	AI_Output(self,other, " DIA_Alrik_Armor_01_04 " );	// But you'll have to pay for it.
	AI_Output(other,self, " DIA_Alrik_Armor_01_05 " );	// And how much?
	AI_Output(self,other, " DIA_Alrik_Armor_01_06 " );	// Umm... Well, I guess... Five hundred gold coins will be enough for me!
	AI_Output(other,self, " DIA_Alrik_Armor_01_07 " );	// Why so expensive?
	AI_Output(self,other, " DIA_Alrik_Armor_01_08 " );	// Well, you see... (he hesitated) I really need money.
	AI_Output(self,other, " DIA_Alrik_Armor_01_09 " );	// With their help, I can finally start a new life here.
	AI_Output(self,other, " DIA_Alrik_Armor_01_10 " );	// Well, at the same time pay off some debts.
	AI_Output(self,other, " DIA_Alrik_Armor_01_11 " );	// So sorry man. I can't sell them to you for less.
};

var int buyAlrikArmor;

instance DIA_Alrik_Armor_Trade (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Armor_Trade_Condition;
	info = DIA_Alrik_Armor_Trade_Info;
	permanent = TRUE;
	description = " Buy Alric's armor. (Price: 500 coins) " ;
};

func int DIA_Alrik_Armor_Trade_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Alrik_Armor ) && ( BuyAlrik Armor ==  FALSE ) && ( Alrik RECRUITED ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Armor_Trade_Info()
{
	AI_Output(other,self, " DIA_Alrik_Armor_Trade_01_00 " );	// Sell me your armor.

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		B_GiveInvItems(other,self,ItMi_Gold,500);
		Npc_RemoveInvItems(self,ItMi_Gold,500);
		AI_Output(self,other, " DIA_Alrik_Armor_Trade_01_01 " );	// Great, mate! Here you are.
		B_GiveInvItems(self,other,ITAR_ADVENTURE_HERO,1);
		AI_Output(self,other, " DIA_Alrik_Armor_Trade_01_02 " );	// Believe me, you won't regret spending money on them.
		BuyAlrikArmor = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Alrik_Armor_Trade_01_03 " );	// You don't have enough gold, mate! I'm sorry.
	};
};

instance DIA_Alrik_ASKFORDT (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 6;
	condition = DIA_Alrik_askfordt_condition;
	information = DIA_Alrik_askfordt_info;
	permanent = FALSE;
	description = " I need people. " ;
};

func int DIA_Alrik_askfordt_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if (( HURRAYICANHIRE  ==  TRUE ) && ( WOLFRECRUITEDDT  ==  TRUE ) && ( WolfDayHire < DayNow ) && ( Alrik_Ok_01 ==  TRUE ) && ( Alrik_Ok_02 ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Alrik_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Alrik_AskforDT_15_00 " );	// I need people.
	AI_Output(self,other, " DIA_Alrik_AskforDT_17_01 " );	// For what, may I ask?
	AI_Output(other,self, " DIA_Alrik_AskforDT_17_02 " );	// To guard my camp. And you seem to be an experienced fighter, you know how to fight, so I thought ...
	AI_Output(self,other, " DIA_Alrik_AskforDT_17_03 " );	// True? Do you have a camp?
	AI_Output(other,self, " DIA_Alrik_AskforDT_17_04 " );	// Yes, not far from Onar's farm, on the site of the old tower.
	AI_Output(self,other, " DIA_Alrik_AskforDT_17_05 " );	// Hmmm... And I see that you are a good guy! And when you just do everything.
	AI_Output(other,self, " DIA_Alrik_AskforDT_17_06 " );	// Well, what do you say? After all, it's better than getting punched in the face every day behind a warehouse in the port.
	AI_Output(self,other, " DIA_Alrik_AskforDT_17_07 " );	// And that's right. Basically, I agree with your proposal. But I want to get every day no less than what I earn here in the arena.
	AI_Output(other,self, " DIA_Alrik_AskforDT_17_08 " );	// It's hard to call it an arena! But fifty gold coins a day I am ready to pay you. If you are talking about it...
	AI_Output(self,other, " DIA_Alrik_AskforDT_17_09 " );	// Okay, agreed.
	AI_Output(other,self, " DIA_Alrik_AskforDT_17_10 " );	// Then don't waste any time and head to my camp immediately.
	AI_Output(other,self, " DIA_Alrik_AskforDT_17_11 " );	// If anything, tell the guards at the gate the password - 'Dragon Treasures'. Then they will let you through.
	AI_Output(self,other, " DIA_Alrik_AskforDT_17_12 " );	// Okay, see you.
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Alric will now guard my camp. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	AlrikRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Alrik_INTOWER (C_Info)
{
	npc = VLK_438_Alrik;
	nr = 22;
	condition = DIA_Alrik_intower_condition;
	info = DIA_Alrik_intower_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};

func int DIA_Alrik_intower_condition()
{
	if((AlrikRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_Alrik_intower_info()
{
	AI_Output(other,self, " DIA_Alrik_InTower_OrcKap_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Alrik_InTower_OrcKap_01_01 " );	// So far everything is quiet.
};

instance DIA_Alrik_BackShield(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_BackShield_Condition;
	information = DIA_Alrik_BackShield_Info;
	permanent = FALSE;
	description = " Hold your shield back. " ;
};

func int DIA_Alrik_BackShield_Condition()
{
	if(Npc_HasItems(other,ItAr_Shield_01_Alrik) > 1)
	{
		return TRUE;
	};
};

func void DIA_Alrik_BackShield_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Alrik_WannaFight_Gold_15_00 " );	// Here, take this...
	B_GiveInvItems(other,self,ItAr_Shield_01_Alrik,1);
	Npc_RemoveInvItems(self,ItAr_Shield_01_Alrik,Npc_HasItems(self,ItAr_Shield_01_Alrik));
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Вовремя!
	AI_StopProcessInfos(self);
	B_SetFightSkills(self,30);
};
