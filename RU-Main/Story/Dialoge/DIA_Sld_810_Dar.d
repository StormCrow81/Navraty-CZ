

instance DIA_Dar_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_EXIT_Condition;
	information = DIA_Dar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Dar_Hello (C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_Hallo_Condition;
	information = DIA_Dar_Hello_Info;
	permanent = FALSE;
	description = " What are you smoking? " ;
};


func int DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Dar_Hello_Info()
{
	AI_Output(other,self, " DIA_Dar_Hallo_15_00 " );	// What are you smoking?
	AI_Output(self,other, " DIA_Dar_Hallo_03_01 " );	// Want to puff?
	Info_ClearChoices(DIA_Dar_Hallo);
	Info_AddChoice(DIA_Dar_Hello, " Нет. " ,DIA_Dar_Hello_No);
	Info_AddChoice(DIA_Dar_Hallo, " Of course! " ,DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Dar_Hallo_Ja_15_00 " );	// Of course!
	CreateInvItem(other,ItMi_Joint);
	B_UseItem(other,ItMi_Joint);
	AI_Output(self,other, " DIA_Dar_Hallo_Ja_03_01 " );	// Not bad, huh?
	AI_Output(other,self, " DIA_Dar_Hallo_Ja_15_02 " );	// Where did you get this herb?
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other, " DIA_Dar_Hallo_Ja_03_03 " );	// I have my sources... (chuckles)
	Info_ClearChoices(DIA_Dar_Hallo);
};

func void DIA_Dar_Hello_No()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Nein_15_00");	//Нет.
	Info_ClearChoices(DIA_Dar_Hallo);
};


var int Dar_once;

instance DIA_Dar_PERM(C_Info)
{
	npc = Sld_810_Dar;
	nr = 2;
	condition = DIA_Dar_PERM_Condition;
	information = DIA_Dar_PERM_Info;
	permanent = TRUE;
	description = " Do you do anything else besides smoke? " ;
};


func int DIA_Dar_PERM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Give_Hello ))
	{
		return TRUE;
	};
};

func void DIA_Dar_PERM_Info()
{
	AI_Output(other,self, " DIA_Dar_PERM_15_00 " );	// Do you do anything else other than smoke?

	if ((Dar_LostAgainstCipher ==  TRUE ) && (Dar_once ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Dar_PERM_03_01 " );	// Sometimes I let some vindictive swamp junkies give me a thrashing...
		Dar_once = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Dar_PERM_03_02 " );	// Not currently.
	};
};


instance DIA_Dar_WannaJoin(C_Info)
{
	npc = Sld_810_Dar;
	nr = 3;
	condition = DIA_Dar_WannaJoin_Condition;
	information = DIA_Dar_WannaJoin_Info;
	permanent = FALSE;
	description = " I want to join the mercenaries. Do you mind? " ;
};


func int DIA_Dar_WannaJoin_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Give_Hello ) && ( other . guild ==  GIL_NONE ) && ( Give_LostAgainstCipher ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Dar_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Dar_WannaJoin_15_00 " );	// I want to join the mercenaries. You do not mind, do you?
	AI_Output(self,other, " DIA_Dar_WannaJoin_03_01 " );	// I don't care.
};


instances of DIA_Dar_DuDieb (C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_DuDieb_Condition;
	information = DIA_Dar_DuDieb_Info;
	permanent = FALSE;
	description = " Cypher told me that someone stole a bale of swamp grass from him... " ;
};


func int DIA_Dar_DuDieb_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dar_DuDieb_Info()
{
	AI_Output(other,self, " DIA_Dar_DuDieb_15_00 " );	// Cypher told me that someone stole a bale of swamp grass from him.
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//...(посмеиваясь)
	AI_Output(other,self, " DIA_Dar_DuDieb_15_02 " );	// You don't know anything about this?
	AI_Output(self,other, " DIA_Dar_DuDieb_03_03 " );	// (very short) No.
	Dar_Suspicious = TRUE ;
};


instance DIA_Create_YouPackage (C_Info) .
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_WoPaket_Condition;
	information = DIA_Create_YourPackage_Info;
	permanent = TRUE;
	description = " Where is the bale? " ;
};


