

instance DIA_JADEN_KAP1_EXIT(C_Info)
{
	npc = nov_11113_jaden;
	nr = 999;
	condition = dia_jaden_kap1_exit_condition;
	information = dia_jaden_kap1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jaden_kap1_exit_condition()
{
	return TRUE;
};

func void dia_jaden_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


var int is_jaden_about_church_condition;
var int jaden_about_sengo_answer_1;

instance DIA_JADEN_HELLO1(C_Info)
{
	npc = nov_11113_jaden;
	nr = 1;
	condition = dia_jaden_hello1_condition;
	information = dia_jaden_hello1_info;
	permanent = TRUE;
	important = FALSE;
	description = " How long have you been in the monastery? " ;
};


func int dia_jaden_hello1_condition()
{
	return TRUE;
};

func void dia_jaden_hello1_info()
{
	AI_Output(other,self, " DIA_Jaden_Hello_00_01 " );	// How long have you been in the monastery?
	AI_Output(self,other, " DIA_Jaden_Hello_00_02 " );	// It's been almost a year now. Well, I'm from the mainland...
	AI_Output(other,self, " DIA_Jaden_Hello_00_03 " );	// How did you get here?
	AI_Output(self,other, " DIA_Jaden_Hello_00_04 " );	// On a ship, how else? We're on an island. Or did you forget?
	AI_Output(other,self, " DIA_Jaden_Hello_00_05 " );	// I wanted to say - why did you come here? Isn't there a single monastery on the mainland?
	AI_Output(self,other, " DIA_Jaden_Hello_00_06 " );	// Well, why, there is one - in Nordmar.
	AI_Output(self,other, " DIA_Jaden_Hello_00_07 " );	// But I couldn't get there alone. And finding an escort in the midst of the war turned out to be a problem.
	AI_Output(self,other, " DIA_Jaden_Hello_00_08 " );	// So I took the money left to me by my father, boarded a ship and sailed here.
	AI_Output(other,self, " DIA_Jaden_Hello_00_09 " );	// Your father must have been a wealthy man?
	AI_Output(self,other, " DIA_Jaden_Hello_00_10 " );	// He was a paladin. The Order doesn't get as much as you think.
	AI_Output(self,other, " DIA_Jaden_Hello_00_11 " );	// He saved this amount for more than one year. He kept hoping that I would go to the city guard in Vengard.
	AI_Output(self,other, " DIA_Jaden_Hello_00_12 " );	// But I've always been drawn to the magic and mysteries of the past. And here I am!
	AI_Output(other,self, " DIA_Jaden_Hello_00_13 " );	// Was he a paladin?
	AI_Output(self,other, " DIA_Jaden_Hello_00_14 " );	// (sadly) Yes. Six months ago, I received a letter stating that he had died in battle.
};

instance DIA_JADEN_JOIN(C_Info)
{
	nr = 4;
	condition = dia_jaden_join_condition;
	information = dia_jaden_join_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = " I want to be a mage! " ;
};

func int dia_jaden_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void dia_jaden_join_info()
{
	AI_Output(other,self, " DIA_NOV_3_JOIN_15_00 " );	// I want to become a mage!
	AI_Output(self,other, " DIA_Jaden_Join_03_01 " );	// This is what all acolytes want. But only a few of them become the Chosen Ones and get a chance to be accepted into the Circle of Fire.
	AI_Output(self,other, " DIA_Jaden_Join_03_02 " );	// Becoming a Circle of Fire mage is the highest honor and must be earned.
	AI_Output(self,other, " DIA_Jaden_Join_03_03 " );	// You must work hard, and then perhaps you will have a chance.
};


instance DIA_JADEN_PEOPLE(C_Info)
{
	nr = 5;
	condition = dia_jaden_people_condition;
	information = dia_jaden_people_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = " Who is the leader of this monastery? " ;
};


func int dia_jaden_people_condition()
{
	return TRUE;
};

func void dia_jaden_people_info()
{
	AI_Output(other,self, " DIA_NOV_3_PEOPLE_15_00 " );	// Who heads this monastery?
	AI_Output(self,other, " DIA_Jaden_People_03_01 " );	// We acolytes serve the mages of the Circle of Fire. They, in turn, are led by the Supreme Council, consisting of the three most influential mages.
	AI_Output(self,other, " DIA_Jaden_People_03_02 " );	// But Parlan is responsible for all the affairs of the novices. He can always be found in the yard, he watches the work of novices.
};


instance DIA_JADEN_LOCATION(C_Info)
{
	nr = 6;
	condition = dia_jaden_location_condition;
	information = dia_jaden_location_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = " What can you tell me about this monastery? " ;
};


func int dia_jaden_location_condition()
{
	return TRUE;
};

func void dia_jaden_location_info()
{
	AI_Output(other,self, " DIA_NOV_3_LOCATION_15_00 " );	// What can you tell me about this monastery?
	AI_Output(self,other, " DIA_Jaden_Location_03_01 " );	// We earn our daily bread with our own labor. We raise sheep and make wine.
	AI_Output(self,other, " DIA_Jaden_Location_03_02 " );	// There is a library here, but only mages and selected acolytes are allowed to enter.
	AI_Output(self,other, " DIA_Jaden_Location_03_03 " );	// We, the rest of the acolytes, make sure that the mages of the Circle of Fire do not need anything.
};


instance DIA_JADEN_STANDARD(C_Info)
{
	nr = 10;
	condition = dia_jaden_standard_condition;
	information = dia_jaden_standard_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = " What's new? " ;
};

func int dia_jaden_standard_condition()
{
	return TRUE;
};

func void dia_jaden_standard_info()
{
	AI_Output(other,self, " DIA_NOV_3_STANDARD_15_00 " );	// What's new?
	if (chapter ==  1 )
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other, " DIA_Jaden_Standard_03_01 " );	// And you still ask! Yes, all the novices only talk about you.
			AI_Output(self,other, " DIA_Jaden_Standard_03_02 " );	// It's very rare for a green rookie like you to be elected to the Circle of Fire.
		}
		else
		{
			AI_Output(self,other, " DIA_Jaden_Standard_03_03 " );	// Elections will be held again soon. One of the acolytes will soon be accepted into the Circle of Fire.
			AI_Output(self,other, " DIA_Jaden_Standard_03_04 " );	// He'll start doing tests soon.
		};
	};
	if ((chapter ==  2 ) || (chapter ==  3 ))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other, " DIA_Jaden_Standard_03_05 " );	// Our Order has been touched by Beliar's dirty paw! Evil must be very strong if it could find allies here.
			AI_Output(self,other, " DIA_Jaden_Standard_03_06 " );	// Pedro lived in this monastery for many years. I think he spent too much time behind the walls of the monastery. This weakened his faith and made him vulnerable to Beliar's temptations.
		}
		else  if (MIS_NoviceChase ==  LOG_SUCCESS )
		{
			AI_Output(self,other, " DIA_Jaden_Standard_03_07 " );	// You came just in time. Innos himself could not have chosen a better moment for your appearance.
			AI_Output(self,other, " DIA_Jaden_Standard_03_08 " );	// You will enter the annals of our monastery as the savior of the Eye.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Jaden_Standard_03_09 " );	// The news from the Valley of Mines is very disturbing. I think Innos is deliberately putting us to the test.
		}
		else
		{
			AI_Output(self,other, " DIA_Jaden_Standard_03_10 " );	// It is said that there is no news from the paladins who went to the Valley of Mines. The High Council knows best what needs to be done.
		};
	};
	if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_Jaden_Standard_03_11 " );	// They say that we must destroy the dragons with the help of our Lord. The wrath of Innos will incinerate the creatures of Beliar.
	};
	if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_Jaden_Standard_03_12 " );	// Praise to Innos, there is no new crisis. We must continue to follow the path of our master, because only with his help can we resist evil.
	};
	if (Chapter >=  6 )
	{
		AI_Output(self,other, " DIA_Jaden_Standard_03_13 " );	// Don't you know yourself? Orcs, orcs, orcs - that's the only news lately. And there are more of them every day!
	};
};

