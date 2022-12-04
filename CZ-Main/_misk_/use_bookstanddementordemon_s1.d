
/* -------------------- CZ CHANGELOG -------------------- */

/*
v1.00:
(12x) RhetorikSkillValue - opraveno navýšení rétoriky nad maximum
*/




func void use_bookstanddementordemon_s1()
{
	var C_Npc her;
	var int nDocID;
	var int randomtext;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);
	};
	if(NECRODEMONAPPEAR == FALSE)
	{
		Wld_InsertNpc(necromacerdemonzombie,"FP_ROAM_DARKTOWER_06");
		NECRODEMONAPPEAR = TRUE;
	};
};

func void Use_BookstandDementor_S1()
{
	var C_Npc her;
	var int nDocID;
	var int randomtext;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			randomtext = Hlp_Random( 5 );

			if(randomtext == 0)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID, 0 , " Your roofs are built of dead wood. Your walls are built of dead stone. Your dreams are made of dead thoughts. " );
				Doc_PrintLines(nDocID, 0 , " Well they'll come back screaming, laughing, singing, come back to life, take what he stole, scream and peel the skin off your bones. " );
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID, 1 , " People are blind fools, hoarding treasures, hungry for gold jewelry and chains. " );
				Doc_PrintLines(nDocID, 1 , " The dark god will free them with darkness and pain, their bones his servants, their souls his food. " );
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_01 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_01 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
						AI_Print( " Rétorika + 1 " );
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
				if((BookBonus_119 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_119 = TRUE ;
				};
			}
			else if(randomtext == 1)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID, 0 , " Our Lord punished them. He gave them the power to fulfill his desires. " );
				Doc_PrintLines(nDocID, 0 , " But they refused, or they didn't have the skills. Why this happened will forever remain a mystery. " );
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID, 1 , " Well, it is obvious that they took the punishment for their mistakes. Their civilization disappeared so that ours could emerge. " );
				Doc_PrintLines(nDocID, 1 , " And now the way must be cleared for our Lord - the god of Darkness, who wants to carry out his plans now. " );
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_02 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_02 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
						AI_Print( " Rétorika + 1 " );
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
				if((BookBonus_120 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_120 = TRUE ;
				};
			}
			else if(randomtext == 2)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID, 0 , " Soon everything will be sanctified by the breath of the Lord. And all those who rejected him will feel it. " );
				Doc_PrintLines(nDocID, 0 , " Everyone will be sanctified and cleansed. And their false god will not help them, because he is nothing before the power of the Lord. " );
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID, 1 , " Demons tear their flesh to pieces and rivers run red with their blood. The sun will never rise again for any of them. " );
				Doc_PrintLines(nDocID, 1 , " All will be absorbed by the sacred Darkness and the red veil of Oblivion! " );
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_03 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_03 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
						AI_Print( " Rétorika + 1 " );
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
				if((BookBonus_121 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_121 = TRUE ;
				};
			}
			else if(randomtext == 3)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID, 0 , " In one move, the Master ends all human suffering and clears the way for the Lord to descend upon the world again. " );
				Doc_PrintLines(nDocID, 0 , " No one escapes his gaze and punishment. In his name we will build a new world, the essence of which is beyond the understanding of those poor beasts. " );
				Doc_PrintLines(nDocID, 0 , " There will be a time of darkness and darkness forever and ever! " );
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID, 1 , " Blessed be his name - in prayers to him we find strength to crush enemies. " );
				Doc_PrintLines(nDocID, 1 , " We will unleash all fury on faithless fools - so that no one doubts the power of our Lord. " );
				Doc_PrintLines(nDocID, 1 , " And the living will envy the dead! " );
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_04 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_04 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
						AI_Print( " Rétorika + 1 " );
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
				if((BookBonus_122 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_122 = TRUE ;
				};
			}
			else if(randomtext == 4)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID, 0 , " I am the one with the abode in the dark... " );
				Doc_PrintLine(nDocID, 0 , " Death is my breath... " );
				Doc_PrintLine(nDocID, 0 , " My feet stand firm on the graves of the living, " );
				Doc_PrintLine(nDocID, 0 , " And raising the dead is my food! " );
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID, 1 , " Fear my name, mortal. " );
				Doc_PrintLine(nDocID, 1 , " I, the prince of all covered with shadow. " );
				Doc_PrintLine(nDocID, 1 , " in all the majesty of the night, " );
				Doc_PrintLine(nDocID, 1 , " I build dark walls of time. " );
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_05 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_05 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;

					if(RhetorikSkillValue[1] < 100)
					{
						RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
						AI_Print( " Rétorika + 1 " );
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
				if((BookBonus_123 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Inteligence + 1");
					BookBonus_123 = TRUE ;
				};
			};
		};
	};
};

