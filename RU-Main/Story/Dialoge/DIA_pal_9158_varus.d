

instance DIA_PAL_9158_VARUS_EXIT(C_Info)
{
	npc = pal_9158_varus;
	nr = 999;
	condition = dia_pal_9158_varus_exit_condition;
	information = dia_pal_9158_varus_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9158_varus_exit_condition()
{
	return TRUE;
};

func void dia_pal_9158_varus_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_PAL_9158_VARUS_HALLO (C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_hallo_condition;
	information = dia_pal_9158_varus_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9158_varus_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_hallo_info()
{
	B_GivePlayerXP(100);
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_00 " );	// Hey man! I don't think you're in my squad!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_02 " );	// Greetings, Fire Mage!
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_03 " );	// Let me know what the servant of Innos needs from me?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_04 " );	// Greetings, waterbender!
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_05 " );	// Let me know what the servant of Adanos needs from me?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_06 " );	// I can't believe my eyes - the necromancer is in the paladin fort!
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_07 " );	// Who let you in here? What do you need here?
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_08 " );	// It can't be! (surprised) Just think - a mercenary in a paladin fort!
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_09 " );	// Who let you in here? What do you need here?
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_10 " );	// Hey, who are you?
		AI_Output(self,other, " DIA_Pal_9158_Varus_HALLO_01_11 " );	// Who let you in here? (terribly) What do you want here?
	};

	VarusMeet = TRUE ;
};


instance DIA_PAL_9158_VARUS_FORT(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_fort_condition;
	information = dia_pal_9158_varus_fort_info;
	permanent = FALSE;
	description = " Is this the paladin fort? " ;
};


func int dia_pal_9158_varus_fort_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_hallo))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_fort_info()
{
	AI_Output(other,self, " DIA_Pal_9158_Varus_Fort_01_01 " );	// Is this the paladin fort?
	AI_Output(self,other, " DIA_Pal_9158_Varus_Fort_01_02 " );	// He's the most...(grouchily) Or do you think this place looks like something else?!
	AI_Output(other,self, " DIA_Pal_9158_Varus_Fort_01_03 " );	// I just asked.
	AI_Output(self,other, " DIA_Pal_9158_Varus_Fort_01_04 " );	// (annoyed) Stop pestering me with stupid questions!
	AI_Output(self,other, " DIA_Pal_9158_Varus_Fort_01_07 " );	// So either talk to the point or get lost.
};


instances DIA_PAL_9158_VARUS_MATTER (C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_matter_condition;
	information = dia_pal_9158_varus_matter_info;
	permanent = FALSE;
	description = " I'm here on behalf of Lord Hagen. " ;
};


