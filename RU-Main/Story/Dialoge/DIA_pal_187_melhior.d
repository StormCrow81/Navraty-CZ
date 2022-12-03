

instance DIA_PAL_187_MELHIOR_EXIT(C_Info)
{
	npc = pal_187_melhior;
	nr = 999;
	condition = dia_pal_187_melhior_exit_condition;
	information = dia_pal_187_melhior_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_187_melhior_exit_condition()
{
	return TRUE;
};

func void dia_pal_187_melhior_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_FIRSTWARN(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_firstwarn_condition;
	information = dia_pal_187_melhior_firstwarn_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int dia_pal_187_melhior_firstwarn_condition()
{
	return TRUE;
};

func void dia_pal_187_melhior_firstwarn_info()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_FirstWarn_01_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Pal_187_Melhior_FirstWarn_01_01 " );	// (frightened) WHAT?! I?
	AI_Output(self,other, " DIA_Pal_187_Melhior_FirstWarn_01_02 " );	// none of your business. What the hell do you want from me?
	AI_Output(self,other, " DIA_Pal_187_Melhior_FirstWarn_01_03 " );	// Get out of here where you went.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other, " DIA_Pal_187_Melhior_FirstWarn_01_04 " );	// Well, what are you staring at? Come on, get lost...
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_SECONDWARN(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_secondwarn_condition;
	information = dia_pal_187_melhior_secondwarn_info;
	permanent = FALSE;
	description = " Shouldn't you be on duty, warrior? " ;
};


func int dia_pal_187_melhior_secondwarn_condition()
{
	if(Npc_KnowsInfo(other,dia_pal_187_melhior_firstwarn))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_secondwarn_info()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_SecondWarn_01_00 " );	// Aren't you supposed to be on duty?
	AI_Output(self,other, " DIA_Pal_187_Melhior_SecondWarn_01_01 " );	// You again?! You're getting on my nerves!
	AI_Output(self,other, " DIA_Pal_187_Melhior_SecondWarn_01_02 " );	// Get off to Beliar! And don't bother me drinking here.
	AI_Output(self,other, " DIA_Pal_187_Melhior_SecondWarn_01_03 " );	// Or I'll wean you from such things.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other, " DIA_Pal_187_Melhior_SecondWarn_01_04 " );	// (hiccups) Got it?
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_LASTWARN (C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_lastwarn_condition;
	information = dia_pal_187_melhior_lastwarn_info;
	permanent = FALSE;
	description = " I wonder what Lord Hagen will say to that? " ;
};


func int dia_pal_187_melhior_lastwarn_condition()
{
	if(Npc_KnowsInfo(other,dia_pal_187_melhior_secondwarn))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_lastwarn_info()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_LastWarn_01_00 " );	// Yes, you're drunk as a shoemaker! I wonder what Lord Hagen will say to that?
	AI_Output(self,other, " DIA_Pal_187_Melhior_LastWarn_01_01 " );	// WHAT?! Are you still going to threaten me?
	AI_Output(self,other, " DIA_Pal_187_Melhior_LastWarn_01_02 " );	// Yes, I did not care about the opinion of all the Hagens from the high bell tower.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other, " DIA_Pal_187_Melhior_LastWarn_01_03 " );	// But you, cretin, didn't listen to me.
	AI_Output(self,other, " DIA_Pal_187_Melhior_LastWarn_01_04 " );	// So now I'll show you how to mess with me.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_PAL_187_MELHIOR_PAYBACKOK(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_paybackok_condition;
	information = dia_pal_187_melhior_paybackok_info;
	permanent = FALSE;
	description = " You don't deserve to be a paladin! " ;
};


func int dia_pal_187_melhior_paybackok_condition()
{
	if (( self . aivar [ AIV_LastFightAgainstPlayer ] ==  FIGHT_LOST ) && Npc_KnowsInfo( hero , dia_pal_187_melhior_lastwarn )) .
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_paybackok_info()
{
	if(Npc_HasEquippedWeapon(self) == FALSE)
	{
		CreateInvItems(self,ItMw_1h_Pal_Sword,1);
		EquipItem(self,ItMw_1h_Pal_Sword);
	};
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_01_00 " );	// You don't deserve to be a paladin!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_01_01 " );	// With your behavior, you dishonor the entire order!
		AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_01_02 " );	// I think I should still talk to Lord Hagen.
	}
	else
	{
		AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_01_04 " );	// With your behavior, you dishonor the entire order!
		AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_01_05 " );	// I think I should still talk to Lord Hagen.
	};
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_01_07 " );	// What? (scared) No, don't! Please don't do this! Only not this!
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_01_08 " );	// Why shouldn't I?
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_01_09 " );	// You have no idea what it's like to be expelled from an order!
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_01_10 " );	// After that, my life will become unbearable.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_01_11 " );	// Everyone around me will begin to despise me, and this is only a small part of the disasters that await me!
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_01_12 " );	// If you want, I can even give you money. Much money!
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
	if((TELLABOUTDS == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running))
	{
		Info_AddChoice(dia_pal_187_melhior_paybackok, " I need info. " ,dia_pal_187_melhior_paybackok_inform);
	};
	Info_AddChoice(dia_pal_187_melhior_paybackok, " Money is useless here. " ,dia_pal_187_melhior_paybackok_gotcha);
	Info_AddChoice(dia_pal_187_melhior_paybackok, " How much will you pay if I let you go? " ,dia_pal_187_melhior_paybackok_money);
};

func void dia_pal_187_melhior_paybackok_money()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Money_01_00 " );	// How much will you pay if I let you go?
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Money_01_01 " );	// I'll give you a whole hundred gold coins!
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Money_01_02 " );	// Well, did we agree?
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I think I missed my chance to learn more about the Triramar amulet. Mora Ulartu can be forgotten now. " );
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Этого мало!",dia_pal_187_melhior_paybackok_notok);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Хорошо!",dia_pal_187_melhior_paybackok_ok);
};

