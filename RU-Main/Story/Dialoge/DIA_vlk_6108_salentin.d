

instance DIA_SALENTIN_EXIT(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 999;
	condition = dia_salentin_exit_condition;
	information = dia_salentin_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_salentin_exit_condition()
{
	return TRUE;
};

func void dia_salentin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALENTIN_HALLO (C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_hallo_condition;
	information = dia_salentin_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salentin_hallo_condition()
{
	return TRUE;
};

func void dia_salentin_hallo_info()
{
	AI_Output(self,other, " DIA_Salentin_Hallo_01_00 " );	// (surprised) Hey! What are you doing here?! How did you even get here?
	AI_Output(self,other, " DIA_Salentin_Hallo_01_01 " );	// If the paladins notice, they'll kill you!
	AI_Output(other,self, " DIA_Salentin_Hallo_01_02 " );	// Don't worry, I'll deal with them somehow.
	AI_Output(self,other, " DIA_Salentin_Hallo_01_03 " );	// WHAT?! They won't listen to you! Do you have any idea what this place is?
	AI_Output(self,other, " DIA_Salentin_Hallo_01_04 " );	// Oh man, my advice to you is better get out of here before it's too late.
	BEONETLU = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SALENTIN_BAUERNAURUFSTAND (C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_bauernaufstand_condition;
	information = dia_salentin_bauernaufstand_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_salentin_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_salentin_bauernaufstand_info()
{
	AI_Output(other,self, " DIA_Salentin_Bauernaufstand_01_00 " );	// Who are you?
	AI_Output(self,other, " DIA_Salentin_Bauernaufstand_01_01 " );	// What?! Are you still here?
	AI_Output(other,self, " DIA_Salentin_Bauernaufstand_01_03 " );	// Don't worry like that. I'm here on business.
	AI_Output(self,other, " DIA_Salentin_Bauernaufstand_01_04 " );	// I wonder what business could bring a man like you here?
	AI_Output(other,self, " DIA_Salentin_Bauernaufstand_01_05 " );	// I'm looking for something. More precisely, an amulet - Triramar. Do you know anything about him?
	AI_Output(self,other, " DIA_Salentin_Bauernaufstand_01_06 " );	// Triramar? What's that?
	AI_Output(other,self, " DIA_Salentin_Bauernaufstand_01_08 " );	// I told you - an amulet. I really need it and I won't leave here without it.
	AI_Output(self,other, " DIA_Salentin_Bauernaufstand_01_09 " );	// (laughs) You're not going anywhere from here anyway!
	AI_Output(self,other, " DIA_Salentin_Bauernaufstand_01_10 " );	// The only way off this island is through the magical portal behind the chapel to the north, but it's guarded by paladins.
	AI_Output(self,other, " DIA_Salentin_Bauernaufstand_01_11 " );	// And I don't think they'll let you out of here alive.
	AI_Output(self,other, " DIA_Salentin_Bauernaufstand_01_12 " );	// You, my friend, are in trouble.
};


instance DIA_SALENTIN_TRIRAMAR (C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_triramar_condition;
	information = dia_salentin_triramar_info;
	permanent = FALSE;
	description = " Where do paladins keep this amulet? " ;
};


func int dia_salentin_triramar_condition()
{
	if (Npc_KnowsInfo(other,dia_salentin_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_salentin_triramar_info()
{
	AI_Output(other,self, " DIA_Salentin_Triramar_01_00 " );	// Chapel, you say? Could the amulet be kept there?
	AI_Output(self,other, " DIA_Salentin_Triramar_01_01 " );	// I have no idea what is stored there. I do not approach the place, ever.
	AI_Output(other,self, " DIA_Salentin_Triramar_01_03 " );	// Just tell me - where is this chapel?
	AI_Output(self,other, " DIA_Salentin_Triramar_01_04 " );	// Crazy, definitely crazy.
	AI_Output(self,other, " DIA_Salentin_Triramar_01_06 " );	// The chapel is north of my hut. And since you're going there, I'll ask you for one favor...
	AI_Output(self,other, " DIA_Salentin_Triramar_01_07 " );	// ...make sure you don't get killed too close to it - I could use your gear.
	AI_Output(other,self, " DIA_Salentin_Triramar_01_08 " );	// Funny. Tell me, are there many paladins in the chapel?
	AI_Output(self,other, " DIA_Salentin_Triramar_01_11 " );	// No, the main part, together with the command, lodges in a camp in the east of the island.
	AI_Output(other,self, " DIA_Salentin_Triramar_01_12 " );	// Then I'll visit them in the camp.
	AI_Output(self,other, " DIA_Salentin_Triramar_01_13 " );	// WHAT?! You really are suicidal!
};


instance DIA_SALENTIN_GETOUT(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_getout_condition;
	information = dia_salentin_getout_info;
	permanent = FALSE;
	description = " How else can you get off this island? " ;
};


func int dia_salentin_getout_condition()
{
	if (Npc_KnowsInfo(other,dia_salentin_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_salentin_getout_info()
{
	AI_Output(other,self, " DIA_Salentin_GetOut_01_00 " );	// How else can you get off this island?
	AI_Output(self,other, " DIA_Salentin_GetOut_02_01 " );	// None!
	AI_Output(self,other, " DIA_Salentin_GetOut_04_03 " );	// I have this island in my blood at this point.
	AI_Output(self,other, " DIA_Salentin_GetOut_05_04 " );	// The Paladins, thank Innos, don't touch me, but they don't let me near the portal either.
};


instance DIA_SALENTIN_HOWIN(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_howin_condition;
	information = dia_salentin_howin_info;
	permanent = FALSE;
	description = " How did you end up here yourself? " ;
};


func int dia_salentin_howin_condition()
{
	if (Npc_KnowsInfo(other,dia_salentin_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_salentin_howin_info()
{
	AI_Output(other,self, " DIA_Salentin_HowIn_01_00 " );	// How did you end up here?
	AI_Output(self,other, " DIA_Salentin_HowIn_01_04 " );	// Once I was a sailor and served on one of the merchant ships. We were transporting magical ore from a godforsaken colony...
	AI_Output(self,other, " DIA_Salentin_HowIn_01_05 " );	// One day, while returning to the mainland, our ship was caught in a terrible storm. The ship did not survive it - it broke in two. And I was swept away to the open sea.
	AI_Output(self,other, " DIA_Salentin_HowIn_01_09 " );	// I woke up on the island, and a bunch of paladins crowded around me.
	AI_Output(other,self, " DIA_Salentin_HowIn_01_10 " );	// Why did they let you live?
	AI_Output(self,other, " DIA_Salentin_HowIn_01_11 " );	// Well, paladins aren't beasts. Moreover, I ended up on their island against my will.
	AI_Output(self,other, " DIA_Salentin_HowIn_01_13 " );	// They let me stay and live on this island. They gave me food, new clothes and even tools!
	AI_Output(other,self, " DIA_Salentin_HowIn_01_14 " );	// Why didn't you stay with them?
	AI_Output(self,other, " DIA_Salentin_HowIn_01_15 " );	// Boy, this is a military camp, not an inn.
	AI_Output(self,other, " DIA_Salentin_HowIn_01_23 " );	// I try to avoid being around them. And I advise you to do the same!
};


instance DIA_SALENTIN_CANPASS (C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_canpass_condition;
	information = dia_salentin_canpass_info;
	permanent = FALSE;
	description = " Do you visit the paladin camp yourself? " ;
};


func int dia_salentin_canpass_condition()
{
	if(Npc_KnowsInfo(other,dia_salentin_howin) && (MIS_BELIARHELPME == LOG_SUCCESS) && (CANUSEZIGOSMAGIC == TRUE) && (MEHASTRIRAVAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_salentin_canpass_info()
{
	AI_Output(other,self, " DIA_Salentin_CanPass_01_00 " );	// Do you ever visit the paladin camp?
	AI_Output(self,other, " DIA_Salentin_CanPass_01_01 " );	// Yes, a couple of times a month I bring them fish that I manage to catch.
	AI_Output(self,other, " DIA_Salentin_CanPass_01_02 " );	// And in return they give me meat and water. So at least my diet is somewhat varied.
	AI_Output(other,self, " DIA_Salentin_CanPass_01_03 " );	// So they trust you if they let you into the camp?
	AI_Output(self,other, " DIA_Salentin_CanPass_01_04 " );	// Not that they trust me, but I don't pose the slightest danger to them, so they tolerate me.
	AI_Output(self,other, " DIA_Salentin_CanPass_01_05 " );	// I also try never to anger them. Why are you asking?
	TELLSALENTINLAGER = TRUE;
	Info_ClearChoices(dia_salentin_canpass);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpass, " I think I can use you. " ,dia_salentin_canpass_yes);
	};
	Info_AddChoice(dia_salentin_canpass, " Just wondering. " ,dia_salentin_canpass_no);
};

func void dia_salentin_canpass_no()
{
	AI_Output(other,self, " DIA_Salentin_CanPass_No_01_00 " );	// Just wondering.
	AI_Output(self,other,"DIA_Salentin_CanPass_No_01_01");	//Hmmm...
	Info_ClearChoices(dia_salentin_canpass);
};

func void dia_salentin_canpass_yes()
{
	AI_Output(other,self, " DIA_Salentin_CanPass_Yes_01_00 " );	// I think I'll need you.
	AI_Output(other,self, " DIA_Salentin_CanPass_Yes_01_01 " );	// Since the paladins trust you, I'll use you to infiltrate their camp.
	AI_Output(self,other, " DIA_Salentin_CanPass_Yes_01_02 " );	// Are you serious?
	Info_ClearChoices(dia_salentin_canpass);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpass, " ...GVAR SAKH ESK SHATAR...! " ,dia_salentin_canpass_use);
	};
};

func void dia_salentin_canpass_use()
{
	B_GivePlayerXP(100);
	Snd_Play("DEM_WARN");
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self, " DIA_Salentin_CanPass_Use_01_00 " );	// ...GVAR SAKH ESK SHATAR...!
	AI_Output(other,self, " DIA_Salentin_CanPass_Use_01_01 " );	// Beliar, Lord of Darkness! Grant me your power to take on the form of this mortal worm!
	AI_Output(other,self, " DIA_Salentin_CanPass_Use_01_02 " );	// And complete what I'm here for!
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other, " DIA_Salentin_CanPass_Use_01_03 " );	// O Innos! Who are you? Do you serve Beliar?!
	AI_Output(self,other, " DIA_Salentin_CanPass_Use_01_04 " );	// And what is this magic?! Oh my gods, what's happening to me! Nooo...
	USESALENTINAMULET = TRUE;
	Info_ClearChoices(dia_salentin_canpass);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpass, " (use amulet) " ,dia_salentin_canpass_usedead);
	};
};

func void dia_salentin_canpass_usedead()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_SALENTIN_CANPASSAGAIN (C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_canpassagain_condition;
	information = dia_salentin_canpassagain_info;
	permanent = TRUE;
	description = " I have business with you. " ;
};


func int dia_salentin_canpassagain_condition()
{
	if((TELLSALENTINLAGER == TRUE) && (USESALENTINAMULET == FALSE) && (CANUSEZIGOSMAGIC == TRUE) && (MEHASTRIRAVAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_salentin_canpassagain_info()
{
	AI_Output(other,self, " DIA_Salentin_CanPassAgain_01_00 " );	// I have business with you.
	AI_Output(self,other, " DIA_Salentin_CanPassAgain_01_01 " );	// What exactly?
	Info_ClearChoices(dia_salentin_canpassagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpassagain, " I think I can use you. " ,dia_salentin_canpassagain_yes);
	};
	Info_AddChoice(dia_salentin_canpassagain, " Just wondering. " ,dia_salentin_canpassagain_no);
};

func void dia_salentin_canpassagain_no()
{
	AI_Output(other,self, " DIA_Salentin_CanPassAgain_No_01_00 " );	// Forget about it for now.
	AI_Output(self,other, " DIA_Salentin_CanPassAgain_No_01_01 " );	// Hmmm... Well, whatever you say.
	Info_ClearChoices(dia_salentin_canpassagain);
};

func void dia_salentin_canpassagain_yes()
{
	AI_Output(other,self, " DIA_Salentin_CanPass_Yes_01_00 " );	// I think I'll need you.
	AI_Output(other,self, " DIA_Salentin_CanPass_Yes_01_01 " );	// Since the paladins trust you, I'll use you to infiltrate their camp.
	AI_Output(self,other, " DIA_Salentin_CanPass_Yes_01_02 " );	// Are you serious?
	Info_ClearChoices(dia_salentin_canpassagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpassagain, " ...GVAR SAKH ESK SHATAR...! " ,dia_salentin_canpassagain_use);
	};
};

func void dia_salentin_canpassagain_use()
{
	B_GivePlayerXP(100);
	Snd_Play("DEM_WARN");
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self, " DIA_Salentin_CanPass_Use_01_00 " );	// ...GVAR SAKH ESK SHATAR...!
	AI_Output(other,self, " DIA_Salentin_CanPass_Use_01_01 " );	// Beliar, Lord of Darkness! Grant me your power to take on the form of this mortal worm!
	AI_Output(other,self, " DIA_Salentin_CanPass_Use_01_02 " );	// And complete what I'm here for!
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other, " DIA_Salentin_CanPass_Use_01_03 " );	// O Innos! Who are you? Do you serve Beliar?!
	AI_Output(self,other, " DIA_Salentin_CanPass_Use_01_04 " );	// And what is this magic?! Oh my gods, what's happening to me! Nooo...
	USESALENTINAMULET = TRUE;
	Info_ClearChoices(dia_salentin_canpassagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpassagain, " (use amulet) " ,dia_salentin_canpassagain_usedead);
	};
};

func void dia_salentin_canpassagain_usedead()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_SALENTIN_ADVICE(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_advice_condition;
	information = dia_salentin_advice_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salentin_advice_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_salentin_triramar ) && ( USESALENTINAMULET  ==  FALSE ) && Npc_KnowsInfo ( hero , dia_salentin_howin ))
	{
		return TRUE;
	};
};

func void dia_salentin_advice_info()
{
	AI_Output(self,other, " DIA_Salentin_Advice_01_00 " );	// Hey, wait!
	AI_Output(other,self, " DIA_Salentin_Advice_01_01 " );	// What?
	AI_Output(self,other, " DIA_Salentin_Advice_01_02 " );	// If you're serious about visiting the paladin camp...
	AI_Output(self,other, " DIA_Salentin_Advice_01_04 " );	// ...don't go there during the day - you won't have a single chance to do what you have in mind.
	AI_Output(self,other, " DIA_Salentin_Advice_01_05 " );	// The best time is at night. The camp will sleep, - well, maybe, except for a couple of people.
	AI_Output(other,self, " DIA_Salentin_Advice_01_07 " );	// How do you know all this?
	AI_Output(self,other, " DIA_Salentin_Advice_01_08 " );	// What's it matter? Just remember what I told you.
};
