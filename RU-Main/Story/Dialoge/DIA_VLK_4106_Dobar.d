


instance DIA_Dobar_EXIT(C_Info)
{
	npc = VLK_4106_Good;
	nr = 999;
	condition = DIA_Dobar_EXIT_Condition;
	information = DIA_Dobar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dobar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dobar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dobar_HELLO (C_Info)
{
	npc = VLK_4106_Good;
	nr = 2;
	condition = DIA_Dobar_HALLO_Condition;
	information = DIA_Dobar_HELLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dobar_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dobar_HELLO_Info()
{
	AI_Output(self,other, " DIA_Dobar_HALLO_08_00 " );	// What do you need?!
};


instance DIA_Dobar_Talent (C_Info)
{
	npc = VLK_4106_Good;
	nr = 3;
	condition = DIA_Dobar_Talent_Condition;
	information = DIA_Dobar_Talent_Info;
	permanent = FALSE;
	description = " I know a little blacksmithing. " ;
};


func int DIA_Dobar_Talent_Condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dobar_Talent_Info()
{
	AI_Output(other, self, " DIA_Dobar_Talent_15_00 " );	// I know a little blacksmithing.
	AI_Output(self,other, " DIA_Dobar_Talent_08_01 " );	// Ok... so what?
};


instance DIA_Dobar_Schmiede (C_Info)
{
	npc = VLK_4106_Good;
	nr = 3;
	condition = DIA_Dobar_Schmiede_Condition;
	information = DIA_Dobar_Schmiede_Info;
	permanent = FALSE;
	description = " Can I use your forge? " ;
};


func int DIA_Dobar_Schmiede_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Dobar_Talent ))
	{
		return TRUE;
	};
};

func void DIA_Dobar_Schmiede_Info()
{
	AI_Output(other,self, " DIA_Dobar_Schmiede_15_00 " );	// Can I use your forge?
	AI_Output(self,other, " DIA_Dobar_Schmiede_08_01 " );	// I have a lot of work to do. We will only interfere with each other. Better wait until dark.
	AI_Output(self,other, " DIA_Dobar_Schmiede_08_02 " );	// Then Parlaf and I will go to sleep, and you can work in peace.
};

instance DIA_Dobar_Weapon (C_Info)
{
	npc = VLK_4106_Good;
	nr = 80;
	condition = DIA_Dobar_Waffe_Condition;
	information = DIA_Dobar_Weapon_Info;
	permanent = FALSE;
	description = " Can you make a weapon for me? " ;
};

func int DIA_Dobar_Waffe_Condition()
{
	return TRUE;
};

func void DIA_Dobar_Weapon_Info()
{
	AI_Output(other,self, " DIA_Dobar_Waffe_15_00 " );	// Can you make a weapon for me?
	AI_Output(self,other, " DIA_Dobar_Waffe_08_01 " );	// I don't have time for this. Tandor disposes of all the weapons - I only forge them, and Parlaf sharpens them.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, " Tandor sells weapons in the castle. " );
};

