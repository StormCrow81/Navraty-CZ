

var int Animals_1_permanent;
var int Animals_2_permanent;
var int Animals_3_permanent;

func void Use_BookstandAnimals1_S1()
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
		Doc_PrintLine(nDocID, 0 , " Hunting and Prey " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Every animal and creature has a trophy that increases the fame and fortune of a skilled hunter. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " An experienced hunter knows about the trophies of his prey and knows the various ways to get them. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Pull teeth " );
		Doc_PrintLines(nDocID, 0 , " Teeth are the weapons of many animals and creatures. Whoever knows about this, he will receive his trophy when catching wolves, glorchs, obscurants, swamps and trolls. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID, 1 , " Skinning " );
		Doc_PrintLines(nDocID, 1 , " Every experienced hunter should be able to skin many animals. Sheep, wolves, gloomers and many more. " );
		Doc_PrintLines(nDocID, 1 , " A hunter who has this talent can also skin Bog Eaters and Shnugs. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID, 1 , " Break claws " );
		Doc_PrintLines(nDocID, 1 , " The art of breaking claws is prey from lizards of all kinds, glorchs, sniffs and obscurantists of their claws.   " );
		Doc_Show(nDocID);
		if(Animals_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_1_permanent = TRUE;
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
		if((BookBonus_90 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_90 = TRUE ;
		};
	};
};

func void Use_BookstandAnimals2_S1()
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
		Doc_PrintLine(nDocID, 0 , " Hunting and Prey " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Every animal and creature has a trophy that increases the fame and fortune of a skilled hunter. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Blood Hornet " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " It takes two special skills to get hold of this flying devil's trophies. " );
		Doc_PrintLines(nDocID, 0 , " The first is the ability to separate the wings, and the second is to extract the stinger. " );
		Doc_PrintLines(nDocID, 0 , " An experienced hunter must master both skills to get both trophies. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " The weapons of field beetles and creepers are their mandibles. First of all, the mandibles of creepers " );
		Doc_PrintLines(nDocID, 1 , " are considered special because they contain juice that restores magical energy. " );
		Doc_PrintLines(nDocID, 1 , " But you need to use it wisely, because over time the human body stops responding to it. " );
		Doc_PrintLines(nDocID, 1 , " Also important are the shells of the crawlers, which can be used to make good armor. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(Animals_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_2_permanent = TRUE;
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
		if((BookBonus_91 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_91 = TRUE ;
		};
	};
};

func void Use_BookstandAnimals3_S1()
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
		Doc_PrintLine(nDocID, 0 , " Hunting and Prey " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Every animal and creature has a trophy that increases the fame and fortune of a skilled hunter. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Fire Lizard " );
		Doc_PrintLines(nDocID, 0 , " These rare creatures belong to a lizard species that can spew fire. Anyone who comes close to it will be burned. " );
		Doc_PrintLines(nDocID, 0 , " Only with protection from fire can one survive the fight against this creature and rip out its precious tongue. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID, 1 , " Mrakoris " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Mrakoris is an ancient solitary species that lives exclusively in forests. " );
		Doc_PrintLines(nDocID, 1 , " During the day, the gloomer mostly rests, and therefore is not dangerous. But at night it comes out to hunt and poses a huge threat. " );
		Doc_PrintLines(nDocID, 1 , " The head of the mrakoris is crowned with a horn, which is a valuable trophy for a hunter. The hunter must master the skill - to break off the horn correctly, " );
		Doc_PrintLines(nDocID, 1 , " to get this trophy. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(Animals_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_3_permanent = TRUE;
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
		if((BookBonus_92 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_92 = TRUE ;
		};
	};
};

