
instance DIA_Marduk_Kap1_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap1_EXIT_Condition;
	information = DIA_Marduk_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap1_EXIT_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Marduk_NoEnter_PissOff (C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = DIA_Marduk_NoEnter_PissOff_Condition;
	information = DIA_Marduk_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Marduk_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Marduk_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Marduk_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};


instance DIA_Marduk_JOB(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_JOB_Condition;
	information = DIA_Marduk_JOB_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};

func int DIA_Marduk_JOB_Condition()
{
	return TRUE;
};

func void DIA_Marduk_JOB_Info()
{
	AI_Output(other,self, " DIA_Marduk_JOB_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Marduk_JOB_05_01 " );	// I prepare paladins to fight against Evil.
};


instance DIA_Marduk_work (C_Info)
{
	npc = KDF_505_Marduk;
	nr = 3;
	condition = DIA_Marduk_Work_Condition;
	information = DIA_Marduk_Work_Info;
	permanent = FALSE;
	description = " Can I do something for you, master? " ;
};


func int DIA_Marduk_Work_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Marduk_work_info()
{
	AI_Output(other,self, " DIA_Marduk_Arbeit_15_00 " );	// Can I do something for you, master?
	AI_Output(self,other, " DIA_Marduk_Arbeit_05_01 " );	// For me? No, I don't need your help. Better pray for the warriors of Innos who went to the Valley of Mines.
	MIS_MardukBeten = LOG_Running;
	B_StartOtherRoutine(Sergio,"WAIT");
	Log_CreateTopic(Topic_MardukBeten,LOG_MISSION);
	Log_SetTopicStatus(Topic_MardukBeten,LOG_Running);
	B_LogEntry(Topic_MardukBeten, " Master Marduk has no quests for me. He said I'd better go pray for the paladins. " );
};


instances of DIA_Marduk_Gebetet (C_Info)
{
	npc = KDF_505_Marduk;
	nr = 3;
	condition = DIA_Marduk_Prayed_Condition;
	information = DIA_Marduk_Prayed_Info;
	permanent = FALSE;
	description = " I prayed for the paladins. " ;
};