instance DIA_Dobar_NEWS (C_Info)
{
	npc = VLK_4106_Good;
	nr = 900;
	condition = DIA_Dobar_NEWS_Condition;
	information = DIA_Dobar_NEWS_Info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int DIA_Dobar_NEWS_Condition()
{
	return TRUE;
};

func void DIA_Dobar_NEWS_Info()
{
	AI_Output(other,self, " DIA_Dobar_NEWS_15_00 " );	// How's work?
	if (Dobar_unique ==  FALSE )
	{
		AI_Output(self,other, " DIA_Dobar_NEWS_08_01 " );	// I forge weapons for the knights of the castle. Since we arrived here, I have not left the forge.
		AI_Output(self,other, " DIA_Dobar_NEWS_08_02 " );	// This weapon will be very useful to us. We'll show those damn orcs yet!
		if (Npc_IsDead(Parlaf) ==  FALSE )
		{
			B_TurnToNpc(self,Parlaf);
			AI_Output(self,other, " DIA_Dobar_NEWS_08_03 " );	// (calling) Hey Parlaf - sharpen those swords better - orcs are damn strong opponents!
			B_TurnToNpc(self,other);
		};
		dobar_unique = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Dobar_NEWS_08_04 " );	// Could be better. If you hadn't constantly distracted me, the work would have progressed faster.
	};
};

instance DIA_DOBAR_ARMORCANTEACH (C_Info)
{
	npc = VLK_4106_Good;
	nr = 5;
	condition = dia_dobar_armorcanteach_condition;
	information = dia_dobar_armorcanteach_info;
	permanent = TRUE;
	description = " Are you good at forging armor? " ;
};


func int dia_dobar_armorcanteach_condition()
{
	if((DOBAR_TEACHARMOR == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_dobar_armorcanteach_info()
{
	AI_Output(other,self, " DIA_Dobar_ArmorCanTeach_01_00 " );	// Are you good at forging armor?
	AI_Output(self,other, " DIA_Dobar_ArmorCanTeach_01_01 " );	// Yes, I know a little about making them. Although, to be honest, forging weapons is more to my liking.
	AI_Output(other,self, " DIA_Dobar_ArmorCanTeach_01_02 " );	// Can you teach me how to upgrade armor?
	AI_Output(self,other, " DIA_Dobar_ArmorCanTeach_01_03 " );	// Well, since you're one of us, I could show you how to make your armor stronger and more reliable.
	AI_Output(self,other, " DIA_Dobar_ArmorCanTeach_01_04 " );	// But you should at least know a little about blacksmithing.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self, " DIA_Dobar_ArmorCanTeach_01_05 " );	// I'm a good blacksmith.
		AI_Output(self,other, " DIA_Dobar_ArmorCanTeach_01_07 " );	// That's good! I just want to warn you right away that everything has its price - including my lessons.
		AI_Output(self,other, " DIA_Dobar_ArmorCanTeach_01_08 " );	// Tell me when you're ready and we'll start training.
	}
	else
	{
		AI_Output(self,other, " DIA_Dobar_ArmorCanTeach_01_09 " );	// And apparently, you didn't even hold a blacksmith's hammer in your hands!
		AI_Output(self,other, " DIA_Dobar_ArmorCanTeach_01_10 " );	// I'll give you advice, kid. First learn how to forge, and then I will think about your request...
		AI_Output(self,other, " DIA_Dobar_ArmorCanTeach_01_11 " );	// And I want to warn you that everything has a price - including my lessons.
	};

	DOBAR_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ARMORTEACHER , " Dobar can teach me how to upgrade city militia armor. " );
};

func void b_dobar_teacharmor_1()
{
	AI_Output(self,other, " DIA_Dobar_TeachArmor_1_01_01 " );	// Okay, let's get started. Take all the necessary materials...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"OC_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Dobar_TeachArmor_1_01_02 " );	// ...on the anvil, add them in the desired sequence to the heated steel billet...
		AI_Output(self,other, " DIA_Dobar_TeachArmor_1_01_03 " );	// ...then give it the required shape and fasten it to the armor...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Dobar_TeachArmor_1_01_05");	//...вот и все!
	};
};

func void b_dobar_teacharmor_2()
{
	AI_Output(self,other, " DIA_Dobar_TeachArmor_2_01_01 " );	// Carefully remember everything that I will show you now. And as always, make sure you have all the forging materials on hand...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"OC_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Dobar_TeachArmor_2_01_02 " );	// ...take a hot steel billet and divide it into several equal parts...
		AI_Output(self,other, " DIA_Dobar_TeachArmor_2_01_03 " );	// ...mix each part in the right order with the next material...
		AI_Output(self,other, " DIA_Dobar_TeachArmor_2_01_04 " );	// ...and then you forge them into the frame of the existing armor, carefully forging the exit points...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Dobar_TeachArmor_2_01_05 " );	// ...and that's all!
	};
};

func void b_dobararmorchoices()
{
	Info_ClearChoices(dia_dobar_armorteach);
	Info_AddChoice(dia_dobar_armorteach,Dialog_Back,dia_dobar_armorteach_back);

	if(PLAYER_TALENT_SMITH[13] == FALSE)
	{
		Info_AddChoice(dia_dobar_armorteach, " Militia Armor (Training Cost: 600 Coins) " ,dia_dobar_armorteach_itar_mil_l_v1);
	};
	if((PLAYER_TALENT_SMITH[14] == FALSE) && (SHOW_ITAR_MIL_M == TRUE))
	{
		Info_AddChoice(dia_dobar_armorteach, " Heavy Militia Armor (Training Cost: 1200 coins) " ,dia_dobar_armorteach_itar_mil_m_v1);
	};
};