func void dia_pal_187_melhior_paybackok_notok()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_NotOk_01_00 " );	// Are you laughing at me?
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_NotOk_01_02 " );	// But that's all I have!
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_NotOk_01_04 " );	// Then I think Lord Hagen would be interested in learning about your exploits.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_NotOk_01_07 " );	// Okay, bastard! Do what you want.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_NotOk_01_08 " );	// But remember, I won't just leave it like that!
	MELHIORPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pal_187_melhior_paybackok_ok()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Ok_01_00 " );	// Okay, give them here.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Ok_01_03 " );	// About Innos. It's great that you agreed!
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Ok_01_04 " );	// Here, take my money.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Ok_01_05 " );	// I'll give you advice for the future: either stop drinking, or better hide.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Ok_01_06 " );	// Yes, of course! (smiling ingratiatingly)
	AI_StopProcessInfos(self);
};

func void dia_pal_187_melhior_paybackok_gotcha()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_00 " );	// Money is useless here. The guards will take care of you!
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_01 " );	// I think Lord Hagen would be interested in learning about your exploits.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_04 " );	// Okay, bastard! Do what you want.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_05 " );	// But remember, I won't just leave it like that!
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I think I missed my chance to learn more about the Triramar amulet. Mora Ulartu can be forgotten now. " );
	MELHIORPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pal_187_melhior_paybackok_inform()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_00 " );	// I need information.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_01 " );	// Of course! And what do you want to know?
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_02 " );	// I'm interested in the fate of one amulet.
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_03 " );	// As far as I know, he's been with the paladins lately.
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_04 " );	// The amulet is called Triramar. Have you heard of such a thing?
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_05 " );	// T-t-triramar? (horrified) I... yes, I've heard of him.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_06 " );	// But I can't tell you. This is a sacred secret.
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_08 " );	// Spread everything you know about him before I pay a courtesy call to Lord Hagen!
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_11 " );	// Okay... I'll tell you everything I know:
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_12 " );	// ...(reluctantly) I know this amulet is kept on the island of Etlu.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_14 " );	// This is an island in the south of the mainland - I can’t say more precisely ...
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_18 " );	// Okay, tell me, how can I get there, to this island?
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_25 " );	// I overheard Lord Hagen ordering the mages from the monastery to 'find' the portal to Etla.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_26 " );	// I know they succeeded, and I know that... the (controversial) key to the portal is kept by Hagen himself.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Inform_01_31 " );	// why do you need all that you have now extorted from me?
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I managed to find out that the paladins hid the Amulet of Triramar on the island of Etlu. The only way to get there is through the paladins' magic portal, which is located here on the island. However, I did not manage to find out the exact place from Melchior. Everything else I will also need a key that will open the passage to the portal for me. According to Melchior, this key, apparently, is kept by Lord Hagen himself, and this makes it very difficult for me to get to Etla. " );
	ETLUBEGINS = TRUE;
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
	Info_AddChoice(dia_pal_187_melhior_paybackok, " Just wanted to know a little more about him. " ,dia_pal_187_melhior_paybackok_nothing);
	Info_AddChoice(dia_pal_187_melhior_paybackok, " I really need it. " ,dia_pal_187_melhior_paybackok_take);
};

