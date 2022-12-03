

instance DIA_DRAGON_GOLD_EXIT(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 999;
	condition = dia_dragon_gold_exit_condition;
	information = dia_dragon_gold_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dragon_gold_exit_condition()
{
	return TRUE;
};

func void dia_dragon_gold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAGON_GOLD_HELLO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_hello_condition;
	information = dia_dragon_gold_hello_info;
	important = TRUE;
};


func int dia_dragon_gold_hello_condition()
{
	return TRUE;
};

func void dia_dragon_gold_hello_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_00");	//Человек?!
	AI_Output(self,other, " DIA_Dragon_Gold_Hello_01_01 " );	// How long have I not seen people...
	AI_Output(other,self, " DIA_Dragon_Gold_Hello_01_02 " );	// So that's what the Architects were hiding behind this portal! Another dragon - who would have thought.
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_05");	//Кто ты?
	AI_Output(self,other, " DIA_Dragon_Gold_Hello_01_06 " );	// I am Ash'Thar, the golden dragon. Few have received this honor.
	AI_Output(other,self, " DIA_Dragon_Gold_Hello_01_11 " );	// Honor? Do you think it's an honor to be eaten by a dragon?
	AI_Output(self,other, " DIA_Dragon_Gold_Hello_01_12 " );	// And you're funny, man! No one has made me laugh like this in a long time.
	AI_Output(other,self, " DIA_Dragon_Gold_Hello_01_14 " );	// Aren't dragons a creature of darkness whose true reason for being is the destruction of all life?
	AI_Output(self,other, " DIA_Dragon_Gold_Hello_01_18 " );	// In this world, there is both good and evil, presented in the same guise, man.
	AI_Output(other,self, " DIA_Dragon_Gold_Hello_01_20 " );	// Do you want to say that you do not bring evil into this world?
	AI_Output(self,other, " DIA_Dragon_Gold_Hello_01_22 " );	// Only actions matter - only they can determine the true meaning of existence!	
	AI_Output(self,other, " DIA_Dragon_Gold_Hello_01_21 " );	// I see confusion in your eyes...
	self.name[0] = "Аш'Тар";
	DRAGONGOLDMEET = TRUE;

	if(MIS_GOLDDRAGONPORTAL == LOG_Running)
	{
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " In the ancient ruins of the Builders, I discovered a portal. I was able to activate it with a strange magic stone that I found in the temple of Adanos. The portal led me to a small valley, where, as it turned out, a very interesting meeting awaited me. " );
	}
	else
	{
		Log_CreateTopic(TOPIC_GOLDDRAGONPORTAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_Running);
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " In the ancient ruins of the Builders, I discovered a portal. I was able to activate it with a strange magic stone that I found in the temple of Adanos. The portal led me to a small valley, where, as it turned out, a very interesting meeting awaited me. " );
		MIS_GOLDDRAGONPORTAL = LOG_Running;
	};
};


instance DIA_DRAGON_GOLD_WHOCREATE(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_whocreate_condition;
	information = dia_dragon_gold_whocreate_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};

func int dia_dragon_gold_whocreate_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_whocreate_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_WhoCreate_01_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Dragon_Gold_WhoCreate_01_01 " );	// I wanted to ask you the same question. How could YOU be here?
	AI_Output(other,self, " DIA_Dragon_Gold_WhoCreate_01_03 " );	// I had a magic stone of the focusing type, with the help of which I activated the portal leading here.
	AI_Output(self,other, " DIA_Dragon_Gold_WhoCreate_01_04 " );	// By these words, you probably meant the Key of the Sun, because only he could open the way here for you.
	AI_Output(self,other, " DIA_Dragon_Gold_WhoCreate_01_06 " );	// But how did he get to you? Only his Guardians - the Guardians of the Sun - possessed this secret knowledge and had access to my abode.
	AI_Output(other,self, " DIA_Dragon_Gold_WhoCreate_01_08 " );	// Where I found this artifact, there were no Guardians or Guardians of the Sun.
	AI_Output(other,self, " DIA_Dragon_Gold_WhoCreate_01_09 " );	// There was no one there at all, except for a bunch of bandits.
	AI_Output(other,self, " DIA_Dragon_Gold_WhoCreate_01_12 " );	// And, it seems to me, those whom you call Guardians of the Sun, we call - Architects. So know: their civilization has long since died out.
	AI_Output(self,other, " DIA_Dragon_Gold_WhoCreate_01_13 " );	// I don't understand! But... how could this happen?
	AI_Output(other,self, " DIA_Dragon_Gold_WhoCreate_01_14 " );	// From what I know, they found one powerful artifact that they couldn't handle, but that was able to handle them.
	AI_Output(other,self, " DIA_Dragon_Gold_WhoCreate_01_16 " );	// And the curse of Adanos befell them: there was such a catastrophe - a terrible flood. Then the water left.
	AI_Output(other,self, " DIA_Dragon_Gold_WhoCreate_01_17 " );	// Now there are only dilapidated temples around.
	AI_Output(self,other, " DIA_Dragon_Gold_WhoCreate_01_18 " );	// My valley has not been touched by these horrors. What about the people you were talking about?
	AI_Output(other,self, " DIA_Dragon_Gold_WhoCreate_01_20 " );	// Bandits who were looking for gold and an artifact - the Claw of Beliar - which was the cause of the fall of the Builders.
	AI_Output(self,other, " DIA_Dragon_Gold_WhoCreate_01_27 " );	// Claw?! So I thought...
	AI_Output(self,other, " DIA_Dragon_Gold_WhoCreate_01_28 " );	// So... if that's the case, then... they didn't listen to me. They didn't destroy it... fools!
	AI_Output(self,other, " DIA_Dragon_Gold_WhoCreate_01_29 " );	// Now everything is clear to me...
	AI_Output(self,other, " DIA_Dragon_Gold_WhoCreate_01_31 " );	// ...evil has already broken free, and nothing will prevent it from carrying out the great plan of its creator.
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Ash'Thar was shocked at the news of the death of the Builders. Apparently, the golden dragon played a significant role in the life of this once great people and was an integral part of the culture of the Builders. But he was even more upset that the Claw of Beliar never was destroyed by the Builders, as Ash'Thar insisted in his time. " );
};

instance DIA_DRAGON_GOLD_ADANOSVALLEY(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_ADANOSVALLEY_condition;
	information = dia_dragon_gold_ADANOSVALLEY_info;
	permanent = FALSE;
	description = " I found this stone tablet in the Temple of the Builders. " ;
};

