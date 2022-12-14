
var int AshtarBookBonus_01;
var int AshtarBookBonus_02;
var int AshtarBookBonus_03;

var int AshtarBook_01;
var int AshtarBook_02;
var int AshtarBook_03;

func void Use_Bookstand_Addon_BL_S1()
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
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " Mine " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Crimson: 79 bars of gold received and melted " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Scutty: got 250 gold worth of goods " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Garats: got 6 ingots " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " All guards: got 9 ingots " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID, 1 , " Camp: " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Raven Guard: 25 gold " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Finn: 60 gold " );
		Doc_PrintLines(nDocID, 1 , " Lennar: 40 gold " );
		Doc_PrintLines(nDocID, 1 , " Emilio: 50 gold " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Others: 20 gold " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Huno, Fisk, Snaf: at the price of goods " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Hunters: The leader should take care! Franco got 7 ingots. " );
		Doc_Show(nDocID);
	};
};

func void use_bookstandfirecavetest_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " You who dare to challenge the Fire - know that a difficult test lies ahead of you. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " And only those who can defeat the True Spirit of Fire will pass it! " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
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
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READFIRECAVE == FALSE)
		{
			B_GivePlayerXP(100);
			READFIRECAVE = TRUE;
			B_LogEntry( TOPIC_KELIOSTEST , " It seems that in order to pass my test, I will have to find the true Spirit of Fire and defeat him! " );
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
		if((BookBonus_108 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_108 = TRUE ;
		};
	};
};

func void USE_BOOKIMARAH_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " He who seeks knowledge always finds it. Another question is what is the price of this knowledge... " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Now, I'm just wondering what my price will be? " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
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
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(READIMARAH == FALSE)
		{
			B_GivePlayerXP(200);
			READIMARAH = TRUE;
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
		if((BookBonus_157 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_157 = TRUE ;
		};
	};
};

var int BookstandMayaHierchary_1_permanent;
var int BookstandMayaHierchary_2_permanent;
var int BookstandMayaHierchary_3_permanent;
var int BookstandMayaHierchary_4_permanent;
var int BookstandMayaHierchary_5_permanent;
var int BookstandMayaArt;

func int C_CanReadBookStand()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		return TRUE;
	};

	return  FALSE ;
};

func void Use_BookstandMaya()
{
	if(BookstandMayaArt == 1)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " ... Because only SPIRIT KEEPERS could call the dead " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " ... The pain of their absence sits deep. Without the advice of our ancestors, we are left to the will of our people. " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " HEALERS have been sent to close the portal and destroy the key. Only Adanos knows what happened to them and if they achieved their goal. " );
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " WARRIORS are destroyed by the wrath of Adanos. The old warrior's heart is broken. " );
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " Only the remaining PRIESTS remain hopeful and pray unceasingly for the restoration of our once glorious city. " );
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " But we SCIENTISTS know the bitter truth. YARKENDAR has fallen and the sands of time will cover it. " );
		Doc_PrintLines(StPl_nDocID,1,"");

		if((BookBonus_109 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_109 = TRUE ;
		};
	}
	else if(BookstandMayaArt == 2)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " RADEMES was forever imprisoned in the temple, but the power of the sword was not broken. " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " His influence was already too great. The killing in the streets couldn't stop. " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " The wrath of ADANOS ended everything. The sea rose over JARKENDAR and swallowed him. " );
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " Only the high-lying temples and buildings remained largely intact. " );
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " The few who survived the disaster no longer had the strength to rebuild the city. " );
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " So the fate of YARKENDAR happened. " );
		if(SC_Knows_WeaponInAdanosTempel == FALSE)
		{
			SC_Knows_WeaponInAdanosTempel = TRUE;
		};
		if((BookBonus_110 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_110 = TRUE ;
		};
	}
	else if(BookstandMayaArt == 3)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " Quarchodron's age made it impossible for him to lead troops. And then the PRIESTS insisted on their right to give him orders. " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " They told him to leave his post and hand over the sword to his successor. " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " The Council of Five should have chosen his successor. But the Warrior caste denied the Council his choice. " );
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " The warriors no longer wanted to obey the Council and chose his son RADEMES as leader. " );
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " Quarhodron's pride and faith in his own flesh and blood convinced him to submit. " );
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " He gave the sword to his son in the hope that he would lead him with the same strong hand as he once did. " );

		if((BookBonus_111 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_111 = TRUE ;
		};
	}
	else if(BookstandMayaArt == 4)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " RADEMES was weak. The will of the sword conquered him and made him his tool. " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " The grief and suffering that he inflicted on the people in his blindness could not be cured even by healers. " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " The sword quickly figured out that the people were too weak to stop his plans. " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " Only the power of our ancestors could be dangerous for him. " );
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " And he ordered RADEMES to drive out or destroy all Spirit Keepers, and so the hope of our deliverance from this scourge perished. " );
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " And so there was not a single Guardian of Spirits left by the time the four disempowered leaders of our people came to the bitter decision to surrender JARKENDAR. " );
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " War raged in the streets, and healers were on their way to permanently close access to our valley. " );

		if((BookBonus_112 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_112 = TRUE ;
		};
	}
	else if(BookstandMayaArt == 5)
	{
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " QUARHODRON, High Priest HARDIMON and I have gathered within these walls for advice on how to defeat RADEMES and the sword. " );
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " QUARHODRON and HARDIMON wanted to defeat RADEMES with their combined forces in open combat. But I knew the power of the sword too well to believe it. " );
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID, 0 , " So I exercised my right to veto their decision. Instead, I decided to defeat RADEMES with cunning. " );
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " QUARHODRON followed the decision of the council. He went to the Temple of Adanos and sent for his son. " );
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " His son's hatred grew to such an extent that RADEMES took the temple wildly to deal with his father. " );
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " He only realized our plans when it was too late. " );
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID, 1 , " QUARHODRON closed the holy chambers of the temple behind him and RADEMES was imprisoned forever. " );
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"");

		if((BookBonus_113 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_113 = TRUE ;
		};
	};
};

