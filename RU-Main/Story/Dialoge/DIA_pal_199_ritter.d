

const string PAL_199_CHECKPOINT = "NW_FORESTFORT_01";

instance DIA_PAL_199_RITTER_EXIT(C_Info)
{
	npc = pal_199_ritter;
	nr = 999;
	condition = dia_pal_199_ritter_exit_condition;
	information = dia_pal_199_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_199_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_199_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_FIRSTWARN(C_Info)
{
	npc = pal_199_ritter;
	nr = 1;
	condition = dia_pal_199_ritter_firstwarn_condition;
	information = dia_pal_199_ritter_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_firstwarn_condition()
{
	if(GRANTTOFORT == TRUE)
	{
		self.aivar[ AIV_PASSGATE ] = TRUE ;
	};
	if (( self . aivar [ AIV_Guardpassage_Status ] ==  GP_NONE ) && ( PYROKARSENTTOHAGEN  ==  FALSE ) && ( self . aivar [ AIV_PASSGATE ] ==  FALSE ) && ( Npc_GetDistToWP ( self , " NW_FORESTFORT_01 " ) <  500 ) && ( GRANTTOFORT  ==  FALSE ) && (Npc_HasItems(hero,itwr_gardenorderfort) <  1 ) && (Chapter <  6 )) ;
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_firstwarn_info()
{
	AI_Output(self,other, " DIA_PAL_199_Ritter_FirstWarn_01_00 " );	// STOP! Where are you going, boy?
	AI_Output(other,self, " DIA_PAL_199_Ritter_FirstWarn_01_01 " );	// Uh... over there! And what?
	AI_Output(self,other, " DIA_PAL_199_Ritter_FirstWarn_01_02 " );	// Only people who are in the service of the king have access to the fortress. And only by the personal order of Lord Hagen himself!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_199_CHECKPOINT);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_PAL_199_RITTER_ATTACK(C_Info)
{
	npc = pal_199_ritter;
	nr = 3;
	condition = dia_pal_199_ritter_attack_condition;
	information = dia_pal_199_ritter_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_attack_condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && ( PYROKARSENTTOHAGEN  ==  FALSE ) && (self.aivar[ AIV_PASSGATE ] ==  FALSE ) && ( GRANTTOFORT  ==  FALSE ) && (Npc_HasItems(hero,itwr_hagenorderfort) <  1 ) ; && (Chapter <  6 ) && (Npc_GetDistToWP(other, PAL_199_CHECKPOINT ) < (other.aivar[AIV_LastDistToWP] -  50 ))) ;
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_attack_info()
{
	AI_Output(self,other, " DIA_PAL_199_Ritter_Attack_01_00 " );	// I think I warned you!
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_199_RITTER_HAGEN(C_Info)
{
	npc = pal_199_ritter;
	nr = 2;
	condition = dia_pal_199_ritter_hagen_condition;
	information = dia_pal_199_ritter_hagen_info;
	permanent = FALSE;
	description = " What is this place? " ;
};


func int dia_pal_199_ritter_hagen_condition()
{
	if (( GRANTTOFORT  ==  FALSE ) &&  ! Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_hagen_info()
{
	AI_Output(other,self, " DIA_PAL_199_Ritter_Hagen_01_00 " );	// What is this place?
	AI_Output(self,other, " DIA_PAL_199_Ritter_Hagen_01_01 " );	// Why can't you see? This is a fortress!
	AI_Output(other,self, " DIA_PAL_199_Ritter_Hagen_01_02 " );	// And what are you guarding here?
	AI_Output(self,other, " DIA_PAL_199_Ritter_Hagen_01_03 " );	// Passage to the southern lands of Khorinis. There is the military royal fort Azgan.
	AI_Output(other,self, " DIA_PAL_199_Ritter_Hagen_01_04 " );	// And I thought that all the paladins were located in the city.
	AI_Output(self,other, " DIA_PAL_199_Ritter_Hagen_01_05 " );	// A handful of paladins, along with Lord Hagen, did just that. The rest went through the passage to the fort.
	AI_Output(other,self, " DIA_PAL_199_Ritter_Hagen_01_06 " );	// How do I get to this fort?
	AI_Output(self,other, " DIA_PAL_199_Ritter_Hagen_01_07 " );	// Only if Lord Hagen gives the order himself. Without it, you're just wasting your time and mine.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_MAGE(C_Info)
{
	npc = pal_199_ritter;
	nr = 2;
	condition = dia_pal_199_ritter_mage_condition;
	information = dia_pal_199_ritter_mage_info;
	permanent = FALSE;
	description = " I'm a fire mage! " ;
};


func int dia_pal_199_ritter_mage_condition()
{
	if (( GRANTTOFORT  ==  FALSE ) && ( other.guild ==  GIL_KDF ) &&  !
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_mage_info()
{
	AI_Output(other,self, " DIA_PAL_199_Ritter_Mage_01_00 " );	// I'm a fire mage!
	AI_Output(self,other, " DIA_PAL_199_Ritter_Mage_01_03 " );	// I don't care. Unless you have Lord Hagen's permission, you can't enter the fortress.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_PALADIN(C_Info)
{
	npc = pal_199_ritter;
	nr = 2;
	condition = dia_pal_199_ritter_paladin_condition;
	information = dia_pal_199_ritter_paladin_info;
	permanent = FALSE;
	description = " I'm a paladin! " ;
};


func int dia_pal_199_ritter_paladin_condition()
{
	if (( GRANTTOFORT  ==  FALSE ) && ( other.guild ==  GIL_PAL ) &&  !
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_paladin_info()
{
	AI_Output(other,self, " DIA_PAL_199_Ritter_Paladin_01_00 " );	// I'm a paladin!
	AI_Output(self,other, " DIA_PAL_199_Ritter_Paladin_01_03 " );	// I don't care. Unless you have Lord Hagen's permission, you can't enter the fortress.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_PASSASMIL(C_Info)
{
	npc = pal_199_ritter;
	nr = 3;
	condition = dia_pal_199_ritter_passasmil_condition;
	information = dia_pal_199_ritter_passasmil_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_passasmil_condition()
{
	if (( GRANTTOFORT  ==  FALSE ) && (Npc_HasItems(other,itwr_gardenorderfort) >=  1 ) && (Chapter <  6 )) ;
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_passasmil_info()
{
	var C_Npc gatekeeper;
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_00");	//СТОЙ!
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassAsMil_01_01 " );	// Only people who are in the service of the king have access to the fortress. And only by personal order of Lord Hagen himself.
	AI_Output(other,self, " DIA_PAL_199_Ritter_PassAsMil_01_03 " );	// I have orders from Lord Hagen.
	AI_Output(other,self, " DIA_PAL_199_Ritter_PassAsMil_01_05 " );	// Here, take this.

	if(B_GiveInvItems(other,self,itwr_hagenorderfort,1))
	{
		Npc_RemoveInvItems(self,itwr_hagenorderfort, 1 );
	};

	B_UseFakeScroll();
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassAsMil_01_06 " );	// (surprised) Yes, indeed. Okay, you can come in.
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassAsMil_01_08 " );	// Just don't make trouble. Understood?
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	GRANTTOFORT = TRUE;
	gatekeeper = Hlp_GetNpc(pal_193_ritter);
	AI_TurnToNPC(self,gatekeeper);
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassAsMil_01_09 " );	// (shouting) Hey, up there! Lower the gate!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassAsMil_01_10");	//Проходи.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_199_RITTER_PASSEVER(C_Info)
{
	npc = pal_199_ritter;
	nr = 1;
	condition = dia_pal_199_ritter_passever_condition;
	information = dia_pal_199_ritter_passever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_199_ritter_passever_condition()
{
	if (( GRANTTOFORT  ==  FALSE ) && (Chapter >=  6 ) && (Npc_HasItems(other,itwr_pyrorderfort) >=  1 ) && ( PYROKARSENTTOHAGEN  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_pal_199_ritter_passever_info()
{
	var C_Npc gatekeeper;
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassEver_01_00 " );		// Stop! What are you doing here?
	AI_Output(other,self, " DIA_PAL_199_Ritter_PassEver_01_01 " );		// I need to get to the fort. I have an urgent message for paladins.
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassEver_01_02 " );		// Urgent message? And from whom?
	AI_Output(other,self, " DIA_PAL_199_Ritter_PassEver_01_03 " );		// From Pyrocar, Archmage of Fire. Or is that not enough for you?
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassEver_01_04 " );		// A message from the Firebenders?
	AI_Output(other,self, " DIA_PAL_199_Ritter_PassAsMil_01_05 " );	// Here, take this.

	if(B_GiveInvItems(other,self,itwr_pyrorderfort,1))
	{
		Npc_RemoveInvItems(self,itwr_pyrorderfort,1);
	};

	B_UseFakeScroll();
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassAsMil_01_06 " );	// (surprised) Yes, indeed. Okay, you can come in.
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassEver_01_07 " );		// Just don't make trouble. Understood?
	self.aivar[ AIV_PASSGATE ] = TRUE ;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE ;
	GRANTTOFORT = TRUE;
	gatekeeper = Hlp_GetNpc(pal_193_ritter);
	AI_TurnToNPC(self,gatekeeper);
	AI_Output(self,other, " DIA_PAL_199_Ritter_PassEver_01_08 " );	// (shouting) Hey, up there! Lower the gate!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_PAL_199_Ritter_PassEver_01_09");	//Проходи.
	AI_StopProcessInfos(self);
};
