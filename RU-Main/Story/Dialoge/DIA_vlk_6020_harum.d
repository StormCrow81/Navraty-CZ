

instance DIA_HARUM_EXIT (C_Info)
{
	npc = vlk_6020_harum;
	nr = 999;
	condition = dia_harum_exit_condition;
	information = dia_harum_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_harum_exit_condition()
{
	return TRUE;
};

func void dia_harum_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_HARUM_HELLO (C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_condition;
	information = dia_harum_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " Are you Elvais? " ;
};


func int dia_harum_hello_condition()
{
	if((MEETHARUM == FALSE) && (KNOWABELV == TRUE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_info()
{
	AI_Output(other,self, " DIA_Harum_Hello_01_00 " );	// Are you Elvais?
	AI_Output(self,other, " DIA_Harum_Hello_01_01 " );	// Yes, my name is Elvais.
	AI_Output(self,other, " DIA_Harum_Hello_01_03 " );	// And you, apparently, are the wanderer who stumbled into our region. Dugo has already told me about you.
	AI_Output(self,other, " DIA_Harum_Hello_01_04 " );	// Everyone is talking about you. For many, it has become a ray of light in pitch darkness.
	AI_Output(self,other, " DIA_Harum_Hello_01_13 " );	// Besides, I can tell you that even I awaited you, because I suspect...
	AI_Output(self,other, " DIA_Harum_Hello_01_14 " );	// ...that it is you mentioned in the Tomes of Humgat.
	AI_Output(other,self, " DIA_Harum_Hello_01_15 " );	// Tomes of Humgat?
	AI_Output(self,other, " DIA_Harum_Hello_01_16 " );	// Let me tell you about it.
	AI_Output(self,other, " DIA_Harum_Hello_01_18 " );	// Once upon a time, this place was not like what you see now.
	AI_Output(self,other, " DIA_Harum_Hello_01_20 " );	// Back then this place was known as Kalimdor - the sacred Halls of Humgath.
	AI_Output(self,other, " DIA_Harum_Hello_01_21 " );	// We don't know much about those bygone times and the people who lived here.
	AI_Output(self,other, " DIA_Harum_Hello_01_22 " );	// But some information still survived to our time.
	AI_Output(self,other, " DIA_Harum_Hello_01_23 " );	// Basically, these are small fragments of the chronicle of those times when a terrible evil invaded the valley, forever changing it.
	AI_Output(self,other, " DIA_Harum_Hello_01_26 " );	// One of the ancient manuscripts of Kalimdor also mentioned a legend.
	AI_Output(other,self, " DIA_Harum_Hello_01_28 " );	// And what is this legend?
	AI_Output(self,other, " DIA_Harum_Hello_01_29 " );	// The legend of one powerful ancient artifact, whose appearance in this world could plunge it into eternal chaos.
	AI_Output(self,other, " DIA_Harum_Hello_01_30 " );	// This artifact, according to the records, was called the Eye of Wrath.
	AI_Output(self,other, " DIA_Harum_Hello_01_31 " );	// The legend said that if this Eye was awakened, a great evil would also awaken with it.
	AI_Output(self,other, " DIA_Harum_Hello_01_32 " );	// (quotes) ...and the Great Shadow will cover the land with a shield of darkness, and the kingdom of evil will forever reign in the Halls of Humagat...
	AI_Output(self,other, " DIA_Harum_Hello_01_33 " );	// Perhaps it was by inexplicably awakening this Eye of Wrath that the people of Kalimdor brought all this misfortune upon themselves.
	AI_Output(other,self, " DIA_Harum_Hello_01_34 " );	// And what happened to Kalimdor?
	AI_Output(self,other, " DIA_Harum_Hello_01_35 " );	// Judging by the entries in the books, like an unstoppable hurricane, countless hordes of evil spirits, undead and orcs swept through this land...
	AI_Output(self,other, " DIA_Harum_Hello_01_36 " );	// ...turning everything in its path into cinders and ashes, sowing death and chaos around. Very few lived to tell about it.
	AI_Output(self,other, " DIA_Harum_Hello_01_38 " );	// Returning to the legend, there is one more interesting thing.
	AI_Output(self,other, " DIA_Harum_Hello_01_40 " );	// Among other things, the legend also mentions a nameless warrior who can put an end to the reign of darkness.
	AI_Output(self,other, " DIA_Harum_Hello_01_41 " );	// (quotes) ...and at the turn of the times, when the last hope for salvation will be lost...
	AI_Output(self,other, " DIA_Harum_Hello_01_42 " );	// ...the human race will produce a defender, and he will oppose the Darkness...
	AI_Output(self,other, " DIA_Harum_Hello_01_43 " );	// ...and he will lead the survivors to fight evil and destroy the Great Shadow...
	AI_Output(self,other, " DIA_Harum_Hello_01_44 " );	// ...he will have but one name - the Arbiter of Fate.
	AI_Output(self,other, " DIA_Harum_Hello_01_45 " );	// Perhaps you are he? Perhaps not.
	AI_Output(other,self, " DIA_Harum_Hello_01_47 " );	// Well, I actually HAVE a name! It's...
	AI_Output(self,other, " DIA_Harum_Hello_01_48 " );	// Tell me, what is your true goal here?
	AI_Output(other,self, " DIA_Harum_Hello_01_49 " );	// I'm here for a dragon, actually. Seen one around?
	AI_Output(other,self, " DIA_Harum_Hello_01_50 " );	// Does the name Azgalor mean anything to you? Word is it lives in this valley.
	AI_Output(self,other, " DIA_Harum_Hello_01_51 " );	// Azgalore?! The legends about this creature go far into the past, to the dawn of mankind.
	AI_Output(self,other, " DIA_Harum_Hello_01_52 " );	// The books of Kalimdor said it was a monster vomited up by the Void itself.
	AI_Output(self,other, " DIA_Harum_Hello_01_53 " );	// But no one has ever seen him here. Although, perhaps because no one survived the meeting with him.
	AI_Output(self,other, " DIA_Harum_Hello_01_54 " );	// Or maybe it's just a myth... I can't tell you for sure.
	if(MIS_URNAZULRAGE == LOG_Running)
	{
		B_LogEntry( TOPIC_URNAZULRAGE , " Elvais told me a legend about a powerful artifact called the Eye of Wrath. Apparently, this artifact is somehow connected with the events that took place in the valley several millennia ago. " );
	};
	MEETHARUM = TRUE ;
};


instance DIA_HARUM_HELLO_TWO(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_two_condition;
	information = dia_harum_hello_two_info;
	permanent = TRUE;
	important = FALSE;
	description = " I don't think the black dragon is a myth. " ;
};


func int dia_harum_hello_two_condition()
{
	if (( MEETHARUM  ==  TRUE ) && ( MEETHARUMONE  ==  FALSE ) && ( MIS_URNAZULRAGE  == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_harum_hello_two_info()
{
	var C_Item heroweapon;
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_01 " );	// Apparently, this black dragon Azgalor isn't exactly a myth.
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_02 " );	// (surprised) How do you know that?
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_03 " );	// I met with someone who apparently witnessed those bygone events.
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_04 " );	// But how is this possible? More than a millennium has passed since the dark times passed!
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_05 " );	// And who is this?
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_06");	//Orcs!
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_07 " );	// Orcs? But they have not been seen in this valley for a long time!
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_08 " );	// And as far as I know, orcs are not very friendly creatures! They wouldn't talk to a person, would they?
	if(Npc_HasItems(hero,itmw_2h_orcprestige) >= 1)
	{
		heroweapon = Npc_GetEquippedMeleeWeapon(hero);
		if(Hlp_IsItem(heroweapon,itmw_2h_orcprestige) == TRUE)
		{
			AI_ReadyMeleeWeapon(other);
			AI_Output(other,self, " DIA_Harum_Hello_Two_01_10 " );	// See this strange object in my hands?
			AI_Output(other,self, " DIA_Harum_Hello_Two_01_11 " );	// For orcs, this talisman is a sign of strength and friendship. They respect its owner and do not dare to attack him.
			AI_RemoveWeapon(other);
		};
	};
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_12 " );	// The teleport I got here through leads straight to the orc underground city.
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_13 " );	// Yes, Dugo told me this sad news.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_14 " );	// There I met an orc who told me what happened back then in Kalimdor.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_22 " );	// It was Azgalor who called into this world a powerful demon - the Forge of Souls.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_23 " );	// Under the demonic influence of the creature, the orcs went mad!
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_24 " );	// Anger, insane rage and an irresistible desire to kill settled in their souls!
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_27 " );	// The Soulsmith made them an offer they couldn't refuse.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_28 " );	// Giving them great power, he subjugated their mind and will at the same time.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_29 " );	// After that, finally losing control over their actions, the orcs brought death to all living things, drowning this valley in a sea of ​​blood!
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_30 " );	// The demon took the souls of the dead and brought them as a gift to his master - Azgalor.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_31 " );	// Soulless bodies were turned into undead by the Forge of Souls, which filled the ranks of the army of Darkness.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_32 " );	// Thus Kalimdor was forever forgotten.
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_33 " );	// Damned orcs!
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_34 " );	// They were simply a tool of evil. They could not resist the madness that had taken possession of them.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_35 " );	// But despite this, it was the orcs who broke the curse that fell on this valley and their people...
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_36 " );	// How?
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_37 " );	// Tired of the killing and fed up with their bloodlust, the orcs no longer wanted to fight.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_39 " );	// But the fire of the demon, burning their souls and tearing up their blood, forced them to kill again and again.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_40 " );	// Not having the strength to endure such monstrous suffering, tearing apart their minds and souls, the orcs decided to get rid of the power of the demon.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_42 " );	// Then Azgalor raised his army of Darkness.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_45 " );	// The Orcs fought desperately...
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_46 " );	// And in the end, the hordes of the undead were defeated, and the Forge of Souls was crushed.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_48 " );	// But the black dragon cursed all who drank the demon's blood. Over time, the curse turned them into lifeless ghosts, and Azgalor himself took possession of their souls.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_49 " );	// Only Ur-Thrall made it out alive.
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_51 " );	// That's all he could tell me.
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_52 " );	// Why did he even do this?
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_53 " );	// All he wants is revenge on Azgalor.
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_56 " );	// And he asked you to do it for him?
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_57 " );	// We've made an agreement!
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_58 " );	// If I find Azgalor and kill him, then you can safely escape from here using the teleportation stone in the pyramid.
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_61 " );	// Do you really think that you can do it all?
	AI_Output(self,other, " DIA_Harum_Hello_Two_01_64 " );	// Orcs... Can they be trusted?
	AI_Output(other,self, " DIA_Harum_Hello_Two_01_65 " );	// We have no other choice.
	B_LogEntry( TOPIC_HUMANINVALLEY , " I told Elvais what Ur-Thrall told me. Also, I had an idea how I could help these people get out of the valley. If I find and kill the black dragon, then perhaps Ur-Thrall agree to let them pass through his underground city to the Valley of Mines, and then to Khorinis. " );
	MEETHARUMONE = TRUE ;
};


instance DIA_HARUM_HELLO_THREE(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_three_condition;
	information = dia_harum_hello_three_info;
	permanent = FALSE;
	important = FALSE;
	description = " Where did you get these ancient books from? " ;
};


func int dia_harum_hello_three_condition()
{
	if (( MEETHARUMTWO  ==  FALSE ) && ( MEETHARUMONE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_harum_hello_three_info()
{
	AI_Output(other,self, " DIA_Harum_Hello_Three_01_01 " );	// And where did you get these ancient books from?
	AI_Output(self,other, " DIA_Harum_Hello_Three_01_02 " );	// One day while hunting, Ruen stumbled upon an abandoned crypt, in which he discovered a small library.
	AI_Output(self,other, " DIA_Harum_Hello_Three_01_03 " );	// True, he barely got his ass out of there, because the crypt, it turned out, was simply teeming with undead.
	AI_Output(self,other, " DIA_Harum_Hello_Three_01_04 " );	// To my great delight, he was smart enough to grab some old books on his way out.
	B_LogEntry( TOPIC_URNAZULRAGE , " Elvais mentioned a certain crypt with an abandoned library. Perhaps I can find some answers to my questions there. " );
	MEETHARUMTWO = TRUE ;
};


instance DIA_HARUM_HELLO_FOUR(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_four_condition;
	information = dia_harum_hello_four_info;
	permanent = FALSE;
	important = FALSE;
	description = " Can you tell me more about the Eye of Wrath? " ;
};


func int dia_harum_hello_four_condition()
{
	if (( MEETHARUMTHREE  ==  FALSE ) && ( MEETHARUMONE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_harum_hello_four_info()
{
	AI_Output(other,self, " DIA_Harum_Hello_Four_01_01 " );	// What else do you know about this Eye of Wrath artifact?
	AI_Output(self,other, " DIA_Harum_Hello_Four_01_02 " );	// In the records we have, other than what I told you, there is nothing else about it.
	AI_Output(self,other, " DIA_Harum_Hello_Four_01_04 " );	// Perhaps you should seek answers to your questions outside of this cave.
	AI_Output(self,other, " DIA_Harum_Hello_Four_01_05 " );	// Or ask around.
	MEETHARUMTHREE = TRUE ;
};


instance DIA_HARUM_HELLO_FIVE(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_five_condition;
	information = dia_harum_hello_five_info;
	permanent = TRUE;
	important = FALSE;
	description = " You said you saw something like orcs here. " ;
};


func int dia_harum_hello_five_condition()
{
	if (( MEETHARUMFOUR  ==  FALSE ) && ( MEETHARUMONE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_harum_hello_five_info()
{
	AI_Output(other,self, " DIA_Harum_Hello_Five_01_01 " );	// You said you saw something like orcs here.
	AI_Output(self,other, " DIA_Harum_Hello_Five_01_02 " );	// You'd better ask Emnol about it. He claims to have encountered a big green monster.
	AI_Output(self,other, " DIA_Harum_Hello_Five_01_03 " );	// Whether it was orcs or something, I don't know.
	MEETHARUMFOUR = TRUE;
};


instance DIA_HARUM_HELLO_SIX (C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_six_condition;
	information = dia_harum_hello_six_info;
	permanent = TRUE;
	important = FALSE;
	description = " The black dragon is dead. " ;
};


func int dia_harum_hello_six_condition()
{
	if((BLKDRAGNISDEAD == TRUE) && (CURSEISENDHUMAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_six_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Harum_Hello_Six_01_01 " );	// The black dragon is dead.
	AI_Output(self,other, " DIA_Harum_Hello_Six_01_02 " );	// Truly, this is the best news you could bring.
	AI_Output(self,other, " DIA_Harum_Hello_Six_01_03 " );	// That hellish scream that swept over the valley... we thought it was the end!
	AI_Output(self,other, " DIA_Harum_Hello_Six_01_05 " );	// I knew... I knew you were the warrior the legend spoke of.
	AI_Output(self,other, " DIA_Harum_Hello_Six_01_07 " );	// Now we're all saved!
	AI_Output(self,other, " DIA_Harum_Hello_Six_01_08 " );	// What are you going to do now?
	AI_Output(other,self, " DIA_Harum_Hello_Six_01_09 " );	// I'm on my way back and I can help you get out of the valley.
	AI_Output(self,other, " DIA_Harum_Hello_Six_01_10 " );	// I don't think this is needed anymore. Now that the evil is gone from these places, we can get along well here.
	AI_Output(self,other, " DIA_Harum_Hello_Six_01_11 " );	// I'm sure all the other guys won't mind either!
	AI_Output(other,self, " DIA_Harum_Hello_Six_01_12 " );	// What about orcs?
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_13");	//Orcs?!
	if(MEETURGROM > 0)
	{
		AI_Output(other,self, " DIA_Harum_Hello_Six_01_14 " );	// The curse that hung on them has disappeared, and now the entire valley is at their disposal.
		AI_Output(self,other, " DIA_Harum_Hello_Six_01_15 " );	// Those orcs again! Are we really going to have to hide and fight for our lives again after all the years of torment?
		AI_Output(other,self, " DIA_Harum_Hello_Six_01_16 " );	// I could arrange with their leader not to touch you.
		AI_Output(self,other, " DIA_Harum_Hello_Six_01_19 " );	// (in disbelief) Okay, you put my mind at ease...
		AI_Output(self,other, " DIA_Harum_Hello_Six_01_23 " );	// Have a good trip, wanderer!
		B_LogEntry( TOPIC_HUMANINVALLEY , " Elvais and the rest of the humans do not want to leave this valley. I think this is the right decision. However, in light of the new circumstances, there is a threat of conflict with the orcs. I think I should talk to Ur-Grom about this, the leader of the local horde. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Harum_Hello_Six_01_24 " );	// Knowing that the evil has left these places, they will surely want to return here.
		AI_Output(self,other, " DIA_Harum_Hello_Six_01_25 " );	// Those orcs again! Are we really going to have to hide and fight for our lives again after all the years of torment?
		AI_Output(self,other, " DIA_Harum_Hello_Six_01_27 " );	// We will try to solve this problem somehow.
		AI_Output(self,other, " DIA_Harum_Hello_Six_01_29 " );	// Have a good trip, wanderer!
		B_LogEntry_Failed(TOPIC_HUMANINVALLEY);
	};
	Npc_ExchangeRoutine(orc_8565_urgrom,"HomeUrGrom");
	CURSEISENDHUMAN = TRUE;
};


instances DIA_HARUM_HELLO_SEVEN (C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_seven_condition;
	information = dia_harum_hello_seven_info;
	permanent = TRUE;
	important = FALSE;
	description = " Orcs won't touch you. " ;
};


func int dia_harum_hello_seven_condition()
{
	if((SAVEHUMAN == TRUE) && (SAVEHUMANEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_seven_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Harum_Hello_Seven_01_01 " );	// The Orcs won't touch you! I made a deal with their leader. You can live in peace.
	AI_Output(self,other, " DIA_Harum_Hello_Seven_01_02 " );	// You have done so much for us, and we have nothing to thank you, wanderer.
	AI_Output(self,other, " DIA_Harum_Hello_Seven_01_03 " );	// Wait, though... a couple of days ago, Bagrus found this stone tablet during another hunt.
	AI_Output(self,other, " DIA_Harum_Hello_Seven_01_04 " );	// It looks like some kind of magical object, but I still don't understand how to use it.
	AI_Output(self,other, " DIA_Harum_Hello_Seven_01_05 " );	// Take it for yourself as our recognition of your exploits!
	B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
	SAVEHUMANEND = TRUE;
	B_LogEntry( TOPIC_HUMANINVALLEY , " I have agreed with the orcs and humans to observe a truce. Now I think this question can be considered closed ... but for how long? " );
	MIS_SAVEHUMANEND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HUMANINVALLEY,LOG_SUCCESS);
};


instances DIA_HARUM_SEEKAZGOLOR (C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_seekazgolor_condition;
	information = dia_harum_seekazgolor_info;
	permanent = TRUE;
	important = FALSE;
	description = " Can you read this book? " ;
};


func int dia_harum_seekazgolor_condition()
{
	if((SEEKAZGOLOR == TRUE) && (READ_AZGOLOR == FALSE) && (Npc_HasItems(other,itwr_azgolor) >= 1))
	{
		return TRUE;
	};
};

func void dia_harum_seekazgolor_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Harum_SeekAzgolor_01_01 " );	// Can you read this book?
	AI_Output(self,other, " DIA_Harum_SeekAzgolor_01_02 " );	// Let me take a look... very interesting!
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Harum_SeekAzgolor_01_03 " );	// What a strange book, and the language is quite unusual. Something like orcish, but definitely not theirs.
	AI_Output(self,other, " DIA_Harum_SeekAzgolor_01_04 " );	// Hmm... I'm afraid I can't help you.
	B_LogEntry( TOPIC_URNAZULRAGE , " Elvais couldn't decipher the characters in the book I found in the underground temple, but said that the language is somewhat like Orcish. Maybe I should look for an Orc who can read it? " );
	SEEKAZGOLOR = FALSE;
};
