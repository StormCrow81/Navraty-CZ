

instance DIA_KARDOR_EXIT(C_Info)
{
	npc = vlk_6006_kardor;
	nr = 999;
	condition = dia_kardor_exit_condition;
	information = dia_kardor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_kardor_exit_condition()
{
	return TRUE;
};

func void dia_kardor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARDOR_HELLO(C_Info)
{
	npc = vlk_6006_kardor;
	nr = 1;
	condition = dia_kardor_hello_condition;
	information = dia_kardor_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " What are you doing? " ;
};


func int dia_kardor_hello_condition()
{
	if ( MEETKARDOR  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_kardor_hello_info()
{
	AI_Output(other,self, " DIA_Kardor_Hello_01_01 " );	// What are you doing?
	AI_Output(self,other, " DIA_Kardor_Hello_01_02 " );	// Why, can't you see? Ready for battle, what else.
	AI_Output(other,self, " DIA_Kardor_Hello_01_03 " );	// For what fight?
	AI_Output(self,other, " DIA_Kardor_Hello_01_04 " );	// I'll tell you what, kid. Sooner or later, all this bastard that roams around will probably decide to take up this place as well.
	AI_Output(self,other, " DIA_Kardor_Hello_01_05 " );	// And I don't want to sit back and wait for this moment!
	AI_Output(self,other, " DIA_Kardor_Hello_01_06 " );	// We must get out of this godforsaken place... and here is such an opportunity!
	AI_Output(other,self, " DIA_Kardor_Hello_01_07 " );	// What is the possibility?
	AI_Output(self,other, " DIA_Kardor_Hello_01_08 " );	// Dugo said that the teleport at the top of the pyramid leads directly to the orc city.
	AI_Output(self,other, " DIA_Kardor_Hello_01_09 " );	// And if we decide to use it to get out of here, we'll probably have to fight our way through hordes of these green-skinned creatures.
	AI_Output(self,other, " DIA_Kardor_Hello_01_10 " );	// Apparently there are a lot of orcs out there! Therefore, it will not hurt me to better wield my sword.
	AI_Output(other,self, " DIA_Kardor_Hello_01_11 " );	// Still, Dugo managed to infect others with his crazy idea. Believe me: what you have in mind is pure suicide!
	AI_Output(other,self, " DIA_Kardor_Hello_01_12 " );	// You'll never break through their city. You can't even get through their outpost, let alone through an entire city!
	AI_Output(self,other, " DIA_Kardor_Hello_01_13 " );	// Maybe so, but at least it's better to die than to become soulless undead, like those guys who already died here.
	MEETKARDOR = TRUE;
};


instance DIA_KARDOR_HELLO_TEACH(C_Info)
{
	npc = vlk_6006_kardor;
	nr = 1;
	condition = dia_kardor_hello_teach_condition;
	information = dia_kardor_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = " I hear you're good with a sword. " ;
};


func int dia_kardor_hello_teach_condition()
{
	if((MEETKARDOR == TRUE) && (KARDORTEACHER == TRUE) && (KARDORREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardor_hello_teach_info()
{
	AI_Output(other,self, " DIA_Kardor_Hello_Teach_01_01 " );	// I hear you're pretty good with a sword.
	AI_Output(self,other, " DIA_Kardor_Hello_Teach_01_02 " );	// What is, is. How else? It's hard to survive here in the valley if you can't stand up for yourself.
	AI_Output(self,other, " DIA_Kardor_Hello_Teach_01_03 " );	// I can teach you how to use your weapons better.
	AI_Output(other,self, " DIA_Kardor_Hello_Teach_01_04 " );	// Yes, I'm willing to work out!
	AI_Output(self,other, " DIA_Kardor_Hello_Teach_01_05 " );	// Well, then just tell me when you're ready.
	KARDORREADYTEACH = TRUE;
};


instance DIA_KARDOR_TH(C_Info)
{
	npc = vlk_6006_kardor;
	nr = 7;
	condition = dia_kardor_th_condition;
	information = dia_kardor_th_info;
	permanent = TRUE;
	description = " Let's start training! " ;
};


func int dia_kardor_th_condition()
{
	if((MEETKARDOR == TRUE) && (KARDORREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardor_th_choices()
{
	Info_ClearChoices(dia_kardor_th);
	Info_AddChoice(dia_kardor_th,Dialog_Back,dia_kardor_th_back);
	Info_AddChoice(dia_kardor_th,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_kardor_th_2h1);
	Info_AddChoice(dia_kardor_th,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_kardor_th_2h5);
	Info_AddChoice(dia_kardor_th,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_kardor_th_1h1);
	Info_AddChoice(dia_kardor_th,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_kardor_th_1h5);
};

func void dia_kardor_th_info()
{
	AI_Output(other,self, " DIA_Kardor_TH_01_01 " );	// Let's start training!
	dia_kardor_th_choices();
};

func void dia_kardor_th_back()
{
	Info_ClearChoices(dia_kardor_th);
};

func void dia_kardor_th_2h1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	dia_kardor_th_choices();
};

func void dia_kardor_th_2h5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	dia_kardor_th_choices();
};

func void dia_kardor_th_1h1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	dia_kardor_th_choices();
};

func void dia_kardor_th_1h5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	dia_kardor_th_choices();
};