func int dia_dragon_gold_ADANOSVALLEY_condition()
{
	if ((Npc_KnowsInfo(hero, dia_dragon_gold_whatdo)) && (Npc_HasItems(hero, ItWr_CroneAdanos) >=  1 ) && (MY_AdanosCrone == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_ADANOSVALLEY_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_ADANOSVALLEY_01_01 " );	// I found this stone tablet in the Temple of the Architects. Do you know what it is?
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_02 " );	// Let me take a look at it.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_03");	//Вот.
	B_GiveInvItems(other,self,ItWr_CroneAdanos,1);
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_04 " );	// stone tablet? The man made me laugh a lot.
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_05 " );	// What you call a stone tablet is actually a magic scroll of the Ancients!
	AI_Output(other,self, " DIA_Dragon_Gold_ADANOSVALLEY_01_06 " );	// So this is a magical scroll of the Builders?
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_07 " );	// Yes. But, judging by the language in which it is written, the time of this subject goes back to the time of the birth of this world.
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_08 " );	// True, I don't sense any magic in this item right now.
	AI_Output(other,self, " DIA_Dragon_Gold_ADANOSVALLEY_01_09 " );	// But can you at least translate what it says?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_10");	//Конечно.
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_11 " );	// Judging by the text, this scroll was used to summon...
	AI_Output(other,self, " DIA_Dragon_Gold_ADANOSVALLEY_01_12 " );	// ...to summon?
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_13 " );	// To summon the ancient guardians of Adanos himself.
	AI_Output(other,self, " DIA_Dragon_Gold_ADANOSVALLEY_01_14 " );	// Interesting. And what are these ancient guardians?
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_15 " );	// As I understand it, we are talking about creatures that once guarded the Temple of Adanos.
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_16 " );	// However, as far as I know, their time is long past.
	AI_Output(other,self, " DIA_Dragon_Gold_ADANOSVALLEY_01_17 " );	// Is that all there is?
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_18 " );	// It also mentions some powerful artifact guarded by these ancient creatures.
	AI_Output(other,self, " DIA_Dragon_Gold_ADANOSVALLEY_01_19 " );	// Now this is more interesting. And what kind of artifact are we talking about?
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_20 " );	// Not mentioned here...
	AI_Output(self,other, " DIA_Dragon_Gold_ADANOSVALLEY_01_21 " );	// So if anyone else knows about this item, it's only the custodians.
	B_GiveInvItems(self,other,ItWr_CroneAdanos,1);
	B_LogEntry(TOPIC_AdanosCrone, " Praise Innos! The golden dragon helped me translate these ancient writings. This stone tablet appears to have once been a magical scroll to summon some ancient creatures that Ash'Thar called Guardians. - some powerful artifact that these ancient creatures guarded. " );
	KnowsTextAdanos = TRUE;
};


instance DIA_DRAGON_GOLD_AWAKEGUARDS(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_AWAKEGUARDS_condition;
	information = dia_dragon_gold_AWAKEGUARDS_info;
	permanent = FALSE;
	description = " You said it was a summoning scroll. " ;
};

func int dia_dragon_gold_AWAKEGUARDS_condition()
{
	if(KnowsTextAdanos == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_gold_AWAKEGUARDS_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_AWAKEGUARDS_01_00 " );	// You said it was a summoning scroll.
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_01 " );	// So it is.
	AI_Output(other,self, " DIA_Dragon_Gold_AWAKEGUARDS_01_02 " );	// Then why don't we call these guardians and ask them about the artifact?
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_03 " );	// This is too dangerous... The wrath of these creatures could easily kill you.
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_04 " );	// In addition, to use this scroll, it must first be re-infused with magic...
	AI_Output(other,self, " DIA_Dragon_Gold_AWAKEGUARDS_01_05 " );	// And how can this be done?
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_06 " );	// And you, as I see it, are determined, since you are not even stopped by the danger of your own death...
	AI_Output(other,self, " DIA_Dragon_Gold_AWAKEGUARDS_01_08 " );	// I'm used to looking death in the eye.
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_09 " );	// Well, if so... Then I know one way to restore this item's magic power.
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_11 " );	// As far as I know, a special runic altar was once kept in one of the temples of the Ancients.
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_12 " );	// Architects used it to transfer magic from one object to another.
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_13 " );	// With it, you can try to transfer magic to this ancient scroll.
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_14 " );	// Any other magic item that contains the Builder's magic will work for this.
	AI_Output(other,self, " DIA_Dragon_Gold_AWAKEGUARDS_01_16 " );	// Seems like nothing complicated. And, if I succeed, where do I use the scroll to awaken the guardians?
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_17 " );	// I don't know... But if I were you, I'd try to use it in the heart of the temple.
	AI_Output(self,other, " DIA_Dragon_Gold_AWAKEGUARDS_01_18 " );	// Where everything is steeped in ancient magic... Maybe this will work.
	AI_Output(other,self, " DIA_Dragon_Gold_AWAKEGUARDS_01_19 " );	// Okay, I'll try to find this place.
	KnowsMakeOldMgic = TRUE;
	B_LogEntry(TOPIC_AdanosCrone, " I decided to take a chance and summon these ancient creatures. But first I need to return the magic to the item itself. Ash'Thar told me that in one of the temples of the Ancients there was once a special runic table, with which the Architects transferred magic from one item to another.In order to transfer magic into a stone tablet, I need an item that contains at least a fraction of the magic of the Builders.And, if I succeed, I will need to find a place where I can use the summoning scroll.The golden dragon advised me to do this in in the very center of the temple. " );
};


instance DIA_DRAGON_GOLD_AboutAntientGuards(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = DIA_DRAGON_GOLD_AboutAntientGuards_condition;
	information = DIA_DRAGON_GOLD_AboutAntientGuards_info;
	permanent = FALSE;
	description = " How can I defeat the ancient guardians of Adanos? " ;
};

func int DIA_DRAGON_GOLD_AboutAntientGuards_condition()
{
	if((KnowAboutAdVal == TRUE) && (RavenIsDead == FALSE) && (StoneBossIsDead == FALSE) && (TellAboutAdanosWeapon == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DRAGON_GOLD_aboutantientguards_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_DRAGON_GOLD_AboutAntientGuards_01_01 " );	// How can you defeat the ancient guardians of Adanos?
	AI_Output(self,other, " DIA_DRAGON_GOLD_AboutAntientGuards_01_02 " );	// To do this, a person needs the Scourge of the Guardians. Only with his help can you crush these ancient creatures.
	AI_Output(other,self, " DIA_DRAGON_GOLD_AboutAntientGuards_01_04 " );	// And where can I find it?
	AI_Output(self,other, " DIA_DRAGON_GOLD_AboutAntientGuards_01_05 " );	// People kept it in one of their temples. Try looking there.
	B_LogEntry(TOPIC_AdanosCrone, " At the temple, I had a problem with an ancient stone guardian, because I couldn't defeat him with normal weapons. Ash'Thar told me about the existence of a certain weapon with which the ancients pacified these monsters. Maybe it will help me too. You should look for him in one of the temples in the Valley. " );
	TellAboutAdanosWeapon = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_DRAGON_GOLD_AVGO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = DIA_DRAGON_GOLD_AVGO_condition;
	information = DIA_DRAGON_GOLD_AVGO_info;
	permanent = FALSE;
	description = " Here I have another stone tablet. " ;
};

func int DIA_DRAGON_GOLD_AVGO_condition()
{
	if((KnowAboutAdVal == TRUE) && (Npc_HasItems(hero,ItWr_StoneAdanosPortal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DRAGON_GOLD_AVGO_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_DRAGON_GOLD_AVGO_01_00 " );	// Here I have another stone tablet. Can you translate it?
	B_GiveInvItems(other,self,ItWr_StoneAdanosPortal,1);
	Npc_RemoveInvItems(self,ItWr_StoneAdanosPortal,1);
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_04 " );	// Very interesting...
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_06 " );	// Here's how to open a portal leading to the great Plateau of the Ancients.
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_08 " );	// This land is the sacred patrimony of Adanos, where he first touched this world.
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_09 " );	// A beautiful, evergreen place where only peace and prosperity reigned for centuries.
	AI_Output(other,self, " DIA_DRAGON_GOLD_AVGO_01_10 " );	// So, apparently, the artifact is located there. And how to get there?
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_11 " );	// To get started, you'll need a Guardian's Runic Heart. It should be used directly in front of the magical portal.
	AI_Output(other,self, " DIA_DRAGON_GOLD_AVGO_01_13 " );	// Great! I already have one of these.
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_14 " );	// Where did you get it from? Have you finally managed to summon the ancient Guardians to this world?
	AI_Output(other,self, " DIA_DRAGON_GOLD_AVGO_01_15 " );	// Yes, one. To get his heart, I had to kill him first.
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_16 " );	// It still amazes me how a small person like you can stand up to such ancient creatures.
	AI_Output(other,self, " DIA_DRAGON_GOLD_AVGO_01_17 " );	// Sometimes me too.
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_18 " );	// It seems that the gods themselves favor you, since after so many trials you are still alive. I just don't have any other explanation.
	AI_Output(other,self, " DIA_DRAGON_GOLD_AVGO_01_20 " );	// This is all, of course, good, but we digress from the main thing. Where is the portal located?
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_21 " );	// It says here that it is located in the north of this valley.
	AI_Output(other,self, " DIA_DRAGON_GOLD_AVGO_01_22 " );	// Can you be more specific?
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_23 " );	// That's all it says... So you'll have to find this place yourself.
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_25 " );	// And one more thing: I want to warn you... The Plateau of the Ancients can be an extremely dangerous place for a mere mortal like you.
	AI_Output(self,other, " DIA_DRAGON_GOLD_AVGO_01_27 " );	// So prepare well before you go there...
	B_LogEntry(TOPIC_AdanosCrone, " Ash'Thar translated the temple guardian's scroll. It mentions a magical portal in the north of the valley that leads to the great Plateau of the Ancients - the place where Adanos himself first stepped into this world! The mysterious artifact we are looking for must be located there "To activate the portal, I need to use the Runeheart of the Guardian. Ash'Thar warned me that the Plateau could be a very dangerous place. I need to carefully prepare for this trip. " );
	InsFireShadowGuards = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_DRAGON_GOLD_WHATDO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_whatdo_condition;
	information = dia_dragon_gold_whatdo_info;
	permanent = FALSE;
	description = " What is the purpose of your existence, dragon? " ;
};

func int dia_dragon_gold_whatdo_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_whatdo_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_WhatDo_01_00 " );	// And what is the meaning of your existence, dragon?
	AI_Output(self,other, " DIA_Dragon_Gold_WhatDo_01_01 " );	// You're asking me this question, human, but can you claim to be aware of what brought you into this world?
	AI_Output(other,self, " DIA_Dragon_Gold_WhatDo_01_03 " );	// Of course. My goal is to eradicate the evil that your kindred sow on this earth.
	AI_Output(self,other, " DIA_Dragon_Gold_WhatDo_01_05 " );	// I see where you're going, man. If you so desire, you can fight me.
	AI_Output(self,other, " DIA_Dragon_Gold_WhatDo_01_06 " );	// But it won't make the world a better place than you think. For only in life can new life be born, but not in death.
	AI_Output(other,self, " DIA_Dragon_Gold_WhatDo_01_09 " );	// Hmmm... You really don't look like a servant of the Darkness.
	AI_Output(self,other, " DIA_Dragon_Gold_WhatDo_01_10 " );	// (offended) How many dragons have you seen in your life, man, to talk like that?
	AI_Output(self,other, " DIA_Dragon_Gold_WhatDo_01_11 " );	// Yes... How much this world has changed.
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Ash'Thar, the golden dragon that lives in this valley, was also surprised by my appearance. Incredibly, his intentions towards me were not hostile, and one might even say - on the contrary. Perhaps it is worth talking to Saturas about this . " );
};


instance DIA_DRAGON_GOLD_ABOUTCLAW (C_Info);
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_aboutclaw_condition;
	information = dia_dragon_gold_aboutclaw_info;
	permanent = FALSE;
	description = " What evil? What do you mean? " ;
};

func int dia_dragon_gold_aboutclaw_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_whocreate))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_aboutclaw_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_AboutClaw_01_00 " );	// What evil? What do you mean?
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_01 " );	// Having found the Claw of Beliar, the Sun Guardians hoped that this weapon would help them in the battle against evil.
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_03 " );	// They didn't even know that this particular sword is the true evil!
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_06 " );	// And I suggested to them that the only right decision is to destroy this sword before the evil breaks free.
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_07 " );	// But, as I see it, the lust for power has blinded the Guardians so much that they forgot about it.
	AI_Output(other,self, " DIA_Dragon_Gold_AboutClaw_01_10 " );	// What's so bad about this sword?
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_11 " );	// Beliar's Claw is a powerful artifact in itself, but its true purpose lies elsewhere.
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_13 " );	// All of the Talon's magical power is concentrated at the base of its blade - a dark crystal that holds the soul of the powerful archdemon S'enyak!
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_15 " );	// The Dark God forged this weapon especially for him, so that he would bring even more evil into our world...
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_17 " );	// Ultimately, with great effort, the archdemon was defeated. And his soul was imprisoned in his own weapon... how ironic...
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_20 " );	// After that, the blade was hidden for many millennia from prying eyes. Until the Guardians of the Sun accidentally stumbled upon it.
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_22 " );	// This was the beginning of their end!
	AI_Output(other,self, " DIA_Dragon_Gold_AboutClaw_01_23 " );	// Why wasn't the daemon destroyed?
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_24 " );	// This is unknown to me. I can say one thing: if he breaks free, the world will tremble under his tread ...
	AI_Output(other,self, " DIA_Dragon_Gold_AboutClaw_01_27 " );	// Are you sure he broke free?
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_28 " );	// You can't be sure of anything - unfortunately, only Talon himself could answer this question.
	AI_Output(other,self, " DIA_Dragon_Gold_AboutClaw_01_34 " );	// What if I bring you the Claw?
	AI_Output(self,other, " DIA_Dragon_Gold_AboutClaw_01_37 " );	// Oh, Adanos. Bring it quickly, perhaps they did not have time to commit the irreparable.
	TASKFINDCLAW = TRUE;
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Ash'Thar told me about the threat posed by the Talon. Once the weapon of one of the archdemons S'anyak, this blade holds the immortal soul of its master. Ash'Thar was very concerned that S' the cognac was able to free itself. To accurately answer this question, the golden dragon asked me to bring him the Claw. Perhaps then it will become clear how big a problem we have. " );
};

instance DIA_DRAGON_GOLD_WHATMAN(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_whatman_condition;
	information = dia_dragon_gold_whatman_info;
	permanent = FALSE;
	description = " Look at Talon. " ;
};

func int dia_dragon_gold_whatman_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_dragon_gold_aboutclaw ) && C_ScHasBeliarsWeapon ())
	{
		return TRUE;
	};
};