instance DIA_DOBAR_ARMORTEACH(C_Info)
{
	npc = VLK_4106_Good;
	nr = 5;
	condition = dia_dobar_armorteach_condition;
	information = dia_dobar_armorteach_info;
	permanent = TRUE;
	description = " Teach me how to upgrade my armor. " ;
};

func int dia_dobar_armorteach_condition()
{
	if(Npc_KnowsInfo(other,DIA_Dobar_Talent) && (Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (DOBAR_TEACHARMOR == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		if((PLAYER_TALENT_SMITH[14] == FALSE) || (PLAYER_TALENT_SMITH[13] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_dobar_armorteach_info()
{
	AI_Output(other,self, " DIA_Dobar_ArmorTeach_01_00 " );	// Teach me how to upgrade armor.
	if (Wld_IsTime( 8 , 0 , 20 , 0 ))
	{
		AI_Output(self,other, " DIA_Dobar_ArmorTeach_01_01 " );	// Okay, let's get started...
		b_dobararmorchoices();
	}
	else
	{
		AI_Output(self,other, " DIA_Dobar_ArmorTeach_01_02 " );	// Are you completely crazy, buddy? Now it's night! Wait for the morning, then come.
	};
};

func void dia_dobar_armorteach_back()
{
	Info_ClearChoices(dia_dobar_armorteach);
};

func void dia_dobar_armorteach_itar_mil_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 600)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,600);
			b_dobar_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Dobar_TeachArmor_01_00 " );	// (annoyed) Boy, don't try to fool me! Get the gold first...
	};
	b_dobararmorchoices();
};

func void dia_dobar_armorteach_itar_mil_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1200)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1200);
			b_dobar_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Dobar_TeachArmor_01_00 " );	// (annoyed) Boy, don't try to fool me! Get the gold first...
	};
	b_dobararmorchoices();
};


instance DIA_Dobar_WarGoods(C_Info)
{
	npc = VLK_4106_Good;
	nr = 3;
	condition = DIA_Dobar_WarGoods_Condition;
	information = DIA_Dobar_WarGoods_Info;
	permanent = FALSE;
	description = " Do you need help? " ;
};

func int DIA_Dobar_WarGoods_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Dobar_Talent ))
	{
		return TRUE;
	};
};

func void DIA_Dobar_WarGoods_Info()
{
	AI_Output(other,self, " DIA_Dobar_WarGoods_01_00 " );	// Need help?
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_01 " );	// Hmmm... (grouchily) I really could use some help right now.
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_02 " );	// Our guys sometimes have to shoot back from the orcs that roam near the battering ram.
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_03 " );	// And that requires bolts. Lots of bolts! But since the castle is surrounded by these creatures, then...
	AI_Output(other,self, " DIA_Dobar_WarGoods_01_04 " );	// ...then I must get the bolts for you. I'm right?
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_05 " );	// Don't interrupt me! I can make the bolts myself, but for this...
	AI_Output(other, self, " DIA_Dobar_WarGoods_01_06 " );	// ...needs steel. Guessed?
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_07 " );	// (annoyed) Beliar would take you, boy! Can you listen to the end at all?
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_08 " );	// I have a lot of steel! In addition, I learned how to smelt the weapons of the orcs killed by the paladins, and now there are no particular problems with it.
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_09 " );	// I need coal. His reserves in the castle are running out, and I need something to melt my forge every day.
	AI_Output(other,self, " DIA_Dobar_WarGoods_01_10 " );	// And where can I get this coal for you?
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_11 " );	// (grouchily) How should I know? But I think you can look for it in the old ore mines.
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_12 " );	// There should have been huge smelting furnaces. And to heat them up, it usually takes an incredible amount of coal.
	AI_Output(other,self, " DIA_Dobar_WarGoods_01_13 " );	// Got it. Then I'll take a look there.
	AI_Output(self,other, " DIA_Dobar_WarGoods_01_14 " );	// That's better...
	MIS_DobarCoal = LOG_Running;
	Log_CreateTopic(TOPIC_DobarCoal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DobarCoal,LOG_Running);
	) ; _ _ _
};

