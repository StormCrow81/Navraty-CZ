

instance DIA_BAGRUS_EXIT(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 999;
	condition = dia_bagrus_exit_condition;
	information = dia_bagrus_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_bagrus_exit_condition()
{
	return TRUE;
};

func void dia_bagrus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAGRUS_HELLO(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 1;
	condition = dia_bagrus_hello_condition;
	information = dia_bagrus_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " Hey, how are you? " ;
};


func int dia_bagrus_hello_condition()
{
	if ( MEASUREMENT BAGRUS  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_bagrus_hello_info()
{
	AI_Output(other,self, " DIA_Bagrus_Hello_01_01 " );	// Hey, how are you?
	AI_Output(self,other, " DIA_Bagrus_Hello_01_02 " );	// So far so good. And you, apparently, are the same guy that the whole camp is talking about.
	AI_Output(self,other, " DIA_Bagrus_Hello_01_03 " );	// Heard you're looking for some kind of dragon here.
	AI_Output(other,self, " DIA_Bagrus_Hello_01_04 " );	// Yes, a black dragon named Azgalor. Do you know anything about him?
	AI_Output(self,other, " DIA_Bagrus_Hello_01_05 " );	// No, absolutely nothing. If there were dragons here, I'd love to hunt one of them myself.
	AI_Output(self,other, " DIA_Bagrus_Hello_01_06 " );	// But here, having spawned nothing but fire lizards.
	AI_Output(other,self, " DIA_Bagrus_Hello_01_07 " );	// I have to go.
	MEASURING BAGRUS = TRUE ;
};


instance DIA_BAGRUS_HELLO_TEACH(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 1;
	condition = dia_bagrus_hello_teach_condition;
	information = dia_bagrus_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = " I hear you're the best hunter in the camp. " ;
};


func int dia_bagrus_hello_teach_condition()
{
	if((MEETBAGRUS == TRUE) && (BARGUSTEACHER == TRUE) && (BARGUSREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_bagrus_hello_teach_info()
{
	AI_Output(other,self, " DIA_Bagrus_Hello_Teach_01_01 " );	// I hear you're the best hunter in the camp.
	AI_Output(self,other, " DIA_Bagrus_Hello_Teach_01_02 " );	// I don't want to brag, but I do know a thing or two about hunting.
	AI_Output(other,self, " DIA_Bagrus_Hello_Teach_01_03 " );	// Can you butcher the carcasses of dead animals?
	AI_Output(self,other, " DIA_Bagrus_Hello_Teach_01_04 " );	// Ha, so this is the most important thing in this case. It doesn't take much to kill the beast.
	AI_Output(self,other, " DIA_Bagrus_Hello_Teach_01_05 " );	// But if you don't know what to do next - consider all your efforts were in vain.
	AI_Output(other,self, " DIA_Bagrus_Hello_Teach_01_06 " );	// Can you teach me?
	AI_Output(self,other, " DIA_Bagrus_Hello_Teach_01_08 " );	// Of course, I can show you how to remove various hunting trophies from the body of a dead animal.
	AI_Output(self,other, " DIA_Bagrus_Hello_Teach_01_10 " );	// Tell me when you're ready.
	BARGUSREADYTEACH = TRUE;
};


instance DIA_BAGRUS_TEACHHUNTING(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 1;
	condition = dia_bagrus_teachhunting_condition;
	information = dia_bagrus_teachhunting_info;
	permanent = TRUE;
	description = " Teach me how to cut carcasses. " ;
};


func int dia_bagrus_teachhunting_condition()
{
	if((MEETBAGRUS == TRUE) && (BARGUSREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_bagrus_teachhunting_info()
{
	AI_Output(other,self, " DIA_Bagrus_TeachHunting_01_01 " );	// Teach me how to butcher carcasses.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_01_02 " );	// What exactly do you want to know?
		Info_AddChoice(dia_bagrus_teachhunting,Dialog_Back,dia_bagrus_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Сдирать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),dia_bagrus_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Вырывать клыки",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),dia_bagrus_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Ломать когти",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),dia_bagrus_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Вырезать сердце",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),dia_bagrus_teachhunting_heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt( " Cut Firetongue " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_FireTongue)),dia_bagrus_teachhunting_firetongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Отламывать рог драконьего снеппера",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),dia_bagrus_teachhunting_drgsnapperhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Отламывать рог мракориса",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),dia_bagrus_teachhunting_shadowhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Снять чешую дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),dia_bagrus_teachhunting_dragonscale);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Слить кровь дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),dia_bagrus_teachhunting_dragonblood);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_01_03 " );	// You already know everything I could teach you.
	};
};

func void dia_bagrus_teachhunting_back()
{
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_Fur_01_00 " );	// You make a slit in the animal's skin, through which you can remove the fur. You need to do this from front to back, not vice versa.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_Teeth_01_00 " );	// When you remove teeth, you need to act so as not to break the jaw.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_Claws_01_00 " );	// Claws can be removed in different ways. For some animals, it’s just a strong blow, for others it’s enough to cut them with a knife.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_Heart_01_00 " );	// Cut out the heart of the beast with a skillful blow to the chest. But it's often worth it, especially with certain beasts or magical creatures.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_firetongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_FireTongue_01_00 " );	// The tongue of the fire lizard must be cut out with one precise movement of the knife, while holding it with the other hand.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_drgsnapperhorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_DrgSnapperHorn_01_00 " );	// It's best to separate the dragon snapper's horn from the skull with a thick knife.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_shadowhorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_ShadowHorn_01_00 " );	// To get the horn, you push against the skull with all your might and press on the horn, then it will break off.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_dragonscale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_DragonScale_01_00 " );	// Dragon scales are very hard to remove. But when you already think that nothing will work out for you, once - and it nevertheless separates.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_dragonblood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other, " DIA_Bagrus_TeachHunting_DragonBlood_01_00 " );	// It is best to take blood from the belly. Find a weak spot and plunge a sharp knife into it.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

