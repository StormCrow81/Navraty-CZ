

DIA_ORCSHAMAN_UR_DAH_EXIT (C_Info) instances
{
	npc = orcshaman_ur_dah;
	nr = 999;
	condition = dia_orcshaman_ur_dah_exit_condition;
	information = dia_orcshaman_ur_dah_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_orcshaman_ur_dah_exit_condition()
{
	if(URDAHTELLME == FALSE)
	{
		return TRUE;
	}
	else if(URDAHTELLME >= 4)
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORCSHAMAN_UR_DAH_HELLO (C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_hello_condition;
	information = dia_orcshaman_ur_dah_hello_info;
	permanent = FALSE;
	description = " Are you the shaman named Ur-Dah? " ;
};


func int dia_orcshaman_ur_dah_hello_condition()
{
	if ( NAGSHORTELLME  ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_hello_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_Hello_01_01 " );	// Are you a shaman called Ur-Dah?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_Hello_01_02 " );	// You be right, human... (hostile) I am Ur-Dah, high shaman of the High Rock clan.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_Hello_01_03 " );	// So, I was not mistaken - you are exactly what I need!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_Hello_01_04 " );	// Man look for me?! And what does he want from Ur-Dah?
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_Hello_01_05 " );	// I want to ask you about one ancient creature - the Spirit of Water.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_Hello_01_06 " );	// Nag Shor, chief of your clan, told me you should know something about this.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_Hello_01_07 " );	// Water Spirit? Hmmm... (thoughtfully) Why is a person interested in this?!
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_Hello_01_08 " );	// I heard that once upon a time, shamans from an orc tribe enslaved this creature.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_Hello_01_09 " );	// And now I want to find a way to return this creature to freedom!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_Hello_01_10 " );	// So you want to release the Water Spirit?! Hmmm...(very surprised) However, the man is very much surprised by Ur-dah!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_Hello_01_15 " );	// A man would be very brave to come here and talk about something that might anger the orcs.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_Hello_01_16 " );	// If the human tell this to the other brothers of Ur-Dah - the orcs will now kill the humans! Make him dead.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_Hello_01_17 " );	// Ur-Dah to believe that even the sign of strength that a person wears could not save him.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_Hello_01_18 " );	// However, a person be wise, what to say is only Ur-Dah.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_Hello_01_19 " );	// Ur-Dah listen to people and decide that if a person wants to release the Spirit of Water - he will help him.
	B_LogEntry( TOPIC_WAKONTEST , " I found an orc shaman named Ur-Dah. At first he was surprised by my visit, but when I told him that I wanted to free the Water Spirit, he unexpectedly agreed to help me. " );
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY (C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_condition;
	info = dia_orcshaman_ur_dah_tellstory_info;
	permanent = FALSE;
	description = " Tell me what you know about the Water Spirit. " ;
};


func int dia_orcshaman_ur_dah_tellstory_condition()
{
	if(Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_hello))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_info()
{
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_01_01 " );	// Tell me what you know about the Water Spirit.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_02 " );	// Good! Ur-Dah to speak - a person listens carefully and remembers what Ur-Dah tells him.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_04 " );	// It would be many winters ago, very many winters ago - when Ur-Dah did not yet live here.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_05 " );	// The great shaman of the powerful Big Stone Clan is looking for the power that was supposed to help the brothers fight their enemy!
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_01_06 " );	// I take it the Big Rock is the High Rock?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_07 " );	// Be right, man!
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_01_08 " );	// Got it. And what happened next?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_09 " );	// Brothers know and see that their enemy will summon a powerful demon - Krushak and become very strong! The enemy could not be defeated!
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_01_10 " );	// Crushak? I think I know what you're talking about, orc - this demon was also called Sleeper.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_11 " );	// Everything be true, man. People call Krushak - Sleep!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_14 " );	// The brothers also seek power, just like Crushak.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_15 " );	// Shamans of the clan think a lot, call on their ancestors - talk to them, seek advice on how to be brothers.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_16 " );	// Ancestors tell shamans that there is an ancient creature in the world - the Spirit of Water. To be very strong and give the brothers strength no less than the power of Crushak!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_17 " );	// Then the brothers seek the Spirit of Water and rejoice very much when they find him in this valley.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_18 " );	// The clan's shamans use magic, very strong magic, to trap him and imprison him in stone so that the Water Spirit can't get away from his brothers.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_19 " );	// However, after that, the brothers don't know what to do next. How to get the strength and power of the Spirit of Water!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_22 " );	// Then the brothers get very angry and angry that they cannot become strong like their enemy!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_23 " );	// They curse the Water Spirit and conjure so that he can never gain freedom.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_24 " );	// Use very ancient and deadly orc magic so that no one can release it except the clan's shamans themselves.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_25 " );	// But then there will be war with enemies! (sadly) Enemies kill all the shaman of the clan, and the brothers could no longer release the Water Spirit.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_01_27 " );	// Yes, this is not the best outcome...
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_28 " );	// But the worst thing to be is that all the water will leave the place where the clan's camp is located!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_29 " );	// No water, nothing to grow... be just one stone.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_30 " );	// Orcs see this and go to another place - but there be the same thing.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_31 " );	// Brothers understand this and come back! Live next to a big stone and be damned forever!
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_01_32 " );	// So the orcs have driven themselves into their own trap.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_33 " );	// Ur-Dah think like a human - orcs punish themselves.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_34 " );	// Therefore, Ur-Dah will help a person to release the Spirit of Water!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_35 " );	// If the person manages to do this, then perhaps the curse of the clan will disappear and the water will return to the camp.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_01_36 " );	// The brothers need water - without water, the clan will be weak and slowly die.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_01_37 " );	// Well, now everything is clear to me.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry( TOPIC_WAKONTEST , " Ur-Dah told me why the orcs of the High Rock clan captured the Water Spirit. Not getting the power they expected from this creature, the orcs cursed the Water Spirit and cast an ancient spell on him, hiding him forever from the sight of this of the world. As it turned out later, this did not go unnoticed for them either. From the place where the clan settled, all the water left and it never rained again. Simply put, the orcs themselves suffered from their curse. " );
	Log_AddEntry( TOPIC_WAKONTEST , " As for the Water Spirit itself, only the shamans themselves could release it, who then cast this spell on it. However, in one of the wars between the orcs, all the shamans of the High Rock clan were killed, and the secret that they kept, seems to have died with them. " );
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY_MAGIC (C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_magic_condition;
	info = dia_orcshaman_ur_dah_tellstory_magic_info;
	permanent = FALSE;
	description = " What kind of magic did the shamans use? " ;
};