func void dia_pal_187_melhior_paybackok_nothing()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Nothing_01_00 " );	// Raise my intelligence level.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Nothing_01_02 " );	// (relieved) A-ahh, otherwise it seemed to me ...
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Nothing_01_03 " );	// (interrupting) When it seems, Innos should pray. Come on, soldier!
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Nothing_01_04 " );	// Yeah, and you're happy... (confused)
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
};

func void dia_pal_187_melhior_paybackok_take()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Take_01_00 " );	// I really need it.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_01");	//Кто?! Амулет?
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_02 " );	// But he is evil in its purest form! Who might need it?
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_03 " );	// Unless... the one who sold his soul to Beliar!
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_Take_01_04 " );	// Don't talk nonsense!
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_05 " );	// No, no, now everything became clear to me: your perseverance, awareness...
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_06 " );	// I didn't expect this from a paladin!
	}
	else  if (hero.guild ==  GIL_MIL )
	{
		AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_07 " );	// I didn't expect this from a militia!
	}
	else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_08 " );	// I didn't expect this from a mage...
	}
	else if((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_09 " );	// What else can you expect from a stoned heretic?!
	}
	else  if (hero.guild ==  GIL_KDM )
	{
		AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_10 " );	// What else could you expect from a necromancer?!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_11 " );	// What else can you expect from a mercenary?!
	};
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_12 " );	// O Innos! What have I done. I told you everything.
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_13 " );	// But I will atone for my sin! Even at the cost of your life.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_Take_01_14 " );	// You won't get it, henchman of Beliar, never!	
	MELHIORPISSOFFKILL = TRUE;
	self.aivar[AIV_DropDeadAndKill] = TRUE ;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_PAL_187_MELHIOR_FUCKOFF(C_Info)
{
	npc = pal_187_melhior;
	nr = 10;
	condition = dia_pal_187_melhior_fuckoff_condition;
	information = dia_pal_187_melhior_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_187_melhior_fuckoff_condition()
{
	if((MELHIORPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_FUCKOFFKILL(C_Info)
{
	npc = pal_187_melhior;
	nr = 10;
	condition = dia_pal_187_melhior_fuckoffkill_condition;
	information = dia_pal_187_melhior_fuckoffkill_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_187_melhior_fuckoffkill_condition()
{
	if(MELHIORPISSOFFKILL == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_fuckoffkill_info()
{
	B_Say(self,other,"$KillEnemy");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_PAL_187_MELHIOR_HOWTHINGS(C_Info)
{
	npc = pal_187_melhior;
	nr = 10;
	condition = dia_pal_187_melhior_howthings_condition;
	information = dia_pal_187_melhior_howthings_info;
	permanent = TRUE;
	description = " So, are you all right? " ;
};


func int dia_pal_187_melhior_howthings_condition()
{
	if (( MELHIORPISSOFFKILL  ==  FALSE ) && ( MELHIORPISSOFF  ==  FALSE ) && Npc_KnowsInfo(other,dia_pal_187_melhior_paybackok))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_howthings_info()
{
	AI_Output(other,self, " DIA_Pal_187_Melhior_PayBackOk_HowThings_01_00 " );	// Well, is everything all right?
	AI_Output(self,other, " DIA_Pal_187_Melhior_PayBackOk_HowThings_01_01 " );	// Yes, everything is fine.
};