func int dia_pal_9158_varus_matter_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && (HAGENSENTTOVARUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_matter_info()
{
	AI_Output(other,self, " DIA_Pal_9158_Varus_Matter_01_00 " );	// I'm here on behalf of Lord Hagen.
	AI_Output(self,other, " DIA_Pal_9158_Varus_Matter_01_01 " );	// Lord Hagen himself sent you? Hmmm... (thoughtfully) Very interesting!
	AI_Output(self,other, " DIA_Pal_9158_Varus_Matter_01_02 " );	// And what is it?
	AI_Output(other,self, " DIA_Pal_9158_Varus_Matter_01_03 " );	// At the moment, Hagen is busy with the issue of establishing a food supply for the paladins.
	AI_Output(other,self, " DIA_Pal_9158_Varus_Matter_01_04 " );	// So he wants you to prepare a list of the provisions you need for him.
	AI_Output(self,other, " DIA_Pal_9158_Varus_Matter_01_06 " );	// Well, finally! Like it's on time. (maliciously) And I already thought that they simply forgot about us here!
	AI_Output(self,other, " DIA_Pal_9158_Varus_Matter_01_07 " );	// Even I myself wanted to send a man to him, but now I see that there is no special need for this.
	AI_Output(other,self, " DIA_Pal_9158_Varus_Matter_01_08 " );	// What about the list?
	AI_Output(self,other, " DIA_Pal_9158_Varus_Matter_01_09 " );	// Don't worry, I'll start compiling it immediately.
	AI_Output(self,other, " DIA_Pal_9158_Varus_Matter_01_10 " );	// True, this will take a little time... (thoughtfully)
	AI_Output(self,other, " DIA_Pal_9158_Varus_Matter_01_14 " );	// I think in a couple of days - but not before!
	AI_Output(self,other, " DIA_Pal_9158_Varus_Matter_01_15 " );	// So in the meantime, look around here, meet my guys - basically, do something useful.
	AI_Output(other,self, " DIA_Pal_9158_Varus_Matter_01_16 " );	// Okay, I'll do that.
	ITEM TIMER = Wld_GetDay();
	B_LogEntry( TOPIC_PALADINFOOD , " Lord Varus will provide Hagen with a list of provisions for his people, but this will take at least two days. " );
};


instance DIA_PAL_9158_VARUS_MATTERDONE(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_matterdone_condition;
	information = dia_pal_9158_varus_matterdone_info;
	permanent = TRUE;
	description = " About the list... " ;
};


func int dia_pal_9158_varus_matterdone_condition()
{
	if (( MIS_PALADINFOOD  == LOG_Running) && Npc_KnowsInfo(hero,dia_pal_9158_varus_matter) && ( VARUSSENTTOHAGEN  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_matterdone_info()
{
	where int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_Pal_9158_Varus_MatterDone_01_00 " );	// About the list...
	if ( VARUSHOURS  <= (daynow -  2 ))
	{
		B_GivePlayerXP(250);
		EQUIPMENT HAGEN = TRUE ;
		AI_Output(self,other, " DIA_Pal_9158_Varus_MatterDone_01_01 " );	// Yes, you're just in time - it's ready.
		AI_Output(self,other, " DIA_Pal_9158_Varus_MatterDone_01_02 " );	// Here - take it and take it to Lord Hagen.
		B_GiveInvItems(self,other,itwr_varuscontent,1);
		AI_Output(other,self,"DIA_Pal_9158_Varus_MatterDone_01_03");	//Отлично!
		B_LogEntry( TOPIC_PALADINFOOD , " Lord Varus has prepared the list I need. Now I must take it to Lord Hagen. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_MatterDone_01_04 " );	// I told you it wouldn't be ready until a couple of days later.
		AI_Output(self,other, " DIA_Pal_9158_Varus_MatterDone_01_05 " );	// So check back later.
		AI_Output(other,self,"DIA_Pal_9158_Varus_MatterDone_01_06");	//Хорошо.
	};
};


instance DIA_PAL_9158_VARUS_PALCOUNT(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_palcount_condition;
	information = dia_pal_9158_varus_palcount_info;
	permanent = FALSE;
	description = " How many paladins are in the fort? " ;
};


func int dia_pal_9158_varus_palcount_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_fort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_palcount_info()
{
	AI_Output(other,self, " DIA_Pal_9158_Varus_PalCount_01_01 " );	// How many paladins are in the fort?
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_02 " );	// My squad has about fifty fighters. Why are you asking?
	AI_Output(other,self, " DIA_Pal_9158_Varus_PalCount_01_03 " );	// It seems to me that fifty fighters will not be able to hold back the orcs if they begin to break into Khorinis.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_04 " );	// Ha! You underestimate my guys, son... (laughs) They are the best soldiers in the kingdom!
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_05 " );	// Each of them is able to easily lay down two or even three orcs.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_06 " );	// And these are not just empty words - it really is!
	AI_Output(other,self, " DIA_Pal_9158_Varus_PalCount_01_07 " );	// What about elite orcs?
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_08 " );	// Hmmm...(thoughtfully) You're right! Elite orcs are really serious opponents.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_09 " );	// However, their only advantage over us is their number and nothing more!
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_10 " );	// And numerical superiority itself does not guarantee them victory.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_11 " );	// As for tactics and strategy, the orcs will never surpass us in this.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_12 " );	// Believe me, I have been to many wars and I can say this without a shadow of a doubt.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalCount_01_13 " );	// So we'll deal with them somehow!
	AI_Output(other,self, " DIA_Pal_9158_Varus_PalCount_01_14 " );	// I want to believe it.
};


instance DIA_PAL_9158_VARUS_PALMORALE (C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_palmorale_condition;
	information = dia_pal_9158_varus_palmorale_info;
	permanent = FALSE;
	description = " How are your people feeling? " ;
};


func int dia_pal_9158_varus_palmorale_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_fort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_palmorale_info()
{
	AI_Output(other,self, " DIA_Pal_9158_Varus_PalMorale_01_01 " );	// How are your people feeling?
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalMorale_01_02 " );	// Don't worry, it's all right!
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalMorale_01_03 " );	// Each of them is ready to rush into battle at the first call, if necessary.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalMorale_01_04 " );	// Believe me, these people are used to looking death in the face!
	AI_Output(other,self, " DIA_Pal_9158_Varus_PalMorale_01_05 " );	// I don't doubt their courage - I only doubt their fighting spirit.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalMorale_01_06 " );	// Nonsense! (angrily) A paladin will never lose morale, even if he finds himself in the most desperate situation!
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalMorale_01_07 " );	// After all, the blessing of Innos is with us, and this is not an empty phrase!
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_PalMorale_01_08 " );	// You're a paladin! (surprised) You should know about it too!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_PalMorale_01_09 " );	// (snickeringly) Isn't that right, venerable Fire Mage?
		AI_Output(other,self, " DIA_Pal_9158_Varus_PalMorale_01_10 " );	// That's right.
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9158_Varus_PalMorale_01_11 " );	// But you're not a paladin... (disappointed) You don't understand!
	};
};