func int DIA_Dar_WoPaket_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Dar_DuDieb) && (Dar_Dieb ==  FALSE ) && (MIS_Cipher_Packet == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Get_YouPacket_Info()
{
	AI_Output(other,self, " DIA_Dar_WoPaket_15_00 " );	// (threateningly) Where's the bale?

	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other, " DIA_Dar_WoPaket_03_01 " );	// Okay, okay, okay. I sold it to some idiot in town.
		AI_Output(self,other, " DIA_Dar_WoPaket_03_02 " );	// It was in the harbor. I don't remember what he looked like.
		AI_Output(other,self, " DIA_Dar_WoPaket_15_03 " );	// Maybe you need another good shake?
		AI_Output(self,other, " DIA_Dar_WoPaket_03_04 " );	// To be honest, I was stoned in the trash. I have absolutely no idea what this guy looked like.
		AI_Output(self,other, " DIA_Dar_WoPaket_03_05 " );	// It was in the harbor near the shipbuilders. That's all I remember.
		dar_thief = TRUE ;
		B_LogEntry(Topic_CipherPaket, " Dar admitted that he stole a bale of grass. He sold it in the port district of Khorinis, near the shipbuilders. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Dar_WoPaket_03_06 " );	// What can I know?
	};
};


instance DIA_Dar_AufsMaul (C_Info)
{
	npc = Sld_810_Dar;
	nr = 5;
	condition = DIA_Dar_AufsMaul_Condition;
	information = DIA_Dar_AufsMaul_Info;
	permanent = FALSE;
	description = " I'll kick this information out of you! " ;
};


func int DIA_Dar_AufsMaul_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Dar_DuDieb ) && ( Date_Dieb ==  FALSE ) && ( self . aivar [ AIV_LastFightAgainstPlayer ] !=  FIGHT_LOST ))
	{
		return TRUE;
	};
};

func void DIA_Dar_AufsMaul_Info()
{
	AI_Output(other,self, " DIA_Dar_AufsMaul_15_00 " );	// I'll kick this information out of you!
	AI_Output(self,other, " DIA_Dar_AufsMaul_03_01 " );	// Relax. I'm too stoned to fight you!
	B_GiveInvItems(self,other,ItMi_Joint,1);
	AI_Output(self,other, " DIA_Dar_AufsMaul_03_02 " );	// Here, take a puff!
};


instance DIA_Dar_comrade pig (C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_comrade pig_Condition;
	information = DIA_Dar_comrade pig_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dar_comrade pig_Condition()
{
	if(Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] = FALSE ;
		return TRUE;
	};
};

func void DIA_Dar_comrade_pig_Info()
{
	AI_Output(self,other, " DIA_Dar_Kameradenschwein_03_00 " );	// Talker! You told Cypher I took his weed!
	if(Npc_KnowsInfo(other,DIA_Dar_WannaJoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other, " DIA_Dar_Kameradenschwein_03_01 " );	// There's no way I'm voting for you.
	};
};


instances of DIA_Dar_Pilztabak (C_Info)
{
	npc = Sld_810_Dar;
	nr = 6;
	condition = DIA_Dar_Pilztabak_Condition;
	information = DIA_Dar_Pilztabak_Info;
	permanent = FALSE;
	description = " Have you ever tried mushroom tobacco? " ;
};


func int DIA_Dar_Pilztabak_Condition()
{
	if (Npc_HasItems(other,ItMi_PilzTabak) >  0 )
	{
		return TRUE;
	};
};

func void DIA_Dar_Pilztabak_Info()
{
	AI_Output(other,self, " DIA_Dar_Pilztabak_15_00 " );	// Have you ever tried mushroom tobacco?
	AI_Output(self,other, " DIA_Dar_Pilztabak_03_01 " );	// Sounds interesting. Give it here.
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	AI_Output(self,other, " DIA_Dar_Pilztabak_03_02 " );	// Ok, let's try...
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other, " DIA_Dar_Pilztabak_03_03 " );	// Have you ever smoked it yourself?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//Ну...
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other, " DIA_Dar_Pilztabak_03_05 " );	// Smoked or not?
	AI_Output(other,self, " DIA_Dar_Pilztabak_15_06 " );	// I had no time...
	AI_Output(self,other, " DIA_Dar_Pilztabak_03_07 " );	// Oh, damn!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other, " DIA_Dar_Pilztabak_03_08 " );	// Holy Robar!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Dar_Pilztabak_03_09 " );	// This shit is too cool! Don't even bother trying!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Dar_KAP3_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP3_EXIT_Condition;
	information = DIA_Dar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP4_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP4_EXIT_Condition;
	information = DIA_Dar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_ORCRING(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_ORCRING_Condition;
	information = DIA_Dar_ORCRING_Info;
	description = " Looks like some of the mercenaries have disappeared. " ;
};


func int DIA_Dar_ORCRING_Condition()
{
	if (Chapter >=  4 )
	{
		return TRUE;
	};
};

