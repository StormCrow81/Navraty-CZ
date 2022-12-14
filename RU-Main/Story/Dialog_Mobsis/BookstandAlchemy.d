

var int ALchemy_1_permanent;
var int ALchemy_2_permanent;
var int ALchemy_3_permanent;

func void Use_BookstandALCHEMY1_S1()
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
		Doc_PrintLine(nDocID, 0 , " Drinks of magical energy " );
		Doc_PrintLine(nDocID, 0 , " and their ingredients " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Mana Essence " );
		Doc_PrintLine(nDocID, 0 , " 2 fire nettles " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Mana Extract " );
		Doc_PrintLine(nDocID, 0 , " 2 fire herbs " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Elixir of Mana " );
		Doc_PrintLine(nDocID, 0 , " 2 fire roots " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Any work on the alchemy table requires the use of a special laboratory flask in which the drink is made. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Also used to make mana drinks: " );
		Doc_PrintLine(nDocID, 1 , " Meadow Mountaineer " );
		Doc_PrintLine(nDocID, 1 , " Seraphis " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Requires royal sorrel to make drinks of permanent magical energy. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(ALchemy_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_1_permanent = TRUE;
			B_Say(self,self,"$ABOUTALCHEMY");
			RankPoints = RankPoints + 1;

			if(TalentCount_Alchemy[0] < 100)
			{
				TalentCount_Alchemy[0] += 1;
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
		if((BookBonus_87 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_87 = TRUE ;
		};
	};
};

func void Use_BookstandALCHEMY2_S1()
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
		Doc_PrintLine(nDocID, 0 , " Healing Energy Drinks " );
		Doc_PrintLine(nDocID, 0 , " and their ingredients " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Healing Essence " );
		Doc_PrintLine(nDocID, 0 , " 2 medicinal plants " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Medicinal extract " );
		Doc_PrintLine(nDocID, 0 , " 2 medicinal herbs " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Healing Elixir " );
		Doc_PrintLine(nDocID, 0 , " 2 medicinal roots " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Any work on the alchemy table requires the use of a special laboratory flask in which the drink is made. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " For the preparation of any medicinal drinks, the following are also used: " );
		Doc_PrintLine(nDocID, 1 , " Meadow Mountaineer " );
		Doc_PrintLine(nDocID, 1 , " Seraphis " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Royal sorrel is needed to make permanent life energy drinks. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(ALchemy_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_2_permanent = TRUE;
			B_Say(self,self,"$ABOUTALCHEMY");
			RankPoints = RankPoints + 1;

			if(TalentCount_Alchemy[0] < 100)
			{
				TalentCount_Alchemy[0] += 1;
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
		if((BookBonus_88 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_88 = TRUE ;
		};
	};
};

func void Use_BookstandALCHEMY3_S1()
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
		Doc_PrintLines(nDocID, 0 , " Drinks of constant change " );
		Doc_PrintLine(nDocID, 0 , " and their ingredients " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Elixir of Agility " );
		Doc_PrintLines(nDocID, 0 , " Goblin Berry and Royal Sorrel " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Boost Drink " );
		Doc_PrintLines(nDocID, 0 , " Glorcha Grass and Knotweed " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Double Boost Drink " );
		Doc_PrintLines(nDocID, 0 , " Distilling a speed drink with another glorcha herb " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Elixir of Power " );
		Doc_PrintLines(nDocID, 0 , " Dragonroot and Royal Sorrel " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Elixir of life " );
		Doc_PrintLines(nDocID, 0 , " Three medicinal roots and meadow mountain grass " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Spirit Elixir " );
		Doc_PrintLines(nDocID, 1 , " Fireroot and Royal Sorrel " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Preparing these recipes is the ultimate art of alchemy! " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(ALchemy_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_3_permanent = TRUE;
			B_Say(self,self,"$ABOUTALCHEMY");
			RankPoints = RankPoints + 1;

			if(TalentCount_Alchemy[0] < 100)
			{
				TalentCount_Alchemy[0] += 1;
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
		if((BookBonus_89 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_89 = TRUE ;
		};
	};
};