instance DIA_PAL_9158_VARUS_PALTIMEFORT(C_Info)
{
	npc = pal_9158_varus;
	nr = 2;
	condition = dia_pal_9158_varus_paltimefort_condition;
	information = dia_pal_9158_varus_paltimefort_info;
	permanent = FALSE;
	description = " How long will you stay at the fort? " ;
};


func int dia_pal_9158_varus_paltimefort_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_fort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_paltimefort_info()
{
	AI_Output(other,self, " DIA_Pal_9158_Varus_PalTimeFort_01_01 " );	// How long will you be in the fort?
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalTimeFort_01_02 " );	// We'll stay here for as long as it takes.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalTimeFort_01_03 " );	// Besides, it's not for me to decide, but for Lord Hagen.
	AI_Output(other,self, " DIA_Pal_9158_Varus_PalTimeFort_01_04 " );	// What do you think about this?
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalTimeFort_01_05 " );	// Hmmm...(thoughtfully) I think this fort is a great strategic point in case the orcs invade.
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalTimeFort_01_06 " );	// Only a madman will storm this fortress, but for us it is an excellent springboard for the offensive.
};


instance DIA_PAL_9158_VARUS_PALNEWS(C_Info)
{
	npc = pal_9158_varus;
	nr = 3;
	condition = dia_pal_9158_varus_palnews_condition;
	information = dia_pal_9158_varus_palnews_info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int dia_pal_9158_varus_palnews_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_paltimefort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_palnews_info()
{
	AI_Output(other,self, " DIA_Pal_9158_Varus_PalNews_01_01 " );	// Any news?
	AI_Output(self,other, " DIA_Pal_9158_Varus_PalNews_01_02 " );	// Nothing you should know.
};


instance DIA_PAL_9158_VARUS_HUNT(C_Info)
{
	npc = pal_9158_varus;
	nr = 3;
	condition = dia_pal_9158_varus_hunt_condition;
	information = dia_pal_9158_varus_hunt_info;
	permanent = FALSE;
	description = " It's one thing... " ;
};


func int dia_pal_9158_varus_hunt_condition()
{
	if (( MIS_ORTOHUNT  == LOG_Running ) && ( VARUSAGREEDHUNT  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_hunt_info()
{
	AI_Output(other,self, " DIA_Pal_9158_Varus_Hunt_01_01 " );	// It's one thing...
	AI_Output(self,other, " DIA_Pal_9158_Varus_Hunt_01_02 " );	// (grouchily) What else?
	AI_Output(other,self, " DIA_Pal_9158_Varus_Hunt_01_03 " );	// Several paladins are asking for your permission to go hunting inland.
	AI_Output(self,other, " DIA_Pal_9158_Varus_Hunt_01_04 " );	// But why would they?
	AI_Output(other,self, " DIA_Pal_9158_Varus_Hunt_01_05 " );	// They just sit around and don't know what to do.
	AI_Output(self,other, " DIA_Pal_9158_Varus_Hunt_01_06 " );	// Hmmm...(thoughtfully) I didn't think that was really the case.
	AI_Output(other,self, " DIA_Pal_9158_Varus_Hunt_01_07 " );	// They're just dying of boredom!
	AI_Output(other,self, " DIA_Pal_9158_Varus_Hunt_01_08 " );	// You should know that a quiet life is not for paladins.
	AI_Output(self,other, " DIA_Pal_9158_Varus_Hunt_01_09 " );	// Hmmm...(thoughtfully) Well, yes, you are absolutely right here.
	AI_Output(other,self, " DIA_Pal_9158_Varus_Hunt_01_10 " );	// So will you give them this permission?
	AI_Output(self,other, " DIA_Pal_9158_Varus_Hunt_01_11 " );	// Actually, it's not supposed to, but... (thoughtfully)
	AI_Output(self,other, " DIA_Pal_9158_Varus_Hunt_01_12 " );	// Good! I think, in this case, the guys really stayed up in place, and it would not hurt them to unwind a little.
	AI_Output(self,other, " DIA_Pal_9158_Varus_Hunt_01_13 " );	// I approve of their idea.
	B_LogEntry( TOPIC_ORTOHUNT , " Lord Varus has allowed Ortho's paladins to go hunting. " );
	VARUSAGREEDHUNT = TRUE ;
};


instance DIA_PAL_9158_VARUS_HELPRAYNE(C_Info)
{
	npc = pal_9158_varus;
	nr = 3;
	condition = dia_pal_9158_varus_helprayne_condition;
	information = dia_pal_9158_varus_helprayne_info;
	permanent = FALSE;
	description = " Paladin Rayne needs help. " ;
};

func int dia_pal_9158_varus_helprayne_condition()
{
	if((MIS_RAYNEHELP == LOG_Running) && (MAYTALKVARUSRAYNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_helprayne_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Pal_9158_Varus_HelpRayne_01_00 " );	// Paladin Rayne needs help.
	AI_Output(self,other, " DIA_Pal_9158_Varus_HelpRayne_01_01 " );	// (grouchily) What else is this? What kind of help?
	AI_Output(other,self, " DIA_Pal_9158_Varus_HelpRayne_01_02 " );	// He just can't keep up with the work in the warehouse.
	AI_Output(other,self, " DIA_Pal_9158_Varus_HelpRayne_01_03 " );	// Can you send someone to him?
	AI_Output(self,other, " DIA_Pal_9158_Varus_HelpRayne_01_04 " );	// I don't have extra people for this!
	AI_Output(self,other, " DIA_Pal_9158_Varus_HelpRayne_01_05 " );	// Moreover, it is he who is entrusted with handling our supplies - so no one else is obliged to help him fulfill his own duties.
	AI_Output(other,self, " DIA_Pal_9158_Varus_HelpRayne_01_06 " );	// Okay, whatever you say.
	AI_Output(other,self, " DIA_Pal_9158_Varus_HelpRayne_01_07 " );	// In addition, if something suddenly disappears from the warehouse, then you yourself will find a replacement for it!
	AI_Output(self,other, " DIA_Pal_9158_Varus_HelpRayne_01_12 " );	// Hmmm... (thoughtfully) Well... well, good!
	AI_Output(self,other, " DIA_Pal_9158_Varus_HelpRayne_01_13 " );	// I'll assign someone to help him. But tell him what if...
	AI_Output(self,other, " DIA_Pal_9158_Varus_HelpRayne_01_15 " );	// Better for him... (grouchily)
	B_LogEntry( TOPIC_RAYNEHELP , " Lord Varus has agreed to provide Rayne with a man to help him in the warehouse. Now I think we should report this to Rayne himself. " );
	FINDHELPERRAYNE = TRUE;
};

instance DIA_Pal_9158_Varus_MissKey(C_Info)
{
	npc = pal_9158_varus;
	nr = 4;
	condition = DIA_Pal_9158_Varus_MissKey_condition;
	information = DIA_Pal_9158_Varus_MissKey_info;
	permanent = FALSE;
	description = " Key to the warehouse, do you have it? " ;
};

func int DIA_Pal_9158_Varus_MissKey_condition()
{
	if((KNOWSVARUSKEY == TRUE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9158_Varus_MissKey_info()
{
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_01_00 " );	// Key to the warehouse - do you have it?
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_01_01 " );	// (unsatisfied) Was - until recently!
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_01_02 " );	// But now I don't have it, and that's a big problem.
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_01_03 " );	// You lost him?!
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_01_04 " );	// Lost or stolen - what's the difference? The main thing is that it is not.
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_01_05 " );	// And we can't get inside the warehouse.
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_01_06 " );	// So make a new key!
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_01_07 " );	// It's not that easy. (grouchily) The lock on the door is too complicated!
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_01_08 " );	// We can't just break the door.
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_01_09 " );	// And, of course, you don't have someone who knows how to pick locks?
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_01_10 " );	// How smart you are... (terribly) We're paladins! Not thieves...
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_01_11 " );	// And here you can't do without a master cracker.
	MIS_FingersOpenDoor = LOG_Running;
	Log_CreateTopic(Topic_FingersOpenDoor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FingersOpenDoor,LOG_Running);
	B_LogEntry(TOPIC_FingersOpenDoor, " Lord Varus has lost the key to the warehouse at the paladin fort. Now it takes a real master burglar to open the door! " );
};

instance DIA_Pal_9158_Varus_MissKey_Ok(C_Info)
{
	npc = pal_9158_varus;
	nr = 5;
	condition = DIA_Pal_9158_Varus_MissKey_Ok_condition;
	information = DIA_Pal_9158_Varus_MissKey_Ok_info;
	permanent = FALSE;
	description = " I found you someone who can handle the lock. " ;
};

func int DIA_Pal_9158_Varus_MissKey_Ok_condition()
{
	if((MIS_FingersOpenDoor == LOG_Running) && (FingersAgree == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9158_Varus_MissKey_Ok_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_Ok_01_00 " );	// I found you someone who can handle the lock.
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Ok_01_01 " );	// Really?! (surprised) And who is he?
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_Ok_01_02 " );	// Former convict from the Valley of Mines. He's not far away, relaxing on the beach.
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_Ok_01_03 " );	// And he will help you, but only on the condition that you give your word not to touch him.
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Ok_01_04 " );	// Hmmm... (terribly) I thought it would be one of those scoundrels.
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Ok_01_05 " );	// But... But I need the damn warehouse!
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Ok_01_06 " );	// So you can tell him that I agree to his terms.
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Ok_01_07 " );	// He can come here. My people won't touch him! I swear by Innos...
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Ok_01_08 " );	// But if he ever tries to steal something here, I'll have him hanged on the gallows immediately!
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Ok_01_09 " );	// (terribly) Is that clear?!
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_Ok_01_10 " );	// Of course.
	VarusFingersAgree = TRUE;
	B_LogEntry(TOPIC_FingersOpenDoor, " Lord Varus agreed to Fingers' terms and promised not to touch him. " );
};


instance DIA_Pal_9158_Varus_MissKey_Finish(C_Info)
{
	npc = pal_9158_varus;
	nr = 6;
	condition = DIA_Pal_9158_Varus_MissKey_Finish_condition;
	information = DIA_Pal_9158_Varus_MissKey_Finish_info;
	permanent = FALSE;
	description = " How are you with the castle? " ;
};

func int DIA_Pal_9158_Varus_MissKey_Finish_condition()
{
	if((MIS_FingersOpenDoor == LOG_Running) && (FingersInFort == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9158_Varus_MissKey_Finish_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_Finish_01_00 " );	// How's the lock?
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Finish_01_01 " );	// (approvingly) Your friend has been a very helpful person.
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Finish_01_02 " );	// This is the first time I've seen such a skilled cracker!
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Finish_01_03 " );	// I believe that in the future it can be useful to us.
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Finish_01_04 " );	// As for you, you deserve a small reward as a reward for your help.
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Finish_01_05 " );	// Here, take this gold!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other, " DIA_Pal_9158_Varus_MissKey_Finish_01_07 " );	// (arrogantly) But don't ask for more.
	AI_Output(other,self, " DIA_Pal_9158_Varus_MissKey_Finish_01_08 " );	// And thanks for that.
	MIS_FingersOpenDoor = LOG_Success;
	Log_SetTopicStatus(TOPIC_FingersOpenDoor,LOG_Success);
	B_LogEntry(TOPIC_FingersOpenDoor, " Lord Varus was pleased that the paladins had access to the warehouse again. " );
};

instance DIA_PAL_9158_VARUS_PICKPOCKET(C_Info)
{
	npc = pal_9158_varus;
	nr = 800;
	condition = dia_pal_9158_varus_pickpocket_condition;
	information = dia_pal_9158_varus_pickpocket_info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int dia_pal_9158_varus_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (KNOWSVARUSKEY == TRUE) && (FingersTellKey == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9158_varus_pickpocket);
	Info_AddChoice(dia_pal_9158_varus_pickpocket,Dialog_Back,dia_pal_9158_varus_pickpocket_back);
	Info_AddChoice(dia_pal_9158_varus_pickpocket,DIALOG_PICKPOCKET,dia_pal_9158_varus_pickpocket_doit);
};

func void dia_pal_9158_varus_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 175)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,itke_varuskey,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		HavePalSkladMeKey = TRUE ;
		B_GiveThiefXP();
		Info_ClearChoices(dia_pal_9158_varus_pickpocket);
	}
	else
	{
		Print ( " Required Agility: 175 " );

		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void dia_pal_9158_varus_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9158_varus_pickpocket);
};