func int DIA_Marduk_Prayed_Condition()
{
	if((MIS_MardukBeten == LOG_Running) && Npc_KnowsInfo(other,PC_PrayShrine_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Prayed_Info()
{
	AI_Output(other,self, " DIA_Marduk_Gebetet_15_00 " );	// I prayed for the paladins.
	AI_Output(self,other, " DIA_Marduk_Gebetet_05_01 " );	// This is good. Now get back to your work.
	MIS_MardukBeten = LOG_SUCCESS;
	B_GivePlayerXP(XP_MardukBeten);
	B_StartOtherRoutine(Sergio,"START");
};


instances of DIA_Marduk_Evil (C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_Evil_Condition;
	information = DIA_Marduk_Evil_Info;
	permanent = TRUE;
	description = " What is 'Evil'? " ;
};


func int DIA_Marduk_Evil_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Evil_Info()
{
	AI_Output(other,self, " DIA_Marduk_Evil_15_00 " );	// What is 'Evil'?
	AI_Output(self,other, " DIA_Marduk_Evil_05_01 " );	// Evil is everywhere. It is the offspring of Beliar, the eternal enemy of Innos.
	AI_Output(self,other, " DIA_Marduk_Evil_05_02 " );	// This is an all-consuming darkness that tries to close the Light of Innos from us forever.
	AI_Output(self,other, " DIA_Marduk_Evil_05_03 " );	// Beliar - Lord of Darkness, Hatred and Destruction.
	AI_Output(self,other, " DIA_Marduk_Evil_05_04 " );	// Only those of us whose hearts burn with the Holy Fire of Innos bring the shining Light of Innos into our world and banish the darkness.
};


instances of DIA_Marduk_Pal (C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_Pal_Condition;
	information = DIA_Marduk_Pal_Info;
	permanent = FALSE;
	description = " But only magicians and novices live in the monastery? " ;
};


func int DIA_Marduk_Pal_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Pal_Info()
{
	AI_Output(other,self, " DIA_Marduk_Pal_15_00 " );	// But only magicians and novices live in the monastery?
	AI_Output(self,other, " DIA_Marduk_Pal_05_01 " );	// Right! Unlike our community, which honors the word of Innos...
	AI_Output(self,other, " DIA_Marduk_Pal_05_02 " );	// ...paladins honor, above all else, the deeds of our Lord.
	AI_Output(self,other, " DIA_Marduk_Pal_05_03 " );	// We are all representatives of Innos. But the paladins are his warriors, going into battle with his name on their lips, and glorifying his greatness.
};


instance DIA_Marduk_Kap2_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap2_EXIT_Condition;
	information = DIA_Marduk_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap2_EXIT_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap3_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap3_EXIT_Condition;
	information = DIA_Marduk_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap3_Hello(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 30;
	condition = DIA_Marduk_Kap3_Hello_Condition;
	information = DIA_Marduk_Kap3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Marduk_Kap3_Hello_Condition()
{
	if ((Chapter ==  3 ) && ((hero.guild ==  GIL_PAL ) || (hero.guild ==  GIL_DJG )))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_Hello_Info()
{
	AI_Output(self,other, " DIA_Marduk_Kap3_Hello_Info_05_00 " );	// Welcome, my son.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Marduk_Kap3_Hello_Info_05_01 " );	// Since when did you become a paladin?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Marduk_Kap3_Hello_Info_05_02 " );	// Where did you come from?
	};
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
	Info_AddChoice(DIA_Marduk_Kap3_Hello, " It's none of your business. " ,DIA_Marduk_Kap3_Hello_NotYourConcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello,"Недавно.",DIA_Marduk_Kap3_Hello_Soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello, " I came from the farm. " ,DIA_Marduk_Kap3_Hello_DJG);
	};
};

func void DIA_Marduk_Kap3_Hello_NotYourConcern()
{
	AI_Output(other,self, " DIA_Marduk_Kap3_Hello_NotYourConcern_15_00 " );	// It's none of your business.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Marduk_Kap3_Hello_NotYourConcern_05_01 " );	// (grouchily) A paladin should always be polite and humble. You must protect those who cannot protect themselves.
		AI_Output(self,other, " DIA_Marduk_Kap3_Hello_NotYourConcern_05_02 " );	// (grudgingly) It's a privilege, and you should be grateful that Innos gives you the opportunity. Think about it!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Marduk_Kap3_Hello_NotYourConcern_05_03 " );	// (angrily) Eh, before any rabble was not allowed into the monastery. Your behavior proves that those were good times.
		AI_Output(self,other, " DIA_Marduk_Kap3_Hello_NotYourConcern_05_04 " );	// (warning) I'm warning you, don't sow confusion here - you'll be punished immediately. We will not show false generosity.
	};
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_Soon()
{
	AI_Output(other,self, " DIA_Marduk_Kap3_Hello_Soon_15_00 " );	// More recently.
	AI_Output(self,other, " DIA_Marduk_Kap3_Hello_Soon_05_01 " );	// Then welcome. In this battle, we need all who have the courage to stand against evil.
	AI_Output(self,other, " DIA_Marduk_Kap3_Hello_Soon_05_02 " );	// The fate of all of us lies in the hands of people like you. May Innos give you the courage you need.
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_DJG()
{
	AI_Output(other,self, " DIA_Marduk_Kap3_Hello_DJG_15_00 " );	// I came from the farm.
	AI_Output(self,other, " DIA_Marduk_Kap3_Hello_DJG_05_01 " );	// Then welcome in the name of hospitality. I hope you appreciate it.
	AI_Output(self,other, " DIA_Marduk_Kap3_Hello_DJG_05_02 " );	// But don't forget that you're visiting, or you'll be in big trouble.
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};


instance DIA_Marduk_TrainPals(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 32;
	condition = DIA_Marduk_TrainPals_Condition;
	information = DIA_Marduk_TrainPals_Info;
	permanent = TRUE;
	description = " What can you teach me? " ;
};


var int Marduk_TrainPals_permanent;

func int DIA_Marduk_TrainPals_Condition()
{
	if((hero.guild == GIL_PAL) && (Marduk_TrainPals_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Marduk_TrainPals_Info()
{
	AI_Output(other,self, " DIA_Marduk_TrainPals_15_00 " );	// What can you teach me?
	AI_Output(self,other, " DIA_Marduk_TrainPals_05_01 " );	// Naturally, I can't teach you martial arts.
	AI_Output(self,other, " DIA_Marduk_TrainPals_05_02 " );	// But I can, however, convey the essence of Innos and his gifts to you.
	AI_Output(self,other, " DIA_Marduk_TrainPals_05_03 " );	// In addition, it is my duty to prepare you for the Consecration of the Sword.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//А магии?
	AI_Output(self,other, " DIA_Marduk_TrainPals_05_05 " );	// We only teach our magic here. You must learn paladin magic in the city.
	Info_ClearChoices(DIA_Marduk_TrainPals);
	Info_AddChoice(DIA_Marduk_TrainPals, " Maybe later. " ,DIA_Marduk_TrainPals_Later);
	Info_AddChoice(DIA_Marduk_TrainPals, " What do you mean by that? " ,DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice(DIA_Marduk_TrainPals, " What is Sword Consecration? " ,DIA_Marduk_TrainPals_Blessing);
};

func void DIA_Marduk_TrainPals_Later()
{
	AI_Output(other,self, " DIA_Marduk_TrainPals_Later_15_00 " );	// Maybe later.
	AI_Output(self,other, " DIA_Marduk_TrainPals_Later_05_01 " );	// Welcome anytime.
	Info_ClearChoices(DIA_Marduk_TrainPals);
};

func void DIA_Marduk_TrainPals_Meaning()
{
	AI_Output(other,self, " DIA_Marduk_TrainPals_Meaning_15_00 " );	// What do you mean by this?
	AI_Output(self,other, " DIA_Marduk_TrainPals_Meaning_05_01 " );	// When Innos left our world, he left a particle of his divine power to humanity.
	AI_Output(self,other, " DIA_Marduk_TrainPals_Meaning_05_02 " );	// Only a few people are allowed to use his power and bring justice to the world in his name.
	AI_Output(other,self, " DIA_Marduk_TrainPals_Meaning_15_03 " );	// What do you want to convey to me?
	AI_Output(self,other, " DIA_Marduk_TrainPals_Meaning_05_04 " );	// I can guide you on the right path so that you know the essence of Innos and follow this path.
};

func void DIA_Marduk_TrainPals_Blessing()
{
	AI_Output(other,self, " DIA_Marduk_TrainPals_Blessing_15_00 " );	// What is Sword Consecration?
	AI_Output(self,other, " DIA_Marduk_TrainPals_Blessing_05_01 " );	// Consecrating the Sword is one of the most sacred rituals of paladins.
	AI_Output(self,other, " DIA_Marduk_TrainPals_Blessing_05_02 " );	// During this ceremony, the holy power of Innos flows through the sword of the paladin and gives the sword unimaginable power.
	AI_Output(self,other, " DIA_Marduk_TrainPals_Blessing_05_03 " );	// A sword thus consecrated is the paladin's most valuable possession, and he will not part with it until the end of his days.
	Marduk_TrainPals_permanent = TRUE;
};


instance DIA_Marduk_SwordBlessing(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 33;
	condition = DIA_Marduk_SwordBlessing_Condition;
	information = DIA_Marduk_SwordBlessing_Info;
	permanent = TRUE;
	description = " I want to sanctify my sword. " ;
};


func int DIA_Marduk_SwordBlessing_Condition()
{
	if(Marduk_TrainPals_permanent == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Marduk_SwordBlessing_Info()
{
	AI_Output(other,self, " DIA_Marduk_SwordBlessing_15_00 " );	// I want to sanctify my sword.
	AI_Output(self,other, " DIA_Marduk_SwordBlessing_05_01 " );	// If you're determined to take this step, you'll first need to find a magical sword.
	AI_Output(self,other, " DIA_Marduk_SwordBlessing_05_02 " );	// Then you must return to this chapel and pray.
	AI_Output(self,other, " DIA_Marduk_SwordBlessing_05_03 " );	// During prayer and after a reasonable donation to our Lord Innos, you must ask Innos for favor and help in the battle against Evil.
	AI_Output(self,other, " DIA_Marduk_SwordBlessing_05_04 " );	// If Innos is favorable to you, your sword will be consecrated by our Master at the same moment.
	Info_ClearChoices(DIA_Marduk_SwordBlessing);
	Info_AddChoice(DIA_Marduk_SwordBlessing,Dialog_Back,DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice(DIA_Marduk_SwordBlessing, " What's the donation? " ,DIA_Marduk_SwordBlessing_Donation);
	Info_AddChoice(DIA_Marduk_SwordBlessing, " Where can I find a magic sword? " ,DIA_Marduk_SwordBlessing_OreBlade);
};

func void DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices(DIA_Marduk_SwordBlessing);
};

func void DIA_Marduk_SwordBlessing_Donation()
{
	AI_Output(other,self, " DIA_Marduk_SwordBlessing_Donation_15_00 " );	// What's the donation?
	AI_Output(self,other, " DIA_Marduk_SwordBlessing_Donation_05_01 " );	// Well, considering the favor that will be given to you, the amount of five thousand coins will be more than enough.
	AI_Output(self,other, " DIA_Marduk_SwordBlessing_Donation_05_02 " );	// Of course, you can donate more.
};

func void DIA_Marduk_SwordBlessing_OreBlade()
{
	AI_Output(other,self, " DIA_Marduk_SwordBlessing_OreBlade_15_00 " );	// Where can I find a magic sword?
	AI_Output(self,other, " DIA_Marduk_SwordBlessing_OreBlade_05_01 " );	// Try talking to Blacksmith Harad in town.
	AI_Output(self,other, " DIA_Marduk_SwordBlessing_OreBlade_05_02 " );	// He provides the paladins with magical blades while they are on the island.
	if (Npc_IsDead(Harad) ==  TRUE )
	{
		AI_Output(other,self, " DIA_Marduk_SwordBlessing_OreBlade_15_03 " );	// Harad is dead.
		AI_Output(self,other, " DIA_Marduk_SwordBlessing_OreBlade_05_04 " );	// I'm sorry, but then you'll have to wait to return to the mainland with the other paladins.
	};
};


instance DIA_Marduk_Kap3_PERM(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 39;
	condition = DIA_Marduk_Kap3_PERM_Condition;
	information = DIA_Marduk_Kap3_PERM_Info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int DIA_Marduk_Kap3_PERM_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_PERM_Info()
{
	AI_Output(other,self, " DIA_Marduk_Kap3_PERM_15_00 " );	// Any news?
	if(MIS_NovizenChase == LOG_Running)
	{
		AI_Output(self,other, " DIA_Marduk_Kap3_PERM_05_01 " );	// Yes, the enemy managed to infiltrate a traitor into our ranks.
		AI_Output(self,other, " DIA_Marduk_Kap3_PERM_05_02 " );	// He stole the Eye of Innos, one of our most important artifacts. And this is just the tip of the iceberg.
	};
	AI_Output(self,other, " DIA_Marduk_Kap3_PERM_05_04 " );	// (concerned) The enemy has apparently already entered the city.
	AI_Output(other,self, " DIA_Marduk_Kap3_PERM_15_05 " );	// What do you mean?
	AI_Output(self,other, " DIA_Marduk_Kap3_PERM_05_06 " );	// One of the paladins, Lothar, was killed in the street.
	AI_Output(self,other, " DIA_Marduk_Kap3_PERM_05_07 " );	// (angrily) Right in broad daylight! This has gone too far, but I'm afraid this is just the beginning.
	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
	Info_AddChoice(DIA_Marduk_Kap3_PERM,Dialog_Back,DIA_Marduk_Kap3_PERM_Back);
	Info_AddChoice(DIA_Marduk_Kap3_PERM, " What will happen now? " ,DIA_Marduk_Kap3_PERM_AndNow);
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM, " Bennett is not guilty. " ,DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}
	else
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM, " Was the killer caught? " ,DIA_Marduk_Kap3_PERM_Murderer);
	};
	if(MIS_NovizenChase == LOG_Running)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM, " Where did the thief go? " ,DIA_Marduk_Kap3_PERM_thief);
	};
};

func void DIA_Marduk_Kap3_PERM_BAck()
{
	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
};

func void DIA_Marduk_Kap3_PERM_AndNow()
{
	AI_Output(other,self, " DIA_Marduk_Kap3_PERM_AndNow_15_00 " );	// What will happen now?
	if(MIS_NovizenChase == LOG_Running)
	{
		AI_Output(self,other, " DIA_Marduk_Kap3_PERM_AndNow_05_01 " );	// We will chase the thief wherever he runs. We will find him, and he will receive the punishment he deserves.
		AI_Output(other,self, " DIA_Marduk_Kap3_PERM_AndNow_15_02 " );	// To do this, you first need to know who this thief is.
		AI_Output(self,other, " DIA_Marduk_Kap3_PERM_AndNow_05_03 " );	// We'll find out soon. And no matter how long it takes, we will find it.
		AI_Output(self,other, " DIA_Marduk_Kap3_PERM_AndNow_05_04 " );	// I swear by Innos.
	}
	else
	{
		AI_Output(self,other, " DIA_Marduk_Kap3_PERM_AndNow_05_05 " );	// Murder, and even more so a paladin, is undoubtedly one of the heaviest crimes.
		AI_Output(self,other, " DIA_Marduk_Kap3_PERM_AndNow_05_06 " );	// The killer will most certainly be sentenced to death.
	};
};

func void DIA_Marduk_Kap3_PERM_BennetisNotGuilty()
{
	AI_Output(other,self, " DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00 " );	// Bennet is not guilty. The witness lied.
	AI_Output(self,other, " DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01 " );	// How do you know this?
	AI_Output(other,self, " DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02 " );	// I found evidence.
	AI_Output(self,other, " DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03 " );	// Sometimes I think betrayal and greed are our greatest enemies.
};

func void DIA_Marduk_Kap3_PERM_Murderer()
{
	AI_Output(other,self, " DIA_Marduk_Kap3_PERM_Murderer_15_00 " );	// Was the killer caught?
	AI_Output(self,other, " DIA_Marduk_Kap3_PERM_Murderer_05_01 " );	// Luckily, yes. It turned out to be one of the thugs from Onar's farm.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//Кто?
	AI_Output(self,other, " DIA_Marduk_Kap3_PERM_Murderer_05_03 " );	// I don't know his name. But among the mercenaries, there are definitely individuals from whom such a thing can be expected.
};

func void DIA_Marduk_Kap3_PERM_thief()
{
	AI_Output(other,self, " DIA_Marduk_Kap3_PERM_thief_15_00 " );	// Where did the thief run?
	AI_Output(self,other, " DIA_Marduk_Kap3_PERM_thief_05_01 " );	// I don't know, he ran out of the gate like a man possessed and disappeared.
	AI_Output(self,other, " DIA_Marduk_Kap3_PERM_thief_05_02 " );	// No matter where he hides, under what stone he hid, Innos' wrath will strike him and burn his black heart.
};


instance DIA_Marduk_Kap4_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap4_EXIT_Condition;
	information = DIA_Marduk_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap4U5_PERM(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = DIA_Marduk_Kap4U5_PERM_Condition;
	information = DIA_Marduk_Kap4U5_PERM_Info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int DIA_Marduk_Kap4U5_PERM_Condition()
{
	if ((chapter ==  4 ) || (chapter ==  5 ))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4U5_PERM_Info()
{
	AI_Output(other,self, " DIA_Marduk_Kap4U5_PERM_15_00 " );	// Any news?
	AI_Output(self,other, " DIA_Marduk_Kap4U5_PERM_05_01 " );	// No, oh my god, the situation is still very critical.
};


instance DIA_Marduk_Kap5_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap5_EXIT_Condition;
	information = DIA_Marduk_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap5_EXIT_Condition()
{
	if (Chapter >=  5 )
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_PICKPOCKET(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 900;
	condition = DIA_Marduk_PICKPOCKET_Condition;
	information = DIA_Marduk_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Marduk_PICKPOCKET_Condition()
{
	return  C_Robbery ( 36 , 40 );
};

func void DIA_Marduk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
	Info_AddChoice(DIA_Marduk_PICKPOCKET,Dialog_Back,DIA_Marduk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Marduk_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Marduk_PICKPOCKET_DoIt);
};

func void DIA_Marduk_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};

func void DIA_Marduk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};


instance DIA_MARDUK_CANTEACHARMOR(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = dia_marduk_canteacharmor_condition;
	information = dia_marduk_canteacharmor_info;
	permanent = TRUE;
	description = " (ask about ore armor) " ;
};


func int dia_marduk_canteacharmor_condition()
{
	if((MARDUK_CANTEACHARMOR == FALSE) && ((HARADTELLSMARDUK_P1 == TRUE) || (HARADTELLSMARDUK_P2 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_marduk_canteacharmor_info()
{
	AI_Output(other,self, " DIA_Marduk_CanTeachArmor_01_00 " );	// I've heard that Firebenders have the knowledge to give a paladin's ore armor a divine essence.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_01 " );	// And from whom did you hear this, my son?
	AI_Output(other,self, " DIA_Marduk_CanTeachArmor_01_02 " );	// Blacksmith Harad told me about it.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_03 " );	// If you weren't a paladin, I probably wouldn't have revealed this sacred secret to you.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_04 " );	// But you are the Warrior of Innos...
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_05 " );	// By mastering this knowledge, you will gain Innos' most precious gift.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_07 " );	// The essence of this knowledge lies in the consecration of the paladin's ore armor through the sacred prayer of the Chosen One to Innos.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_08 " );	// Consecration of armor is the most sacred ritual for a paladin. And only a select few can make it happen.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_10 " );	// During this ceremony, the sacred power and wisdom of Innos flows through the armor, imbuing it with magical power.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_12 " );	// After that, you won't be able to take off this armor and put on another one just like that, because then death will overtake you!
	AI_Output(other,self, " DIA_Marduk_CanTeachArmor_01_15 " );	// And what should be done to become the Chosen One of Innos?
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_16 " );	// Innos himself decides who is worthy of his gift and who is not.
	AI_Output(other,self, " DIA_Marduk_CanTeachArmor_01_17 " );	// And what is needed for this ritual?
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_19 " );	// First you need ore paladin armor - it doesn't matter which.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_20 " );	// Then you should come with them to the chapel for prayer, having previously studied the prayer of the Chosen One.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_21 " );	// During the prayer and after the offering to our master, you must ask Innos for his mercy and leadership in the battle against evil.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_22 " );	// If Innos decides that you are worthy of his gift, then he will bestow his divine grace on you and sanctify your armor.
	AI_Output(other,self, " DIA_Marduk_CanTeachArmor_01_24 " );	// And what should I do if Innos considers that I am not worthy of this gift?
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_25 " );	// Spend all your time praying to Innos, and maybe one day he will hear your prayers.
	AI_Output(other,self, " DIA_Marduk_CanTeachArmor_01_26 " );	// Where can I find the words of the Chosen One's prayer, master?
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_27 " );	// You don't have to look for them. I will give you a book in which they are all written. Just read it and memorize the words of the prayer.
	B_GiveInvItems(self,other,itwr_innospray,1);
	AI_Output(other,self, " DIA_Marduk_CanTeachArmor_01_29 " );	// Thank you master.
	AI_Output(other,self, " DIA_Marduk_CanTeachArmor_01_30 " );	// What offering should I offer to Innos?
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_31 " );	// I think a certain amount of gold will be enough. However, I can't tell you exactly how much. This is decided by Innos himself.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_33 " );	// That's all you need to know about this sacred ritual. Now go, my son.
	AI_Output(self,other, " DIA_Marduk_CanTeachArmor_01_34 " );	// May Innos not leave you without his mercy!
	AI_StopProcessInfos(self);
	B_LogEntry( TOPIC_MAGICINNOSARMOR , " Firemage Marduk told me about the sacred ritual of consecrating a paladin's ore armor and what needs to be done to make it happen. " );
	MARDUK_CANTEACHARMOR = TRUE;
};


instances DIA_MARDUK_TELLSERGIO (C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = dia_marduk_tellsergio_condition;
	information = dia_marduk_tellsergio_info;
	permanent = FALSE;
	description = " Where is the paladin Sergio? " ;
};


func int dia_marduk_tellsergio_condition()
{
	if((MIS_FARIONTEST == LOG_Running) && (SERGIOISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_tellsergio_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Marduk_TellSergio_01_00 " );	// Where is the paladin Sergio?
	AI_Output(self,other, " DIA_Marduk_TellSergio_01_01 " );	// You won't find him here, my son. He recently decided to leave our monastery.
	B_LogEntry( TOPIC_FARIONTEST , " Paladin Sergio recently left the monastery, going in an unknown direction. " );
};


instance DIA_MARDUK_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_runemagicnotwork_condition;
	information = dia_marduk_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_marduk_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Marduk_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_Marduk_RuneMagicNotWork_01_01 " );	// That's just the point, no! And I can't understand why I can't use them.
	AI_Output(self,other, " DIA_Marduk_RuneMagicNotWork_01_03 " );	// Apparently, it affected us all. The other Firebenders also fail to do anything.
	AI_Output(other,self, " DIA_Marduk_RuneMagicNotWork_01_04 " );	// Got it.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Firebenders have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};

DIA_MARDUK_TREVIUS (C_Info) instances
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_trevius_condition;
	information = dia_marduk_trevius_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_marduk_trevius_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (COUNT_TREVIUS_DIALOG == TRUE))
	{
		return TRUE;
	};
};

func void dia_marduk_trevius_info()
{
	AI_Output(self,other, " DIA_Marduk_TREVIUS_01_00 " );	// So you're looking for Xardas' documents?
	AI_Output(other,self, " DIA_Marduk_TREVIUS_01_01 " );	// Well, actually, yes. Is there something you want to tell me?
	AI_Output(other,self, " DIA_Marduk_TREVIUS_01_02 " );	// My previous interlocutors almost burned me with their one look at the mention of Xardas.
	AI_Output(self,other, " DIA_Marduk_TREVIUS_01_03 " );	// It's not customary for us to talk about such things...
	AI_Output(self,other, " DIA_Marduk_TREVIUS_01_04 " );	// Especially with dark magicians and their henchmen.
	AI_Output(self,other, " DIA_Marduk_TREVIUS_01_05 " );	// But this case is quite special. Our brother Trevius is missing.
	AI_Output(self,other, " DIA_Marduk_TREVIUS_01_06 " );	// He was studying the formulas left by Xardas within the walls of the monastery.
	AI_Output(self,other, " DIA_Marduk_TREVIUS_01_07 " );	// He's been gone for a long time, and I'm afraid we'll never see him alive. If you find it, you will find your manuscripts.
	AI_Output(self,other, " DIA_Marduk_TREVIUS_01_08 " );	// And please tell me what happened to Trevius! Everyone, go.
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
	Wld_InsertNpc(KDF_512_Trevius,"NW_FARM2_TAVERNCAVE1_02");
	B_KillNpc(KDF_512_Trevius);
	Wld_InsertNpc(Demon,"NW_FARM2_TAVERNCAVE1_02");
};

instances DIA_MARDUK_TREVIUS1 (C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_trevius1_condition;
	information = dia_marduk_trevius1_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_marduk_trevius1_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_SUCCESS) || (Npc_HasItems(hero,itwr_xardasdocs_3) >= 1))
	{
		return TRUE;
	};
};

func void dia_marduk_trevius1_info()
{
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_Marduk_TREVIUS1_01_00 " );	// Did you find out anything about Trevius?
	AI_Output(other,self, " DIA_Marduk_TREVIUS1_01_01 " );	// Yes, he's dead. I found it near some strange rocks in the western forest.
	AI_Output(self,other, " DIA_Marduk_TREVIUS1_01_02 " );	// Here's how. May Innos keep his soul!
	AI_Output(self,other, " DIA_Marduk_TREVIUS1_01_03 " );	// Thanks for stopping by. Even though you are a dark magician, I can't help feeling that you came to do good in this world.
	AI_Output(self,other, " DIA_Marduk_TREVIUS1_01_04 " );	// Take your reward and go.
	B_GiveInvItems(self,hero,ItPo_Mana_03,1);
	AI_StopProcessInfos(self);
};

instance DIA_MARDUK_LORDS_HORINIS (C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_lords_horinis_condition;
	information = dia_marduk_lords_horinis_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_marduk_lords_horinis_condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void dia_marduk_lords_horinis_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_01 " );	// Brother, I feel that the forces of evil have suffered tremendous damage!
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_02 " );	// Everything looks as if some brave warrior sent several terrible and dangerous creatures into the realm of Beliar.
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_03 " );	// This is a big win, and I'm filled with joy when I think about it.
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_04 " );	// Do you happen to know anything about this?
	Info_ClearChoices(dia_marduk_lords_horinis);
	Info_AddChoice(dia_marduk_lords_horinis, " So this is my doing! " ,dia_marduk_lords_horinis_yes);
	Info_AddChoice(dia_marduk_lords_horinis, " Понятия не имею. " ,dia_marduk_lords_horinis_no);
};

func void dia_marduk_lords_horinis_yes()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Marduk_LORDS_HORINIS_01_05 " );	// So this is my doing!
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_06 " );	// True? Well, it looks like I have no choice but to reward you for this work.
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_07 " );	// Take this gold as a token of your gratitude.
	B_GiveInvItems(self,hero,ItMi_Gold,1000);
	AI_Output(other,self, " DIA_Marduk_LORDS_HORINIS_01_08 " );	// That's a huge amount!
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_09 " );	// You deserve it. Go brother, and may Innos be with you in all your undertakings.
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	AI_StopProcessInfos(self);
};

func void dia_marduk_lords_horinis_no()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Marduk_LORDS_HORINIS_01_10 " );	// I have no idea.
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_11 " );	// True? But I have a strong feeling that this is precisely your merit.
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_12 " );	// Do not be modest, because it was you who created something incredible for the glory of Innos and the Holy Fire?
	AI_Output(other,self, " DIA_Marduk_LORDS_HORINIS_01_13 " );	// Okay, you can't fool you.
	AI_Output(self,other, " DIA_Marduk_LORDS_HORINIS_01_14 " );	// I knew! Thank you very much, brother. You did a great job for the whole island. Get your reward too, you deserve it.

	if ((hero.guild ==  GIL_KDF ) && (hero.guild ==  GIL_KDW ) && (hero.guild ==  GIL_KDM ) && (hero.guild ==  GIL_GUR ))
	{
		B_GiveInvItems(self,hero,ItPo_Perm_Mana,1);
	}
	else
	{
		B_GiveInvItems(self,hero,ItPo_Perm_Health,1);
	};

	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	AI_StopProcessInfos(self);
};
