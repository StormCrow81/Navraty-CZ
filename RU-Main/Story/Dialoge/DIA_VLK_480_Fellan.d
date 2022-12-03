

instance DIA_Fellan_EXIT(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 999;
	condition = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Fellan_PICKPOCKET(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 998;
	condition = DIA_Fellan_PICKPOCKET_Condition;
	information = DIA_Fellan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Fellan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 18 , 10 );
};

func void DIA_Fellan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,Dialog_Back,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

instance DIA_Fellan_News(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = DIA_Fellan_News_Condition;
	information = DIA_Fellan_News_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Fellan_News_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( self . aivar [ AIV_LastFightAgainstPlayer ] !=  FIGHT_NONE ) && ( self . aivar [ AIV_LastFightComment ] ==  FALSE ) && ( MIS_BELIARHELPME  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Fellan_News_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other, " DIA_Fellan_News_06_00 " );	// Oh, you beat me. What a heroic act!

		if((MIS_AttackFellan == LOG_Running) && (FellanGeschlagen == FALSE))
		{
			AI_Output(other,self, " DIA_Fellan_News_15_01 " );	// Will you stop hammering or should I give you another beating?
			AI_Output(self,other, " DIA_Fellan_News_06_02 " );	// No, don't hit me anymore. I will stop. But here everything will collapse, and it will be your fault!
			FellanBeaten = TRUE ;
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
		};
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(self,other, " DIA_Fellan_News_06_03 " );	// What's wrong? Do you still want to get in the face?
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		AI_Output(self,other, " DIA_Fellan_News_06_04 " );	// What kind of psycho are you? You fight, then you run away, then you chat - what do you even need?
	};
	self.aivar[AIV_LastFightComment] = TRUE ;
};


instances DIA_Fellan_HALLO (C_Info)
{
	npc = VLK_480_Fellan;
	nr = 2;
	condition = DIA_Fellan_HALLO_Condition;
	information = DIA_Fellan_HALLO_Info;
	permanent = FALSE;
	description = " Why are you pounding with a hammer? " ;
};


