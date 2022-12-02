

instance DIA_RUEN_EXIT(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 999;
	condition = dia_ruen_exit_condition;
	information = dia_ruen_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_ruen_exit_condition()
{
	return TRUE;
};

func void dia_ruen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUEN_HELLO(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_condition;
	information = dia_ruen_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " How are things at camp? " ;
};


func int dia_ruen_hello_condition()
{
	if(MEETRUEN == 0)
	{
		return TRUE;
	};
};

func void dia_ruen_hello_info()
{
	AI_Output(other,self, " DIA_Ruen_Hello_01_00 " );	// How are things at the camp?
	AI_Output(self,other, " DIA_Ruen_Hello_01_01 " );	// ...Wait! You're the guy that just showed up here!
	AI_Output(self,other, " DIA_Ruen_Hello_01_02 " );	// Everyone is talking about you...
	AI_Output(self,other, " DIA_Ruen_Hello_01_03 " );	// Yes, it sucks, brother. Hunting here has become more and more dangerous lately.
	AI_Output(self,other, " DIA_Ruen_Hello_01_04 " );	// Wherever you go, you run the risk of running into some evil creatures.
	AI_Output(self,other, " DIA_Ruen_Hello_01_05 " );	// And at night it gets creepy to the point of shivering!
	AI_Output(self,other, " DIA_Ruen_Hello_01_06 " );	// This cave is the only place where you can feel more or less safe.
	AI_Output(self,other, " DIA_Ruen_Hello_01_07 " );	// In general, life here is not sugar, but sheer hassle!
	AI_Output(other,self, " DIA_Ruen_Hello_01_08 " );	// And who are you hunting?
	AI_Output(self,other, " DIA_Ruen_Hello_01_09 " );	// Mainly wargs. I'll tell you - damn dangerous creatures!
	AI_Output(self,other, " DIA_Ruen_Hello_01_10 " );	// But you don't really have to choose. You won't find better than this here.
	AI_Output(other,self, " DIA_Ruen_Hello_01_11 " );	// Are you a hunter too?
	AI_Output(self,other, " DIA_Ruen_Hello_01_12 " );	// We're all hunters here. Yes, in fact, there is nothing more to do here, except for hunting.
	MEASUREMENTS = 1 ;
};


instance DIA_RUEN_HELLO_TWO(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_two_condition;
	information = dia_ruen_hello_two_info;
	permanent = TRUE;
	important = FALSE;
	description = " Can you teach me how to hunt? " ;
};


func int dia_ruen_hello_two_condition()
{
	if(MEETRUEN == 1)
	{
		return TRUE;
	};
};

func void dia_ruen_hello_two_info()
{
	AI_Output(other,self, " DIA_Ruen_Hello_Two_01_01 " );	// Can you teach me how to hunt?
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_02 " );	// I don't think I can tell you much about this.
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_03 " );	// If you really want to learn something worthwhile, you'd better talk to Bargus.
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_04 " );	// He's the best! Talk to him. He's in the cave to my left.
	AI_Output(other,self, " DIA_Ruen_Hello_Two_01_05 " );	// And who else can teach me something here?
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_06 " );	// Well, like I said, Bagrus can teach you the art of hunting and butchering animals.
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_07 " );	// Gunmar is a shooter, what else to look for! If you want to learn how to shoot accurately from a bow - he is exactly the person to whom you should turn.
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_08 " );	// Gillimore will be able to teach you various subtleties in the preparation of medicinal potions. He's kind of like an alchemist.
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_09 " );	// Emnol - this guy is just a mountain of muscles! If you want to become stronger, contact him. He will show you a couple of tricks that will increase your strength.
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_10 " );	// If you want to learn how to better use melee weapons - it doesn't matter - one-handed or two-handed, Kardor can show you how to do it. In this he has no equal among us!
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_11 " );	// Nofeld will show you how to increase your dexterity.
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_12 " );	// Hasan can sell you some junk from the warehouse.
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_13 " );	// As for the rest of the guys, it's unlikely they'll be able to teach you anything.
	AI_Output(other,self, " DIA_Ruen_Hello_Two_01_14 " );	// And you yourself?
	AI_Output(self,other, " DIA_Ruen_Hello_Two_01_15 " );	// Me? Hmmm... I'm afraid not... (laughs)
	AI_Output(other,self, " DIA_Ruen_Hello_Two_01_16 " );	// Okay, thanks for that.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_17");	//Да не за что.
	Log_CreateTopic(TOPIC_TEACHERSINVALLEY,LOG_NOTE);
	B_LogEntry( TOPIC_TEACHERSINVALLEY , " Bagrus is the best hunter in the camp. He can show me how to butcher dead animals " );
	B_LogEntry( TOPIC_TEACHERSINVALLEY , " Gunmar specializes in archery. Ruen said he's the best archer in the area. " );
	B_LogEntry( TOPIC_TEACHERSINVALLEY , " Gillimore is an herbalist and can teach me how to make various potions. " );
	B_LogEntry( TOPIC_TEACHERSINVALLEY , " Emnol can increase my strength. " );
	B_LogEntry( TOPIC_TEACHERSINVALLEY , " Kardor can show me a couple of melee skills. " );
	B_LogEntry( TOPIC_TEACHERSINVALLEY , " Nofeld will help me increase my dexterity. " );
	B_LogEntry( TOPIC_TEACHERSINVALLEY , " Hasan sells junk. You can find it in the warehouse. " );
	BARGUSTEACHER = TRUE;
	GUNMARTEACHER = TRUE;
	GILLIMORTEACHER = TRUE;
	EMNOLTEACHER = TRUE;
	KARDORTEACHER = TRUE;
	NOFELDTEACHER = TRUE;
	HASANTEACHER = TRUE;
	METERS = 2 ;
};


instance DIA_RUEN_HELLO_SKLEP (C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_sklep_condition;
	information = dia_ruen_hello_sklep_info;
	permanent = TRUE;
	important = FALSE;
	description = " (ask about the abandoned crypt in the valley) " ;
};


func int dia_ruen_hello_sklep_condition()
{
	if (( METHODS  ==  TRUE ) && ( RUENSKLEPKNOWN  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_ruen_hello_sklep_info()
{
	AI_Output(other,self, " DIA_Ruen_Hello_Sklep_01_00 " );	// Elvais told me that you stumbled upon some abandoned crypt during one hunt.
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_01 " );	// Yes, it was. Creepy place, I tell you!
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_03 " );	// Why are you doing this?
	AI_Output(other,self, " DIA_Ruen_Hello_Sklep_01_04 " );	// Yes, yes. I want to visit there. Elvais told me that you brought a good bunch of old tomes from there.
	AI_Output(other,self, " DIA_Ruen_Hello_Sklep_01_05 " );	// Some of which, according to Elvais, contained very useful information.
	AI_Output(other,self, " DIA_Ruen_Hello_Sklep_01_06 " );	// So I think I should go there. Maybe I'll find something interesting.
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_07 " );	// I would advise you to stay away from this place. This crypt is just a hotbed of evil.
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_08 " );	// Never seen so many undead in one place. Yes, they are just all teeming there!
	AI_Output(other,self, " DIA_Ruen_Hello_Sklep_01_09 " );	// Well, I think I'll figure it out somehow. Could you be more specific about where this crypt is located?
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_10 " );	// And I'll see, you're a risky guy! It's up to you, of course...
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_11 " );	// But I'm afraid I won't be able to tell you the exact location of this crypt.
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_12 " );	// Stumbled upon it by accident. And when I got out of there, I didn’t have much time to remember the road.
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_13 " );	// I only remember that this crypt is located in a cave, somewhere near the circle of stones.
	AI_Output(other,self, " DIA_Ruen_Hello_Sklep_01_14 " );	// Circle of rocks?
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_15 " );	// Yes, a circle of stones. It seems to be located north of our camp.
	AI_Output(other,self, " DIA_Ruen_Hello_Sklep_01_16 " );	// Yeah... now it's definitely not a problem to find it!
	AI_Output(self,other, " DIA_Ruen_Hello_Sklep_01_17 " );	// Well, the guy - everything he knew, he said.
	B_LogEntry( TOPIC_URNAZULRAGE , " I talked to Ruen about the abandoned crypt. He told me that the crypt is north of the camp, not far from the stone circle, in a cave. " );
	RUENSKLEPKNOWN = TRUE;
};


instance DIA_RUEN_HELLO_LAST(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_last_condition;
	information = dia_ruen_hello_last_info;
	permanent = TRUE;
	important = FALSE;
	description = " Any more news? " ;
};


func int dia_ruen_hello_last_condition()
{
	if(RUENSKLEPKNOWN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ruen_hello_last_info()
{
	AI_Output(other,self, " DIA_Ruen_Hello_Last_01_00 " );	// Any more news?
	AI_Output(self,other, " DIA_Ruen_Hello_Last_01_01 " );	// Not yet.
};