func void use_bookstanddementor1_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID, 0 , " World Origin " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Once upon a time there was nothing, a sacred nothing, whose name was Chaos, ruled by the lord of darkness and entropy, Mordrag. " );
			Doc_PrintLines(nDocID, 0 , " Also the divine elements - Earth, Water, Stone and Fire, were born in the void, reflecting its essence. " );
			Doc_PrintLines(nDocID, 0 , " But where Chaos rules - there is no place for divine wisdom. And the elements were blinded by the desire to appropriate everything around them. " );
			Doc_PrintLines(nDocID, 0 , " And so centuries and millennia passed, and there was no end to the battles between them... " );
			Doc_PrintLine(nDocID,0," ");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID, 1 , " Only when they realized that there was no place for them where Chaos ruled, the elements devised the only way for peace to exist. " );
			Doc_PrintLines(nDocID, 1 , " Having gained the consent of all, the elements could drive out the great Chaos and, where they defeated him, change the lord of the void for the better. " );
			Doc_PrintLines(nDocID, 1 , " And in the halls of original power they hid him forever behind mysterious doors and sealed him for eternity. " );
			Doc_PrintLines(nDocID, 1 , " And so the world was born. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_01 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_01 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rétorika + 1 " );
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
			if((BookBonus_124 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_124 = TRUE ;
			};
		};
	};
};

func void use_bookstanddementor2_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID, 0 , " Divine Guardians " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Parts of the disunity have given the world a new face, and almost no one knows the true cause. " );
			Doc_PrintLines(nDocID, 0 , " Their goal is simple and takes its beginning in the cause of the creation of peace and its essence in various forms. " );
			Doc_PrintLines(nDocID, 0 , " There was both a word and a sign that gave the brothers strength and wisdom to resist the one who crushed the heart of the World Makers. " );
			Doc_PrintLines(nDocID, 0 , " And to fulfill the will of the Creators until the end of time. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID, 1 , " Each breathed life into his creation and gave it strength to help the brothers with their goal. " );
			Doc_PrintLines(nDocID, 1 , " They were equal and no one promoted themselves, but their essence was a reflection of the secret wishes of the Creators. " );
			Doc_PrintLines(nDocID, 1 , " In their passionate pursuit of power, they forgot what they were made of. And one of the brothers let go of his brother's hand. " );
			Doc_PrintLines(nDocID, 1 , " And that was the end and the beginning - of wisdom and foolishness that continues to this day. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_02 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_02 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rétorika + 1 " );
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
			if((BookBonus_125 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_125 = TRUE ;
			};
		};
	};
};

