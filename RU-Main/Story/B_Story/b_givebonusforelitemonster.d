
var int RitualShaman_01;
var int RitualShaman_02;
var int RitualShaman_03;
var int RitualShaman_04;
var int RitualShaman_05;
var int RitualShaman_06;
var int RitualShaman_07;
var int RitualShaman_08;
var int RitualShaman_09;
var int Ginnok_Guard_01;
var int Ginnok_Guard_02;
var int Ginnok_Guard_03;
var int Ginnok_Guard_04;
var int Ginnok_Guard_05;
var int Ginnok_Guard_06;
var int GomezWSIsDead_01;
var int GomezWSIsDead_02;
var int GomezWSIsDead_03;
var int GomezWSIsDead_04;
var int GomezWSIsDead_05;
var int GomezWSIsDead_06;
var int GomezWSIsDead_07;
var int GomezWSIsDead_08;
var int GomezWSIsDead_09;
var int GomezWSIsDead_10;
var int GomezWSIsDead_11;
var int GomezWSIsDead_12;
var int GomezWSIsDead_13;
var int GomezWSIsDead_14;
var int GomezWSIsDead_15;



func void B_LogBeast(var C_Npc Beast)
{
	var string concatText;

	if ( Beast . aivar [ AIV_MM_REAL_ID ] ==  GREEN_ROPE_ID ) .
	{
		if ( Green_B1 ==  FALSE )
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Гоблин'");
			Log_CreateTopic(TOPIC_BEAST_GOBBO_GREEN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GOBBO_GREEN,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_GOBBO_GREEN , " You can hardly find a creature angrier than a goblin. These little bastards always go in droves and attack all at once. If you stumble upon a group of such creatures, and your weapon is a stick, it is better to hide from view of these creatures, because, attacking crowd, they leave no chance to anyone ... " );
			AI_Print(concatText);
		}
		else
		{
			if ((Green_B1 >=  15 ) && (Green_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Гоблин'");
				Log_AddEntry( TOPIC_BEAST_GOBBO_GREEN , " Primary Benefits: Extremely agile, making him very hard to hit with melee weapons " );
				Log_AddEntry( TOPIC_BEAST_GOBBO_GREEN , " Weak Points : Has very weak defense against ranged, magic and fire weapons " );
				AI_Print(concatText);
				Gobbo_Green_B2 = TRUE;
			}
			else  if ((Green_B1 >=  30 ) && (Green_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Гоблин'");
				Log_AddEntry( TOPIC_BEAST_GOBBO_GREEN , " Combat Tactics: Goblins often form packs, especially when they settle in large caves, and in such cases they become especially dangerous. It is best to lure them out one at a time, and shoot them from afar with a bow or crossbow, since they are small, but in an amount greater than three, they represent quite a rather big force. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Gobbo_Green_B3 = TRUE;
			};
		};

		Gobbo_Green_B1 += 1;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER) && (Beast.guild != GIL_MEATBUG) && (Hlp_GetInstanceID(Beast) != Hlp_GetInstanceID(Rabbit)) && (Hlp_GetInstanceID(Beast) != Hlp_GetInstanceID(Rabbit_02)))
	{
		if(Scavenger_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Падальщик'");
			Log_CreateTopic(TOPIC_BEAST_SCAVENGER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SCAVENGER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SCAVENGER,"These huge and ferocious wingless birds are actually one of the weakest inhabitants of Myrtana. Despite the name, these birds are omnivores and mainly feed on grass if there is no dead carcass nearby. They mainly live in the grasslands, near human settlements, in forests and near swamps. The only thing that can cause difficulties for a novice traveler is the grouping of scavengers, which usually huddle in flocks. However, the almost complete lack of intelligence allows you to lure the scavengers one by one. The tactics of fighting these birds are simple - any kind of weapon will do.") ;
			AI_Print(concatText);
		}
		else
		{
			if((Scavenger_B1 >= 15) && (Scavenger_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Падальщик'");
				Log_AddEntry( TOPIC_BEAST_SCAVENGER , " Main advantages: able to run fast and deliver strong beak strikes " );
				Log_AddEntry( TOPIC_BEAST_SCAVENGER , " Weak Points : Has very weak defense against all weapons, magic and fire " );
				AI_Print(concatText);
				Scavenger_B2 = TRUE;
			}
			else if((Scavenger_B1 >= 30) && (Scavenger_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Падальщик'");
				Log_AddEntry( TOPIC_BEAST_SCAVENGER , " Combat tactics: scavengers stay in packs, but communication between individuals is not established. Therefore, it is easy to lure one out of the pack. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Scavenger_B3 = TRUE;
			};
		};

		Scavenger_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_WOLF )
	{
		if(Wolf_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Волк'");
			Log_CreateTopic(TOPIC_BEAST_WOLF,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_WOLF,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_WOLF,"Wolves are one of the most familiar animals in the world. They live almost everywhere, from rocky mountains and dense forests to grassy plains. Their coat is usually light gray, with dirty white and black spots. Wolves - animals with a social structure, they live in communities called packs.Each pack has a leader - the strongest and most courageous wolf.In hunting, their strength lies in their teamwork.A lone wolf can be safely killed, but a whole pack will be very difficult to defeat even wolf will never be left to perish, but will come to its aid as a pack of wolves. for their fur and fangs.");
			AI_Print(concatText);
		}
		else
		{
			if (( Wolf_B1 >=  10 ) && ( Wolf_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Волк'");
				Log_AddEntry( TOPIC_BEAST_WOLF , " Main advantages: able to run fast, has a good defense against melee weapons, in addition, wolves hunt and attack in packs " );
				Log_AddEntry( TOPIC_BEAST_WOLF , " Weakness : Very weak defense against ranged, magic and fire weapons " );
				AI_Print(concatText);
				Wolf_B2 = TRUE;
			}
			else if((Wolf_B1 >= 20) && (Wolf_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Волк'");
				Log_AddEntry( TOPIC_BEAST_WOLF , " Combat tactics: First, you should lure one wolf from the pack, and then kill the entire group one by one. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Wolf_B3 = TRUE;
			};
		};

		Wolf_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SNAPPER )
	{
		if(Snapper_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Глорх'");
			Log_CreateTopic(TOPIC_BEAST_SNAPPER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SNAPPER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SNAPPER,"Glorchs are predatory creatures, ancient relics of bygone eras. Their distinguishing feature is the absence of front legs. Instead, they have very strong hind legs, allowing glorchs to run fast and ruthlessly attack. They attack at speed, ripping through a large, mouth full of sharp teeth.Glorchs live on the edge of forests, grassy plains and mountainous areas with stony soil.Their main advantage over rivals is hunting in packs.Glorchs always keep in groups of 3-5 individuals.If one of them is attacked, relatives will come to his aid , so the chance of retreat is very low. They feed on anything they can catch. Their hunting is quite efficient, as they hunt in groups. Sheep, scavengers, and young wolves are all in their diet.");
			Log_AddEntry( TOPIC_BEAST_SNAPPER , " There is also another variety of Glorch called the 'Black Glorch'. This is the perfect killing machine! Their fangs are sharper than razors, their muscles are stronger than rock, and their tail can break all your bones with one blow. Be careful if you decided to hunt them ... " );
			AI_Print(concatText);
		}
		else
		{
			if((Snapper_B1 >= 10) && (Snapper_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Глорх'");
				Log_AddEntry( TOPIC_BEAST_SNAPPER , " Main advantages: able to run very fast, has good protection against melee and ranged weapons, glorchs hunt and attack in packs " );
				Log_AddEntry( TOPIC_BEAST_SNAPPER , " Vulnerability: has weak protection against magic " );
				AI_Print(concatText);
				Snapper_B2 = TRUE;
			}
			else if((Snapper_B1 >= 20) && (Snapper_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Глорх'");
				Log_AddEntry( TOPIC_BEAST_SNAPPER , " Combat tactics: shooting them with a bow is not easy - they move too fast, besides, they prefer to move in a pack, so swords and axes are more preferable in combat with them, the more the better. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Snapper_B3 = TRUE;
			};
		};

		Snapper_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SHADOWBEAST )
	{
		if(ShadowBeast_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Мракорис'");
			Log_CreateTopic(TOPIC_BEAST_SHADOWBEAST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SHADOWBEAST,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SHADOWBEAST,"Shadowbeests are the creatures of darkness, a real horror of dense forests and caves. These huge furry monsters with a horn appear from nowhere and disappear into nowhere. Truly, obscurantists are one of the most formidable predators of Myrtana, the strongest of which will give odds even to young trolls. The obscurantists love to live in caves where they drag their prey, which makes the cave a real cemetery for both four-legged and bipedal creatures.Another favorite habitat of the obscurantist is dense forests and swamps where sunlight does not penetrate, which makes these monsters doubly dangerous. skin, paws, from the blow of which almost no armor can save, these creatures leave no chance of survival for a mere mortal.");
			AI_Print(concatText);
		}
		else
		{
			if((ShadowBeast_B1 >= 5) && (ShadowBeast_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Мракорис'");
				Log_AddEntry( TOPIC_BEAST_SHADOWBEAST , " Main advantages: has a huge hitting power, very good protection against melee weapons and a large amount of health " );
				Log_AddEntry( TOPIC_BEAST_SHADOWBEAST , " Weak Points: Poor defense against ranged weapons and magic, dislikes daylight " );
				AI_Print(concatText);
				ShadowBeast_B2 = TRUE;
			}
			else if((ShadowBeast_B1 >= 10) && (ShadowBeast_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Мракорис'");
				Log_AddEntry( TOPIC_BEAST_SHADOWBEAST , " Combat tactics: the length and strength of the weapon you use, as well as undoubtedly your reaction - these are the main points that decide in a battle with the obscurantist. In addition, without good armor, you should also not get in the way of this monster. " );
				AI_Print(concatText);
				hero.protection[PROT_EDGE] += 1;
				REALPROTEDGE += 1;
				AI_Print(PRINT_LEARNPROTEDGE);
				ShadowBeast_B3 = TRUE;
			};
		};

		ShadowBeast_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_ALLIGATOR )
	{
		if(Alligator_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Аллигатор'");
			Log_CreateTopic(TOPIC_BEAST_ALLIGATOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ALLIGATOR,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_ALLIGATOR , " Alligators live near or in bodies of water, so don't be surprised if this reptile suddenly attacks near a river or oasis. Usually an alligator is difficult to spot from afar, as it hides either in water or in some other natural shelter - grass, for example. It is quite difficult to meet more than one crocodile in one place. " );
			AI_Print(concatText);
		}
		else
		{
			if (( Alligator_B1 >=  3 ) && ( Alligator_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Аллигатор'");
				Log_AddEntry( TOPIC_BEAST_ALLIGATOR , " Main advantages: good protection against all types of melee weapons, its powerful jaws can bite through almost any armor, quite tenacious " );
				Log_AddEntry( TOPIC_BEAST_ALLIGATOR , " Weak Points : Has weak defense against magic and fire " );
				AI_Print(concatText);
				Alligator_B2 = TRUE;
			}
			else if((Alligator_B1 >= 5) && (Alligator_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Аллигатор'");
				Log_AddEntry( TOPIC_BEAST_ALLIGATOR , " Combat Tactics: It's best to use fire or magic against the alligator. Also, don't waste precious bolts and arrows on it, since its thick skin is almost impenetrable to them. " );
				AI_Print(concatText);

				if(ATR_STAMINA_MAX[0] < 100)
				{
					ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;
					ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
					Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
					AI_Print(PRINT_LEARNSTAMINA);
				};

				Alligator_B3 = TRUE;
			};
		};

		Alligator_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_BLATTCRAWLER )
	{
		if(Blattcrawler_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Богомол'");
			Log_CreateTopic(TOPIC_BEAST_BLATTCRAWLER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_BLATTCRAWLER,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_BLATTCRAWLER , "The giant praying mantis is most often found in the southern part of the island of Khorinis. It is very dangerous due to the length of its legs, which can easily penetrate even well-fortified armor. It is almost impossible to meet them alone, which in itself turns this insect into even more dangerous adversary. " );
			AI_Print(concatText);
		}
		else
		{
			if (( Blattcrawler_B1 >=  10 ) && ( Blattcrawler_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Богомол'");
				Log_AddEntry( TOPIC_BEAST_BLATTCRAWLER , " Main benefits: good defense against all melee weapons " );
				Log_AddEntry( TOPIC_BEAST_BLATTCRAWLER , " Weak Spots : Has weak defense against ranged weapons, fire, and magic " );
				AI_Print(concatText);
				Blattcrawler_B2 = TRUE;
			}
			else  if (( Blattcrawler_B1 >=  20 ) && ( Blattcrawler_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Богомол'");
				Log_AddEntry( TOPIC_BEAST_BLATTCRAWLER , " Combat Tactics: It is easiest and safest to shoot the praying mantis with a bow or crossbow, however, if it comes to close combat, it is better to try to keep the praying mantis at a distance, away from its powerful paws. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Blattcrawler_B3 = TRUE;
			};
		};

		Blattcrawler_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_BLOODHOUND)
	{
		if(Bloodhound_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Гул'");
			Log_CreateTopic(TOPIC_BEAST_BLOODHOUND,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_BLOODHOUND,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_BLOODHOUND,"A creature that lives strictly in remote areas, such as mountain caves or desert cliffs. Very aggressive and determined, this beast makes everyone who deals with it extremely attentive and cautious. due to their thin body structure and low-lying head on a long neck.But despite their physique, they have very strong legs, allowing them to run fast and jump far.The skin color is brown with shades of gray and black.The ghoul is difficult to kill due to its speed , which gives him a huge advantage.");
			AI_Print(concatText);
		}
		else
		{
			if((Bloodhound_B1 >= 3) && (Bloodhound_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Гул'");
				Log_AddEntry( TOPIC_BEAST_BLOODHOUND , " Main advantages: has incredible hitting power and pretty good protection against melee weapons, magic and fire. " );
				Log_AddEntry( TOPIC_BEAST_BLOODHOUND , " Weaknesses : low health " );
				AI_Print(concatText);
				Bloodhound_B2 = TRUE;
			}
			else if((Bloodhound_B1 >= 5) && (Bloodhound_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Гул'");
				Log_AddEntry( TOPIC_BEAST_BLOODHOUND , " Combat Tactics: You should use 'hit-and-run' tactics as the hum won't give you a chance to hit twice. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Bloodhound_B3 = TRUE;
			};
		};

		Bloodhound_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_GOBBO_BLACK )
	{
		if(Gobbo_Black_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Black Goblin' " );
			Log_CreateTopic(TOPIC_BEAST_GOBBO_BLACK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GOBBO_BLACK,LOG_FAILED);
			It is not uncommon for so-called 'goblin warriors' to appear in gangs of black goblins, apparently performing the role of leaders in black goblin kodles. Stronger in constitution than the rest of their Kindred, they carry more lethal weapons and sometimes even wear something that looks like armor.");
			AI_Print(concatText);
		}
		else
		{
			if((Gobbo_Black_B1 >= 15) && (Gobbo_Black_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Black Goblin' " );
				Log_AddEntry( TOPIC_BEAST_GOBBO_BLACK , " Main advantages: speed and agility make the black goblin a very difficult target for both melee and ranged weapons; better armed than ordinary goblins, some of them protected by light armor " );
				Log_AddEntry( TOPIC_BEAST_GOBBO_BLACK , " Weak Points : Has fairly weak defense against ranged weapons, magic, and fire " );
				AI_Print(concatText);
				Gobbo_Black_B2 = TRUE;
			}
			else if((Gobbo_Black_B1 >= 30) && (Gobbo_Black_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Black Goblin' " );
				Log_AddEntry( TOPIC_BEAST_GOBBO_BLACK , " Combat Tactics: Combat Tactics with Black Goblins is no different from regular Goblins. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Gobbo_Black_B3 = TRUE;
			};
		};

		Gobbo_Black_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_ICEWOLF )
	{
		if(Icewolf_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Белый волк'");
			Log_CreateTopic(TOPIC_BEAST_ICEWOLF,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ICEWOLF,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ICEWOLF,"Unlike normal wolves, these beasts live exclusively in icy and snowy areas. They have a strictly white coat color, sometimes with shades of gray, which gives them a protective color in their natural environment. Their red eyes are especially frightening. Like and other wolves, snow wolves live in large packs with rare exceptions. Hunting in packs gives them a major advantage against their prey. Snow wolves are much stronger than normal wolves, and their mouths are full of sharp fangs. Thanks to their strength and hunting skills, they can hunt any animal Almost every snow animal is on their menu, mostly deer and wild boar, these beasts are difficult opponents for fighters due to the fact that they are almost never seen alone.If one member of the pack is attacked, the others will immediately rush to his aid.");
			AI_Print(concatText);
		}
		else
		{
			if((Icewolf_B1 >= 5) && (Icewolf_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Белый волк'");
				Log_AddEntry( TOPIC_BEAST_ICEWOLF , " Main advantages: able to run fast, have good protection against melee weapons and more health than normal wolves " );
				Log_AddEntry( TOPIC_BEAST_ICEWOLF , " Weak Spots : Has weak defense against ranged weapons, magic, and fire " );
				AI_Print(concatText);
				Icewolf_B2 = TRUE;
			}
			else if((Icewolf_B1 >= 10) && (Icewolf_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Белый волк'");
				Log_AddEntry( TOPIC_BEAST_ICEWOLF , " Combat tactics: Snow wolves are best killed one by one, because in a pack they are a huge danger. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Icewolf_B3 = TRUE;
			};
		};

		Icewolf_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_KEILER )
	{
		if (Boar_B1 ==  FALSE )
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Дикий кабан'");
			Log_CreateTopic( TOPIC_BEAST_KEILER , LOG_MISSION );
			Log_SetTopicStatus(TOPIC_BEAST_KEILER,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_KEILER , " Wild boars can be found almost everywhere - on roads, in forests, in mountains, in caves, near water bodies and in other places. They are not found both in the sandy desert and in the snowy one. Sharp, like a blade, fangs they crown the muzzle of wild boars - in males they reach truly terrifying sizes, capable of simply tearing apart the enemy. Wild boars are extremely aggressive and attack as soon as they see the target. They are found both in packs and singly. " );
			AI_Print(concatText);
		}
		else
		{
			if ((Boar_B1 >=  10 ) && (Boar_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Дикий кабан'");
				Log_AddEntry( TOPIC_BEAST_KEILER , " Primary benefits: good defense against melee weapons, goes into unbridled rage when attacked " );
				Log_AddEntry( TOPIC_BEAST_KEILER , " Weaknesses : Has fairly weak defense against ranged weapons, magic, and fire " );
				AI_Print(concatText);
				Keiler_B2 = TRUE ;
			}
			else  if ((Keiler_B1 >=  20 ) && (Keiler_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Дикий кабан'");
				Log_AddEntry( TOPIC_BEAST_KEILER , " Combat Tactics: It's better to use bows or crossbows when fighting wild boars. In close combat, these monsters are pretty strong and can instantly kill you. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Keiler_B3 = TRUE ;
			};
		};

		Boar_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_ZOMBIE )
	{
		if(Zombie_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Зомби'");
			Log_CreateTopic(TOPIC_BEAST_ZOMBIE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ZOMBIE,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ZOMBIE,"Zombies - beliar dogs - the unenviable future of those who during their lifetime did more dirty deeds than righteous ones. Their spirit is forcibly returned from Darkness and placed in punishment by existence in rotting flesh. The torment will last as long as the dark shell magic. Zombies have an amazing sense of smell, easily navigate in dark rooms. They are indifferent to any damage - their flesh has long felt nothing. You can stop them by cutting off their heads, dismembering the body, destroying the carcass with magic or burning them in a hot fire. The cry of the soul when the destruction of the receptacle will tell the fighter against darkness that the bonds that bind the flesh and spirit of the zombie have fallen.");
			AI_Print(concatText);
		}
		else
		{
			if((Zombie_B1 >= 10) && (Zombie_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Зомби'");
				Log_AddEntry( TOPIC_BEAST_ZOMBIE , " Main benefits: Feel no pain at all, allowing them to relentlessly attack their prey " );
				Log_AddEntry( TOPIC_BEAST_ZOMBIE , " Vulnerable Points: Has extremely weak fire resistance " );
				AI_Print(concatText);
				Zombie_B2 = TRUE;
			}
			else if((Zombie_B1 >= 20) && (Zombie_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Зомби'");
				Log_AddEntry( TOPIC_BEAST_ZOMBIE , " Combat Tactics: The most important thing to consider is that zombies don't feel pain. Their terrifying pressure can confuse you at first. Therefore, your reaction and lightning-fast counterattacks are the main key to success in combat with these monsters. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Zombie_B3 = TRUE;
			};
		};

		Zombie_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_ORCBITER )
	{
		if(OrcBiter_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Орочий кусач'");
			Log_CreateTopic(TOPIC_BEAST_ORCBITER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCBITER,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCBITER,"Small, fast hunters, distant relatives of glorchs and osters, they live mostly in small mountain valleys overgrown with green lush grass, although small packs of these monsters can be found anywhere. Alone they are not very dangerous, but they prefer to stay flocks, and thus the danger emanating from them increases many times.More than anything, they love scavengers, and sometimes you can see how biters chase them, however, most often just for fun, but on occasion they will not refuse human meat. besides, in a flock they clearly feel much more courageous than one by one. ");
			AI_Print(concatText);
		}
		else
		{
			if((OrcBiter_B1 >= 5) && (OrcBiter_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Орочий кусач'");
				Log_AddEntry( TOPIC_BEAST_ORCBITER , " Key Benefits: Can run pretty fast " );
				Log_AddEntry( TOPIC_BEAST_ORCBITER , " Weaknesses : Very weak protection against all weapons and magic " );
				AI_Print(concatText);
				OrcBiter_B2 = TRUE;
			}
			else if((OrcBiter_B1 >= 10) && (OrcBiter_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Орочий кусач'");
				Log_AddEntry( TOPIC_BEAST_ORCBITER , " Combat tactics: when the biter runs towards you, you need to keep your weapon ready. You can either dodge its blow, then attack yourself, or counterattack. " );
				AI_Print(concatText);

				if(ATR_STAMINA_MAX[0] < 100)
				{
					ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;
					ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
					Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
					AI_Print(PRINT_LEARNSTAMINA);
				};

				OrcBiter_B3 = TRUE;
			};
		};

		OrcBiter_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_RAZOR )
	{
		if(Razor_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Бритвозуб'");
			Log_CreateTopic(TOPIC_BEAST_RAZOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_RAZOR,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_RAZOR , " Razorteeth are a related species to the glorchs. And, like the glorchs, these beasts hunt in packs. However, they are much more fearsome, and not only for beginners, but also for experienced warriors. are blinded by rage and attack anything that moves, be it a beast, a person, or just a tree.They hunt even when they are not hungry - just to satisfy their passion for killing, and the danger posed by a pack of these creatures increases according to the square of the number of monsters in flock. " );
			AI_Print(concatText);
		}
		else
		{
			if((Razor_B1 >= 5) && (Razor_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Бритвозуб'");
				Log_AddEntry( TOPIC_BEAST_RAZOR , " Main benefits: excellent protection against melee weapons and fire " );
				Log_AddEntry( TOPIC_BEAST_RAZOR , " Weakness: Poor magic resistance " );
				AI_Print(concatText);
				Razor_B2 = TRUE;
			}
			else if((Razor_B1 >= 10) && (Razor_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Бритвозуб'");
				Log_AddEntry( TOPIC_BEAST_RAZOR , " Combat Tactics: Razortooths are vulnerable to bow and crossbow shots, sensitive to Water magic. But don't count on an easy victory and prepare in advance for a difficult and lightning-fast battle! If you don't kill all the creatures of the pack in a quarter of a minute, they will eat for breakfast the prey that came to them. And they won’t even choke on armor and weapons. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Razor_B3 = TRUE ;
			};
		};

		Razor_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_GHOST )
	{
		if(Ghost_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Призрак'");
			Log_CreateTopic(TOPIC_BEAST_GHOST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GHOST,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_GHOST , " Those who died violent deaths turn into ghosts. Can be found in cemeteries or houses in which they lived during life. Magicians and scientists tirelessly argue about whether souls are really poisoned after death to another world, where eternal joy awaits them or suffering. Both groups, however, agree on what happens to souls that for some reason remain in our world: they become ghosts. Judging by the lamentations of these creatures, it is not worth envying their fate. " );
			AI_Print(concatText);
		}
		else
		{
			if((Ghost_B1 >= 3) && (Ghost_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Призрак'");
				Log_AddEntry( TOPIC_BEAST_GHOST , " Primary Benefits: Completely immune to melee or ranged weapons unless they are made of silver " );
				Log_AddEntry( TOPIC_BEAST_GHOST , " Weaknesses : Has fairly weak protection against magic and fire " );
				AI_Print(concatText);
				Ghost_B2 = TRUE;
			}
			else if((Ghost_B1 >= 5) && (Ghost_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Призрак'");
				Log_AddEntry( TOPIC_BEAST_GHOST , " Combat Tactics: It's best to use weapons made of silver or use normal magic against the ghost. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Ghost_B3 = TRUE;
			};
		};

		Ghost_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_STONEGUARDIAN )
	{
		if(Stoneguardian_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Stoneguard ' " );
			Log_CreateTopic(TOPIC_BEAST_STONEGUARDIAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_STONEGUARDIAN,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_STONEGUARDIAN , " Stone statues animated with magic to protect the temples and dwellings of the Builders from intruders. Their appearance alone deters most burglars. Those who are not frightened by the sight of these formidable monsters usually die shortly after , torn apart by stone claws. " );
			AI_Print(concatText);
		}
		else
		{
			if ((Stoneguardian_B1 >=  10 ) && (Stoneguardian_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Stoneguard ' " );
				Log_AddEntry( TOPIC_BEAST_STONEGUARDIAN , " Main benefits: Nearly immune to ranged weapons, good protection against magic and fire " );
				Log_AddEntry( TOPIC_BEAST_STONEGUARDIAN , " Weak Points : Has very weak defense against any kind of blunt weapon " );
				AI_Print(concatText);
				Stoneguardian_B2 = TRUE;
			}
			else if((Stoneguardian_B1 >= 20) && (Stoneguardian_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Stoneguard ' " );
				Log_AddEntry( TOPIC_BEAST_STONEGUARDIAN , " Combat Tactics: Don't wait for this stone giant to strike first as it could be your last. Attack the monster non-stop, or use magic to quickly destroy it. " );
				AI_Print(concatText);

				if(ATR_STAMINA_MAX[0] < 100)
				{
					ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;
					ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
					Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
					AI_Print(PRINT_LEARNSTAMINA);
				};

				Stoneguardian_B3 = TRUE;
			};
		};

		Stoneguardian_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_STONEPUMA )
	{
		if(StonePuma_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Пума'");
			Log_CreateTopic(TOPIC_BEAST_STONEPUMA,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_STONEPUMA,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_STONEPUMA , " As a rule, cougars live in the southern lands of Khorinis. They have practically no enemies in the environment. The sharp fangs and claws of the cougar, coupled with the huge speed of movement, leave almost no chance for enemies to escape. All this must be taken into account , so as not to become her next victim. Cougars rarely live in packs and prefer to hunt alone. " );
			AI_Print(concatText);
		}
		else
		{
			if ((StonePuma_B1 >=  3 ) && (StonePuma_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Пума'");
				Log_AddEntry( TOPIC_BEAST_STONEPUMA , " Main advantages: huge movement speed, good protection against melee weapons " );
				Log_AddEntry( TOPIC_BEAST_STONEPUMA , " Weakness : Very weak against ranged, fire, and magic " );
				AI_Print(concatText);
				StonePuma_B2 = TRUE;
			}
			else  if ((StonePuma_B1 >=  5 ) && (StonePuma_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Пума'");
				Log_AddEntry( TOPIC_BEAST_STONEPUMA , " Combat Tactics: It's best to use a bow or crossbow to shoot the cougar from afar before it gets to you. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				StonePuma_B3 = TRUE ;
			};
		};

		StonePuma_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SWAMPDRONE )
	{
		if(SwampDrone_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Swamp fly' " );
			Log_CreateTopic(TOPIC_BEAST_SWAMPDRONE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SWAMPDRONE,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_SWAMPDRONE , " Swamp flies are large flying green insects with a venomous sting. They usually live in large swamps. The eyes of swamp flies are underdeveloped, but the sense of smell is very acute, so they smell their prey from afar. Having found a suitable victim, a swarm of swamp flies surrounds and stings her mercilessly to make it impossible to resist. " );
			AI_Print(concatText);
		}
		else
		{
			if((SwampDrone_B1 >= 5) && (SwampDrone_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Swamp fly' " );
				Log_AddEntry( TOPIC_BEAST_SWAMPDRONE , " Key Benefits: Can cause severe poisoning " );
				Log_AddEntry( TOPIC_BEAST_SWAMPDRONE , " Weak Points : Has very weak defense against any type of weapons, magic and fire " );
				AI_Print(concatText);
				SwampDrone_B2 = TRUE;
			}
			else if((SwampDrone_B1 >= 10) && (SwampDrone_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Swamp fly' " );
				Log_AddEntry( TOPIC_BEAST_SWAMPDRONE , " Combat Tactics: The easiest way to destroy swamp flies is with a bow, crossbow, or magic. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				SwampDrone_B3 = TRUE;
			};
		};

		SwampDrone_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SWAMPGOLEM )
	{
		if(Swampgolem_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Swamp Golem' " );
			Log_CreateTopic(TOPIC_BEAST_SWAMPGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SWAMPGOLEM,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_SWAMPGOLEM , " These foul-smelling swamp creatures are incredibly powerful and capable of using magic. They can sometimes be hard to spot in the swamp, making these giants more dangerous foes than other golems. " );
			AI_Print(concatText);
		}
		else
		{
			if((Swampgolem_B1 >= 5) && (Swampgolem_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Swamp Golem' " );
				Log_AddEntry( TOPIC_BEAST_SWAMPGOLEM , " Main advantages: has excellent protection against arrows and bolts, good protection against blunt weapons, fire and magic " );
				Log_AddEntry( TOPIC_BEAST_SWAMPGOLEM , " Weak Points : Has very little protection against cutting weapons " );
				AI_Print(concatText);
				Swampgolem_B2 = TRUE;
			}
			else if((Swampgolem_B1 >= 10) && (Swampgolem_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Swamp Golem' " );
				Log_AddEntry( TOPIC_BEAST_SWAMPGOLEM , " Combat Tactics: Melee combat is almost the only way to get through this pile of dirt and roots. Cutting weapons are most effective. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Swampgolem_B3 = TRUE;
			};
		};

		Swampgolem_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_BLOODFLY )
	{
		if(BloodFly_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Bloodhornet ' " );
			Log_CreateTopic(TOPIC_BEAST_BLOODFLY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_BLOODFLY,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_BLOODFLY , " Bloodhornets are vicious flying devils that congregate at any source of water they can find. With their long, curved stingers, they suck the blood of anyone who dares to get close enough, and the characteristic chirp of their translucent wings sends them flying many small animals. Hornets are not very strong opponents, however, as a rule, they attack the victim with the whole swarm, having previously surrounded it from all sides. " );
			AI_Print(concatText);
		}
		else
		{
			if((BloodFly_B1 >= 15) && (BloodFly_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Bloodhornet ' " );
				Log_AddEntry( TOPIC_BEAST_BLOODFLY , " Main Benefits: Can cause poisoning " );
				Log_AddEntry( TOPIC_BEAST_BLOODFLY , " Weak Points : Has very weak defense against any type of weapons, magic and fire " );
				AI_Print(concatText);
				BloodFly_B2 = TRUE;
			}
			else if((BloodFly_B1 >= 30) && (BloodFly_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Bloodhornet ' " );
				Log_AddEntry( TOPIC_BEAST_BLOODFLY , " Combat Tactics: It is best to destroy the hornets with a bow, crossbow or magic. It is not recommended to come into close contact with them and try to stick them on the edge of the sword, at least until you have heavy armor that reliably protects from their deadly stings. " );
				AI_Print(concatText);
				hero.protection[PROT_POINT] += 1;
				REALPROTPO += 1;
				AI_Print(PRINT_LEARNPROTPOINT);
				BloodFly_B3 = TRUE;
			};
		};

		BloodFly_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_DEMON )
	{
		if(Demon_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Демон'");
			Log_CreateTopic(TOPIC_BEAST_DEMON,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DEMON,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_DEMON , " Demons are creatures of the underworld, the world of death and the fear of Beliar. There are many varieties of demons, but only the smallest and weakest ones allow people to summon themselves and faithfully serve their masters. They are serious opponents and can cause a lot of trouble even to the strong and a brave hero. Demons are one of the most dangerous and powerful inhabitants of this world. Being magical creatures, they are very well protected and endowed with power that is dangerous for almost all kinds of opponents. " );
			AI_Print(concatText);
		}
		else
		{
			if (( Demon_B1 >=  5 ) && ( Demon_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Демон'");
				Log_AddEntry( TOPIC_BEAST_DEMON , " Main advantages: incredible strength, excellent protection against any kind of weapons, magic and fire, huge health pool, has a ranged magic attack " );
				Log_AddEntry( TOPIC_BEAST_DEMON , " Vulnerabilities: - none - " );
				AI_Print(concatText);
				Demon_B2 = TRUE;
			}
			else if((Demon_B1 >= 10) && (Demon_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Демон'");
				Log_AddEntry( TOPIC_BEAST_DEMON , " Combat tactics: the main thing is not to let him hit you or hit you with magic, otherwise the outcome of the battle will be almost a foregone conclusion. " );
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				Demon_B3 = TRUE;
			};
		};

		Demon_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)
	{
		if(DemonLord_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Архидемон'");
			Log_CreateTopic(TOPIC_BEAST_DEMON_LORD,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DEMON_LORD,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DEMON_LORD,"Archidemons are at the head of the demonic hordes and are a kind of elite of the other world. They are too strong for any of the people to dare to deal with them except in battle, but in such a battle, the winner is most often not a person "They are terrible fighters - strong, agile, tenacious and completely invulnerable to conventional weapons. Swords, axes, maces - all this just breaks as soon as they touch them, and arrows and crossbow bolts burn out even in flight. Only a powerful warrior or magician has a chance come out alive from a deadly fight with an archdemon.");
			AI_Print(concatText);
		}
		else
		{
			if (( DemonLord_B1 >=  5 ) && ( DemonLord_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Архидемон'");
				Log_AddEntry( TOPIC_BEAST_DEMON_LORD , " Main advantages: incredible strength, excellent protection against any kind of weapons, magic and fire, huge health pool, has a ranged magic attack " );
				Log_AddEntry( TOPIC_BEAST_DEMON_LORD , " Vulnerabilities: - none - " );
				AI_Print(concatText);
				DemonLord_B2 = TRUE;
			}
			else if((DemonLord_B1 >= 10) && (DemonLord_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Архидемон'");
				Log_AddEntry( TOPIC_BEAST_DEMON_LORD , " Combat Tactics: Any mistake you make while fighting an archdemon will cost you your life. So try not to make them! " );
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				DemonLord_B3 = TRUE;
			};
		};

		DemonLord_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_DRACONIAN)
	{
		if(Draconian_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Звероящер'");
			Log_CreateTopic(TOPIC_BEAST_DRACONIAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DRACONIAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DRACONIAN,"Beast Lizards are a race of bipedal humanoid reptiles similar to lizards. They wear makeshift armor that is red like their scales and are armed with large blades that they wield in combat. Their language is incomprehensible to humans, as it consists of hisses and wheezing. They are also extremely aggressive towards enemies and attack them in a manner similar to orcs. Highly intelligent - able to even forge their own weapons and armor, as well as perform complex duties such as watching dragon eggs or amassing treasures for their masters.") ;
			AI_Print(concatText);
		}
		else
		{
			if((Draconian_B1 >= 15) && (Draconian_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Звероящер'");
				Log_AddEntry( TOPIC_BEAST_DRACONIAN , " Main benefits: huge strength, excellent protection against any kind of weapons, magic and fire, reasonable " );
				Log_AddEntry( TOPIC_BEAST_DRACONIAN , " Vulnerabilities: - none - " );
				AI_Print(concatText);
				Draconian_B2 = TRUE;
			}
			else if((Draconian_B1 >= 30) && (Draconian_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Звероящер'");
				Log_AddEntry( TOPIC_BEAST_DRACONIAN , " Combat Tactics: Your reflexes and high proficiency with melee weapons is the only key to defeating these creatures. " );
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				Draconian_B3 = TRUE;
			};
		};

		Draconian_B1 += 1;	
	}
	else  if ((Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_DRAGON_FIRE ) || (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_DRAGON_BLACK ) || (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_DRAGON_RED ) || ( Beast.aivar[ AIV_MM_REAL_ID ] == ID_DRAGON_RED ) =  ID_DRAGON_ICE ) || (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_DRAGON_ROCK ) || (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_DRAGON_SWAMP) || (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_DRAGON_UNDEAD ))
	{
		if(Dragon_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Дракон'");
			Log_CreateTopic(TOPIC_BEAST_DRAGON_FIRE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DRAGON_FIRE,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_DRAGON_FIRE , " Dragons are ancient creatures that are almost demigods. There were once thousands of them, but gradually, due to centuries, natural disasters or battles, they disappeared to a point where they became little more than a legend according to the people .These are extremely dangerous creatures that can quickly restore their health, as well as possessing immense magical abilities, power and mysterious strength in addition to mental abilities. " );
			AI_Print(concatText);
		}
		else
		{
			if (( Dragon_B1 >=  3 ) && ( Dragon_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Дракон'");
				Log_AddEntry( TOPIC_BEAST_DRAGON_FIRE , " Main advantages: colossal magic and fire damage, incredible protection against any kind of weapons, magic and fire, dragons are intelligent " );
				Log_AddEntry( TOPIC_BEAST_DRAGON_FIRE , " Vulnerabilities: - none - " );
				AI_Print(concatText);
				Dragon_B2 = TRUE;
			}
			else if((Dragon_B1 >= 5) && (Dragon_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Дракон'");
				Log_AddEntry( TOPIC_BEAST_DRAGON_FIRE , " Combat Tactics: Good defense against fire and magic is the only way to stay alive after encountering a dragon. " );
				AI_Print(concatText);
				Dragon_B3 = TRUE;
			};
		};

		Dragon_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_DRAGONSNAPPER )
	{
		if(DragonSnapper_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Dragon Snapper' " );
			Log_CreateTopic(TOPIC_BEAST_DRAGONSNAPPER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DRAGONSNAPPER,LOG_FAILED);
			The main weapon of these reptiles is a mouth full of sharp teeth. These creatures are very fast, first taking their opponents by surprise with their swiftness, and then delivering a single fatal blow.");
			AI_Print(concatText);
		}
		else
		{
			if((DragonSnapper_B1 >= 10) && (DragonSnapper_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Dragon Snapper' " );
				Log_AddEntry( TOPIC_BEAST_DRAGONSNAPPER , " Main advantages: huge movement speed and attack power, excellent protection against any kind of weapons and fire, huge health pool " );
				Log_AddEntry( TOPIC_BEAST_DRAGONSNAPPER , " Weakness: Poor magic resistance " );
				AI_Print(concatText);
				DragonSnapper_B2 = TRUE;
			}
			else if((DragonSnapper_B1 >= 20) && (DragonSnapper_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Dragon Snapper' " );
				Log_AddEntry( TOPIC_BEAST_DRAGONSNAPPER , " Combat tactics: due to their incredible strength and speed, they are one of the most dangerous enemies! Therefore, it is better for an inexperienced warrior to run before the dragon snapper sees him, otherwise it will be too late to escape. " );
				AI_Print(concatText);
				hero.protection[PROT_EDGE] += 1;
				REALPROTEDGE += 1;
				AI_Print(PRINT_LEARNPROTEDGE);
				DragonSnapper_B3 = TRUE;
			};
		};

		DragonSnapper_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_FIREGOLEM )
	{
		if(FireGolem_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Fire Golem' " );
			Log_CreateTopic(TOPIC_BEAST_FIREGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_FIREGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_FIREGOLEM,"Composed of molten rock and purest fire, invulnerable to conventional weapons, never tired, and unable to retreat, these creatures would make perfect soldiers if only one mage could force them to do his bidding. They are half made up of magic, and only magic supports and holds together their liquid body, and the element of fire, whimsically intertwined with smoking stone, allows them to use fragments of the original flame in battle, turning the enemy into smoking remains.They are nowhere near as strong and hardy as their stone counterparts, and not very good at close combat, but no one has lived long enough to meet them in hand-to-hand combat and win - the flames covering them are too hot to hope for victory. ");
			AI_Print(concatText);
		}
		else
		{
			if((FireGolem_B1 >= 3) && (FireGolem_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Fire Golem' " );
				Log_AddEntry( TOPIC_BEAST_FIREGOLEM , " Primary benefits: high damage, high health, immune to fire damage " );
				Log_AddEntry( TOPIC_BEAST_FIREGOLEM , " Weakness: Poor Magic Protection " );
				AI_Print(concatText);
				FireGolem_B2 = TRUE;
			}
			else if((FireGolem_B1 >= 6) && (FireGolem_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Fire Golem' " );
				Log_AddEntry( TOPIC_BEAST_FIREGOLEM , " Combat Tactics: Quick counter-attacks are the main and almost the only way to deal with golems. Also, when you have to face a fire golem, don't forget to stock up on powerful Water magic spells. " );
				AI_Print(concatText);
				hero.protection[PROT_FIRE] += 1;
				REALPROTFIRE += 1;
				AI_Print(PRINT_LEARNPROTFIREZ);
				FireGolem_B3 = TRUE;
			};
		};

		FireGolem_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_FIREWARAN )
	{
		if(FireWaran_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Fire Lizard' " );
			Log_CreateTopic(TOPIC_BEAST_FIREWARAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_FIREWARAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_FIREWARAN,"These reptiles love warmth and serenity and are most likely to be found on sandy seashores, though other warm daytime spots are no less pleasant for these amazing animals. Unlike their simpler cousins, fire lizards are quite formidable opponents. And it's not just about strong skin and almost absolute immunity to Fire magic, but the fact that fire lizards can do what no other creature in all of Khorinis can do - they breathe fire, turning the enemy into smoking embers in a matter of seconds .");
			AI_Print(concatText);
		}
		else
		{
			if((FireWaran_B1 >= 5) && (FireWaran_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Fire Lizard' " );
				Log_AddEntry( TOPIC_BEAST_FIREWARAN , " Primary Benefits: Almost immune to fire damage, deal fire damage " );
				Log_AddEntry( TOPIC_BEAST_FIREWARAN , " Weak Spots : Has weak defense against ranged weapons and magic " );
				AI_Print(concatText);
				FireWaran_B2 = TRUE;
			}
			else if((FireWaran_B1 >= 10) && (FireWaran_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Fire Lizard' " );
				Log_AddEntry( TOPIC_BEAST_FIREWARAN , " Combat Tactics: Don't get close to them, at least not close enough to breathe fire on you - you'll just burn! Shoot them from afar with your bow, or take advantage of the lack of protection against Water magic and destroy their respective spells. " );
				AI_Print(concatText);
				hero.protection[PROT_FIRE] += 1;
				REALPROTFIRE += 1;
				AI_Print(PRINT_LEARNPROTFIREZ);
				FireWaran_B3 = TRUE;
			};
		};

		FireWaran_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_GIANT_BUG)
	{
		if(Giant_Bug_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Полевой жук'");
			Log_CreateTopic(TOPIC_BEAST_GIANT_BUG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GIANT_BUG,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_GIANT_BUG,"These six-legged insects get their name from the wheat fields that are their natural habitat. Farmers are in a constant struggle with field predators that destroy their crops. Field predators are usually light brown in color, but their carapace is slightly darker "They have an oval body, a high and thick shell, and the tentacles are long and thin. The number of these creatures depends, as a rule, on the size of the field in which they live. The larger the territory, the more field predators. They feed mainly on cereals, but some herbs are not excluded. Field predators attack with their front paws. They try to confuse the prey by moving from side to side.");
			AI_Print(concatText);
		}
		else
		{
			if((Giant_Bug_B1 >= 10) && (Giant_Bug_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Полевой жук'");
				Log_AddEntry( TOPIC_BEAST_GIANT_BUG , " Main benefits: - none - " );
				Log_AddEntry( TOPIC_BEAST_GIANT_BUG , " Weak Points : Has very weak defense against ranged, magic and fire weapons " );
				AI_Print(concatText);
				Giant_Bug_B2 = TRUE;
			}
			else if((Giant_Bug_B1 >= 20) && (Giant_Bug_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Полевой жук'");
				Log_AddEntry( TOPIC_BEAST_GIANT_BUG , " Combat Tactics: Field Predators shouldn't be a problem for even a slightly trained fighter who can easily kill them with melee weapons. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Giant_Bug_B3 = TRUE;
			};
		};

		Giant_Bug_B1 += 1;	
	}
	else  if ( Beast . aivar [ AIV_MM_REAL_ID ] ==  MAGE_HEAD_ID ) .
	{
		if ( Gobbo_Shaman_B1 ==  FALSE )
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Goblin Shaman' " );
			Log_CreateTopic(TOPIC_BEAST_GOBBO_MAGE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_GOBBO_MAGE,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_GOBBO_MAGE , " Goblins deeply respect their shamans for their magical abilities, although there is hardly a goblin shaman who knows more than one spell. However, they are able to take advantage of their limited knowledge, fortunately for their tribesmen and unfortunately for adventurers. " );
			AI_Print(concatText);
		}
		else
		{
			if ((Gobbo_Shaman_B1 >=  3 ) && (Gobbo_Shaman_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Goblin Shaman' " );
				Log_AddEntry( TOPIC_BEAST_GOBBO_MAGE , " Main benefits: uses magic runes " );
				Log_AddEntry( TOPIC_BEAST_GOBBO_MAGE , " Weak Points : Has very weak defense against ranged weapons, magic, and fire " );
				AI_Print(concatText);
				Gobbo_Shaman_B2 = TRUE;
			}
			else  if ((Gobbo_Shaman_B1 >=  5 ) && (Gobbo_Shaman_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Goblin Shaman' " );
				Log_AddEntry( TOPIC_BEAST_GOBBO_MAGE , " Combat tactics: It is best to shoot them with a bow or crossbow. In addition, they are practically no danger in close combat. " );
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				Gobbo_Shaman_B3 = TRUE ;
			};
		};

		Gobbo_Shaman_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_HARPY )
	{
		if (Harpie_B1 ==  FALSE )
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Гарпия'");
			Log_CreateTopic(TOPIC_BEAST_HARPY,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_HARPY,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_HARPY,"Abominable flying creatures that nest in old stone ruins and on top of the highest cliffs. Horrible tales abound in Mordrag of harpies carrying babies from their cradles to be eaten or killed in their terrible rites. Of course, this is not more than legend, but there is still a grain of truth in this: harpies are attracted to everything shiny, and their nests often accumulate a lot of completely useless things that sparkle and shimmer in the sun.They are not very strong or tenacious, but they fly excellently, and never do it's all alone. And if a pack of such nightmarish creatures swoop down on you, it will not be easy to fight back.");
			AI_Print(concatText);
		}
		else
		{
			if ((Harpy_B1 >=  5 ) && (Harpy_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Гарпия'");
				Log_AddEntry( TOPIC_BEAST_HARPY , " Main advantages: can fly, has ranged magic attack " );
				Log_AddEntry( TOPIC_BEAST_HARPY , " Weak Points : Has very weak defense against magic and fire " );
				AI_Print(concatText);
				Harpie_B2 = TRUE;
			}
			else  if ((Harpy_B1 >=  10 ) && (Harpy_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Гарпия'");
				Log_AddEntry( TOPIC_BEAST_HARPY , " Combat Tactics: A harpy is not difficult to stab with a sword, but a rare harpy will allow himself to be poked with this barbaric weapon, so shooting harpies with a bow or crossbow gives the best results. Magic, but mostly fire, is a very effective weapon against harpies. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				Harpie_B3 = TRUE;
			};
		};

		Harpy_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_ICEGOLEM )
	{
		if(IceGolem_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Ice Golem' " );
			Log_CreateTopic(TOPIC_BEAST_ICEGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ICEGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ICEGOLEM,"These creatures appear when airbending combines with the purest water of mountain lakes and freezes it, turning it into a jelly-like substance that is no longer liquid, but not yet solid. Like their fiery counterparts, they are not very tenacious, but unlike them, they have not lost the inherent strength of all golems, and close combat with them promises to be difficult.In addition, like fire golems, they are almost invulnerable to all non-magical weapons - they simply get stuck in their structure without causing the slightest harm "Only magic, strong fire magic, can melt magically bound water and destroy them. But beware: the intertwining of air and water magic produces a bizarre result: they are able to throw pieces of ice at the enemy, causing serious damage.");
			AI_Print(concatText);
		}
		else
		{
			if ((IceGolem_B1 >=  5 ) && (IceGolem_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Ice Golem' " );
				Log_AddEntry( TOPIC_BEAST_ICEGOLEM , " Main benefits: huge damage, high health, almost immune to magic damage " );
				Log_AddEntry( TOPIC_BEAST_ICEGOLEM , " Vulnerable Points: Has very weak resistance against fire " );
				AI_Print(concatText);
				IceGolem_B2 = TRUE;
			}
			else if((IceGolem_B1 >= 10) && (IceGolem_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Ice Golem' " );
				Log_AddEntry( TOPIC_BEAST_ICEGOLEM , " Combat tactics: by and large, only strong fire magic can melt the water bound by magical powers and destroy them. " );
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				IceGolem_B3 = TRUE;
			};
		};

		IceGolem_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_LURKER )
	{
		if(Lurker_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Шныг'");
			Log_CreateTopic(TOPIC_BEAST_LURKER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_LURKER,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_LURKER , " These amphibians are semi-aquatic and you will never see them away from water bodies. Water provides them with everything they need to live, and they are ready to wander around the lakeshore all day long, feasting on the succulent roots of aquatic plants and occasionally diving for a particularly appetizing looking fish. They are excellent swimmers and divers, and are able to stay under water indefinitely. But, despite their love of water, they prefer to spend the night in a dry and warm cave, where they lay eggs from time to time and raise offspring. " );
			AI_Print(concatText);
		}
		else
		{
			if ((Lurker_B1 >=  10 ) && (Lurker_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Шныг'");
				Log_AddEntry( TOPIC_BEAST_LURKER , " Main benefits: good defense against melee weapons " );
				Log_AddEntry( TOPIC_BEAST_LURKER , " Weak Points : Has very weak defense against ranged, magic and fire weapons " );
				AI_Print(concatText);
				Lurker_B2 = TRUE;
			}
			else if((Lurker_B1 >= 20) && (Lurker_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Шныг'");
				Log_AddEntry( TOPIC_BEAST_LURKER , " Combat Tactics: Shnygs are not particularly strong opponents, especially since they never unite in packs, and the only obstacle that gets in the way of a young hero is their very high defense against melee weapons. However, they are killed like this with a bow same easy. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Lurker_B3 = TRUE;
			};
		};

		Lurker_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_MINECRAWLER )
	{
		if(Minecrawler_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Ползун'");
			Log_CreateTopic(TOPIC_BEAST_MINECRAWLER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_MINECRAWLER,LOG_FAILED);
			and man digs the deepest mines in Mordrag. They probably feed on fungi and mold growing on the walls of their caves, since no one has ever seen a creeper come to the surface of the earth, where there is other food. ");
			AI_Print(concatText);
		}
		else
		{
			if (( Minecrawler_B1 >=  15 ) && ( Minecrawler_B2 ==  FALSE )) ;
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Ползун'");
				Log_AddEntry( TOPIC_BEAST_MINECRAWLER , " Main benefits: good defense against melee and ranged weapons " );
				Log_AddEntry( TOPIC_BEAST_MINECRAWLER , " Weakness : Very weak against magic and fire " );
				AI_Print(concatText);
				Minecrawler_B2 = TRUE;
			}
			else if((Minecrawler_B1 >= 30) && (Minecrawler_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Ползун'");
				Log_AddEntry( TOPIC_BEAST_MINECRAWLER , " Combat tactics: crawlers are strong opponents, their mandibles can bite a person in half, and their armor is the most durable material in the world among living creatures. But they will not cause much harm to a skilled fighter. In addition, they are completely defenseless against magic , and it's worth taking advantage of. " );
				AI_Print(concatText);
				hero.protection[PROT_POINT] += 1;
				REALPROTPO += 1;
				AI_Print(PRINT_LEARNPROTPOINT);
				Minecrawler_B3 = TRUE;
			};
		};

		Minecrawler_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SPIDER )
	{
		if(Spider_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Паук'");
			Log_CreateTopic(TOPIC_BEAST_SPIDER,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SPIDER,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_SPIDER , " Forest predator about the height of a large dog. It is quite common in deep forests, where it weaves its thin, barely visible - but surprisingly strong web. Confused prey is doomed - after waiting until the 'supper' is exhausted, the spider injects her poison mixed with gastric juice - after which she goes for a walk until the animal or person turns into a lifeless 'flask' with a tasty and nutritious broth. " );
			AI_Print(concatText);
		}
		else
		{
			if((Spider_B1 >= 5) && (Spider_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Паук'");
				Log_AddEntry( TOPIC_BEAST_SPIDER , " Main advantages: good protection against almost any type of damage except magic, instant and lightning attack " );
				Log_AddEntry( TOPIC_BEAST_SPIDER , " Weakness : Very weak against magic " );
				AI_Print(concatText);
				Spider_B2 = TRUE;
			}
			else if((Spider_B1 >= 10) && (Spider_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Паук'");
				Log_AddEntry( TOPIC_BEAST_SPIDER , " Combat Tactics: When fighting a spider, it's better to use a longer weapon to prevent the spider from biting. " );
				AI_Print(concatText);
				hero.protection[PROT_POINT] += 1;
				REALPROTPO += 1;
				AI_Print(PRINT_LEARNPROTPOINT);
				Spider_B3 = TRUE;
			};
		};

		Spider_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_MINECRAWLERWARRIOR )
	{
		if(MinecrawlerWarrior_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Ползун-воин'");
			Log_CreateTopic(TOPIC_BEAST_MINECRAWLERWARRIOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_MINECRAWLERWARRIOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_MINECRAWLERWARRIOR,"Warrior crawlers are real fighters! They combine the strength and durability inherent in these underground creatures, Beliar himself would be proud of his creations. If a simple crawler bites a person in half, then a warrior crawler tears into pieces a six-inch steel thick chitinous plates reliably protect their insides from melee and ranged weapons. Their only weak point is their vulnerability to magic and fire. hand-to-hand combat with them is especially dangerous.");
			AI_Print(concatText);
		}
		else
		{
			if((MinecrawlerWarrior_B1 >= 5) && (MinecrawlerWarrior_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Ползун-воин'");
				Log_AddEntry( TOPIC_BEAST_MINECRAWLERWARRIOR , " Main Benefits: Excellent defense against melee and ranged weapons " );
				Log_AddEntry( TOPIC_BEAST_MINECRAWLERWARRIOR , " Weakness : Very weak against magic and fire " );
				AI_Print(concatText);
				MinecrawlerWarrior_B2 = TRUE;
			}
			else if((MinecrawlerWarrior_B1 >= 10) && (MinecrawlerWarrior_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Ползун-воин'");
				Log_AddEntry( TOPIC_BEAST_MINECRAWLERWARRIOR , " Combat Tactics: It's best to use powerful spells, if you don't have any, and you can't avoid melee - lure them out one at a time, then carry out a swift attack. It is important not to get hit by a warrior crawler: it can cost you life. " );
				AI_Print(concatText);
				hero.protection[PROT_POINT] += 1;
				REALPROTPO += 1;
				AI_Print(PRINT_LEARNPROTPOINT);
				MinecrawlerWarrior_B3 = TRUE;
			};
		};

		MinecrawlerWarrior_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_OREBUG )
	{
		if(OreBug_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Ore Creeper' " );
			Log_CreateTopic(TOPIC_BEAST_OREBUG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_OREBUG,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_OREBUG , " One of the varieties of crawlers that usually live in places where ore veins accumulate. Unlike their relatives, they have a stronger shell that reliably protects them from any type of damage, including magic and fire, as well as huge claws , capable of turning piles of stone into dust. " );
			AI_Print(concatText);
		}
		else
		{
			if((OreBug_B1 >= 10) && (OreBug_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Ore Creeper' " );
				Log_AddEntry( TOPIC_BEAST_OREBUG , " Main benefits: excellent protection against any kind of damage " );
				Log_AddEntry( TOPIC_BEAST_OREBUG , " Vulnerabilities: - none - " );
				AI_Print(concatText);
				OreBug_B2 = TRUE;
			}
			else if((OreBug_B1 >= 20) && (OreBug_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Ore Creeper' " );
				Log_AddEntry( TOPIC_BEAST_OREBUG , " Combat Tactics: You'll have to tinker with these creatures to send them to the next world. They'll send you there without too much trouble if you're not too careful. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				OreBug_B3 = TRUE;
			};
		};

		OreBug_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_MOLERAT )
	{
		if (Molerat_B1 ==  FALSE )
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Кротокрыс'");
			Log_CreateTopic(TOPIC_BEAST_MOLERAT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_MOLERAT,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_MOLERAT,"A cross between a mole and a rat that has grown to gigantic proportions. Covered in naked pink skin, the creature is equipped with a double set of sharp teeth that fit freely in a huge, almost round maw. Mole rats love dry, spacious caves in which many edible mushrooms grow. But, despite the addiction to mushrooms, this is by no means a herbivore, and if you inadvertently wander into its territory, it can bite you decently. it's just not possible anymore.");
			AI_Print(concatText);
		}
		else
		{
			if ((Molerat_B1 >=  10 ) && (Molerat_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Кротокрыс'");
				Log_AddEntry( TOPIC_BEAST_MOLERAT , " Main benefits: - none - " );
				Log_AddEntry( TOPIC_BEAST_MOLERAT , " Weak Points : Very weak against melee, ranged, magic, and fire " );
				AI_Print(concatText);
				Molerat_B2 = TRUE;
			}
			else  if ((Molerat_B1 >=  20 ) && (Molerat_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Кротокрыс'");
				Log_AddEntry( TOPIC_BEAST_MOLERAT , " Combat tactics: mole rats are dangerous only for a beginner, a more experienced fighter will easily chop these clumsy animals for cabbage. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Grind_B3 = TRUE ;
			};
		};

		Grinded_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SKELETON_MAGE )
	{
		if(Skeleton_Mage_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Скелет-маг'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON_MAGE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON_MAGE,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_SKELETON_MAGE , " If experienced warriors become skeleton fighters after death, then magicians become skeleton magicians. As in life, after death, magicians form a kind of aristocracy of the underworld - they direct and control their fighters, and sometimes help them or create new ones. Before it has not yet been clarified where such creatures get energy for existence. " );
			AI_Print(concatText);
		}
		else
		{
			if (( Skeleton_Mage_B1 >=  5 ) && ( Skeleton_Mage_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Скелет-маг'");
				Log_AddEntry( TOPIC_BEAST_SKELETON_MAGE , " Main Benefits: Excellent defense against melee and ranged weapons " );
				Log_AddEntry( TOPIC_BEAST_SKELETON_MAGE , " Weak Points : Has very little resistance against fire " );
				AI_Print(concatText);
				Skeleton_Mage_B2 = TRUE;
			}
			else  if (( Skeleton_Mage_B1 >=  10 ) && ( Skeleton_Mage_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Скелет-маг'");
				Log_AddEntry( TOPIC_BEAST_SKELETON_MAGE , " Combat Tactics: Like all skeletons, it is more vulnerable to blunt weapons than slashes; and, like all skeletons, it is very effective against fire. " );
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				Skeleton_Mage_B3 = TRUE;
			};
		};

		Skeleton_Mage_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_STONEGOLEM )
	{
		if(StoneGolem_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Stone Golem' " );
			Log_CreateTopic(TOPIC_BEAST_STONEGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_STONEGOLEM,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_STONEGOLEM,"Stone golems are creatures born of magic. They appear very rarely and only in a few places in Mordrag when powerful magic fuses with the stones of the mountain peaks and animates them, creating the most bizarre creatures in the world. Born of rocks, these creatures do not know pain and fear, they are unfamiliar with the feeling of fatigue, and possessing considerable strength and dexterity, they are ready to pursue their prey to the last.Neither swords, nor arrows, nor spells are suitable against them, only heavy stone-crushing hammers, or something similar to them can destroy rocks that form the basis of stone golems.");
			AI_Print(concatText);
		}
		else
		{
			if (( StoneGolem_B1 >=  5 ) && ( StoneGolem_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Stone Golem' " );
				Log_AddEntry( TOPIC_BEAST_STONEGOLEM , " Main benefits: excellent defense against melee and ranged weapons " );
				Log_AddEntry( TOPIC_BEAST_STONEGOLEM , " Weakness : Very weak defense against blunt weapons " );
				AI_Print(concatText);
				StoneGolem_B2 = TRUE;
			}
			else  if ((StoneGolem_B1 >=  10 ) && (StoneGolem_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Stone Golem' " );
				Log_AddEntry( TOPIC_BEAST_STONEGOLEM , " Combat Tactics: Only heavy stone crushing hammers or something similar can break the rocks that form the basis of stone golems. " );
				AI_Print(concatText);
				hero.protection[PROT_BLUNT] += 1;
				REALPROTBL += 1;
				AI_Print(PRINT_LEARNPROTBLUNT);
				StoneGolem_B3 = TRUE ;
			};
		};

		StoneGolem_B1 +=  1 ;	
	}
	else  if ((Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SWAMPSHARK ) || (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_DESERTSHARK ))
	{
		if(Swampshark_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Болотожор'");
			Log_CreateTopic(TOPIC_BEAST_SWAMPSHARK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SWAMPSHARK,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"It is difficult to attribute these huge animals to any class of living creatures, especially without a clear idea of ​​\u200b\u200btheir internal structure. Most likely, these are still amphibians, although they could just as well be snakes or annelids "The swamps live, as you might guess, exclusively in swamps, in shallow water well warmed by the sun. They feed on what is found in this swamp, probably - they filter water and silt in search of nutrients or small plants and animals. But it is also accidental to diversify your menu Of course, they will not refuse a man wandering into the swamps. ");
			AI_Print(concatText);
		}
		else
		{
			if((Swampshark_B1 >= 5) && (Swampshark_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Болотожор'");
				Log_AddEntry( TOPIC_BEAST_SWAMPSHARK , " Key Benefits: Excellent defense against melee and ranged weapons " );
				Log_AddEntry( TOPIC_BEAST_SWAMPSHARK , " Weakness : Very weak against magic and fire " );
				AI_Print(concatText);
				Swampshark_B2 = TRUE;
			}
			else if((Swampshark_B1 >= 10) && (Swampshark_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Болотожор'");
				Log_AddEntry(TOPIC_BEAST_SWAMPSHARK,"Battle tactics: they are serious opponents, not very fast, but implacable, like death itself, chasing their prey to the last. And if you see a swamp-eater approaching you, it's better not to risk it - get out of its way as far as possible. The chitin plates overlapping their entire round long body are very strong, and only a man of rare strength, armed with a strong sharp sword, manages to break through them.They are protected from arrows as well as from weapons, and it makes no sense to shoot them with a bow or a crossbow. They are also not easy to hit with magic, although it is possible; they simply have no weak points.");
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Swampshark_B3 = TRUE;
			};
		};

		Swampshark_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_TROLL )
	{
		if(Troll_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Тролль'");
			Log_CreateTopic(TOPIC_BEAST_TROLL,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_TROLL,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_TROLL , " Trolls are the largest and most clumsy beasts of Mordrag, very large already at a young age, and by old age reaching simply gigantic sizes. A troll is a very serious enemy, dangerous not for its size or strength, but for its protection and resistance to literally everything "He can't be killed with a bow or crossbow - arrows and bolts just get stuck in his thick hide and the layer of fat underneath. He has almost absolute protection against magic, only the most powerful spells work against him. " );
			AI_Print(concatText);
		}
		else
		{
			if((Troll_B1 >= 5) && (Troll_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Тролль'");
				Log_AddEntry( TOPIC_BEAST_TROLL , " Main advantages: has incredible hitting power, excellent protection against any type of melee or ranged weapon " );
				Log_AddEntry( TOPIC_BEAST_TROLL , " Vulnerabilities: too slow attack speed " );
				AI_Print(concatText);
				Troll_B2 = TRUE;
			}
			else if((Troll_B1 >= 10) && (Troll_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Тролль'");
				Log_AddEntry( TOPIC_BEAST_TROLL , " Combat Tactics: Trolls are very clumsy, and while he swings to make a hit, you will have time to dodge ten times and hit three times. It is best to run behind him and hit while he turns, and when he turns, repeat maneuver. The main thing is not to miss his blow, otherwise it can become fatal for you. " );
				AI_Print(concatText);
				hero.protection[PROT_BLUNT] += 1;
				REALPROTBL += 1;
				AI_Print(PRINT_LEARNPROTBLUNT);
				Troll_B3 = TRUE;
			};
		};

		Troll_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_OGRE )
	{
		if (Ogre_B1 ==  FALSE )
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Огр'");
			Log_CreateTopic(TOPIC_BEAST_OGRE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_OGRE,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_OGRE , " Ogres can usually be found walking through forests and also descending into caves. Ogres rarely go alone, but even without their relatives, an ogre is extremely dangerous, as its 'flail' hits painfully and accurately. " );
			AI_Print(concatText);
		}
		else
		{
			if (( Ogre_B1 >=  5 ) && ( Ogre_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Огр'");
				Log_AddEntry( TOPIC_BEAST_OGRE , " Main advantages: good protection against any kind of damage, excellent use of melee weapons and a large supply of health " );
				Log_AddEntry( TOPIC_BEAST_OGRE , " Vulnerabilities: - none - " );
				AI_Print(concatText);
				Ogre_B2 = TRUE;
			}
			else if((Ogre_B1 >= 10) && (Ogre_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Огр'");
				Log_AddEntry( TOPIC_BEAST_OGRE , " Combat tactics: it is recommended to fight with a long weapon or attack from a distance " );
				AI_Print(concatText);

				if(ATR_STAMINA_MAX[0] < 100)
				{
					ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;
					ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
					Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
					AI_Print(PRINT_LEARNSTAMINA);
				};

				Ogre_B3 = TRUE ;
			};
		};

		Ogre_B1 +=  1 ;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK) || (Beast.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK_CAVE) || (Beast.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK_ICE))
	{
		if(Troll_Black_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Black Troll' " );
			Log_CreateTopic(TOPIC_BEAST_TROLL_BLACK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_TROLL_BLACK,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_TROLL_BLACK,"The black troll is the strongest living creature! Its appearance can instill fear in even the bravest hunters. Unlike a normal troll, its coloration is light black with shades of gray. Black trolls are larger, stronger and more intimidating than ordinary trolls "Their hands are huge hammers that can flatten the enemy with one powerful blow. Very remarkable is their head with a mouth full of huge teeth and shining white eyes. On the top of his head are two large horns. Black trolls live alone in rocky areas with a couple of trees around.They find themselves a cave in which they often guard precious treasures.They are at the top of the food chain, as they are absolute predators, eating anything too slow to escape from their huge fists.They have no natural enemies.");
			AI_Print(concatText);
		}
		else
		{
			if((Troll_Black_B1 >= 3) && (Troll_Black_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Black Troll' " );
				Log_AddEntry( TOPIC_BEAST_TROLL_BLACK , " Main advantages: has incredible hitting power, excellent protection against any kind of melee or ranged weapons, magic and fire " );
				Log_AddEntry( TOPIC_BEAST_TROLL_BLACK , " Vulnerabilities: too slow attack speed " );
				AI_Print(concatText);
				Troll_Black_B2 = TRUE;
			}
			else if((Troll_Black_B1 >= 5) && (Troll_Black_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Black Troll' " );
				Log_AddEntry( TOPIC_BEAST_TROLL_BLACK , " Combat Tactics: Trolls are very clumsy, and while he swings to make a hit, you will have time to dodge ten times and hit three times. It is best to run behind him and hit while he is turning, and when he turns, repeat maneuver. " );
				AI_Print(concatText);
				hero.protection[PROT_BLUNT] += 1;
				REALPROTBL += 1;
				AI_Print(PRINT_LEARNPROTBLUNT);
				Troll_Black_B3 = TRUE;
			};
		};

		Troll_Black_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_WARG )
	{
		if (Warg_B1 ==  FALSE )
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Варг'");
			Log_CreateTopic(TOPIC_BEAST_WARG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_WARG,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_WARG,"Warg is a dark-furred beast, strong and ruthless. It is easily recognizable by its completely black coat and dark red eyes. Wargs live in dense forests, near swamps and caves. In dangerous times, in search of food, they leave forests and Wargs head for open areas Like most predators, wargs eat any meat Wolves are their usual prey Wargs keep in groups of several individuals Wargs are notorious among the inhabitants of Myrtana because of their evil disposition, which is especially manifested in bloody times They are often tamed by orcs and used as watchdogs.");
			AI_Print(concatText);
		}
		else
		{
			if (( Warg_B1 >=  10 ) && ( Warg_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Варг'");
				Log_AddEntry( TOPIC_BEAST_WARG , " Main advantages: able to run fast, has excellent protection against melee and ranged weapons, in addition, wargs hunt and attack in packs " );
				Log_AddEntry( TOPIC_BEAST_WARG , " Weakness : Very weak against magic and fire " );
				AI_Print(concatText);
				Warg_B2 = TRUE;
			}
			else  if ((Warg_B1 >=  20 ) && (Warg_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Варг'");
				Log_AddEntry( TOPIC_BEAST_WARG , " Combat Tactics: First, you should lure one Warg from the pack, and then kill the entire group one by one " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,10);
				Warg_B3 = TRUE;
			};
		};

		Warg_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SKELETON )
	{
		if(Skeleton_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Скелет'");
			Log_CreateTopic(TOPIC_BEAST_SKELETON,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON,"Skeletons are the remains of people who were once buried in the wrong place or without observing the necessary rites of purification. They cannot be considered full-fledged people, since absolutely nothing remains of their former personality in these heaps of old bones. But, nevertheless, they possess some kind of mind, or at least a semblance of it. Perverted, of course, like all creatures raised from their graves by the black magic of Beliar. In their round, sparkling skull in the sun, one single thought was firmly planted: to kill all who are not undead—and they execute it brilliantly.");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_B1 >= 15) && (Skeleton_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Скелет'");
				Log_AddEntry(TOPIC_BEAST_SKELETON,"Основные преимущества: отлично владеют оружием ближнего и дальнего боя, носят доспехи, обладают абсолютным иммунитетом к колющему типу оружия, стрелам и болтам");
				Log_AddEntry(TOPIC_BEAST_SKELETON,"Уязвимые места: имеет очень слабую защиту против дробящего оружия ");
				AI_Print(concatText);
				Skeleton_B2 = TRUE;
			}
			else if((Skeleton_B1 >= 30) && (Skeleton_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Скелет'");
				Log_AddEntry(TOPIC_BEAST_SKELETON,"Тактика боя: есть несколько хитростей борьбы с ними: стрелы почти не причиняют им вреда, да и магия действует не ахти, а вот дробящее оружие вроде молотов и дубин действует вдвое лучше рубящего — мечей и топоров.");
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				Skeleton_B3 = TRUE;
			};
		};

		Skeleton_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_ORCWARRIOR )
	{
		if(OrcWarrior_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Орк'");
			Log_CreateTopic(TOPIC_BEAST_ORCWARRIOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCWARRIOR,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCWARRIOR,"Orcs are the second intelligent race of Mordrag, and the only one capable of competing on equal terms with humans and human culture. Many believe that orcs, unlike humans, are the offspring of Beliar, but this view is not entirely correct. Of course, it is logical to assume that if people were created by Innos, then the orcs appeared at the behest of the god of darkness, but there is no evidence for this, and the origin of the orcs is a mystery, the answer to which has long been lost for centuries. Orc warriors are the main fighting force of the orc army. They know very well their work, and their armor can compete with the shells of crawlers in strength.A meeting with them does not bode well even for a trained warrior, and the novice is threatened with instant death.They rarely walk alone, more often in a group of three to five orcs, and a fight with them is never easy.");
			AI_Print(concatText);
		}
		else
		{
			if (( OrcWarrior_B1 >=  15 ) && ( OrcWarrior_B2 ==  FALSE )) ;
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Орк'");
				Log_AddEntry( TOPIC_BEAST_ORCWARRIOR , " Main advantages: good at melee and ranged weapons, wear armor, intelligent, attack in groups " );
				Log_AddEntry( TOPIC_BEAST_ORCWARRIOR , " Weakness : Very weak against magic and fire " );
				AI_Print(concatText);
				OrcWarrior_B2 = TRUE;
			}
			else if((OrcWarrior_B1 >= 30) && (OrcWarrior_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Орк'");
				Log_AddEntry( TOPIC_BEAST_ORCWARRIOR , " Combat tactics: they have the least resistance to magic and arrows, but you will have to use quite powerful spells, because weak ones will only provoke them. " );
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				OrcWarrior_B3 = TRUE;
			};
		};

		OrcWarrior_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SKELETON_LORD )
	{
		if(Skeleton_Lord_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Shadow Lord' " );
			Log_CreateTopic(TOPIC_BEAST_SKELETON_LORD,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON_LORD,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON_LORD,"Caves shrouded in the darkness of an ancient curse, deserted moorlands, places of ancient battles, dense thickets of an impenetrable forest in which terrible things happened. There are many places where you can meet the lord of shadows, a former brave warrior who, after death, turned into a monster that knows no mercy, although can one speak of them 'after death'? it is a matter of honor for every warrior to deprive such creatures of even the shadow of their ghostly life by killing them and scattering their ashes to the wind. Although this is an extremely difficult task! After all, this is the elite of the afterlife.");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_Lord_B1 >= 10) && (Skeleton_Lord_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Shadow Lord' " );
				Log_AddEntry( TOPIC_BEAST_SKELETON_LORD , " Main benefits: excellent melee and ranged weapons, wear armor, have absolute immunity to piercing weapons, arrows and bolts, good protection against magic and fire " );
				Log_AddEntry( TOPIC_BEAST_SKELETON_LORD , " Vulnerabilities: - none - " );
				AI_Print(concatText);
				Skeleton_Lord_B2 = TRUE;
			}
			else if((Skeleton_Lord_B1 >= 20) && (Skeleton_Lord_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Shadow Lord' " );
				Log_AddEntry( TOPIC_BEAST_SKELETON_LORD , " Combat Tactics: You will need all your strength and skill to defeat this truly deadly enemy. " );
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				Skeleton_Lord_B3 = TRUE;
			};
		};

		Skeleton_Lord_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST)
	{
		if(Skeleton_Priest_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Cursed Priest' " );
			Log_CreateTopic(TOPIC_BEAST_SKELETON_PRIEST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SKELETON_PRIEST,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Проклятый жрец - крайне опасные соперники, атакующие магией на расстоянии и умело использующие посох в ближнем бою. Кроме того, любое соприкосновение с ним вызывает жуткую боль, поскольку он окружен защитной аурой проклятия!");
			AI_Print(concatText);
		}
		else
		{
			if((Skeleton_Priest_B1 >= 5) && (Skeleton_Priest_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Проклятый жрец'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Основные преимущества: превосходно владеют оружием ближнего боя и магией, носят доспехи, обладают абсолютным иммунитетом к колющему типу оружия, стрелам и болтам, хорошая защита от магии и огня");
				Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Уязвимые места: - нет -");
				AI_Print(concatText);
				Skeleton_Priest_B2 = TRUE;
			}
			else if((Skeleton_Priest_B1 >= 10) && (Skeleton_Priest_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Проклятый жрец'");
				Log_AddEntry(TOPIC_BEAST_SKELETON_PRIEST,"Тактика боя: лучше всего использовать против них могущественную магию или огонь.");
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				Skeleton_Priest_B3 = TRUE;
			};
		};

		Skeleton_Priest_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_DARKGUARD)
	{
		if(DarkGuard_B1 == FALSE)
		{
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Демоникон'");
			Log_CreateTopic(TOPIC_BEAST_DARKGUARD,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_DARKGUARD,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Демоникон — могущественный демон из иного измерения, порождение Белиара, которое никогда не должен был увидеть Мордраг.");
			AI_Print(concatText);
		}
		else
		{
			if((DarkGuard_B1 >= 5) && (DarkGuard_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Демоникон'");
				Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Основные преимущества: молниеносная и очень мощная атака, отличная защита ото всех видов урона");
				Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Уязвимые места: - нет -");
				AI_Print(concatText);
				DarkGuard_B2 = TRUE;
			}
			else if((DarkGuard_B1 >= 10) && (DarkGuard_B3 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Демоникон'");
				Log_AddEntry(TOPIC_BEAST_DARKGUARD,"Тактика боя: в бою с этой разновидностью демонов лучше всего использовать длинное оружие, чтобы держаться подальше от его острых, как бритва, когтей.");
				AI_Print(concatText);
				DarkGuard_B3 = TRUE;
			};
		};

		DarkGuard_B1 += 1;	
	}
	else if(Beast.aivar[AIV_MM_REAL_ID] == ID_WARAN)
	{
		if(Waran_B1 == FALSE)
		{
			concatText = "Добавлена запись в бестиарий - '";
			concatText = ConcatStrings(concatText,"Варан'");
			Log_CreateTopic(TOPIC_BEAST_WARAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_WARAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_WARAN,"Ящерицы — огромные рептилии, любящие греться на солнышке на теплом песочке. Обитают они чаще всего на песчаных пляжах у водоемов — как и всяким рептилиям, им нужны тепло, свет и вода, хотя их можно встретить во многих местах, хорошо прогревающихся днем и не слишком холодных ночью. Они плотоядные, и явно считают человека лучшей добычей из всех, какие только существуют, поэтому близко к ним лучше не подходить. Но бойцы они довольно посредственные, и убить их легко, в отличие от их огненных сородичей.");
			AI_Print(concatText);
		}
		else
		{
			if((Waran_B1 >= 10) && (Waran_B2 == FALSE))
			{
				concatText = "Добавлена запись в бестиарий - '";
				concatText = ConcatStrings(concatText,"Варан'");
				Log_AddEntry(TOPIC_BEAST_WARAN,"Основные преимущества: неплохая защита от оружия ближнего боя");
				Log_AddEntry(TOPIC_BEAST_WARAN,"Уязвимые места: имеет очень слабую защиту против оружия дальнего боя, магии и огня");
				AI_Print(concatText);
				Waran_B2 = TRUE;
			}
			else  if ((Word_B1 >=  20 ) && (Word_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Варан'");
				Log_AddEntry( TOPIC_BEAST_WARAN , " Combat Tactics: They are easy to kill, unlike their fiery relatives. The main thing is not to let them bite you, and the rest, as they say, is a matter of technique. " );
				AI_Print(concatText);
				Waran_B3 = TRUE;
			};
		};

		Spear_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_ORCELITE )
	{
		if(OrcElite_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Черный орк'");
			Log_CreateTopic(TOPIC_BEAST_ORCELITE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCELITE,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_ORCELITE , " Black Orcs are an elite warrior caste. They are much stronger and more resilient than ordinary Orcs, and in addition, they are excellent at using weapons. Dressed in heavy Orc armor, and generally occupy a dominant position in the Orc community. " );
			AI_Print(concatText);
		}
		else
		{
			if (( OrcElite_B1 >=  10 ) && ( OrcElite_B2 ==  FALSE )) ;
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Черный орк'");
				Log_AddEntry( TOPIC_BEAST_ORCELITE , " Main advantages: huge strength, excellent defense against any type of weapon, reasonable, excellent use of melee weapons " );
				Log_AddEntry( TOPIC_BEAST_ORCELITE , " Weakness: Poor fire and magic resistance " );
				AI_Print(concatText);
				OrcElite_B2 = TRUE;
			}
			else  if ((OrcElite_B1 >=  20 ) && (OrcElite_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Черный орк'");
				Log_AddEntry( TOPIC_BEAST_ORCELITE , " Combat Tactics: They are very good in combat and really hard to defeat. Only a very strong person with a reliable blade can hope to break through their armor. " );
				AI_Print(concatText);

				if(hero.HitChance[NPC_TALENT_1H] >= hero.HitChance[NPC_TALENT_2H])
				{
					B_AddFightSkill(hero,NPC_TALENT_1H,1);
					//DoCheckFightSkill1H = TRUE;
					AI_Print(PRINT_BONUS1HFIGHT);
				}
				else
				{
					B_AddFightSkill(hero,NPC_TALENT_2H,1);
					//DoCheckFightSkill2H = TRUE;
					AI_Print(PRINT_BONUS2HFIGHT);
				};

				OrcElite_B3 = TRUE;
			};
		};

		OrcElite_B1 +=  1 ;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_ORCSHAMAN )
	{
		if ( OrcShaman_B1 ==  FALSE )
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText,"Орк-шаман'");
			Log_CreateTopic(TOPIC_BEAST_ORCSHAMAN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_ORCSHAMAN,LOG_FAILED);
			Log_AddEntry(TOPIC_BEAST_ORCSHAMAN,"Magic is one, and orcs in their temples use the same techniques and rituals as their fellow humans in monasteries and laboratories. But only people who can command the elements are called magicians, and orcs who are subject to all four components of the universe are shamans. Shamans, or sons of spirits, to use the language of orcs, are the ones who actually govern orc society. In this, orcs are similar to humans. But if in human society the king rules the country, and magicians play the role of more of an advisory body, then for every orc, the word of any shaman is law, not least because those who disagree with their opinion are immediately turned into a pile of ashes by shamans.");
			AI_Print(concatText);
		}
		else
		{
			if ((OrcShaman_B1 >=  10 ) && (OrcShaman_B2 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Орк-шаман'");
				Log_AddEntry( TOPIC_BEAST_ORCSHAMAN , " Main Benefits: Can use Fire Magic " );
				Log_AddEntry( TOPIC_BEAST_ORCSHAMAN , " Weak spots: has weak defense against ranged weapons " );
				AI_Print(concatText);
				OrcShaman_B2 = TRUE;
			}
			else  if ((OrcShaman_B1 >=  20 ) && (OrcShaman_B3 ==  FALSE ))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText,"Орк-шаман'");
				Log_AddEntry( TOPIC_BEAST_ORCSHAMAN , " Combat tactics: two combat tactics are possible here: either you zigzag, dodging their fireballs, get close to the shamans as quickly as possible and impose close combat on them, or, conversely, shoot from afar with a bow or crossbow, again not forgetting to dodge oncoming spells. Magic has practically no effect on shamans - only fire spells can cause them some damage. " );
				AI_Print(concatText);
				hero.protection[PROT_MAGIC] += 1;
				REALPROTMAGIC += 1;
				AI_Print(PRINT_LEARNPROTMAGICZ);
				OrcShaman_B3 = TRUE;
			};
		};

		OrcShaman_B1 +=  1 ;	
	}
	else  if ((Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_UNDEADORCWARRIOR ) || (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_UNDEADORCSHAMAN ))
	{
		if(UndeadOrcWarrior_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Damn Orc' " );
			Log_CreateTopic(TOPIC_BEAST_UNDEADORCWARRIOR,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_UNDEADORCWARRIOR,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_UNDEADORCWARRIOR , " If the best human warriors turn into skeletons after death, then the fearless orc warriors, ending their lives, sometimes become immortal warriors in the form of undead. They are always on the alert, always ready to destroy an intruder, never weaken their attention for a minute , and at the same time do not require anything in return. Nothing at all... " );
			AI_Print(concatText);
		}
		else
		{
			if((UndeadOrcWarrior_B1 >= 5) && (UndeadOrcWarrior_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Damn Orc' " );
				Log_AddEntry( TOPIC_BEAST_UNDEADORCWARRIOR , " Main advantages: huge strength, excellent defense against any type of weapon, reasonable, excellent use of melee weapons " );
				Log_AddEntry( TOPIC_BEAST_UNDEADORCWARRIOR , " Weak spots: has weak fire and magic resistance " );
				AI_Print(concatText);
				UndeadOrcWarrior_B2 = TRUE;
			}
			else if((UndeadOrcWarrior_B1 >= 10) && (UndeadOrcWarrior_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Damn Orc' " );
				Log_AddEntry( TOPIC_BEAST_UNDEADORCWARRIOR , " Combat Tactics: They are serious fighters, and fighting them will be especially difficult. " );
				AI_Print(concatText);
				UndeadOrcWarrior_B3 = TRUE;
			};
		};

		UndeadOrcWarrior_B1 += 1;	
	}
	else  if (Beast.aivar[ AIV_MM_REAL_ID ] ==  ID_SANDGOLEM )
	{
		if(SandGolem_B1 == FALSE)
		{
			concatText = " Added entry to the bestiary - ' " ;
			concatText = ConcatStrings(concatText, " Sandspout ' " );
			Log_CreateTopic(TOPIC_BEAST_SANDGOLEM,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BEAST_SANDGOLEM,LOG_FAILED);
			Log_AddEntry( TOPIC_BEAST_SANDGOLEM , " A creature of sand and wind, spawned by the magic of this world. In appearance, they can sometimes be indistinguishable from a small sandstorm, but woe to those who make such a mistake. Punishment will follow immediately... " );
			AI_Print(concatText);
		}
		else
		{
			if((SandGolem_B1 >= 2) && (SandGolem_B2 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Sandspout ' " );
				Log_AddEntry( TOPIC_BEAST_SANDGOLEM , " Primary Benefits: Immune to any kind of physical damage " );
				Log_AddEntry( TOPIC_BEAST_SANDGOLEM , " Weakness: Poor fire and magic resistance " );
				AI_Print(concatText);
				SandGolem_B2 = TRUE;
			}
			else if((SandGolem_B1 >= 3) && (SandGolem_B3 == FALSE))
			{
				concatText = " Added entry to the bestiary - ' " ;
				concatText = ConcatStrings(concatText, " Sandspout ' " );
				Log_AddEntry( TOPIC_BEAST_SANDGOLEM , " Combat Tactics: If you're a mage, consider yourself lucky. Otherwise, stock up on a lot of scrolls first. Without them, you won't be able to defeat this creature. " );
				AI_Print(concatText);
				B_RaiseAttribute(hero,ATR_DEXTERITY,1);
				SandGolem_B3 = TRUE ;
			};
		};

		SandGolem_B1 +=  1 ;	
	};
};

func void b_givebonusforelitemonster(var int bunusho6)
{
	var string concattextbonus;

	hero.lp = hero.lp + bunusho6;
	concattextbonus = ConcatStrings(PRINT_BONUSLP_2,IntToString(bunusho6));
	concattextbonus = ConcatStrings(concattextbonus,PRINT_BONUSLP_8);
	AI_Print(PRINT_BONUSLP_1);
	AI_Print(concattextbonus);
	Snd_Play("CS_BOSSKILL");
};

func void ZS_Dead()
{
	var C_Npc outter;
	var C_Npc her;
	var C_Npc HD01;
	var C_Npc HD02;
	var C_Npc HD03;
	var C_Npc HaniarD;
	var C_Npc CorGalomDemon;
	var int skillbonus;
	var string concatText;
	var string concatexttext;
	var int permvaluexp;
	var int randvalueexp;
	var int randindexstrmonster;
	var int bonuslpgivehero;
	var C_Item otherweap;
	var int DayGoneZStop;
	var int RanSumm;
	
	self.aivar[AIV_MM_RoamEnd] = FALSE ;
	Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
	Ext_RemoveFromSlot(self,"BIP01 L HAND");
	Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ogre))
	{
		Snd_Play("OGRE_DIE");
	};
	if(self.guild == GIL_DRAGON)
	{
		Snd_Play("DRAGON_WRATH_01");
	};
	if(self.guild <= GIL_SEPERATOR_HUM)
	{
		self.bodymass = FALSE;
	};
	if((Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE) && (HeroTRANS == FALSE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		B_LogBeast(self);
		B_RuneProcCheck(self,other);
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_MAGE)
	{
		Npc_RemoveInvItems(self,ItMi_GoblinRune,Npc_HasItems(self,ItMi_GoblinRune));
		Npc_RemoveInvItems(self,ItMw_1h_Gobbo_Hammer,Npc_HasItems(self,ItMw_1h_Gobbo_Hammer));
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)
	{
		Npc_RemoveInvItems(self,ItMw_1h_MISC_Sword,Npc_HasItems(self,ItMw_1h_MISC_Sword));
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)
	{
		Npc_RemoveInvItems(self,ItMw_1h_MISC_Sword,Npc_HasItems(self,ItMw_1h_MISC_Sword));
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GOBBO_BLACK_UNIQ))
	{
		Npc_RemoveInvItems(self,ItMw_1H_GoblinTotem,Npc_HasItems(self,ItMw_1H_GoblinTotem));
	};
	if(Npc_HasItems(self,ItMw_2H_Axe_L_01) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_2H_Axe_L_01,Npc_HasItems(self,ItMw_2H_Axe_L_01));
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST)
	{
		Npc_RemoveInvItems(self,ITMW_2H_DOOMSWORD_PreElite,Npc_HasItems(self,ITMW_2H_DOOMSWORD_PreElite));
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE_OM)
	{
		Npc_RemoveInvItems(self,ItMw_2H_Axe_L_01,Npc_HasItems(self,ItMw_2H_Axe_L_01));
	};
	if(self.guild == GIL_ZOMBIE)
	{
		Npc_RemoveInvItems(self,ItMw_2H_Axe_L_01,Npc_HasItems(self,ItMw_2H_Axe_L_01));
	};
	if(Npc_HasItems(self,ItMw_DS_MonWeapon) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_DS_MonWeapon,Npc_HasItems(self,ItMw_DS_MonWeapon));
	};
	if(Npc_HasItems(self,ItMw_DS_MonWeapon_ExElite) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_DS_MonWeapon_ExElite,Npc_HasItems(self,ItMw_DS_MonWeapon_ExElite));
	};
	if(Npc_HasItems(self,ItMw_DS_MonWeapon_Elite) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_DS_MonWeapon_Elite,Npc_HasItems(self,ItMw_DS_MonWeapon_Elite));
	};
	if(Npc_HasItems(self,ItMw_DS_MonWeapon_Med) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_DS_MonWeapon_Med,Npc_HasItems(self,ItMw_DS_MonWeapon_Med));
	};
	if(Npc_HasItems(self,ItLsFireTorch) >= 1)
	{
		Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));
	};
	if(Npc_HasItems(self,ItRw_Ass_2x2) >= 1)
	{
		Npc_RemoveInvItems(self,ItRw_Ass_2x2,Npc_HasItems(self,ItRw_Ass_2x2));
	};
	if(Npc_HasItems(self,ItMw_1h_Sld_Sword) >= 1)
	{
		Npc_RemoveInvItems(self,ItMw_1h_Sld_Sword,Npc_HasItems(self,ItMw_1h_Sld_Sword));
	};

	otherweap = Npc_GetReadiedWeapon(other);

	if(Hlp_IsItem(otherweap,ItMW_Addon_Stab01) == TRUE)
	{
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
	}
	else if((Hlp_IsItem(otherweap,itmw_beliarsuperweapon_2h) == TRUE) || (Hlp_IsItem(otherweap,itmw_beliarsuperweapon_1h) == TRUE) || (Hlp_IsItem(otherweap,ItMW_Addon_Stab02) == TRUE))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",self,self,0,0,0,FALSE);
	}
	else if(Hlp_IsItem(otherweap,ItMW_Addon_Stab03) == TRUE)
	{
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",self,self,0,0,0,FALSE);
	}
	else if(Hlp_IsItem(otherweap,ItMW_Addon_Stab04) == TRUE)
	{
		Wld_PlayEffect("SPELLFX_WINDFIST_INVESTBLAST",self,self,0,0,0,FALSE);
	};
	if(Npc_IsPlayer(other) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(other);
	};
	if((C_NpcIsUndead(self) == FALSE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (self.guild != GIL_Giant_Rat) && (self.guild != GIL_BLOODFLY) && (self.guild != GIL_WARAN) && (self.guild != GIL_MINECRAWLER) && (self.guild != GIL_MEATBUG) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ghost_senyak_demon)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(senyak_demon)) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		if((MoraUlartuIsOn[1] == TRUE) && (self.aivar[89] == FALSE))
		{
			CreateInvItems(self,ItMi_StoneSoul,1);
			self.aivar[89] = TRUE;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1077_Addon_Bandit)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_709_Rethon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1070_Addon_Paul)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_315_Kasernenwache)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_453_Buerger)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1095_Addon_Crimson)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_714_Jan)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_314_Mortis)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sek_8013_joru)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sek_8009_viran)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet_DI)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_809_bennet_li)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_412_Harad)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_461_Carl)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4106_Dobar)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4107_Parlaf)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4100_Brutus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_457_Brian)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1099_Addon_Huno)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(xbs_7513_darrion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_908_Hodges)))
	{
		Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
		Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
		Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
		Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	};
	if((KreolIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol)))
	{
		KreolIsDead = TRUE;
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_InsertNpc(skeleton_kreol_04,"FP_ROAM_DG_BELIAR_01");
		Wld_InsertNpc(skeleton_kreol_01,"FP_ROAM_DG_BELIAR_02");
		Wld_InsertNpc(skeleton_kreol_02,"FP_ROAM_DG_GUARD");
		Wld_InsertNpc(skeleton_kreol_01,"DG_MAGE");
		Wld_InsertNpc(skeleton_kreol_01,"OW_FOGDUNGEON_12");
		Wld_InsertNpc(skeleton_kreol_03,"OW_FOGDUNGEON_13");
		Wld_InsertNpc(skeleton_kreol_01,"DG_MAGE_GUARD_02");
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,Lesser_Skeleton,1,500);
		Wld_SpawnNpcRange(hero,Skeleton,1,500);

		if((DO_KnowAboutDO == FALSE) && (MIS_DarkOrden == LOG_Running))
		{
			MIS_DarkOrden = LOG_Failed;
			Log_SetTopicStatus(TOPIC_HROMANINQUEST,LOG_OBSOLETE);
		};
		if(MIS_INNOSWILL == LOG_Running)
		{
			B_LogEntry( TOPIC_INNOSWILL , " It seems that this was the last servant of Beliar that I knew about. Does this mean that I did the will of Innos? " );
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE) && (Npc_GetDistToNpc(self,other) <= 500))
	{
		POISONED = TRUE;
	};
	if (self.aivar[ 93 ] ==  FALSE )
	{
		self.aivar[ AIV_RANSACKED ] = FALSE ;
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		self.mission[4] = 4;
	};

	B_StopLookAt(self);
	AI_StopPointAt(self);

	if((self.aivar[AIV_VictoryXPGiven] == FALSE) && (Npc_IsPlayer(self) == FALSE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		// --------counters-------------------------

		if((self.guild >= 24) && (self.level > 0))
		{
			MonsterKilled += 1;
		};
		if (( self . guild <=  GIL_SEPERATOR_HUM ) && ( self . level >  0 ) && ( self . aivar [ 93 ] ==  FALSE )) ;
		{
			PeopleKilled += 1;
		};
		if((InnosBonus == FALSE) && ((self.guild == GIL_SKELETON) || (self.guild == GIL_DEMON)))
		{
			InnosBonusCount += 1;
		};
		if ((BeliarBonus ==  FALSE ) && (self.guild <=  GIL_SEPERATOR_HUM ) && (self.guild !=  GIL_DMT ) && (CurrentLevel !=  PRIORATWORLD_ZEN ) && (self.aivar[ 93 ] ==  FALSE )) ;
		{
			BeliarBonusCount += 1;
		};
		if ((BeliarBonus ==  FALSE ) && (self.guild <=  GIL_SEPERATOR_HUM ) && (self.guild !=  GIL_BDT ) && (CurrentLevel ==  PRIORATWORLD_ZEN ) && (self.aivar[ 93 ] ==  FALSE )) ;
		{
			BeliarBonusCount += 1;
		};
		if((self.aivar[93] == FALSE) && ((self.npcType == NPCTYPE_PALMORA) || (self.guild == GIL_PAL) || (self.guild == GIL_NOV) || (self.guild == GIL_KDF)))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 5;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 5;

			if(self.npcType == NPCTYPE_PALMORA)
			{
				CountPalmora += 1;
			};
		};
		if((self.aivar[93] == FALSE) && (self.guild <= GIL_SEPERATOR_HUM) && (self.guild != GIL_BDT) && (self.guild != GIL_DMT))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		};
		if (( self . guild ==  GIL_BDT ) && ( self . aivar [ 93 ] ==  FALSE ) && ( CurrentLevel !=  PRIORATWORLD_ZEN )) ;
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol)))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 10;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT - 10;
		};
		if((self.guild == GIL_DRAGON) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(dragon_black)))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 20;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(senyak_demon))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 20;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT - 10;
		};
		if ((self.aivar[ AIV_MM_REAL_ID ] ==  ID_SKELETON_LORD ) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID( SKELETON_LORD_KELTUZED )))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT - 5;
		};
		if((C_NpcIsUndead(self) == TRUE) || (self.guild == GIL_DEMON) || (self.guild == GIL_DMT))
		{
			SkelCountKarma = SkelCountKarma + 1;

			if(SkelCountKarma >= 20)
			{
				INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
				SkelCountKarma = FALSE;
			};
		};

		// --------counters-------------------------

		if(self.level > 0)
		{
			if(SBMODE == TRUE)
			{
				permvaluexp = self.level * XP_PER_VICTORY;

				if(BELIARCURSEYOU == TRUE)
				{
					permvaluexp = permvaluexp / 2;
				}
				else if(!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == TRUE) && (other.guild <= GIL_SEPERATOR_HUM))
				{
					permvaluexp = permvaluexp / 2;
				};
			}
			else
			{
				permvaluexp = self.level * XP_PER_VICTORY;
			};
			if((self.guild == GIL_MEATBUG) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rabbit)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rabbit_02)))
			{
				permvaluexp = 1;
			};

			self.aivar[AIV_VictoryXPGiven] = TRUE ;

			if (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait))
			{
				if(self.aivar[90] == TRUE)
				{
					b_giveplayerxpquiet(permvaluexp);
				}
				else
				{
					B_GivePlayerXP(permvaluexp);
				};
			};
			if(DarkMessianArmorEquipped == TRUE)
			{
				if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
				{
					hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 2) / 100);

					if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
					{
						hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
					};
				};
			};
			if(WaterRobeBonus == TRUE)
			{
				if(hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
				{
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + ((hero.attribute[ATR_MANA_MAX] * 2) / 100);

					if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
					{
						hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
					};
				};
			};
			if(BloodArmorBonus == TRUE)
			{
				if(ATR_STAMINA[0] < ATR_STAMINA_MAX[0] * 10)
				{
					ATR_STAMINA[0] = ATR_STAMINA[0] + ((ATR_STAMINA_MAX[0] * 20) / 100);

					if(ATR_STAMINA[0] > ATR_STAMINA_MAX[0] * 10)
					{
						ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
					};
				};
			};
			if(BeliarChosenEquipped == TRUE)
			{
				if(CountBelChos < 2)
				{
					RanSumm = Hlp_Random( 100 );

					if(RanSumm >= 50)
					{
						if(Npc_IsPlayer(other) && (self.aivar[90] == FALSE) && (self.guild <= GIL_SEPERATOR_HUM))
						{
							CountBelChos += 1;
							Wld_SpawnNpcRange(other,Summoned_Skeleton_Warrior_Chosen,1,500);
						}
						else if(Npc_IsPlayer(other) && (self.aivar[90] == FALSE) && ((self.guild == GIL_ORC) || (self.guild == GIL_SEPERATOR_ORC) || (self.guild == GIL_FRIENDLY_ORC)))
						{
							CountBelChos += 1;
							Wld_SpawnNpcRange(other,Summoned_Skeleton_Orc,1,500);
						};
					};
				};
			};
			if((CraitIsUp == TRUE) && (Npc_GetDistToNpc(Crait,hero) < 2500))
			{
				if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Crait))
				{
					CraitExpLvl = CraitExpLvl + permvaluexp;
				}
				else
				{
					CraitExpLvl = CraitExpLvl + (permvaluexp / 2);
				};
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Dragon))
	{
		if(HeroDragonLook == TRUE)
		{
			Wld_StopEffect("DRAGONLOOK_FX");	
			HeroDragonLook = FALSE;
		};
	};

	//------------------------тригерры------------------------------------------------------------------------------------------

	if((self.aivar[93] == FALSE) && (self.vars[6] == FALSE))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sleeper_Old)) && (SleeperOldIsDead == FALSE) && (SleeperStone == TRUE))
		{
			SleeperOldIsDead = TRUE;

			if(MIS_SleeperBack == LOG_Running)
			{
				MIS_SleeperBack = LOG_Success;
				Log_SetTopicStatus(TOPIC_SleeperBack,LOG_Success);
				B_LogEntry(TOPIC_SleeperBack,"Я убил Спящего! Больше он никогда не сможет угрожать этому миру.");
			};
		};
		if(!C_NpcIsUndead(self) && (self.guild != GIL_ORC) && (self.guild != GIL_DRACONIAN) && (self.guild != GIL_MEATBUG) && (self.guild != GIL_DEMON) && (self.guild != GIL_SWAMPGOLEM) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_FIREGOLEM) && (self.guild != GIL_ICEGOLEM))
		{
			if((self.guild == GIL_Alligator) || (self.guild == GIL_MINECRAWLER) || (self.guild == GIL_WARAN) || (self.guild == GIL_BLOODFLY))
			{
				Wld_PlayEffect("SPELLFX_BLOODDEAD3",self,self,0,0,0,FALSE);
			}
			else
			{
				Wld_PlayEffect("SPELLFX_BLOODDEAD1",self,self,0,0,0,FALSE);
			};
		};
		if((self.guild == GIL_Stoneguardian) && (MEETWITHSTONEGUARD == FALSE))
		{
			MEETWITHSTONEGUARD = TRUE;
		};
		if ((self.aivar[ 90 ] ==  TRUE ) && (self.aivar[ 95 ] ==  FALSE ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE ))) ;
		{
			if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(AmasRaf)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(AmasSah)))
			{
				if(self.level >= 500)
				{
					bonuslpgivehero = 5 ;
					b_givebonusforelitemonster(bonuslpgivehero);
				}
				else if(self.level >= 300)
				{
					bonuslpgivehero = 4 ;
					b_givebonusforelitemonster(bonuslpgivehero);
				}
				else if(self.level >= 200)
				{
					bonuslpgivehero = 3 ;
					b_givebonusforelitemonster(bonuslpgivehero);
				}
				else if(self.level >= 100)
				{
					bonuslpgivehero = 2 ;
					b_givebonusforelitemonster(bonuslpgivehero);
				}
				else if(self.level > 0)
				{
					bonuslpgivehero = 1 ;
					b_givebonusforelitemonster(bonuslpgivehero);
				};

				self.aivar[ 95 ] = TRUE ;
			};
		};
		if ((self.guild ==  GIL_ORC ) && ( GUARDIANISDEFEATED  ==  FALSE ) && ( CAPITELORCATC  ==  TRUE ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE ))) ;
		{
			if(Npc_GetDistToWP(other,"NW_CITY_MERCHANT_PATH_11") <= 32000)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				if(MEFIRSTSTRIKEORC == FALSE)
				{
					hero.attribute[ATR_HITPOINTS] = 100;
					MEFIRSTSTRIKEORC = TRUE;
				}
				else
				{
					hero.attribute[ATR_HITPOINTS] = 0;
					COUNTORCPROTECT = FALSE;
				};
				if(FIRSTSTRIKEME == FALSE)
				{
					FIRSTSTRIKEME = TRUE;
					if(MIS_STRANGETHINGS == LOG_Running)
					{
						B_LogEntry( TOPIC_STRANGETHINGS , " I don't even understand what's going on here! When I tried to attack one of the orcs, I was hit by a bolt of lightning that almost killed me. Apparently, some kind of magic protects all these creatures. It seems that I you have to be more careful now ... " );
					}
					else if(MIS_STRANGETHINGS == FALSE)
					{
						MIS_STRANGETHINGS = LOG_Running;
						Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
						Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
						B_LogEntry( TOPIC_STRANGETHINGS , " Strange things started to happen! When I tried to attack one of the orcs, I was hit by a bolt of lightning that almost killed me. Apparently, some kind of magic protects all these creatures. It seems that I should be now be careful... " );
					};
				};
			}
			else if(Npc_GetDistToWP(other,"NW_PATH_TO_MONASTERY_09") <= 12000)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				if(MEFIRSTSTRIKEORC == FALSE)
				{
					hero.attribute[ATR_HITPOINTS] = 100;
					MEFIRSTSTRIKEORC = TRUE;
				}
				else
				{
					hero.attribute[ATR_HITPOINTS] = 0;
					COUNTORCPROTECT = FALSE;
				};
				if(FIRSTSTRIKEME == FALSE)
				{
					FIRSTSTRIKEME = TRUE;
					if(MIS_STRANGETHINGS == LOG_Running)
					{
						B_LogEntry(TOPIC_STRANGETHINGS,"Я вообще перестаю понимать, что здесь происходит! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
					}
					else if(MIS_STRANGETHINGS == FALSE)
					{
						MIS_STRANGETHINGS = LOG_Running;
						Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
						Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
						B_LogEntry( TOPIC_STRANGETHINGS , " Strange things started to happen! When I tried to attack one of the orcs, I was hit by a bolt of lightning that almost killed me. Apparently, some kind of magic protects all these creatures. It seems that I should be now be careful... " );
					};
				};
			}
			else if(Npc_GetDistToWP(other,"NW_BIGFARM_ORC_SAFE") <= 15000)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				if(MEFIRSTSTRIKEORC == FALSE)
				{
					hero.attribute[ATR_HITPOINTS] = 100;
					MEFIRSTSTRIKEORC = TRUE;
				}
				else
				{
					hero.attribute[ATR_HITPOINTS] = 0;
					COUNTORCPROTECT = FALSE;
				};
				if(FIRSTSTRIKEME == FALSE)
				{
					FIRSTSTRIKEME = TRUE;
					if(MIS_STRANGETHINGS == LOG_Running)
					{
						B_LogEntry( TOPIC_STRANGETHINGS , " I don't even understand what's going on here! When I tried to attack one of the orcs, I was hit by a bolt of lightning that almost killed me. Apparently, some kind of magic protects all these creatures. It seems that I you have to be more careful now ... " );
					}
					else if(MIS_STRANGETHINGS == FALSE)
					{
						MIS_STRANGETHINGS = LOG_Running;
						Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
						Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
						B_LogEntry( TOPIC_STRANGETHINGS , " Strange things started to happen! When I tried to attack one of the orcs, I was hit by a bolt of lightning that almost killed me. Apparently, some kind of magic protects all these creatures. It seems that I should be now be careful... " );
					};
				};
			};
		};
		if(C_IAmCanyonRazor(self) == TRUE)
		{
			CanyonRazorBodyCount = CanyonRazorBodyCount + 1;

			if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
			{
				B_CountCanyonRazor();
			};
		};
		if ((self.aivar[ AIV_MM_REAL_ID ] ==  ID_ORCBF ) && ( STOPBIGBATTLE  ==  FALSE )) .
		{
			ALLBIGFIGHTERSORC = ALLBIGFIGHTERSORC + 1;

			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				IAMKILLORCSBB = IAMKILLORCSBB  +  1 ;
			};
			if(ALLBIGFIGHTERSORC >= 150)
			{
				B_GivePlayerXP(5000);
				STOPBIGBATTLE = TRUE;
				HUMANSWINSBB = TRUE;
				MIS_ORсGREATWAR = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_ORсGREATWAR,LOG_SUCCESS);
				B_LogEntry( TOPIC_OR with GREATWAR , " We have won this battle - a huge army of orcs has been defeated! Now we can think about freeing the city and its surroundings from the orcs. " );
				Wld_SendTrigger("EVT_TRIGGER_ORCMARCH");
				b_changehp(SLD_800_Lee);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
		{
			if ( CountBelChos >  0 )
			{
				CountBelChos -= 1;
			};
		};
		if ((self.aivar[ 98 ] ==  TRUE ) && ( STOPBIGBATTLE  ==  FALSE )) ;
		{
			ALLBIGFIGHTERSHUMAN = ALLBIGFIGHTERSHUMAN + 1;

			if(ALLBIGFIGHTERSHUMAN >= (OVERALLBIGFIGHTERSHUMAN - HUMANBIGFIGHTERSNODEAD))
			{
				STOPBIGBATTLE = TRUE;
				ORCSWINSBB = TRUE;
				MIS_ORсGREATWAR = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ORсGREATWAR);
				Wld_SendTrigger("EVT_TRIGGER_ORCMARCH");
				b_orcsattackfarm();
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(nixdog)) && (KILLCLAWREVENGE == FALSE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			KILLCLAWREVENGE = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(nixdog)) && (CLAWISDEAD == FALSE))
		{
			CLAWISDEAD = TRUE;
			if(MIS_RECOVERDOG == LOG_Running)
			{
				MIS_RECOVERDOG = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RECOVERDOG);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1320_Addon_Greg))
		{
			GREGADWISDEAD = TRUE;
			if(MIS_PIRATENEEDSHIP == LOG_Running)
			{
				MIS_PIRATENEEDSHIP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_PIRATENEEDSHIP);
			};
		};
		if((MIS_HeroOrcJoin == LOG_Running) && (self.guild == GIL_ORC) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			if(ORCRESPECT > 0)
			{
				ORCRESPECT = ORCRESPECT - 1;
				AI_Print("Уважение среди орков - 1");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_119_Assasin))
		{
			GonsalesNWIsDead = TRUE;			
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin))
		{
			GonsalesIsDead = TRUE;			
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1085_Addon_Bloodwyn))
		{
			CreateInvItems(self,ItMi_Addon_Bloodwyn_Kopf,1);
			BLOODWYNISDEAD = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE;
		};


		//----------------------охота за головами---------------------------------------

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1060_Dexter)) && (DexterIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_DexterHead,1);
			DexterIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE ;

			if(MIS_WulfgarBandits == LOG_Running)
			{
				CreateInvItems(self,ItWr_DexTrait,1);
			};
			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive, " Rogue leader Dexter is dead. He's got a decent bounty on his head. " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1460_Nestor)) && (NestorIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_NestorHead,1);
			NestorIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE ;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive, " The leader of the robbers Nestor, nicknamed 'Hanibal', is dead. You can get a decent reward for his head. " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10620_Bandit_L)) && (KriksIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_KriksHead,1);
			KriksIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE ;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive, " Rogue leader Crixus 'Razor' is dead. There's a decent bounty on his head. " );
			};
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(BDT_10621_Bandit_L)) && (BartIsDead ==  FALSE ))
		{
			CreateInvItems(self,ItMi_BartHead,1);
			BartIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE ;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive, " Rogue ringleader 'Shorty' Bart is dead. There's a decent bounty on his head. " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10622_Bandit_L)) && (SkironIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_SkironHead,1);
			SkironIsDead = TRUE;
			self.aivar[AIV_StoryBandit] = TRUE ;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive, " The bandit leader 'The Butcher' Skiron is dead. There's a decent bounty on his head. " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10623_Bandit_L)) && (RocksIsDead == FALSE))
		{
			CreateInvItems(self,ItMi_RocksHead,1);
			RocksIsDead = TRUE ;
			self.aivar[AIV_StoryBandit] = TRUE ;

			if(MIS_DeadOrAlive == LOG_Running)
			{
				B_LogEntry(TOPIC_DeadOrAlive, " Rogue leader 'Nimble' Roxx is dead. There's a decent bounty on his head. " );
			};
		};

		// ----------------------bounty hunting----------------------- ----------------

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_184_Adept))
		{
			HoakinIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HaosDemon_Psicamp))
		{
			DemonPsicampIsDead = TRUE;

			if((MIS_PsicampDemon == LOG_Running) && (Npc_IsDead(ORC_8216_TorDal) == TRUE))
			{
				MIS_PsicampDemon= LOG_Success;
				Log_SetTopicStatus(TOPIC_PsicampDemon,LOG_Success);
				B_LogEntry(TOPIC_PsicampDemon, " The demon in the swamps is dead! By killing him, I helped the orcs a lot. I'm sure they won't let this go unnoticed. " );	
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_127_Osair)) && (OsairIsDead == FALSE))
		{
			OsairIsDead = TRUE;

			if(OsairAttackMe == TRUE)
			{
				NoGonsaHereMe = TRUE;
				B_LogEntry(TOPIC_MasiafStory, " Osair is dead! Which means the Masyaf brotherhood has lost another prior. I wonder what Gonzalez himself would say about this. " );
			};

			if(HideMeetCamera == TRUE)
			{
				HD01 = Hlp_GetNpc(Haniar_Demon_01);
				HD02 = Hlp_GetNpc(Haniar_Demon_02);
				HD03 = Hlp_GetNpc(Haniar_Demon_03);

				HD01.attribute[ATR_STRENGTH] = 400;
				HD02.attribute[ATR_STRENGTH] = 400;
				HD03.attribute[ATR_STRENGTH] = 400;

				HD01.attribute[ATR_HITPOINTS_MAX] = 4000;
				HD01.attribute[ATR_HITPOINTS] = HD01.attribute[ATR_HITPOINTS_MAX];
				HD02.attribute[ATR_HITPOINTS_MAX] = 4000;
				HD02.attribute[ATR_HITPOINTS] = HD02.attribute[ATR_HITPOINTS_MAX];
				HD03.attribute[ATR_HITPOINTS_MAX] = 4000;	
				HD03.attribute[ATR_HITPOINTS] = HD03.attribute[ATR_HITPOINTS_MAX];
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_137_Adept)) && (MasGiveKeyPri == FALSE))
		{
			CreateInvItems(self,ItKe_Masiaf_Prision,1);
			MasGiveKeyPri = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_125_Tiamant)) && (TiamantIsDead == FALSE))
		{
			TiamantIsDead = TRUE;
			CreateInvItems(self,ItWr_DualFight,1);

			if(MIS_PW_FollowGoldOre == LOG_Success)
			{
				B_StartOtherRoutine(Ass_126_Haniar,"Start");
				B_StartOtherRoutine(Ass_127_Osair,"Start");
				B_StartOtherRoutine(Ass_128_Nrozas,"Start");
				B_StartOtherRoutine(Ass_144_Adept,"Start");
				B_StartOtherRoutine(Ass_145_Adept,"Start");
				B_StartOtherRoutine(Ass_146_Adept,"Start");
				B_StartOtherRoutine(Ass_147_Adept,"Start");
				B_StartOtherRoutine(Ass_148_Adept,"Start");
				B_StartOtherRoutine(Ass_149_Adept,"Start");
				B_StartOtherRoutine(Ass_138_Adept,"Start");
				B_StartOtherRoutine(Ass_139_Adept,"Start");
				B_StartOtherRoutine(Ass_140_Adept,"Start");
				B_StartOtherRoutine(Ass_141_Adept,"Start");
				B_LogEntry(TOPIC_MasiafStory, " Haniar killed Tiamant! And quite easily, despite the fact that Tiamant was considered the best fighter of the brotherhood. This is all extremely strange! " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SEK_186_SLAVEOBSSEK))
		{
			GoldSlave_01_IsDead = TRUE ;

			if (( GoldSlave_01_IsDead ==  TRUE ) && ( GoldSlave_02_IsDead ==  TRUE ) && ( GoldOreHelpCome ==  FALSE ))
			{
				OsairInRage = TRUE;

				if(MIS_PW_FollowGoldOre == LOG_Running)
				{
					B_LogEntry(TOPIC_PW_FollowGoldOre, " All slaves are dead! Osair will be very unhappy with what happened. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SEK_387_SLAVEOBSSEK))
		{
			GoldSlave_02_IsDead = TRUE ;

			if (( GoldSlave_01_IsDead ==  TRUE ) && ( GoldSlave_02_IsDead ==  TRUE ) && ( GoldOreHelpCome ==  FALSE ))
			{
				OsairInRage = TRUE;

				if(MIS_PW_FollowGoldOre == LOG_Running)
				{
					B_LogEntry(TOPIC_PW_FollowGoldOre, " All slaves are dead! Osair will be very unhappy with what happened. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_129_DeadNrozas))
		{
			//Wld_SendTrigger("EVT_ASS_DEMON_FIRSTLOCK_HIDE");
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID( ORC_7550_GORKAR ))
		{
			if((MIS_MissOldFriend == LOG_Running) && (GorKarShowMe == FALSE))
			{
				MIS_MissOldFriend = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_MissOldFriend);
				FinishSTLSD = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_858_Bret))
		{
			BretNWIsDead = TRUE;

			if(MIS_MissOldFriend == LOG_Running)
			{
				MIS_MissOldFriend = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_MissOldFriend);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_857_Darius))
		{
			DariusNWIsDead = TRUE;

			if(MIS_MissOldFriend == LOG_Running)
			{
				MIS_MissOldFriend = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_MissOldFriend);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_853_Bret))
		{
			BretIsDead = TRUE;

			if((MIS_MissOldFriend == LOG_Running) && (CanTrailOrcCamp == FALSE))
			{
				MIS_MissOldFriend = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_MissOldFriend);
				FinishSTLSD = TRUE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TROLL_CAVE_UNIQ)) && (UturIsDead == FALSE))
		{
			UturIsDead = TRUE;
	
			if(MIS_EvilTroll == LOG_Running)
			{
				B_LogEntry(TOPIC_EvilTroll, " I killed the giant cave troll Netback was talking about. " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FIREGOLEM_UNIQ)) && (MagolemusIsDead == FALSE))
		{
			MagolemusIsDead = TRUE ;
			AI_Print(PRINT_TEMPLETASK_03_DONE);
			B_LogEntry(TOPIC_AdanosCrone, " Innos' creature has been destroyed... " );
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1084_Addon_Senyan))
		{
			if(Senyan_Called == TRUE)
			{
				Senyan_Blackmail = LOG_SUCCESS ;
				Log_SetTopicStatus(Topic_Addon_Senyan,LOG_SUCCESS);
				B_LogEntry(Topic_Addon_Senyan, " I guess now Senyan won't be able to tell anyone about my secret. It's for the best! " );
			}
			else
			{
				Senyan_Erpressung = LOG_FAILED;
				B_LogEntry_Failed(Topic_Addon_Senyan);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_432_Moe))
		{
			MOEISDEAD = TRUE;
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( vlk_989_reinar ) )
		{
			Npc_RemoveInvItems(self,ItMw_Orc Butcher,Npc_HasItems(self,ItMw_Orc Butcher));
			Npc_RemoveInvItems(self,ItMw_axe,Npc_HasItems(self,ItMw_axe));
			Npc_RemoveInvItems(self,ItMw_Stormbringer,Npc_HasItems(self,ItMw_Stormbringer));
			Npc_RemoveInvItems(self,ItMw_Berserkeraxt,Npc_HasItems(self,ItMw_Berserkeraxt));
			Npc_RemoveInvItems(self,ItMw_Dragon's Edge,Npc_HasItems(self,ItMw_Dragon's Edge));
			Npc_RemoveInvItems(self,ItMw_Addon_Betty,Npc_HasItems(self,ItMw_Addon_Betty));
			Npc_RemoveInvItems(self,itmw_2h_urizel,Npc_HasItems(self,itmw_2h_urizel));
			Npc_RemoveInvItems(self,itmw_2h_urizel_nomagic,Npc_HasItems(self,itmw_2h_urizel_nomagic));
			Npc_RemoveInvItems(self,itmw_2h_weltenspalter,Npc_HasItems(self,itmw_2h_weltenspalter));
			Npc_RemoveInvItems(self,itmw_1h_Сrest,Npc_HasItems(self,itmw_1h_Сrest));
			Npc_RemoveInvItems(self,itmw_scorpionspec,Npc_HasItems(self,itmw_scorpionspec));
			Npc_RemoveInvItems(self,itmw_normardsword,Npc_HasItems(self,itmw_normardsword));
			Npc_RemoveInvItems(self,itmw_2h_dragonmaster,Npc_HasItems(self,itmw_2h_dragonmaster));
			Npc_RemoveInvItems(self,itmw_2h_katana,Npc_HasItems(self,itmw_2h_katana));
			Npc_RemoveInvItems(self,ItMw_Drakesaebel,Npc_HasItems(self,ItMw_Drakesaebel));

			B_CreateAmbientInv(self);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1357_Addon_Garett))
		{
			Npc_RemoveInvItems(self,ItMw_OldPiratensaebel,Npc_HasItems(self,ItMw_OldPiratensaebel));
			Npc_RemoveInvItems(self,ItMw_Piratensaebel,Npc_HasItems(self,ItMw_Piratensaebel));
			Npc_RemoveInvItems(self,ItMW_Addon_Hacker_1h_01,Npc_HasItems(self,ItMW_Addon_Hacker_1h_01));
			Npc_RemoveInvItems(self,ItMW_Addon_Hacker_1h_02,Npc_HasItems(self,ItMW_Addon_Hacker_1h_02));
			Npc_RemoveInvItems(self,ItMW_Addon_Hacker_2h_01,Npc_HasItems(self,ItMW_Addon_Hacker_2h_01));
			Npc_RemoveInvItems(self,ItMW_Addon_Hacker_2h_02,Npc_HasItems(self,ItMW_Addon_Hacker_2h_02));
			Npc_RemoveInvItems(self,ItMw_Addon_PIR1hAxe,Npc_HasItems(self,ItMw_Addon_PIR1hAxe));
			Npc_RemoveInvItems(self,ItMw_Addon_PIR1hSword,Npc_HasItems(self,ItMw_Addon_PIR1hSword));
			Npc_RemoveInvItems(self,ItMw_Addon_PIR2hAxe,Npc_HasItems(self,ItMw_Addon_PIR2hAxe));
			Npc_RemoveInvItems(self,ItMw_Addon_PIR2hSword,Npc_HasItems(self,ItMw_Addon_PIR2hSword));
			Npc_RemoveInvItems(self,ItMw_Schiffsaxt,Npc_HasItems(self,ItMw_Schiffsaxt));
			B_CreateAmbientInv(self);
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sek_8013_joru))
		{
			Npc_RemoveInvItems(self,ItMw_Sense,Npc_HasItems(self,ItMw_Sense));
			Npc_RemoveInvItems(self,ItMw_Nagelkeule,Npc_HasItems(self,ItMw_Nagelkeule));
			Npc_RemoveInvItems(self,ItMw_Nagelkeule2,Npc_HasItems(self,ItMw_Nagelkeule2));
			Npc_RemoveInvItems(self,ItMw_Mace,Npc_HasItems(self,ItMw_Mace));
			Npc_RemoveInvItems(self,ItMW_Addon_Keule_1h_01,Npc_HasItems(self,ItMW_Addon_Keule_1h_01));
			Npc_RemoveInvItems(self,ITMW_1H_MACE_BANDOS_107,Npc_HasItems(self,ITMW_1H_MACE_BANDOS_107));
			Npc_RemoveInvItems(self,ItMw_Zweihaender1,Npc_HasItems(self,ItMw_Zweihaender1));
			Npc_RemoveInvItems(self,ItMw_Zweihaender2,Npc_HasItems(self,ItMw_Zweihaender2));
			Npc_RemoveInvItems(self,ItMw_Zweihaender4,Npc_HasItems(self,ItMw_Zweihaender4));
			Npc_RemoveInvItems(self,ItMw_2H_Claymore,Npc_HasItems(self,ItMw_2H_Claymore));
			B_CreateAmbientInv(self);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(tpl_8005_gornakosh))
		{
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1));
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2));
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3));
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4));
			Npc_RemoveInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5,Npc_HasItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5));
			B_CreateAmbientInv(self);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_823_Khaled))
		{
			Npc_RemoveInvItems(self,ItMw_1h_Sld_Sword_New,Npc_HasItems(self,ItMw_1h_Sld_Sword_New));
			Npc_RemoveInvItems(self,ItMw_2h_Sld_Sword,Npc_HasItems(self,ItMw_2h_Sld_Sword));
			Npc_RemoveInvItems(self,ItMw_1h_Sld_Axe,Npc_HasItems(self,ItMw_1h_Sld_Axe));
			Npc_RemoveInvItems(self,ItMw_Bartaxt,Npc_HasItems(self,ItMw_Bartaxt));
			Npc_RemoveInvItems(self,ItMw_Doppelaxt,Npc_HasItems(self,ItMw_Doppelaxt));
			Npc_RemoveInvItems(self,ItMw_2h_Sld_Axe,Npc_HasItems(self,ItMw_2h_Sld_Axe));
			Npc_RemoveInvItems(self,ItMw_Streitaxt1,Npc_HasItems(self,ItMw_Streitaxt1));
			Npc_RemoveInvItems(self,ItMw_Streitaxt2,Npc_HasItems(self,ItMw_Streitaxt2));
			Npc_RemoveInvItems(self,ItMw_Streitaxt3,Npc_HasItems(self,ItMw_Streitaxt3));
			Npc_RemoveInvItems(self,ITMW_2H_G3A_ORCAXE_02,Npc_HasItems(self,ITMW_2H_G3A_ORCAXE_02));
			Npc_RemoveInvItems(self,ItMw_Kriegshammer1,Npc_HasItems(self,ItMw_Kriegshammer1));
			Npc_RemoveInvItems(self,ItMw_Kriegshammer2,Npc_HasItems(self,ItMw_Kriegshammer2));
			Npc_RemoveInvItems(self,ItMw_2H_Warhammer,Npc_HasItems(self,ItMw_2H_Warhammer));
			Npc_RemoveInvItems(self,ItRw_Bow_L_01,Npc_HasItems(self,ItRw_Bow_L_01));
			Npc_RemoveInvItems(self,ItRw_Bow_L_03,Npc_HasItems(self,ItRw_Bow_L_03));
			Npc_RemoveInvItems(self,ItRw_Bow_H_02,Npc_HasItems(self,ItRw_Bow_H_02));
			Npc_RemoveInvItems(self,ItRw_Bow_H_04,Npc_HasItems(self,ItRw_Bow_H_04));
			Npc_RemoveInvItems(self,ItRw_Crossbow_M_02,Npc_HasItems(self,ItRw_Crossbow_M_02));
			Npc_RemoveInvItems(self,ItRw_Crossbow_H_02,Npc_HasItems(self,ItRw_Crossbow_H_02));
			Npc_RemoveInvItems(self,ItRw_Arrow,Npc_HasItems(self,ItRw_Arrow));
			Npc_RemoveInvItems(self,ItBE_Addon_Leather_01,Npc_HasItems(self,ItBE_Addon_Leather_01));
			B_CreateAmbientInv(self);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Bau_900_Onar))
		{
			if(TELEPORTFRIENDSLOST == TRUE)
			{
				PlayVideo("RET2_BlackScreen.bik");
				ExitSession();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_418_Gritta))
		{
			GRITTAMEDEAD = TRUE;
		};
		if((self.guild == GIL_ORC) && (MIS_KILLTHEMALL == LOG_Running))
		{
			COUNTKILLORCS = COUNTKILLORCS + 1;

			if(COUNTKILLORCS >= 50)
			{
				MIS_KILLTHEMALL = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_KILLTHEMALL,LOG_SUCCESS);
				B_LogEntry( TOPIC_KILLTHEMALL , " I believe I've killed enough orcs to cause panic in their ranks! Lord Hagen will be pleased with this news. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ILARAH))
		{
			Snd_Play("HAOSDEAD");
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
			ALLGUARDIANSNOLEADERISDEAD = TRUE;
			CircleFightIlArah = FALSE;

			if((ALLGUARDIANSNOLEADERISDEAD == TRUE) && (STONNOSISDESTOYED == TRUE))
			{
				ALLGUARDIANSKILLED = TRUE;
				GUARDIANSISDEFEATED = TRUE;
				MIS_GUARDIANS = LOG_Success;
				Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Success);
				B_LogEntry( TOPIC_GUARDIANS , " I managed to defeat all the Guardians! Now nothing threatens this world from their side... " );

				if(MIS_STRANGETHINGS == LOG_Running)
				{
					MIS_STRANGETHINGS = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
				};
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DEMON_CHAOS)) && (DemonHaosIsDead == FALSE))
		{
			DemonHaosIsDead = TRUE;
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12971_stonnos))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			STONNOSISDESTOYED = TRUE ;
			B_StartOtherRoutine(self,"TOT");
			AI_Teleport(self,"TOT");

			if((ALLGUARDIANSNOLEADERISDEAD == TRUE) && (STONNOSISDESTOYED == TRUE))
			{
				ALLGUARDIANSKILLED = TRUE;
				GUARDIANSISDEFEATED = TRUE;

				MIS_GUARDIANS = LOG_Success;
				Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Success);
				B_LogEntry( TOPIC_GUARDIANS , " I managed to defeat all the Guardians! Now nothing threatens this world from their side... " );

				if(MIS_STRANGETHINGS == LOG_Running)
				{
					MIS_STRANGETHINGS = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_SUCCESS);
				};
			};
		};
		if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_FARIONTEST == LOG_Running) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_299_Sergio)))
		{
			Snd_Play("DEM_Warn");
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
			SERGIOISDEAD = TRUE;
			B_StartOtherRoutine(PAL_299_Sergio,"TOT");
			AI_Teleport(PAL_299_Sergio,"TOT");
			Wld_InsertNpc(skeleton_lord_serdah,Npc_GetNearestWP(hero));
		};
		if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_FARIONTEST == LOG_Running) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_serdah)))
		{
			B_KillNpc(PAL_299_Sergio);
			SERDAHISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crypt_Skeleton_Lord))
		{
			INUBISISDEAD = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_121_Adept)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_122_Adept)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_123_Adept)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_124_Adept)))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_121_Adept))
			{
				ADEPT_1_DEAD = TRUE;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_122_Adept))
			{
				ADEPT_2_DEAD = TRUE;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_123_Adept))
			{
				ADEPT_3_DEAD = TRUE;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_124_Adept))
			{
				ADEPT_4_DEAD = TRUE;
			};
			if((ADEPT_1_DEAD == TRUE) && (ADEPT_2_DEAD == TRUE) && (ADEPT_3_DEAD == TRUE) && (ADEPT_4_DEAD == TRUE) && (AssInvasionStop == FALSE))
			{
				AssInvasionStop = TRUE;
				B_LogEntry(TOPIC_PrioratStart , " Me and the guards managed to repel Masyaf's attack on the gathering camp! Although not without casualties... We must urgently report the incident to the Namib Idol. " );
			};
		};

		// ---------------------------------------------------------------- ------

		if((PaleCrawlerIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PaleCrawler)))
		{
			PaleCrawlerFight = FALSE;
			PaleCrawlerIsDead = TRUE;

			if(MIS_Miss_Brother == LOG_Running)
			{
				B_LogEntry(TOPIC_Miss_Brother, " It looks like that creepy monster was the one who killed Ile'Sil. I think I should tell him about it... " );
			};
		};
		if((AraharPlagueIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AraharPlague)))
		{
			AraharPlagueFight = FALSE;
			AraharPlagueIsDead = TRUE;

			if(MIS_Miss_Brother == LOG_Running)
			{
				B_LogEntry(TOPIC_Miss_Brother, " This weird zombie gave me a hard time. He had a key of some sort on him. Maybe that key unlocks something special. First, I think I should look around the place... " );
			};
		};
		if((ShadowGuardOneIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardOne)))
		{
			ShadowGuardOneIsDead = TRUE;

			if((ShadowGuardOneIsDead == TRUE) && (ShadowGuardTwoIsDead == TRUE))
			{
				ShadowGuardFight = FALSE;

				if(MIS_Miss_Brother == LOG_Running)
				{
					B_LogEntry(TOPIC_Miss_Brother, " These ghostly guardians didn't show up here by accident. Looks like they were guarding something... " );
				};
			};
		};
		if((ShadowGuardTwoIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardTwo)))
		{
			ShadowGuardTwoIsDead = TRUE;

			if((ShadowGuardOneIsDead == TRUE) && (ShadowGuardTwoIsDead == TRUE))
			{
				ShadowGuardFight = FALSE;

				if(MIS_Miss_Brother == LOG_Running)
				{
					B_LogEntry(TOPIC_Miss_Brother, " These ghostly guardians didn't show up here by accident. Looks like they were guarding something... " );
				};
			};
		};
		if((SoulKeeperIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_SoulKeeper)))
		{
			SoulKeeperFight = FALSE;
			SoulKeeperIsDead = TRUE;
		};
		if((FiarasIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_LV)))
		{
			Wld_SendTrigger("EVT_FIRETREE");
			FiarasFight = FALSE;
			FiarasIsDead = TRUE;
		};
		if((EkronIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AncientTreeGolem)))
		{
			Wld_SendTrigger("EVT_ENTERHRAM_TRIGGER");
			Npc_ExchangeRoutine(NONE_1813_Ilesil,"TreeIsDead");
			AI_Teleport(NONE_1813_Ilesil,"WDS_LAVA_CASTLEYARD_01");
			EkronFight = FALSE;
			EkronIsDead = TRUE;
		};
		if((SkelBroDexIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Dex)))
		{
			SkelBroDexIsDead = TRUE;
			SkelBroDexFight = FALSE;	

			if((SkelBroDexIsDead == TRUE) && (SkelBroStrIsDead == TRUE) && (SkelBroMagIsDead == TRUE) && (SkelBrosFightWin == FALSE))
			{
				SkelBrosFightWin = TRUE;	
				Npc_ExchangeRoutine(NONE_1813_Ilesil,"OpenHram");
				AI_Teleport(NONE_1813_Ilesil,"LOSTVALLEY_TEMPLE_IN");
				Wld_PlayEffect("spellFX_Teleport_RING",NONE_1813_Ilesil,NONE_1813_Ilesil,0,0,0,FALSE);
			};
		};
		if((SkelBroStrIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Str)))
		{
			SkelBroStrIsDead = TRUE;
			SkelBroStrFight = FALSE;	

			if((SkelBroDexIsDead == TRUE) && (SkelBroStrIsDead == TRUE) && (SkelBroMagIsDead == TRUE) && (SkelBrosFightWin == FALSE))
			{
				SkelBrosFightWin = TRUE;	
				Npc_ExchangeRoutine(NONE_1813_Ilesil,"OpenHram");
				AI_Teleport(NONE_1813_Ilesil,"LOSTVALLEY_TEMPLE_IN");
			};
		};
		if((SkelBroMagIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Mag)))
		{
			SkelBroMagIsDead = TRUE;
			SkelBroMagFight = FALSE;	

			if((SkelBroDexIsDead == TRUE) && (SkelBroStrIsDead == TRUE) && (SkelBroMagIsDead == TRUE) && (SkelBrosFightWin == FALSE))
			{
				SkelBrosFightWin = TRUE;	
				Npc_ExchangeRoutine(NONE_1813_Ilesil,"OpenHram");
				AI_Teleport(NONE_1813_Ilesil,"LOSTVALLEY_TEMPLE_IN");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_01))
		{
			AraharPlagueSpawn_01 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_02))
		{
			AraharPlagueSpawn_02 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_03))
		{
			AraharPlagueSpawn_03 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_04))
		{
			AraharPlagueSpawn_04 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_05))
		{
			AraharPlagueSpawn_05 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_01))
		{
			SoulKeeperSpawn_01 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_02))
		{
			SoulKeeperSpawn_02 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_03))
		{
			SoulKeeperSpawn_03 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_04))
		{
			SoulKeeperSpawn_04 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_05))
		{
			SoulKeeperSpawn_05 = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_06))
		{
			SoulKeeperSpawn_06 = FALSE;
		};
		if((ChelDrakIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV)))
		{
			Wld_SendTrigger("EVT_BOSSBROTHER_TRIGGER");	
			Wld_SendTrigger("EVT_BOSSMAMAGE_TRIGGER");	
			ChelDrakIsDead = TRUE;
			B_LogEntry(TOPIC_Miss_Brother, " I destroyed the ancient lord, Chel'Drak. Looks like he was here for a reason. He was guarding something... I wonder what? " );
		};
		if((IlesilIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ilesil_Evil)))
		{
			Wld_SendTrigger("EVT_BOSSBROTHER_TRIGGER");	
			Wld_SendTrigger("EVT_EXITBOSS_TRIGGER");	
			IlesilIsDead = TRUE;
			MIS_Miss_Brother = LOG_Success;
			Log_SetTopicStatus(TOPIC_Miss_Brother,LOG_Success);
			B_LogEntry_Quiet(TOPIC_Miss_Brother, " Ile'Sil is defeated! Now nothing prevents him from being close to his brother. It's time to get out of here... " );	

			if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
			{
				Wld_InsertItem(ItAr_BloodRobe,"FP_ITEM_LW_PRIZE_01");
				Wld_InsertItem(ItMw_Staff_Blood,"FP_ITEM_LW_PRIZE_02");
			}
			else
			{
				if(hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
				{
					Wld_InsertItem(ItAr_BloodArmor,"FP_ITEM_LW_PRIZE_01");

					if(hero.HitChance[NPC_TALENT_2H] > hero.HitChance[NPC_TALENT_1H])
					{
						Wld_InsertItem(ItMw_Sword_Blood,"FP_ITEM_LW_PRIZE_02");
					}
					else
					{
						Wld_InsertItem(ItMw_Axe_Blood,"FP_ITEM_LW_PRIZE_02");
					};
				}
				else
				{
					Wld_InsertItem(ItMw_Speer_Blood,"FP_ITEM_LW_PRIZE_01");
					Wld_InsertItem(ItRw_Bow_Blood,"FP_ITEM_LW_PRIZE_02");
				};
			};
		};

		// ------------------camp people---------------------- ----

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6134_valeran)) && (ValeranIsDead == FALSE))
		{
			ValeranIsDead = TRUE;
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(VLK_4303_Erol_Addon)) && (ErolIsDead ==  FALSE ))
		{
			ErolIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_1117_Straefling)) && (HuntyIsDead == FALSE))
		{
			HuntyIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_41111_huntynw)) && (HuntyNWIsDead == FALSE))
		{
			HuntyNWIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_41110_grimesnw)) && (GrimesNWIsDead == FALSE))
		{
			GrimesNWIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_986_viper)) && (ViperIsDead == FALSE))
		{
			ViperIsDead = TRUE ;
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(VLK_4132_Talbin_NW)) && (TalbinNWIsDead ==  FALSE ))
		{
			TalbinNWIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_984_Niclas)) && (NiclasIsDead == FALSE))
		{
			NiclasIsDead = TRUE;
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(VLK_4301_Farim_Addon)) && (FarimIsDead ==  FALSE ))
		{
			FarimIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_471_Edda)) && (EddaIsDead == FALSE))
		{
			EddaIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_360_Miliz)) && (GuardOneIsDead == FALSE))
		{
			GuardOneIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_361_Miliz)) && (GuardTwoIsDead == FALSE))
		{
			GuardTwoIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf)) && (WolfMIsDead == FALSE))
		{
			WolfMIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_8111_Soeldner)) && (GuardThreeIsDead == FALSE))
		{
			GuardThreeIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_8112_Soeldner)) && (GuardFourIsDead == FALSE))
		{
			GuardFourIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_461_Carl)) && (CarlIsDead == FALSE))
		{
			CarlIsDead = TRUE;
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(BAU_980_Our)) && (OurIsDead ==  FALSE ))
		{
			SagittaIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bau_987_snipes)) && (SnipesIsDead == FALSE))
		{
			SnipesIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_438_Alrik)) && (AlrikIsDead == FALSE))
		{
			AlrikIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6132_gayvern)) && (GayvernIsDead == FALSE))
		{
			GayvernIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_41200_Bilgot)) && (BilgotNWIsDead == FALSE))
		{
			BilgotNWIsDead = TRUE;
		};

		// ------------------camp people---------------------- ----

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_494_Attila)) && (AttilaIsDead == FALSE))
		{
			AttilaIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)) && (Cave_DemonHall_Gate == FALSE))
		{
			Wld_SendTrigger("EVT_DOOMHALL");

			if(MIS_MasiafStory == LOG_Running)
			{
				MIS_MasiafStory = LOG_Success;
				Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Success);
				B_LogEntry(TOPIC_MasiafStory, " Haniar is dead! I believe that now Gonzalez has partially made amends to Innos, and the ancient brotherhood of Masiaf has ceased to exist. " );
			};

			Cave_DemonHall_Gate = TRUE;
		};
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin)))
		{
			B_Attack(other,hero,AR_KILL,1);
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_WAY)) && (CorGalom_Demon_Gate == FALSE))
		{
			Wld_SendTrigger("EVT_CORGALOM_DOOR");
			CorGalom_Demon_Gate = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_01))
		{
			DemonCor01IsDead = TRUE;

			if((DemonCor01IsDead == TRUE) && (DemonCor02IsDead == TRUE) && (DemonCor03IsDead == TRUE))
			{
				CorGalomDemon = Hlp_GetNpc(Ass_130_CorGalomDemon);
				CorGalomDemon.flags = FALSE;
				CorGalomChangeMagic = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_02))
		{
			DemonCor02IsDead = TRUE;

			if((DemonCor01IsDead == TRUE) && (DemonCor02IsDead == TRUE) && (DemonCor03IsDead == TRUE))
			{
				CorGalomDemon = Hlp_GetNpc(Ass_130_CorGalomDemon);
				CorGalomDemon.flags = FALSE;
				CorGalomChangeMagic = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_03))
		{
			DemonCor03IsDead = TRUE;

			if((DemonCor01IsDead == TRUE) && (DemonCor02IsDead == TRUE) && (DemonCor03IsDead == TRUE))
			{
				CorGalomDemon = Hlp_GetNpc(Ass_130_CorGalomDemon);
				CorGalomDemon.flags = FALSE;
				CorGalomChangeMagic = TRUE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_130_CorGalomDemon)) && (PW_Exit == FALSE))
		{
			Wld_SendTrigger("EVT_EXIT_PWWORLD");
			B_StartOtherRoutine(NONE_1190_Assasin,"TOT");

			if(MIS_PrioratStart == LOG_Running)
			{
				MIS_PrioratStart = LOG_Success;
				Log_SetTopicStatus(TOPIC_PrioratStart,LOG_Success);
				B_LogEntry(TOPIC_PrioratStart, " Behind all the abductions, as it turned out, was our old acquaintance - Kor-Gal! Darkness endowed him with powerful demonic power and he was able to subdue Haniar and his brotherhood to his will. These blind fanatics stole novices for him to see him over "Kor-Galom's one of these experiments almost killed me in the temple. But it's over now! We must get out of here as soon as possible...and inform the Namib idol that the brotherhood is safe from now on. " );
			};
			
			PW_Exit = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_128_Nrozas)) && (NrozasIsDead == FALSE))
		{
			NrozasIsDead = TRUE;

			if(MIS_TrueBattle == LOG_Running)
			{
				MIS_TrueBattle = LOG_Success;
				Log_SetTopicStatus(TOPIC_TrueBattle,LOG_Success);
				B_LogEntry(TOPIC_TrueBattle, " I killed Nrozas in a duel of Truth! Another Prior has died... " );
				B_StartOtherRoutine(Ass_144_Adept,"Start");
				B_StartOtherRoutine(Ass_145_Adept,"Start");
				B_StartOtherRoutine(Ass_146_Adept,"Start");
				B_StartOtherRoutine(Ass_147_Adept,"Start");
				B_StartOtherRoutine(Ass_148_Adept,"Start");
				B_StartOtherRoutine(Ass_149_Adept,"Start");
				B_StartOtherRoutine(Ass_138_Adept,"Start");
				B_StartOtherRoutine(Ass_139_Adept,"Start");
				B_StartOtherRoutine(Ass_140_Adept,"Start");
				B_StartOtherRoutine(Ass_141_Adept,"Start");
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_170_Adept)) && (HasimKilled == FALSE))
		{
			HasimKilled = TRUE;

			if(MIS_HasimKill == LOG_Running)
			{
				B_LogEntry(TOPIC_HasimKill,"Хасим мертв. Теперь можно доложить Тиаманту, что его поручение выполнено.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8514_farrok))
		{
			ELITEGENERALORICISDEAD_01 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry(TOPIC_KILLOCELITE,"Я убил орочьего военачальника Нар-Шогана.");
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry(TOPIC_KILLOCELITE,"Я убил всех орочьих военачальников, о которых мне говорил паладин Орик.");
				};
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_SleeperIns)) && (SleeperActive == FALSE))
		{
			Wld_InsertNpc(SLEEPER_OLD,"TPL_395");
			SleeperActive = TRUE;

			if(SleeperStone == FALSE)
			{
				AI_StartState(hero,ZS_MagicSleep,0,"");
			};

			if((MIS_SleeperBack == LOG_Running) && (NeedSleeperStone == FALSE) && (SleeperStone == FALSE))
			{
				B_LogEntry(TOPIC_SleeperBack, " The sleeper is back! Seeing him immediately puts me to sleep and I can't do anything about it. I don't think I can beat him now! I need to talk to Netback... " );
				NeedSleeperStone = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8515_nurshak))
		{
			ELITEGENERALORICISDEAD_02 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry( TOPIC_KILLOCELITE , " I killed the orc warlord Nur-Shak. " );
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry( TOPIC_KILLOCELITE , " I've killed all the Orc Warlords paladin Orik told me about. " );
				};
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8516_tumpak))
		{
			ELITEGENERALORICISDEAD_03 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry( TOPIC_KILLOCELITE , " I killed the Orc Warlord Tum-Pak. " );
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry( TOPIC_KILLOCELITE , " I've killed all the Orc Warlords paladin Orik told me about. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8517_durkash))
		{
			ELITEGENERALORICISDEAD_04 = TRUE;
			if(MIS_KILLOCELITE == LOG_Running)
			{
				B_LogEntry( TOPIC_KILLOCELITE , " I killed the orc warlord Dur-Kash. " );
				if((ELITEGENERALORICISDEAD_01 == TRUE) && (ELITEGENERALORICISDEAD_02 == TRUE) && (ELITEGENERALORICISDEAD_03 == TRUE) && (ELITEGENERALORICISDEAD_04 == TRUE))
				{
					Log_AddEntry( TOPIC_KILLOCELITE , " I've killed all the Orc Warlords paladin Orik told me about. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Undead_TT))
		{
			B_GivePlayerXP(1000);
			Wld_SendTrigger("TT_MAINGATE_ROOM_1");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_01))
		{
			DEMONDAGOTISDEAD_01 = TRUE;
			if((DEMONDAGOTISDEAD_01 == TRUE) && (DEMONDAGOTISDEAD_02 == TRUE) && (DEMONDAGOTISDEAD_03 == TRUE) && (DEMONDAGOTISDEAD_04 == TRUE))
			{
				ALLDAGOTDEMONSISDEAD = TRUE ;
				Wld_InsertItem(intru_teleportnow, " FP_STAND_UNGUARD_01 " );
				if(MIS_GUARDIANS == LOG_Running)
				{
					B_LogEntry( TOPIC_GUARDIANS , " I miraculously escaped death from the clutches of the demons summoned by the Guardian Dagoth... Now I need to decide what to do next. Whom should I ask for advice?! " );
				};
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_120_Adept)) && (FirstAssas == FALSE))
		{
			FirstAssas = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_02))
		{
			DEMONDAGOTISDEAD_02 = TRUE;
			if((DEMONDAGOTISDEAD_01 == TRUE) && (DEMONDAGOTISDEAD_02 == TRUE) && (DEMONDAGOTISDEAD_03 == TRUE) && (DEMONDAGOTISDEAD_04 == TRUE))
			{
				ALLDAGOTDEMONSISDEAD = TRUE ;
				Wld_InsertItem(intru_teleportnow, " FP_STAND_UNGUARD_01 " );
				if(MIS_GUARDIANS == LOG_Running)
				{
					B_LogEntry( TOPIC_GUARDIANS , " I miraculously escaped death from the clutches of the demons summoned by the Guardian Dagoth... Now I need to decide what to do next. Whom should I ask for advice?! " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_03))
		{
			DEMONDAGOTISDEAD_03 = TRUE;
			if((DEMONDAGOTISDEAD_01 == TRUE) && (DEMONDAGOTISDEAD_02 == TRUE) && (DEMONDAGOTISDEAD_03 == TRUE) && (DEMONDAGOTISDEAD_04 == TRUE))
			{
				ALLDAGOTDEMONSISDEAD = TRUE ;
				Wld_InsertItem(intru_teleportnow, " FP_STAND_UNGUARD_01 " );
				if(MIS_GUARDIANS == LOG_Running)
				{
					B_LogEntry( TOPIC_GUARDIANS , " I miraculously escaped death from the clutches of the demons summoned by the Guardian Dagoth... Now I need to decide what to do next. Whom should I ask for advice?! " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_04))
		{
			DEMONDAGOTISDEAD_04 = TRUE;
			if((DEMONDAGOTISDEAD_01 == TRUE) && (DEMONDAGOTISDEAD_02 == TRUE) && (DEMONDAGOTISDEAD_03 == TRUE) && (DEMONDAGOTISDEAD_04 == TRUE))
			{
				ALLDAGOTDEMONSISDEAD = TRUE ;
				Wld_InsertItem(intru_teleportnow, " FP_STAND_UNGUARD_01 " );
				if(MIS_GUARDIANS == LOG_Running)
				{
					B_LogEntry( TOPIC_GUARDIANS , " I miraculously escaped death from the clutches of the demons summoned by the Guardian Dagoth... Now I need to decide what to do next. Whom should I ask for advice?! " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_01))
		{
			WATERRITUALZOMBIEISDEAD_01 = TRUE;
			if((FIRSTWAVEMONSTERSTART == TRUE) && (FIRSTWAVEMONSTERSTOP == FALSE) && (WATERRITUALZOMBIEISDEAD_01 == TRUE) && (WATERRITUALZOMBIEISDEAD_02 == TRUE) && (WATERRITUALZOMBIEISDEAD_03 == TRUE) && (WATERRITUALZOMBIEISDEAD_04 == TRUE))
			{
				FIRSTWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_02))
		{
			WATERRITUALZOMBIEISDEAD_02 = TRUE;
			if((FIRSTWAVEMONSTERSTART == TRUE) && (FIRSTWAVEMONSTERSTOP == FALSE) && (WATERRITUALZOMBIEISDEAD_01 == TRUE) && (WATERRITUALZOMBIEISDEAD_02 == TRUE) && (WATERRITUALZOMBIEISDEAD_03 == TRUE) && (WATERRITUALZOMBIEISDEAD_04 == TRUE))
			{
				FIRSTWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_03))
		{
			WATERRITUALZOMBIEISDEAD_03 = TRUE;
			if((FIRSTWAVEMONSTERSTART == TRUE) && (FIRSTWAVEMONSTERSTOP == FALSE) && (WATERRITUALZOMBIEISDEAD_01 == TRUE) && (WATERRITUALZOMBIEISDEAD_02 == TRUE) && (WATERRITUALZOMBIEISDEAD_03 == TRUE) && (WATERRITUALZOMBIEISDEAD_04 == TRUE))
			{
				FIRSTWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_04))
		{
			WATERRITUALZOMBIEISDEAD_04 = TRUE;
			if((FIRSTWAVEMONSTERSTART == TRUE) && (FIRSTWAVEMONSTERSTOP == FALSE) && (WATERRITUALZOMBIEISDEAD_01 == TRUE) && (WATERRITUALZOMBIEISDEAD_02 == TRUE) && (WATERRITUALZOMBIEISDEAD_03 == TRUE) && (WATERRITUALZOMBIEISDEAD_04 == TRUE))
			{
				FIRSTWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualdarkskeleton_01))
		{
			WATERRITUALDARKSKELETONISDEAD_01 = TRUE;
			if((SECONDWAVEMONSTERSTART == TRUE) && (SECONDWAVEMONSTERSTOP == FALSE) && (WATERRITUALDARKSKELETONISDEAD_01 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_02 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_03 == TRUE))
			{
				SECONDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualdarkskeleton_02))
		{
			WATERRITUALDARKSKELETONISDEAD_02 = TRUE;
			if((SECONDWAVEMONSTERSTART == TRUE) && (SECONDWAVEMONSTERSTOP == FALSE) && (WATERRITUALDARKSKELETONISDEAD_01 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_02 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_03 == TRUE))
			{
				SECONDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualdarkskeleton_03))
		{
			WATERRITUALDARKSKELETONISDEAD_03 = TRUE ;
			if((SECONDWAVEMONSTERSTART == TRUE) && (SECONDWAVEMONSTERSTOP == FALSE) && (WATERRITUALDARKSKELETONISDEAD_01 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_02 == TRUE) && (WATERRITUALDARKSKELETONISDEAD_03 == TRUE))
			{
				SECONDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualknightdeath_01))
		{
			WATERRITUALKNIGHTDEATHISDEAD_01 = TRUE;
			if((THIRDWAVEMONSTERSTART == TRUE) && (THIRDWAVEMONSTERSTOP == FALSE) && (WATERRITUALKNIGHTDEATHISDEAD_01 == TRUE) && (WATERRITUALKNIGHTDEATHISDEAD_02 == TRUE))
			{
				THIRDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualknightdeath_02))
		{
			WATERRITUALKNIGHTDEATHISDEAD_02 = TRUE;
			if((THIRDWAVEMONSTERSTART == TRUE) && (THIRDWAVEMONSTERSTOP == FALSE) && (WATERRITUALKNIGHTDEATHISDEAD_01 == TRUE) && (WATERRITUALKNIGHTDEATHISDEAD_02 == TRUE))
			{
				THIRDWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualskeletonlord))
		{
			WATERRITUALSKELETONLORDISDEAD = TRUE;
			if((FORTHWAVEMONSTERSTART == TRUE) && (FORTHWAVEMONSTERSTOP == FALSE))
			{
				FORTHWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualdemon))
		{
			WATERRITUALDEMONISDEAD = TRUE;
			if((FIFTHWAVEMONSTERSTART == TRUE) && (FIFTHWAVEMONSTERSTOP == FALSE))
			{
				FIFTHWAVEMONSTERSTOP = TRUE;
				APPEARMONSTER = 0;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_general_nw))
		{
			ULTIMATEELITEORKNWFLGISDEAD = TRUE;
			HORINISISFREE = TRUE;

			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if ( MIS_HORINISFREE  == LOG_Running )
			{
				MIS_HORINISFREE = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_HORINISFREE,LOG_SUCCESS);
				B_LogEntry( TOPIC_OR with GREATWAR , " I destroyed the orc leader who led the troops in Khorinis. I think that now the orcs will not put up a worthy resistance, having lost their leader ... it remains only to kill them in the city itself. " );
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Caracust)) && (KillCaracust == FALSE))
		{
			B_GivePlayerXP(3000);
			KillCaracust = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_22))
		{
			ELITEORKNWFLGISDEAD_22 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((MONASTERYISFREE == FALSE) && (ELITEORKNWFLGISDEAD_22 == TRUE) && (ELITEORKNWFLGISDEAD_33 == TRUE) && (ELITEORKNWFLGISDEAD_34 == TRUE) && (ELITEORKNWFLGISDEAD_35 == TRUE))
			{
				MONASTERYISFREE = TRUE;
				if(MIS_MONASTERYSIEDGE == LOG_Running)
				{
					MIS_MONASTERYSIEDGE = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_SUCCESS);
					B_LogEntry( TOPIC_MONASTERYSIEDGE , " I have destroyed the entire orc command staff that led the siege of the monastery! The pyrocar will be glad to hear this. " );
				};
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1801_Fingers)) && (FingersIsDead == FALSE))
		{
			FingersIsDead = TRUE;

			if(MIS_FingersOpenDoor == LOG_Running)
			{
				MIS_FingersOpenDoor = LOG_Failed;
				B_LogEntry_Failed(TOPIC_FingersOpenDoor);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Shadowbeast_Loa_01))
		{
			ShadowbeastLoa01 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Shadowbeast_Loa_02))
		{
			ShadowbeastLoa02 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_33))
		{
			ELITEORKNWFLGISDEAD_33 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((MONASTERYISFREE == FALSE) && (ELITEORKNWFLGISDEAD_22 == TRUE) && (ELITEORKNWFLGISDEAD_33 == TRUE) && (ELITEORKNWFLGISDEAD_34 == TRUE) && (ELITEORKNWFLGISDEAD_35 == TRUE))
			{
				MONASTERYISFREE = TRUE;
				if(MIS_MONASTERYSIEDGE == LOG_Running)
				{
					MIS_MONASTERYSIEDGE = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_SUCCESS);
					B_LogEntry( TOPIC_MONASTERYSIEDGE , " I have destroyed the entire orc command staff that led the siege of the monastery! The pyrocar will be glad to hear this. " );
				};
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_34))
		{
			ELITEORKNWFLGISDEAD_34 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((MONASTERYISFREE == FALSE) && (ELITEORKNWFLGISDEAD_22 == TRUE) && (ELITEORKNWFLGISDEAD_33 == TRUE) && (ELITEORKNWFLGISDEAD_34 == TRUE) && (ELITEORKNWFLGISDEAD_35 == TRUE))
			{
				MONASTERYISFREE = TRUE;
				if(MIS_MONASTERYSIEDGE == LOG_Running)
				{
					MIS_MONASTERYSIEDGE = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_SUCCESS);
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Я уничтожил весь командный состав орков, который руководил осадой монастыря! Пирокар будет рад этому известию.");
				};
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_35))
		{
			ELITEORKNWFLGISDEAD_35 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((MONASTERYISFREE == FALSE) && (ELITEORKNWFLGISDEAD_22 == TRUE) && (ELITEORKNWFLGISDEAD_33 == TRUE) && (ELITEORKNWFLGISDEAD_34 == TRUE) && (ELITEORKNWFLGISDEAD_35 == TRUE))
			{
				MONASTERYISFREE = TRUE;
				if(MIS_MONASTERYSIEDGE == LOG_Running)
				{
					MIS_MONASTERYSIEDGE = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_MONASTERYSIEDGE,LOG_SUCCESS);
					B_LogEntry(TOPIC_MONASTERYSIEDGE,"Я уничтожил весь командный состав орков, который руководил осадой монастыря! Пирокар будет рад этому известию.");
				};
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_23))
		{
			ELITEORKNWFLGISDEAD_23 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_24))
		{
			ELITEORKNWFLGISDEAD_24 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_25))
		{
			ELITEORKNWFLGISDEAD_25 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_27))
		{
			ELITEORKNWFLGISDEAD_27 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_28))
		{
			ELITEORKNWFLGISDEAD_28 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_29))
		{
			ELITEORKNWFLGISDEAD_29 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_30))
		{
			ELITEORKNWFLGISDEAD_30 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_32))
		{
			ELITEORKNWFLGISDEAD_32 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DarkZhnez)) && (DarkZhnezIsDead == FALSE))
		{
			DarkZhnezIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_36))
		{
			ELITEORKNWFLGISDEAD_36 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon4_nwchkflg_03))
		{
			SUPERELITEORKNWFLGISDEAD_03 = TRUE;
			if(GUARDIANSISDEFEATED == FALSE)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
				Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] = 0;
			};
			if((HORINISISFREE == TRUE) && (MONASTERYISFREE == TRUE) && (ELITEORKNWFLGISDEAD_23 == TRUE) && (ELITEORKNWFLGISDEAD_24 == TRUE) && (ELITEORKNWFLGISDEAD_25 == TRUE) && (ELITEORKNWFLGISDEAD_27 == TRUE) && (ELITEORKNWFLGISDEAD_28 == TRUE) && (ELITEORKNWFLGISDEAD_29 == TRUE) && (ELITEORKNWFLGISDEAD_30 == TRUE) && (ELITEORKNWFLGISDEAD_32 == TRUE) && (ELITEORKNWFLGISDEAD_36 == TRUE) && (SUPERELITEORKNWFLGISDEAD_03 == TRUE))
			{
				ALLGREATVICTORY = TRUE;
			};
			b_victoryevents();
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Undead)) && (DragonUndeadIsDead == FALSE))
		{
			DragonUndeadIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Fire)) && (DragonFireIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_CAMERA_DEADDRAGON_FIRE");
			Snd_Play("DRAGON_WRATH_02");
			DragonFireIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Ice)) && (DragonIceIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_CAMERA_DEADDRAGON_ICE");
			Snd_Play("DRAGON_WRATH_02");
			DragonIceIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Swamp)) && (DragonSwampIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_CAMERA_DEADDRAGON_SWAMP");
			Snd_Play("DRAGON_WRATH_02");
			DragonSwampIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Rock)) && (DragonRockIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_CAMERA_DEADDRAGON_STONE");
			Snd_Play("DRAGON_WRATH_02");
			DragonRockIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Fire_Island)) && (DragonRedIsDead == FALSE))
		{
			DragonRedIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chk_gate))
		{
			Wld_SendTrigger("EVT_OC_MAINGATE_P2_TRIGGER");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_nwchkflg_26))
		{
			ELITEORKPASSISDEAD = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2500_garond))
		{
			GARONDNWISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2510_oric))
		{
			ORICNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2520_parcival))
		{
			PARCIVALNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2170_marcos))
		{
			MARCOSNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_75230_albert))
		{
			ALBERTNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2680_udar))
		{
			UDARNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_91680_natan))
		{
			NATANNWISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_udar))
		{
			FLAG_ORCS_UDAR_01 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_01))
		{
			FLAG_ORCS_UDAR_02 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_02))
		{
			FLAG_ORCS_UDAR_03 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_03))
		{
			FLAG_ORCS_UDAR_04 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_04))
		{
			FLAG_ORCS_UDAR_05 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_udar_05))
		{
			FLAG_ORCS_UDAR_06 = TRUE;
		};
		if((MIS_NATANDOLG == LOG_Running) && (FLAG_ORCS_UDAR_01 == TRUE) && (FLAG_ORCS_UDAR_02 == TRUE) && (FLAG_ORCS_UDAR_03 == TRUE) && (FLAG_ORCS_UDAR_04 == TRUE) && (FLAG_ORCS_UDAR_05 == TRUE) && (FLAG_ORCS_UDAR_06 == TRUE) && (UDARORCSTRAPISDONE == FALSE))
		{
			B_LogEntry(TOPIC_NATANDOLG,"Наша задуманная с Ударом уловка кажется удалась! Теперь посмотрим что на это скажет сам Натан...");
			UDARORCSTRAPISDONE = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(stonegolem_osta))
		{
			OSTAISDEAD = TRUE;

			if(MIS_XARDASTASKSFOUR == LOG_Running)
			{
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Я уничтожил стража темной башни.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1299_OberDementor_DI))
		{
			OberDementorIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_117_nergal))
		{
			NERGALISDEAD = TRUE;

			if((MIS_XARDASTASKSFOUR == LOG_Running) && (XARDASRITUALFAIL == TRUE))
			{
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Я успокоил душу могущественного некроманта! Теперь можно подумать и о том, как достать Некрономикон.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(scavenger_sprint))
		{
			if(MIS_HUNTERCHALLANGE == LOG_Running)
			{
				B_StartOtherRoutine(hun_741_falk,"Start");
			};
		};
		if((CassiaIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_447_Cassia)))
		{
			CassiaIsDead = TRUE;
		};
		if((RamirezIsDead == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_445_Ramirez)))
		{
			RamirezIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_Lord_Milten))
		{
			B_StartOtherRoutine(PC_Mage_OW,"Start");
			B_StartOtherRoutine(VLK_4100_Brutus,"Start");
			B_StartOtherRoutine(VLK_4101_Waffenknecht,"Start");
			B_StartOtherRoutine(VLK_4102_Waffenknecht,"Start");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TROLL_YOUNG_PW)) && (TrollYoungPW == FALSE))
		{
			TrollYoungPW = TRUE;

			if((PoisonResult == FALSE) && (NoTrollPoison == FALSE))
			{
				B_LogEntry(TOPIC_PW_PoisonNrozas,"Я убил тролля, на котором мог испытать яд. Боюсь, что теперь будет проблематично найти ему замену...");
				NoTrollPoison = TRUE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETONMAGE_STRANGECAVE)) && (StrangeCaveMageIsDead == FALSE))
		{
			StrangeCaveMageIsDead = TRUE;
			B_LogEntry(TOPIC_StrangeCave,"Я разобрался с проблемой в пещере...");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_01)) && (FIRETESTMONSTERONEISDEAD == FALSE))
		{
			FIRETESTMONSTERONEISDEAD = TRUE;
			Snd_Play("LevelUp");

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry(TOPIC_KELIOSTEST,"Я прошел Испытание Огнем! Теперь, думаю пора возвращаться к хранителю Келиосу.");
				KELIOSFIRETEST = TRUE;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_02)) && (FIRETESTMONSTERTWOISDEAD == FALSE))
		{
			FIRETESTMONSTERTWOISDEAD = TRUE;
			Snd_Play("LevelUp");

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry(TOPIC_KELIOSTEST,"Я прошел Испытание Огнем! Теперь, думаю пора возвращатьтся к хранителю Келиосу.");
				KELIOSFIRETEST = TRUE;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_03)) && (FIRETESTMONSTERTHREEISDEAD == FALSE))
		{
			FIRETESTMONSTERTHREEISDEAD = TRUE;
			Snd_Play("LevelUp");

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry(TOPIC_KELIOSTEST,"Я прошел Испытание Огнем! Теперь, думаю пора возвращатьтся к хранителю Келиосу.");
				KELIOSFIRETEST = TRUE;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(CastlemineDMT)) && (CastlemineDMTIsDead == FALSE))
		{
			CastlemineDMTIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1271_Dementor)) && (CastlemineDMTMasterIsDead == FALSE))
		{
			CastlemineDMTMasterIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_04)) && (FIRETESTMONSTERFOURISDEAD == FALSE))
		{
			FIRETESTMONSTERFOURISDEAD = TRUE;
			Snd_Play("LevelUp");

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry( TOPIC_KELIOSTEST , " I've passed the Trial by Fire! Now, I think it's time to get back to Keeper Kelios. " );
				KELIOSFIRETEST = TRUE ;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(firetestmonster_05)) && (FIRETESTMONSTERFIVEISDEAD == FALSE))
		{
			FIRETESTMONSTERFIVEISDEAD = TRUE;
			Snd_Play("LevelUp");
			CreateInvItems(hero,itmi_firestone,1);

			if((MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == FALSE) && (FIRETESTMONSTERONEISDEAD == TRUE) && (FIRETESTMONSTERTWOISDEAD == TRUE) && (FIRETESTMONSTERTHREEISDEAD == TRUE) && (FIRETESTMONSTERFOURISDEAD == TRUE) && (FIRETESTMONSTERFIVEISDEAD == TRUE))
			{
				B_LogEntry( TOPIC_KELIOSTEST , " I've passed the Trial by Fire! Now, I think it's time to get back to Keeper Kelios. " );
				KELIOSFIRETEST = TRUE ;
			};

			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			AI_Teleport(hero,"START_FIRECAVE");
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6027_taliasan))
		{
			if((MIS_XARDASNDMTASKSTWO == LOG_Running) && (GIVEXARDASSEEKBOOK == FALSE))
			{
				TALIASANISDEAD = TRUE;
				B_LogEntry( TOPIC_XARDASNDMTASKSTWO , " Gallahad is dead! Xardas needs to be informed. " );
			};
		};
		if ((Talbin_NW_InCamp ==  FALSE ) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4132_Talbin_NW)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4130_Talbin_NW)))
		{
			Talbin_NW_InCamp = TRUE;
			FalkHunters -= 1;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4148_Gestath)) && (GestatIsDead == FALSE))
		{
			GestatIsDead = TRUE;
		};
		if((Gestath_InCamp == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4149_Gestath)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4148_Gestath))))
		{
			Gestath_InCamp = TRUE;
			FalkHunters -= 1;
		};
		if((Bartok_InCamp == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_440_Bartok)))
		{
			Bartok_InCamp = TRUE;
			FalkHunters -= 1;
		};
		if((MIS_PW_FollowGoldOre == LOG_Running) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_184_Adept)) && (OsairWarriorWait == FALSE))
		{
			OsairWarriorWait = TRUE;
		};
		if(MIS_NewHunters == LOG_Running)
		{
			if(FalkHunters == FALSE)
			{
				MIS_NewHunters = LOG_OBSOLETE;
				Log_SetTopicStatus(TOPIC_NewHunters,LOG_OBSOLETE);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sleeper))
		{
			Snd_Play("SLEEPER_DIE");
			LIDEMONISDEAD = TRUE;

			if(MIS_MILTENANCIENT == LOG_Running)
			{
				outter = Hlp_GetNpc(pc_mage_li);
				outer.aivar[ AIV_PARTYMEMBER ] = FALSE ;
				B_StartOtherRoutine(outter,"Cave");
				AI_GotoNpc(outter,hero);
				B_KillNpc(demonlord_li_1);
				B_KillNpc(demonlord_li_2);
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_3320_City Guard))
		{
			CreateInvItems(self,ItMi_DeadManHead,1);
			self.aivar[AIV_StoryBandit] = TRUE ;
		};
		if((TPLBalamDead == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8100_TEMPLER)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8101_TEMPLER)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8102_TEMPLER)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8103_TEMPLER)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8104_TEMPLER))))
		{
			if((AssasinsAttackCamp == TRUE) && (AssInvasionStop == FALSE))
			{
				TPLBalamDead = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_01))
		{
			Ginnok_Guard_01 = TRUE;

			if((Ginnok_Guard_01 == TRUE) && (Ginnok_Guard_02 == TRUE))
			{
				
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 30000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_02))
		{
			Ginnok_Guard_02 = TRUE;

			if((Ginnok_Guard_01 == TRUE) && (Ginnok_Guard_02 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 30000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_03))
		{
			Ginnok_Guard_03 = TRUE;

			if((Ginnok_Guard_03 == TRUE) && (Ginnok_Guard_04 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 20000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if ((CurrentLevel ==  PRIORATWORLD_ZEN ) && (self.guild ==  GIL_STRF ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE ))) ;
		{
			PlayerIsPrioratFake = TRUE;

			if(MIS_MasiafStory == LOG_Running)
			{
				B_LogEntry(TOPIC_MasiafStory, " I don't think the shadows will be happy that I kill their slaves. I probably won't be able to impersonate one of them now. I should talk to Gonzalez about this. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_04))
		{
			Ginnok_Guard_04 = TRUE;

			if((Ginnok_Guard_03 == TRUE) && (Ginnok_Guard_04 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 20000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_05))
		{
			Ginnok_Guard_05 = TRUE;

			if((Ginnok_Guard_05 == TRUE) && (Ginnok_Guard_06 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 10000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_knight_ginnok_06))
		{
			Ginnok_Guard_06 = TRUE;

			if((Ginnok_Guard_05 == TRUE) && (Ginnok_Guard_06 == TRUE))
			{
				Skeleton_Lord_Ginnok.flags = FALSE;
				Skeleton_Lord_Ginnok.attribute[ATR_STRENGTH] += 250;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX] = 10000;
				Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS] = Skeleton_Lord_Ginnok.attribute[ATR_HITPOINTS_MAX];
				AI_Teleport(Skeleton_Lord_Ginnok,Npc_GetNearestWP(hero));
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_keltuzed))
		{
			KelTuzedIsDead = TRUE;
			Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Snd_Play("ZOM_DIE");
			B_KillNpc(skeleton_knight_death_01);
			B_KillNpc(skeleton_knight_death_02);
			B_KillNpc(skeleton_knight_death_03);
			B_KillNpc(skeleton_knight_death_04);
			Wld_SendTrigger("EVENT_DAKATGATE");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_171_Adept)) && (NarugIsDeadNow == FALSE))
		{
			NarugIsDeadNow = TRUE;
		};
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_Archol)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID( DARKTOWER_SKELETON_LORD )) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID ( Skeleton_Lord_Ginnok)) || = Hlp_GetInstanceID(skeleton_lord_mirat)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crypt_Skeleton_Lord)))
		{
			Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Snd_Play("ZOM_DIE");

			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Ginnok == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_Ginnok)))
			{
				Wld_SendTrigger("GINNOK_GATE_ENTER");
				KillDeadPal_Ginnok = TRUE;
				B_LogEntry(TOPIC_DarkOrden, " I destroyed the mad crusader - Lord Ginnok! " );
			};
			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Serdah == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_mirat)))
			{
				KillDeadPal_Serdah = TRUE ;
				B_LogEntry(TOPIC_DarkOrden, " I destroyed Lord Mirath! " );
			};
			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Innubis == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crypt_Skeleton_Lord)))
			{
				KillDeadPal_Innubis = TRUE;
				B_LogEntry(TOPIC_DarkOrden, " I destroyed Lord Innubis! " );
			};
			if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Dexsar == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DARKTOWER_SKELETON_LORD)))
			{
				KillDeadPal_Dexsar = TRUE;
				B_LogEntry(TOPIC_DarkOrden, " I destroyed Lord Ulzar! " );
			};
			if((KillDeadPal_Serdah == TRUE) && (KillDeadPal_Innubis == TRUE) && (KillDeadPal_Dexsar == TRUE) && (KillDeadPalAll == FALSE))
			{
				KillDeadPalAll = TRUE;
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_kadar))
		{
			if((MIS_HROMANINQUEST == LOG_Running) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_lord_kadar)))
			{
				Wld_SendTrigger("HROMANIN_GATE");
				MIS_HROMANINQUEST = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_HROMANINQUEST,LOG_SUCCESS);
				B_LogEntry( TOPIC_HROMANINQUEST , " Hromanin's secret is out! Kadar, his guardian, was behind it all. Well, so much the worse for him... " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4201_Wirt)) && (WirtIsDead == FALSE))
		{
			WirtIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8160_Ragnar)) && (RagnarIsDead == FALSE))
		{
			RagnarIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1083_Addon_Esteban)) && (EstebanIsDead == FALSE))
		{
			EstebanIsDead = TRUE;
			CreateInvItems(self,ITKE_Addon_Esteban_01,1);
			CreateInvItems(self,ItMi_Addon_Stone_01,5);
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Stone)) && (AvatarStoneIsDead == FALSE))
		{
			AvatarStoneIsDead = TRUE;
			B_LogEntry( TOPIC_ORCSECRET , " I killed the stone atronach. " );

			if((AvatarWaterIsDead == TRUE) && (AvatarFireIsDead == TRUE) && (AvatarStoneIsDead == TRUE))
			{
				ALLGUARDMINIONSISDEAD = TRUE;
				) ; _ _ _ _ _
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Fire)) && (AvatarFireIsDead == FALSE))
		{
			AvatarFireIsDead = TRUE;
			B_LogEntry( TOPIC_ORCSECRET , " I killed the fire atronach. " );

			if((AvatarWaterIsDead == TRUE) && (AvatarFireIsDead == TRUE) && (AvatarStoneIsDead == TRUE))
			{
				ALLGUARDMINIONSISDEAD = TRUE;
				) ; _ _ _ _ _
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Water)) && (AvatarWaterIsDead == FALSE))
		{
			AvatarWaterIsDead = TRUE;
			B_LogEntry( TOPIC_ORCSECRET , " I killed a Frost Atronach. " );

			if((AvatarWaterIsDead == TRUE) && (AvatarFireIsDead == TRUE) && (AvatarStoneIsDead == TRUE))
			{
				ALLGUARDMINIONSISDEAD = TRUE;
				) ; _ _ _ _ _
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XranFreg)) && (XranFregIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_EGEZARTDOOR");

			if(MIS_XRANFREG == LOG_Running)
			{
				MIS_XRANFREG = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_XRANFREG,LOG_SUCCESS);
				B_LogEntry( TOPIC_XRANFREG , " I have destroyed Fregarach! The stone titan, inspired by the spirit of Stonnos himself, has gone into oblivion. " );
			};

			XranFregIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORKELITE_ADDON4_CHKFLG_29)) && (FreeMineGeneralIsDead == FALSE))
		{
			FreeMineGeneralIsDead = TRUE;

			if(MIS_ScoutNewMine == LOG_Running)
			{
				B_LogEntry(TOPIC_ScoutNewMine, " I've reached the Orc Warlord in the New Camp Mine. I don't think the Orcs will come here anymore! Garond should be informed about this. " );
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_250_Garond))
		{
			EARLY DEAD = TRUE ;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TPL_8104_TEMPLER)) && (MIS_TrainInCamp == LOG_Running))
		{
			B_LogEntry_Failed(TOPIC_TrainInCamp);
			MIS_TrainInCamp = LOG_Failed;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_251_Oric))
		{
			ORICISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_252_Parcival))
		{
			PARCIVALISDEAD = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_268_Udar))
		{
			UDARISDEAD = TRUE ;
			if(MIS_NATANDOLG == LOG_Running)
			{
				MIS_NATANDOLG = LOG_FAILED ;
				B_LogEntry_Failed(TOPIC_NATANDOLG);
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_2680_udar))
		{
			if(MIS_NATANDOLG == LOG_Running)
			{
				MIS_NATANDOLG = LOG_FAILED ;
				B_LogEntry_Failed(TOPIC_NATANDOLG);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_217_Marcos))
		{
			MARCOSISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7523_albert))
		{
			ALBERTISDEAD = TRUE;

			if ( MIS_DRAKARBROKE  == LOG_Running)
			{
				MIS_DRAKARBROKE = LOG_Failed;
				B_LogEntry_Failed(TOPIC_DRAKARBROKE);
			};
			if(MIS_ORCORDER == LOG_Running)
			{
				MIS_ORCORDER = LOG_Failed;
				Log_CreateTopic(TOPIC_ORCORDER,LOG_OBSOLETE);
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_9168_natan))
		{
			NATANISDEAD = TRUE;
			if(MIS_NATANDOLG == LOG_Running)
			{
				MIS_NATANDOLG = LOG_FAILED ;
				B_LogEntry_Failed(TOPIC_NATANDOLG);
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_91680_natan))
		{
			if(MIS_NATANDOLG == LOG_Running)
			{
				MIS_NATANDOLG = LOG_FAILED ;
				B_LogEntry_Failed(TOPIC_NATANDOLG);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_01))
		{
			HaniarDemon01IsDead = TRUE;

			if((HaniarDemon01IsDead == TRUE) && (HaniarDemon02IsDead == TRUE) && (HaniarDemon03IsDead == TRUE) && (HaniarFinalTalk == FALSE))
			{
				HaniarFinalTalk = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_02))
		{
			HaniarDemon02IsDead = TRUE;

			if((HaniarDemon01IsDead == TRUE) && (HaniarDemon02IsDead == TRUE) && (HaniarDemon03IsDead == TRUE) && (HaniarFinalTalk == FALSE))
			{
				HaniarFinalTalk = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_03))
		{
			HaniarDemon03IsDead = TRUE;

			if((HaniarDemon01IsDead == TRUE) && (HaniarDemon02IsDead == TRUE) && (HaniarDemon03IsDead == TRUE) && (HaniarFinalTalk == FALSE))
			{
				HaniarFinalTalk = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7518_ritter))
		{
			PAL_7518_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7519_ritter))
		{
			PAL_7519_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7520_ritter))
		{
			PAL_7520_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7521_ritter))
		{
			PAL_7521_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7522_ritter))
		{
			PAL_7522_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_7524_ritter))
		{
			PAL_7524_ISDEAD = TRUE ;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_253_Wache))
		{
			PAL_253_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_257_Ritter))
		{
			PAL_257_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_9165_ritter))
		{
			PAL_9165_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_9166_ritter))
		{
			PAL_9166_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_9167_ritter))
		{
			PAL_9167_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_700_Sylvio) && (MIS_SylvioDebts == LOG_Running) && (SylvioIsDead == FALSE))
		{
			SylvioIsDead = TRUE;
			B_LogEntry(Topic_SylvioDebts, " That greedy bastard, Silvio, is dead! That's where he belongs. Now all his gold belongs to me. I should pay off Ratford... " );
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( Mil_337_Mika ) )
		{
			MIKAISDEAD = TRUE;

			if(MikaGiveKey == FALSE)
			{
				CreateInvItems(self,ItKe_Constantino,1);
				MikaGiveKey = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Rug))
		{
			TrollBrother_01 = TRUE;

			if((TrollBrother_01 == TRUE) && (TrollBrother_02 == TRUE) && (TrollBrother_03 == TRUE) && (TrollBrotherIsDead == FALSE))
			{
				TrollBrotherIsDead = TRUE;
				b_givebonusforelitemonster(5);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Trag))
		{
			TrollBrother_02 = TRUE;

			if((TrollBrother_01 == TRUE) && (TrollBrother_02 == TRUE) && (TrollBrother_03 == TRUE) && (TrollBrotherIsDead == FALSE))
			{
				TrollBrotherIsDead = TRUE;
				b_givebonusforelitemonster(5);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Brog))
		{
			TrollBrother_03 = TRUE;

			if((TrollBrother_01 == TRUE) && (TrollBrother_02 == TRUE) && (TrollBrother_03 == TRUE) && (TrollBrotherIsDead == FALSE))
			{
				TrollBrotherIsDead = TRUE;
				b_givebonusforelitemonster(5);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcwarrior_salandril))
		{
			ORCWARRIORSALANDRILISDEAD = TRUE;
			if (( MIKATELLORKSGO  ==  TRUE ) && ( MIKATELLORKSDONE  ==  FALSE ) && ( mika.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && ( MIKAISDEAD  ==  FALSE ))
			{
				MIKATELLORKSDONE = TRUE;
				mika.aivar[ AIV_PARTYMEMBER ] = FALSE ;
				B_StartOtherRoutine(mika,"Start");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_702_Rod))
		{
			DJG_ROD_ISDEAD = TRUE ;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry( TOPIC_KILLDRAGONHUNTER , " As Hag-Thar told me, I killed all the dragon hunters. " );
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_703_Cipher))
		{
			DJG_CIPHER_ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry( TOPIC_KILLDRAGONHUNTER , " As Hag-Thar told me, I killed all the dragon hunters. " );
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_713_Biff))
		{
			DJG_BIFF_ISDEAD = TRUE ;
			if((Biff_FollowsThroughPass != LOG_SUCCESS) || (Biff_FollowsThroughPass != LOG_Running))
			{
				if(MIS_KILLDRAGONHUNTER == LOG_Running)
				{
					KILLCOUNTDJG = KILLCOUNTDJG + 1;
					if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
					{
						ALLDRGHUNTERSISDEAD = TRUE;
						B_LogEntry( TOPIC_KILLDRAGONHUNTER , " As Hag-Thar told me, I killed all the dragon hunters. " );
					};
				}
				else if(KILLGLOBALCOUNTDJG < 1)
				{
					KILLGLOBALCOUNTDJG = 0;
				}
				else
				{
					KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_708_Kurgan))
		{
			DRGHUNTER01ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry( TOPIC_KILLDRAGONHUNTER , " As Hag-Thar told me, I killed all the dragon hunters. " );
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6667_RitualShaman))
		{
			RitualShaman_01 = TRUE;

			if((RitualShaman_01 == TRUE) && (RitualShaman_02 == TRUE) && (RitualShaman_03 == TRUE))
			{
				ORC_6666_HASH_GOR .flags = FALSE ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6668_RitualShaman))
		{
			RitualShaman_02 = TRUE;

			if((RitualShaman_01 == TRUE) && (RitualShaman_02 == TRUE) && (RitualShaman_03 == TRUE))
			{
				ORC_6666_HASH_GOR .flags = FALSE ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6669_RitualShaman))
		{
			RitualShaman_03 = TRUE;

			if((RitualShaman_01 == TRUE) && (RitualShaman_02 == TRUE) && (RitualShaman_03 == TRUE))
			{
				ORC_6666_HASH_GOR .flags = FALSE ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6670_RitualShaman))
		{
			RitualShaman_04 = TRUE;

			if((RitualShaman_04 == TRUE) && (RitualShaman_05 == TRUE) && (RitualShaman_06 == TRUE))
			{
				ORC_6666_HASH_GOR .flags = FALSE ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6671_RitualShaman))
		{
			RitualShaman_05 = TRUE;

			if((RitualShaman_04 == TRUE) && (RitualShaman_05 == TRUE) && (RitualShaman_06 == TRUE))
			{
				ORC_6666_HASH_GOR .flags = FALSE ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6672_RitualShaman))
		{
			RitualShaman_06 = TRUE;

			if((RitualShaman_04 == TRUE) && (RitualShaman_05 == TRUE) && (RitualShaman_06 == TRUE))
			{
				ORC_6666_HASH_GOR .flags = FALSE ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6673_RitualShaman))
		{
			RitualShaman_07 = TRUE;

			if((RitualShaman_07 == TRUE) && (RitualShaman_08 == TRUE) && (RitualShaman_09 == TRUE))
			{
				ORC_6666_HASH_GOR .flags = FALSE ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6674_RitualShaman))
		{
			RitualShaman_08 = TRUE;

			if((RitualShaman_07 == TRUE) && (RitualShaman_08 == TRUE) && (RitualShaman_09 == TRUE))
			{
				ORC_6666_HASH_GOR .flags = FALSE ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6675_RitualShaman))
		{
			RitualShaman_09 = TRUE;

			if((RitualShaman_07 == TRUE) && (RitualShaman_08 == TRUE) && (RitualShaman_09 == TRUE))
			{
				ORC_6666_HASH_GOR .flags = FALSE ;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1812_Dementor)) && (RoscoeDMTIsDead == FALSE))
		{
			RoscoeDMTIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_710_Kjorn))
		{
			DRGHUNTER02ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry( TOPIC_KILLDRAGONHUNTER , " As Hag-Thar told me, I killed all the dragon hunters. " );
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_711_Godar))
		{
			DRGHUNTER03ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry( TOPIC_KILLDRAGONHUNTER , " As Hag-Thar told me, I killed all the dragon hunters. " );
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_712_Hokurn))
		{
			DRGHUNTER04ISDEAD = TRUE;
			if(MIS_KILLDRAGONHUNTER == LOG_Running)
			{
				KILLCOUNTDJG = KILLCOUNTDJG + 1;
				if(KILLCOUNTDJG >= KILLGLOBALCOUNTDJG)
				{
					ALLDRGHUNTERSISDEAD = TRUE;
					B_LogEntry( TOPIC_KILLDRAGONHUNTER , " As Hag-Thar told me, I killed all the dragon hunters. " );
				};
			}
			else if(KILLGLOBALCOUNTDJG < 1)
			{
				KILLGLOBALCOUNTDJG = 0;
			}
			else
			{
				KILLGLOBALCOUNTDJG = KILLGLOBALCOUNTDJG - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_01))
		{
			CASTLEFLAGBACK_01 = TRUE;
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry( TOPIC_STURMCASTLE , " It seems that luck was on our side this time! Having killed all the commanding staff of the orcs in the fortress, I do not think that the orcs will be able to defend it to the end. " );
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_02))
		{
			CASTLEFLAGBACK_02 = TRUE;

			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry( TOPIC_STURMCASTLE , " It seems that luck was on our side this time! Having killed all the commanding staff of the orcs in the fortress, I do not think that the orcs will be able to defend it to the end. " );
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Werewolf))
		{
			WerewolfIsDead = TRUE;

			if(MIS_WolfAndMan == LOG_Running)
			{
				MIS_WolfAndMan = LOG_Failed;
				B_LogEntry_Failed(TOPIC_WolfAndMan);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_03))
		{
			CASTLEFLAGBACK_03 = TRUE;
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry( TOPIC_STURMCASTLE , " It seems that luck was on our side this time! Having killed all the commanding staff of the orcs in the fortress, I do not think that the orcs will be able to defend it to the end. " );
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_04))
		{
			CASTLEFLAGBACK_04 = TRUE;
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry( TOPIC_STURMCASTLE , " It seems that luck was on our side this time! Having killed all the commanding staff of the orcs in the fortress, I do not think that the orcs will be able to defend it to the end. " );
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_castle_05))
		{
			CASTLEFLAGBACK_05 = TRUE;
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry( TOPIC_STURMCASTLE , " It seems that luck was on our side this time! Having killed all the commanding staff of the orcs in the fortress, I do not think that the orcs will be able to defend it to the end. " );
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Anti_Hero)) && (BossTear == FALSE))
		{
			Wld_SendTrigger("EVT_TEARDOOR");
			Wld_SendTrigger( " EVT_TT_TO_AV " );
			BossTear = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NOV_605_Opolos)) && (OpolosIsDead == FALSE))
		{
			OpolosIsDead = TRUE;

			if(MIS_Xardas_LastStand_Done == LOG_Running)
			{
				B_LogEntry( TOPIC_XARDAS_DEMON , " I killed a Firebender acolyte. " );
			};
		};
		if((IlArahDemonIsDead_01 == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah_Chaos_Lord_01)))
		{
			IlArahDemonIsDead_01 = TRUE;

			if((IlArahDemonIsDead_01 == TRUE) && (IlArahDemonIsDead_02 == TRUE) && (IlArahDemonIsDead_03 == TRUE) && (IlArahDemonIsDead_04 == TRUE))
			{
				IlArahAllDemonsIsDead = TRUE;
			};
		};
		if((IlArahDemonIsDead_02 == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah_Chaos_Lord_02)))
		{
			IlArahDemonIsDead_02 = TRUE;

			if((IlArahDemonIsDead_01 == TRUE) && (IlArahDemonIsDead_02 == TRUE) && (IlArahDemonIsDead_03 == TRUE) && (IlArahDemonIsDead_04 == TRUE))
			{
				IlArahAllDemonsIsDead = TRUE;
			};
		};
		if((IlArahDemonIsDead_03 == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah_Chaos_Lord_03)))
		{
			IlArahDemonIsDead_03 = TRUE;

			if((IlArahDemonIsDead_01 == TRUE) && (IlArahDemonIsDead_02 == TRUE) && (IlArahDemonIsDead_03 == TRUE) && (IlArahDemonIsDead_04 == TRUE))
			{
				IlArahAllDemonsIsDead = TRUE;
			};
		};
		if((IlArahDemonIsDead_04 == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah_Chaos_Lord_04)))
		{
			IlArahDemonIsDead_04 = TRUE;

			if((IlArahDemonIsDead_01 == TRUE) && (IlArahDemonIsDead_02 == TRUE) && (IlArahDemonIsDead_03 == TRUE) && (IlArahDemonIsDead_04 == TRUE))
			{
				IlArahAllDemonsIsDead = TRUE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Druid_Doom)) && (DruidDoomIsDead == FALSE))
		{
			DruidDoomIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Druid_Despair)) && (DruidDespairIsDead == FALSE))
		{
			DruidDespairIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Druid_Agony)) && (DruidAgonyIsDead == FALSE))
		{
			DruidAgonyIsDead = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Imarah))
		{
			ImarahIsDead = TRUE ;
			ImarahStarts = FALSE ;
			tmpImarahCount = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan))
		{
			if(MIS_CHALLANGEORC != LOG_Running)
			{
				CASTLEFLAGBACK_06 = TRUE;
				if(MIS_KILLURTRALL == LOG_Running)
				{
					if(URNAZULGIVETASK == FALSE)
					{
						MIS_KILLURTRALL = LOG_OBSOLETE;
						Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_OBSOLETE);
						BOGNARREFUSETALK = TRUE;
						Kurgan.aivar[ 93 ] = TRUE ;
					}
					else
					{
						KILLHAGTARURTRALL = TRUE;
						B_LogEntry( TOPIC_KILLURTRAL , " I killed Hag-Thar! Now I need to report this to Ur-Thrall so he can release the paladins. " );
					};
				};
				if(MIS_KILLDRAGONHUNTER == LOG_Running)
				{
					MIS_KILLDRAGONHUNTER = LOG_OBSOLETE;
					Log_SetTopicStatus(TOPIC_KILLDRAGONHUNTER,LOG_OBSOLETE);
					BOGNARREFUSETALK = TRUE;
					Kurgan.aivar[ 93 ] = TRUE ;
				};
			}
			else if((URHANSPEAKBEFOREBATTLE == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
			{
				URHANBEATEN = TRUE;
				B_LogEntry( TOPIC_CHALLANGEORC , " I've defeated Hag-Tar! Let's see what he has to say. " );
			}
			else
			{
				CASTLEFLAGBACK_06 = TRUE;
				MIS_CHALLANGEORC = LOG_OBSOLETE;
				BOGNARREFUSETALK = TRUE;
				Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_OBSOLETE);
			};
			if((CASTLEFLAGBACK_01 == TRUE) && (CASTLEFLAGBACK_02 == TRUE) && (CASTLEFLAGBACK_03 == TRUE) && (CASTLEFLAGBACK_04 == TRUE) && (CASTLEFLAGBACK_05 == TRUE) && (CASTLEFLAGBACK_06 == TRUE))
			{
				CASTLEISFREE = TRUE;
				if(MIS_STURMCASTLE == LOG_Running)
				{
					B_LogEntry( TOPIC_STURMCASTLE , " It seems that luck was on our side this time! Having killed all the commanding staff of the orcs in the fortress, I do not think that the orcs will be able to defend it to the end. " );
				};
				b_paladinattackcastledone();
				b_victoryevents_oldworld();
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HaosDemon_Orcmine))
		{
			ORCMINEKILL_01 = TRUE;

			if((ORCMINEKILL_01 == TRUE) && (ORCMINEKILL_02 == TRUE))
			{
				B_LogEntry(TOPIC_LowLevel, " I destroyed the ancient evil in the deep mine! " );
			};
		};

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_warrior_dark_stoneshpere))
		{
			ORCMINEKILL_02 = TRUE;

			if((ORCMINEKILL_01 == TRUE) && (ORCMINEKILL_02 == TRUE))
			{
				B_LogEntry(TOPIC_LowLevel, " I destroyed the ancient evil in the deep mine! " );
			};

		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			CraitIsUp = FALSE;
			Mount_Up = FALSE;
			CraitCanUp = FALSE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_Clan_Boss))
		{
			OrcsClan_CHK_01 = TRUE;
	
			if((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcClanBossLetterDeliver == FALSE) && (OrcTraitor == FALSE))
			{
				OrcFailInvte = TRUE;
				B_LogEntry(TOPIC_HeroOrcJoin_T2,"Вождь клана Высокого Камня мертв...Похоже, что я провалил поручение Ур-Карраса.");
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Muritan_South))
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					B_LogEntry(TOPIC_HeroOrcJoin_T1,"Я убил Муритана! Теперь мне остается забрать его ядовитые клыки и отнести их Ур-Каррасу в город орков.");
				};

				CreateInvItems(self,ItAt_BuritanTooth,2);
			}
			else
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					MuritanS2 = TRUE ;
					B_LogEntry(TOPIC_HeroOrcJoin_T1, " I killed Muritan! However, I won't be able to take his poison fangs and take them to Ur-Krras in the orc city, as I don't know how to remove them from the monster's body. It looks like I'll have to find another one and don't forget to learn the flaying skill! " );
					Wld_InsertNpc(Muritan_North,"NW_TROLLAREA_RUINS_22");
				};
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Muritan_North))
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					B_LogEntry(TOPIC_HeroOrcJoin_T1, " I found another Muritan and killed him! Now I must remember to take his poison fangs and take them to Ur-Krras. " );
				};

				CreateInvItems(self,ItAt_BuritanTooth,2);
			}
			else
			{
				if(MIS_HeroOrcJoin_T1 == LOG_Running)
				{
					MuritanS3 = TRUE;
					B_LogEntry(TOPIC_HeroOrcJoin_T1, " I found another Muritan and killed him! But I'm not trained to pluck fangs. Looks like I failed Ur-Karras' mission...I don't think he'll be happy to hear that. " );
				};
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_6666_Xash_Gor))
		{
			HashGorIsDead = TRUE;
			Wld_SendTrigger("EVT_ORCGRYRD_HASHGOR");
			
			if ((MIS_Stupid == LOG_Running) && (KnowAboutStupid_P3 ==  TRUE ) && (StupidInsert ==  FALSE ))
			{
				B_LogEntry(TOPIC_NagDumgar, " I've killed the high shaman of Khash-Gor! It remains to take the ritual knife from him and take it to Ur-Thrall. " );
			};
		};
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8568_NagDumgar)) && (NagDumgarInsertDone ==  TRUE ))
		{
			NagDumgarIsDead = TRUE ;

			if (MIS_Empty == LOG_Running)
			{
				B_LogEntry(Topic_NagDumgar, " I killed the orc demon Nag-Dumgar! It wasn't easy, but I did it. It's time to get back to Ur-Thrall. I think he'll be happy about this news... " );
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcWarrior_Harad))
		{
			OrcWarriorHaradIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_5500_WoundedOrc))
		{
			UrKarrasIsDead = TRUE;

			if(MIS_Orcwayhero == LOG_Running)
			{
				B_LogEntry_Failed(Topic_Orcwayhero);
				MIS_Orcwayhero = LOG_Failed;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Shadow_Priest_Quardimon))
		{
			QvardemonIsDead = TRUE;

			if(MIS_Qvardemon == LOG_Running)
			{
				MIS_Qvardemon = LOG_Success;
				Log_SetTopicStatus(TOPIC_Qvardemon,LOG_Success);
				B_LogEntry(TOPIC_Qvardemon, " I destroyed the ancient priest Cardimon! " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_5570_Avabul)) && (AvabulIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_ORCMOUNTAIN_HRAM_DOOR");
			AvabulIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (QuarhodronIsDead == FALSE))
		{
			QuarhodronIsDead = TRUE;

			B_RemoveMonster(Ancient_Warrior_Q1);
			B_RemoveMonster(Ancient_Warrior_Q2);
			B_RemoveMonster(Ancient_Warrior_Q3);
			B_RemoveMonster(Ancient_Warrior_Q4);
			B_RemoveMonster(Ancient_Warrior_Q5);
			B_RemoveMonster(Ancient_Warrior_Q6);
			B_RemoveMonster(Ancient_Warrior_Q7);
			B_RemoveMonster(Ancient_Warrior_Q8);
			B_RemoveMonster(Ancient_Warrior_Q9);

			B_RemoveNpcQuarh(Ancient_Warrior_QT1);
			B_RemoveNpcQuarh(Ancient_Warrior_QT2);
			B_RemoveNpcQuarh(Ancient_Warrior_QT3);
			B_RemoveNpcQuarh(Ancient_Warrior_QT4);
			B_RemoveNpcQuarh(Ancient_Warrior_QT5);
			B_RemoveNpcQuarh(Ancient_Warrior_QT6);
			B_RemoveNpcQuarh(Ancient_Warrior_QT7);
			B_RemoveNpcQuarh(Ancient_Warrior_QT8);
			B_RemoveNpcQuarh(Ancient_Warrior_QT9);

			B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q1 );
			B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q2 );
			B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q3 );
			B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q4 );
			B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q5 );
			B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q6 );
			B_RemoveMonster( SKELETON_WARRIOR_AV_ELITE_Q7 );
			B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q8);

			B_RemoveMonster(SKELETON_WARRIOR_AV_Q1);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q2);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q3);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q4);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q5);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q6);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q7);
			B_RemoveMonster(SKELETON_WARRIOR_AV_Q8);

			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q1);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q2);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q3);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q4);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q5);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q6);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q7);
			B_RemoveMonster(Skeleton_Mage_AV_Elite_Q8);

			B_RemoveMonster(Skeleton_Shadow_Priest_Q1);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q2);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q3);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q4);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q5);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q6);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q7);
			B_RemoveMonster(Skeleton_Shadow_Priest_Q8);

			if(MIS_JarCurse == LOG_Running)
			{
				MIS_JarCurse = LOG_Success;
				Log_SetTopicStatus(TOPIC_JarCurse,LOG_Success);
				B_LogEntry(Topic_JarCurse, " I have destroyed the ancient general, Quarhodron! " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrkElite_Addon2_Gonez))
		{
			if((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcTraitor == TRUE))
			{
				DayGoneZStop = Wld_GetDay();

				if(DayGonezStop > DayGonezStart)
				{
					B_LogEntry(TOPIC_HeroOrcJoin_T2, " I found the orc messenger and killed him! However, it seems to me that I took too long to find him and he already managed to send Ur-Karras a message about my treason. " );
				}
				else
				{
					UrKarrasGonezIsDead = TRUE ;
					B_LogEntry(TOPIC_HeroOrcJoin_T2, " I found the orc messenger and killed him! I don't think there will be anyone to tell Ur-Karras about my treachery now. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss))
		{
			StoneBossIsDead = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_1))
		{
			FLAG_ORCS_CHK_01 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_2))
		{
			FLAG_ORCS_CHK_02 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_3))
		{
			FLAG_ORCS_CHK_03 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_4))
		{
			FLAG_ORCS_CHK_04 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_5))
		{
			FLAG_ORCS_CHK_05 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_6))
		{
			FLAG_ORCS_CHK_06 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_7))
		{
			FLAG_ORCS_CHK_07 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_8))
		{
			FLAG_ORCS_CHK_08 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_9))
		{
			FLAG_ORCS_CHK_09 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_10))
		{
			FLAG_ORCS_CHK_10 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_11))
		{
			FLAG_ORCS_CHK_11 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_12))
		{
			FLAG_ORCS_CHK_12 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_13))
		{
			FLAG_ORCS_CHK_13 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_14))
		{
			FLAG_ORCS_CHK_14 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_15))
		{
			FLAG_ORCS_CHK_15 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_16))
		{
			FLAG_ORCS_CHK_16 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_17))
		{
			FLAG_ORCS_CHK_17 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_18))
		{
			FLAG_ORCS_CHK_18 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_19))
		{
			FLAG_ORCS_CHK_19 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_20))
		{
			FLAG_ORCS_CHK_20 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_21))
		{
			FLAG_ORCS_CHK_21 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_22))
		{
			FLAG_ORCS_CHK_22 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_23))
		{
			FLAG_ORCS_CHK_23 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_24))
		{
			FLAG_ORCS_CHK_24 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_25))
		{
			FLAG_ORCS_CHK_25 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_26))
		{
			FLAG_ORCS_CHK_26 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_27))
		{
			FLAG_ORCS_CHK_27 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon3_chkflg_28_withkey))
		{
			FLAG_ORCS_CHK_28 = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_addon4_chkflg_drakar_capitan))
		{
			FLAG_ORCS_DRAGONS = TRUE ;

			if(MIS_SylvioDrakar == LOG_Running)
			{
				FLAG_ORCS_DRAKAR_02 = TRUE ;
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID( ORKELITE_CHKFLG_SYLVIODRAKAR_CAPITAN ))
		{
			FLAG_ORCS_DRAKAR_02 = TRUE ;
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8550_urnazul)) && (ORCLEADERISDEAD == FALSE))
		{
			ORCLEADERISDEAD = TRUE;

			if(MIS_URNAZULRAGE == LOG_Running)
			{
				MIS_URNAZULRAGE = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_URNAZULRAGE,LOG_OBSOLETE);
			};
			if(MIS_KILLURTRALL == LOG_Running)
			{
				if(KILLHAGTARURTRALL == TRUE)
				{
					MIS_KILLURTRALL = LOG_OBSOLETE;
					Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_OBSOLETE);
					BOGNARREFUSETALK = TRUE;
					Kurgan.aivar[ 93 ] = TRUE ;
				}
				else
				{
					B_LogEntry( TOPIC_KILLURTRAL , " I killed Ur-Thrall. Now I need to report this to Hag-Thar! " );
				};
			};
			if(MIS_BELIARWILL == LOG_Running)
			{
				B_LogEntry( TOPIC_BELIARWILL , " I've killed the orc warchief, Ur-Thrall! Beliar's will is done! " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_01))
		{
			FLAG_ORCSLAVE_01 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry( TOPIC_ORCORDER , " All orc slaves are dead! Now it's time to return to Albert. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_02))
		{
			FLAG_ORCSLAVE_02 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry( TOPIC_ORCORDER , " All orc slaves are dead! Now it's time to return to Albert. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_03))
		{
			FLAG_ORCSLAVE_03 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry( TOPIC_ORCORDER , " All orc slaves are dead! Now it's time to return to Albert. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_04))
		{
			FLAG_ORCSLAVE_04 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry( TOPIC_ORCORDER , " All orc slaves are dead! Now it's time to return to Albert. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_05))
		{
			FLAG_ORCSLAVE_05 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry( TOPIC_ORCORDER , " All orc slaves are dead! Now it's time to return to Albert. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_06))
		{
			FLAG_ORCSLAVE_06 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry( TOPIC_ORCORDER , " All orc slaves are dead! Now it's time to return to Albert. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_07))
		{
			FLAG_ORCSLAVE_07 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry( TOPIC_ORCORDER , " All orc slaves are dead! Now it's time to return to Albert. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcslave_08))
		{
			FLAG_ORCSLAVE_08 = TRUE;
			if((MIS_ORCORDER == LOG_Running) && (FLAG_ORCSLAVE_01 == TRUE) && (FLAG_ORCSLAVE_02 == TRUE) && (FLAG_ORCSLAVE_03 == TRUE) && (FLAG_ORCSLAVE_04 == TRUE) && (FLAG_ORCSLAVE_05 == TRUE) && (FLAG_ORCSLAVE_06 == TRUE) && (FLAG_ORCSLAVE_07 == TRUE) && (FLAG_ORCSLAVE_08 == TRUE))
			{
				GOTOKILLORCSLAVESDONE = TRUE;
				B_LogEntry( TOPIC_ORCORDER , " All orc slaves are dead! Now it's time to return to Albert. " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8565_urgrom)) && (UrGromIsDead == FALSE))
		{
			UrGromIsDead = TRUE;
		};
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NOV_601_Garage)) && (GarageIsDead ==  FALSE ))
		{
			IgarazIsDead = TRUE;

			if(MIS_Igaraz_OneMoreChance == LOG_Running)
			{
				MIS_Igaraz_OneMoreChance = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_IGARANZ_NEW);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7518_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp, " I killed all the paladins on the coast as Ur-Karras told me to. " );
			};
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7519_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp, " I killed all the paladins on the coast as Ur-Karras told me to. " );
			};
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7520_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp, " I killed all the paladins on the coast as Ur-Karras told me to. " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GuardChamber_Demon_Portal)) && (HaosPortalIsOpen == FALSE))
		{
			Wld_SendTrigger("EVT_HAOSPORTAL");
			HaosPortalIsOpen = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7521_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp, " I killed all the paladins on the coast as Ur-Karras told me to. " );
			};
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(STRF_8147_Dagrag)) && (ArenaFightNow ==  TRUE ) && (ArenaBattle_01 ==  TRUE ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE ))) ;
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(STRF_8148_Gunnok)) && (ArenaFightNow ==  TRUE ) && (ArenaBattle_02 ==  TRUE ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE ))) ;
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(STRF_8149_Turuk)) && (ArenaFightNow ==  TRUE ) && (ArenaBattle_03 ==  TRUE ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE )))
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GorkOrcBoss_Rest))
		{
			GorkOrcBossIsDead = TRUE;

			if(MIS_MissOldFriend == LOG_Running)
			{
				MIS_ClansWar = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ClansWar);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_852_Darius))
		{
			DariusIsDead = TRUE;

			if(MIS_MissOldFriend == LOG_Running)
			{
				MIS_ClansWar = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ClansWar);
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8571_HashTor))
		{
			if(MIS_HashTorRule == LOG_Running)
			{
				MIS_HashTorRule = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ORCWEAPON);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4107_Parlaf)) && (ParlafIsDead == FALSE))
		{
			ParlafIsDead = TRUE;
			
			if((ParlafFind == TRUE) && (ParlafOnPlace == FALSE))
			{
				ParlafNoExcort = TRUE;
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak))
		{
			self.aivar[AIV_StoryBandit] = TRUE ;
			UrTakIsDead = TRUE;

			if((MIS_HashTorRule == LOG_Running) && (OFStyle == FALSE))
			{
				MIS_HashTorRule = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_ORCWEAPON);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MorkOrcBoss_Rest))
		{
			MorkOrcBossIsDead = TRUE;

			if(MIS_ClansWar == LOG_Running)
			{
				B_LogEntry(TOPIC_ClansWar, " Chief of the Icewind Clan is dead! Groom Lok needs to be informed. " );
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)) && (ArenaFightNow == TRUE) && (ArenaBattle_04 == TRUE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(STRF_8150_Draw)) && (ArenaFightNow ==  TRUE ) && (ArenaBattle_05 ==  TRUE ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE ))) ;
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(STRF_8151_Umrak)) && (ArenaFightNow ==  TRUE ) && (ArenaBattle_06 ==  TRUE ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE ))) ;
		{
			KillArenaWarrior = TRUE;

			if(MIS_OrcArena == LOG_Running)
			{
				UrKanPissOff = TRUE;
				MIS_OrcArena = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_OrcArena);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7522_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp, " I killed all the paladins on the coast as Ur-Karras told me to. " );
			};
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7523_ALBERT)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp, " I killed all the paladins on the coast as Ur-Karras told me to. " );
			};
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_7524_RITTER)) && (PaladinCampCostDestroyed == FALSE))
		{
			PaladinCoastCount = PaladinCoastCount + 1;

			if(PaladinCoastCount >= 7)
			{
				PaladinCampCostDestroyed = TRUE;
			};

			if((MIS_PaladinCamp == LOG_Running) && (PaladinCampCostDestroyed == TRUE))
			{	
				B_LogEntry(TOPIC_PaladinCamp, " I killed all the paladins on the coast as Ur-Karras told me to. " );
			};
		};

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_WAY))
		{
			Wld_SendTrigger("TRG_CORGALOM_MAGICWALL");
			B_LogEntry(TOPIC_PrioratStart, "The mighty demon has fallen and the magical barrier that blocked my path has disappeared - now the path is clear! " );
		};

		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( NOV_600_Pedro_DI ) ) ;
		{
			DI_CHECK_PEDRO = TRUE ;

			if((MIS_Gorax_KillPedro == LOG_Running) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
			{
				B_GivePlayerXP(500);
				MIS_Gorax_KillPedro = LOG_SUCCESS;
				MIS_TraitorPedro = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_SUCCESS);
				B_LogEntry(TOPIC_TraitorPedro, " I killed Pedro! Serpentes will be pleased. " );
			}
			else if(!Npc_IsPlayer(other) && (MIS_Gorax_KillPedro == LOG_Running))
			{
				B_GivePlayerXP(250);
				MIS_Gorax_KillPedro = LOG_SUCCESS;
				MIS_TraitorPedro = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_SUCCESS);
				B_LogEntry(TOPIC_TraitorPedro, " Pedro is dead and it doesn't matter anymore how it happened! " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4250_Jorgen))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JORGENBACKNW == TRUE) && (JORGENISDEAD == FALSE))
			{
				JORGENISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Draconian_Elite_Boss)) && (ItarIsDead == FALSE))
		{
			ItarIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadWolf)) && (YelaIsDead == FALSE))
		{
			YelaIsDead = TRUE;
		};
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AmasRaf)) && (AmasRafIsDead ==  FALSE ))
		{
			AmasRafIsDead = TRUE ;
			self.aivar[ 95 ] = TRUE ;

			if((AmasRafIsDead == TRUE) && (AmasSahIsDead == TRUE))
			{
				Wld_SendTrigger("EVT_BIGPYRAMIDDOOR_01");
				Wld_SendTrigger("CAM_BIGPYRAMIDDOOR");
				bonuslpgivehero = 3 ;
				b_givebonusforelitemonster(bonuslpgivehero);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AmasSah)) && (AmasSahIsDead == FALSE))
		{
			AmasSahIsDead = TRUE;
			self.aivar[ 95 ] = TRUE ;

			if((AmasRafIsDead == TRUE) && (AmasSahIsDead == TRUE))
			{
				Wld_SendTrigger("EVT_BIGPYRAMIDDOOR_01");
				Wld_SendTrigger("CAM_BIGPYRAMIDDOOR");
				bonuslpgivehero = 3 ;
				b_givebonusforelitemonster(bonuslpgivehero);
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Uniq)) && (IzulgIsDead == FALSE))
		{
			Wld_SendTrigger("EVT_GATEIN_INNER_02");
			Wld_SendTrigger("EVT_GATEIN_INNER_01");
			Wld_SendTrigger("EVT_GATEIN_INNER");
			IzulgIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_444_Jack)) && (JackMainIsDead == FALSE))
		{
			if((MIS_HauntedLighthouse == LOG_Running) && (LeaveMeetGhost == FALSE))
			{
				MIS_HauntedLighthouse = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_HauntedLighthouse);
			};
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JACKBACKNW == TRUE) && (JACKISDEAD == FALSE))
			{
				JACKISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};

			JackMainIsDead = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Stefan)) && (StefanIsDead == FALSE))
		{
			StefanIsDead = TRUE;

			if((MIS_HauntedLighthouse == LOG_Running) && (StefanCanFight == TRUE) && (FinishStoryLH == FALSE))
			{
				FinishStoryLH = TRUE;
				MIS_HauntedLighthouse = LOG_Success;
				Log_SetTopicStatus(TOPIC_HauntedLighthouse,LOG_Success);

				if(JackMainIsDead == TRUE)
				{
					B_LogEntry(TOPIC_HauntedLighthouse,"Я уничтожил призраков на маяке. Теперь людям ничто тут не угрожает... Жаль, что при этом погиб сам Джек.");
				}
				else
				{
					B_LogEntry(TOPIC_HauntedLighthouse,"Я уничтожил призраков на маяке. Теперь людям ничто тут не угрожает...");
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_713_Biff_NW))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BIFFBACKNW == TRUE) && (BIFFISDEAD == FALSE))
			{
				BIFFISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pal_207_Girion))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (GIRIONBACKNW == TRUE) && (GIRIONISDEAD == FALSE))
			{
				GIRIONISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (BENNETBACKNW == TRUE) && (BENNETISDEAD == FALSE))
			{
				BENNETISDEAD = TRUE;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf))
		{
			if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (WOLFBACKNW == TRUE) && (WOLFISDEAD == FALSE))
			{
				WOLFISDEAD = TRUE ;
				GLOBALCOUNTBACKNW = GLOBALCOUNTBACKNW - 1;
			};
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( Pal_207_Girion_DI ) )
		{
			DI_CHECK_GIRION = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Fighter_DI))
		{
			DI_CHECK_FIGHTER = TRUE;
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( PC_Mage_DI ) )
		{
			DI_CHECK_MAGE = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Psionic_DI))
		{
			DI_CHECK_PSIONIC = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Thief_DI))
		{
			DI_CHECK_THIEF = TRUE;
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( SLD_800_Lee_DI ) ) ;
		{
			DI_CHECK_LEE = TRUE;
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( SLD_801_Enjoy_DI ))
		{
			DI_CHECK_TORLOF = TRUE;
		};
		if (Help_GetInstanceID(self) == Help_GetInstanceID(SLD_809_Benefit_DI))
		{
			DI_CHECK_BENNET = TRUE;
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( SLD_811_Wolf_DI ) )
		{
			DI_CHECK_WOLF = TRUE ;
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( VLK_4250_Jorgen_DI ) )
		{
			DI_CHECK_JORGEN = TRUE ;
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( VLK_439_Batras_DI ))
		{
			DI_CHECK_VATRAS = TRUE ;
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( VLK_444_Jack_DI ) )
		{
			DI_CHECK_JACK = TRUE;
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( VLK_449_Lares_DI ) )
		{
			DI_CHECK_LARES = TRUE ;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(djg_705_angar_li))
		{
			LI_CHECK_ANGAR = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(djg_713_biff_li))
		{
			LI_CHECK_BIFF = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(nov_600_pedro_li))
		{
			LI_CHECK_PEDRO = TRUE ;
			if(MIS_HELPPEDRO == LOG_Running)
			{
				MIS_HELPPEDRO = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_HELPPEDRO);
			};
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_207_girion_li))
		{
			LI_CHECK_GIRION = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pc_fighter_li))
		{
			LI_CHECK_FIGHTER = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pc_mage_li))
		{
			LI_CHECK_MAGE = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Теперь стоит сообщить об этом нашему капитану.");
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pc_psionic_li))
		{
			LI_CHECK_PSIONIC = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pc_thief_li))
		{
			LI_CHECK_THIEF = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
			if(COUNTPEOPLEONBEACH > 0)
			{
				COUNTPEOPLEONBEACH = COUNTPEOPLEONBEACH - 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_800_lee_li))
		{
			LI_CHECK_LEE = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_801_torlof_li))
		{
			LI_CHECK_TORLOF = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_809_bennet_li))
		{
			LI_CHECK_BENNET = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_811_wolf_li))
		{
			LI_CHECK_WOLF = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_4250_jorgen_li))
		{
			LI_CHECK_JORGEN = TRUE ;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_439_vatras_li))
		{
			LI_CHECK_VATRAS = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_444_jack_li))
		{
			LI_CHECK_JACK = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_449_lares_li))
		{
			LI_CHECK_LARES = TRUE;
			if(COUNTPEOPLEDECIDE > 0)
			{
				COUNTPEOPLEDECIDE = COUNTPEOPLEDECIDE - 1;
				if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
				{
					READYCHANGECOURSE = TRUE;
					B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
				};
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_404_Lutero))
		{
			if(MIS_TRADEGUILD == LOG_Running)
			{
				MIS_TRADEGUILD = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_TRADEGUILD);
			};
			if(MIS_BENGARORDER == LOG_Running)
			{
				MIS_BENGARORDER = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_BENGARORDER,LOG_OBSOLETE);
			};
			if(MIS_JORAHELP == LOG_Running)
			{
				MIS_JORAHELP = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_JORAHELP,LOG_OBSOLETE);
			};
			if(MIS_CHURCHDEAL == LOG_Running)
			{
				MIS_CHURCHDEAL = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			};
			if(MIS_RARETHINGS == LOG_Running)
			{
				MIS_RARETHINGS = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_RARETHINGS,LOG_OBSOLETE);
			};
			if(MIS_BLACKBRENDI == LOG_Running)
			{
				MIS_BLACKBRENDI = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_BLACKBRENDI,LOG_OBSOLETE);
			};
			if(MIS_TRADEHELPER == LOG_Running)
			{
				MIS_TRADEHELPER = LOG_FAILED ;
				Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_OBSOLETE);
			};
			if(MIS_PALADINFOOD == LOG_Running)
			{
				MIS_PALADINFOOD = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_PALADINFOOD,LOG_OBSOLETE);
			};
			if(MIS_SARAHTOGUILD == LOG_Running)
			{
				MIS_SARAHTOGUILD = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_OBSOLETE);
			};
			if(MIS_ONARBUSINESS == LOG_Running)
			{
				MIS_ONARBUSINESS = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_ONARBUSINESS,LOG_OBSOLETE);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_116_mud))
		{
			MUDISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_409_Zuris))
		{
			ZURISISDEAD = TRUE;

			if(MIS_JORAHELP == LOG_Running)
			{
				B_LogEntry( TOPIC_JORAHELP , " I killed Zuris! I wonder what this will give me. First I need to search his corpse - maybe I'll find something useful. " );
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_705_Angar))
		{
			ANGARISDEAD = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6130_benchel))
		{
			BENCHELISDEAD = TRUE;
			if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELSEE == TRUE) && (BENCHELFOLLOWME == FALSE))
			{
				B_LogEntry( TOPIC_BLACKBRENDI , " I didn't have time to help Benchel - the bandits killed him. I don't think Luthero will be very happy about this news. " );
			}
			else if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELSEE == TRUE) && (BENCHELFOLLOWME == TRUE))
			{
				B_LogEntry( TOPIC_BLACKBRENDI , " Benchel is dead! I don't think Luthero will be too happy about this news. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9000_bandit))
		{
			BENCHELBANDIT0ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9001_bandit))
		{
			BENCHELBANDIT1ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9002_bandit))
		{
			BENCHELBANDIT2ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9003_bandit))
		{
			BENCHELBANDIT3ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_9004_bandit))
		{
			BENCHELBANDIT4ISDEAD = TRUE;
		};
		if((BENCHELBANDIT0ISDEAD == TRUE) && (BENCHELBANDIT1ISDEAD == TRUE) && (BENCHELBANDIT2ISDEAD == TRUE) && (BENCHELBANDIT3ISDEAD == TRUE) && (BENCHELBANDIT4ISDEAD == TRUE) && (BENCHELISDEAD == FALSE))
		{
			BENCHELTELLTHANKS = TRUE;
			B_StartOtherRoutine(vlk_6130_benchel,"RestAfterFight");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1075_Addon_Fortuno))
		{
			FORTUNOISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(necromacerzombie))
		{
			CORRISTOSENDKILLDEMONDONE = TRUE ;
			B_LogEntry( TOPIC_RESCUEGOMEZ , " I encountered a strange kind of undead in the crypt. It looks like this piece of rot was a necromancer in life... Naturally, I had no choice but to kill this creature. Now it's time to return to Corristo! " );
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6123_nigelband_03))
		{
			NIGELBANDITISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1398_addon_inextremo_announcer))
		{
			Npc_RemoveInvItems(self,ItMi_IEDudelYellow,Npc_HasItems(self,ItMi_IEDudelYellow));
			Npc_RemoveInvItems(self,ItLsTorchFirespit,Npc_HasItems(self,ItLsTorchFirespit));
			CHIEFKILLERISDEAD = TRUE;

			if ( ! Npc_IsPlayer(other) && (other.aivar[ AIV_PARTYMEMBERS ] ==  FALSE ))
			{
				CHIEFKILLERISDEADX = TRUE;
			};
			if (( MIS_GUILDKILL  == LOG_Running) && ( GUILDKILLKNOWNLOC  ==  TRUE ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE ))) ;
			{
				B_LogEntry( TOPIC_GUILDKILL , " I killed Asmal. " );
			};
			if((BANDHANS_MAIN == TRUE) && (MIS_KILLTARGETFINAL == LOG_Running) && (GOLDRECOVEREDHANS == FALSE))
			{
				GOLDRECOVEREDHANS = TRUE;
				CreateInvItems(self,ItMi_Gold,5000);
			};
			if(TROUBLEWITHASMAL == TRUE)
			{
				CreateInvItems(self,ItMi_Gold,5000);

				if(MIS_KILLTARGETFINAL == LOG_Running)
				{
					MIS_KILLTARGETFINAL = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
					B_LogEntry( TOPIC_KILLTARGETFINAL , " Hans's gang is finished - all his people and he himself are dead. But then problems arose - Asmal considered that I did not deserve a large share for this business and agreed to give me all only 500 coins. This did not suit me either had to do away with Asmal. " );
				};
			};
			if((MIS_KILLWAY == LOG_Running) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
			{
				MIS_KILLWAY = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_KILLWAY,LOG_SUCCESS);

				if(CANBEKILLMASTER == TRUE)
				{
					B_LogEntry( TOPIC_KILLWAY , " I killed Asmal. Now I'm the head of the assassin's guild! " );
					BEKILLMASTER = TRUE ;
				}
				else
				{
					B_LogEntry( TOPIC_KILLWAY , " I killed Asmal! Maybe I was too hasty, but there's nothing to fix now. " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6112_hans))
		{
			BANDHANS_MAIN = TRUE;

			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				GLOVE = GLOVE  +  1 ;
			};
			if((CHIEFKILLERISDEADX == TRUE) && (MIS_KILLTARGETFINAL == LOG_Running) && (GOLDRECOVEREDHANS == FALSE))
			{
				GOLDRECOVEREDHANS = TRUE;
				CreateInvItems(self,ItMi_Gold,5000);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_110_Urshak))
		{
			URSHAKISDEAD = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6109_luis))
		{
			KILLTARGET1 = TRUE;
			if(MIS_KILLTARGET1 == LOG_Running)
			{
				B_LogEntry( TOPIC_KILLTARGET1 , " I killed that talker Louis. " );
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_484_Lehmar))
		{
			KILLTARGET2 = TRUE;
			LehmarIsDead = TRUE;

			if(MIS_KILLTARGET2 == LOG_Running)
			{
				B_LogEntry( TOPIC_KILLTARGET2 , " I sent Lemar to the next world, while not forgetting to send him greetings from Asmal. " );
			};
			if ((MY_LemarTheft == LOG_Running) && (Npc_HasItems(hero,ItMy_TalkingRelic_MY) ==  FALSE ))
			{
				MIS_LemarTheft = LOG_FAILED;
				B_LogEntry_Failed(Topic_LemarTheft);
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_468_Canthar))
		{
			KILLTARGET3 = TRUE;
			if(MIS_KILLTARGET3 == LOG_Running)
			{
				B_LogEntry( TOPIC_KILLTARGET3 , " Kantar is dead! Anyway, I don't really regret having to do this, because I didn't really like him either... " );
			};
		};
		if ( Help_GetInstanceID ( self ) == Help_GetInstanceID ( vlk_6110_nigel ) )
		{
			KILLTARGET4 = TRUE;
			if(MIS_KILLTARGET4 == LOG_Running)
			{
				B_LogEntry( TOPIC_KILLTARGET4 , " I killed that poor Nigel. " );
				if (( GRABTARGET4  ==  TRUE ) && ( NIGELBANDITISDEAD  ==  FALSE ))
				{
					B_LogEntry( TOPIC_KILLTARGET4 , " I wonder how it turns out - and Nigel is dead and I know who has his debt money. Maybe I should tell Asmal that Nigel refused to repay the debt, and keep the money for himself ... True, for this I will need to deal with the bandits that robbed him. " );
				}
				else if((GRABTARGET4 == TRUE) && (NIGELBANDITISDEAD == TRUE))
				{
					B_LogEntry( TOPIC_KILLTARGET4 , " I wonder how it turns out - and Nigel is dead and I took his debt money from the bandits. Maybe I should tell Asmal that Nigel refused to repay the debt, and keep the money for himself... " );
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_6111_rudar))
		{
			KILLTARGET5 = TRUE;
			if(MIS_KILLTARGET5 == LOG_Running)
			{
				B_LogEntry( TOPIC_KILLTARGET5 , " Now that Rudar is dead, he is no threat to Asmal. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6113_hansband_01))
		{
			BANDHANS_CH01 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				GLOVE = GLOVE  +  1 ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6114_hansband_02))
		{
			BANDHANS_CH02 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				GLOVE = GLOVE  +  1 ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6115_hansband_03))
		{
			BANDHANS_CH03 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				GLOVE = GLOVE  +  1 ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6116_hansband_04))
		{
			BANDHANS_CH04 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				GLOVE = GLOVE  +  1 ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6117_hansband_05))
		{
			BANDHANS_CH05 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				GLOVE = GLOVE  +  1 ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6118_hansband_06))
		{
			BANDHANS_CH06 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				GLOVE = GLOVE  +  1 ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bdt_6119_hansband_07))
		{
			BANDHANS_CH07 = TRUE;
			if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				GLOVE = GLOVE  +  1 ;
			};
		};
		if((BANDHANS_MAIN == TRUE) && (BANDHANS_CH01 == TRUE) && (BANDHANS_CH02 == TRUE) && (BANDHANS_CH03 == TRUE) && (BANDHANS_CH04 == TRUE) && (BANDHANS_CH05 == TRUE) && (BANDHANS_CH06 == TRUE) && (BANDHANS_CH07 == TRUE))
		{
			KILLTARGETFINAL = TRUE;
			
			if(GuideGuildsToCamp == FALSE)
			{
				B_StartOtherRoutine(drpymonte,"GoToBandit1");
				B_StartOtherRoutine(theflail,"GoToBandit2");
				B_StartOtherRoutine(lutter,"GoToBandit3");
				B_StartOtherRoutine(flex,"GoToBandit4");
				B_StartOtherRoutine(charlotte,"GoToBandit5");
				B_StartOtherRoutine(announcer,"GoToBandit6");
				GuideGuildsToCamp = TRUE;
			};
			if((CHIEFKILLERISDEADX == TRUE) && (MIS_KILLTARGETFINAL == LOG_Running))
			{
				B_GivePlayerXP(1000);
				MIS_KILLTARGETFINAL = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
				MIS_KILLWAY = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_KILLWAY);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1390_Addon_InExtremo_DrPymonte))
		{
			DRPYMONTEISDEAD = TRUE;

			if ( ! Npc_IsPlayer(other) && (other.aivar[ AIV_PARTYMEMBERS ] ==  FALSE ))
			{
				DRPYMONTEISDEADX = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1391_Addon_InExtremo_TheFlail))
		{
			THEFLAILISDEAD = TRUE;
			if ( ! Npc_IsPlayer(other) && (other.aivar[ AIV_PARTYMEMBERS ] ==  FALSE ))
			{
				THEFLAILISDEADX = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1395_Addon_InExtremo_Lutter))
		{
			LUTTERISDEAD = TRUE;
			if ( ! Npc_IsPlayer(other) && (other.aivar[ AIV_PARTYMEMBERS ] ==  FALSE ))
			{
				LUTTERISDEADX = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1396_Addon_InExtremo_Flex))
		{
			FLEXISDEAD = TRUE;
			if ( ! Npc_IsPlayer(other) && (other.aivar[ AIV_PARTYMEMBERS ] ==  FALSE ))
			{
				FLEXISDEADX = TRUE ;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1397_addon_inextremo_charlotte))
		{
			CHARLOTTEISDEAD = TRUE;
			if ( ! Npc_IsPlayer(other) && (other.aivar[ AIV_PARTYMEMBERS ] ==  FALSE ))
			{
				CHARLOTTEISDEADX = TRUE;
			};
		};
		if((CHARLOTTEISDEAD == TRUE) && (FLEXISDEAD == TRUE) && (LUTTERISDEAD == TRUE) && (THEFLAILISDEAD == TRUE) && (DRPYMONTEISDEAD == TRUE) && (CHIEFKILLERISDEADX == TRUE) && (GUILDKILLISDEAD == FALSE))
		{
			GUILDKILLISDEAD = TRUE;
			if((MIS_GUILDKILL == LOG_Running) && (GUILDKILLKNOWNLOC == TRUE))
			{
				B_LogEntry( TOPIC_GUILDKILL , " I've dealt with the assassin guild. " );
			};
		};
		if ((Help_GetInstanceID(self) == Help_GetInstanceID(Mil_316_Wambo)) && ( WAMBOISDEAD  ==  FALSE ))
		{
			if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pir_1398_addon_inextremo_announcer))
			{
				b_changeguild(pir_1398_addon_inextremo_announcer,GIL_VLK);
				AI_StandupQuick(other);
				Npc_ClearAIQueue(other);
				B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Start");

				if(Npc_GetDistToWP(hero,"NW_CITY_KILLWAMBO_01") <= 1500)
				{
					KILLCANJOIN = TRUE;
				}
				else
				{
					pir_1398_addon_inextremo_announcer.name[0] = "Гиллиан";
					AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
					Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,Npc_HasItems(pir_1398_addon_inextremo_announcer,itar_asmal));
					STRANGERKNOWS = FALSE;
				};
			}
			else
			{
				if(JOINKILLERS == FALSE)
				{
					pir_1398_addon_inextremo_announcer.name[0] = "Гиллиан";
					AI_UnequipArmor(pir_1398_addon_inextremo_announcer);
					Npc_RemoveInvItems(pir_1398_addon_inextremo_announcer,itar_asmal,Npc_HasItems(pir_1398_addon_inextremo_announcer,itar_asmal));
					STRANGERKNOWS = FALSE;
				};
			};
		
			WAMBOISDEAD = TRUE ;

			if(MIS_KILLWAMBO == LOG_Running)
			{
				B_LogEntry( TOPIC_KILLWAMBO , " Wambo is dead! Time to go back to Asmal. " );
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6120_lemarguard))
		{
			ShramIsDead = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NOV_600_Pedro))
		{
			if(MIS_HELPPEDRO == LOG_Running)
			{
				MIS_HELPPEDRO = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_HELPPEDRO);
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_WAY))
		{
			DemonPWISDEAD = TRUE;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(senyak_demon))
		{
			SenyakIsDead = TRUE ;

			if((DESTOYSENYAKSOUL == FALSE) && (USEMORAULARTU == TRUE))
			{
				Npc_RemoveInvItems(self,itmi_stonesoul,1);
				CreateInvItems(self,itmi_stonesoul_senyak, 1 );
				B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I captured the soul of the archdemon S'anyak, and then destroyed his corporeal form! " );
				Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_SUCCESS);
				MIS_GOLDDRAGONPORTAL = LOG_SUCCESS;
			}
			else
			{
				Npc_RemoveInvItems(self,itmi_stonesoul,1);
				B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " Archidemon S'enyak is dead! " );
				Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_SUCCESS);
				MIS_GOLDDRAGONPORTAL = LOG_SUCCESS;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_480_Fellan)) && (MIS_BELIARHELPME == LOG_Running))
		{
			INSANEKILLDONE = TRUE;
		};
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demon_sendsenyak)) && ( SENYAK_SENDPACK1  ==  TRUE ) && ( TALKSENYAK  ==  FALSE ))
		{
			self.start_aistate = ZS_MM_Rtn_DragonRest;
			self.aivar[AIV_EnemyOverride] = TRUE ;
			SENYAK_SENDPACK1 = FALSE ;
		};
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeletonmage_sendsenyak_1)) && ( SENYAK_SENDPACK2  ==  TRUE ) && ( TALKSENYAK  ==  FALSE ))
		{
			self.start_aistate = ZS_MM_Rtn_DragonRest;
			self.aivar[AIV_EnemyOverride] = TRUE ;
			SENYAK_SENDPACK2 = FALSE ;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(darkskeleton1_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE ;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(darkskeleton2_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE ;
		};
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeletonmage_sendsenyak_2)) && ( SENYAK_SENDPACK3  ==  TRUE ) && ( TALKSENYAK  ==  FALSE ))
		{
			self.start_aistate = ZS_MM_Rtn_DragonRest;
			self.aivar[AIV_EnemyOverride] = TRUE ;
			SENYAK_SENDPACK3 = FALSE ;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton1_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE ;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton2_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE ;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton3_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE ;
		};
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeletonmage_sendsenyak_3)) && ( SENYAK_SENDPACK4  ==  TRUE ) && ( TALKSENYAK  ==  FALSE ))
		{
			self.start_aistate = ZS_MM_Rtn_DragonRest;
			self.aivar[AIV_EnemyOverride] = TRUE ;
			SENYAK_SENDPACK4 = FALSE ;
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie1_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie2_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie3_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie4_sendsenyak))
		{
			self.aivar[AIV_EnemyOverride] = TRUE ;
		};
		if ((self.aivar[ AIV_MM_REAL_ID ] ==  ID_SWAMPDRONE ) || (self.aivar[ AIV_MM_REAL_ID ] ==  ID_SUMMONED_SWAMPDRONE ))
		{
			her = Hlp_GetNpc(PC_Hero);
			if(Npc_GetDistToNpc(self,other) < 300)
			{
				if((other.flags & NPC_FLAG_IMMORTAL) == 0)
				{
					if(other.guild == GIL_DRAGON)
					{
						other.attribute[ATR_HITPOINTS] -= 25;
					}
					else
					{
						other.attribute[ATR_HITPOINTS] -= 50;
					};
				};
			};
			if(Hlp_GetInstanceID(other) != Hlp_GetInstanceID(her))
			{
				if(Npc_GetDistToNpc(self,her) < 300)
				{
					her.attribute[ATR_HITPOINTS] -= 50;
				};
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_Sylvio))
		{
			SYLVIOOW_ISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DiegoOW))
		{
			Diego_IsDead = TRUE ;
		};

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_12987_Ituseld)) && (ItuseldIsDead == FALSE))
		{
			ItuseldIsDead = TRUE;
			B_LogEntry(TOPIC_DarkWeb, " It was not an easy fight! But in the end I managed to defeat this mage. I will take his head as evidence for Lord Hagen. Only now I realized that Lothar had no chance of surviving against such a powerful opponent.. . " );
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1298_darkmage))
		{
			DARKMAGE_ISDEAD = TRUE ;
			if(MIS_ORCTEMPLE != LOG_Running)
			{
				Log_CreateTopic(TOPIC_ORCTEMPLE,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ORCTEMPLE,LOG_Running);
			};
			if (Chapter >=  5 )
			{
				B_LogEntry( TOPIC_ORCTEMPLE , " The dark necromancer mage I met in the Temple of the Sleeper is no longer dangerous, for the simple reason that he is dead. With him, I found my old friend - the powerful ancient blade URIZEL, with which I once slew the Sleeper . I think now you can visit the dragons. " );
				Log_SetTopicStatus(TOPIC_ORCTEMPLE,LOG_SUCCESS);
				MIS_ORCTEMPLE = LOG_SUCCESS;
			}
			else
			{
				B_LogEntry( TOPIC_ORCTEMPLE , " The dark necromancer mage I met in the Temple of the Sleeper is no longer dangerous, for the simple reason that he is dead. With him, I found my old friend - the powerful ancient blade URIZEL, with which I once slew the Sleeper . " );
				Log_SetTopicStatus(TOPIC_ORCTEMPLE,LOG_SUCCESS);
				MIS_ORCTEMPLE = LOG_SUCCESS;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(alef_soul))
		{
			ALEFISDEAD = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(riordian_zombie))
		{
			RIORDANEVILDEAD = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_1)) && (GomezWSIsDead_01 == FALSE))
		{
			if(GOMEZSOULTALK_1 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_01 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_2)) && (GomezWSIsDead_02 == FALSE))
		{
			if(GOMEZSOULTALK_2 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_02 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_3)) && (GomezWSIsDead_03 == FALSE))
		{
			if(GOMEZSOULTALK_3 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_03 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_4)) && (GomezWSIsDead_04 == FALSE))
		{
			if(GOMEZSOULTALK_4 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_04 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_5)) && (GomezWSIsDead_05 == FALSE))
		{
			if(GOMEZSOULTALK_5 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_05 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_6)) && (GomezWSIsDead_06== FALSE))
		{
			if(GOMEZSOULTALK_6 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_06 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_7)) && (GomezWSIsDead_07 == FALSE))
		{
			if(GOMEZSOULTALK_7 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_07 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_8)) && (GomezWSIsDead_08 == FALSE))
		{
			if(GOMEZSOULTALK_8 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_08 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_9)) && (GomezWSIsDead_09 == FALSE))
		{
			if(GOMEZSOULTALK_9 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_09 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_10)) && (GomezWSIsDead_10 == FALSE))
		{
			if(GOMEZSOULTALK_10 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_10 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_11)) && (GomezWSIsDead_11 == FALSE))
		{
			if(GOMEZSOULTALK_11 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_11 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_12)) && (GomezWSIsDead_12 == FALSE))
		{
			if(GOMEZSOULTALK_12 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_12 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_13)) && (GomezWSIsDead_13 == FALSE))
		{
			if(GOMEZSOULTALK_13 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_13 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_14)) && (GomezWSIsDead_14 == FALSE))
		{
			if(GOMEZSOULTALK_14 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_14 = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_15)) && (GomezWSIsDead_15 == FALSE))
		{
			if(GOMEZSOULTALK_15 == TRUE)
			{
				GOMEZSOULCOUNT = GOMEZSOULCOUNT + 1;
				concatText = " Cursed ghosts killed: " ;
				concatText = ConcatStrings(concatText,IntToString(GOMEZSOULCOUNT));
				AI_Print(concatText);
			}
			else
			{
				GOMEZSOULNOCOUNT = GOMEZSOULNOCOUNT + 1;
			};
			if((GOMEZSOULCOUNT >= 10) && (RESCUEGOMEZSTEPTWO == TRUE) && (RESCUEGOMEZSTEPTWODONE == FALSE))
			{
				RESCUEGOMEZSTEPTWODONE = TRUE;
				RESCUEGOMEZSTEPTHREE = TRUE;
				B_LogEntry( TOPIC_RESCUEGOMEZ , " I received forgiveness for Gomez's soul from the ten cursed ghosts in the Old Mine! Now I need to return to the castle and perform the ritual to summon the Firebenders killed by Gomez. " );
			};
			if(GOMEZSOULNOCOUNT >= 6)
			{
				MIS_RESCUEGOMEZ = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_RESCUEGOMEZ);
			};

			GomezWSIsDead_15 = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(undeadorcshaman_4))
		{
			Wld_SendTrigger("EVT_TPL_07_MSGFILTER_TO_PRIESTDOOR");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demonlord_hr))
		{
			Wld_SendTrigger("EVT_TPL_LASTEVENT_SLEEPERGATE_01");
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_warrior_dark_darkshpere)) && (SHEMRON_DEMON_INS == FALSE))
		{
			Wld_InsertNpc(shemron_demon,"FP_ROAM_MT_SHEMRON");
			SHEMRON_DEMON_INS = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader1))
		{
			B_LogEntry( TOPIC_ADW_ORCINVASION , " I killed High Horde Shaman - Warrag-Shatana. " );
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader2))
		{
			B_LogEntry( TOPIC_ADW_ORCINVASION , " I killed the high shaman of the horde - Varrag-Kazorge. " );
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader3))
		{
			B_LogEntry( TOPIC_ADW_ORCINVASION , " I killed High Horde Shaman Varrag-Hashor. " );
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader4))
		{
			B_LogEntry( TOPIC_ADW_ORCINVASION , " I have killed High Horde Shaman Warrag-Nazul. " );
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orcshaman_leader5))
		{
			B_LogEntry( TOPIC_ADW_ORCINVASION , " I killed the high shaman of the horde - Varrag-Khatash. " );
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orkelite_adw_leader))
		{
			B_LogEntry( TOPIC_ADW_ORCINVASION , " I have killed one of the clan leaders of the horde - Ur-Katana. " );
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_103_dragon_gold))
		{
			DragonGoldIsDead = TRUE;

			if((KNOWS_CRESTMAKE == FALSE) && (MIS_GOLDDRAGONPORTAL == LOG_Running))
			{
				B_LogEntry_Failed(TOPIC_GOLDDRAGONPORTAL);
				MIS_GOLDDRAGONPORTAL = LOG_FAILED;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(zombie_addon_gomez))
		{
			Wld_InsertNpc(none_104_gomez,"OC_EBR_DARK_ROOM_IN");
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10022_Addon_Miguel))
		{
			MIGUEL_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1080_Addon_Tom))
		{
			TOM_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10014_Addon_Thorus))
		{
			THORUS_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1098_Addon_Snaf))
		{
			SNAF_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1086_Addon_Scatty))
		{
			SCATTY_ISDEAD = TRUE ;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Fisk))
		{
			FISK_ISDEAD = TRUE ;
			if(MIS_RATFORDFISK == LOG_Running)
			{
				MIS_RATFORDFISK = LOG_OBSOLETE;
			};
		};
		if(Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			self.aivar[AIV_KilledByPlayer] = TRUE ;

			if ((self.guild <  GIL_SEPERATOR_HUM ) && (self.guild !=  GIL_KDM ) && (self.guild !=  GIL_DMT ) && (self.guild !=  GIL_BDT ) && (self.aivar[AIV_DropDeadAndKill] ==  FALSE )) ;
			{
				MadKillerCount = MadKillerCount + 1;
			};
			if((self.guild == GIL_GIANT_BUG) && (MIS_Fester_KillBugs == LOG_Running))
			{
				Festers_Giant_Bug_Killed = Festers_Giant_Bug_Killed + 1;
			};
			if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Swamprat)) && (MIS_KrokoJagd == LOG_Running))
			{
				AlligatorJack_KrokosKilled = AlligatorJack_KrokosKilled + 1;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ramon))
			{
				Player_HasTalkedToBanditCamp = TRUE;
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Franco))
			{
				if(MIS_HlpLogan == LOG_Running)
				{
					MIS_HlpLogan = LOG_OBSOLETE;
				};
				if(MIS_HlpEdgor == LOG_Running)
				{
					MIS_HlpEdgor = LOG_OBSOLETE;
				};
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Fortuno))
			{
				Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_OBSOLETE);
			};
			if (self.aivar[ AIV_MM_REAL_ID ] ==  ID_ZOMBIE_OM )
			{
				OLDMINEZCOUNT = OLDMINEZCOUNT + 1;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GoldMinecrawler))
		{
			if((Minecrawler_Killed >= 9) && (Bloodwyn_Spawn == FALSE))
			{
				B_StartOtherRoutine(Bloodwyn,"MINE");
				AI_Teleport(Bloodwyn,"ADW_MINE_TO_MC_03");
				Bloodwyn_Spawn = TRUE;
			}
			else
			{
				Minecrawler_Killed = Minecrawler_Killed + 1;
			};
		};

		B_DeletePetzCrime(self);
		self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE ;
	};
	if(self.vars[6] == FALSE)
	{
		B_GiveTradeInv(self);
		B_ClearRuneInv(self);

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6027_taliasan))
		{
			B_ClearBookInv(self);
		};

		AI_UnequipWeapons(self);
		self.aivar[ AIV_TAPOSITION ] = FALSE ;

		if (self.aivar[ 93 ] ==  FALSE )
		{
			if (self.aivar[AIV_DeathInvGiven] ==  FALSE )
			{
				B_GiveDeathInv(self);
			};
		};
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Draconian_Minion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_UD)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Azgalor)) || (Hlp_GetInstanceID(self) ) = Hlp_GetInstanceID(SwampGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(StoneGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IceGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_Dragon))
		{
			DragonRegenFast = FALSE;
		};

		self.vars[6] = TRUE;
	};
	if ((self.aivar[AIV_StoryBandit] ==  ​​FALSE ) && (self.guild <=  GIL_SEPERATOR_HUM ) && (Npc_IsPlayer(other) || (other.aivar[ AIV_PARTYMEMBER ] ==  TRUE ))) ;
	{
		self.aivar[AIV_StoryBandit] = TRUE ;
	};
};