func void DIA_Dar_ORCRING_Info()
{
	AI_Output(other,self, " DIA_Dar_ORCRING_15_00 " );	// Looks like some of the mercenaries have disappeared.
	AI_Output(self,other, " DIA_Dar_ORCRING_03_01 " );	// Of course. This is true. Silvio is now very far away, and he took half the people with him.
	AI_Output(self,other, " DIA_Dar_ORCRING_03_02 " );	// I don't care. I'll have a better chance of showing myself and earning Lee's respect. To do this, you need to do something loud.
	AI_Output(self,other, " DIA_Dar_ORCRING_03_03 " );	// If I can bring proof that I'm a really tough guy, maybe I can even become one of Lee's bodyguards.
	Info_ClearChoices(DIA_Dar_ORCRING);
	Info_AddChoice(DIA_Dar_ORCRING, " I'm not interested. " ,DIA_Dar_ORCRING_no);
	Info_AddChoice(DIA_Dar_ORCRING, " Cool? ARE YOU? " ,DIA_Dar_ORCRING_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		Info_AddChoice(DIA_Dar_ORCRING, " So what should it look like? " ,DIA_Dar_ORCRING_wie);
	};
};

func void DIA_Dar_ORCRING_necken()
{
	AI_Output(other,self, " DIA_Dar_ORCRING_necken_15_00 " );	// Cool guy? You?
	AI_Output(self,other, " DIA_Dar_ORCRING_necken_03_01 " );	// (angrily) Oh, okay, shut up. Who are you anyway?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Dar_ORCRING_necken_03_02 " );	// Some pouty dupe from the city. You don't get anything at all.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Dar_ORCRING_necken_03_03 " );	// You've only been here a couple of days, and you've already turned your nose up above the clouds.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Dar_ORCRING_necken_03_04 " );	// Who do you want to scare with this magical nonsense of yours? Just not me.
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Dar_ORCRING_necken_03_05 " );	// And even if you think about it, crushing your skull is exactly what I need to earn the respect of Lee and his guys.
		Info_ClearChoices(DIA_Dar_ORCRING);
		Info_AddChoice(DIA_Dar_ORCRING, " I don't have time for this nonsense. " ,DIA_Dar_ORCRING_necken_no);
		Info_AddChoice(DIA_Dar_ORCRING, " Okay. Try it. " ,DIA_Dar_ORCRING_necken_schlagen);
	}
	else
	{
		AI_Output(self,other, " DIA_Dar_ORCRING_necken_03_06 " );	// You wait. I'll find a way to impress Lee.
	};
};


var int Dar_FightAgainstPaladin;

