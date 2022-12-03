

instance DIA_ORC_8563_URGROM_EXIT(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_exit_condition;
	information = dia_orc_8563_urgrom_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8563_urgrom_exit_condition()
{
	return TRUE;
};

func void dia_orc_8563_urgrom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8563_URGROM_HELLO_WAIT(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_hello_wait_condition;
	information = dia_orc_8563_urgrom_hello_wait_info;
	important = FALSE;
	permanent = TRUE;
	description = " Looks like I know you, ghost! " ;
};


func int dia_orc_8563_urgrom_hello_wait_condition()
{
	if((MEETURGROM == FALSE) && (BLKDRAGNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_hello_wait_info()
{
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_01 " );	// Looks like I know you, ghost! Your face... it seems familiar to me.
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_02 " );	// You... you must... well, yes... of course! Ur-Thunder!
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_03 " );	// ...Human talking Ur-Thunder? How does he know my name?
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_04 " );	// Your brother, Ur-Thrall told about you.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_05 " );	// Ur-Grom's brother... brother... brother... Ur-Thrall... (thinks)
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_06 " );	// Yes, think so.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_07 " );	// Have a brother a very long time ago, many winters ago. Ur-Grom remember brother Ur-Thrall!
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_08 " );	// Ur-Grom and brother fight together against their enemies, fight against the evil demon.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_09 " );	// Man to know Brother Ur-Grom?
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_10 " );	// Yes, I met your brother. I will say more, it is he who is the reason that made me appear here.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_11 " );	// Why would a person come here?
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_12 " );	// I'm here because Ur-Thrall wants revenge on Azgalor. To avenge my people, to avenge you and myself!
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_13 " );	// He didn't forget the terrible demon?!
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_14 " );	// Brother come to kill him?
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_15 " );	// No, Ur-Thrall cannot appear in the valley, otherwise the curse that Azgalor placed on all of you will take over him again.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_16 " );	// Human alone wants to kill a demon?!
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_18 " );	// Ur-Thunder think the man to be a very brave warrior. But a man cannot defeat a demon alone.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_19 " );	// Man to die, give spirit to the demon. The demon is very strong, very angry!
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_20 " );	// I've had to fight monsters like him more than once. I'll do it this time too.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_21 " );	// Don't know the strength of a demon! To think the demon is weak. To think that he is stronger than a demon.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_22 " );	// Ur-Thunder speak, man err! Many brothers want to kill the demon, but everyone is dead, everyone now serves him.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_23 " );	// Man needs help. Alone he die!
	B_LogEntry( TOPIC_URNAZULRAGE , " In an abandoned ghost orc camp, I met Ur-Thrall's dead brother, Ur-Grom. According to him, the black dragon Azgalor is a very powerful creature, and I cannot defeat him alone. " );
	self.name[ 0 ] = " Ur-Thunder, orc ghost " ;
	MEETURGROM = TRUE;
};


instance DIA_ORC_8563_URGROM_HELLO_HELP(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_hello_help_condition;
	information = dia_orc_8563_urgrom_hello_help_info;
	important = FALSE;
	permanent = TRUE;
	description = " Can you help me with something? " ;
};


func int dia_orc_8563_urgrom_hello_help_condition()
{
	if((MEETURGROM == TRUE) && (MEETURGROMNEXT == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_hello_help_info()
{
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_01 " );	// Can you help me destroy this creature?
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_02 " );	// Ur-Thunder think how he can help the man...
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_03 " );	// Want to go fight alongside a human against a demon! (angrily) Avenge for the brothers!
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_04 " );	// But it can't. Azgalor took the soul of Ur-Grom - Ur-Grom will die if you go against the demon.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_05 " );	// Man needs another helper... Think man needs to find TWARTAZDAH.
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_06 " );	// And what is this - DVARTAZDACH?
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_07 " );	// Be an ancient weapon! Great Spirit Warrior Weapon!
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_08 " );	// With it, a human can defeat a demon.
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_09 " );	// Where can I find this weapon?
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_10 " );	// Ur-Grom doesn't know for sure. Only to hear once about it from the sons of the spirit, but never to see it yourself.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_11 " );	// The man himself find TWARTAZDACH, bring it to Ur-Grom, and then go fight against the demon.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_12 " );	// If you find TWARTAZDACH, bring it to Ur-Grom. Then go fight against the demon.
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_13 " );	// Okay, I'll try to find this one... whatever it is...
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_14");	//ДВАРТАЗДАХ!
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_15");	//...точно, именно его.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Help_Info_01_16 " );	// Then the man go, Ur-Grom wait for him.
	; _ _ _ _ _ _
	MEETURGROMNEXT = TRUE;
};


instance DIA_ORC_8563_URGROM_HELLO_FIND(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_hello_find_condition;
	information = dia_orc_8563_urgrom_hello_find_info;
	important = FALSE;
	permanent = TRUE;
	description = " Is this the wrong weapon? " ;
};


func int dia_orc_8563_urgrom_hello_find_condition()
{
	if((Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1) && (MEETURGROMNEXT == TRUE) && (MEETURGROMCOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_hello_find_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Find_01_01 " );	// Isn't that the weapon you were talking about, by any chance?
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Find_01_02 " );	// Ur-Thunder think something. Man found TWARTAZDAH!!!
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Hello_Find_01_03 " );	// Now go kill the demon! Revenge for the brothers!
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Hello_Find_01_04 " );	// Then I went.
	B_LogEntry( TOPIC_URNAZULRAGE , " I found DVARTAZDAH, or rather the Executor - an ancient weapon of spirit warriors who once lived in these places... " );
	AI_StopProcessInfos(self);
	MEETURGROMCOME = TRUE;
	Npc_ExchangeRoutine(self,"UrGromGoBattle");
};


instance DIA_ORC_8563_URGROM_AZGOLOR_WAIT(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_azgolor_wait_condition;
	information = dia_orc_8563_urgrom_azgolor_wait_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_orc_8563_urgrom_azgolor_wait_condition()
{
	if((AZGOLORAPPEAR == TRUE) && (MEETURGROMCOME == TRUE) && (MEETURGROMEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_azgolor_wait_info()
{
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Azgolor_Wait_01_01 " );	// Demon be already here, wait man.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Azgolor_Wait_01_02 " );	// Man go on and meet the demon...
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Azgolor_Wait_01_03 " );	// Ur-Thunder watch as a man kill a demon.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Azgolor_Wait_01_04 " );	// Man don't forget to carry DVARTAZDAH!
	AI_Output(other,self, " DIA_Orc_8563_UrGrom_Azgolor_Wait_01_05 " );	// Of course.
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Azgolor_Wait_01_06 " );	// Ur-Thunder wish man good hunting.
	self.flags = 0;
	MEETURGROMEND = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8563_URGROM_AZGOLOR_WAIT_AGAIN(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_azgolor_wait_again_condition;
	information = dia_orc_8563_urgrom_azgolor_wait_again_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_orc_8563_urgrom_azgolor_wait_again_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MEETURGROMEND == TRUE) && (BLKDRAGNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_azgolor_wait_again_info()
{
	AI_Output(self,other, " DIA_Orc_8563_UrGrom_Azgolor_Wait_Again_01_01 " );	// Human go kill demon. Ur-Thunder wait for him here!
	AI_StopProcessInfos(self);
};

