

instance DIA_VLK_6137_GASPAR_EXIT(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 999;
	condition = dia_vlk_6137_gaspar_exit_condition;
	information = dia_vlk_6137_gaspar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6137_gaspar_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6137_gaspar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_6137_GASPAR_HELLO(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 5;
	condition = dia_vlk_6137_gaspar_hello_condition;
	information = dia_vlk_6137_gaspar_hello_info;
	permanent = FALSE;
	description = " Hey, what the hell are you doing here?! " ;
};


func int dia_vlk_6137_gaspar_hello_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISKNAST == TRUE))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_hello_info()
{
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_Hello_01_00 " );	// Hey, what the hell are you doing here?! Where is Hannah?
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_Hello_01_01 " );	// My name is Gaspar. I...
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_Hello_01_02 " );	// I don't think I asked you about this.
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_Hello_01_03 " );	// Now I'm the owner here, and this is my hotel.
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_Hello_01_05 " );	// A couple of days ago, Hanna was arrested by the city militia - she is accused of theft.
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_Hello_01_06 " );	// What is she being accused of?!
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_Hello_01_07 " );	// Steal! She robbed a merchant and is now in prison. I think she belongs there!
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_Hello_01_08 " );	// What? Are you out of your mind, buddy? It just can't be!
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_Hello_01_09 " );	// Still how can! In her chest they found the stolen things of this poor fellow.
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_Hello_01_10 " );	// So all the evidence of her guilt is simply obvious.
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_Hello_01_12 " );	// If you're interested in the details of this case, you'd better talk to Lord Andre himself about it.
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_Hello_01_13 " );	// And I have no time to chat with you here!
	KNOWSHANNAINPRISION = TRUE;
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " Upon arrival in Khorinis, it turned out that Hannah was arrested. She is accused of stealing things from a merchant. Instead, the inn is now run by a man named Gaspar - a vile type! I should talk to Lord Andre and find out exactly what happened here. " );
};


instances DIA_VLK_6137_GASPAR_INPRISOIN (C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 5;
	condition = dia_vlk_6137_gaspar_inprisoin_condition;
	information = dia_vlk_6137_gaspar_inprisoin_info;
	permanent = FALSE;
	description = " So you're the witness in the Hanna case " ;
};


func int dia_vlk_6137_gaspar_inprisoin_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONHAKON == TRUE))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_inprisoin_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoin_01_00 " );	// So you're the witness in Hannah's case?
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_01");	//Да, я.
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoin_01_02 " );	// Then tell me what you saw.
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoin_01_03 " );	// Everything I've seen, I've already told Lord Andre. So all questions to him.
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoin_01_04 " );	// Why don't you want to talk about it?
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoin_01_05 " );	// Because... (nervous) Because it's none of your business!
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoin_01_07 " );	// I think you'll soon be where you belong.
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoin_01_08 " );	// Are you threatening me?!
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoin_01_10 " );	// Look...(nervous) I don't give a shit about all your threats and warnings!
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoin_01_11 " );	// So you'd better get out of my inn before I call the guards.
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " I thought Gasper was obviously hiding something about Hannah's case. I think we need to know more about this dude - he's obviously not clean. " );
	AI_StopProcessInfos(self);
};


instances DIA_VLK_6137_GASPAR_INPRISOINAB (C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 5;
	condition = dia_vlk_6137_gaspar_inprisoinab_condition;
	information = dia_vlk_6137_gaspar_inprisoinab_info;
	permanent = TRUE;
	description = " You framed Hannah! " ;
};


func int dia_vlk_6137_gaspar_inprisoinab_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONCARAGON == TRUE) && (GASPARPISSOFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_inprisoinab_info()
{
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_00 " );	// You set Hannah up!
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_01 " );	// (frightened) What?!
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_03 " );	// You slipped the stolen items to Hannah!
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_04 " );	// Who? I?! I have nothing to do with it! I do not know anything!
	AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_05 " );	// You know! And it won't be hard for me to prove it.
	AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_06 " );	// Well, try it.

	if ((Npc_HasItems(other,itri_ismissing) >=  1 ) && ( JOTELLSAVINGS  ==  TRUE )) .
	{
		B_GivePlayerXP(50);
		AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_08 " );	// Look what a beautiful ring I have.
		AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_09 " );	// And I also know one person, his name is Joe. By the way, he knows you too.
		AI_Output(other,self, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_10 " );	// And he knows so much about you that this is enough to put you behind bars.
		AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_11 " );	// (blushing) What?!
		AI_Output(self,other, " DIA_VLK_6137_Gaspar_InPrisoinAb_01_13 " );	// Do what you want - I don't care anymore.
		GASPARPISSOFF = TRUE;
	};
	AI_StopProcessInfos(self);
};


instances DIA_VLK_6137_GASPAR_FUCKOFF (C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 10;
	condition = dia_vlk_6137_gaspar_fuckoff_condition;
	information = dia_vlk_6137_gaspar_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_6137_gaspar_fuckoff_condition()
{
	if((GASPARPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