instance DIA_Dobar_WarGoods_Done(C_Info)
{
	npc = VLK_4106_Good;
	nr = 3;
	condition = DIA_Dobar_WarGoods_Done_Condition;
	information = DIA_Dobar_WarGoods_Done_Info;
	permanent = FALSE;
	description = " I brought you a huge bag of coal. " ;
};

func int DIA_Dobar_WarGoods_Done_Condition()
{
	if ((MY_CarryCoal == LOG_Running) && (Npc_HasItems(other, ITMI_COALBAG ) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Dobar_WarGoods_Done_Info()
{
	var int MoreCoal;

	AI_Output(other,self, " DIA_Dobar_WarGoods_Done_01_00 " );	// I brought you a huge bag of coal.

	if(Npc_HasItems(other,ITMI_COALBAG) == 1)
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(other,self,ITMI_COALBAG,1);
		Npc_RemoveInvItems(self,ITMI_COALBAG,1);
	}
	else  if ( Npc_HasItems ( other , ITMI_COALBAG ) >=  2 )
	{
		B_GivePlayerXP(1000);
		B_GiveInvItems(other,self,ITMI_COALBAG,2);
		Npc_RemoveInvItems(self,ITMI_COALBAG,2);
		MoreCoal = TRUE;
	};

	AI_Output(self,other, " DIA_Dobar_WarGoods_Done_01_01 " );	// Wow! How huge! And where did you manage to get it?
	AI_Output(other,self, " DIA_Dobar_WarGoods_Done_01_02 " );	// As you suspected, I found it in an old mine.
	AI_Output(self,other, " DIA_Dobar_WarGoods_Done_01_03 " );	// You see? My premonitions did not deceive me.
	AI_Output(self,other, " DIA_Dobar_WarGoods_Done_01_04 " );	// Thanks for your help, mate. For that, I'll give you some bolts from our stocks.

	if(MoreCoal == TRUE)
	{
		B_GiveInvItems(self,other,ItRw_Bolt,200);
	}
	else
	{
		B_GiveInvItems(self,other,ItRw_Bolt,100);
	};

	AI_Output(self,other, " DIA_Dobar_WarGoods_Done_01_06 " );	// Hope you find them useful if you ever decide to shoot some orcs.
	MIS_DobarCoal = LOG_Success;
	Log_SetTopicStatus(TOPIC_DobarCoal,LOG_Success);
	B_LogEntry(TOPIC_DobarCoal, " Dobar was satisfied with the amount of coal I brought. " );
};

var int DobarTeachOrcsWeapon;

instance DIA_Dobar_OrcsWeapon(C_Info)
{
	npc = VLK_4106_Good;
	nr = 3;
	condition = DIA_Dobar_OrcsWeapon_Condition;
	information = DIA_Dobar_OrcsWeapon_Info;
	permanent = FALSE;
	description = " Can you smelt orc weapons? " ;
};

func int DIA_Dobar_OrcsWeapon_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dobar_WarGoods))
	{
		return TRUE;
	};
};