func int dia_orcshaman_ur_dah_tellstory_magic_condition()
{
	if (Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_tellstory))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_magic_info()
{
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_01 " );	// What kind of magic did the shamans use?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_02 " );	// Ur-Dah doesn't exactly know this. But to hear what shamans do on the sacrificial altar of the clan a large black crystal and put magic there.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_03 " );	// The shaman's magic is very ancient, very strong... Ur-Dah would never see such a thing.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_04 " );	// When Ur-Dah tries to release the Water Spirit himself, he fails.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_05 " );	// Think that the black crystal store the ancient magic of the shaman, which guard the Spirit of Water.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_06 " );	// If the magic go away - the Water Spirit be free!
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_07 " );	// Then we should try to destroy this crystal! Have you already tried this?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_08 " );	// Ur-Dah already try... Can't be broken, can't be destroyed!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_09 " );	// Therefore, the person himself never touch the crystal. Otherwise, if you touch it, then immediately die!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_10 " );	// Ur-dah don't want a man to die - so now tell him about it.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_11 " );	// Thanks for the warning, orc. Do you know anything else about this crystal?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_12 " );	// Ur-dah still hear that when the shaman create this crystal - they break it themselves!
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_13 " );	// What do you mean?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_14 " );	// The shaman takes a few pieces out of it and keeps them. Be a very important thing for a shaman!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_15 " );	// Protect it very much, do not show it to anyone, hide a piece from all the brothers.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_16 " );	// But why was it so important to them?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_17 " );	// Ur-Dah doesn't exactly know this. But to think that a piece of black crystal kept part of his ancient magic.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_18 " );	// If so, then perhaps this is the key to unraveling the mystery of shamans.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_19 " );	// Ur-dah don't be exactly sure about this, but think that maybe the person is right.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_20 " );	// Good! Then first we need to find all these pieces. How many were there?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_21 " );	// A piece of crystal to be as much as being a shaman in a clan! Five shaman - five piece.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_22 " );	// Five shamans? Yes, it seems to remind me of something again.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_23 " );	// Why is the person so surprised? Ur-Dah don't understand...
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_24 " );	// Once upon a time, several shamans from another tribe of orcs summoned a Sleeper into this world - a demon they called Krushak. And those shamans were also five!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_25 " );	// Arghh... Man be right! Now Ur-Dah understand. To say that it all be very similar.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_26 " );	// Ur-Dah don't know why. Think and not understand.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_27 " );	// Okay! Let's not talk about it anymore.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_28 " );	// Better answer - where can I find these parts of the black crystal?
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_29 " );	// As far as I remember, you said that during the war between the orcs, those shamans were killed. And these parts, apparently, were then with them?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_30 " );	// Not exactly be like this. Each shaman hides his crystal in a secret place - do not always carry it with you.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_31 " );	// True, no one knows where to hide... And Ur-Dah too!
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_32 " );	// Clear. Apparently, you will have to look for them yourself.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_33 " );	// Ur-Dah to hope that the person will succeed in doing everything. And wish him luck!
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_34 " );	// Thank you.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry(TOPIC_WAKONTEST,"In order to prevent the Water Spirit from breaking free, the orc shamans erected a black magic crystal on the clan's sacrificial altar, in which they placed an ancient spell. Ur-Dah warned me not to touch the crystal - its magic would instantly kill anyone who "Also, Ur-Dah said that after their ritual, each of the shamans broke off a piece of this crystal. I think these particles hold some of the ancient magic of the shamans and may be the key to releasing the Spirit of Water. I will have to find these parts and think about how to use them. Only Ur-Dah doesn't know where to find them.");
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY_FIND (C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_find_condition;
	info = dia_orcshaman_ur_dah_tellstory_find_info;
	permanent = FALSE;
	description = " Where exactly did the orcs imprison the Water Spirit? " ;
};


