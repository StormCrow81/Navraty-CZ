

func void B_Announce_Herold()
{
	be int randy;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};

	AI_RemoveWeapon(self);

	if(Npc_HasItems(self,Fakescroll) == 0)
	{
		CreateInvItem(self,Fakescroll);
	};
	if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
	{
		AI_UseItemToState(self,Fakescroll,1);
		AI_Output(self,self, " DIA_Herold_Announce_04_00 " );	// Listen, people of Khorinis! By direct order of the Honorable Lord Hagen, the following decree comes into effect today.

		if (chapter <=  2 )
		{
			randy = Hlp_Random( 5 );

			if(randy == 0)
			{
				AI_Output(self,self, " DIA_Herold_Announce_04_01 " );	// Considering the general situation, forests and wastelands near the city should be avoided for your own safety.
				AI_Output(self,self, " DIA_Herold_Announce_04_02 " );	// In addition, any contact with the rebellious peasants in the surrounding lands is strictly prohibited.
			}
			else if(randy == 1)
			{
				AI_Output(self,self, " DIA_Herold_Announce_04_03 " );	// From now on, Lord Andre is appointed commander-in-chief of our militia.
				AI_Output(self,self, " DIA_Herold_Announce_04_04 " );	// All citizens of this city who have military skills are required to join the royal militia.
			}
			else if(randy == 2)
			{
				AI_Output(self,self, " DIA_Herold_Announce_04_05 " );	// Security measures to protect the upper quarter will be further strengthened.
				AI_Output(self,self, " DIA_Herold_Announce_04_06 " );	// The guards at the gate are ordered to enforce the law to the strictest extent possible to prevent unauthorized access to the block.
			}
			else if(randy == 3)
			{
				AI_Output(self,self, " DIA_Herold_Announce_04_07 " );	// Martial law is declared in all cities and provinces of the kingdom.
				AI_Output(self,self, " DIA_Herold_Announce_04_08 " );	// All civilian judges will lay down their duties and turn them over to the royal paladins.
				AI_Output(self,self, " DIA_Herold_Announce_04_09 " );	// The highly Honored Lord Andre is ordered to punish any crime or act of resistance to the royal guard in the most stern manner.
				AI_Output(self,self, " DIA_Herold_Announce_04_10 " );	// All residents of Khorinis guilty of a crime must immediately come to Lord Andre to fave judgement.
			}
			else
			{
				AI_Output(self,self, " DIA_Herold_Announce_04_11 " );	// Considering the danger of an orc attack on the city, all the inhabitants of the city should prepare accordingly.
				AI_Output(self,self, " DIA_Herold_Announce_04_12 " );	// Everyone should immediately start learning martial skills and arm themselves properly, as well as stock food and water.
			};
		}
		else  if (chapter ==  3 )
		{
			if(MIS_RescueBennet != LOG_SUCCESS)
			{
				AI_Output(self,self, " DIA_Herold_Announce_04_13 " );	// The mercenary blacksmith Bennet, who treacherously killed the paladin Lothar, is declared accursed in the eyes of Innos.
				AI_Output(self,self, " DIA_Herold_Announce_04_14 " );	// He is sentenced to death by hanging. The sentence will be carried out in the coming days.
			}
			else
			{
				AI_Output(self,self, " DIA_Herold_Announce_04_15 " );	// Blacksmith Bennet was cleared of all charges due to his innocence, which was proven by Lord Hagen's advisor.
			};
		}
		else  if (chapter ==  4 )
		{
			AI_Output(self,self, " DIA_Herold_Announce_04_16 " );	// Rumors of dragons appearing in the Khorinis Mine Valley are lies and vicious misinformation.
			AI_Output(self,self, " DIA_Herold_Announce_04_17 " );	// These rumors are spread by the enemy in order to sow fear and horror in the souls of the courageous inhabitants of Myrtana.
			AI_Output(self,self, " DIA_Herold_Announce_04_18 " );	// To dispel these ridiculous rumors, a band of brave paladins was sent to the Valley of Mines under the command of a man who is well acquainted with this area.
		}
		else
		{
			randy = Hlp_Random( 2 );
	
			if(randy == 0)
			{
				AI_Output(self,self, " DIA_Herold_Announce_04_19 " );	// The dragons that threatened the peace of our land were destroyed by a courageous warrior under the command of Lord Hagen.
				AI_Output(self,self, " DIA_Herold_Announce_04_20 " );	// Soon King Rhobar will free our lands from the orcs, and the kingdom will once again become flourishing and prosperous.
			}
			else
			{
				AI_Output(self,self, " DIA_Herold_Announce_04_21 " );	// Lord Andre is appointed supreme commander of the city of Khorinis. He will take up this position immediately.
				AI_Output(self,self, " DIA_Herold_Announce_04_22 " );	// Lord Hagen announced that he was personally heading to the Valley of Mines to ensure that the ship was loaded with magic ore.
			};
		};

		AI_UseItemToState(self,Fakescroll,-1);
	};
};

