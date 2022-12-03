

instance DIA_PIR_6136_ABIGEIL_EXIT(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 999;
	condition = dia_pir_6136_abigeil_exit_condition;
	information = dia_pir_6136_abigeil_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pir_6136_abigeil_exit_condition()
{
	return TRUE;
};

func void dia_pir_6136_abigeil_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PIR_6136_ABIGEIL_PICKPOCKET(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 900;
	condition = dia_pir_6136_abigeil_pickpocket_condition;
	information = dia_pir_6136_abigeil_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pir_6136_abigeil_pickpocket_condition()
{
	return  C_Robbery ( 80 , 100 );
};

func void dia_pir_6136_abigeil_pickpocket_info()
{
	Info_ClearChoices(dia_pir_6136_abigeil_pickpocket);
	Info_AddChoice(dia_pir_6136_abigeil_pickpocket,Dialog_Back,dia_pir_6136_abigeil_pickpocket_back);
	Info_AddChoice(dia_pir_6136_abigeil_pickpocket,DIALOG_PICKPOCKET,dia_pir_6136_abigeil_pickpocket_doit);
};

func void dia_pir_6136_abigeil_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_pir_6136_abigeil_pickpocket);
};

func void dia_pir_6136_abigeil_pickpocket_back()
{
	Info_ClearChoices(dia_pir_6136_abigeil_pickpocket);
};


instance DIA_PIR_6136_ABIGEIL_HELLO(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_hello_condition;
	information = dia_pir_6136_abigeil_hello_info;
	permanent = FALSE;
	description = " Hello baby! Who are you?! " ;
};


func int dia_pir_6136_abigeil_hello_condition()
{
	return TRUE;
};

func void dia_pir_6136_abigeil_hello_info()
{
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_Hello_01_00 " );	// Hello baby! Who are you?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_Hello_01_01 " );	// What a baby I am to you, brat! And anyway, what's your business?
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_Hello_01_02 " );	// I just wanted to get to know you.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_Hello_01_03 " );	// Hmmm...(assessing) Well, just for fun, you can call me Abigail.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_Hello_01_04 " );	// Just don't try to climb on me, otherwise I'll bite your head off!
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_Hello_01_05 " );	// Wow, what manners! Tell me, are you a pirate too?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_Hello_01_06 " );	// (annoyed) No, I'm your grandmother.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_Hello_01_09 " );	// What a stupid question!
};


instance DIA_PIR_6136_ABIGEIL_MISSWEAPON(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_missweapon_condition;
	information = dia_pir_6136_abigeil_missweapon_info;
	permanent = FALSE;
	description = " So what's the problem? " ;
};


func int dia_pir_6136_abigeil_missweapon_condition()
{
	if(Npc_KnowsInfo(hero,dia_pir_6136_abigeil_hello))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_missweapon_info()
{
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeapon_01_00 " );	// What's your problem?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_01 " );	// Can't you see? (annoyed) I don't have my sword with me.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_03 " );	// I... (stammered) I lost her.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeapon_01_04 " );	// So get yourself some other weapon - is that such a big deal?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_05 " );	// All I need is my sword.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_08 " );	// This is a legacy from my father.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_09 " );	// In addition, it is not as simple as it seems at first glance.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_11 " );	// In my hands, her blade seems to come to life, and will pierce anyone who gets in my way.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeapon_01_12 " );	// Wow! Good thing.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_13 " );	// (laughs) And then I suppose he already rolled his lips on my good.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_16 " );	// But only I can manage it. If someone else tries to use it, this sword will simply kill him!
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeapon_01_17 " );	// And where did you lose it?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_18 " );	// During one swamp rat hunt, I got a little carried away and got too close to the bandit camp to the east.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_21 " );	// If it wasn't for my sword, I'd be dead by now.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_22 " );	// At the first lunge, I managed to stab two to death. The matter would have reached the others, too, if...
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_24 " );	// If not for this filthy fiery obscurantist... (angrily) I still don't understand where he came from!
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeapon_01_25 " );	// Fiery obscurantist?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_26 " );	// That fiery swamp stink shit attacked me from behind, and I lost my balance and fell to the ground, dropping my sword.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_29 " );	// For the first time in my life I had to flee and, by Beliar, the last!
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeapon_01_30 " );	// And what happened to the sword?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_31 " );	// Naturally, I had to leave her. I simply did not have time to look for her among the thickets of marsh grass.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_32 " );	// Now I'm stuck here in the camp all day, listening to stupid questions from smart people like you.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeapon_01_33 " );	// Why don't you come back and take your sword?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_34 " );	// What are you doing? (nervously) I can't take a step out of here without her!
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_35 " );	// I'm not very good with other weapons.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_01_36 " );	// Besides, I don't want to meet this fiery obscurantist again.
	Info_ClearChoices(dia_pir_6136_abigeil_missweapon);
	Info_AddChoice(dia_pir_6136_abigeil_missweapon, " Well, happy staying then! " ,dia_pir_6136_abigeil_missweapon_no);
	Info_AddChoice(dia_pir_6136_abigeil_missweapon, " What do I get if I return your sword? " ,dia_pir_6136_abigeil_missweapon_yes);
};