func void InitUse_BookstandMaya()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Doc_Show(StPl_nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else if(C_CanReadBookStand())
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Use_BookstandMaya();
			Doc_Show(StPl_nDocID);
		};
	};
	BookstandMayaArt = 0;
};

func void Use_BookstandMayaHierchary_01_S1()
{
	var int rnd;
	BookstandMayaArt = 1;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_1_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_1_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandMayaHierchary_02_S1()
{
	var int rnd;
	BookstandMayaArt = 2;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_2_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_2_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandMayaHierchary_03_S1()
{
	var int rnd;
	BookstandMayaArt = 3;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_3_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_3_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandMayaHierchary_04_S1()
{
	var int rnd;
	BookstandMayaArt = 4;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_4_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_4_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandMayaHierchary_05_S1()
{
	var int rnd;
	BookstandMayaArt = 5;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_5_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_5_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
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
};

func void Use_BookstandAshtar_01_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if(AshtarBook_01 == FALSE)
			{
				AshtarBook_01 = TRUE;
				B_GivePlayerXP(100);
				B_Say(self,self,"$HOWINTEREST");

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
			if((AshtarBookBonus_01 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print( " Intelligence + 1 " );
				AshtarBookBonus_01 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " ...and said, Adanos - live and be fruitful, my children! I will give you all the blessings of this world, and with them the divine power of my element. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " ...and the secret of the magic of Adanos was revealed to man, so that he could control it and guard the balance in this world. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandAshtar_02_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if(AshtarBook_02 == FALSE)
			{
				AshtarBook_02 = TRUE;
				B_GivePlayerXP(100);
				B_Say(self,self,"$HOWINTEREST");

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
			if((AshtarBookBonus_02 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print( " Intelligence + 1 " );
				AshtarBookBonus_02 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " ...and there was one who stood out for his strength and courage, among others. And Adanos made him his wounder, so that he could strike his enemies. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " ...and he became a great warrior and glorified him for many centuries according to his deeds for the glory of Adanos. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandAshtar_03_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if(AshtarBook_03 == FALSE)
			{
				AshtarBook_03 = TRUE;
				B_GivePlayerXP(100);
				B_Say(self,self,"$HOWINTEREST");

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
			if((AshtarBookBonus_03 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print( " Intelligence + 1 " );
				AshtarBookBonus_03 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " ...and he was like a shadow and no one could find him if he didn't want to. And he appeared only when Adanos himself called to him. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " ...and he brought gifts to the altar of Adanos, obtained during the hunt, so that the flock would not become impoverished. Adanos accepted gifts and bestowed his grace on the giver. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func int CHELDRAKBOOK_COND()
{
	if((StartLvStory == TRUE) && (OpenHramDone == FALSE))
	{
		return TRUE;
	};
	
	return  FALSE ;
};

func void Use_BookstandChelDrak_01_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_01 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother, " In the ancient lecterns surrounding the entrance to the temple, I found strange entries. Perhaps they will somehow help me understand the correct sequence. " );
					StartLvStoryFR = TRUE;
				};

				LV_Story_01 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , "The worthy can enter this temple, the verse here is difficult for him to prompt, there is no need to run, do not rush, look for hints for the soul. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Only in this way you will understand only in this way you will comprehend, a single hidden passage, when you solve my riddle, you will find a treasure - go ahead. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_02_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_02 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother, " In the ancient lecterns surrounding the entrance to the temple, I found strange entries. Perhaps they will somehow help me understand the correct sequence. " );
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother, " The first inscription reads - ...'Between light and warmth, between revenge and good, the third brother rules the water, everyone praises him for it.'... " );
				B_LogEntry_Quiet(TOPIC_Miss_Brother, " The second inscription reads - ...'White cold is the border here, the light has put a line on it, the path will pass without wrinkling their faces, those in whom life is a mile away.'... " );
				LV_Story_02 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Between light and warmth, between revenge and goodness, the third brother rules the water, everyone praises him for it. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " White cold is the border here, the light put a line on it, the path will pass without wrinkling their faces, those in whom life is a mile away. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_03_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_03 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother, " In the ancient lecterns surrounding the entrance to the temple, I found strange entries. Perhaps they will somehow help me understand the correct sequence. " );
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother, " The third inscription reads - ...'Between the heat and midnight, the third path is hidden firmly, to pass through, look for the keys in the night.'... " );
				B_LogEntry_Quiet(TOPIC_Miss_Brother, " The fourth inscription reads - ...'Where the sun breaks into the sky, there is no place for a terrible shadow, go bold, do not be afraid, kneel there.'... " );
				LV_Story_03 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Between the heat and midnight, the third path is firmly hidden to pass through, find the keys in the night. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Where the sun breaks into the sky, there is no place for a terrible shadow, go bold, do not be afraid, kneel there. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_04_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_04 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother, " In the ancient lecterns surrounding the entrance to the temple, I found strange entries. Perhaps they will somehow help me understand the correct sequence. " );
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother, " The fifth inscription reads - ...'Where the snow covered the fields and mountains, where everything is white-white by the sea, where the cold has bound the hearts of people, the villain has been beating the rock for centuries.'... " );
				B_LogEntry_Quiet(TOPIC_Miss_Brother, " The sixth inscription reads - ...'This day is going to rest, but he, not you - go ahead, hero, where the sun hides in the night, search, search, search for the keys.'... " );
				LV_Story_04 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Where the snow covered the fields and mountains, where everything is white-white by the sea, where the cold has bound the hearts of people, the villain has been beating the rock for centuries. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " This day is going to rest, but he, not you - go ahead, hero, where the sun hides in the night, look, look, look for the keys. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_05_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_05 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother, " In the ancient lecterns surrounding the entrance to the temple, I found strange entries. Perhaps they will somehow help me understand the correct sequence. " );
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother, " The seventh inscription reads - ...'Darkness seeks in the cold, black snow flies over the world, unlife forces rise, but you go there.'... " );
				B_LogEntry_Quiet(TOPIC_Miss_Brother, " Taking the inscription reads - ...'Where the heat burns, be ready to fight the fiery enemy, carry a supply of water with you, and become resistant to the heat, hero.'... " );
				LV_Story_05 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Darkness seeks in the cold, black snow flies over the world, unlife forces rise, but you go there. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Where the heat burns, be ready to fight the fiery enemy, carry a supply of water with you, and become resistant to heat, hero. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_06_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_06 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother, " In the ancient lecterns surrounding the entrance to the temple, I found strange entries. Perhaps they will somehow help me understand the correct sequence. " );
					StartLvStoryFR = TRUE;
				};

				LV_Story_06 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " And even though the answer was not found, the light will show you the way here. The light of death, now is the dead light, and with it the priestly covenant. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Look here, find out the answer. This is my friend's advice. And the door will open this time, the language that was once ours. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};
