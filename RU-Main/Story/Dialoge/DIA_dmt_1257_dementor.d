

instance DIA_DMT_1257_DEMENTOR_EXIT(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 999;
	condition = dia_dmt_1257_dementor_exit_condition;
	information = dia_dmt_1257_dementor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dmt_1257_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1257_dementor_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_DMT_1257_DEMENTOR_FIRST(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_first_condition;
	information = dia_dmt_1257_dementor_first_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_dmt_1257_dementor_first_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DEMENTORMEET == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_first_info()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
};


instance DIA_DMT_1257_DEMENTOR_HELLO(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_hello_condition;
	information = dia_dmt_1257_dementor_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dmt_1257_dementor_hello_condition()
{
	if(BELIARSERVANTHERE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_hello_info()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_00 " );	// The master has heard your call, despicable mortal...
	AI_Output(other,self, " DIA_DMT_1257_Dementor_Hello_01_01 " );	// WHAT?! Who are you?
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_02 " );	// My name is Zygos, and I am the one sent by my lord to help you. Or didn't you ask for help, praying before his altar?
	AI_Output(other,self, " DIA_DMT_1257_Dementor_Hello_01_03 " );	// So Beliar himself sent you?
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_04 " );	// You are perceptive, mortal.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_06 " );	// The master knows of your intentions to take possession of the amulet that the paladins of Innos so zealously guard.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_07 " );	// And I'm ready to tell you the way that can return this lost artifact.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_09 " );	// Listen to me carefully, mortal...
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_10 " );	// Many centuries ago, my master chose a servant among mortals, granting him the ability to take on the form of any person he chose at will. His name was Fellangor!
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_11 " );	// The master desired that his chosen one tarnish the good name of paladins and fire mages, doing terrible atrocities in their guise.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_12 " );	// But like all mortals, he did not cope with such a wonderful gift! His mind was too weak to cope with the power bestowed upon him.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_13 " );	// Completely mad, this insignificant worm forgot his true purpose and ceased to serve the Dark God.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_14 " );	// Since then, he has been wandering the world, taking on the guise of various people...
	AI_Output(other,self, " DIA_DMT_1257_Dementor_Hello_01_15 " );	// And what is my role in this?
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_16 " );	// Don't you understand yet? If you were in the place of that madman, you could easily deceive the paladins guarding the Triramar amulet, clouding their eyes.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_17 " );	// True, for this you would have to find a person they trust. But for sure it won't be a big problem for you.
	AI_Output(other,self, " DIA_DMT_1257_Dementor_Hello_01_18 " );	// So you're saying that Beliar can also grant me the ability to shape-shift?
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_20 " );	// He'll let you use his gift once!
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_01_21 " );	// And, of course, only after you do him one small favor. Do you agree?
	DEMENTORMEET = TRUE;
	Info_ClearChoices(dia_dmt_1257_dementor_hello);
	Info_AddChoice(dia_dmt_1257_dementor_hello, " No, this is not for me. " ,dia_dmt_1257_dementor_hello_no);
	Info_AddChoice(dia_dmt_1257_dementor_hello,"Да, конечно.",dia_dmt_1257_dementor_hello_yes);
};

func void dia_dmt_1257_dementor_hello_no()
{
	AI_Output(other,self, " DIA_DMT_1257_Dementor_Hello_No_01_01 " );	// No, this is not for me.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_No_01_02 " );	// Then farewell, mortal! We don't see each other anymore...
	Info_ClearChoices(dia_dmt_1257_dementor_hello);
	Info_AddChoice(dia_dmt_1257_dementor_hello,Dialog_Ende,dia_dmt_1257_dementor_hello_ext);
};

func void dia_dmt_1257_dementor_hello_ext()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};