func void dia_pir_6136_abigeil_missweapon_no()
{
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeapon_No_01_01 " );	// I hope you find your sword someday.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_No_01_03 " );	// (annoyed) Enough talk already - leave me!
	ABIGEILPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pir_6136_abigeil_missweapon_yes()
{
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_00 " );	// And what will I get if I return your sword?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_01 " );	// What? (surprised) Do you want to help me?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_03 " );	// Well... (thoughtfully) I'm afraid I don't have anything that might interest you.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_04 " );	// If only this small stone tablet with some hieroglyphs.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_05 " );	// I also found it in one of the caves, not far from the canyon.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_06 " );	// They say she's magical! True, what is her magic - I did not understand.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_08 " );	// Give me back my sword and it's yours.
	Info_ClearChoices(dia_pir_6136_abigeil_missweapon);
	MIS_ABIGEILMISSWEAPON = LOG_Running;
	Log_CreateTopic(TOPIC_ABIGEILMISSWEAPON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ABIGEILMISSWEAPON,LOG_Running);
	B_LogEntry(TOPIC_ABIGEILMISSWEAPON,"At the pirate camp, I met a very nice girl named Abigail. She told me that somewhere in the swamps she had lost her sword. According to Abigail, this is not an ordinary sword, but a magic one. However, the magic of this little thing only works in her hands, for others it is deadly! I volunteered to help Abigail find this sword in exchange for a magical stone tablet, which, apparently, belongs to the architects. Abigail also warned me that not far from the place where this sword was lost, she stumbled upon a fiery mrakoris. We must be more careful.");
};