func void dia_dragon_gold_whatman_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Dragon_Gold_WhatMan_01_00 " );	// Look at Talon.
	AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_01 " );	// Good. Let me take a look at it.

	if((Npc_HasItems(other,itru_beliarsrune01) == TRUE) || (Npc_HasItems(other,itru_beliarsrune02) == TRUE) || (Npc_HasItems(other,itru_beliarsrune03) == TRUE) || (Npc_HasItems(other,itru_beliarsrune04) == TRUE) || (Npc_HasItems(other,itru_beliarsrune05) == TRUE) || (Npc_HasItems(other,itru_beliarsrune06) == TRUE))
	{
		AI_Output(other,self, " DIA_Dragon_Gold_WhatMan_01_02 " );	// Hmm... Only I transferred the Talon's power to the rune.
		AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_03 " );	// It doesn't matter, the crystal must emit energy in both the rune and the sword.
		AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_09 " );	// (looks closely) I knew it!
		AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_10 " );	// The glyph on the rune is dim, and I can't sense the energy in it.
		AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_11 " );	// And that can only mean one thing - S'enyak is free!
		AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_13 " );	// This is VERY bad - you have no idea how bad!
		AI_Output(other,self, " DIA_Dragon_Gold_WhatMan_01_16 " );	// And what do we do now?
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Worst fears are confirmed. The Talon rune symbol is dull and lifeless - which means that the ancient archdemon S'anyak has broken free. My heart feels that this story with the archdemon will not bypass me too... " );
	}
	else
	{
		if(C_ScHasEquippedBeliarsWeapon() == TRUE)
		{
			AI_ReadyMeleeWeapon(other);
		};
		AI_Output(other,self, " DIA_Dragon_Gold_WhatMan_01_06 " );	// Here, look.
		AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_09 " );	// (looks closely) I knew it!
		AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_21 " );	// The Dark Soul Crystal is dim and I can't sense magical energy in it...
		AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_11 " );	// And that can only mean one thing - S'enyak is free!
		if(C_ScHasEquippedBeliarsWeapon() == TRUE)
		{
			AI_RemoveWeapon(other);
		};
		AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_13 " );	// This is VERY bad - you have no idea how bad!
		AI_Output(other,self, " DIA_Dragon_Gold_WhatMan_01_16 " );	// And what do we do now?
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Worst fears are confirmed. The Talon rune symbol is dull and lifeless - which means that the ancient archdemon S'anyak has broken free. My heart feels that this story with the archdemon will not bypass me too... " );
	};
	AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_28 " );	// It is necessary to destroy the demon while there is still time and while it is weak.
	AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_32 " );	// The curse of Adanos is only a paternal rebuke compared to what this demon will do!
	AI_Output(other,self, " DIA_Dragon_Gold_WhatMan_01_33 " );	// Wow, wow!
	AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_35 " );	// We don't have much time, and even less chance.
	AI_Output(self,other, " DIA_Dragon_Gold_WhatMan_01_36 " );	// S'enyak, of course, did not have time to recover his strength after being in captivity, but he is still very dangerous.
};