func void dia_dmt_1257_dementor_hello_yes()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_Yes_01_01");	//Да.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_Yes_01_02 " );	// Well. Then, for starters, here, take this thing.
	CreateInvItems(self,itam_zigosmagic,1);
	B_GiveInvItems(self,other,itam_zigosmagic,1);
	MIS_BELIARHELPME = LOG_Running;
	AI_Output(other,self, " DIA_DMT_1257_Dementor_Hello_Yes_01_03 " );	// Is this a magical amulet?
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_Yes_01_04 " );	// Yes, that's right. True, now, as you can see, there is not even a hint of its magical properties in it.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_Yes_01_07 " );	// You should find the madman who once swore allegiance to my master. Find and kill him!
	AI_Output(other,self, " DIA_DMT_1257_Dementor_Hello_Yes_01_10 " );	// Based on what you said, this person could be anyone!
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_Yes_01_13 " );	// Just say the words - '...ARCH BELIAR NOMEN SAKT DAGAR KHAR...' and use the magic of the amulet you received on him.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_Yes_01_14 " );	// True, I'm afraid that its power is unlikely to completely deprive your future enemy of vitality, because it is quite powerful.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_Yes_01_17 " );	// You can't just kill him!
	AI_Output(self,other, " DIA_DMT_1257_Dementor_Hello_Yes_01_19 " );	// Now go. And then you will receive your reward, as the help that my master asked for.
	Log_CreateTopic(TOPIC_BELIARHELPME,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_Running);
	B_LogEntry( TOPIC_BELIARHELPME , " Beliar answered my call and sent his servant - the dark messenger Zygos. He told me a story about a certain person - Fellangor, to whom Beliar granted the ability to take on the appearance of other people. However, his chosen one, unable to withstand the burden of such power, at the end in the end, he simply went mad and renounced the Dark God. " );
	Log_AddEntry( TOPIC_BELIARHELPME , " As it turns out, Zygos told me the story of this madman for a reason. Using the ability to take on the form of another person, I can deceive and mislead anyone I want, including the paladins of Innos guarding the amulet on the island. True , this is the person they should trust. " );
	Log_AddEntry( TOPIC_BELIARHELPME , " However, in order to get my hands on this dark magic, Zygos first demanded that I find and kill the madman who had rejected his master in his time. This person can be anyone, and I will have to work hard to find him. In case I meet him, Zygos gave me a magical amulet, the power of which will help me defeat Beliar's chosen one. " );
	Log_AddEntry( TOPIC_BELIARHELPME , " Before I use the amulet on my victim, I need to say the words of the spell - 'ARCH BELIAR NOMEN SAKT DAGAR HAR'. Without them, the power of the amulet will not work. Zygos also warned me that the amulet is not capable of killing him overnight crazy, so I'll have to use it multiple times. " );
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		B_StartOtherRoutine(Fellan,"Insane");
		AI_Teleport(Fellan,"NW_FELLAN_REPAIR_01");
	}
	else
	{
		FLAGFELLANUP = TRUE;
	};
	Info_ClearChoices(dia_dmt_1257_dementor_hello);
};


instance DIA_DMT_1257_DEMENTOR_WHATITMEANS(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_whatitmeans_condition;
	information = dia_dmt_1257_dementor_whatitmeans_info;
	permanent = FALSE;
	description = " What do the words 'ARCH BELIAR NOMEN SAKT DAGAR KHAR' mean? " ;
};


