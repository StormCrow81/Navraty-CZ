instance DIA_Ass_130_CorGalomDemon_EXIT(C_Info)
{
	npc = Ass_130_CorGalomDemon;
	No. = 999 ;
	condition = DIA_Ass_130_CorGalomDemon_exit_condition;
	information = DIA_Ass_130_CorGalomDemon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_130_CorGalomDemon_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_130_CorGalomDemon_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_130_CorGalomDemon_Hello(C_Info)
{
	npc = Ass_130_CorGalomDemon;
	no. = 1 ;
	condition = DIA_Ass_130_CorGalomDemon_hello_condition;
	information = DIA_Ass_130_CorGalomDemon_hello_info;
	permanent = FALSE ;
	important= TRUE;
};
	
func int DIA_Ass_130_CorGalomDemon_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_130_CorGalomDemon_hello_info()
{
	if(Npc_HasItems(other,ItKe_Masiaf_Prision) >= 1)
	{
		Npc_RemoveInvItems(other,ItKe_Masiaf_Prision,1);
	};

	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_00");	//Ah, there you are!
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_01 " );	// Frankly, I've been looking forward to your arrival since our last meeting.
	AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_02 " );	// Do we know each other?
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_03 " );	// Of course. Or have you already forgotten what happened in the Temple of the Sleeper?
	AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_04 " );	// Mmm ... Yes, your face looks familiar to me. Is it Kor-Galom?
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_05 " );	// I thought you'd never guess.
	AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_06 " );	// But I killed you there, in the temple!
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_07 " );	// Yes, you did. However, some dark magic unknown to me brought me back to life.
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_08 " );	// And, apparently, my master decided that I would be more useful as a demon than as a Lich.

	if(MeetDarkTempleMage == TRUE)
	{
		AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_09 " );	// By the way, you've already met him.
		AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_10 " );	// If you mean that necromancer in the temple, then yes.

		if(Npc_IsDead(dmt_1298_darkmage) == TRUE)
		{

			AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_11 " );	// True, his magic could not save him from death.
		};
	}
	else
	{
		AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_12 " );	// I'm sure you'll see him again, however.
		AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_13 " );	// You might have to kill him again.
	};

	AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_14 " );	// Might you satisfy my curiosity?
	AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_15 " );	// Why did you need the Brotherhood acolytes?
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_16 " );	// This is easy to explain. As you know, I am a consummate student, ever learning.
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_17 " );	// And I am always in need of fresh materials to further my work.
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_18 " );	// Haniar the Blind and his Shadows were quite useful for supplying me with them on a regular basis.
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_19 " );	// In exchange for his services, I bestowed my favor on him. After all, he always craved power.
	AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_20 " );	// Too bad it wasn't enough.
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_21 " );	// (grimly) Yes, you killed him. As well as my servant Nebiros.
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_22 " );	// He was simply a creation of my research. A trifling thing to be discarded.
	AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_23 " );	// Oh, I discarded him all right.
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_24 " );	// You think yourself unstoppable, do you? My equal?
	AI_Output (other, self, " DIA_Ass_130_CorGalomDemon_hello_01_25 " );	// We will find out.
	AI_Output (self, other, " DIA_Ass_130_CorGalomDemon_hello_01_26 " );	// I thank you, destined one. I have been waiting for this moment for a long time!
	Info_ClearChoices(DIA_Ass_130_CorGalomDemon_hello);
	Info_AddChoice (DIA_Ass_130_CorGalomDemon_hello, Dialog_Ende, DIA_Ass_130_CorGalomDemon_hello_Exit);
};

func void DIA_Ass_130_CorGalomDemon_hello_Exit()
{
	CorGalomDontSpeak = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
	self.aivar [AIV_EnemyOverride] = FALSE ;
};	