instance DIA_DRAGON_GOLD_DESTROYWAY(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_destroyway_condition;
	information = dia_dragon_gold_destroyway_info;
	permanent = FALSE;
	description = " How can I destroy S'Egnac? " ;
};

func int dia_dragon_gold_destroyway_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_whatman))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_destroyway_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWay_01_00 " );	// How can S'enyak be destroyed?
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_01 " );	// Since he can't be defeated with normal weapons, there are only two ways to do it.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_04 " );	// Method one - with the help of the Elements, the true Creators of this world.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_05");	//Стихий?
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_07 " );	// Yes, namely with the help of an ancient powerful spell that can take the life of any creature! It is called the Cross of the Elements.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_10 " );	// It doesn't matter if it's a demon, a human, or a meat bug. This spell will kill anyone cast on it.
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWay_01_12 " );	// And where can I find this Elemental Cross?
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_13 " );	// Wait, I'll tell you everything in order.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_17 " );	// The meaning of the spell we need is to unite all the elements of this world together.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_18 " );	// Fire, Water, Rock and Darkness - only together these elements can form the Cross of Elements.
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWay_01_22 " );	// And I already thought you would send me to collect some kind of abomination in all sorts of crypts, caves and dungeons.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_23 " );	// Only the absolute essences of these elements can give this spell its proper effect...
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWay_01_24 " );	// What are these entities?
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_25 " );	// Each element has its own, and contains the primary source of its power. This entity is called a sphere.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_29 " );	// Therefore, you need to find all four spheres of each element as soon as possible...
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_30 " );	// ...and only after that it will be possible to make an Elemental Cross out of them.
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWay_01_31 " );	// Where can I find these orbs?
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_32 " );	// Unfortunately, I don't know their location, but I'm afraid you'll have to climb 'all sorts of crypts, caves and dungeons'.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWay_01_33 " );	// And when you find them, come back to me. I will wait for you here.
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWay_01_34 " );	// All right, Ash'Thar! I'm leaving.
	TASKFINDSPHERE = TRUE;
	SENYAKSEEKSWORD = TRUE ;
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Looks like I'm going to have to contend with something that the old wise guys couldn't do before me. This time it's the archdemon S'anyak. Ash'Thar gave me one way to destroy him. For To do this, I need to get one powerful spell of antiquity - the Cross of the Elements. To do this, it is necessary to find all the important components for creating this spell. Namely, some sources of the essence of the elements - the spheres of fire, water, rock and darkness. But where to look for them? " ) ;
};

instance DIA_DRAGON_GOLD_DESTROYWAYTWO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_destroywaytwo_condition;
	information = dia_dragon_gold_destroywaytwo_info;
	permanent = FALSE;
	description = " You said you knew two ways. " ;
};

