
instance DIA_BullcoDJG_EXIT(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 999;
	condition = DIA_BullcoDJG_EXIT_Condition;
	information = DIA_BullcoDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BullcoDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BullcoDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_BullcoDJG_HALLO (C_Info)
{
	npc = DJG_701_Bullco;
	nr = 5;
	condition = DIA_BullcoDJG_HALLO_Condition;
	information = DIA_BullcoDJG_HELLO_Info;
	description = " What's wrong? " ;
};


func int DIA_BullcoDJG_HELLO_Condition()
{
	if (Npc_IsDead(DJG_Sylvio) ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_BullcoDJG_HALLO_Info()
{
	AI_Output(other,self, " DIA_BullcoDJG_HALLO_15_00 " );	// What's wrong???
	AI_Output(self,other, " DIA_BullcoDJG_HALLO_06_01 " );	// It's so cold in here! I don't understand why Silvio insisted that we come here.
	AI_Output(self,other, " DIA_BullcoDJG_HALLO_06_02 " );	// There are plenty of other places to look!
	AI_StopProcessInfos(self);
};


instances DIA_BullcoDJG_WARTEMAL (C_Info)
{
	npc = DJG_701_Bullco;
	nr = 6;
	condition = DIA_BullcoDJG_WARTEMAL_Condition;
	information = DIA_BullcoDJG_WARTEMAL_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_BullcoDJG_WARTEMAL_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bullco_DJG_HALLO ) || Npc_KnowsInfo ( other , DIA_Bullco_WASNUN ))
	{
		return TRUE;
	};
};

func void DIA_BullcoDJG_WARTEMAL_Info()
{
	AI_Output(other,self, " DIA_BullcoDJG_WARTEMAL_15_00 " );	// Is everything else okay?
	if ( Npc_KnowsInfo ( other , DIA_Bullco_WASNUN ) )
	{
		AI_Output(self,other, " DIA_BullcoDJG_WARTEMAL_06_01 " );	// Don't get on my nerves.
	}
	else
	{
		AI_Output(self,other, " DIA_BullcoDJG_WARTEMAL_06_02 " );	// Not now! I am freezing! I want to get out of here as quickly as possible.
	};
	AI_StopProcessInfos(self);
};

instance DIA_Bullco_SYLVIODEAD(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 7;
	condition = DIA_Bullco_SYLVIODEAD_Condition;
	information = DIA_Bullco_SYLVIODEAD_Info;
	important = TRUE;
};

func int DIA_Bullco_SYLVIODEAD_Condition()
{
	if ((Npc_IsDead(DJG_Sylvio) ==  TRUE ) && (SylvioCampUp ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Bullco_SYLVIODEAD_Info()
{
	AI_Output(self,other, " DIA_Bullco_SYLVIODEAD_06_00 " );	// Damn! Silvio is dead.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instances DIA_Bullco_SYLVIODOWN (C_Info)
{
	npc = DJG_701_Bullco;
	nr = 7;
	condition = DIA_Bullco_SYLVIODOWN_Condition;
	information = DIA_Bullco_SYLVIODOWN_Info;
	important = TRUE;
};

func int DIA_Bullco_SYLVIODOWN_Condition()
{
	if ((Npc_IsDead(DJG_Sylvio) ==  FALSE ) && (SylvioCampUp ==  FALSE ) && (Npc_KnowsInfo(hero,DIA_SylvioDJG_WHATNEXT) ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Bullco_SYLVIODOWN_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Bullco_WASNUN (C_Info) .
{
	npc = DJG_701_Bullco;
	nr = 8;
	condition = DIA_Bullco_WASNUN_Condition;
	information = DIA_Bullco_WASNUN_Info;
	description = " What are you planning to do next? " ;
};

func int DIA_Bullco_WASHING_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bullco_SYLVIODEAD ) && Npc_IsDead ( DJG_ Sylvio ) )
	{
		return TRUE;
	};
};

func void DIA_Bullco_WASNUN_Info()
{
	AI_Output(other,self, " DIA_Bullco_WASNUN_15_00 " );	// What are you going to do now that Silvio is dead?
	AI_Output(self,other, " DIA_Bullco_WASNUN_06_01 " );	// I have no idea! I think we need to find other dragon hunters if they still need me.
	Info_AddChoice(DIA_Bullco_WASNUN, " I should rip your head off. " ,DIA_Bullco_WASNUN_kopfab);
	Info_AddChoice(DIA_Bullco_WASNUN, " Where is it, what is it? " ,DIA_Bullco_WASNUN_woandere);
};

func void DIA_Bullco_WASNUN_woandere()
{
	AI_Output(other,self, " DIA_Bullco_WASNUN_woandere_15_00 " );	// Do you know where the others are?
	AI_Output(self,other, " DIA_Bullco_WASNUN_woandere_06_01 " );	// I think so. I saw one of them by the river over there.
	Info_AddChoice(DIA_Bullco_WASNUN, " Take me to other dragon hunters. " ,DIA_Bullco_WASNUN_woandere_zuihnen);
};

func void DIA_Bullco_WASNUN_woandere_zuyoun()
{
	AI_Output(other,self, " DIA_Bullco_WASNUN_woandere_zuihnen_15_00 " );	// Take me to the other dragon hunters.
	AI_Output(self,other, " DIA_Bullco_WASNUN_woandere_zuihnen_06_01 " );	// Hey, I'm not your lackey.
	Info_ClearChoices(DAY_Bullco_WASNUN);
	Info_AddChoice(DIA_Bullco_WASNUN, " How do you know? " ,DIA_Bullco_WASNUN_where else_to_you_alone);
	Info_AddChoice(DIA_Bullco_WASNUN, " Rejoice if I let you live. " ,DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen);
	Info_AddChoice(DIA_Bullco_WASNUN, " I'll pay you fifty gold pieces for this! " ,DIA_Bullco_WASNUN_woandere_zuihnen_Geld);
};

func void DIA_Bullco_WASNUN_woandere_zuSiehnen_haben()
{
	AI_Output(other,self, " DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00 " );	// Rejoice if I let you live.
	AI_Output(self,other, " DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01 " );	// Get off me!
	AI_StopProcessInfos(self);
};

func void DIA_Bullco_WASNUN_woandere_zuyouhnen_geld()
{
	AI_Output(other,self, " DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00 " );	// I'll pay you fifty gold pieces for this!

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other, " DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01 " );	// Good! Give them here.
		AI_Output(self,other, " DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02 " );	// Follow me. I will take you to where I last saw other dragon hunters.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DJGVorposten");
	}
	else
	{
		AI_Output(self,other, " DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03 " );	// You don't have fifty gold coins, and I won't buy this nonsense! Get out.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bullco_WASNUN_woandere_zuyoun_alone()
{
	AI_Output(other,self, " DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00 " );	// How do you know! I will find them myself.
	AI_Output(self,other, " DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01 " );	// Just don't get lost.
	AI_StopProcessInfos(self);
};

func void DIA_Bullco_WASNUN_kopfab()
{
	AI_Output(other,self, " DIA_Bullco_WASNUN_kopfab_15_00 " );	// I should rip your head off.
	AI_Output(self,other, " DIA_Bullco_WASNUN_kopfab_06_01 " );	// Shut your mouth!
	Info_AddChoice(DIA_Bullco_WASNUN, " Draw your weapon! We'll end this here and now. " ,DIA_Bullco_WASNUN_kopfab_angriff);
};

func void DIA_Bullco_WASNUN_kopfab_attack()
{
	AI_Output(other,self, " DIA_Bullco_WASNUN_kopfab_angriff_15_00 " );	// Draw your weapon! We will end this here and now.
	AI_Output(self,other, " DIA_Bullco_WASNUN_kopfab_angriff_06_01 " );	// So be it.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Bullco_PICKPOCKET(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 900;
	condition = DIA_Bullco_PICKPOCKET_Condition;
	information = DIA_Bullco_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Bullco_PICKPOCKET_Condition()
{
	return  C_Robbery ( 34 , 65 );
};

func void DIA_Bullco_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bullco_PICKPOCKET);
	Info_AddChoice(DIA_Bullco_PICKPOCKET,Dialog_Back,DIA_Bullco_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bullco_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Bullco_PICKPOCKET_DoIt);
};

func void DIA_Bullco_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Bullco_PICKPOCKET);
};

func void DIA_Bullco_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bullco_PICKPOCKET);
};
