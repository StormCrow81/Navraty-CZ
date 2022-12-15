

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
				Doc_PrintLines(nDocID, 0 , " Your roofs are built from dead wood. Your walls are built from dead stone. Your dreams are built from dead thoughts. " );
				Doc_PrintLines(nDocID, 0 , " Coming back screaming, laughing, singing, back to life, taking what you stole and skinning your dead bones, squealing. " );
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID, 1 , " Foolish people are blind, they collect treasures and suffer from greed for golden stones and chains. " );
				Doc_PrintLines(nDocID, 1 , " The Dark God frees them with darkness and pain and collects their bones and souls for his meal. " );
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
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
					AI_Print( " Intelligence + 1 " );
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
				Doc_PrintLines(nDocID, 0 , " It was our Lord who punished them. He gave them power to realize his paradise. " );
				Doc_PrintLines(nDocID, 0 , " But they refused or they lacked skill. Why this happened will forever remain unknown. " );
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID, 1 , " But it's clear that they were punished for their mistakes. Their civilization was razed to the ground in order for ours to emerge. " );
				Doc_PrintLines(nDocID, 1 , " And now she must give way to our master - the God of Darkness in his desire to fulfill his plan. " );
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
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
					AI_Print( " Intelligence + 1 " );
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
				Doc_PrintLines(nDocID, 0 , " Soon everything will be sanctified by the Lord's breath. And all those who rejected and betrayed him will feel it for themselves. " );
				Doc_PrintLines(nDocID, 0 , " All will be blessed and cleansed according to their deeds. And their false god will not help them - for he is weak before the might of the Lord. " );
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID, 1 , " Demons will tear their flesh to pieces and rivers will turn purple with their blood. The sun will not rise again for any of them. " );
				Doc_PrintLines(nDocID, 1 , " All of them will be swallowed by the sacred Darkness with a crimson veil of oblivion! " );
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
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
					AI_Print( " Intelligence + 1 " );
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
				Doc_PrintLines(nDocID, 0 , " With one move, the Master will end all human suffering and clear the way for the Master to set foot on earth again. " );
				Doc_PrintLines(nDocID, 0 , " No one will hide from his gaze and retribution. We will build a new world in honor of his name - the essence of which is beyond the understanding of these miserable creatures. " );
				Doc_PrintLines(nDocID, 0 , " And there will come a time of gloom and darkness forever and ever! " );
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID, 1 , " Blessed be His name - in our prayers we will find the strength to crush our enemies. " );
				Doc_PrintLines(nDocID, 1 , " We will unleash all our fury on the heads of the fool's henchmen - so that no one doubts the strength of our Lord. " );
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
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
					AI_Print( " Intelligence + 1 " );
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
				Doc_PrintLine(nDocID, 0 , " I am the one whose abode is darkness... " );
				Doc_PrintLine(nDocID, 0 , " Death is my breath... " );
				Doc_PrintLine(nDocID, 0 , " My feet are firmly on the graves, " );
				Doc_PrintLine(nDocID, 0 , " And raising the dead is my food! " );
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID, 1 , " My name is human fear. " );
				Doc_PrintLine(nDocID, 1 , " I am the prince of all that shadows. " );
				Doc_PrintLine(nDocID, 1 , " And in all the glory of the night, " );
				Doc_PrintLine(nDocID, 1 , " I build the dark walls of time. " );
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_05 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_05 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
					AI_Print( " Intelligence + 1 " );
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
			Doc_PrintLine(nDocID, 0 , "The Origin of the World " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Once upon a time there was only nothingness, and this nothingness was blessed. For the name of that nothingness was Chaos - the lord of emptiness and darkness Mordrag. " );
			Doc_PrintLines(nDocID, 0 , " And the divine elements were born in that emptiness by name - earth, water, stone and fire, and in their form, they reflected the essence of emptiness. " );
			Doc_PrintLines(nDocID, 0 , " But where Chaos rules, there is no place for divine wisdom. And the elements were blind in their only desire to devour everything around them. " );
			Doc_PrintLines(nDocID, 0 , " And so the centuries passed, followed by millennia - and there was no end to this confrontation between the elements... " );
			Doc_PrintLine(nDocID,0," ");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID, 1 , " And just realizing that where Khoas rules their existence is meaningless - the elements saw the only way for the world to exist. " );
			Doc_PrintLines(nDocID, 1 , " Coming to the path of agreement among themselves - the elements were able to expel the Great Chaos and imprison the lord of the void in the place where he was struck. " );
			Doc_PrintLines(nDocID, 1 , " In the halls of the origin of the Force....hiding it forever behind the sacred gates, imposing on them the great seal of eternity. " );
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
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
				AI_Print( " Intelligence + 1 " );
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
			Doc_PrintLine(nDocID, 0 , " Guardians of the world " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Parts of the one in disunity have given a new facet of existence, and few people know the true reason for what happened. " );
			Doc_PrintLines(nDocID, 0 , " Their goal is simple and it originates in the reason for the creation of the world and its essence in different guises. " );
			Doc_PrintLines(nDocID, 0 , " And there was a word - and there was that sign that gave wisdom and power to the brothers, to resist the one who is captivated by the creators in the heart of the world. " );
			Doc_PrintLines(nDocID, 0 , " To fulfill the will of the creators until the end of time. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID, 1 , " Each breathed life into his creation and endowed it with strength so that he could help his brothers in their common cause. " );
			Doc_PrintLines(nDocID, 1 , " They were equal among themselves and no one was higher. But their essence was a reflection of the secret desires of the creators. " );
			Doc_PrintLines(nDocID, 1 , " For in passion to gain power - they forgot about what they were created for. And one of the brothers fell at the hands of his own brother. " );
			Doc_PrintLines(nDocID, 1 , " And that was the end and the beginning - wisdom and madness that continues to this day. " );
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
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
				AI_Print( " Intelligence + 1 " );
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
			Doc_PrintLine(nDocID, 0 , " Guardian Path " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " You cannot find what is not and measure what is infinite. For the essence of that path is not in the search - but in the realization of the goal. " );
			Doc_PrintLines(nDocID, 0 , " He who enters this path is neither good nor evil, nor the wisdom of the judge - since the meaning of its existence is in both. " );
			Doc_PrintLines(nDocID, 0 , " This wisdom has a goal in itself that cannot follow the path of maintaining true balance - because its essence is chaos. " );
			Doc_PrintLines(nDocID, 0 , " Not everyone is given to see this line. And only the chosen ones are granted such a fate, and they have the right to accept it or reject it. " );
			Doc_PrintLines(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID, 1 , " The meaning of that path cannot be understood or defined in words. This is the comprehension of essence, world and destiny. " );
			Doc_PrintLines(nDocID, 1 , " As we move forward, that hidden path will be illuminated by the divine wisdom of the creators and its purpose will become clear. " );
			Doc_PrintLines(nDocID, 1 , " And the paths of life will intertwine into a single ring and fate will repeat its turn - for only a sphere can be ideal in its balance. " );
			Doc_PrintLines(nDocID, 1 , " To give a true look to what is truly valuable in the realm of existence. " );
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
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
				AI_Print( " Intelligence + 1 " );
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
			Doc_PrintLine(nDocID, 0 , " Annals of the Guardian " );
			Doc_PrintLine(nDocID,0,"часть I");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " The essence of balance is impartiality. To take sides, to become loving or spiteful, is to lose balance. " );
			Doc_PrintLines(nDocID, 0 , " After which, no action can be relied upon. Our burden is not for the state of mind addicts. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Relying on others is weakness for the strong, but strength for the weak. " );
			Doc_PrintLines(nDocID, 1 , " Wisdom and balance lie in knowing your own nature over time as you come to know yourself. " );
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
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
				AI_Print( " Intelligence + 1 " );
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
			Doc_PrintLine(nDocID, 0 , " Annals of the Guardian " );
			Doc_PrintLine(nDocID, 0 , " Part II " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " There are those for whom knowledge is a shield and those for whom it is a weapon. Neither view is balanced, but one is less unreasonable. " );
			Doc_PrintLines(nDocID, 0 , " The one who in knowledge is limited only by what others already know is the same fool as the one who does not bother to study. " );
			Doc_PrintLines(nDocID, 0 , " The treasure of knowledge is the most valuable in the world and they are usually protected accordingly. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Stone cannot know why the chisel splits it; steel cannot know why fire burns it. " );
			Doc_PrintLines(nDocID, 1 , " When death and despair cling to you, don't beat your chest and curse your ill fate. " );
			Doc_PrintLines(nDocID, 1 , " But thank the creators for the trials that make you strong. " );
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
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
				AI_Print( " Intelligence + 1 " );
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
			Doc_PrintLine(nDocID, 0 , " Annals of the Guardian " );
			Doc_PrintLine(nDocID, 0 , " part III " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Ancient corruption is re-emerging. It could tip the balance, but we knew we had to remain vigilant in case it did. " );
			Doc_PrintLines(nDocID, 0 , " No one could be trusted to intervene anymore. And some doubted the rightness of the Creators. " );
			Doc_PrintLines(nDocID, 0 , " But the seals survived and few triumphed, and those who doubted were laid in the foundation of a new Temple. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Using our honor as a shield over earth and sky, we must not lose our wisdom. " );
			Doc_PrintLines(nDocID, 1 , " Keep them safe and locked up, but always at the disposal of the faithful. Future generations are hostages of our responsiveness. " );
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
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
				AI_Print( " Intelligence + 1 " );
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
			Doc_PrintLine(nDocID, 0 , " Annals of the Guardian " );
			Doc_PrintLine(nDocID, 0 , " part IV " );
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " Although our knowledge of the world is great, some phenomena turned out to be much more complicated than we thought. " );
			Doc_PrintLines(nDocID, 0 , " The most unexpected union also turned out to be the most effective. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " Looking at the relics left by the creators, We understood what heights civilization could reach. " );
			Doc_PrintLines(nDocID, 1 , " Looking at the ancient ruins, we understand how dangerous this greatness can be. " );
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
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
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
				AI_Print( " Intelligence + 1 " );
				BookBonus_130 = TRUE ;
			};
		};
	};
};