func int dia_dragon_gold_destroywaytwo_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_dragon_gold_destroyway ) && ( DESTROYCLAW  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_destroywaytwo_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_00 " );	// You said you knew two ways to destroy S'enyak.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_01 " );	// Yes... There is one more.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_03 " );	// The second way is to capture his soul in the same way as it was once done.
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_06 " );	// Interesting. And how can one capture the soul of S'enyak?
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_07 " );	// (regretfully) You're repeating the mistakes of the Ancients...
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_09 " );	// In order to capture a demon, you will need one very ancient spell.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_11 " );	// It's called Mora Ulartu. In the language of the Ancients, it means 'Dungeon of Souls'.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_12 " );	// You'll have to cast it on S'enyak, and then strip him of his physical form.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_13 " );	// Simply put, to kill... And the spell, in turn, will not let the soul escape after death...
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_16 " );	// You'll also need a dark crystal to place the captured soul of S'enyak into.
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_17 " );	// And the crystal in the Talon - can it still be used?
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_18 " );	// Hmmm... I think so. But as you can see, this is not a very reliable place.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_19 " );	// Although, there are certainly advantages: by placing his soul back into the Claw, you will return him to his former power.
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_21 " );	// However, one awkward move, one mistake, and S'enyak will be free again.
	AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_1W " );	// Okay, I got it. But tell me, where can I find that spell you spoke of?
	AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_2W " );	// I don't know anything about this. Mora Ulartu is a gift from the dark god. Perhaps someone who owns the magic of Darkness and knows something about it...
	if (Chapter >=  5 )
	{
		if ( ! Npc_IsDead(none_102_kreol))
		{
			if(KREOL_MYTEACHER == TRUE)
			{
				AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_22 " );	// Hmmm... I think I know one of the people who owns it.
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_23");	//...(рычит)
				AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_24 " );	// And after I find this spell, where should I look for S'anyak?
				AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_25 " );	// Find the Dungeon of Souls first, and then we'll talk about your meeting with him.
				AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_27 " );	// Hurry, every minute counts!
				TASKFINDDARKSOUL = TRUE;
				B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Ash'Thar told me another way to destroy S'anyak. Not exactly to destroy, but only to capture his soul in the same way as the Ancients once did. I need to get one very rare spell - Pestilence Ulartu. The dragon suggested that someone who is connected with dark magic could help me with this. I should talk to Creole. " );
			}
			else
			{
				AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_28 " );	// Hmmm... This might be a problem...
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_23");	//...(рычит)
				AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_24 " );	// And after I find this spell, where should I look for S'anyak?
				AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_25 " );	// Find the Dungeon of Souls first, and then we'll talk about your meeting with him.
				AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_27 " );	// Hurry, every minute counts!
				TASKFINDDARKSOUL = TRUE;
				B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Ash'Thar told me another way to destroy S'anyak. Not exactly to destroy, but only to capture his soul in the same way as the Ancients once did. I need to get one very rare spell - Pestilence Ulartu. The dragon suggested that someone who is connected with dark magic could help me with this. But where can I find one? " );
			};
		}
		else
		{
			AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_34 " );	// Hmmm... I'm afraid I don't know anyone who can help me.
			AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_35 " );	// Then don't waste your time and go looking for orbs.
			B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Ash'Thar told me another way to destroy S'enyak. Or rather, not completely destroy, but only captivate his soul in the same way that the Ancients once did. I need to get one very rare spell - Mora Ulartu "The dragon suggested that someone who is connected with dark magic could help me with this. But where can I find such a thing? Looks like I'll have to put this idea out of my head... " );
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_37 " );	// Hmmm... I think I know one of the people who owns it.
		AI_Output(other,self, " DIA_Dragon_Gold_DestroyWayTwo_01_24 " );	// And after I find this spell, where should I look for S'enyak?
		AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_25 " );	// Find the Dungeon of Souls first, and then we'll talk about your meeting with him...
		AI_Output(self,other, " DIA_Dragon_Gold_DestroyWayTwo_01_27 " );	// Hurry, every minute counts!
		TASKFINDDARKSOUL = TRUE;
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Ash'Thar told me another way to destroy S'enyak. Or rather, not completely destroy, but only captivate his soul in the same way that the Ancients once did. To do this, I need to get one very rare spell - Mora Ulartu, which means "Dungeon of Souls" in the language of the ancients. The dragon suggested that someone who is connected with dark magic could help me with this. I should talk to Xardas. " );
	};
};


instance DIA_DRAGON_GOLD_CLAWCARE(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_clawcare_condition;
	information = dia_dragon_gold_clawcare_info;
	permanent = FALSE;
	description = " What about Claw? " ;
};

func int dia_dragon_gold_clawcare_condition()
{
	if(TASKFINDSPHERE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_gold_clawcare_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_ClawCare_01_00 " );	// What about Talon?
	AI_Output(self,other, " DIA_Dragon_Gold_ClawCare_01_01 " );	// You can keep it for yourself. Although Beliar's Claw is an artifact of Darkness, it can also serve good.
	AI_Output(self,other, " DIA_Dragon_Gold_ClawCare_01_02 " );	// But don't forget: the sword was forged for S'enyak himself, and if the demon gets his sword back, he'll be practically invincible!
	AI_Output(self,other, " DIA_Dragon_Gold_ClawCare_01_08 " );	// If you are not sure that you can resist this evil, then the best solution in this situation...
	AI_Output(self,other, " DIA_Dragon_Gold_ClawCare_01_09 " );	// ...give this sword to me. I will destroy this source of evil once and for all!
	AI_Output(other,self, " DIA_Dragon_Gold_ClawCare_01_11 " );	// Good. I will consider your offer.
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , "The Ash'Thar can destroy the Talon if I decide the burden is too much for me. " );
};


instance DIA_DRAGON_GOLD_CLAWDESTROY(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_clawdestroy_condition;
	information = dia_dragon_gold_clawdestroy_info;
	permanent = TRUE;
	description = " Destroy the Talon! " ;
};

func int dia_dragon_gold_clawdestroy_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_dragon_gold_clawcare ) && ( DESTROYCLAW  ==  FALSE ) && C_ScHasBeliarsWeapon ())
	{
		return TRUE;
	};
};

func void dia_dragon_gold_clawdestroy_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_ClawDestroy_01_00 " );	// Destroy the Claw!
	AI_Output(other,self, " DIA_Dragon_Gold_ClawDestroy_01_03 " );	// I think this would be the best solution.
	AI_Output(self,other, " DIA_Dragon_Gold_ClawDestroy_01_04 " );	// Are you sure about this?..
	Info_AddChoice(dia_dragon_gold_clawdestroy,"Нет, постой!",dia_dragon_gold_clawdestroy_no);
	Info_AddChoice(dia_dragon_gold_clawdestroy,"Да!",dia_dragon_gold_clawdestroy_yes);
};

func void dia_dragon_gold_clawdestroy_yes()
{
	B_GivePlayerXP(2500);
	B_ClearBeliarsWeapon();
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	AI_PlayAni(self,"T_SURPRISE_CCW");
	AI_PlayAni(self,"T_SURPRISE_CW");
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_23");	//...(рычит)
	AI_Output(self,other, " DIA_Dragon_Gold_ClawDestroy_Yes_01_01 " );	// That's it... Claw is gone!
	AI_Output(self,other, " DIA_Dragon_Gold_ClawDestroy_Yes_01_02 " );	// His evil will never disturb this world again.
	DESTROYCLAW = TRUE;
	TOPIC_END_Klaue = TRUE ;
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Success);
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I gave the sword to Ash'Thar and he destroyed it. " );
	Info_ClearChoices(dia_dragon_gold_clawdestroy);
};

