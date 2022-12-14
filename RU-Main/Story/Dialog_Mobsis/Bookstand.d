
func void Use_Bookstand_Pyrokar_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if (BookBonus_155 ==  FALSE )
		{
			if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print( " Intelligence + 1 " );
			};
			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};

			BookBonus_155 = TRUE ;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " Holy duty " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID, 0 , " A magician is not like ordinary people. He has the ability to influence the divine power, and therefore is not subject to the laws of nature, which every mortal obeys. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " When the magician reaches the level that allows him to rise above the limits of ordinary existence, he can enter another world unknown to mere mortals. The magician can break through the boundaries of time and space, and even death, the basis of all existence, cannot will be able to stop him. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if((hero.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FireContest,LOG_Running);
			B_LogEntry(TOPIC_FireContest, " As a novice, I am eligible for the fire test. In doing so, each of the three high council mages will give me one test. If I pass three tests, I will be accepted into the Circle of Fire. " );
			RankPoints = RankPoints + 1;
		};
		if (BookBonus_83 ==  FALSE )
		{
			if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print( " Intelligence + 1 " );
			};
			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};

			BookBonus_83 = TRUE ;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " Trial of Fire " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID, 0 , " Before becoming a magician, a novice must pass a test called the TEST OF FIRE. This is a very difficult and dangerous test that not everyone can master. If he thoroughly considered the decision to pass the test and insists on it, then he may demand a test, and no magician has the right to refuse him. If he insists before the high council, then he is guaranteed a TEST OF FIRE. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " This test requires the acolyte to use all his wits, strength, and skill. He must pass three trials, each set by a high council mage, before he can swear an oath to the fire and enter the Circle of Fire. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Such is the will of Innos and so be it. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Supreme Council " );
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Andre_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Log - " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID, 0 , " ...do your duty without thinking about the outcome! Do your duty, whether it brings you happiness or misfortune... " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");

		if (Rengaru_Ausgeliefert ==  TRUE )
		{
			Doc_PrintLines(nDocID, 1 , " ...prisoner Rengaru is accused of stealing. " );
		};
		if (Halvor_Ausgeliefert ==  TRUE )
		{
			Doc_PrintLines(nDocID, 1 , " ...prisoner Halvor is accused of stealing. " );
		};
		if (Nagur_Ausgeliefert ==  TRUE )
		{
			Doc_PrintLines(nDocID, 1 , " ...prisoner Nagur is accused of murder. " );
		};
		if (( CANTHAR_Ausgeliefert2  ==  TRUE ) || ((KnowCantarFree ==  FALSE ) && (Canthar_Ausgeliefert ==  TRUE )))
		{
			Doc_PrintLines(nDocID, 1 , " ...prisoner Kantar is accused of forgery. " );
		};
		if ((Sarah_Ausgeliefert ==  TRUE ) && ( SARAISFREE  ==  FALSE ))
		{
			Doc_PrintLines(nDocID, 1 , " ...imprisoned Sarah is accused of treason. " );
		};
		if ((Chapter ==  3 ) && (MY_RescueBennet !=  LOG_SUCCESS ))
		{
			Doc_PrintLines(nDocID, 1 , " ...Prisoner Bennet is charged with murder. " );
		};
		if((HANNAISKNAST == TRUE) && (HANNAISFREE == FALSE))
		{
			Doc_PrintLines(nDocID, 1 , " ...prisoner Hannah is accused of stealing. " );
		};
		if((GASPARPISSOFF == TRUE) && (HANNAISFREE == TRUE))
		{
			Doc_PrintLines(nDocID, 1 , " ...prisoner Gaspar is accused of stealing. " );
		};

		Doc_Show(nDocID);
	};
};

var int FinalDragonEquipment_Once;
var int GiveInnosTearPal;