func void DIA_Dar_ORCRING_tease_beat()
{
	Dar_FightAgainstPaladin = TRUE ;
	AI_Output(other,self, " DIA_Dar_ORCRING_necken_schlagen_15_00 " );	// Okay. Try.
	AI_Output(self,other, " DIA_Dar_ORCRING_necken_schlagen_03_01 " );	// Oh, I can't wait.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Dar_ORCRING_necken_no()
{
	AI_Output(other,self, " DIA_Dar_ORCRING_necken_no_15_00 " );	// I don't have time for this nonsense.
	AI_Output(self,other, " DIA_Dar_ORCRING_necken_no_03_01 " );	// Oh, yes. You are a knight of justice, how could I forget. It's a pity. I thought you had more courage.
	AI_StopProcessInfos(self);
};

func void DIA_Dar_ORCRING_wie()
{
	AI_Output(other,self, " DIA_Dar_ORCRING_wie_15_00 " );	// How should it look like?
	AI_Output(self,other, " DIA_Dar_ORCRING_wie_03_01 " );	// I don't know exactly. Some kind of orc trophy would do just fine.
	AI_Output(self,other, " DIA_Dar_ORCRING_wie_03_02 " );	// Something like the emblem of the orc leader, or something like that. Banner, sleeve patch or ring, well, you get the idea.
	AI_Output(self,other, " DIA_Dar_ORCRING_wie_03_03 " );	// I can't impress without it. It is obvious.
	Log_CreateTopic(TOPIC_Dar_BringOrcEliteRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing,LOG_Running);
	B_LogEntry(TOPIC_Dar_BringOrcEliteRing, " Dar wants to be a big shot in the mercenary ranks. He wants to get the Orc trophy. A banner, an arm patch, a ring, or something. " );
	MIS_Dar_BringOrcEliteRing = LOG_Running;
	Info_ClearChoices(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no()
{
	AI_Output(other,self, " DIA_Dar_ORCRING_no_15_00 " );	// I'm not interested.
	AI_Output(self,other, " DIA_Dar_ORCRING_no_03_01 " );	// (angrily) Of course not. I would be very surprised if this were not the case.
	Info_ClearChoices(DIA_Dar_ORCRING);
};


instance DIA_Dar_FIGHTAGAINSTPALOVER (C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	info = DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important = TRUE;
};


func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition()
{
	if((Dar_FightAgainstPaladin == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info()
{
	AI_Output(self,other, " DIA_Dar_FIGHTAGAINSTPALOVER_03_00 " );	// Okay, I know Lee won't get too mad if I fight you again.
	AI_Output(self,other, " DIA_Dar_FIGHTAGAINSTPALOVER_03_01 " );	// I don't want to make enemies here. So let's forget about it, okay?
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


DIA_Dar_BRINGORCELITERING (C_Info) instance
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_BRINGORCELITERING_Condition;
	information = DIA_Dar_BRINGORCELITERING_Info;
	description = " I brought the orc trophy you were looking for. " ;
};


func int DIA_Dar_BRINGORCELITERING_Condition()
{
	if((MIS_Dar_BringOrcEliteRing == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)) && Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};

func void DIA_Dar_BRINGORCELITERING_Info()
{
	AI_Output(other,self, " DIA_Dar_BRINGORCELITERING_15_00 " );	// I brought the orc trophy you were looking for.
	AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_03_01 " );	// What did you bring me there?
	AI_Output(other,self, " DIA_Dar_BRINGORCELITERING_15_02 " );	// Orc leader's ring.
	AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_03_03 " );	// Wow, in that case... What do you want for him?
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING, " What can you offer me? " ,DIA_Dar_BRINGORCELITERING_was);

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Dar_BRINGORCELITERING, " Pay me gold. " ,DIA_Dar_BRINGORCELITERING_geld);
	};
};

func void DIA_Dar_BRINGORCELITERING_money()
{
	AI_Output(other,self, " DIA_Dar_BRINGORCELITERING_geld_15_00 " );	// Pay me in gold.

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_geld_03_01 " );	// Mmm...sixty gold coins?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//Что?
	};

	AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_geld_03_03 " );	// Okay! I will give you one hundred and twenty coins.

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_geld_03_04 " );	// Take them or keep this ring.
	};

	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING, " This is not enough for me. " ,DIA_Dar_BRINGORCELITERING_geld_no);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING, " Agreed. " ,DIA_Dar_BRINGORCELITERING_geld_ok);
};

func void DIA_Dar_BRINGORCELITERING_money_ok()
{
	AI_Output(other,self, " DIA_Dar_BRINGORCELITERING_geld_ok_15_00 " );	// Agreed. Hold the ring.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_geld_ok_03_01 " );	// Thank you. Can't wait to hear what others have to say about it.
	CreateInvItems(self,ItMi_Gold,120);
	B_GiveInvItems(self,other,ItMi_Gold,120);
	B_GivePlayerXP(200);
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_money_no()
{
	AI_Output(other,self, " DIA_Dar_BRINGORCELITERING_geld_no_15_00 " );	// This is not enough.
	AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_geld_no_03_01 " );	// I think that's too much. I don't like this business. I don't want to offend.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was()
{
	AI_Output(other,self, " DIA_Dar_BRINGORCELITERING_was_15_00 " );	// What can you offer me?
	AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_was_03_01 " );	// Either take the money, or take this amulet that I... well, let's say, acquired recently.
	AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_was_03_02 " );	// It will increase your dexterity. I experienced it myself.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING, " Give me money. " ,DIA_Dar_BRINGORCELITERING_geld);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING, " Give me an amulet. " ,DIA_Dar_BRINGORCELITERING_was_am);
};

func void DIA_Dar_BRINGORCELITERING_was_am()
{
	AI_Output(other,self, " DIA_Dar_BRINGORCELITERING_was_am_15_00 " );	// Give me the amulet.
	AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_was_am_03_01 " );	// Of course. May he bring you joy. Now give me this ring.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	CreateInvItems(self,ItAm_Dex_01,1);
	B_GiveInvItems(self,other,ItAm_Dex_01,1);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);
	AI_Output(self,other, " DIA_Dar_BRINGORCELITERING_was_am_03_02 " );	// Now I'm happy.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};


instance DIA_Dar_KAP5_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP5_EXIT_Condition;
	information = DIA_Dar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP6_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP6_EXIT_Condition;
	information = DIA_Dar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_PICKPOCKET(C_Info)
{
	npc = Sld_810_Dar;
	nr = 900;
	condition = DIA_Dar_PICKPOCKET_Condition;
	information = DIA_Dar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Dar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 67 , 35 );
};

func void DIA_Dar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
	Info_AddChoice(DIA_Dar_PICKPOCKET,Dialog_Back,DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dar_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