func void dia_dragon_gold_clawdestroy_no()
{
	AI_Output(other,self, " DIA_Dragon_Gold_ClawDestroy_No_01_00 " );	// No, wait!
	AI_Output(self,other, " DIA_Dragon_Gold_ClawDestroy_No_01_01 " );	// As you say.
	Info_ClearChoices(dia_dragon_gold_clawdestroy);
};

instance DIA_DRAGON_GOLD_HAVEONEORALL(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_haveoneorall_condition;
	information = dia_dragon_gold_haveoneorall_info;
	permanent = TRUE;
	description = " About our case... " ;
};

func int dia_dragon_gold_haveoneorall_condition()
{
	if(((TASKFINDDARKSOUL == TRUE) && (DESTROYCLAW == FALSE)) || (TASKFINDSPHERE == TRUE))
	{
		if(MISSSOULFOREVER == FALSE)
		{
			return TRUE;
		};
	};
};

func void dia_dragon_gold_haveoneorall_info()
{
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_01_00 " );	// About our case...
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_01_01 " );	// Do you have anything to say, human? Did you bring the Orbs?
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
	Info_AddChoice(dia_dragon_gold_haveoneorall,"Пока нет.",dia_dragon_gold_haveoneorall_none);

	if (( TASKFINDDARKSOUL  ==  TRUE ) && (Npc_HasItems(other,self_moral) >=  1 ) && ( DESTROYCLAW  ==  FALSE ) && ( TELLGDMU  ==  FALSE )) ;
	{
		Info_AddChoice(dia_dragon_gold_haveoneorall, " I got Mora Ulartu! " ,dia_dragon_gold_haveoneorall_mora);
	};
	if (( TASKFINDSPHERE  ==  TRUE ) && (Npc_HasItems(other,itmi_fireshpere) >=  1 ) && (Npc_HasItems(other,itmi_watershpere) >=  1 ) && (Npc_HasItems(other,itmi_stoneshpere) >= 1 ) && ( Npc_HasItems(other,itmi_stoneshpere) >=  1 ) itmi_darkshpere) >= 1 )) 
	{
		Info_AddChoice(dia_dragon_gold_haveoneorall, " I got all the Orbs! " ,dia_dragon_gold_haveoneorall_sphere);
	};
	if((MIS_STONNOSTEST == LOG_SUCCESS) && (MISSSHEPREFOREVER == TRUE) && (MISSSOULFOREVER == FALSE))
	{
		Info_AddChoice(dia_dragon_gold_haveoneorall, " I gave them to the Guardians. " ,dia_dragon_gold_haveoneorall_spheregone);
	};
};

func void dia_dragon_gold_haveoneorall_none()
{
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_None_01_00");	//Пока нет.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_None_01_01 " );	// Then what are you waiting for?
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_None_01_02 " );	// Go and get what I told you about! And hurry - we don't have much time...
	AI_StopProcessInfos(self);
};

func void dia_dragon_gold_haveoneorall_spheregone()
{
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_00 " );	// No. I gave them to the Guardians.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_01 " );	// (growls) Why did you do that?
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_02 " );	// Without them, you won't have the slightest chance of defeating S'enyak!
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_03 " );	// I had no other choice.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_06 " );	// Then you'll have to fight the archdemon without any help, and you'll most likely lose...

	if (( TASKFINDDARKSOUL  ==  TRUE ) && (Npc_HasItems(other,self_moral) >=  1 ) && ( DESTROYCLAW  ==  FALSE ) && ( TELLGDMU  ==  FALSE )) ;
	{
		B_GivePlayerXP(200);
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_08 " );	// But I still have Mora Ulartu! How about this?
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_09 " );	// (growls) So you managed to get that artifact.
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_14 " );	// Yes, but it would be nice to understand how this thing works.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15 " );	// Simple - before you start the battle with S'enyak, use this spell on him.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16 " );	// And after the archdemon is defeated, take from his flesh a stone with a sharpened soul.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17 " );	// Then take this stone and combine it with the Claw of Beliar on the altar of the Dark God - the crystal at the base of the blade will absorb the soul of S'enyak, and the sword will regain its former power!
		TELLGDMU = TRUE;
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " If I intend to use Mora Ulartu to capture S'enyak's soul, I should fuse the archdemon's soul gem and Beliar's Talon to have the latter consume the gem's contents. This will restore the weapon to its former power. " );
	}
	else if((TASKFINDDARKSOUL == TRUE) && (TELLGDMU == FALSE))
	{
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_22 " );	// And if I manage to get Mora Ulartu?
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_25 " );	// How can I use it?
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15 " );	// Simple - before you start the battle with S'enyak, use this spell on him.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16 " );	// And after the archdemon is defeated, take from his flesh a stone with a sharpened soul.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17 " );	// Then take this stone and combine it with the Claw of Beliar on the altar of the Dark God - the crystal at the base of the blade will absorb the soul of S'enyak, and the sword will regain its former power!
		TELLGDMU = TRUE;
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " If I intend to use Mora Ulartu to capture S'enyak's soul, I should fuse the archdemon's soul gem and 'Claw of Beliar' to consume the stone's contents. This will restore the weapon to its former power. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33 " );	// Well, we'll see about that later.
	};

	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_34 " );	// Now will you tell me how to get to S'enyak?
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_36 " );	// His home is in the very center of Lang, in the demon world. No mortal will ever get there just like that.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_37 " );	// So the only way to get S'anyak to fight you is to summon him to this world!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_39 " );	// Just take this thing.
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDGORN,1);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_40");	//Что это?
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_41 " );	// The golden horn of Ahyanti is a magical artifact, the sound of which is able to call any creature to its owner. But only once!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_42 " );	// S'enyak will not be able to resist the power of this artifact and will come to your call.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_43 " );	// The meeting place with S'enyak is up to you. Try to do it wisely.
	KNOWS_CRESTMAKE = TRUE;
	AshtarLastWarn = TRUE ;
	MISSSOULFOREVER = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_dragon_gold_haveoneorall_mora()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_00 " );	// I got Mora Ulartu!	
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_09 " );	// Arghh...(growls) So you somehow managed to get that artifact.
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_14 " );	// Yes, but it would be nice to understand how this thing works.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15 " );	// Simple - before you start the battle with S'enyak, use this spell on him.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16 " );	// And after the archdemon is defeated, take from his flesh a stone with a sharpened soul.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17 " );	// Then take this stone and combine it with the Claw of Beliar on the altar of the Dark God - the crystal at the base of the blade will absorb the soul of S'enyak, and the sword will regain its former power!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_13 " );	// But I want to warn you right away: after you use Mora Ulartu's magic on S'Enyak...
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_14 " );	// ...You won't be able to use the Elemental Cross!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_16 " );	// The power of Mora Ulartu will not be able to withstand the terrifying power of this spell, and the soulstone will be destroyed.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_17 " );	// So here you have to fight S'enyak in a fair fight. And I'll tell you straight: you have little chance.
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33 " );	// Well, we'll see about that later.
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_1W " );	// Now will you tell me how to get to S'enyak?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_20");	//Нет...
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_21");	//Но почему?
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_23 " );	// You should carry the Cross of Elements as a backup.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_25 " );	// If anything goes wrong, this spell is our only chance to destroy S'anyak!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_26 " );	// So bring me those spheres. Then we'll talk about your encounter with the archdemon.
	TELLGDMU = TRUE;
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " If I intend to use Mora Ulartu to capture S'enyak's soul, I shouldn't use Elemental Cross afterward, as this spell will destroy the demon along with its soul. After S'enyak is done, I need to connect a stone with the soul of an archdemon and 'Claw of Beliar', so that the latter absorbs the contents of the stone. This will return the weapon to its former power. But in any case, I need to have the Cross of Elements with me. " );
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
};

