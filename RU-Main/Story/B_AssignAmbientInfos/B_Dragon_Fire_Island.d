

instance DIA_Dragon_Fire_Island_Exit(C_Info)
{
	npc = Dragon_Fire_Island;
	nr = 999;
	condition = DIA_Dragon_Fire_Island_Exit_Condition;
	information = DIA_Dragon_Fire_Island_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Fire_Island_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Exit_Info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_Dragon_Fire_Island_Hello(C_Info)
{
	npc = Dragon_Fire_Island;
	nr = 5;
	condition = DIA_Dragon_Fire_Island_Hello_Condition;
	information = DIA_Dragon_Fire_Island_Hello_Info;
	important = TRUE;
};


func int DIA_Dragon_Fire_Island_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Hello_Info()
{
	AI_Output(self,other, " DIA_Dragon_Fire_Island_Hello_20_00 " );	// Stop, man. All my senses tell me that the killer of my flesh and blood is standing before me.
	AI_Output(other,self, " DIA_Dragon_Fire_Island_Hello_15_01 " );	// Yes? Who did you call the killer, you hellspawn?
	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(self,other, " DIA_Dragon_Fire_Island_Hello_20_02 " );	// It's not enough for you that you destroyed almost all of our offspring?
	};
	AI_Output(self,other, " DIA_Dragon_Fire_Island_Hello_20_03 " );	// My brother Feomatar is also on your conscience, and you will pay for this.
	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(other,self, " DIA_Dragon_Fire_Island_Hello_15_04 " );	// I'm also going to get to the rest of your cursed tribe.
		AI_Output(self,other, " DIA_Dragon_Fire_Island_Hello_20_05 " );	// Ahh. I will burn you alive with great pleasure.
	};
	AI_Output(other,self, " DIA_Dragon_Fire_Island_Hello_15_06 " );	// Stop shaking the air. Let's get down to business.
	AI_Output(self,other, " DIA_Dragon_Fire_Island_Hello_20_07 " );	// You've gone too far, you pathetic human, but you won't get out of here alive.
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_HallenVonIrdorath, " Another fire dragon. I'm fed up with these creatures. I just need to get across the chasm that lies behind this fire dragon. " );
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

