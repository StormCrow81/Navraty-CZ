

instance DIA_NIXDOG_EXIT(C_Info)
{
	npc = nixdog;
	nr = 999;
	condition = dia_nixdog_exit_condition;
	information = dia_nixdog_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nixdog_exit_condition()
{
	return TRUE;
};

func void dia_nixdog_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NIXDOG_HELLO (C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_hallo_condition;
	information = dia_nixdog_hello_info;
	permanent = FALSE;
	description = " Hello Fang! " ;
};


func int dia_nixdog_hallo_condition()
{
	return TRUE;
};

func void dia_nixdog_hallo_info()
{
	AI_Output(other,self, " DIA_NixDog_Hallo_01_00 " );	// Hello, Fang!
	AI_Output(self,other, " DIA_NixDog_Hallo_01_01 " );	// ...(wags tail)
};


instance DIA_NIXDOG_KOMMMIT(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_kommmit_condition;
	information = dia_nixdog_kommmit_info;
	permanent = TRUE;
	description = " Come with me... " ;
};


func int dia_nixdog_kommmit_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if (( CLAWTIMERCLAWGOHUNT  <= (daynow -  1 )) && (self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && Npc_KnowsInfo(other,dia_nixdog_hallo) && (self.aivar[ AIV_TAPOSITION ] ==  FALSE ) && (Npc_GetDistToWP(self, " . NW_HUNTERCAMP_CLAW " ) <  1000 )) .
	{
		return TRUE;
	};
};

func void dia_nixdog_kommmit_info()
{
	AI_Output(other,self, " DIA_NixDog_KommMit_01_00 " );	// Come with me...
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//...(виляет хвостом)
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	self.aivar[AIV_MM_RoamStart] = OnlyRoutine;
	self.aivar[AIV_MM_SleepStart] = 0 ;
	self.aivar[AIV_MM_SleepEnd] = 0 ;
	AI_StopProcessInfos(self);
};


instance DIA_NIXDOG_BECLOSE(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_beclose_condition;
	information = dia_nixdog_beclose_info;
	permanent = TRUE;
	description = " Stay close, Fang. " ;
};


func int dia_nixdog_beclose_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if (( CLAWTIMERCLAWGOHUNT  <= (daynow -  1 )) && ( self . aivar [ AIV_PARTYMEMBER ] ==  TRUE ) && Npc_KnowsInfo ( other , dia_nixdog_hallo ) && ( self . aivar [ AIV_TAPOSITION ] ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_nixdog_beclose_info()
{
	AI_Output(other,self, " DIA_NixDog_BeClose_01_00 " );	// Stay close.
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//...(виляет хвостом)
	self.senses_range = 300;
	AI_StopProcessInfos(self);
};


instance DIA_NIXDOG_ATTACK(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_attack_condition;
	information = dia_nixdog_attack_info;
	permanent = TRUE;
	description = " Go, Fang! Hunt! " ;
};


func int dia_nixdog_attack_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if (( CLAWTIMERCLAWGOHUNT  <= (daynow -  1 )) && ( self . aivar [ AIV_PARTYMEMBER ] ==  TRUE ) && Npc_KnowsInfo ( other , dia_nixdog_hallo ) && ( self . aivar [ AIV_TAPOSITION ] ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_nixdog_attack_info()
{
	AI_Output(other,self, " DIA_NixDog_Attack_01_00 " );	// Go, Fang! Hunt!
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//...(виляет хвостом)
	self.senses_range = 2000;
	AI_StopProcessInfos(self);
};


instance DIA_NIXDOG_WARTEHIER(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_wartehier_condition;
	information = dia_nixdog_wartehier_info;
	permanent = TRUE;
	description = " Stay here. " ;
};


func int dia_nixdog_wartehier_condition()
{
	where int daynow;
	daynow = Wld_GetDay();

	if (( CLAWTIMERCLAWGOHUNT  <= (daynow -  1 )) && (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && Npc_KnowsInfo(other,dia_nixdog_hallo) && (self.aivar[ AIV_TAPOSITION ] ==  FALSE ) && (Npc_GetDistToWP(self, " . NW_HUNTERCAMP_CLAW " ) <  1000 )) .
	{
		return TRUE;
	};
};

func void dia_nixdog_wartehier_info()
{
	AI_Output(other,self,"DIA_NixDog_WarteHier_01_00");	//Жди тут.
	AI_Output(self,other,"DIA_NixDog_WarteHier_01_01");	//...(виляет хвостом)
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"NW_HUNTERCAMP_CLAW");
	AI_AlignToWP(self);
	self.aivar[AIV_MM_SleepStart] = 1 ;
	self.aivar[AIV_MM_SleepEnd] = 23 ;
	self.aivar[AIV_MM_RoamStart] = 23 ;
	self.aivar[AIV_MM_RoamEnd] = 1 ;
	self.aivar[AIV_MM_SleepStart] = OnlyRoutine;
};

instance DIA_NIXDOG_GIVEMEAT (C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_givemeat_condition;
	information = dia_nixdog_givemeat_info;
	permanent = TRUE;
	description = " (give a piece of meat) " ;
};

func int dia_nixdog_givemeat_condition()
{
	where int daynow;
	daynow = Wld_GetDay();

	if((CLAWTIMERCLAWGOHUNT <= (daynow - 1)) && (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_nixdog_givemeat_info()
{
	AI_Output(other,self, " DIA_NixDog_GiveMeat_01_00 " );	// Hey, Fang! Hold...
	AI_PlayAni(other,"T_STAND_2_IDROP");
	Npc_RemoveInvItems(other,ItFoMuttonRaw,1);
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//...(виляет хвостом)
	AI_PlayAni(self,"T_STAND_2_EAT");

	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 150;

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

// ------------------------------werewolf----------------- ---------------------

instance DIA_Werewolf_EXIT(C_Info)
{
	npc = Werewolf;
	nr = 999;
	condition = DIA_Werewolf_exit_condition;
	information = DIA_Werewolf_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Werewolf_exit_condition()
{
	return TRUE;
};

func void DIA_Werewolf_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Werewolf_Hello (C_Info)
{
	npc = Werewolf;
	nr = 1;
	condition = DIA_Werewolf_Hallo_condition;
	information = DIA_Werewolf_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Werewolf_Hallo_condition()
{
	if(WereWolfIsHuman == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Werewolf_Hello_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Werewolf_Hallo_01_00 " );	// Rrrr...(growls) Wait a minute... Am I able to talk again? Incredible...
	AI_Output(other,self, " DIA_Werewolf_Hallo_01_01 " );	// As you can see! Or do you not like it?
	AI_Output(self,other, " DIA_Werewolf_Hallo_01_02 " );	// Hmmm... No! So even better. And then I'm already tired of this constant roar.
	AI_Output(other,self, " DIA_Werewolf_Hallo_01_03 " );	// Sorry, but this is the only way we can help you!
	AI_Output(other,self, " DIA_Werewolf_Hallo_01_04 " );	// Unfortunately, it is unlikely that you will be able to return your human form back.
	AI_Output(self,other, " DIA_Werewolf_Hallo_01_05 " );	// Damned Ignaz... (viciously) These are all his experiments! Whether they are bad.
	AI_Output(other,self, " DIA_Werewolf_Hallo_01_06 " );	// Well, it's okay for you, with whom it doesn't happen. Or are you so bad in the shoes of mrakoris?
	AI_Output(self,other, " DIA_Werewolf_Hallo_01_07 " );	// Yes, how can I say... This, of course, has its advantages.
	AI_Output(self,other, " DIA_Werewolf_Hallo_01_08 " );	// That's just damn fleas get it. And so - quite tolerant.
};

instance DIA_Werewolf_What(C_Info)
{
	npc = Werewolf;
	nr = 1;
	condition = DIA_Werewolf_What_condition;
	information = DIA_Werewolf_What_info;
	permanent = FALSE;
	description = " What are you going to do? " ;
};

func int DIA_Werewolf_What_condition()
{
	if(Npc_KnowsInfo(other,DIA_Werewolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Werewolf_What_info()
{
	AI_Output(other,self, " DIA_Werewolf_What_01_00 " );	// What will you do?
	AI_Output(self,other, " DIA_Werewolf_What_01_01 " );	// I'll stay with Sagitta for now. She is good... and feeds well!
	AI_Output(other,self, " DIA_Werewolf_What_01_02 " );	// Just take care of her.
	AI_Output(self,other, " DIA_Werewolf_What_01_03 " );	// Of course. And it is unlikely that anyone will climb here, knowing that the obscurantist lives here.
	AI_Output(other,self, " DIA_Werewolf_What_01_04 " );	// That's right.
};

//-----------------------------------------------------------------------------------------

instance DIA_Crait_EXIT(C_Info)
{
	npc = Crate;
	nr = 999;
	condition = dia_Crait_exit_condition;
	information = dia_Crait_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Crait_exit_condition()
{
	return TRUE;
};

func void dia_Crait_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Crait_GIVEMEAT(C_Info)
{
	npc = Crate;
	nr = 1;
	condition = dia_Crait_givemeat_condition;
	information = dia_Crait_givemeat_info;
	permanent = TRUE;
	description = " (give a piece of meat) " ;
};

func int dia_Crait_givemeat_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_Crait_givemeat_info()
{
	AI_PlayAni(other,"T_STAND_2_IDROP");
	Npc_RemoveInvItems(other,ItFoMuttonRaw,1);
	AI_PlayAni(self,"T_STAND_2_EAT");

	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 300;

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};