func void dia_dragon_gold_haveoneorall_sphere()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_00 " );	// I got all the spheres.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_01 " );	// Very good.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_02 " );	// You now have almost everything you need to make an Elemental Cross and destroy S'anyak!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_04 " );	// Yes, the last detail is missing...
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_06 " );	// MY HEART!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_08 " );	// Only with it will you be able to combine elemental spheres and create an Elemental Cross from them!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_09 " );	// Once you asked me, man, what is the meaning of my existence...
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_11 " );	// That's what it's all about - giving a mortal like you a chance to defeat an unstoppable evil like S'anyak!
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_14 " );	// Will you sacrifice yourself?
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_16 " );	// Don't think about it. You have only one thing to think about right now - your upcoming battle with S'anyak!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_17 " );	// Now step back...
	AshtarLastWarn = TRUE ;
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " When I showed Ash'Thar the Elemental Orbs, he told me how to create the Cross of Elements. Unfortunately, he had to pay me for helping me with his life, for this spell requires magical essence from his heart - from the heart of gold In addition, Ash'Thar told me some other details that will help me when I meet S'anyak. " );
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
	Info_AddChoice(dia_dragon_gold_haveoneorall,"(отойти)",dia_dragon_gold_haveoneorall_giveheart);
};

func void dia_dragon_gold_haveoneorall_giveheart()
{
	AI_Dodge(other);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	KNOWS_CRESTMAKE = TRUE;
	AI_Print( " Learned how to make a rune - 'Cross of Elements' " );
	AI_PlayAni(self,"T_SURPRISE_CCW");
	AI_PlayAni(self,"T_SURPRISE_CW");
	B_GiveInvItems(self,other,itat_golddragonheart,1);
	AI_Wait(self,5);
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_00 " );	// Here, take it...
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_03 " );	// To make an Elemental Cross, sprinkle all the spheres with magical essence taken from my heart, and then simply combine them together. Use a runic table for this.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_04 " );	// After you've done this, it's time to face the archdemon.
	AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_05 " );	// How to get to S'Egnac?
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_36 " );	// His home is in the very center of Lang, in the demon world. No mortal will ever get there just like that.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_37 " );	// So the only way to get S'anyak to fight you is to summon him to this world!
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_39 " );	// Just take this thing.
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDGORN,1);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_40");	//Что это?
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_41 " );	// The golden horn of Ahyanti is a magical artifact, the sound of which is able to call any creature to its owner. But only once.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_42 " );	// S'enyak will not be able to resist the power of this artifact and will come to your call.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_43 " );	// As you probably already understood, you will choose the place of meeting with S'enyak yourself. So try to use it wisely.

	if (( TASKFINDDARKSOUL  ==  TRUE ) && (Npc_HasItems(other,self_moral) >=  1 ) && ( DESTROYCLAW  ==  FALSE ) && ( TELLGDMU  ==  FALSE )) ;
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_18 " );	// I also have Mora Ulartu!
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_09 " );	// Arghh...(growls) So you somehow managed to get that artifact.
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_14 " );	// Yes, but it would be nice to understand how this thing works.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15 " );	// Simple - before you start the battle with S'enyak, use this spell on him.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16 " );	// And after the archdemon is defeated, take from his flesh a stone with a sharpened soul.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17 " );	// Then take this stone and combine it with the Claw of Beliar on the altar of the Dark God - the crystal at the base of the blade will absorb the soul of S'enyak, and the sword will regain its former power!
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_13 " );	// But I want to warn you right away: after you use Mora Ulartu's magic on S'Enyak...
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_14 " );	// ...You won't be able to use the Elemental Cross!
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_15");	//Но почему?
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_16 " );	// The power of Mora Ulartu will not be able to withstand the terrifying power of this spell, and the soul stone will be destroyed!
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Mora_01_17 " );	// And then you'll have to fight S'enyak in a fair fight. And I'll tell you straight: you have little chance.
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33 " );	// Well, we'll see about that later.
		TELLGDMU = TRUE;
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " If I intend to use Mora Ulartu to capture S'enyak's soul, I shouldn't use Elemental Cross afterward, as this spell will destroy the demon along with its soul. After S'enyak is done, I need to connect a stone with the soul of an archdemon and 'Claw of Beliar' so that the latter absorbs the contents of the stone. This will return the weapon to its former power. " );
	}
	else if((TASKFINDDARKSOUL == TRUE) && (TELLGDMU == FALSE))
	{
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_22 " );	// And if I manage to get Mora Ulartu - how can I use it?
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15 " );	// Simple - before you start the battle with S'enyak, use this spell on him.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16 " );	// And after the archdemon is defeated, take a stone with a sharpened soul from its flesh.
		AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17 " );	// Then, take this stone and combine it with Beliar's Claw on the altar of the Dark God - the crystal at the base of the blade will absorb S'anyak's soul and the sword will regain its former power!
		TELLGDMU = TRUE;
		B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " If I intend to use Mora Ulartu to capture S'enyak's soul - I shouldn't use the Elemental Cross afterward, as this spell will destroy the demon along with its soul. After S'anyak is finished - I need to connect a stone with the soul of an archdemon and 'Claw of Beliar' so that the latter absorbs the contents of the stone. This will return the weapon to its former power! " );
	}
	else
	{
		AI_Output(other,self, " DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33 " );	// Well, we'll see about that later.
	};

	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_57 " );	// Now that's all you need to know
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_58 " );	// And it seems my time is up...
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_59 " );	// I can already feel my strength leaving - I'm getting weaker...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_61");	//...(рычит от боли)
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_62 " );	// Go man, and remember everything I told you.
	AI_Output(self,other, " DIA_Dragon_Gold_HaveOneOrAll_Dead_01_00 " );	// (dying) Don't let me down...
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
	Info_AddChoice(dia_dragon_gold_haveoneorall,Dialog_Ende,dia_dragon_gold_haveoneorall_dead);
};

func void dia_dragon_gold_haveoneorall_dead()
{
	AI_StopProcessInfos(self);
	DragonGoldIsDead = TRUE;
	HeroNotMobsi = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	Wld_StopEffect("DIALOGSCOPE_FX");
};


// ---------------------Dragon Adanosa----------------------------------- ------------------

