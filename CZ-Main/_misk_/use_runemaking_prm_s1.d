

func void use_runemaking_prm_s1()
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
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID, 0 , " True Magic " );
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Runes of true magic and ingredients needed to create them: " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Kruh I");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Svetlo -");
		Doc_PrintLine(nDocID, 0 , " Gold Coin " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Lock Eater - " );
		Doc_PrintLine(nDocID,0,"Paklíč");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Léeba minor injuries - " );
		Doc_PrintLine(nDocID, 0 , " Liquid plant " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Kruh II");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Wolf Call - " );
		Doc_PrintLine(nDocID, 0 , " Wolf skin " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " - Purifying Light - " );
		Doc_PrintLine(nDocID,0,"Protijed");
		Doc_PrintLine(nDocID, 0 , " Holy water " );
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID, 1 , " - Destruction of the undead - " );
		Doc_PrintLine(nDocID, 1 , " Holy water " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Kruh III");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID, 1 , " - Tide of Vigor - " );
		Doc_PrintLine(nDocID, 1 , " Blue without " );
		Doc_PrintLine(nDocID, 1 , " Iced Quartz " );
		Doc_PrintLine(nDocID, 1 , " Swamp Grass " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID, 1 , " - Summon Stone Golem - " );
		Doc_PrintLine(nDocID, 1 , " Stone Golem Heart " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " To create a rune, it is necessary to have all the ingredients. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(READ_PRM_CIRCLE == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			READ_PRM_CIRCLE = TRUE;
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
		if((BookBonus_143 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_143 = TRUE ;
		};
	};
};