func void Use_FINALDRAGONEQUIPMENT_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;

	her = Hlp_GetNpc(PC_Hero);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) && (ItWr_HallsofIrdorathIsOpen == TRUE))
	{
		if(FinalDragonEquipment_Once == FALSE)
		{
			B_GivePlayerXP(XP_FinalDragonEquipment);
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};
			if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_GUR ))
			{
				Wld_InsertItem(ITPO_PERM_MANA,"FP_ITEM_PALFINALARMOR");
				Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_PALFINALSTUFF");
			}
			else
			{
				if(hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
				{
					Wld_InsertItem(ItPo_Perm_STR,"FP_ITEM_PALFINALARMOR");
				}
				else
				{
					Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_PALFINALARMOR");
				};

				Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_PALFINALSTUFF");
			};

			FinalDragonEquipment_Once = TRUE;
			Wld_SendTrigger("EVT_DOOR_PALSECRETCHAMBER");
		}
		else
		{
			rnd = Hlp_Random( 100 );

			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}	
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_84 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_84 = TRUE ;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " ...I hope the magical barrier will keep the ore safe from the orcs! The king is almost ready to believe that we're only building it to keep prisoners from escaping. No, with this we achieve something more important targets. I hope we have enough time to prepare for the main battle. " );
		Doc_PrintLines(nDocID,0,"");

		if((hero.guild == GIL_KDF) && (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == FALSE))
		{
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE;
			PLAYER_TALENT_RUNES_MOF = TRUE;
			B_LogEntry(TOPIC_TalentRunes, " Ingredients for the Gaze of Innos rune: 'Tears of Innos', holy water and runestone " );
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " ...I sprayed the runestone with 'Tears of Innos' and holy water as instructed, but the runestone shattered. I think only a select few can cast this spell! " );
			Doc_PrintLines(nDocID, 1 , " 'Innos' Tears' could play an important role in the upcoming battle. But it's dangerous enough to keep them in plain sight. I'll leave them here in the library. " );
			Doc_PrintLines(nDocID, 1 , " Also, don't forget about Innos's Aura! " );
			Doc_Show(nDocID);
			Wld_InsertItem(ItPo_PotionOfDeath_01_Mis,"FP_ITEM_PALFINALWEAPON");
		}
		else if((hero.guild == GIL_PAL) && (GiveInnosTearPal == FALSE))
		{
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " ...I think 'Tears of Innos' can be used not only by Fire Mages, but also by paladins! " );
			Doc_PrintLines(nDocID, 1 , " Perhaps by covering their consecrated weapons with them, they will increase their power many times over. " );
			Doc_Show(nDocID);
			Wld_InsertItem(ItPo_PotionOfDeath_01_Mis,"FP_ITEM_PALFINALWEAPON");	
			GiveInnosTearPal = TRUE;
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
		}
		else if((hero.guild == GIL_DJG) && (PlayergetsFinalDJGArmor == FALSE))
		{
			PlayergetsFinalDJGArmor = TRUE;
		}
		else
		{
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void use_bookazgolor_01_s1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWS_AZGOGLOR_SUMMON == FALSE)
		{
			KNOWS_AZGOGLOR_SUMMON = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(READ_AZGOLOR == FALSE)
			{
				B_LogEntry( TOPIC_URNAZULRAGE , " In the abandoned crypt Ruen told me about, I came across a very strange book. It described an ancient ritual using some kind of magic spell. Apparently, this ritual was used to summon some powerful creatures - the Great Shadow. In the farthest part of the Valley of Shadows there is a circle of runes where it is apparently possible to perform this ritual. " );
				) ; _ _ _ _ _
			}
			else
			{
				B_LogEntry( TOPIC_URNAZULRAGE , " In the abandoned crypt Ruen told me about, I came across a very strange book. It described an ancient ritual using some kind of magic spell. Apparently, this ritual was used to summon some powerful creature - the Great Shadow. Now I know exactly how to make Azgalor crawl out of his lair and fight me. In the farthest part of the Valley of Shadows there is a circle of runes where I will have to perform this ritual. " );
				B_LogEntry( TOPIC_URNAZULRAGE , " Also, strange words were written in the book, similar to a spell - ...BEKAN IN SHOKAN ETAR MARDOK - FAHAT UR KRATAR TEKAN MOR... Judging by everything, these are the Words of POWER, which were spoken of in the book of demons. " );
			};
		};
		if((BookBonus_85 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_85 = TRUE ;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Shadow Ritual " );
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID, 0 , " This ritual allows you to summon to this world one of the most sinister creatures of darkness - the Great Shadow, the powerful black dragon of Azgalor. Anyone who truly intends to bring true evil into this world must first of all possess an ancient artifact - the Eye of Wrath , the call of which all creatures of darkness obey. Laying it at the base of the ritual stone and uttering magic spells known as Words of Power - performing the ritual, will call the Great Shadow by the will of the Eye into this world. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " ...BEKAN IN SHOKAN ETAR MARDOK - FAHAT UR KRATAR TEKAN MOR... " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

instance ItWr_HolyArrows(C_Item)
{
	name = " Recipe " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_bookstandholyarrows;
	scemeName = "MAP";
	description = " Holy Arrow " ;
	text[ 4 ] = " Describes how to craft consecrated arrows and bolts... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_bookstandholyarrows()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID, 0 , " Consecration " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Holy water is believed to have unique healing properties for all living creatures. However, its use can lead to the opposite effect, if you use the effect of holy water on all kinds of undead - this is the best way to destroy such creatures! For for such targets it is better to use illuminated arrows. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " To create consecrated arrows, you need one vial of holy water per five arrows. When creating the latter, sprinkle the tip of a simple arrow with holy water, and then say a prayer - ... (followed by the text of the prayer) " );
	Doc_Show(nDocID);

	if(MAKEHOLYARROWS == FALSE)
	{
		Log_CreateTopic(TOPIC_HOLYARROWS,LOG_NOTE);
		AI_Print( " Learned crafting recipe - 'Sacred Arrows and Bolts' " );
		B_LogEntry( TOPIC_HOLYARROWS , " Now I can make consecrated arrows. They are very useful against all kinds of evil spirits. " );
		MAKEHOLYARROWS = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_86 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_86 = TRUE ;
	};
};

func void use_bookstandxranfreg_s1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " Log " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"-----------");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " During a research expedition to the mountains of Khorinis, we discovered an ancient temple. Even before we crossed its threshold, we immediately felt a strange flow of very strong magical energy! " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " We tried to get inside, but there was a loud crash and a stone giant of incredible size appeared ahead! With one blow, he killed three paladins. We all fled, since our magic was powerless against him... " ) ;
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Пирокар");
		Doc_Show(nDocID);

		if ( MIS_XRANFREG  ==  FALSE )
		{
			MIS_XRANFREG = LOG_Running;
			Log_CreateTopic(TOPIC_XRANFREG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_XRANFREG,LOG_Running);
			B_LogEntry( TOPIC_XRANFREG , " From a book in the basement of the monastery, I learned about some ancient expedition of the Fire Mages. It mentions the name - Pyrocar! I should find out more about this ... " );
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};
		}	
		else
		{
			rnd = Hlp_Random( 100 );
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};	
		if((BookBonus_144 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_144 = TRUE ;
		};
	};
};

func void Use_Bookstand_Druid_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(Druid_01 == FALSE)
		{
			B_GivePlayerXP(250);
			Druid_01 = TRUE;
			Snd_Play("Levelup");
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};
		}
		else
		{
			rnd = Hlp_Random( 100 );
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_154 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_154 = TRUE ;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " When plants and animals changed their former essence, the living began to fear them. But Adanos appealed to the wise and instructed that evil can be turned into good, and poison into medicine. He warned them and frightened them with the wrath of the three gods, so that wisdom was not turned into evil and medicine was not made poison. But not everyone resisted the temptation. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Druids penetrated the secrets of plants. Their knowledge helps alchemists turn poison into potions. By the will of the druids, a forest grows in a few days where there were bushes, and bushes where there was a desert. But such a creation is available to druids once or two in a lifetime. Helping the druids in their forests are ancients - half-animated trees that can move like golems. " );
		Doc_Show(nDocID);
	};
};
