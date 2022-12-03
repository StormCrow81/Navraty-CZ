

const int BONUSSTR = 15;
const int BONUSDEX = 15;
const int BONUSMAN = 100;
const int BONUSHEA = 150;

instance DMT_1297_STONNOS_EXIT(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 999;
	condition = dmt_1297_stonnos_exit_condition;
	information = dmt_1297_stonnos_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1297_stonnos_exit_condition()
{
	if((GUARDIANADEPT == TRUE) && (CHOOSENATUREISDONE == FALSE))
	{
		return  FALSE ;
	};
	return TRUE;
};

func void dmt_1297_stonnos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1297_STONNOS_HELLO(C_Info)
{
	npc = dmt_1297_stonnos;
	condition = dmt_1297_stonnos_hello_condition;
	information = dmt_1297_stonnos_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1297_stonnos_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (WAKON_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_hello_info()
{
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_00 " );	// (imperiously) The time has finally come for you and me to meet, mortal!
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_01 " );	// I will not hide from you that I was looking forward to our meeting with great interest.
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_02 " );	// And I have no doubt that you also, in turn, guessed who I am and why I am here now ... (powerfully) Didn't you?
	AI_Output(other,self, " DMT_1297_Stonnos_Hello_03 " );	// I think you are Guardian Stonnos, the most powerful of the Guardians of the Elements and head of the divine Circle of Guardians.
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_04 " );	// That's right, man.
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_07 " );	// So. It's time for you to finish the path you started on and finally become who you were meant to be.
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_08 " );	// But first, you will need to pass another test, which we, the Guardians, refer to as the Test of Faith!
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_09 " );	// By passing it, you will prove that you are fully aware of your choice and are ready to sacrifice everything for the sake of bringing our sacred plans to life.
	Info_ClearChoices(dmt_1297_stonnos_hello);
	Info_AddChoice(dmt_1297_stonnos_hello, " What is my Test of Faith, master? " ,dmt_1297_stonnos_hello_test);
};

func void dmt_1297_stonnos_hello_test()
{
	AI_Output(other,self, " DMT_1297_Stonnos_Hello_11 " );	// What is my Test of Faith, master?
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_12 " );	// You need to find and bring me four ancient magical artifacts called Orbs.
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_13 " );	// These ancient relics are the source of the magic of each of the existing elements and give power over their creations.
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_14 " );	// However, the Orbs themselves are not the creation of the gods or the forces of nature themselves. Their essence lies solely in magic!
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_15 " );	// Therefore, the appearance of these artifacts in this world is usually caused by the strongest magical unrest - and nothing more.
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_20 " );	// By destroying the magical barrier and destroying the Sleeper, you caused a powerful magical explosion, which in turn gave rise to the appearance of magical spheres in this part of the world.
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_24 " );	// Each Sphere has its own will and surrounds itself with various creatures for its own protection.
	AI_Output(self,other, " DMT_1297_Stonnos_Hello_28 " );	// Now go man! And remember that your future depends on your actions.
	AI_StopProcessInfos(self);
	MIS_STONNOSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_STONNOSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_STONNOSTEST,LOG_Running);
	B_LogEntry( TOPIC_STONNOSTEST , " I met the chief Guardian, Stonnos, who appointed me the Test of Faith. After passing it, I will be accepted as an adherent of the Circle of Guardians. To do this, I need to find and bring four magical Elemental Spheres to Stonnos. Finding them will not be easy and extremely dangerous. But for me not get used to difficulties? " );
};


instance DMT_1297_STONNOS_TESTFAIL(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 1;
	condition = dmt_1297_stonnos_testfail_condition;
	information = dmt_1297_stonnos_testfail_info;
	permanent = FALSE;
	description = " Regarding your errand, master... " ;
};


func int dmt_1297_stonnos_testfail_condition()
{
	if((MIS_STONNOSTEST == LOG_Running) && (CRESTNATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_testfail_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DMT_1297_Stonnos_TestFail_00 " );	// Regarding your assignment, master...
	AI_Output(self,other, " DMT_1297_Stonnos_TestFail_01 " );	// Yes, human?
	AI_Output(other,self, " DMT_1297_Stonnos_TestFail_02 " );	// I'm afraid I won't be able to bring you these Elemental Orbs since they're gone.
	AI_Output(other,self, " DMT_1297_Stonnos_TestFail_04 " );	// I used these artifacts to create a single magical rune to use to destroy a powerful demon named S'enyak.
	AI_Output(self,other, " DMT_1297_Stonnos_TestFail_05 " );	// (very surprised) S'enyak?! Lang's oldest archdemon?
	AI_Output(self,other, " DMT_1297_Stonnos_TestFail_07 " );	// (thoughtfully) Well, I must admit, this is a rather unforeseen turn of events.
	AI_Output(self,other, " DMT_1297_Stonnos_TestFail_08 " );	// I couldn't even imagine that an ordinary mortal could do this!
	AI_Output(other,self, " DMT_1297_Stonnos_TestFail_10 " );	// I just didn't have a choice.
	AI_Output(other,self, " DMT_1297_Stonnos_TestFail_12 " );	// And what will happen to my Trial of Faith now?
	AI_Output(self,other, " DMT_1297_Stonnos_TestFail_13 " );	// Hmmm... You disappoint me.
	AI_Output(self,other, " DMT_1297_Stonnos_TestFail_14 " );	// However, if you look at all this a little from the other side, then perhaps the consequences of your choice turned out to be only to our advantage.
	AI_Output(self,other, " DMT_1297_Stonnos_TestFail_15 " );	// So, after a little thought, I've come to the conclusion... that it's only right to pass your test.
	MIS_STONNOSTEST = LOG_SUCCESS;
	MIS_GUARDIANSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_STONNOSTEST,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_GUARDIANSTEST,LOG_SUCCESS);
	B_LogEntry( TOPIC_STONNOSTEST , " Even though I couldn't bring the Orbs to Keeper Stonnos, he thought I still passed his Test of Faith. " );
	Log_AddEntry( TOPIC_GUARDIANSTEST , " I have passed all the Guardian tests. I think now I will finally be honored to become an adept of the divine Circle of Guardians! " );
	Info_ClearChoices(dmt_1297_stonnos_testfail);
	Info_AddChoice(dmt_1297_stonnos_testfail, " So I can still join the Circle of Guardians? " ,dmt_1297_stonnos_testdone_pass);
};

instance DMT_1297_STONNOS_TESTDONE(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 1;
	condition = dmt_1297_stonnos_testdone_condition;
	information = dmt_1297_stonnos_testdone_info;
	permanent = FALSE;
	description = " I brought you Elemental Orbs, master. " ;
};

func int dmt_1297_stonnos_testdone_condition()
{
	if (( MIS_STONNOSTEST  == LOG_Running) && ( CRESTNATUREISDONE  ==  FALSE ) && (Npc_HasItems(other,itmi_fireshpere) >=  1 ) && (Npc_HasItems(other,itmi_watershpere) >=  1 ) && (Npc_HasItems(other,itmi_stoneshpere) >=  1 ) && (Npc_HasItems(other,itmi_darkshpere) >=  1 ))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_testdone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DMT_1297_Stonnos_TestDone_00 " );	// I brought you Elemental Orbs, master.
	Npc_RemoveInvItems(other,itmi_fireshpere,1);
	Npc_RemoveInvItems(other,itmi_watershpere,1);
	Npc_RemoveInvItems(other,itmi_stoneshpere,1);
	Npc_RemoveInvItems(other,itmi_darkshpere,1);
	b_giveinvitemsmanythings(other,self);
	AI_Output(self,other, " DMT_1297_Stonnos_TestDone_03 " );	// Yes, that's right... (imperiously) These are the divine artifacts of antiquity, generated by the magic of the creators themselves.
	AI_Output(self,other, " DMT_1297_Stonnos_TestDone_07 " );	// You passed the test!
	AI_Output(self,other, " DMT_1297_Stonnos_TestDone_08 " );	// And in my opinion, certainly deserved to be one of us.
	MISSSHEPREFOREVER = TRUE;
	MIS_STONNOSTEST = LOG_SUCCESS;
	MIS_GUARDIANSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GUARDIANSTEST,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_STONNOSTEST,LOG_SUCCESS);
	B_LogEntry( TOPIC_STONNOSTEST , " After I brought all the Elemental Orbs to Guardian Stonnos, he announced that I was able to pass his Test of Faith... " );
	Log_AddEntry( TOPIC_GUARDIANSTEST , " I have passed all the Guardian tests. I think now I will finally be honored to become an adept of the divine Circle of Guardians! " );
	Info_ClearChoices(dmt_1297_stonnos_testdone);
	Info_AddChoice(dmt_1297_stonnos_testdone, " So now I can join the Circle of Guardians? " ,dmt_1297_stonnos_testdone_pass);
};

func void dmt_1297_stonnos_testdone_pass()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DMT_1297_Stonnos_TestDone_Pass_01 " );	// So I can join the Circle of Guardians?
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DMT_1297_Stonnos_TestDone_Pass_02 " );	// (mightily) So be it, man. After all, this is your purpose!
	AI_Output(self,other, " DMT_1297_Stonnos_TestDone_Pass_03 " );	// Therefore, by the power given to me by the creators of this world, I, Guardian Stonnos, the main guardian of the Halls of Chaos and the divine stone...
	AI_Output(self,other, " DMT_1297_Stonnos_TestDone_Pass_04 " );	// ...I elevate you to the degree of Adept of the Elements, bestowing this ring as a symbol of your participation in our sacred Circle!
	B_GiveInvItems(self,other,itri_guardians_02,1);
	AI_Output(self,other, " DMT_1297_Stonnos_TestDone_Pass_05 " );	// From now on, your fate is inseparably linked with the fate of those who, like you, chose this path and swore an oath to follow it.
	AI_Output(self,other, " DMT_1297_Stonnos_TestDone_Pass_06 " );	// And may your decisions be wise, like the dark waters of Huron, and your faith be firm, like the divine rock of Amshor!
	AI_Output(self,other, " DMT_1297_Stonnos_TestDone_Pass_07 " );	// ERRAT KNAR HAK...(imperiously) So be it!
	B_LogEntry( TOPIC_GUARDIANS , " Guardian Stonnos elevated me to the status of an adherent of their sacred Circle - from now on I am one of them! True, what lies ahead of me now, I do not know... " );
	STONNOS_AGREE = TRUE;
	ADEPTGUARDIAN = TRUE;
};


instance DMT_1297_STONNOS_CHOOSENATURE(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 1;
	condition = dmt_1297_stonnos_choosenature_condition;
	information = dmt_1297_stonnos_choosenature_info;
	permanent = TRUE;
	description = " So now I'm one of you? " ;
};


func int dmt_1297_stonnos_choosenature_condition()
{
	if((ADEPTGUARDIAN == TRUE) && (CHOOSENATUREISDONE == FALSE))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_choosenature_info()
{
	AI_Output(other,self, " DMT_1297_Stonnos_ChooseNature_01 " );	// So now I'm one of you?
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_02 " );	// Yes, from now on, you are the chosen one of the Elements!
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_07 " );	// Before you continue on your journey, you will need to do one more thing.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_09 " );	// Since you are now an adept of our Circle, you will have to decide for yourself which of the elements you want to connect your fate with.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_10 " );	// (imperiously) As you probably already know, there are four of them - Fire, Water, Stone and Darkness.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_11 " );	// Each of them is able to grant you something that the rest cannot grant! However, you can only make your choice in favor of one.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_12 " );	// So think carefully before making a decision.
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature, " I'll think about it, master. " ,dmt_1297_stonnos_choosenature_later);
	Info_AddChoice(dmt_1297_stonnos_choosenature, " I choose Darkness, master. " ,dmt_1297_stonnos_choosenature_dark);
	Info_AddChoice(dmt_1297_stonnos_choosenature, " I choose Stone element, master. " ,dmt_1297_stonnos_choosenature_stone);
	Info_AddChoice(dmt_1297_stonnos_choosenature, " I choose Water, master. " ,dmt_1297_stonnos_choosenature_water);
	Info_AddChoice(dmt_1297_stonnos_choosenature, " I choose Fire, master. " ,dmt_1297_stonnos_choosenature_fire);
};

