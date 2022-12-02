

instance DIA_DUGO_EXIT(C_Info)
{
	npc = vlk_6008_long;
	nr = 999;
	condition = dia_dugo_exit_condition;
	information = dia_dugo_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dugo_exit_condition()
{
	return TRUE;
};

func void dia_dugo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DUGO_HELLO (C_Info)
{
	npc = vlk_6008_long;
	nr = 1;
	condition = dia_dugo_hello_condition;
	information = dia_dugo_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dugo_hello_condition()
{
	return TRUE;
};

func void dia_dugo_hello_info()
{
	AI_Output(self,other, " DIA_Dugo_Hello_01_00 " );	// I can't believe my eyes! Where? (surprised) How did you get here?!
	AI_Output(other,self, " DIA_Dugo_Hello_01_01 " );	// I went through the portal, the one at the top of this pyramid. What surprises you so much?
	AI_Output(self,other, " DIA_Dugo_Hello_01_03 " );	// For all the time that I can remember, you are the first who was brought to these godforsaken lands...
};


instance DIA_DUGO_HELLO_TWO(C_Info)
{
	npc = vlk_6008_long;
	nr = 1;
	condition = dia_dugo_hello_two_condition;
	information = dia_dugo_hello_two_info;
	permanent = TRUE;
	important = FALSE;
	description = " Who are you and what is this place? " ;
};


func int dia_dugo_hello_two_condition()
{
	if ( DUGOMEET  ==  0 )
	{
		return TRUE;
	};
};

func void dia_dugo_hello_two_info()
{
	AI_Output(other,self, " DIA_Dugo_Hello_Two_01_00 " );	// Who are you and what is this place?
	AI_Output(self,other, " DIA_Dugo_Hello_Two_01_01 " );	// My name is Dugo. And all that you see around is called the Valley of Shadows...
	AI_Output(self,other, " DIA_Dugo_Hello_Two_01_02 " );	// And I'll tell you honestly, boy - you're in the middle of hell!
	AI_Output(self,other, " DIA_Dugo_Hello_Two_01_03 " );	// This valley is cursed! Evil spirits roam around, and even more terrible creatures.
	AI_Output(self,other, " DIA_Dugo_Hello_Two_01_04 " );	// And at night you should not wander in these places at all - otherwise you immediately risk losing your life.
	DUGOMEET = 1 ;
};


instance DIA_DUGO_HELLO_THREE(C_Info)
{
	npc = vlk_6008_long;
	nr = 1;
	condition = dia_dugo_hello_three_condition;
	information = dia_dugo_hello_three_info;
	permanent = TRUE;
	important = FALSE;
	description = " Tell me about this valley. " ;
};


func int dia_dugo_hello_three_condition()
{
	if ( DUGOMEET  ==  1 )
	{
		return TRUE;
	};
};

func void dia_dugo_hello_three_info()
{
	AI_Output(other,self, " DIA_Dugo_Hello_Three_01_15 " );	// Tell me about this valley.
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_00 " );	// What can I say...
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_01 " );	// (sighs) Once it was a beautiful valley with beautiful meadows and evergreen forests at the foot of these majestic mountains.
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_02 " );	// Unfortunately, only memories remain of this and nothing more.
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_03 " );	// Now it's a lifeless wasteland, covered in ashes and ashes. And everything around is saturated with evil and horror.
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_04 " );	// Trust me, there's nothing here but death.
	AI_Output(other,self, " DIA_Dugo_Hello_Three_01_05 " );	// What happened here?
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_06 " );	// Evil has come into this world. Terrible evil! An evil that has no name.
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_08 " );	// It was said that it was an unprecedented monster that was vomited up by the underworld itself!
	AI_Output(other,self, " DIA_Dugo_Hello_Three_01_09 " );	// Wasn't that a dragon by any chance?
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_10 " );	// I don't know who it was. Maybe a dragon, maybe not. No one knows.
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_11 " );	// I know one thing: few managed to save their lives in those terrible times...
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_12 " );	// And those who did succeed were doomed to vegetate forever in this valley of death! (sighs)
	AI_Output(self,other, " DIA_Dugo_Hello_Three_01_14 " );	// That's all I could tell you. If you want to know more, you should ask Elvais about it.
	if(MIS_URNAZULRAGE == LOG_Running)
	{
		) ; _ _ _ _ _
	};
	LENGTH = 2 ;
};


instance DIA_DUGO_HELLO_FOUR(C_Info)
{
	npc = vlk_6008_long;
	nr = 1;
	condition = dia_dugo_hello_four_condition;
	information = dia_dugo_hello_four_info;
	permanent = TRUE;
	important = FALSE;
	description = " Have you thought about getting out of here? " ;
};


func int dia_dugo_hello_four_condition()
{
	if (( DUGOMEET  ==  2 ) && ( DUGOMEETONE  ==  0 ))
	{
		return TRUE;
	};
};

func void dia_dugo_hello_four_info()
{
	AI_Output(other,self, " DIA_Dugo_Hello_Four_01_01 " );	// Have you thought about getting out of here?
	AI_Output(self,other, " DIA_Dugo_Hello_Four_01_03 " );	// There is no way out of this valley. The passage through the mountains leading from here was blocked with stones long ago after one of the earthquakes.
	AI_Output(self,other, " DIA_Dugo_Hello_Four_01_04 " );	// Only the stone pedestal in the pyramid remained, looking like a portal...
	AI_Output(self,other, " DIA_Dugo_Hello_Four_01_05 " );	// But until today, all our attempts to activate it have failed.
	AI_Output(other,self, " DIA_Dugo_Hello_Four_01_08 " );	// I wouldn't count on it too much.
	AI_Output(other,self, " DIA_Dugo_Hello_Four_01_11 " );	// The fact is that the portal leads straight to the underground city of the orcs, and, most likely, you will not be able to break through their hordes.
	AI_Output(self,other, " DIA_Dugo_Hello_Four_01_13 " );	// What?! Oh god, this was our last hope for salvation.
	AI_Output(self,other, " DIA_Dugo_Hello_Four_01_14 " );	// But how could YOU get past the orcs?!
	AI_Output(other,self, " DIA_Dugo_Hello_Four_01_15 " );	// I have an orc talisman. One of the orcs made it for me because I saved his life.
	AI_Output(other,self, " DIA_Dugo_Hello_Four_01_16 " );	// For orcs, it means a sign of strength and friendship. They respect its owner and do not dare to attack him.
	AI_Output(self,other, " DIA_Dugo_Hello_Four_01_17 " );	// (angry) Damn orcs!
	AI_Output(self,other, " DIA_Dugo_Hello_Four_01_18 " );	// Then I'm afraid we have no other choice. You'll have to punch your way with a sword.
	LONGOMETONE = 1 ;
};


instance DIA_DUGO_HELLO_FIVE(C_Info)
{
	npc = vlk_6008_long;
	nr = 1;
	condition = dia_dugo_hello_five_condition;
	information = dia_dugo_hello_five_info;
	permanent = TRUE;
	important = FALSE;
	description = " Elvais? Who is this? " ;
};


func int dia_dugo_hello_five_condition()
{
	if (( CITYMEET  ==  2 ) && ( CITIZENS  ==  0 ))
	{
		return TRUE;
	};
};

func void dia_dugo_hello_five_info()
{
	AI_Output(other,self, " DIA_Dugo_Hello_Five_01_01 " );	// Elvais? And who is it?
	AI_Output(self,other, " DIA_Dugo_Hello_Five_01_02 " );	// He's kind of like our camp elder. Besides, he's the smartest of us, and he can tell you a lot.
	AI_Output(self,other, " DIA_Dugo_Hello_Five_01_04 " );	// Behind me, the cave is our camp. You can feel safe there!
	AI_Output(self,other, " DIA_Dugo_Hello_Five_01_05 " );	// You will find Elvais in one of the farther parts of the cave. You can also chat with other guys.
	AI_Output(self,other, " DIA_Dugo_Hello_Five_01_06 " );	// Some of them are great hunters, like Bagrus. And Gunmar is the best archer I've ever known.
	AI_Output(self,other, " DIA_Dugo_Hello_Five_01_07 " );	// They have a lot to learn!
	if(MIS_URNAZULRAGE == LOG_Running)
	{
		B_LogEntry( TOPIC_URNAZULRAGE , " Dugo advised me to talk to Elvais, the elder in the camp. He can tell me more about this place. Perhaps I can find out something about the black dragon from him. I can find Elvais in the farthest of the caves on the left from the entrance to the camp. " );
	};
	LONGOMEETTWO = 1 ;
	KNOWABELV = TRUE;
	Wld_InsertNpc(vlk_6020_harum,"SV_HUMAN_20");
};


instance DIA_DUGO_HELLO_SEVEN(C_Info)
{
	npc = vlk_6008_long;
	nr = 1;
	condition = dia_dugo_hello_seven_condition;
	information = dia_dugo_hello_seven_info;
	permanent = TRUE;
	important = FALSE;
	description = " Maybe I can help you. " ;
};


func int dia_dugo_hello_seven_condition()
{
	if (( DUGOMEETONE  ==  1 ) && ( MIS_URNAZULRAGE  == LOG_Running ))
	{
		return TRUE;
	};
};

func void dia_dugo_hello_seven_info()
{
	AI_Output(other,self, " DIA_Dugo_Hello_Seven_01_01 " );	// I might still be able to help you get out of here.
	AI_Output(other,self, " DIA_Dugo_Hello_Seven_01_02 " );	// The idea of ​​breaking through hordes of orcs is crazy. You have no idea how many there are!
	AI_Output(other,self, " DIA_Dugo_Hello_Seven_01_03 " );	// They'll tear you to pieces!
	AI_Output(self,other, " DIA_Dugo_Hello_Seven_01_04 " );	// Do you have a better suggestion?
	AI_Output(other,self, " DIA_Dugo_Hello_Seven_01_07 " );	// Possibly. But first I have to settle one sort of business here.
	AI_Output(self,other, " DIA_Dugo_Hello_Seven_01_08 " );	// And what business could bring a person to these lands forgotten by Innos?
	AI_Output(other,self, " DIA_Dugo_Hello_Seven_01_10 " );	// I heard there's a very powerful dragon living in this valley. His name is Azgalor.
	AI_Output(self,other, " DIA_Dugo_Hello_Seven_01_11 " );	// I've heard this name before. Elvais mentioned him in one of his stories.
	AI_Output(self,other, " DIA_Dugo_Hello_Seven_01_12 " );	// You should talk to him. He knows more about this creature than I do.
	AI_Output(self,other, " DIA_Dugo_Hello_Seven_01_14 " );	// Tell me, why the hell did you give up on this dragon?
	AI_Output(other,self, " DIA_Dugo_Hello_Seven_01_15 " );	// I came here to kill this thing.
	AI_Output(self,other, " DIA_Dugo_Hello_Seven_01_16 " );	// Well, boy, you never cease to amaze me. It's up to you, of course, but I think you've lost your mind!
	Log_CreateTopic(TOPIC_HUMANINVALLEY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HUMANINVALLEY,LOG_Running);
	B_LogEntry( TOPIC_HUMANINVALLEY , " Maybe I could help the people who live here get out of this hellish place. The question is how? " );
	LONGOMETONE = 2 ;
};