func void use_bookstanddementor3_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID, 0 , " Path of the Guardian " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " It is impossible to find the absent and measure the infinite. The essence of the journey is not in the search, but in the realization of goals. " );
			Doc_PrintLines(nDocID, 0 , " He who enters the path shows the wisdom of the Judge neither kindly nor angrily - the meaning of existence is in both. " );
			Doc_PrintLines(nDocID, 0 , " This wisdom hides a goal that cannot follow the path of maintaining true balance - with the character of chaos. " );
			Doc_PrintLines(nDocID, 0 , " Seeing her is not given to everyone. And only the chosen ones can decide who will be allowed to see it. " );
			Doc_PrintLines(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID, 1 , " The meaning of this path is impossible to understand or define in words. This is the essence of understanding, peace and destiny. " );
			Doc_PrintLines(nDocID, 1 , " As we move forward, God's wisdom illuminates the hidden path and His goal becomes clear. " );
			Doc_PrintLines(nDocID, 1 , " Also lives will be arranged in one circle and fate will repeat itself - only one sphere can be ideal for Balance. " );
			Doc_PrintLines(nDocID, 1 , " To give value to what really matters in the world. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_03 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_03 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rétorika + 1 " );
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
			if((BookBonus_126 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_126 = TRUE ;
			};
		};
	};
};

func void use_bookstanddementor4_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID, 0 , " Chronicles of the Guardians, Part I. " );
			Doc_PrintLine(nDocID, 0 , " Part I " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " The essence of Balance is impartiality. To take someone's side, to love or to be angry is to lose Balance. " );
			Doc_PrintLines(nDocID, 0 , " After that, there is no one to rely on. Our burden is not dependent on our current state. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Relying on others is weakness to the strong, but strength to the weak. " );
			Doc_PrintLines(nDocID, 1 , " Wisdom and Balance lies in knowing your nature over time. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_04 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_04 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rétorika + 1 " );
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
			if((BookBonus_127 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_127 = TRUE ;
			};
		};
	};
};

func void use_bookstanddementor5_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID, 0 , " Chronicles of the Guardians, Part II. " );
			Doc_PrintLine(nDocID, 0 , " Part II " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " There are those for whom knowledge is a shield and those for whom it is a weapon. Neither view is balanced, but one is less pointless. " );
			Doc_PrintLines(nDocID, 0 , " One whose knowledge is limited to what others already know is as foolish as one who does not bother to study. " );
			Doc_PrintLines(nDocID, 0 , " The treasure of knowledge is the most valuable in the world, so it is adequately protected. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Stone cannot know what chisel will split it; steel cannot know what fire it will burn in. " );
			Doc_PrintLines(nDocID, 1 , " When death and despair overtake you, don't beat your chest and curse a malevolent fate. " );
			Doc_PrintLines(nDocID, 1 , " But praise the Creator for the test that affected you. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_05 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_05 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rétorika + 1 " );
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
			if((BookBonus_128 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_128 = TRUE ;
			};
		};
	};
};

func void use_bookstanddementor6_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID, 0 , " Chronicles of the Guardians, Part III. " );
			Doc_PrintLine(nDocID, 0 , " Part III " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " The Ancient Decay has reappeared. It could have upset the Balance, and we knew we should stay alert in case it did. " );
			Doc_PrintLines(nDocID, 0 , " No one could be allowed to interfere. And some people doubted the truth of the Makers. " );
			Doc_PrintLines(nDocID, 0 , " But the pressure continued, some prevailed, and those who doubted laid the foundation stone of the new temple. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Using our honor as a shield between heaven and earth, we should not lose wisdom. " );
			Doc_PrintLines(nDocID, 1 , " May they be safe under lock and key, but always available and devoted. Future generations depend on our actions. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_06 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_06 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rétorika + 1 " );
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
			if((BookBonus_129 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_129 = TRUE ;
			};
		};
	};
};

func void use_bookstanddementor7_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID, 0 , " Chronicles of the Guardians, Part IV. " );
			Doc_PrintLine(nDocID, 0 , " Part IV " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Even though our knowledge of the world is great, some phenomena have turned out to be more complex than we expected. " );
			Doc_PrintLines(nDocID, 0 , " The most unexpected connections also turned out to be the most effective. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Looking at the relics found by the explorers, we found out what level a civilization can reach. " );
			Doc_PrintLines(nDocID, 1 , " And looking at the ancient ruins, we realized how dangerous it could be. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_07 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_07 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rétorika + 1 " );
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
			if((BookBonus_130 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
				BookBonus_130 = TRUE ;
			};
		};
	};
};
