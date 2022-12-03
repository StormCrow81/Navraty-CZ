

instance DIA_DRAGON_BLACK_EXIT(C_Info)
{
	npc = dragon_black;
	nr = 999;
	condition = dia_dragon_black_exit_condition;
	information = dia_dragon_black_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dragon_black_exit_condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_black_exit_info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_BLACK_HELLO(C_Info)
{
	npc = dragon_black;
	nr = 5;
	condition = dia_dragon_black_hello_condition;
	information = dia_dragon_black_hello_info;
	important = TRUE;
};


func int dia_dragon_black_hello_condition()
{
	if((DRAGONBLACKMEET == FALSE) && (AZGOLORAPPEAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_dragon_black_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other, " DIA_Dragon_Black_Hello_01_00 " );	// Human!? And I thought I had destroyed all of you, miserable people!
	AI_Output(other,self, " DIA_Dragon_Black_Hello_01_01 " );	// As you can see, you made a mistake. And I think that this will be your last mistake.
	AI_Output(self,other, " DIA_Dragon_Black_Hello_01_05 " );	// (growls) So I owe my concern to you?! To a mere mortal?
	AI_Output(other,self, " DIA_Dragon_Black_Hello_01_03 " );	// That's the way it is, dragon. I came here to blow your filthy head off!
	AI_Output(self,other, " DIA_Dragon_Black_Hello_01_07 " );	// (growls) Since you managed to get to me, then obviously my faithful servant Dakat failed.
	AI_Output(self,other, " DIA_Dragon_Black_Hello_01_08 " );	// Mindless creature! Everything has to be done by yourself!
	AI_Output(self,other, " DIA_Dragon_Black_Hello_01_09 " );	// Well, I'll rip your heart out, take your soul, and tear your flesh into small pieces!
	AI_Output(other,self, " DIA_Dragon_Black_Hello_01_10 " );	// We'll see who rips out who's heart! Greetings from Ur-Thrall!
	AI_Output(self,other, " DIA_Dragon_Black_Hello_01_14 " );	// Ur-Thrall? Oh yes, I remember that slug. Didn't he dare to challenge me? However, it doesn't matter.

	if(MEETURGROM == 4)
	{
		AI_Output(self,other, " DIA_Dragon_Black_Hello_01_19 " );	// I see you brought the mighty Ur-Grom with you!
		AI_Output(self,other, " DIA_Dragon_Black_Hello_01_20 " );	// His soul belongs to me, as well as all their vile people!
	};
	if(Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1)
	{
		AI_Output(self,other, " DIA_Dragon_Black_Hello_01_21 " );	// Oh, I see you've found the Executor, the weapon of the spirit warrior I cast down!
		AI_Output(self,other, " DIA_Dragon_Black_Hello_01_22 " );	// And you naively think that he will help you defeat me?
	};

	AI_Output(other,self, " DIA_Dragon_Black_Hello_01_17 " );	// Stop wasting time talking! It's time to get down to business.
	AI_Output(self,other, " DIA_Dragon_Black_Hello_01_18 " );	// (contemptuously) I can already taste your blood, hero...
	AI_PlayAni(self,"T_WARN");
	AI_Output(self,other, " DIA_Dragon_Black_Hello_01_23 " );	// MY TEETH ARE SWORDS! MY CLAWS ARE SPEARS! MY WINGS ARE A HURRICANE!
	AI_Output(self,other, " DIA_Dragon_Black_Hello_01_24 " );	// I AM THE FLAME! I AM... DEATH!
	B_LogEntry( TOPIC_URNAZULRAGE , " The Great Shadow, Azgalor, is here! The Eye of Wrath awakened the black dragon and he came to the Valley of Shadows, led by the call of this powerful artifact. In general, this is exactly what I wanted. Now only my sword can answer - not in vain has it all been done? " );
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	DRAGONBLACKMEET = TRUE;
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE ;
};