func void b_assignambientinfos_jaden(var C_Npc slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Sausage.npc = Hlp_GetInstanceID(slf);
};

instance DIA_Jaden_Wurst (C_Info)
{
	npc = nov_11113_jaden;
	nr = 2;
	condition = DIA_Jaden_Wurst_Condition;
	information = DIA_Jaden_Sausage_Info;
	permanent = FALSE;
	description = " Here, I have lamb sausage for you. " ;
};

func int DIA_Jaden_Wurst_Condition()
{
	if ((Kapitel ==  1 ) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Jaden_Sausage_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_Agon_Wurst_15_00 " );	// Here, I have lamb sausage for you.
	AI_Output(self,other, " DIA_Agon_Wurst_07_03 " );	// Okay, give it here!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};

instance DIA_JADENSLD_PICKPOCKET(C_Info)
{
	nr = 900;
	npc = nov_11113_jaden;
	condition = dia_jadensld_pickpocket_condition;
	information = dia_jadensld_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_40;
};

func int dia_jadensld_pickpocket_condition()
{
	return  C_Robbery ( 56 , 35 );
};

func void dia_jadensld_pickpocket_info()
{
	Info_ClearChoices(dia_jadensld_pickpocket);
	Info_AddChoice(dia_jadensld_pickpocket,Dialog_Back,dia_jadensld_pickpocket_back);
	Info_AddChoice(dia_jadensld_pickpocket,DIALOG_PICKPOCKET,dia_jadensld_pickpocket_doit);
};

func void dia_jadensld_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void dia_jadensld_pickpocket_back()
{
	Info_ClearChoices(dia_jadensld_pickpocket);
};
