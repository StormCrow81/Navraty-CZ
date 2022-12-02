

instance DIA_GUNMAR_EXIT(C_Info)
{
	npc = vlk_6005_gunmar;
	nr = 999;
	condition = dia_gunmar_exit_condition;
	information = dia_gunmar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gunmar_exit_condition()
{
	return TRUE;
};

func void dia_gunmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GUNMAR_HELLO(C_Info)
{
	npc = vlk_6005_gunmar;
	nr = 1;
	condition = dia_gunmar_hello_condition;
	information = dia_gunmar_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " How are you, buddy? " ;
};


func int dia_gunmar_hello_condition()
{
	if(MEETGUNMAR == FALSE)
	{
		return TRUE;
	};
};

func void dia_gunmar_hello_info()
{
	AI_Output(other,self, " DIA_Gunmar_Hello_01_01 " );	// How's life, mate?
	AI_Output(self,other, " DIA_Gunmar_Hello_01_02 " );	// What kind of life is here?! Boy, did you fall off the moon, huh?
	AI_Output(self,other, " DIA_Gunmar_Hello_01_04 " );	// What do you call a life, the meaning of which is only to think every day how to save your own skin.
	AI_Output(self,other, " DIA_Gunmar_Hello_01_05 " );	// Such hordes of different creatures and undead roam around that it's already scary to go hunting.
	AI_Output(other,self, " DIA_Gunmar_Hello_01_07 " );	// Yeah, you can't exactly call it a quiet life.
	AI_Output(other,self, " DIA_Gunmar_Hello_01_08 " );	// By the way, apart from the hordes of undead and other vile creatures, have you by any chance seen a dragon in these parts?
	AI_Output(self,other, " DIA_Gunmar_Hello_01_09 " );	// Only the dragon was missing here! And so it is impossible to take a step in these parts without running into trouble.
	AI_Output(other,self, " DIA_Gunmar_Hello_01_10 " );	// Don't get angry, I was just asking...
	AI_Output(self,other, " DIA_Gunmar_Hello_01_11 " );	// Stop pestering me with all sorts of weird questions. Better do something useful.
	MEETGUNMAR = TRUE;
};


instance DIA_GUNMAR_HELLO_TEACH(C_Info)
{
	npc = vlk_6005_gunmar;
	nr = 1;
	condition = dia_gunmar_hello_teach_condition;
	information = dia_gunmar_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = " They say you're the best shot in the area. " ;
};


func int dia_gunmar_hello_teach_condition()
{
	if((MEETGUNMAR == TRUE) && (GUNMARTEACHER == TRUE) && (GUNMARREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gunmar_hello_teach_info()
{
	AI_Output(other,self, " DIA_Gunmar_Hello_Teach_01_01 " );	// They say you're the best shot in the area.
	AI_Output(self,other, " DIA_Gunmar_Hello_Teach_01_02 " );	// Well, since they say it, it means that it is so. And what?
	AI_Output(other,self, " DIA_Gunmar_Hello_Teach_01_03 " );	// Could you teach me how to shoot a bow more accurately?
	AI_Output(self,other, " DIA_Gunmar_Hello_Teach_01_04 " );	// Why not?
	AI_Output(self,other, " DIA_Gunmar_Hello_Teach_01_05 " );	// At least I'd rather teach you how to practice archery than answer your weird questions.
	AI_Output(self,other, " DIA_Gunmar_Hello_Teach_01_06 " );	// Well, when do we start?
	GUNMARREADYTEACH = TRUE;
};


var int gunmar_brand_bow;

instance DIA_GUNMAR_TEACH(C_Info)
{
	npc = vlk_6005_gunmar;
	nr = 8;
	condition = dia_gunmar_teach_condition;
	information = dia_gunmar_teach_info;
	permanent = TRUE;
	description = " Teach me more accurate bow and crossbow shooting. " ;
};


func int dia_gunmar_teach_condition()
{
	if((MEETGUNMAR == TRUE) && (GUNMARREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_gunmar_teach_choices()
{
	Info_ClearChoices(dia_gunmar_teach);
	Info_AddChoice(dia_gunmar_teach,Dialog_Back,dia_gunmar_teach_back);
	Info_AddChoice(dia_gunmar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_gunmar_teach_crossbow_1);
	Info_AddChoice(dia_gunmar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_gunmar_teach_crossbow_5);
	Info_AddChoice(dia_gunmar_teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_gunmar_teach_bow_1);
	Info_AddChoice(dia_gunmar_teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),dia_gunmar_teach_bow_5);
};

func void dia_gunmar_teach_info()
{
	AI_Output(other,self, " DIA_Gunmar_Teach_01_01 " );	// Teach me how to shoot more accurately with a bow and crossbow.
	AI_Output(self,other, " DIA_Gunmar_Teach_01_02 " );	// Well, let's get started.
	GUNMAR_MERKE_BOW = other.HitChance[NPC_TALENT_BOW];
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100);
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100);
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,100);
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,100);
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_back()
{
	if(GUNMAR_MERKE_BOW < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other, " DIA_Gunmar_Teach_Back_01_01 " );	// Already better. Practice more and you'll be as good a shooter as I am.
	};
	Info_ClearChoices(dia_gunmar_teach);
};