instance DIA_Dragon_AV_EXIT (C_Info)
{
	npc = Dragon_AV;
	nr = 999;
	condition = dia_Dragon_AV_exit_condition;
	info = dia_Dragon_AV_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Dragon_AV_exit_condition()
{
	return TRUE;
};

func void dia_Dragon_AV_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Dragon_AV_HELLO (C_Info)
{
	npc = Dragon_AV;
	nr = 1;
	condition = dia_Dragon_AV_hello_condition;
	info = dia_Dragon_AV_hello_info;
	important = TRUE;
};

func int dia_Dragon_AV_hello_condition()
{
	return TRUE;
};

func void dia_Dragon_AV_Hello_info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other, " DIA_Dragon_AV_Hello_01_00 " );	// You're finally here... I've been waiting for you for so long!
	AI_Output(other,self, " DIA_Dragon_AV_Hello_01_01 " );	// Were you waiting for me? And how to understand it?
	AI_Output(self,other, " DIA_Dragon_AV_Hello_01_02 " );	// You are the one whom Adanos chose as his chosen one.
	AI_Output(other,self, " DIA_Dragon_AV_Hello_01_03 " );	// Why did you decide that?
	AI_Output(self,other, " DIA_Dragon_AV_Hello_01_04 " );	// You're wearing his symbols of power, and besides, you made it to this place.
	AI_Output(self,other, " DIA_Dragon_AV_Hello_01_05 " );	// And that can only mean one thing: Adanos chose you!
	AI_Output(other,self, " DIA_Dragon_AV_Hello_01_06 " );	// Well, let's say. And now what?
	AI_Output(self,other, " DIA_Dragon_AV_Hello_01_07 " );	// Now it's time to fulfill your duty!
	AI_Output(other,self, " DIA_Dragon_AV_Hello_01_08 " );	// What other duty?
	AI_Output(self,other, " DIA_Dragon_AV_Hello_01_09 " );	// Destroy the evil that once dared to invade his sacred patrimony.
	AI_Output(self,other, " DIA_Dragon_AV_Hello_01_10 " );	// The evil I've guarded here for centuries!
};

instance DIA_Dragon_AV_Evil (C_Info)
{
	npc = Dragon_AV;
	nr = 1;
	condition = dia_Dragon_AV_Evil_condition;
	information = dia_Dragon_AV_Evil_info;
	permanent = FALSE;
	description = " What is this evil? " ;
};

func int dia_Dragon_AV_Evil_condition()
{
	return TRUE;
};

func void dia_Dragon_AV_Evil_info()
{
	AI_Output(other,self, " DIA_Dragon_AV_Evil_01_00 " );	// What is this evil?
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_01 " );	// Very ancient and dangerous... An evil that was spawned by one of the brothers of Adanos.
	AI_Output(other,self, " DIA_Dragon_AV_Evil_01_02 " );	// Do you mean Innos or Beliar?
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_03 " );	// Beliara! Only he can do this.
	AI_Output(other,self, " DIA_Dragon_AV_Evil_01_04 " );	// Good. And what does this evil look like?
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_05 " );	// For several millennia of its existence, it has taken on a variety of forms and outlines.
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_06 " );	// What it looks like now, I don't know. But I feel its presence... I feel it's still there.
	AI_Output(other,self, " DIA_Dragon_AV_Evil_01_07 " );	// There is where?
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_08 " );	// At the temple behind me.
	AI_Output(other,self, " DIA_Dragon_AV_Evil_01_09 " );	// Are you saying that I will have to go to this temple and destroy this EVIL?
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_12 " );	// That's right. Such is the will of Adanos!
	AI_Output(other,self, " DIA_Dragon_AV_Evil_01_13 " );	// Okay. And how can I defeat him?
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_14 " );	// I don't know this. I'm just a guard...
	AI_Output(other,self, " DIA_Dragon_AV_Evil_01_15 " );	// Oh, okay, I'll figure it out myself somehow. How can I get to the temple?
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_17 " );	// I'll open the temple doors as soon as you say you're ready for it.
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_18 " );	// But I want to warn you... In addition to me, the temple is also guarded by immortal guardians.
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_19 " );	// The time they spent inside, under the influence of a powerful evil, turned them into monstrous monsters.
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_20 " );	// Previously, they would not have dared to attack the chosen one of Adanos himself. But now...
	AI_Output(other,self, " DIA_Dragon_AV_Evil_01_21 " );	// Do you think they want to hurt me now?
	AI_Output(self,other, " DIA_Dragon_AV_Evil_01_22 " );	// Now they serve this evil, and will surely protect their master to the end.
};

var int HramDoorOpen;

instance DIA_Dragon_AV_OpenHram (C_Info)
{
	npc = Dragon_AV;
	nr = 1;
	condition = dia_Dragon_AV_OpenHram_condition;
	info = dia_Dragon_AV_OpenHram_info;
	permanent = TRUE;
	description = " Open the gates of the temple, guardian! " ;
};

func int dia_Dragon_AV_OpenHram_condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Dragon_AV_Evil ) && ( BlockDoorOpen ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_Dragon_AV_OpenHram_info()
{
	AI_Output(other,self, " DIA_Dragon_AV_OpenHram_01_00 " );	// Open the temple gates, guardian!
	AI_Output(self,other, " DIA_Dragon_AV_OpenHram_01_01 " );	// Are you sure you're ready for this fight?
	AI_Output(self,other, " DIA_Dragon_AV_OpenHram_01_02 " );	// If you fail, the evil will break out again, and I will no longer be able to stop it.
	Info_ClearChoices(DIA_Dragon_AV_OpenHram);
	Info_AddChoice(DIA_Dragon_AV_OpenHram, " No, wait. " ,DIA_Dragon_AV_OpenHram_No);
	Info_AddChoice(DIA_Dragon_AV_OpenHram, " Open it already! " ,DIA_Dragon_AV_OpenHram_Yes);
};

func void DIA_Dragon_AV_OpenHram_No()
{
	AI_Output(other,self, " DIA_Dragon_AV_OpenHram_No_01_00 " );	// No, wait.
	AI_Output(self,other, " DIA_Dragon_AV_OpenHram_No_01_01 " );	// Your lack of confidence scares me a little...
	AI_Output(self,other, " DIA_Dragon_AV_OpenHram_No_01_02 " );	// However, it's really better to prepare well, because the upcoming fight will be tough.
	Info_ClearChoices(DIA_Dragon_AV_OpenHram);
};

func void DIA_Dragon_AV_OpenHram_Yes()
{
	AI_Output(other,self, " DIA_Dragon_AV_OpenHram_Yes_01_00 " );	// Open already!
	AI_Output(self,other, " DIA_Dragon_AV_OpenHram_Yes_01_01 " );	// The gates of the temple are open... Good luck in battle, chosen one! And may Adanos be with you.
	AI_StopProcessInfos(self);

	Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_THUNDERSTORM_SCREENBLEND",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger( " EVT_RAVENTEMPLEDOOR_01 " );
	HramDoorOpen = TRUE;

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_8");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_16");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_15");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_10");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_11");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_4");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_5");
	};
};
