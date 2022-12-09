

instance DIA_Urshak_EXIT(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 999;
	condition = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Urshak_HALLO (C_Info)
{
	npc = NONE_110_Urshak;
	nr = 5;
	condition = DIA_Urshak_HALLO_Condition;
	information = DIA_Urshak_HALLO_Info;
	important = TRUE;
};


func int DIA_Urshak_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (URSHAK_SUCKED == FALSE) && (MEETURSHAKALREADY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HALLO_Info()
{
	AI_Output(self,other, " DIA_Urshak_HALLO_18_00 " );	// (aggressively) MEET JABART!!!
	AI_Output(self,other, " DIA_Urshak_HALLO_18_01 " );	// Stop! My know you. You are a friend with a soft voice.
	AI_Output(self,other, " DIA_Urshak_HALLO_18_02 " );	// Friend to kill the evil demon KRUSHAK.
	B_GivePlayerXP(XP_UrshakFound);
	Log_CreateTopic(TOPIC_Urshak,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak,LOG_Running);
	B_LogEntry(TOPIC_Urshak, " I found my old orc friend Ur-Shak. " );
	Info_ClearChoices(DIA_Urshak_HALLO);
	Info_AddChoice(DIA_Urshak_HALLO, " What are you doing here? " ,DIA_Urshak_HALLO_freund);
	Info_AddChoice(DIA_Urshak_HALLO, " Orc talking? " ,DIA_Urshak_HALLO_wer);
};

func void DIA_Urshak_HELLO_who()
{
	AI_Output(other,self, " DIA_Urshak_HALLO_wer_15_00 " );	// Talking Orc?!
	AI_Output(self,other, " DIA_Urshak_HALLO_wer_18_01 " );	// You forget Ur-Shak?!...(sadly) You upset me.
	AI_Output(self,other, " DIA_Urshak_HALLO_wer_18_02 " );	// Ur-Shak help a friend get ULU-MULU many days early! For walking in my village. Orcs respect each other and each does not die at the hands of orcs!
	AI_Output(self,other, " DIA_Urshak_HALLO_wer_18_03 " );	// Friend then go to the orc temple and exorcise the evil demon. Many days before! Don't you remember?
	URSHAKBONUSGOTIKA = TRUE;
};

func void DIA_Urshak_HELLO_friend()
{
	if ( URSHAKBONUSGOTIKA  ==  FALSE )
	{
		URSHAKBONUSGOTIKA = TRUE;
		B_GivePlayerXP(50);
	};
	AI_Output(other,self, " DIA_Urshak_HALLO_freund_15_00 " );	// You picked the wrong time to get in my way. I almost killed you! What are you doing here?
	AI_Output(self,other, " DIA_Urshak_HALLO_freund_18_01 " );	// Ur-Shak look at the earth and see what has become of the earth and my people.
	Info_ClearChoices(DIA_Urshak_HALLO);
};

instance DIA_URSHAK_TARROKWOUND(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_tarrokwound_condition;
	information = dia_urshak_tarrokwound_info;
	description = " I need your help. " ;
};

func int dia_urshak_tarrokwound_condition()
{
	if((MEETTARROK == TRUE) && (TARROKHEALTHY == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_tarrokwound_info()
{
	AI_Output(other,self, " DIA_Urshak_TarrokWound_18_01 " );	// I need your help.
	AI_Output(self,other, " DIA_Urshak_TarrokWound_18_02 " );	// A friend always comes. Ur-Shak help a friend.
	AI_Output(other,self, " DIA_Urshak_TarrokWound_18_03 " );	// I met your friend, Tarrok. Unfortunately, several skeletons attacked him and he was badly injured.
	AI_Output(other,self, " DIA_Urshak_TarrokWound_18_04 " );	// Now he needs an orc healing potion to keep him alive. Can you tell me where to get it?
	AI_Output(self,other, " DIA_Urshak_TarrokWound_18_05 " );	// Ur-Shak's friend is injured!!! Bad... Friend do the right thing to come to Ur-Shak.
	AI_Output(self,other, " DIA_Urshak_TarrokWound_18_06 " );	// Friend doesn't have to look for the potion. Ur-Shak will give it. A friend will take him to Tarrok and he will be healthy.
	AI_Output(self,other, " DIA_Urshak_TarrokWound_18_07 " );	// Here... A friend is getting a potion. Now hurry.
	B_GiveInvItems(self,other,itpo_xorcpotion,1);
	B_LogEntry( TOPIC_TARROKWOUND , " Ur-Shak gave me an Orc potion...Now I must give it to Tarrok. I hope this helps him. " );
};


instance DIA_URSHAK_HASULUMULU (C_Info) .
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_hasulumulu_condition;
	information = dia_urshak_hasulumulu_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_urshak_hasulumulu_condition()
{
	if (( FINDPRESS ==  TRUE  ) && ( URSHAKK_SUCKED ==  FALSE  ) && ( Npc_HasItems ( other,itmw_2h_orcprestige) > = 1 ) ) ;   
	{
		return TRUE;
	};
};

func void dia_urshak_hasulumulu_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Urshak_HasUlumulu_18_01 " );	// Friend find Ulu-Mulu!!!(admiringly)...What a good one!
	URSHAKKNOWULUMULU = TRUE;
};


instance DIA_Urshak_WASHENORKS (C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = DIA_Urshak_WASMACHENORKS_Condition;
	information = DIA_Urshak_WASHENORKS_Info;
	description = " Why are orcs attacking humans? " ;
};


func int DIA_Urshak_WASHENORKS_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Urshak_HELLO ) && ( URSHAK_SUCKED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASHENORKS_Info()
{
	AI_Output(other,self, " DIA_Urshak_WASMACHENORKS_15_00 " );	// Why do orcs attack humans?
	AI_Output(self,other, " DIA_Urshak_WASMACHENORKS_18_01 " );	// Ur-Shak always tells the orc people that humans are not evil and should be friends with them.
	AI_Output(self,other, " DIA_Urshak_WASMACHENORKS_18_02 " );	// But the shaman doesn't listen to Ur-Shak. Ur-Shak is out of favor with his people.
	AI_Output(self,other, " DIA_Urshak_WASMACHENORKS_18_03 " );	// Therefore, Ur-Shak does not know exactly about the grand war plan against humans.
	B_LogEntry(TOPIC_Urshak, " He still can't get his people to listen to him. He's still an exile. " );
};


instance DIA_Urshak_SOMANY (C_Info)
{
	npc = NONE_110_Urshak;
	nr = 7;
	condition = DIA_Urshak_SOMANY_Condition;
	information = DIA_Urshak_SOMANY_Info;
	description = " Why are there so many of you here? " ;
};


func int DIA_Urshak_SOMANY_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Urshak_HELLO ) && ( URSHAK_SUCKED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Urshak_SOMANY_Info()
{
	AI_Output(other,self, " DIA_Urshak_SOVIELE_15_00 " );	// Why are there so many of you here?
	AI_Output(self,other, " DIA_Urshak_SOVIELE_18_01 " );	// Orcs come from the mountains, but others come in ships and make a big fence.
};


instance DIA_Urshak_ZAUN(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 8;
	condition = DIA_Urshak_ZAUN_Condition;
	information = DIA_Urshak_ZAUN_Info;
	description = " What's behind that orc palisade to the east? " ;
};


func int DIA_Urshak_ZAUN_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Urshak_HELLO ) && ( URSHAK_SUCKED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Urshak_ZAUN_Info()
{
	AI_Output(other,self, " DIA_Urshak_ZAUN_15_00 " );	// What's behind that orc palisade to the east?
	AI_Output(self,other, " DIA_Urshak_ZAUN_18_01 " );	// Orcs always make a big fence and prepare the camp for war.
	AI_Output(self,other, " DIA_Urshak_ZAUN_18_02 " );	// Fence is good for war. Hide the strength of the army and protect the orcs.
	AI_Output(self,other, " DIA_Urshak_ZAUN_18_03 " );	// But Ur-Shak hear strange news, though.
	AI_Output(self,other, " DIA_Urshak_ZAUN_18_04 " );	// Orcs speak - someone else's magic to come over the fence. Weird Magic!
	AI_Output(self,other, " DIA_Urshak_ZAUN_18_05 " );	// Orcs get scared! Shamans get scared! Orcs no longer walk behind the fence.
	AI_Output(self,other, " DIA_Urshak_ZAUN_18_06 " );	// Ur-Shak hasn't seen this before.
};


instance DIA_Urshak_WASHASTDUVOR(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = DIA_Urshak_WASHASTDUVOR_Condition;
	information = DIA_Urshak_WASHASTDUVOR_Info;
	description = " What are you planning to do next? " ;
};


func int DIA_Urshak_WASHASTDUVOR_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Urshak_HELLO ) && ( URSHAK_SUCKED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASHASTDUVOR_Info()
{
	AI_Output(other,self, " DIA_Urshak_WASHASTDUVOR_15_00 " );	// What are you planning to do next?
	AI_Output(self,other, " DIA_Urshak_WASHASTDUVOR_18_01 " );	// Ur-Shak wait while the orc scouts lead Ur-Shak to Hosh-Pak.
	AI_Output(other,self, " DIA_Urshak_WASHASTDUVOR_15_02 " );	// Who is Hosh-Pak?
	AI_Output(self,other, " DIA_Urshak_WASHASTDUVOR_18_03 " );	// Very large shaman. Have great influence on the warriors and make big plans for the orcs.
	B_LogEntry(TOPIC_Urshak, " Ur-Shak wants to meet with Orc shaman Hosh-Pak and convince him to accept Ur-Shak back to the council of shamans. " );
	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,Dialog_Back,DIA_Urshak_WASHASTDUVOR_next);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR, " Where can I find this Hosh Pack? " ,DIA_Urshak_WASHASTDUVOR_);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR, " Why don't you go to him then? " ,DIA_Urshak_WASHASTDUVOR_hoshpak);
};

func void DIA_Urshak_WASHASTDUVOR_hoshpak()
{
	AI_Output(other,self, " DIA_Urshak_WASHASTDUVOR_hoshpak_15_00 " );	// Why don't you go to him then?
	AI_Output(self,other, " DIA_Urshak_WASHASTDUVOR_hoshpak_18_01 " );	// Ur-Shak try and try to get back the honor and the old place in the council of shamans.
	AI_Output(self,other, " DIA_Urshak_WASHASTDUVOR_hoshpak_18_02 " );	// But don't listen to Ur-Shak yet Hosh-Pak. Orcs kill Ur-Shak if you see him without scouts. Ur-Shak must speak with Hosh-Pak.
	AI_Output(self,other, " DIA_Urshak_WASHASTDUVOR_hoshpak_18_03 " );	// Maybe it works out today.
};

func void DIA_Urshak_WASHASTDUVOR_()
{
	AI_Output(other,self, " DIA_Urshak_WASHASTDUVOR_Urshak_15_00 " );	// Where can I find this Hosh Pack?
	AI_Output(self,other, " DIA_Urshak_WASHASTDUVOR_Urshak_18_01 " );	// He is where he can watch the orc warriors at the fortress near the big volcano, so that Hosh-Pak can control the warriors.
};

func void DIA_Urshak_WASHASTDUVOR_next()
{
	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);
};