func int dia_dmt_1257_dementor_whatitmeans_condition()
{
	if (( MY_BELIARHELPME  == LOG_Running) && ( FELLANGORSAVE  ==  FALSE ) && ( INSANEKILLDONE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_whatitmeans_info()
{
	AI_Output(other,self, " DIA_DMT_1257_Dementor_WhatItMeans_01_00 " );	// What do the words 'ARCH BELIAR NOMEN SAKT DAGAR KHAR' mean?
	AI_Output(self,other, " DIA_DMT_1257_Dementor_WhatItMeans_01_01 " );	// In the ancient language of Darkness, they mean: 'IN THE NAME OF BELIARS, LORD OF THE DARKNESS AND LORD OF THE FORCES OF EVIL - RETURN THE POWER OF YOUR GOD AND PAY THE PRICE SET FOR'.
};


instance DIA_DMT_1257_DEMENTOR_DONEPRICE(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_doneprice_condition;
	information = dia_dmt_1257_dementor_doneprice_info;
	permanent = FALSE;
	description = " I did what you asked. " ;
};


func int dia_dmt_1257_dementor_doneprice_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (INSANEKILLDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_doneprice_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_DMT_1257_Dementor_DonePrice_01_00 " );	// I did what you asked for.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_01 " );	// (powerfully) I already know that! My master will be pleased with this news.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_04 " );	// And that amulet that I gave you, is it still with you?
	if(Npc_HasItems(hero,itam_zigosmagic) >= 1)
	{
		AI_Output(other,self, " DIA_DMT_1257_Dementor_DonePrice_01_05 " );	// Yes, here it is.
		AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_06 " );	// Good. Then keep it with you as your promised reward.
		AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_07 " );	// Although, apparently, you do not understand now how you will use it in your upcoming case.
	}
	else
	{
		AI_Output(other,self, " DIA_DMT_1257_Dementor_DonePrice_01_08 " );	// I don't have one.
		AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_09 " );	// (angrily) Stupid! Have you lost it?
		AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_10 " );	// It was he who was the promised reward for your labors!
	};
	AI_Output(other,self, " DIA_DMT_1257_Dementor_DonePrice_01_12 " );	// Maybe then you can explain why I need it?
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_13 " );	// Of course. Having deprived Beliar's chosen one of vitality, this artifact absorbed a particle of his divine gift.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_14 " );	// Therefore, using it, you could take the form of any other living mortal.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_15 " );	// True, only once. After that, the power of the amulet will run out.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_19 " );	// But after using the amulet's magic and taking on the form of another person, you won't be able to fight or use any other magic spells.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePrice_01_20 " );	// Its enchantment is an extremely fragile substance, and any impact on it will instantly destroy it.
	MIS_BELIARHELPME = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_SUCCESS);
	B_LogEntry(TOPIC_BELIARHELPME,"I informed Zygos that I had dealt with that madman and asked about my reward. To this, Zygos replied that my reward was an amulet that I received from him earlier. After depriving his victim of vitality, this artifact absorbed a piece of the divine gift that Beliar bestowed on his mad servant, and now I can use it to take on the form of any other person, but only once. spell, otherwise the spell of his magic will be instantly dispelled.");
};


instance DIA_DMT_1257_DEMENTOR_HOWUSEAM(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_howuseam_condition;
	information = dia_dmt_1257_dementor_howuseam_info;
	permanent = FALSE;
	description = " How do I use the amulet? " ;
};


func int dia_dmt_1257_dementor_howuseam_condition()
{
	if((MIS_BELIARHELPME == LOG_SUCCESS) && (MEHASTRIRAVAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_howuseam_info()
{
	AI_Output(other,self, " DIA_DMT_1257_Dementor_HowUseAm_01_00 " );	// How do I use the amulet?
	AI_Output(self,other, " DIA_DMT_1257_Dementor_HowUseAm_01_01 " );	// It's very simple. Put it on and talk to whoever you want to become.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_HowUseAm_01_02 " );	// And then say the words of the spell that will awaken the magic of the amulet.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_HowUseAm_01_04 " );	// Listen and remember - '...GVAR SAKH ESK SHATAR...'! Without them, the power of the amulet will not affect your victim.
	; _ _ _ _ _ _
	CANUSEZIGOSMAGIC = TRUE;
	Info_ClearChoices(dia_dmt_1257_dementor_howuseam);
	Info_AddChoice(dia_dmt_1257_dementor_howuseam,Dialog_Ende,dia_dmt_1257_dementor_howuseam_ext);
};

func void dia_dmt_1257_dementor_howuseam_ext()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_DMT_1257_DEMENTOR_DONEPRICEFAILED(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_donepricefailed_condition;
	information = dia_dmt_1257_dementor_donepricefailed_info;
	permanent = FALSE;
	description = " I couldn't complete your task. " ;
};


func int dia_dmt_1257_dementor_donepricefailed_condition()
{
	if (( MY_BELIARHELP  == LOG_Running) && ( FELLOWSAVE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_donepricefailed_info()
{
	AI_Output(other,self, " DIA_DMT_1257_Dementor_DonePriceFailed_01_00 " );	// I failed to complete your task.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePriceFailed_01_01 " );	// (disappointed) You don't have to say anything! I already know about it.
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePriceFailed_01_02 " );	// Now you can not count on help from my master!
	AI_Output(self,other, " DIA_DMT_1257_Dementor_DonePriceFailed_01_04 " );	// Farewell, mortal. We don't see each other anymore...
	MIS_BELIARHELPME = LOG_OBSOLETE;
	Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
	Info_ClearChoices(dia_dmt_1257_dementor_donepricefailed);
	Info_AddChoice(dia_dmt_1257_dementor_donepricefailed,Dialog_Ende,dia_dmt_1257_dementor_donepricefailed_ext);
};

func void dia_dmt_1257_dementor_donepricefailed_ext()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};