func int DIA_Fellan_HALLO_Condition()
{
	if ((FellanGeschlagen ==  FALSE ) && ( MY_BELIARHELP  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Fellan_HALLO_Info()
{
	AI_Output(other,self, " DIA_Fellan_HALLO_15_00 " );	// Why are you pounding with a hammer?
	AI_Output(self,other, " DIA_Fellan_HALLO_06_01 " );	// For several days now, I've been desperately trying to fix the leaks in my house.
	AI_Output(self,other, " DIA_Fellan_HALLO_06_02 " );	// The beams have been crumbling since these last rains. Soon it will all fall on my head!
	AI_StopProcessInfos(self);
};


instance DIA_Fellan_Stop(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 3;
	condition = DIA_Fellan_Stop_Condition;
	information = DIA_Fellan_Stop_Info;
	permanent = FALSE;
	description = " Could you stop thrashing? " ;
};


func int DIA_Fellan_Stop_Condition()
{
	if(MIS_AttackFellan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fellan_Stop_Info()
{
	AI_Output(other,self, " DIA_Fellan_Stop_15_00 " );	// Could you stop thrashing?
	AI_Output(self,other, " DIA_Fellan_Stop_06_01 " );	// No, I have to finish the job.
	Info_ClearChoices(DIA_Fellan_Stop);
	Info_AddChoice(DIA_Fellan_Stop, " Stop hammering or I'll break all your bones. " ,DIA_Fellan_Stop_Bones);
	Info_AddChoice(DIA_Fellan_Stop, " I'll give you ten coins to stop you beating. " ,DIA_Fellan_Stop_Gold);
	Info_AddChoice(DIA_Fellan_Stop, " Just stop thrashing. OK? " ,DIA_Fellan_Stop_Just);
};

func void DIA_Fellan_Stop_Bones()
{
	AI_Output(other,self, " DIA_Fellan_Stop_Bones_15_00 " );	// Stop hammering or I'll break all your bones.
	AI_Output(self,other, " DIA_Fellan_Stop_Bones_06_01 " );	// Forget it, or I'll have to reason with you with a good hammer blow to the head.
	AI_StopProcessInfos(self);
};

func void DIA_Fellan_Stop_Gold()
{
	AI_Output(other,self, " DIA_Fellan_Stop_Gold_15_00 " );	// I'll give you ten coins to stop you beating.
	AI_Output(self,other, " DIA_Fellan_Stop_Gold_06_01 " );	// Hey... That's very generous of you. But as for your gold, you can...
	AI_Output(self,other, " DIA_Fellan_Stop_Gold_06_02 " );	// ...well, you know where to put it.
};

func void DIA_Fellan_Stop_Just()
{
	AI_Output(other,self, " DIA_Fellan_Stop_Just_15_00 " );	// Just stop thrashing. Good?
	AI_Output(self,other, " DIA_Fellan_Stop_Just_06_01 " );	// Don't pester me, okay?
};


instances of DIA_Fellan_klar (C_Info)
{
	npc = VLK_480_Fellan;
	nr = 5;
	condition = DIA_Fellan_klar_Condition;
	information = DIA_Fellan_klar_Info;
	permanent = TRUE;
	description = " Are you all right? " ;
};


func int DIA_Fellan_klar_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Fellan_HELLO ) && ( MY_BELIEVERHELP ME  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Fellan_klar_Info()
{
	AI_Output(other,self, " DIA_Fellan_klar_15_00 " );	// Hey! Are you all right?

	if (Fellan Beaten ==  FALSE )
	{
		AI_Output(self,other, " DIA_Fellan_klar_06_01 " );	// It'll be fine if I can finish the repair on time.
	}
	else
	{
		AI_Output(self,other, " DIA_Fellan_klar_06_02 " );	// The condition of the roof is deteriorating right before our eyes. In the next rain, the water in the house will rise to the waist, and it will be your fault!
	};

	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_INSANE(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_insane_condition;
	information = dia_fellan_insane_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int dia_fellan_insane_condition()
{
	if(MIS_BELIARHELPME == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_fellan_insane_info()
{
	AI_Output(other,self, " DIA_Fellan_Insane_01_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Fellan_Insane_01_01 " );	// Don't disturb me! (annoyed) Can't you see, I'm trying to fix this burned-out shack.
	AI_Output(self,other, " DIA_Fellan_Insane_01_03 " );	// I decided to settle in it. Khorinis is damn tired of me - and here everything is so beautiful, quiet and calm.
	AI_Output(other,self, " DIA_Fellan_Insane_01_04 " );	// Aren't you afraid that wolves will eat you here?
	AI_Output(self,other, " DIA_Fellan_Insane_01_07 " );	// Enough! Leave me alone!
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_INSANETWO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_insanetwo_condition;
	information = dia_fellan_insanetwo_info;
	permanent = FALSE;
	description = " Do you really want to stay here? " ;
};


func int dia_fellan_insanetwo_condition()
{
	if ( Npc_KnowsInfo ( other , dia_fellan_insane ) && ( MY_BELIARHELP  == LOG_Running ))
	{
		return TRUE;
	};
};

func void dia_fellan_insanetwo_info()
{
	AI_Output(other,self, " DIA_Fellan_InsaneTwo_01_00 " );	// Do you really want to stay here?
	AI_Output(self,other, " DIA_Fellan_InsaneTwo_01_01 " );	// Of course...(admiringly) Haven't you noticed how beautiful it is here?
	AI_Output(other,self, " DIA_Fellan_InsaneTwo_01_03 " );	// But what can be beautiful in a pile of charred pieces of wood?
	AI_Output(self,other, " DIA_Fellan_InsaneTwo_01_04 " );	// You're just a fool if you don't understand this! (contemptuously) This is the most beautiful place I have ever seen.
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_INSANELAST(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_insanelast_condition;
	information = dia_fellan_insanelast_info;
	permanent = TRUE;
	description = " Wait! There's one more thing to do. " ;
};


func int dia_fellan_insanelast_condition()
{
	if ( Npc_KnowsInfo ( other , dia_fellan_insanetwo ) && ( MY_BELIARHELP  == LOG_Running ) && ( FELLANGER FIRST MEET  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_fellan_insanelast_info()
{
	AI_Output(other,self, " DIA_Fellan_InsaneLast_01_01 " );	// Wait! There is one more thing.
	if(TELLFIRSTFELLAN == FALSE)
	{
		AI_Output(self,other, " DIA_Fellan_InsaneLast_01_02 " );	// You again? (angrily) What do you want from me?
		AI_Output(other,self, " DIA_Fellan_InsaneLast_01_03 " );	// I just think you're exactly the person I'm looking for.
		AI_Output(self,other, " DIA_Fellan_InsaneLast_01_04 " );	// (annoyed) Well, what again?
		TELLFIRSTFELLAN = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Fellan_InsaneLast_01_04 " );	// (annoyed) Well, what again?
	};
	Info_ClearChoices(dia_fellan_insanelast);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_insanelast, " ...ARCH BELIAR NOMEN SAKT DAGAR KHAR...! " ,dia_fellan_insanelast_yes);
	};
	Info_AddChoice(dia_fellan_insanelast, " Forget it. " ,dia_fellan_insanelast_no);
};

func void day_fellan_insanelast_no()
{
	AI_Output(other,self, " DIA_Fellan_InsaneLast_No_01_00 " );	// Forget it.
	AI_Output(self,other,"DIA_Fellan_InsaneLast_No_01_01");	//Хммм...
	AI_StopProcessInfos(self);
};

func void dia_fellan_insanelast_yes()
{
	B_GivePlayerXP(100);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[ 0 ] = " Fellangor " ;
	FELLANGORFIRSTMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self, " DIA_Fellan_InsaneLast_Yes_01_00 " );	// ...ARCH BELIAR NOMEN SAKT DAGAR KHAR...!
	AI_Output(self,other, " DIA_Fellan_InsaneLast_Yes_01_01 " );	// Arghh!!! (dead voice) What have you done, pathetic man? You revealed my secret.
	AI_Output(other,self, " DIA_Fellan_InsaneLast_Yes_01_02 " );	// So you are the chosen one who once served Beliar, but then became mad and rejected his master?
	AI_Output(self,other, " DIA_Fellan_InsaneLast_Yes_01_03 " );	// Yes, it's me! (powerfully) And I can guess why you were looking to meet me.
	AI_Output(self,other, " DIA_Fellan_InsaneLast_Yes_01_04 " );	// But you will not be able to destroy me, for I am immortal!
	AI_Output(other,self, " DIA_Fellan_InsaneLast_Yes_01_05 " );	// Here, take a look at this amulet and test its power!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Fellan_InsaneLast_Yes_01_06 " );	// Oh no! This can't be... (maddened) How dare you bring him to me?
	AI_Output(other,self, " DIA_Fellan_InsaneLast_Yes_01_07 " );	// I'm here on orders from your master, who wants to take from you what belongs to him.
	AI_Output(self,other, " DIA_Fellan_InsaneLast_Yes_01_08 " );	// Arghhh! (resisting) Fool! You still won't get anything.
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Fellan_InsaneLast_Yes_01_09 " );	// The amulet's magic is strong, but it can't completely destroy me!
	AI_Output(self,other, " DIA_Fellan_InsaneLast_Yes_01_10 " );	// I already feel that his strength has weakened a little and now no one will stop me from hiding from the wrath of the Dark God again.
	B_LogEntry( TOPIC_BELIARHELPME , " I managed to find Fellangor! I cast a spell and used the amulet that Zygos gave me. As expected, its power failed to kill Beliar's chosen one, but apparently greatly weakened him, after which Fellangor himself disappeared. I need to try to find it again. " );
	Info_ClearChoices(dia_fellan_insanelast);
	Info_AddChoice(dia_fellan_insanelast, " (end call) " ,dia_fellan_insanelast_away);
};

func void dia_fellan_insanelast_away()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_ExchangeRoutine(self,"InsanePath");
	B_Attack(self,other,0,0);
};

instance DIA_FELLAN_MEETTWO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meettwo_condition;
	information = dia_fellan_meettwo_info;
	permanent = FALSE;
	description = " How did you get here? " ;
};


func int dia_fellan_meettwo_condition()
{
	if (( MY_BELIARHELP  == LOG_Running) && ( FIRST FELLANGERMEET  ==  TRUE ) && ( SECOND FELLANGERMEET  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_fellan_meettwo_info()
{
	AI_Output(other,self, " DIA_Fellan_MeetTwo_01_00 " );	// How did you get here?
	AI_Output(self,other, " DIA_Fellan_MeetTwo_01_01 " );	// I just decided to take a walk in the woods.
	AI_Output(other,self, " DIA_Fellan_MeetTwo_01_02 " );	// Take a walk? Alone and in such a wilderness?
	AI_Output(self,other, " DIA_Fellan_MeetTwo_01_03 " );	// Is it wilderness? Look around - how beautiful it is here!
	AI_Output(other,self, " DIA_Fellan_MeetTwo_01_04 " );	// Hmmm... I find this a bit odd.
	AI_Output(self,other, " DIA_Fellan_MeetTwo_01_05 " );	// (surprised) What are you talking about?
	SPEAKTWOFELLANGORONCE = TRUE;
	Info_ClearChoices(dia_fellan_meettwo);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meettwo, " ...ARCH BELIAR NOMEN SAKT DAGAR KHAR...! " ,dia_fellan_meettwo_yes);
	};
	Info_AddChoice(dia_fellan_meettwo,"Не важно.",dia_fellan_meettwo_no);
};

func void dia_fellan_meettwo_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwo_No_01_00");	//Не важно.
	AI_Output(self,other, " DIA_Fellan_MeetTwo_No_01_01 " );	// Okay, whatever you say.
	AI_StopProcessInfos(self);
};

func void dia_fellan_meettwo_yes()
{
	B_GivePlayerXP(200);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[ 0 ] = " Fellangor " ;
	FELLANGORSECONDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self, " DIA_Fellan_MeetTwo_Yes_01_00 " );	// ...ARCH BELIAR NOMEN SAKT DAGAR KHAR...!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Fellan_MeetTwo_Yes_01_01 " );	// Arghh!!! (resisting) You still managed to find me, human!
	AI_Output(other,self, " DIA_Fellan_MeetTwo_Yes_01_02 " );	// You can't hide from me, Fellangor! Submit to the will of the amulet and return what does not belong to you!
	AI_Output(self,other, " DIA_Fellan_MeetTwo_Yes_01_03 " );	// This is only my gift! And I won't give it to anyone. Even to Beliar himself!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Fellan_MeetTwo_Yes_01_04 " );	// (laughing wildly) The amulet's magic failed to kill me again!
	AI_Output(self,other, " DIA_Fellan_MeetTwo_Yes_01_06 " );	// I will hide in the darkness, and you will never be able to find me again.
	B_LogEntry( TOPIC_BELIARHELPME , " I met Fellangor again. The power of the amulet again seriously weakened him - just a little more, and Beliar's chosen one will be destroyed! This time, Fellangor managed to hide from me again, but I'm sure that this was the last time. " );
	Info_ClearChoices(dia_fellan_meettwo);
	Info_AddChoice(dia_fellan_meettwo, " (end call) " ,dia_fellan_meettwo_away);
};

func void dia_fellan_meettwo_away()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_ExchangeRoutine(self,"InsanePathNext");
	B_Attack(self,other,0,0);
};


instance DIA_FELLAN_MEETTWOAGAIN(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meettwoagain_condition;
	information = dia_fellan_meettwoagain_info;
	permanent = TRUE;
	description = " Hey, listen to me! " ;
};


func int dia_fellan_meettwoagain_condition()
{
	if (( MIS_BELIARHELPME  == LOG_Running) && ( FELLANGORFIRSTMEET  ==  TRUE ) && ( SPEAKTWOFELLANGORONCE  ==  TRUE ) && ( FELLANGORSECONDMEET  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_fellan_meettwoagain_info()
{
	AI_Output(other,self, " DIA_Fellan_MeetTwoAgain_01_00 " );	// Hey, listen to me!
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_01_01");	//Ну, что еще?!
	Info_ClearChoices(dia_fellan_meettwoagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meettwoagain, " ...ARCH BELIAR NOMEN SAKT DAGAR HAR... " ,dia_fellan_meettwoagain_yes);
	};
	Info_AddChoice(dia_fellan_meettwoagain,"Не важно.",dia_fellan_meettwoagain_no);
};

func void dia_fellan_meettwoagain_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwoAgain_No_01_00");	//Не важно.
	AI_Output(self,other, " DIA_Fellan_MeetTwoAgain_No_01_01 " );	// Then leave me alone!
	AI_StopProcessInfos(self);
};

func void dia_fellan_meettwoagain_yes()
{
	B_GivePlayerXP(200);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[ 0 ] = " Fellangor " ;
	FELLANGORSECONDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self, " DIA_Fellan_MeetTwoAgain_Yes_01_00 " );	// ...ARCH BELIAR NOMEN SAKT DAGAR KHAR...!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Fellan_MeetTwoAgain_Yes_01_01 " );	// Arghh!!! (resisting) You still managed to find me, human!
	AI_Output(other,self, " DIA_Fellan_MeetTwoAgain_Yes_01_02 " );	// You can't hide from me, Fellangor! Submit to the will of the amulet and return what no longer belongs to you!
	AI_Output(self,other, " DIA_Fellan_MeetTwoAgain_Yes_01_03 " );	// This is only my gift! And I won't give it to anyone. Even to Beliar himself!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Fellan_MeetTwoAgain_Yes_01_04 " );	// (laughing wildly) The amulet's magic failed to kill me again!
	AI_Output(self,other, " DIA_Fellan_MeetTwoAgain_Yes_01_06 " );	// I will hide in the darkness and you will never be able to find me again.
	B_LogEntry( TOPIC_BELIARHELPME , " I met Fellangor again. The power of the amulet again seriously weakened him - just a little more, and Beliar's chosen one will be destroyed! This time, Fellangor managed to hide from me again, but I'm sure that this was the last time. " );
	Info_ClearChoices(dia_fellan_meettwoagain);
	Info_AddChoice(dia_fellan_meettwoagain, " (end call) " ,dia_fellan_meettwoagain_away);
};

func void dia_fellan_meettwoagain_away()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_ExchangeRoutine(self,"InsanePathNext");
	B_Attack(self,other,0,0);
};


instance DIA_FELLAN_MEASUREMENT (C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meetlast_condition;
	information = dia_fellan_meetlast_info;
	permanent = FALSE;
	description = " Hey buddy! What are you doing here? " ;
};


func int dia_fellan_meet_last_condition()
{
	if (( MIS_BELIARHELPME  == LOG_Running) && ( FELLANGORSECONDMEET  ==  TRUE ) && ( FELLANGORTHIRDMEET  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_fellan_meetlast_info()
{
	AI_Output(other,self, " DIA_Fellan_MeetLast_01_00 " );	// Hey buddy! What are you doing here?
	AI_Output(self,other, " DIA_Fellan_MeetLast_01_01 " );	// Like what? I trade. So don't distract me! New customers are coming in any minute now.
	AI_Output(other,self, " DIA_Fellan_MeetLast_01_02 " );	// Trading here?! Alone in the middle of a forest full of monsters?
	AI_Output(other,self, " DIA_Fellan_MeetLast_01_04 " );	// Hmmm... Where are all your goods?
	AI_Output(self,other, " DIA_Fellan_MeetLast_01_05 " );	// Uh... I left everything in the city in case the bandits suddenly attacked me.
	AI_Output(self,other, " DIA_Fellan_MeetLast_01_07 " );	// Why are you looking at me like that?
	SPEAKTHIRDFELLANGORONCE = TRUE;
	Info_ClearChoices(slide_fellan_measurement load);

	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meetlast, " ...ARCH BELIAR NOMEN SAKT DAGAR HAR... " ,dia_fellan_meetlast_yes);
	};
	Info_AddChoice(dia_fellan_meetlast, " Не важно. " ,dia_fellan_meetlast_no);
};

func void dia_fellan_meetlast_no()
{
	AI_Output(other,self, " DIA_Fellan_MeetLast_No_01_00 " );	// Forget it.
	AI_Output(self,other, " DIA_Fellan_MeetLast_No_01_01 " );	// Well, if that's the case, then I'll probably get back to my trading. You dont mind?
	AI_StopProcessInfos(self);
};

func void dia_fellan_meetlast_yes()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[ 0 ] = " Fellangor " ;
	FELLANGORTHIRDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self, " DIA_Fellan_MeetLast_Yes_01_00 " );	// ...ARCH BELIAR NOMEN SAKT DAGAR KHAR...!
	AI_Output(self,other, " DIA_Fellan_MeetLast_Yes_01_01 " );	// I can't hide from you, human... You tracked me down again!
	AI_Output(other,self, " DIA_Fellan_MeetLast_Yes_01_02 " );	// Enough this time - you can't get away! Better get ready to die.
	AI_Output(self,other, " DIA_Fellan_MeetLast_Yes_01_03 " );	// Wait! (beseechingly) Please, have mercy on me! And my gratitude will know no equal.
	B_LogEntry( TOPIC_BELIARHELPME , " I've caught Fellangor! Now he won't escape me. All I have to do is use the amulet to put an end to his torment. " );
	Info_ClearChoices(slide_fellan_measurement load);
	Info_AddChoice(dia_fallan_meetlast, " What do you have to offer? " ,dia_fallan_meetlast_what);
	Info_AddChoice(dia_fellan_meetlast, " Yes, young. Not married. " ,dia_fellan_meetlast_free);
	Info_AddChoice(dia_fellan_meetlast, " I will finish what I started. " ,dia_fallan_meetlast_kill);
};

func void dia_fellan_meetlast_what()
{
	AI_Output(other,self, " DIA_Fellan_MeetLast_What_01_00 " );	// What can you suggest?
	AI_Output(self,other, " DIA_Fellan_MeetLast_What_01_01 " );	// Something that grants you great strength and power. Whether you own it or not is up to you!
};

func void dia_fellan_meetlast_free()
{
	AI_Output(other,self, " DIA_Fellan_MeetLast_Free_01_00 " );	// Well, okay. I agree.
	AI_Output(self,other, " DIA_Fellan_MeetLast_Free_01_01 " );	// Thank you, human. And as proof of my words, here - take this ring!
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		CreateInvItems(self,itri_fellangor_magic,1);
		B_GiveInvItems(self,other,itri_fellangor_magic,1);
	}
	else
	{
		CreateInvItems(self,itri_fellangor,1);
		B_GiveInvItems(self,other,itri_fellangor,1);
	};
	AI_Output(other,self, " DIA_Fellan_MeetLast_Free_01_02 " );	// Ring? And just?
	AI_Output(self,other, " DIA_Fellan_MeetLast_Free_01_03 " );	// You're unlikely to find anything like him in this world.
	AI_Output(self,other, " DIA_Fellan_MeetLast_Free_01_04 " );	// Put it on and you'll know I'm telling the truth.
	AI_Output(self,other, " DIA_Fellan_MeetLast_Free_01_05 " );	// And now goodbye!
	FELLANGORSAVE = TRUE;
	Info_ClearChoices(slide_fellan_measurement load);
	Info_AddChoice(dia_fellan_meetlast,Dialog_Ende,dia_fellan_measurelast_ext);
};

func void dia_fellan_meetlast_ext()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};

func void dia_fellan_meetlast_kill()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Fellan_MeetLast_Kill_01_00");	//Нет!
	AI_Output(other,self, " DIA_Fellan_MeetLast_Kill_01_01 " );	// You can't escape retribution! Die!
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetLast_Kill_01_02");	//Аргхх...(обреченно)
	Info_ClearChoices(slide_fellan_measurement load);
	Info_AddChoice(dia_fellan_meetlast, " ...(subject to magic) " ,dia_fellan_meetlast_extkill);
};

func void dia_fellan_meetlast_extkill()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_FELLAN_MEETLASTAGAIN (C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meetlastagain_condition;
	information = dia_fellan_meetlastagain_info;
	permanent = TRUE;
	description = " I want to tell you something. " ;
};


func int dia_fellan_meetlastagain_condition()
{
	if (( MIS_BELIARHELPME  == LOG_Running) && ( SPEAKTHIRDFELLANGORONCE  ==  TRUE ) && ( FELLANGORSECONDMEET  ==  TRUE ) && ( FELLANGORTHIRDMEET  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_fellan_meetlastagain_info()
{
	AI_Output(other,self, " DIA_Fellan_MeetLastAgain_01_00 " );	// I want to tell you something.
	AI_Output(self,other, " DIA_Fellan_MeetLastAgain_01_01 " );	// Yes? (surprised) And what is it?
	Info_ClearChoices(dia_fellan_meetlastagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meetlastagain, " ...ARCH BELIAR NOMEN SAKT DAGAR HAR... " ,dia_fellan_meetlastagain_yes);
	};
	Info_AddChoice(dia_fellan_meetlastagain, " Не важно. " ,dia_fellan_meetlastagain_no);
};

func void dia_fellan_meet_no()
{
	AI_Output(other,self, " DIA_Fellan_MeetLastAgain_No_01_00 " );	// Okay, forget about it.
	AI_Output(self,other, " DIA_Fellan_MeetLastAgain_No_01_01 " );	// Well, if that's the case, then I'll probably get back to my trading. You dont mind?
	AI_StopProcessInfos(self);
};

func void dia_fellan_meetlastagain_yes()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[ 0 ] = " Fellangor " ;
	FELLANGORTHIRDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self, " DIA_Fellan_MeetLastAgain_Yes_01_00 " );	// ...ARCH BELIAR NOMEN SAKT DAGAR KHAR...!
	AI_Output(self,other, " DIA_Fellan_MeetLastAgain_Yes_01_01 " );	// I can't hide from you, human... You tracked me down again!
	AI_Output(other,self, " DIA_Fellan_MeetLastAgain_Yes_01_02 " );	// Enough this time - you can't get away! Better get ready to die.
	AI_Output(self,other, " DIA_Fellan_MeetLastAgain_Yes_01_03 " );	// Wait! (beseechingly) Please, have mercy on me! And my gratitude will know no equal.
	B_LogEntry( TOPIC_BELIARHELPME , " I've caught Fellangor! Now he won't escape me. All I have to do is use the amulet to put an end to his torment. " );
	Info_ClearChoices(dia_fellan_meetlastagain);
	Info_AddChoice(dia_fallan_meetlastagain, " What do you have to offer? " ,dia_fallan_meetlastagain_what);
	Info_AddChoice(dia_fallan_meetlastagain, " Well, okay. I agree. " ,dia_fallan_meetlastagain_free);
	Info_AddChoice(dia_fellan_meetlastagain, " I will finish what I started. " ,dia_fallan_meetlastagain_kill);
};

func void dia_fellan_meetlastagain_what()
{
	AI_Output(other,self, " DIA_Fellan_MeetLastAgain_What_01_00 " );	// What can you suggest?
	AI_Output(self,other, " DIA_Fellan_MeetLastAgain_What_01_01 " );	// Something that grants you great strength and power... (seriously) And it's up to you to own it or not!
};

func void dia_fellan_meet_free()
{
	AI_Output(other,self, " DIA_Fellan_MeetLastAgain_Free_01_00 " );	// Okay. I agree.
	AI_Output(self,other, " DIA_Fellan_MeetLastAgain_Free_01_01 " );	// Thank you, human. And as proof of my words, here - take this ring!
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		CreateInvItems(self,itri_fellangor_magic,1);
		B_GiveInvItems(self,other,itri_fellangor_magic,1);
	}
	else
	{
		CreateInvItems(self,itri_fellangor,1);
		B_GiveInvItems(self,other,itri_fellangor,1);
	};
	AI_Output(other,self, " DIA_Fellan_MeetLastAgain_Free_01_02 " );	// Ring? And just?
	AI_Output(self,other, " DIA_Fellan_MeetLastAgain_Free_01_03 " );	// You're unlikely to find anything like him in this world.
	AI_Output(self,other, " DIA_Fellan_MeetLastAgain_Free_01_04 " );	// Put it on and you'll know I'm telling the truth.
	AI_Output(self,other, " DIA_Fellan_MeetLastAgain_Free_01_05 " );	// And now goodbye!
	FELLANGORSAVE = TRUE;
	Info_ClearChoices(dia_fellan_meetlastagain);
	Info_AddChoice(dia_fellan_meetlastagain,Dialog_Ende,dia_fellan_meetlastagain_ext);
};

func void dia_fellan_meetlastagain_ext()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};

func void dia_fellan_meetlastagain_kill()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Kill_01_00");	//Нет!
	AI_Output(other,self, " DIA_Fellan_MeetLastAgain_Kill_01_01 " );	// You can't escape retribution! Die!
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Kill_01_02");	//Аргхх...(обреченно)
	Info_ClearChoices(dia_fellan_meetlastagain);
	Info_AddChoice(dia_fellan_meetlastagain, " ...(use amulet) " ,dia_fallan_meetlastagain_extkill);
};

func void dia_fellan_meetlastagain_extkill()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};