instance DIA_URSHAK_TEMPLEDOOR(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = dia_urshak_templedoor_condition;
	information = dia_urshak_templedoor_info;
	description = " What happened in the underground Temple? " ;
};


func int dia_urshak_templedoor_condition()
{
	if((ORCTEMPLEGATEINFO == TRUE) && (ORCTEMPLEGATEOPENED == FALSE) && (BUMSHAKINSERTED == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_templedoor_info()
{
	AI_Output(other,self, " DIA_Urshak_TempleDoor_15_00 " );	// Do you know what happened in the Temple of the Sleeper?
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_01 " );	// First, the orcs dig up the Temple after the departure of the evil Krushak.
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_02 " );	// Orcs dance and rejoice that the Temple is intact. Shamans conjure the Temple with the spirit of orcs.
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_03 " );	// But then the evil demon comes again. He began to kill and bewitch the brothers. Orcs get scared and leave the Temple.
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_04 " );	// Brothers close the entrance and cast a strong spell. A friend does not come close, otherwise a friend will die quickly.
	AI_Output(other,self, " DIA_Urshak_TempleDoor_15_03 " );	// How do you get there then?
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_06 " );	// A friend wants to go to the Temple?! A friend is not afraid of evil?!
	AI_Output(other,self, " DIA_Urshak_TempleDoor_15_05 " );	// I need to get to the underground temple! Can you take me there?
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_08 " );	// The brothers of Ur-Shak close the Temple in the ground very well. The brothers take the key to their city and hide it there.
	AI_Output(other,self, " DIA_Urshak_TempleDoor_15_06 " );	// City? You mean the city where orcs live?!
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_10 " );	// The underground city where the Ur-Shak brothers live. They are very much!
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_11 " );	// Ur-Shak remember, have a friend to be Ulu-Mulu. A friend to dress Ulu-Mulu and not die.
	AI_Output(other,self, " DIA_Urshak_TempleDoor_01_12 " );	// I'm afraid I lost it. Do you know where I can get another Ulu-Mulu?
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_13 " );	// Only warriors do Ulu-Mulu. Ur-Shak is not to be a warrior. Be a shaman. But Ur-Shak can tell where to find Ulu-Mulu.
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_14 " );	// Stranger again to go to friend Ur-Shak. His name is Tarrok. A friend must remember him.
	AI_Output(other,self, " DIA_Urshak_TempleDoor_01_15 " );	// Where to find your friend?
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_16 " );	// Friend go north to the swamp, and look there near the tower. Ur-Shak think a friend will find him there.
	AI_Output(other,self, " DIA_Urshak_TempleDoor_01_17 " );	// Where can I find the city?
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_18 " );	// Ur-Shak's house to be near the former human mine.
	AI_Output(self,other, " DIA_Urshak_TempleDoor_01_19 " );	// Friend don't forget to carry Ulu-Mulu in hand when going.

	if(ORCPROMISEMAKE == FALSE)
	{
		AI_Output(self,other, " DIA_Urshak_TempleDoor_01_20 " );	// Still Ur-Shak want to ask a friend - if a friend comes to the city of brothers, can a friend ask them to allow Ur-Shak to return?
		AI_Output(other,self, " DIA_Urshak_TempleDoor_01_21 " );	// I'll try! Unless, of course, they even talk to me.
	};

	AI_Output(other,self, " DIA_Urshak_TempleDoor_01_22 " );	// Thanks for your help, Ur-Shak.
	B_LogEntry( TOPIC_ORCTEMPLE , " Ur-Shak told me that the only way to get into the Temple of the Sleeper is to get the orc key, with which they cast a spell on the grate at the entrance. To do this, I will have to go to the orc city and try to persuade them, give me this artifact. " );
	B_LogEntry_Quiet( TOPIC_ORCTEMPLE , " To make my walk among the crowds of orcs more or less pleasant, I need to have Ulu-Mulu with me - a sign of friendship and strength of the orcs. With it, the orcs will not touch me. Ur-Shak cannot make me this orc talisman , but he said who could help me. He named the name Tarrok. Perhaps this orc will agree to make this Ulu-Mulu for me. According to Ur-Shak, I can find him next to the swamp, near a small tower. " ) ;

	if(ORCPROMISEMAKE == FALSE)
	{
		B_LogEntry_Quiet(TOPIC_Urshak, " Ur-Shak asked me to put in a good word for him with his brothers, if the opportunity presented itself. What would you do for a good old friend. " );
	};

	BUMSHAKINSERTED = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(orc_8524_bumshak,"OW_PATH_50");
	Wld_InsertNpc(Lesser_Skeleton,"OW_PATH_BUMSHAKSKEL_01");
	Wld_InsertNpc(Lesser_Skeleton,"OW_PATH_BUMSHAKSKEL_02");
	Wld_InsertNpc(Lesser_Skeleton,"OW_PATH_BUMSHAKSKEL_03");
};

instance DIA_Urshak_HOSHPAKDEAD(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = DIA_Urshak_HOSHPAKDEAD_Condition;
	information = DIA_Urshak_HOSHPAKDEAD_Info;
	description = " Hosh Pak is dead. " ;
};

func int DIA_Urshak_HOSHPAKDEAD_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Urshak_WASHASTDUVOR ) && Npc_IsDead ( Hosh_Pak ) & & ( URSHAK_SUCKED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKDEAD_Info()
{
	AI_Output(other,self, " DIA_Urshak_HOSHPAKDEAD_15_00 " );	// Hosh-Pak is dead.
	AI_Output(self,other, " DIA_Urshak_HOSHPAKDEAD_18_01 " );	// Hosh-Pak is dead?! RUSHTASOK!
	AI_Output(self,other, " DIA_Urshak_HOSHPAKDEAD_18_02 " );	// My heart is a great sadness. Ur-Shak never forget the great orc to do Ur-Shak shaman.
	AI_Output(other,self, " DIA_Urshak_HOSHPAKDEAD_15_03 " );	// I understand. Hosh-Pak was your teacher.
	AI_Output(self,other, " DIA_Urshak_HOSHPAKDEAD_18_04 " );	// Ur-Shak must now bear the burden of grief, must give Hosh-Pak the last rites. Ur-Shak must go.
	AI_Output(self,other, " DIA_Urshak_HOSHPAKDEAD_18_05 " );	// Friend better walk away pass. It's too dangerous here.
	AI_Output(self,other, " DIA_Urshak_HOSHPAKDEAD_18_06 " );	// Ur-Shak is sad if a person also dies.
	B_LogEntry(TOPIC_Urshak, " Hosh-Pak is dead. My orc friend is heading to Hosh-Pak's tent. He is grieving for his mentor. I must let him go. " );
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");
};

instance DIA_Urshak_HOSHPAKRACHE (C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_HOSHPAKRACHE_Condition;
	information = DIA_Urshak_HOSHPAKRACHE_Info;
	important = TRUE;
};


func int DIA_Urshak_HOSHPAKRACHE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HOSHPAKDEAD) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKRACHE_Info()
{
	AI_Output(self,other, " DIA_Urshak_HOSHPAKRACHE_18_00 " );	// Hotok! I find out that you'll be here when Hosh-Pak kill. Your making a big mistake, stranger.
	AI_Output(self,other, " DIA_Urshak_HOSHPAKRACHE_18_04 " );	// Ur-Shak see a big mistake to trust an evil person. Ur-Shak regret calling a person a friend and helping him not to be killed.
	AI_Output(self,other, " DIA_Urshak_HOSHPAKRACHE_18_05 " );	// The stranger will now leave the valley and go to the Passage. Ur-Shak won't kill intruders now. The honor shaman tells Ur-Shak not to kill.
	AI_Output(self,other, " DIA_Urshak_HOSHPAKRACHE_18_06 " );	// Next time we meet, we're enemies! Your better off now.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry(TOPIC_Urshak, " Now Ur-Shak is on the hostile side and a little annoyed that I killed his master. Maybe something will make him forget about this incident." ) ;
	Npc_ExchangeRoutine(self,"PreStart");
};


instances DIA_Urshak_KEINEWAHL (C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_KEINEWAHL_Condition;
	information = DIA_Urshak_KEINEWAHL_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Urshak_KEINEWAHL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HOSHPAKRACHE) && Npc_IsInState(self,ZS_Talk) && (URSHAK_SUCKED == TRUE) && (URSHAKNOMAGIC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_NO CHOICE_Info()
{
	AI_Output(self,other, " DIA_Urshak_KEINEWAHL_18_00 " );	// Yours to leave. Mine no longer speak to strangers.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};


instance DIA_URSHAK_FORGIVEME(C_Info)
{
	npc = NONE_110_Urshak;
	condition = dia_urshak_forgiveme_condition;
	information = dia_urshak_forgiveme_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_urshak_forgiveme_condition()
{
	if((URSHAKNOMAGIC == TRUE) && (URSHAKENDANGRY == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_forgiveme_info()
{
	AI_Output(self,other, " DIA_Urshak_ForgiveMe_01_00 " );	// What's a person to do? Why try to cast Ur-Shak?...
	AI_Output(other,self, " DIA_Urshak_ForgiveMe_01_01 " );	// You spoke to me again!...
	AI_Output(self,other, " DIA_Urshak_ForgiveMe_01_02 " );	// Man speak strange words...Ur-Shak does not understand.
	AI_Output(self,other, " DIA_Urshak_ForgiveMe_01_03 " );	// Ur-Shak remember a person to be a friend. Why can't Ur-Shak talk to a human?!...(uncomprehending)
	AI_Output(other,self, " DIA_Urshak_ForgiveMe_01_04 " );	// Aren't you mad at me anymore?
	AI_Output(self,other, " DIA_Urshak_ForgiveMe_01_05 " );	// Why should Ur-Shak be mad at a human!...(uncomprehending)
	AI_Output(other,self, " DIA_Urshak_ForgiveMe_01_06 " );	// Everything is clear... Hmm... Yes, something I'm talking about is just complete nonsense. I don't know what's wrong with me. Forget it!
	AI_Output(self,other, " DIA_Urshak_ForgiveMe_01_07 " );	// Ur-Shak think friend be very strange today. Can a friend conjure an evil demon or a friend get sick?
	AI_Output(other,self, " DIA_Urshak_ForgiveMe_01_08 " );	// No, it's all right, buddy. Just - forget about it.
	B_LogEntry(TOPIC_Urshak, " Apparently my idea of ​​trying to cast a forgetting magic spell on Ur-Shak worked! Ur-Shak forgot about that unfortunate incident with his teacher. Now we're friends again. " );
	B_GivePlayerXP(500);
	URSHAKENDANGRY = TRUE;
};

instance DIA_URSHAK_ORCTEMPLEFIXED(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_orctemplefixed_condition;
	information = dia_urshak_orctemplefixed_info;
	permanent = FALSE;
	description = " I have done away with evil in the Temple of the Sleeper. " ;
};


func int dia_urshak_orctemplefixed_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && ((URSHAK_SUCKED == FALSE) || (URSHAKENDANGRY == TRUE)))
	{
		return TRUE;
	};
};

func void dia_urshak_orctemplefixed_info()
{
	AI_Output(other,self, " DIA_Urshak_OrctempleFixed_15_00 " );	// I have done away with evil in the Temple of the Sleeper.
	AI_Output(self,other, " DIA_Urshak_OrctempleFixed_18_01 " );	// (amazed) HROTOK YABART!!! How did the human friend manage to do this?
	AI_Output(other,self, " DIA_Urshak_OrctempleFixed_15_02 " );	// It wasn't easy.
	AI_Output(self,other, " DIA_Urshak_OrctempleFixed_18_03 " );	// Ur-Shak is very respectful of a human friend. Very, very respect.
	B_GivePlayerXP(300);
};


instance DIA_URSHAK_BECOMESHAMAN(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_becomeshaman_condition;
	information = dia_urshak_becomeshaman_info;
	permanent = FALSE;
	description = " About your request. " ;
};

func int dia_urshak_becomeshaman_condition()
{
	if((ORCPROMISEMAKE == TRUE) && (URSHAKBECOMESHAMAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_becomeshaman_info()
{
	B_GivePlayerXP(XP_UrshakBecomesShaman);
	AI_Output(other,self, " DIA_Urshak_BecomeShaman_01_00 " );	// Regarding your request.
	AI_Output(other,self, " DIA_Urshak_BecomeShaman_01_01 " );	// I put in a good word for you with the orc chieftain.
	AI_Output(self,other, " DIA_Urshak_BecomeShaman_01_02 " );	// And what to say the leader?
	AI_Output(other,self, " DIA_Urshak_BecomeShaman_01_03 " );	// Now you can return to your brothers!
	AI_Output(self,other, " DIA_Urshak_BecomeShaman_01_04 " );	// HROTOK YABART!!!...(amazed) How did a human friend manage to do that?
	AI_Output(other,self, " DIA_Urshak_BecomeShaman_01_05 " );	// I rendered the leader one invaluable service - in return, the leader agreed to fulfill my request.
	AI_Output(self,other, " DIA_Urshak_BecomeShaman_01_06 " );	// Ur-Shak is very happy! Ur-Shak to say friend-man thank you very much!
	AI_Output(other,self, " DIA_Urshak_BecomeShaman_01_07 " );	// Yes, okay. It wasn't that hard.
	AI_Output(self,other, " DIA_Urshak_BecomeShaman_01_08 " );	// Ur-Shak will never forget a human friend and what to do he for Ur-Shak!
	AI_Output(other,self, " DIA_Urshak_BecomeShaman_01_09 " );	// Now I have to go.
	AI_Output(self,other, " DIA_Urshak_BecomeShaman_01_10 " );	// Okay, friend go. Ur-Shak prepare to return home - to the brothers.
	URSHAKBECOMESHAMAN = TRUE;
	MIS_UrshakShaman = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Urshak,LOG_SUCCESS);
	B_LogEntry(TOPIC_Urshak, " Now Ur-Shak belongs to the circle of shamans again. " );
};


instance DIA_URSHAK_ORCORDER(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_orcorder_condition;
	information = dia_urshak_orcorder_info;
	permanent = FALSE;
	description = " Can you help me with one thing? " ;
};


func int dia_urshak_orcorder_condition()
{
	if (( MY_ORCORDER  == LOG_Running ) && ( Npc_HasItems ( hero , itwr_orcsorder ) >=  1 ) && ( PlayerKnowsOrcLanguage ==  FALSE ) && ( KNOWSTARANBUILD  ==  FALSE ));
	{
		return TRUE;
	};
};

func void dia_urshak_orcorder_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Urshak_OrcOrder_01_00 " );	// Can you help me with one thing?
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_01 " );	// Ur-Shak is always ready to help people. What can Ur-Shak do for a friend?!
	AI_Output(other,self, " DIA_Urshak_OrcOrder_01_02 " );	// I have this letter - it is written in the orc language.
	AI_Output(other,self, " DIA_Urshak_OrcOrder_01_03 " );	// Could you read it to me?!
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_04 " );	// Good! A friend to give a letter to Ur-Shak - he is to read and a man to listen.
	AI_Output(other,self, " DIA_Urshak_OrcOrder_01_05 " );	// Here, take this.
	B_GiveInvItems(other,self,itwr_orcsorder,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_06 " );	// ...(looks at the letter) Here to write about the orcs' big plans for war with humans.
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_07 " );	// HROTOK YABART!!! Where did the person get this letter?!...(surprised)
	AI_Output(other,self, " DIA_Urshak_OrcOrder_01_08 " );	// Accidentally found! Better not stop - read everything that is written there.
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_09");	//Хммм...(смотрит на письмо)
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_10 " );	// Orcs write that many strong warriors will soon arrive here and fight against people.
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_11 " );	// But the brothers must first capture the great human fortress.
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_12 " );	// Without a fortress, the orcs will not go further to fight - you can't go to fight if there are enemies behind!
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_13 " );	// Need a big battering ram to break down the wall and the gate!
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_14 " );	// Therefore, the brothers send a detachment of slaves to make a ram. They go soon to the big orc camp.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_15 " );	// That's all there is to write...
	AI_Output(other,self, " DIA_Urshak_OrcOrder_01_16 " );	// Got it. So the orcs want to build a new battering ram to storm the castle?!
	AI_Output(self,other, " DIA_Urshak_OrcOrder_01_17 " );	// Ur-Shak think so.
	AI_Output(other,self, " DIA_Urshak_OrcOrder_01_18 " );	// Okay! Thanks for the help.
	B_LogEntry( TOPIC_ORCORDER , " Ur-Shak helped me read the letter. It says that the orcs have sent a squad of slaves to make a new battering ram to storm the castle. Apparently, this squad should soon arrive at their camp near the fortress. Now we need to report this to Albert as soon as possible. " );
	KNOWSTARANBUILD = TRUE;
};


instance DIA_URSHAK_WAKONTEST (C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_wakontest_condition;
	information = dia_urshak_wakontest_info;
	permanent = FALSE;
	description = " I need your advice, Ur-Shak. " ;
};


func int dia_urshak_wakontest_condition()
{
	if(MIS_WAKONTEST == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_urshak_wakontest_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Urshak_WakonTest_01_00 " );	// I need your advice, Ur-Shak.
	AI_Output(self,other, " DIA_Urshak_WakonTest_01_01 " );	// Ur-Shak listen to a friend. What does the friend want to ask?
	AI_Output(other,self, " DIA_Urshak_WakonTest_01_02 " );	// Tell me what you know about the Water Spirit?
	AI_Output(self,other, " DIA_Urshak_WakonTest_01_03 " );	// Spirit of Water?! Hmmm... (thoughtfully) I'm afraid Ur-shak doesn't know much about this. Not enough to hear about it!
	AI_Output(self,other, " DIA_Urshak_WakonTest_01_04 " );	// However, Ur-Shak think that to know which of the brothers might be able to help a person.
	AI_Output(other,self, " DIA_Urshak_WakonTest_01_05 " );	// And who is this?!
	AI_Output(self,other, " DIA_Urshak_WakonTest_01_06 " );	// A friend must go to the mountains to the orcs! Look for the Big Stone clan there - be a big camp and live a lot of orcs.
	AI_Output(self,other, " DIA_Urshak_WakonTest_01_07 " );	// The person should ask there. Can someone help a friend!
	AI_Output(other,self, " DIA_Urshak_WakonTest_01_08 " );	// But how do I get there?!
	AI_Output(self,other, " DIA_Urshak_WakonTest_01_09 " );	// A man is looking for a road to the mountains next to the old town of the brothers, where the Krushak temple used to be!
	AI_Output(self,other, " DIA_Urshak_WakonTest_01_10 " );	// Friend go high into the mountains, search and find a big camp.
	AI_Output(other,self, " DIA_Urshak_WakonTest_01_11 " );	// Okay, thanks for the help!
	AI_Output(self,other, " DIA_Urshak_WakonTest_01_12 " );	// Ur-Shak is always happy to help a human friend.
	URSHAKTELLWATERSOUL = TRUE;
	B_LogEntry( TOPIC_WAKONTEST , " Much to my regret, Ur-Shak doesn't know anything about the Spirit of Water. But he advised me to travel high into the mountains behind the Temple of the Sleeper, where the Big Stone clan's large camp is located. Perhaps there I can learn more about the topic that interests me . " );
};


instance DIA_URSHAK_MEETINCASTLE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 1;
	condition = dia_urshak_meetincastle_condition;
	information = dia_urshak_meetingcastle_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_urshak_meetincastle_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ORсGREATWAR == LOG_Running) && (URSHAKBECOMESHAMAN == TRUE) && (PALADINATTACK == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_meetincastle_info()
{
	AI_Output(self,other, " DIA_Urshak_MeetInCastle_01_00 " );	// Ur-Shak see a human friend come to the castle! Why would he do this?!
	AI_Output(other,self, " DIA_Urshak_MeetInCastle_01_01 " );	// So you're here too. Didn't expect to meet you here!
	AI_Output(self,other, " DIA_Urshak_MeetInCastle_01_02 " );	// Why is a person so surprised?!...(uncomprehending)
	AI_Output(self,other, " DIA_Urshak_MeetInCastle_01_03 " );	// Ur-Shak is now a shaman, return to the brothers and go to fight with them.
	AI_Output(self,other, " DIA_Urshak_MeetInCastle_01_04 " );	// However, friend know that Ur-Shak will never want this. Always tell brothers not to kill people!
	AI_Output(self,other, " DIA_Urshak_MeetInCastle_01_05 " );	// But the orcs won't listen to Ur-Shak again! Therefore, Ur-Shak is afraid to make the brothers angry again.
	AI_Output(other,self, " DIA_Urshak_MeetInCastle_01_06 " );	// Okay! I don't blame you.
	MEETURSHAKALREADY = TRUE;
};


instance DIA_URSHAK_ORCSAVEPEOPLE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_orcsavepeople_condition;
	information = dia_urshak_orcsavepeople_info;
	permanent = FALSE;
	description = " Why didn't the orcs kill the paladins? " ;
};


func int dia_urshak_orcsavepeople_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_urshak_meetingcastle ) && ( MIS_OR с GREATWAR  == LOG_Running ) && ( URSHAKBECOMESHAMAN  ==  TRUE ) && ( KNOWABOUTGAROND  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_urshak_orcsavepeople_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Urshak_OrcSavePeople_01_01 " );	// Why didn't the orcs kill all the paladins?
	AI_Output(self,other, " DIA_Urshak_OrcSavePeople_01_02 " );	// It's a friend saying Ur-Shak thanks. Ur-Shak save people!
	AI_Output(self,other, " DIA_Urshak_OrcSavePeople_01_03 " );	// He tells the brothers not to touch the people - to say that they can be useful.
	AI_Output(self,other, " DIA_Urshak_OrcSavePeople_01_04 " );	// Because to be not simple people, to be a paladin! Be a strong warrior.
	AI_Output(other,self, " DIA_Urshak_OrcSavePeople_01_05 " );	// But why did they listen to you this time?
	AI_Output(self,other, " DIA_Urshak_OrcSavePeople_01_06 " );	// Ur-Shak be a shaman and speak with the spirits. The spirits tell Ur-Shak that these people should not be killed.
	AI_Output(self,other, " DIA_Urshak_OrcSavePeople_01_07 " );	// He talk about it leader. The one to listen and decide that Ur-Shak be right!
	AI_Output(other,self, " DIA_Urshak_OrcSavePeople_01_08 " );	// Hmm...interesting! Didn't think it was possible.
	AI_Output(self,other, " DIA_Urshak_OrcSavePeople_01_09 " );	// Friend doesn't believe me?...(surprised) Why?!
	AI_Output(other,self, " DIA_Urshak_OrcSavePeople_01_10 " );	// No, I believe you. And I want to thank you so much for your help!
	AI_Output(self,other, " DIA_Urshak_OrcSavePeople_01_11 " );	// HAT TAR!!!...(pretty) Ur-Shak say friend - please.
	URSHAKTELLPALADIN = TRUE;
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , " It's all clear now! Paladins owe their lives to my friend Ur-Shak. Being in the status of a shaman, he was able to influence the decision of orc warlords so that they would not begin to kill captives. Sometimes I am extremely glad that I once saved that orc's life! " );
	};
};


instance DIA_URSHAK_HELPSAVEPEOPLE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_helpsavepeople_condition;
	information = dia_urshak_helpsavepeople_info;
	permanent = FALSE;
	description = " Can you help me free the paladins? " ;
};


func int dia_urshak_helpsavepeople_condition()
{
	if (Npc_KnowsInfo(hero,dia_urshak_meetincastle) && ( MIS_OR с GREATWAR  == LOG_Running) && ( URSHAKBECOMESHAMAN  ==  TRUE ) && ( KNOWABOUTGAROND  ==  TRUE ) && ( CASTLEISFREE  ==  FALSE ) && ( PALADINCASTELFREE  ==  FALSE ) && ( AL= .BOGNART  );  FALSE ) && ( MY_STURMCASTLE  ==  FALSE ) && (ORCLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_helpsavepeople_info()
{
	AI_Output(other,self, " DIA_Urshak_HelpSavePeople_01_01 " );	// Can you help me free the paladins?
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_02 " );	// Hmmm...(thoughtfully) Ur-Shak is afraid not to know how he can do it.
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_03 " );	// If Ur-Shak tells brothers to let people go, then they will kill Ur-Shak! Ur-Shak becomes dead.
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_04 " );	// Ur-Shak does not want to anger the brothers, does not want to become dead.
	AI_Output(other,self, " DIA_Urshak_HelpSavePeople_01_05 " );	// I understand you! Okay, so you'll have to think about it yourself.
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_06 " );	// However, friend, take your time...(thoughtfully) Maybe Ur-Shak still knows how a person can free people.
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_07 " );	// But a person must do everything himself. Ur-Shak don't help the man!
	AI_Output(other,self, " DIA_Urshak_HelpSavePeople_01_08 " );	// So you got the idea? And what is it?!
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_09 " );	// A man must go and speak with Hag-Tar! Think he can let people go.
	if(Npc_KnowsInfo(other,dia_orc_8566_urhan_hello))
	{
		AI_Output(other,self, " DIA_Urshak_HelpSavePeople_01_10 " );	// Oh yeah! I've already met him. And what should I tell him?
	}
	else
	{
		AI_Output(other,self, " DIA_Urshak_HelpSavePeople_01_11 " );	// Who is Hag-Tar?!
		AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_12 " );	// Be the main warrior here! Tell all brothers what to do.
		AI_Output(other,self, " DIA_Urshak_HelpSavePeople_01_13 " );	// And what should I tell him?!
	};
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_14 " );	// What you want to hear Hag-Tar! Ur-Shak think to know it.
	AI_Output(other,self, " DIA_Urshak_HelpSavePeople_01_15 " );	// Maybe then you can tell me about it?!
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_16 " );	// Good! Ur-Shak used to hear how Hag-Tar talk about - that always want to be the leader of the brothers.
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_17 " );	// However, the brothers already have a leader - call Ur-Thrall, be a great warrior!
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_18 " );	// Therefore, Hag-Tar is angry and wants his death. If Ur-Thrall dies - Hag-Thar himself becomes a leader!
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_19 " );	// But Hag-Tar is always afraid to fight Ur-Thrall, because he is the strongest warrior - stronger than all brothers, stronger than Hag-Tar!
	AI_Output(other,self, " DIA_Urshak_HelpSavePeople_01_20 " );	// So you want me to suggest that Hag-Tar kill your leader?!
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_21 " );	// Be like this! Ur-Shak think that for this Hag-Tar can free the people.
	AI_Output(self,other, " DIA_Urshak_HelpSavePeople_01_22 " );	// But the person decides for himself! Ur-Shak only speak a friend, and a friend think.
	AI_Output(other,self, " DIA_Urshak_HelpSavePeople_01_23 " );	// Got it. Okay, I'll think about it!
	URSHAKTELLSSECRET = TRUE;

	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , " Ur-Shak told me something very interesting. Hag-Thar is the chief commander of the fortress, always wanted to become the leader of the orcs. But they already have a leader - Ur-Thrall and as long as he lives, Hag-Thar will never to carry out his plan. I think that perhaps Hag-Tar will be interested in my help in this matter and subsequently he will agree to release the captive paladins. " );
	};
};

instance DIA_Urshak_OrcLanguage(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_OrcLanguage_condition;
	information = DIA_Urshak_OrcLanguage_info;
	permanent = FALSE;
	description = " Can you teach me the orc language? " ;
};

func int DIA_Urshak_OrcLanguage_condition()
{
	if((PlayerKnowsOrcLanguage == FALSE) && (NeedKnowOrcLang == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_OrcLanguage_info()
{
	AI_Output(other,self, " DIA_Urshak_OrcLanguage_01_01 " );	// Can you teach me the orc language?
	AI_Output(self,other, " DIA_Urshak_OrcLanguage_01_02 " );	// Hmmm... (with interest) Why would a person want to know our language?
	AI_Output(other,self, " DIA_Urshak_OrcLanguage_01_03 " );	// I need to talk to an orc, but I don't understand what he's telling me!
	AI_Output(self,other, " DIA_Urshak_OrcLanguage_01_04 " );	// Ur-Shak to understand a person... (approvingly) Be so! He will teach a man the language of the brothers.
	AI_Output(self,other, " DIA_Urshak_OrcLanguage_01_05 " );	// Unless, of course, that person has enough experience.
};

instance DIA_Urshak_OrcLanguageTeach(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_OrcLanguageTeach_condition;
	information = DIA_Urshak_OrcLanguageTeach_info;
	permanent = TRUE;
	description = " Teach me the orcish language. (Learning points: 10) " ;
};

func int DIA_Urshak_OrcLanguageTeach_condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_OrcLanguage) && (PlayerKnowsOrcLanguage == FALSE) && (NeedKnowOrcLang == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_OrcLanguageTeach_info()
{
	AI_Output(other,self, " DIA_Urshak_OrcLanguageTeach_01_01 " );	// Teach me the language of orcs.

	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		AI_Output(self,other, " DIA_Urshak_OrcLanguageTeach_01_02 " );	// Okay...(seriously) Then the man listen and memorize what Ur-Shak tell him.
		AI_Output(self,other, " DIA_Urshak_OrcLanguageTeach_01_07 " );	// The language of the orcs is not like the language of a friend of man.
		AI_Output(self,other, " DIA_Urshak_OrcLanguageTeach_01_08 " );	// It will be much more ancient and more beautiful.
		AI_Output(self,other, " DIA_Urshak_OrcLanguageTeach_01_09 " );	// It has many short words, few long words.
		AI_Output(self,other, " DIA_Urshak_OrcLanguageTeach_01_10 " );	// Each word means something different! When you say a lot of words, the brothers understand the overall picture of what was said.
		AI_Output(self,other, " DIA_Urshak_OrcLanguageTeach_01_04 " );	// That's all you need to know about the orc language!
		AI_Output(self,other, " DIA_Urshak_OrcLanguageTeach_01_05 " );	// Now, you can read our letters and understand our speech.
		AI_Output(other,self,"DIA_Urshak_OrcLanguageTeach_01_06");	//Отлично!
		PlayerKnowsOrcLanguage = TRUE;
		AI_Print( " Orc language learned... " );
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_Language,LOG_NOTE);
		B_LogEntry(TOPIC_Language, " Now I know the orc language. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Urshak_OrcLanguageTeach_01_07 " );	// You don't have the experience for that, human!
		AI_Output(self,other, " DIA_Urshak_OrcLanguageTeach_01_08 " );	// Come back later when you've got it.
	};
};