func void dmt_1297_stonnos_choosenature_later()
{
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
};

func void dmt_1297_stonnos_choosenature_dark()
{
	CHOOSEDARK = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSDARK);
	hero.protection[PROT_MAGIC] += 20;
	REALPROTMAGIC += 20;

	if(hero.guild == GIl_KDM)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("SPELLFX_INCOVATION_VIOLET",hero,hero,0,0,0,FALSE);
	AI_Output(other,self, " DMT_1297_Stonnos_ChooseNature_Dark_01_00 " );	// I choose the element of Darkness, master.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_01 " );	// (imperiously) All right, mortal. So be it! You have made your final choice.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_02 " );	// From now on, your fate will be inseparably connected only with her, and all your deeds and thoughts will be directed exclusively for the benefit of her greatness.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_04 " );	// Now you must continue on the path you just chose for yourself.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_07 " );	// Go to Guardian Dagoth! Now he, as the chief of the guards of Darkness, will become your mentor and teacher.
	AI_Output(other,self, " DMT_1297_Stonnos_ChooseNature_Dark_01_08 " );	// Where can I find it?
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_09 " );	// Here, take this magic rune of teleportation. She will take you to the right place.
	B_GiveInvItems(self,other,itru_teleportdagot, 1 );
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_11 " );	// Now farewell, mortal... (mightily) And may the elements protect you!
	B_LogEntry( TOPIC_GUARDIANS , " Guardian Stonnos suggested that I choose the element with which I want to link my further fate as their adept. I preferred the element of Darkness. " );
	Log_AddEntry( TOPIC_GUARDIANS , " Stonnos also gave me a teleportation rune that would allow me to travel to the sacred abode of the Elemental Guardians. There I would meet Guardian Dagoth, who would be my mentor from now on. " );
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature, " (end call) " ,dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_choosenature_stone()
{
	CHOOSESTONE = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print( PRINT_BONUSSTONE );
	hero.protection[PROT_EDGE] += 10;
	hero.protection[PROT_BLUNT] += 10;
	hero.protection[PROT_POINT] += 10;
	hero.protection[PROT_FLY] += 50;
	Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,BONUSHEA);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + BONUSHEA;

	if(hero.guild == GIl_GUR)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	AI_Output(other,self, " DMT_1297_Stonnos_ChooseNature_Stone_01_00 " );	// I choose the Stone element, master.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_01 " );	// (imperiously) All right, mortal. So be it! You have made your final choice.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_02 " );	// From now on, your fate will be inseparably connected only with her, and all your deeds and thoughts will be directed exclusively for the benefit of her greatness.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Stone_01_04 " );	// As for me, from now on, as the main and only guardian of the divine Rock, I will become your mentor and reveal to you the ancient mysteries of this element.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Stone_01_05 " );	// However, that will come later. Now, for starters, you need to get to our sacred abode, where we will continue this conversation.
	AI_Output(other,self, " DMT_1297_Stonnos_ChooseNature_Stone_01_06 " );	// How can I get there?
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_09 " );	// Here, take this magic rune of teleportation. She will take you to the right place.
	B_GiveInvItems(self,other,itru_teleportdagot, 1 );
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_11 " );	// Now farewell, mortal... (mightily) And may the elements protect you!
	B_LogEntry( TOPIC_GUARDIANS , " Guardian Stonnos suggested that I choose the element with which I want to link my future fate as their adept. I preferred the element of Stone. " );
	Log_AddEntry( TOPIC_GUARDIANS , " Stonnos also gave me a teleportation rune that would allow me to travel to the Elemental Guardians' sacred retreat. There I would meet him again as his apprentice. " );
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature, " (end call) " ,dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_choosenature_water()
{
	CHOOSEWATER = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSWATER);
	NPC_DAM_DIVE_TIME = 10000000;
	Npc_ChangeAttribute(hero,ATR_MANA_MAX,BONUSMAN);
	hero. attribute[ ATR_MANA ] = hero. attribute[ ATR_MANA ] +  BONUSMAN ;

	if(hero.guild == GIl_KDW)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
	AI_Output(other,self, " DMT_1297_Stonnos_ChooseNature_Water_01_00 " );	// I choose the Water element, master.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_01 " );	// (imperiously) All right, mortal. So be it! You have made your final choice.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_02 " );	// From now on, your fate will be inseparably connected only with her, and all your deeds and thoughts will be directed exclusively for the benefit of her greatness.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_04 " );	// Now you must continue on the path you just chose for yourself.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Water_01_07 " );	// Go to Guardian Wakon! Now he, as the chief of the guardians of Water, will become your mentor and teacher.
	AI_Output(other,self, " DMT_1297_Stonnos_ChooseNature_Dark_01_08 " );	// Where can I find it?
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_09 " );	// Here, take this magic rune of teleportation. She will take you to the right place.
	B_GiveInvItems(self,other,itru_teleportdagot, 1 );
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_11 " );	// Now farewell, mortal... (mightily) And may the elements protect you!
	B_LogEntry( TOPIC_GUARDIANS , " Guardian Stonnos suggested that I choose the element with which I want to link my further fate as their adept. I preferred the element of Water. " );
	Log_AddEntry( TOPIC_GUARDIANS , " Stonnos also gave me a teleportation rune that would allow me to travel to the Elemental Guardians' sacred retreat. There I would meet Guardian Wakon, who would be my mentor from now on. " );
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature, " (end call) " ,dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_choosenature_fire()
{
	CHOOSEFIRE = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print( PRINT_BONUSFIRE );
	hero.protection[PROT_FIRE] += 20;
	REALPROTFIRE += 20;

	if(hero.guild == GIl_KDF)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",hero,hero,0,0,0,FALSE);
	AI_Output(other,self, " DMT_1297_Stonnos_ChooseNature_Fire_01_00 " );	// I choose the Fire element, master.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_01 " );	// (imperiously) All right, mortal. So be it! You have made your final choice.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_02 " );	// From now on, your fate will be inseparably connected only with her, and all your deeds and thoughts will be directed exclusively for the benefit of her greatness.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_04 " );	// Now you must continue on the path you just chose for yourself.
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Fire_01_07 " );	// Go to Guardian Kelios! Now he, as the chief of the guardians of Fire, will become your mentor and teacher.
	AI_Output(other,self, " DMT_1297_Stonnos_ChooseNature_Dark_01_08 " );	// Where can I find it?
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_09 " );	// Here, take this magic rune of teleportation. She will take you to the right place.
	B_GiveInvItems(self,other,itru_teleportdagot, 1 );
	AI_Output(self,other, " DMT_1297_Stonnos_ChooseNature_Dark_01_11 " );	// Now farewell, mortal... (mightily) And may the elements protect you!
	B_LogEntry( TOPIC_GUARDIANS , " Guardian Stonnos suggested that I choose the element with which I want to link my further fate as their adept. I preferred the element of Fire. " );
	Log_AddEntry( TOPIC_GUARDIANS , " Stonnos also gave me a teleportation rune that would allow me to travel to the sacred abode of the Elemental Guardians. There I would meet Guardian Kelios, who would be my mentor from now on. " );
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature, " (end call) " ,dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};