func int dia_orcshaman_ur_dah_tellstory_find_condition()
{
	if (Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_tellstory))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_find_info()
{
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Find_01_01 " );	// Where exactly did the orcs imprison the Water Spirit?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Find_01_02 " );	// Human go to the camp of the High Rock clan - look for a very large stone there. Inside be the Spirit of Water!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Find_01_03 " );	// However, a person should not try to destroy a stone - this cannot be done, otherwise the Spirit of Water will immediately die.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Find_01_04 " );	// Good! I got it.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry( TOPIC_WAKONTEST , " According to Ur-Dah, the Water Spirit is imprisoned in a larger stone in the High Rock Clan's camp. " );
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY_DONE (C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_done_condition;
	info = dia_orcshaman_ur_dah_tellstory_done_info;
	permanent = FALSE;
	description = " What should I do if I find crystal pieces? " ;
};


func int dia_orcshaman_ur_dah_tellstory_done_condition()
{
	if (Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_tellstory_magic))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_done_info()
{
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Done_01_01 " );	// What should I do if I find the missing pieces of the crystal?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Done_01_02 " );	// Ur-Dah can't tell for sure if this is a person, because he doesn't know himself.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Done_01_03 " );	// But he thinks that a person should try to make the crystal whole again. And see what will happen.
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Done_01_04 " );	// But you said you shouldn't touch him, did you?
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Done_01_05 " );	// Ur-dah say so! You can't touch it, otherwise you'll be dead.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Done_01_06 " );	// Therefore, a person must seek protection from the magic of the crystal - magic more powerful than the magic of a shaman.
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Done_01_07 " );	// Such magic as Water Spirit Magic!
	AI_Output(self,other, " DIA_OrcShaman_Ur_Dah_TellStory_Done_01_09 " );	// Man think long and well not to be dead...
	AI_Output(other,self, " DIA_OrcShaman_Ur_Dah_TellStory_Done_01_10 " );	// I'll see what I can do.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry( TOPIC_WAKONTEST , " If I can find all the missing pieces of the crystal, I will have to try to put them back in place. However, in order to do this, I will need protection from the ancient magic of the shamans. According to Ur-Dah, it should be like this magic that will be commensurate in strength with the magic of the Water Spirit itself. " );
};

