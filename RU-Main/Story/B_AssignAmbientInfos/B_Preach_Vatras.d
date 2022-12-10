
func void B_Dialoge_Ani(var C_Npc slf)
{
	var int zufall;

	zufall = Hlp_Random(20);

	if(zufall == 0)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_01",BS_STAND);
	}
	else if(zufall == 1)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_02",BS_STAND);
	}
	else if(zufall == 2)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_03",BS_STAND);
	}
	else if(zufall == 3)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_04",BS_STAND);
	}
	else if(zufall == 4)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_05",BS_STAND);
	}
	else if(zufall == 5)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_06",BS_STAND);
	}
	else if(zufall == 6)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_07",BS_STAND);
	}
	else if(zufall == 7)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_08",BS_STAND);
	}
	else if(zufall == 8)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_09",BS_STAND);
	}
	else if(zufall == 9)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_10",BS_STAND);
	}
	else if(zufall == 10)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_11",BS_STAND);
	}
	else  if (random ==  11 )
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_12",BS_STAND);
	}
	else  if (random ==  12 )
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_13",BS_STAND);
	}
	else  if (random ==  13 )
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_14",BS_STAND);
	}
	else  if (random ==  14 )
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_15",BS_STAND);
	}
	else  if (random ==  15 )
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_16",BS_STAND);
	}
	else  if (random ==  16 )
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_17",BS_STAND);
	}
	else  if (random ==  17 )
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_18",BS_STAND);
	}
	else  if (random ==  18 )
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_19",BS_STAND);
	}
	else  if (random ==  19 )
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_20",BS_STAND);
	};
};

func void B_Preach_Vatras(var int satz)
{
	B_Dialoge_Ani(self);

	if (set ==  0 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_00 " );	// But the light was torture for Beliar. And everything that Innos created was destroyed by Beliar.
	};
	if (set ==  1 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_01 " );	// But Adanos realized that nothing would exist if this continued. Neither light nor darkness.
	};
	if (set ==  2 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_02 " );	// And he decided to stand between the two brothers in order to extinguish this conflict. But he didn't succeed.
	};
	if (set ==  3 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_03 " );	// But where Adanos stood, there was a place where neither Innos nor Beliar had power.
	};
	if (set ==  4 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_04 " );	// At this point Order and Chaos were equal. And so the sea was created.
	};
	if (set ==  5 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_05 " );	// And this sea freed the land. And various creatures appeared. Trees and animals. Wolves and sheep. And finally, man appeared.
	};
	if (set ==  6 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_06 " );	// And Adanos was satisfied with what was created. He was pleased with all beings equally.
	};
	if (set ==  7 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_07 " );	// But so great was Beliar's anger that he went to the ground and chose the beast. And Beliar spoke to him. And this beast became his subject.
	};
	if (set ==  8 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_08 " );	// And Beliar gave him some of his divine power to make the beast destroy the earth.
	};
	if (set ==  9 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_09 " );	// But Innos saw what Beliar did. And he, too, went down to earth and chose a man. And Innos spoke to him. And the man became his subject.
	};
	if (set ==  10 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_10 " );	// And Innos gave him a part of his divine power so that he could resist the deeds of Beliar.
	};
	if (set ==  11 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_11 " );	// And Beliar spoke to another creature. But Adanos sent a tide, and this being was washed away from the face of the earth.
	};
	if (set ==  12 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_12 " );	// But trees and animals were washed away with it. And deep sadness seized Adanos.
	};
	if (set ==  13 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_13 " );	// And Adanos spoke to his brothers: 'Never again must you set foot on my land. She is sacred. May it be so.'
	};
	if (set ==  14 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_14 " );	// But man and beast started a war in the land of Adanos. And the wrath of the gods was with them.
	};
	if (set ==  15 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_15 " );	// And the man killed the beast and entered the realm of Beliar.
	};
	if (set ==  16 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_16 " );	// But Adanos saw that Order and Chaos are now unequal, and invited Innos to deprive the man of divine power.
	};
	if (set ==  17 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_17 " );	// And Innos, having judged wisely, did this.
	};
	if (set ==  18 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_18 " );	// But Adanos feared that the day would come when the beast would return to earth.
	};
	if (set ==  19 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_19 " );	// And he asked Innos to leave some of his power in this world so that he could return it to man if the beast returns.
	};
	if (set ==  20 )
	{
		AI_Output(self,self, " DIA_Vatras_PREACH_05_20 " );	// And Innos, having judged wisely, did this.
	};
};