func int ZS_Dead_loop()
{
	if(self.aivar[93] == TRUE)
	{
		self.aivar[ 92 ] = TRUE ;
		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		return LOOP_END;
	}
	else
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan)) && (URHANSPEAKBEFOREBATTLE == TRUE) && (URHANBEATEN == TRUE) && (MIS_CHALLANGEORC == LOG_Running))
		{
			return LOOP_END;
		};
		if (self.aivar[ AIV_TAPOSITION ] ==  FALSE )
		{
			B_DragonKillCounter(self);
			self.aivar[ AIV_TAPOSITION ] = TRUE ;
		};

		return LOOP_CONTINUE;
	};

	return LOOP_CONTINUE;
};

func void zs_dead_end()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_EnemyOverride] = TRUE ;
		AI_StartState(self,ZS_MM_Rtn_DragonRest,0,"");
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) && (RavenAway == FALSE))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		Npc_PerceiveAll(self);
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 1;

		if(self.guild <= GIL_SEPERATOR_HUM)
		{
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			self.aivar[AIV_MM_RoamEnd] = FALSE ;
			Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(self,"BIP01 L HAND");
			Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));
		};

		Npc_ClearAIQueue(self);
		AI_Standup(self);
		Npc_PerceiveAll(self);
		AI_PlayAniBS(self,"T_STAND_2_WOUNDED",BS_UNCONSCIOUS);
		AI_StartState(self,ZS_Unconscious,0,"");
	};
};