instance DIA_PIR_6136_ABIGEIL_FUCKOFF(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_fuckoff_condition;
	information = dia_pir_6136_abigeil_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pir_6136_abigeil_fuckoff_condition()
{
	if((ABIGEILPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_PIR_6136_ABIGEIL_LIFE(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_life_condition;
	information = dia_pir_6136_abigeil_life_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_pir_6136_abigeil_life_condition()
{
	if(Npc_KnowsInfo(hero,dia_pir_6136_abigeil_hello))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_life_info()
{
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_Life_01_00 " );	// How's life?
	if((MIS_ABIGEILMISSWEAPON == LOG_SUCCESS) && (MIS_ABIGEILHELPHANNA != LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_PIR_6136_Abigeil_Life_01_01 " );	// Everything is just fine, mate!
		AI_ReadyMeleeWeapon(self);
		AI_Output(self,other, " DIA_PIR_6136_Abigeil_Life_01_07 " );	// Look...
		AI_RemoveWeapon(self);
		AI_Output(self,other, " DIA_PIR_6136_Abigeil_Life_01_09 " );	// ...it's really good, isn't it?
	}
	else if((MIS_ABIGEILMISSWEAPON == LOG_SUCCESS) && (MIS_ABIGEILHELPHANNA == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_PIR_6136_Abigeil_Life_01_10 " );	// It couldn't be better.
	}
	else
	{
		AI_Output(self,other, " DIA_PIR_6136_Abigeil_Life_01_16 " );	// Bad! So you better not piss me off... Okay?!
	};
};


instance DIA_PIR_6136_ABIGEIL_MISSWEAPONDONE(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_missweapondone_condition;
	information = dia_pir_6136_abigeil_missweapondone_info;
	permanent = FALSE;
	description = " I found your sword. " ;
};


func int dia_pir_6136_abigeil_missweapondone_condition()
{
	if((MIS_ABIGEILMISSWEAPON == LOG_Running) && (Npc_HasItems(hero,itmw_abigeilspage) >= 1))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_missweapondone_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeaponDone_01_00 " );	// I found your sword.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeaponDone_01_01 " );	// Really? Can't be! Is that really her?
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeaponDone_01_04 " );	// Here, take a look.
	B_GiveInvItems(other,self,itmw_abigeilspage,1);
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_01_05");	//Хммм...(разглядывает)
	Info_ClearChoices(dia_pir_6136_abigeil_missweapondone);
	Info_AddChoice(dia_pir_6136_abigeil_missweapondone, " Узнаешь? " ,dia_pir_6136_abigeil_missweapondone_give);
};

func void dia_pir_6136_abigeil_missweapondone_give()
{
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_00 " );	// Узнаешь?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_01 " );	// Wow! And indeed she...
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_02 " );	// Finally my baby is with me again!
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_04 " );	// Oh yeah... (smiles) That's the stone tablet I told you about. Hold on!
	B_GiveInvItems(self,other,ItWr_HitPointStonePlate2_Addon,1);
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_06 " );	// Well done...(respectfully) I didn't think you'd have the courage to visit those places!
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_09 " );	// No reason. If you need anything, get back to me!
	MIS_ABIGEILMISSWEAPON = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ABIGEILMISSWEAPON,LOG_SUCCESS);
	B_LogEntry( TOPIC_ABIGEILMISSWEAPON , " I brought Abigail her sword. " );
};

instance DIA_PIR_6136_ABIGEIL_ABIGEILHELPHANNA(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_abigeilhelphanna_condition;
	information = dia_pir_6136_abigeil_abigeilhelphanna_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pir_6136_abigeil_abigeilhelphanna_condition()
{
	if((MIS_ABIGEILMISSWEAPON == LOG_SUCCESS) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_abigeilhelphanna_info()
{
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_00 " );	// Hey, wait! Can I ask you for one more favor?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_02 " );	// I promised my beloved sister to bring a golden necklace.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_09 " );	// Only now we don't have a ship!
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_11 " );	// My sister lives in Khorinis, and you can't get there without a ship.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_12 " );	// And you probably want me to do it?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_13 " );	// Well, yes! You, as I heard, are often there.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_15 " );	// Well... you yourself understand that every work has its price.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_17 " );	// Okay, if you help me, I'll give you... well, let's say two hundred gold coins.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_18 " );	// Идет?
	Info_ClearChoices(dia_pir_6136_abigeil_abigeilhelphanna);
	Info_AddChoice(dia_pir_6136_abigeil_abigeilhelphanna, " It's not worth it. " ,dia_pir_6136_abigeil_abigeilhelphanna_no);
	Info_AddChoice(dia_pir_6136_abigeil_abigeilhelphanna, " Okay, we've got a deal. " ,dia_pir_6136_abigeil_abigeilhelphanna_yes);
};

func void dia_pir_6136_abigeil_abigeilhelphanna_no()
{
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_No_01_00 " );	// It's not worth it.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_No_01_01 " );	// Well, you're a greedy bastard! (angrily) All you think about is yourself!
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_No_01_06 " );	// Go to hell, idiot!
	ABIGEILPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pir_6136_abigeil_abigeilhelphanna_yes()
{
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_00 " );	// Okay, consider, we agreed.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_01 " );	// Then here - take this golden necklace and take it to my sister.
	B_GiveInvItems(self,other,ITMI_HANNAGOLDNECKLACE,1);
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_02 " );	// What's your sister's name?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_03 " );	// Her name is Hanna, she is the owner of a hotel in Khorinis.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_04 " );	// Hannah is your sister?!
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_05 " );	// Hmmm. And why is everyone surprised when they find out about this? What's so amazing about this?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_09 " );	// (annoyed) Enough of these stupid questions.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_10 " );	// Okay, I got it.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_11 " );	// That's great. So it's better not to waste time and go to Khorinis.
	MIS_ABIGEILHELPHANNA = LOG_Running;
	Log_CreateTopic(TOPIC_ABIGEILHELPHANNA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ABIGEILHELPHANNA,LOG_Running);
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " Abigal asked me to take a gold necklace to Hanna, her sister in Khorinis. For this service, Abigail promised to pay me two hundred gold coins. " );
	AI_StopProcessInfos(self);
};


instance DIA_PIR_6136_ABIGEIL_INPRISION(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_inprision_condition;
	information = dia_pir_6136_abigeil_inprision_info;
	permanent = FALSE;
	description = " I'm afraid I have bad news for you. " ;
};


func int dia_pir_6136_abigeil_inprision_condition()
{
	if (( MIS_ABIGELHELP  == LOG_Running) && ( KNOWSHANNAPRESSABIGEIL  ==  TRUE ) && (Chapter <=  5 ))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_inprision_info()
{
	var C_Npc gregcap;
	gregcap = Hlp_GetNpc(PIR_1320_Addon_Greg);
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_00 " );	// I'm afraid I have bad news for you.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_01 " );	// What happened?
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_02 " );	// Your sister was accused of stealing and put in jail.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_03 " );	// (furious) What?! Damn! But how did it happen?
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_04 " );	// This is what I'm trying to figure out now. Therefore, I need your help.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_05 " );	// (besides himself) Damn! How dare they do this?!
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_06 " );	// Abigail, listen, I need your...
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_07 " );	// ...(ignoring) Well, they'll get it from me! I won't leave it like this!
	AI_TurnToNPC(self,gregcap);
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_08 " );	// Greg! (breaking into a scream) Immediately gather people - we will immediately attack Khorinis!
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_09 " );	// (Greg - "Are you out of your mind Abigail?")
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_10 " );	// WHAT ARE YOU GOING DEAF?! I SAY - I NEED YOUR HELP!
	AI_TurnToNPC(self,other);
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_11 " );	// Huh?! What? (bewildered) Damn! What help when my sister is behind bars?!
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_16 " );	// Tell me what you know about a man named Gasper?
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_17 " );	// Gaspar?! Hmmm...(thoughtfully) I think the name is familiar to me.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_22 " );	// Hanna told me once that a bastard named Gaspard offered to sell her her hotel to him.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_24 " );	// Aha! It seems now everything is clear to me.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_25 " );	// What is clear?
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_26 " );	// The fact is that it is Gasper who now runs everything in your sister's hotel.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_29 " );	// I think he set it all up and framed your sister.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_30 " );	// WHAT?! Let me gut him!
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrision_01_33 " );	// Calm down! I'll head back to Khorinis and try to find evidence against Gaspar.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrision_01_41 " );	// Okay, but hit that bastard hard!
	KNOWSHANNAINPRISIONCARAGON = TRUE;
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " After talking to Abigail, it all became clear to me. That Gaspard bastard has long wanted to get the inn run by Hannah. drop the charges against Hannah. Maybe try looking for that ring Hakon was talking about? " );
	AI_StopProcessInfos(self);
};


instance DIA_PIR_6136_ABIGEIL_INPRISIONDONE(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_inprisiondone_condition;
	information = dia_pir_6136_abigeil_inprisiondone_info;
	permanent = FALSE;
	description = " I have some news for you. " ;
};


func int dia_pir_6136_abigeil_inprisiondone_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISFREE == TRUE) && (HANNATAKESNECKLACE == TRUE) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_inprisiondone_info()
{
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrisionDone_01_00 " );	// I have news for you.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrisionDone_01_01 " );	// What's the news? What about my sister? Well, don't pull!
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrisionDone_01_02 " );	// Don't worry, everything's fine.
	AI_Output(other,self, " DIA_PIR_6136_Abigeil_InPrisionDone_01_03 " );	// Gaspar is behind bars, but your sister is free.
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrisionDone_01_04 " );	// (with adoration) Oh! Thank you!
	AI_Output(self,other, " DIA_PIR_6136_Abigeil_InPrisionDone_01_11 " );	// Here, as agreed - two hundred gold coins.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_ABIGEILHELPHANNA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ABIGEILHELPHANNA,LOG_SUCCESS);
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " Abigal thanked me for helping her sister. She even kissed me! " );
};
