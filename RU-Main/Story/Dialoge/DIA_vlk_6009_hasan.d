

instance DIA_HASAN_EXIT(C_Info)
{
	npc = vlk_6009_hasan;
	nr = 999;
	condition = dia_hasan_exit_condition;
	information = dia_hasan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hasan_exit_condition()
{
	return TRUE;
};

func void dia_hasan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HASAN_HELLO (C_Info)
{
	npc = vlk_6009_hasan;
	nr = 1;
	condition = dia_hasan_hello_condition;
	information = dia_hasan_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " What are you doing here? " ;
};


func int dia_hasan_hello_condition()
{
	if ( MEETHASAN  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_hasan_hello_info()
{
	AI_Output(other,self, " DIA_Hasan_Hello_01_01 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Hasan_Hello_01_02 " );	// What, what... (angrily) Can't you see?
	AI_Output(self,other, " DIA_Hasan_Hello_01_03 " );	// Guarding the warehouse with our stocks of food and other junk.
	AI_Output(other,self, " DIA_Hasan_Hello_01_04 " );	// And what, there are thieves here?
	AI_Output(self,other, " DIA_Hasan_Hello_01_05 " );	// No, there are no thieves here. But if this is not done, then no one will deny themselves the pleasure of filling their belly with plenty of supplies that are designed for a week or a month in one sitting!
	AI_Output(self,other, " DIA_Hasan_Hello_01_06 " );	// The food here isn't very good, so we have to limit the guys a bit. Yes, they themselves understand this, but the temptation is great! (laughs)
	AI_Output(self,other, " DIA_Hasan_Hello_01_07 " );	// Yes, and to make a reserve for the future - also does not hurt. Who knows what awaits us next.
	AI_Output(other,self, " DIA_Hasan_Hello_01_08 " );	// Got it. And you're on duty here all the time?
	AI_Output(self,other, " DIA_Hasan_Hello_01_09 " );	// Yes, most of the day. True, sometimes Nash replaces me. But you can trust him - he is a reliable guy.
	MEETHASAN = TRUE ;
};


instance DIA_HASAN_HELLO_TEACH(C_Info)
{
	npc = vlk_6009_hasan;
	nr = 1;
	condition = dia_hasan_hello_teach_condition;
	information = dia_hasan_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = " You're selling something. " ;
};


func int dia_hasan_hello_teach_condition()
{
	if (( READYTEACH  ==  TRUE ) && ( READYTEACH  ==  TRUE ) && ( READYTEACH  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hasan_hello_teach_info()
{
	AI_Output(other,self, " DIA_Hasan_Hello_Teach_01_01 " );	// Ruen said you could sell me some stuff.
	AI_Output(self,other, " DIA_Hasan_Hello_Teach_01_02 " );	// Yes, I can offer you a couple of things if you have a couple of gold coins. Naturally, this does not apply to food and drink.
	AI_Output(other,self, " DIA_Hasan_Hello_Teach_01_03 " );	// Why do you need gold here?! There is nowhere to even spend it.
	AI_Output(self,other, " DIA_Hasan_Hello_Teach_01_04 " );	// You're right, of course, we don't need it here. But we still do not leave the thought that someday we will be able to get out of here. Therefore, gold can be useful to us.
	AI_Output(self,other, " DIA_Hasan_Hello_Teach_01_05 " );	// Then the guys who go hunting sometimes find gold and can always exchange it here for something useful.
	AI_Output(self,other, " DIA_Hasan_Hello_Teach_01_06 " );	// So if you're interested, you can look around for something yourself.
	HASANREADYTEACH = TRUE;
};


DIA_HASAN_TRADE (C_Info) instances
{
	npc = vlk_6009_hasan;
	nr = 99;
	condition = dia_hasan_trade_condition;
	information = dia_hasan_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};


func int dia_hasan_trade_condition()
{
	if((MEETHASAN == TRUE) && (HASANREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_hasan_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Hasan_Trade_01_01 " );	// Show me your products.
	AI_Output(self,other,"DIA_Hasan_Trade_01_02");	//Выбирай.
	B_GiveTradeInv(self);
};

