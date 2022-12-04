

func void use_bookstand_dmt_circ1_s1()
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
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " FIRST CIRCLE " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Runes of the first circle and ingredients needed to create them: " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Dark Arrow - " );
		Doc_PrintLine(nDocID, 0 , " Black Pearl " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Invoke skeleton - " );
		Doc_PrintLine(nDocID, 0 , " Skeleton bone " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Posedlost -");
		Doc_PrintLine(nDocID, 0 , " Skeleton bone " );
		Doc_PrintLine(nDocID,0,"Ektoplazma");
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID, 0 , " Resin " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " All the required ingredients are needed to create the rune. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " The one who wants to create a rune must know the magic formula and have the rune stone, as well as the scroll of the corresponding spell. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Only then can he create the rune on the rune table. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_DMT_CIRCLE_01 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_01 = TRUE;
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
		if((BookBonus_131 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_131 = TRUE ;
		};
	};
};

func void use_bookstand_dmt_circ2_s1()
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
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " SECOND CIRCLE " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Runes of the second circle and ingredients needed to create them: " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Tearing the Soul - " );
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID, 0 , " Resin " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Zombie summon - " );
		Doc_PrintLine(nDocID,0,"Uhlí");
		Doc_PrintLine(nDocID, 0 , " Meat from a corpse " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Únava -");
		Doc_PrintLine(nDocID, 0 , " Skeleton bone " );
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID, 0 , " Stone Crystal " );
		Doc_PrintLine(nDocID, 0 , " Quartz " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " All the required ingredients are needed to create the rune. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " The one who wants to create a rune must know the magic formula and have the rune stone, as well as the scroll of the corresponding spell. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Only then can he create the rune on the rune table. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_DMT_CIRCLE_02 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_02 = TRUE;
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
		if((BookBonus_132 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_132 = TRUE ;
		};
	};
};

func void use_bookstand_dmt_circ3_s1()
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
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " THIRD CIRCLE " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Runes of the third circle and ingredients needed to create them: " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Dark Spear - " );
		Doc_PrintLine(nDocID, 0 , " Black Pearl " );
		Doc_PrintLine(nDocID, 0 , " Quartz " );
		Doc_PrintLine(nDocID, 0 , " Stone Crystal " );
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Roj hmyzu -");
		Doc_PrintLine(nDocID,0,"Akvamarín");
		Doc_PrintLine(nDocID, 0 , " Swamp Grass " );
		Doc_PrintLine(nDocID, 0 , " Resin " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Summon Skeleton Warrior - " );
		Doc_PrintLine(nDocID, 0 , " Skeleton bone " );
		Doc_PrintLine(nDocID, 0 , " Black Pearl " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " All the required ingredients are needed to create the rune. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " The one who wants to create a rune must know the magic formula and have the rune stone, as well as the scroll of the corresponding spell. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Only then can he create the rune on the rune table. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(READ_DMT_CIRCLE_03 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_03 = TRUE;
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
		if((BookBonus_133 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_133 = TRUE ;
		};
	};
};

func void use_bookstand_dmt_circ4_s1()
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
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " FOURTH CIRCLE " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Runes of the fourth circle and ingredients needed to create them: " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Invoke daemon - " );
		Doc_PrintLine(nDocID, 0 , " Demon Heart " );
		Doc_PrintLine(nDocID,0,"Síra x2");
		Doc_PrintLine(nDocID, 0 , " Resin x3 " );
		Doc_PrintLine(nDocID,0,"Uhlí");
		Doc_PrintLine(nDocID, 0 , " Black Pearl x3 " );
		Doc_PrintLine(nDocID, 0 , " Higher Runestone " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Koule smrti -");
		Doc_PrintLine(nDocID, 0 , " Tongue of Fire " );
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID, 0 , " Resin " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " All the required ingredients are needed to create the rune. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " The one who wants to create a rune must know the magic formula and have the rune stone, as well as the scroll of the corresponding spell. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Only then can he create the rune on the rune table. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_DMT_CIRCLE_04 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_04 = TRUE;
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
		if((BookBonus_134 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_134 = TRUE ;
		};
	};
};

func void use_bookstand_dmt_circ5_s1()
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
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " FIFTH CIRCLE " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Runes of the fifth circle and ingredients needed to create them: " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Army of Darkness - " );
		Doc_PrintLine(nDocID, 0 , " Skeleton bone " );
		Doc_PrintLine(nDocID, 0 , " Black Pearl " );
		Doc_PrintLine(nDocID, 0 , " Stone Golem Heart " );
		Doc_PrintLine(nDocID, 0 , " Demon Heart " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " All the required ingredients are needed to create the rune. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " The one who wants to create a rune must know the magic formula and have the rune stone, as well as the scroll of the corresponding spell. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Only then can he create the rune on the rune table. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_DMT_CIRCLE_05 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_05 = TRUE;
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
		if((BookBonus_135 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_135 = TRUE ;
		};
	};
};

func void use_bookstand_dmt_circ6_s1()
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
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " SIXTH CIRCLE " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Runes of the sixth circle and ingredients needed to create them: " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Black Mist - " );
		Doc_PrintLine(nDocID, 0 , " Skeleton bone " );
		Doc_PrintLine(nDocID, 0 , " Black Pearl " );
		Doc_PrintLine(nDocID,0,"Ektoplazma");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Roar of the Dead - " );
		Doc_PrintLine(nDocID, 0 , " Black Pearl " );
		Doc_PrintLine(nDocID, 0 , " Demon Heart " );
		Doc_PrintLine(nDocID,0,"Lebka");
		Doc_PrintLine(nDocID, 0 , " Resin " );
		Doc_PrintLine(nDocID,0,"Síra");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " All the required ingredients are needed to create the rune. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " The one who wants to create a rune must know the magic formula and have the rune stone, as well as the scroll of the corresponding spell. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Only then can he create the rune on the rune table. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READ_DMT_CIRCLE_06 == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_DMT_CIRCLE_06 = TRUE;
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
		if((BookBonus_136 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_136 = TRUE ;
		};
	};
};