func void DIA_Dobar_OrcsWeapon_Info()
{
	AI_Output(other,self, " DIA_Dobar_OrcsWeapon_01_00 " );	// Can you smelt orc weapons?
	AI_Output(self,other, " DIA_Dobar_OrcsWeapon_01_01 " );	// Had to learn! Otherwise, where do paladins get ammunition from?
	AI_Output(other,self, " DIA_Dobar_OrcsWeapon_01_02 " );	// Can you teach me this?
	AI_Output(self,other, " DIA_Dobar_OrcsWeapon_01_03 " );	// Well... why not?
	AI_Output(self,other, " DIA_Dobar_OrcsWeapon_01_05 " );	// But first, you'll have to master the process of smelting steel from iron ore.

	if(KNOWHOWTOOREFUS == TRUE)
	{
		AI_Output(other,self, " DIA_Dobar_OrcsWeapon_01_06 " );	// I already know this.
		AI_Output(self,other, " DIA_Dobar_OrcsWeapon_01_07 " );	// Good! The easier it will be for you...
		AI_Output(self,other, " DIA_Dobar_OrcsWeapon_01_08 " );	// But I want to warn you right away that I only accept magical ores as tuition fees.
	}
	else
	{
		AI_Output(self,other, " DIA_Dobar_OrcsWeapon_01_09 " );	// Without this knowledge, I can hardly help you.
		AI_Output(other,self, " DIA_Dobar_OrcsWeapon_01_10 " );	// I understand.
		AI_Output(self,other, " DIA_Dobar_OrcsWeapon_01_11 " );	// And one more thing. I only accept magical ores as tuition fees.
	};


	AI_Output(self,other, " DIA_Dobar_OrcsWeapon_01_12 " );	// We don't need gold here!
	DobarTeachOrcsWeapon = TRUE;
	B_LogEntry(TOPIC_Teacher_OC, " Dobar can teach me how to smelt orc weapons into ingots of steel. " );
};

instance DIA_Dobar_OrcsWeaponTeach(C_Info)
{
	npc = VLK_4106_Good;
	nr = 5;
	condition = DIA_Dobar_OrcsWeaponTeach_condition;
	information = DIA_Dobar_OrcsWeaponTeach_info;
	permanent = TRUE;
	description = " Teach me how to smelt orc weapons. (Training Points: 2, Cost: 10 Ore) " ;
};

func int DIA_Dobar_OrcsWeaponTeach_condition()
{
	if((DobarTeachOrcsWeapon == TRUE) && (OrcsWeaponSteel == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dobar_OrcsWeaponTeach_info()
{
	AI_Output(other,self, " DIA_Dobar_OrcsWeaponTeach_01_00 " );	// Teach me how to smelt orc weapons.

	if(KNOWHOWTOOREFUS == FALSE)
	{
		AI_Output(self,other, " DIA_Dobar_OrcsWeaponTeach_01_01 " );	// Until you are familiar with the technique of melting steel, you will not be able to learn it. Didn't I tell you?
	}
	else
	{
		if ((hero.lp >=  2 ) && (Npc_HasItems(other,ItMy_Nugget) >=  10 )) ;
		{
			AI_Output(self,other, " DIA_Dobar_OrcsWeaponTeach_01_02 " );	// Good. To get started, you need one of your own steel blanks.
			AI_Output(self,other, " DIA_Dobar_OrcsWeaponTeach_01_03 " );	// It is necessary so that all your subsequent discs are the same size.
			AI_Output(self,other, " DIA_Dobar_OrcsWeaponTeach_01_04 " );	// You should also be aware that Orc steel is nothing like ours. Orcs don't care too much about the purity of the alloy.
			AI_Output(self,other, " DIA_Dobar_OrcsWeaponTeach_01_05 " );	// Therefore, to get one good quality steel ingot, one of their ax or sword is not enough.
			AI_Output(self,other, " DIA_Dobar_OrcsWeaponTeach_01_06 " );	// It usually takes me about ten to make one blank.
			AI_Output(self,other, " DIA_Dobar_OrcsWeaponTeach_01_07 " );	// And most importantly - it is necessary to thoroughly evaporate various impurities from the alloy!
			AI_Output(self,other, " DIA_Dobar_OrcsWeaponTeach_01_08 " );	// Well, that's it, that's all.
			hero.lp = hero.lp - 2;
			RankPoints = RankPoints + 2;
			Npc_RemoveInvItems(hero,ItMi_Nugget,10);
			OrcsWeaponSteel = TRUE;
			AI_Print( " Studied : Weapon Smelting " );
			B_LogEntry( TOPIC_STEELDRAW , " Now I can smelt orc weapons. " );
			Snd_Play("LevelUP");
		}
		else
		{
			if(hero.lp < 2)
			{
				AI_Print(PRINT_NotEnoughLearnPoints);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Print(Print_NotEnoughOre);
				AI_Output(self,other, " DIA_Dobar_OrcsWeaponTeach_01_12 " );	// Man, where's the ore? Without it, I won't teach you.
			};
		};
	};
};