func void B_Preach_Marduk(var int satz)
{
	B_Dialoge_Ani(self);

	if (set ==  0 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_00 " );	// In ancient times, when the wars of the primordial elements had finished raging, messengers of the elements, whom we now know as gods, appeared in this world.
	};
	if (set ==  1 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_01 " );	// So Innos, the god of light and fire, Adanos, the lord of serene waters and winds, and the lord of darkness and death, Beliar, came to this world.
	};
	if (set ==  2 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_02 " );	// In that era, the world itself was more wild and deserted than we can see it now, and required arrangement.
	};
	if (set ==  3 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_03 " );	// Innos gave the world light and warmth. Adanos, commanding water and winds, irrigated the earth's firmament, making it fertile. And Beliar, in turn, gave birth to darkness and the coolness of the night, and did not allow the lies of Innos to burn the land.
	};
	if (set ==  4 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_04 " );	// That's how the balance was maintained! Through their joint efforts, life was born in this world and various living creatures began to appear.
	};
	if (set ==  5 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_05 " );	// One of the creatures was a man whom Innos himself chose as the conductor of his will and to whom he transferred a particle of his knowledge, teaching law and order.
	};
	if (set ==  6 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_06 " );	// Then people began to revere Innos as the god of light and justice. Adanos as the patron of sea waters and sailors. And Beliar, as the god of darkness and war.
	};
	if (set ==  7 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_07 " );	// But people were attracted by daylight and warmth, and the darkness of the night, on the contrary, frightened them with its dangers. Therefore, they feared Beliar and secretly hated him.
	};
	if (set ==  8 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_08 " );	// In the end, people incurred his wrath and he decided to create creatures that would worship only him.
	};
	if (set ==  9 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_09 " );	// But everything he created took terrible, unthinkable forms. Dangerous creatures began to disturb the peace and attack people. Innos condemned this and Beliar was filled with anger towards his brother.
	};
	if (set ==  10 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_10 " );	// After a while, a war broke out between the two gods! The people in it took the side of Innos, and the creatures created by dark magic supported Beliar. Adanos did not take sides. He only looked at the destruction caused by his brothers, healed and thought about the future restoration of the land suffering during the war.
	};
	if (set ==  11 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_11 " );	// Since then, man and beast have been fighting desperately for their divine masters. This struggle, alas, did not subside over the years. On the contrary, it steadily grows stronger, tougher, forcing its participants on both sides to come up with ever more insidious tricks that can help them win.  
	};
	if (set ==  12 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_12 " );	// We, as servants of Innos, without a shadow of a doubt recognize his supremacy among all deities and lesser spirits and are ready to destroy Beliar's creatures for his glory.
	};
	if (set ==  13 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_13 " );	// The path illuminated by its light, the path of goodness, prosperity, truth, conscience and justice is a true course for us.
	};
	if (set ==  14 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_14 " );	// Never leave it, stay true to our master and the holy fire.
	};
	if (set ==  15 )
	{
		AI_Output(self,self, " DIA_Marduk_PREACH_01_15 " );	// With our support, it is Innos' victory that will seal this long festering wound.
	};
};

func void B_Preach_MageSpeech_Pyr(var int satz)
{
	if (set ==  2 )
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_02");	//
	};
	if (set ==  4 )
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_04");	//
	};
	if (set ==  6 )
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_06");	//
	};
	if (set ==  8 )
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_08");	//
	};
	if (set ==  10 )
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_10");	//
	};
	if (set ==  12 )
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_12");	//
	};
	if (set ==  14 )
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_14");	//
	};
	if (set ==  16 )
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_16");	//
	};
	if (set ==  18 )
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_18");	//
	};
};

func void B_Preach_MageSpeech_Xar(var int satz)
{
	if (set ==  1 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_01");	//
	};
	if (set ==  3 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_03");	//
	};
	if (set ==  5 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_05");	//
	};
	if (set ==  7 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_07");	//
	};
	if (set ==  9 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_09");	//
	};
	if (set ==  11 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_11");	//
	};
	if (set ==  13 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_13");	//
	};
	if (set ==  15 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_15");	//
	};
	if (set ==  17 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_17");	//
	};
	if (set ==  19 )
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_19");	//
	};
};
