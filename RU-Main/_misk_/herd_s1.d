
var int HerdFish;
var int HerdMeat;
var int HerdBug;
var int HerwFish;
var int HerwMeat;
var int HerwBug;
var int HerdCake;
var int NeedPan;
var int CampfireRest;

// --------------------------------------------------- --------------------------------

func void herdpan_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_HERD;
		NeedPan = FALSE;
		AI_ProcessInfos(her);
	};
};

func void herd_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_HERD;
		NeedPan = TRUE;
		AI_ProcessInfos(her);
	};
};

instance PC_HERD_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_herd_exit_condition;
	information = pc_herd_exit_info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE_WORK;
};

func int pc_herd_exit_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE))
	{
		return TRUE;
	};
};

func void pc_herd_exit_info()
{
	if((NeedPan == TRUE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") > 500))
	{
		if(Npc_HasItems(hero,ItFoMuttonRaw) >= 1)
		{
			Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
		}
		else
		{
			Npc_RemoveInvItems(hero,ItFoMutton,1);
		};

		CreateInvItems(hero,ItMi_Pan,1);
		NeedPan = FALSE;
	};
	if(Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") < 500)
	{
		CreateInvItems(hero, ITMI_BREADPUSHER , 1 );
	};

	b_endproductiondialog();
	HerdFish = FALSE;
	HerdMeat = FALSE;
	HerdBug = FALSE;
};

instance PC_Herd_Meat(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herd_Meat_Condition;
	information = PC_Herd_Meat_Info;
	permanent = TRUE;
	description = " Fry the meat " ;
};

func int PC_Herd_Meat_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herd_Meat_Info()
{
	HerdMeat = TRUE;
};

instance PC_Herd_Fish(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herd_Fish_Condition;
	information = PC_Herd_Fish_Info;
	permanent = TRUE;
	description = " Fry the fish " ;
};

func int PC_Herd_Fish_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herd_Fish_Info()
{
	HerdFish = TRUE;
};

instance PC_Herd_Bug(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herd_Bug_Condition;
	information = PC_Herd_Bug_Info;
	permanent = TRUE;
	description = " Fry beetle meat " ;
};

func int PC_Herd_Bug_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herd_Bug_Info()
{
	HerdBug = TRUE;
};

instance PC_Herd_Cake(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herd_Cake_Condition;
	information = PC_Herd_Cake_Info;
	permanent = TRUE;
	description = " Bake a cake " ;
};

func int PC_Herd_Cake_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500))
	{
		return TRUE;
	};
};

func void PC_Herd_Cake_Info()
{
	HerdCake = TRUE;
};

instance PC_Herd_Meat_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herd_Meat_BACK_Condition;
	information = PC_Herd_Meat_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herd_Meat_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == TRUE) && (HerdBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herd_Meat_BACK_Info()
{
	HerdMeat = FALSE;
};

instance PC_Herd_Fish_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herd_Fish_BACK_Condition;
	information = PC_Herd_Fish_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herd_Fish_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == TRUE) && (HerdMeat == FALSE) && (HerdBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herd_Fish_BACK_Info()
{
	HerdFish = FALSE;
};

instance PC_Herd_Bug_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herd_Bug_BACK_Condition;
	information = PC_Herd_Bug_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herd_Bug_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == TRUE))
	{
		return TRUE;
	};
};

func void PC_Herd_Bug_BACK_Info()
{
	HerdBug = FALSE;
};

instance PC_Herd_Cake_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herd_Cake_BACK_Condition;
	information = PC_Herd_Cake_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herd_Cake_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == TRUE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herd_Cake_BACK_Info()
{
	HerdCake = FALSE;
};

instance PC_HERD_Cake_Apple(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Apple_condition;
	information = PC_HERD_Cake_Apple_info;
	permanent = 1;
	important = 0;
	description = " Bake an apple pie " ;
};

func int PC_HERD_Cake_Apple_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_01 == TRUE))
	{
		return TRUE;
	};
};

func void PC_HERD_Cake_Apple_info()
{
	if((Npc_HasItems(hero,ItFo_Apple) >= 25) && (Npc_HasItems(hero,ItFo_Bread) >= 5) && (Npc_HasItems(hero,ItFo_Cheese) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1) && (Npc_HasItems(hero,ItFo_Water) >= 1))
	{
		AI_Wait(hero,1);
		B_GivePlayerXP(10);
		Npc_RemoveInvItems(hero,ItFo_Apple,25);
		Npc_RemoveInvItems(hero,ItFo_Bread,5);
		Npc_RemoveInvItems(hero,ItFo_Cheese,1);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
		Npc_RemoveInvItems(hero,ItFo_Water,1);
		CreateInvItems(hero,ItFo_Cake_Apple,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr( " Done! " , 83 , 152 , 48 );
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		// Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing, 177 , 58 , 17 );
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_HERD_Cake_Meat(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Meat_condition;
	information = PC_HERD_Cake_Meat_info;
	permanent = 1;
	important = 0;
	description = " Bake a meat pie " ;
};

func int PC_HERD_Cake_Meat_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_02 == TRUE))
	{
		return TRUE;
	};
};

func void PC_HERD_Cake_Meat_info()
{
	if((Npc_HasItems(hero,ItFoMuttonRaw) >= 25) && (Npc_HasItems(hero,ItFo_Bread) >= 5) && (Npc_HasItems(hero,ItFo_Cheese) >= 2) && (Npc_HasItems(hero,ItFo_Milk) >= 2) && (Npc_HasItems(hero,ItFo_Booze) >= 1))
	{
		AI_Wait(hero,1);
		B_GivePlayerXP(20);
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,25);
		Npc_RemoveInvItems(hero,ItFo_Bread,5);
		Npc_RemoveInvItems(hero,ItFo_Milk,2);
		Npc_RemoveInvItems(hero,ItFo_Cheese,2);
		Npc_RemoveInvItems(hero,ItFo_Booze,1);
		CreateInvItems(hero,ItFo_Cake_Meat,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr( " Done! " , 83 , 152 , 48 );
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		// Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing, 177 , 58 , 17 );
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_HERD_Cake_Mushroom(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Mushroom_condition;
	information = PC_HERD_Cake_Mushroom_info;
	permanent = 1;
	important = 0;
	description = " Bake mushroom pie " ;
};

func int PC_HERD_Cake_Mushroom_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_03 == TRUE))
	{
		return TRUE;
	};
};

func void PC_HERD_Cake_Mushroom_info()
{
	if((Npc_HasItems(hero,ItPl_Mushroom_02) >= 25) && (Npc_HasItems(hero,ItFo_Bread) >= 5) && (Npc_HasItems(hero,ItFo_Cheese) >= 3) && (Npc_HasItems(hero,ItFo_Wine) >= 1))
	{
		AI_Wait(hero,1);
		B_GivePlayerXP(30);
		Npc_RemoveInvItems(hero,ItPl_Mushroom_02,25);
		Npc_RemoveInvItems(hero,ItFo_Bread,5);
		Npc_RemoveInvItems(hero,ItFo_Cheese,3);
		Npc_RemoveInvItems(hero,ItFo_Wine,1);
		CreateInvItems(hero,ItFo_Cake_Mushroom,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr( " Done! " , 83 , 152 , 48 );
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		// Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing, 177 , 58 , 17 );
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_HERD_Cake_Fish(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Fish_condition;
	information = PC_HERD_Cake_Fish_info;
	permanent = 1;
	important = 0;
	description = " Bake a fish pie " ;
};

func int PC_HERD_Cake_Fish_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_04 == TRUE))
	{
		return TRUE;
	};
};

func void PC_HERD_Cake_Fish_info()
{
	if((Npc_HasItems(hero,ItFo_Fish) >= 20) && (Npc_HasItems(hero,ItFo_Bread) >= 5) && (Npc_HasItems(hero,ItPl_Blueplant) >= 2) && (Npc_HasItems(hero,ItFo_Booze) >= 1))
	{
		AI_Wait(hero,1);
		B_GivePlayerXP(40);
		Npc_RemoveInvItems(hero,ItFo_Fish,20);
		Npc_RemoveInvItems(hero,ItFo_Bread,5);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,2);
		Npc_RemoveInvItems(hero,ItFo_Booze,1);
		CreateInvItems(hero,ItFo_Cake_Fish,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr( " Done! " , 83 , 152 , 48 );
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		// Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing, 177 , 58 , 17 );
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_HERD_Cake_Honey(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Honey_condition;
	information = PC_HERD_Cake_Honey_info;
	permanent = 1;
	important = 0;
	description = " Bake a honey cake " ;
};

func int PC_HERD_Cake_Honey_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_05 == TRUE))
	{
		return TRUE;
	};
};

func void PC_HERD_Cake_Honey_info()
{
	if((Npc_HasItems(hero,ItFo_Honey) >= 5) && (Npc_HasItems(hero,ItFo_Bread) >= 5) && (Npc_HasItems(hero,ItFo_Cheese) >= 3) && (Npc_HasItems(hero,ItFo_Milk) >= 1) && (Npc_HasItems(hero,ITFO_WINEBERRYS) >= 1) && (Npc_HasItems(hero,ItFo_Wine) >= 1))
	{
		AI_Wait(hero,1);
		B_GivePlayerXP(50);
		Npc_RemoveInvItems(hero,ItFo_Honey,5);
		Npc_RemoveInvItems(hero,ItFo_Bread,5);
		Npc_RemoveInvItems(hero,ItFo_Cheese,3);
		Npc_RemoveInvItems(hero,ItFo_Milk,1);
		Npc_RemoveInvItems(hero,ITFO_WINEBERRYS,1);
		Npc_RemoveInvItems(hero,ItFo_Wine,1);
		CreateInvItems(hero,ItFo_Cake_Honey,1);
		RankPoints = RankPoints + 1;
		AI_PrintClr( " Done! " , 83 , 152 , 48 );
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		// Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing, 177 , 58 , 17 );
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};

instance PC_HERD_FISCHBRATEN (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herd_fischbraten_condition;
	information = pc_herd_fischbraten_info;
	permanent = 1;
	important = 0;
	description = " Fry fish (1 serving) " ;
};

func int pc_herd_fischbraten_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdFish == TRUE) && (Npc_HasItems(hero,ItFo_Fish) >= 1))
	{
		return TRUE;
	};
};

func void pc_herd_fischbraten_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFo_Fish,1);
	CreateInvItems(hero,itfo_fish_gebraten,1);
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_HERD_FISCHBRATEN_10X(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herd_fischbraten10x_condition;
	information = pc_herd_fischbraten10x_info;
	permanent = 1;
	important = 0;
	description = " Fry fish (10 servings) " ;
};

func int pc_herd_fischbraten10x_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdFish == TRUE) && (Npc_HasItems(hero,ItFo_Fish) >= 10))
	{
		return TRUE;
	};
};

func void pc_herd_fischbraten10x_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFo_Fish,10);
	CreateInvItems(hero,itfo_fish_gebraten,10);
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_HERD_FISCHBRATEN_ALL(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_FISCHBRATEN_ALL_condition;
	information = PC_HERD_FISCHBRATEN_ALL_info;
	permanent = 1;
	important = 0;
	description = " Fry all fish " ;
};

func int PC_HERD_FISCHBRATEN_ALL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdFish == TRUE) && (Npc_HasItems(hero,ItFo_Fish) >= 1))
	{
		return TRUE;
	};
};

func void PC_HERD_FISCHBRATEN_ALL_info()
{
	var int allfish;

	AI_Wait(hero,1);
	allfish = Npc_HasItems(hero,ItFo_Fish);
	Npc_RemoveInvItems(hero,ItFo_Fish,allfish);
	CreateInvItems(hero,itfo_fish_gebraten,allfish);
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
};


instance PC_HERD_FLEISCHBRATEN(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herd_fleischbraten_condition;
	information = pc_herd_fleischbraten_info;
	permanent = 1;
	important = 0;
	description = " Fry meat (1 piece) " ;
};

func int pc_herd_fleischbraten_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdMeat == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void pc_herd_fleischbraten_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
	CreateInvItems(hero,ItMi_Pan,1);
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};


instance PC_HERD_FLEISCHBRATEN_10X(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herd_fleischbraten10x_condition;
	information = pc_herd_fleischbraten10x_info;
	permanent = 1;
	important = 0;
	description = " Fry meat (10 pieces) " ;
};

func int pc_herd_fleischbraten10x_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdMeat == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 10))
	{
		return TRUE;
	};
};

func void pc_herd_fleischbraten10x_info()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,10);
	CreateInvItems(hero,ItFoMutton,10);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_HERD_FLEISCHBRATEN_ALL(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_FLEISCHBRATEN_ALL_condition;
	information = PC_HERD_FLEISCHBRATEN_ALL_info;
	permanent = 1;
	important = 0;
	description = " Fry all meat " ;
};

func int PC_HERD_FLEISCHBRATEN_ALL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdMeat == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void PC_HERD_FLEISCHBRATEN_ALL_info()
{
	be int allmeat;

	AI_Wait(hero,1);
	allmeat = Npc_HasItems(hero,ItFoMuttonRaw);
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,allmeat);
	CreateInvItems(hero,ItFoMutton,allmeat);
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};


instance PC_HERD_BUG MEAT ROAST (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herd_wanzenfleischbraten_condition;
	information = pc_herd_wanzenfleischbraten_info;
	permanent = 1;
	important = 0;
	description = " Roast beetle meat (1 piece) " ;
};


func int pc_herd_bug meat roast_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdBug == TRUE) && (Npc_HasItems(hero,ItAt_Meatbugflesh) >= 1))
	{
		return TRUE;
	};
};

func void pc_herd_bug meat roast_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,1);
	CreateInvItems(hero,itat_meatbugflesh_fried, 1 );
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};


instance PC_HERD_BUG MEAT ROAST_10X (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herd_wanzenfleischbraten10x_condition;
	information = pc_herd_wanzenfleischbraten10x_info;
	permanent = 1;
	important = 0;
	description = " Roast Beetle Meat (10 pieces) " ;
};


func int pc_herd_bug meat roast10x_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdBug == TRUE) && (Npc_HasItems(hero,ItAt_Meatbugflesh) >= 10))
	{
		return TRUE;
	};
};

func void pc_herd_bug meat roast10x_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,10);
	CreateInvItems(hero,itat_meatbugflesh_fried, 10 );
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_HERD_BUZZEFLEISCHBRATEN_ALL (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_BUG MEAT ROAST_ALL_condition;
	information = PC_HERD_BUG MEAT ROAST_ALL_info;
	permanent = 1;
	important = 0;
	description = " Fry all beetle meat " ;
};

func int PC_STOCK_BUGS MEATROAST_ALL_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdBug == TRUE) && (Npc_HasItems(hero,ItAt_Meatbugflesh) >= 1))
	{
		return TRUE;
	};
};

func void PC_STOCK_BUGS MEATROAST_ALL_info()
{
	var int allbug;

	AI_Wait(hero,1);
	allbug = Npc_HasItems(hero,ItAt_Meatbugflesh);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,allbug);
	CreateInvItems(hero,itat_meatbugflesh_fried,allbug);
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

// ---------------------------------------- Compotes------- --------------------------------

func void kessel_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_KESSEL;
		AI_ProcessInfos(her);
	};
};

func void pc_kessel_peach_back()
{
	Info_ClearChoices(pc_kessel_peach);
};

instance PC_KESSEL_PEACH(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_KESSEL_PEACH_condition;
	information = PC_KESSEL_PEACH_info;
	permanent = 1;
	important = 0;
	description = " Cook compotes " ;
};

func int PC_KESSEL_PEACH_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_KESSEL)
	{
		return TRUE;
	};
};

func void B_Kessel_Peach()
{
	Info_ClearChoices(PC_KESSEL_PEACH);
	Info_AddChoice(PC_KESSEL_PEACH,Dialog_Back,PC_KESSEL_PEACH_back);

	if((Rezept_Compote_01 == TRUE) && (Npc_HasItems(hero,ItPl_Planeberry) >= 100) && (Npc_HasItems(hero,ItPl_Health_Herb_01) >= 5))
	{
		Info_AddChoice( PC_KESSEL_PEACH , " Wildberry compote x 5 (100 wild berries, 5 medicinal herbs) " ,PC_KESSEL_PEACH_compote_01_X5);
	};
	if((Rezept_Compote_01 == TRUE) && (Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_01) >= 1))
	{
		Info_AddChoice( PC_KESSEL_PEACH , " Wild Berry Compote (20 Wild Berries, Medicinal Herb) " ,PC_KESSEL_PEACH_compote_01);
	};
	if((Rezept_Compote_02 == TRUE) && (Npc_HasItems(hero,ItPl_Forestberry) >= 150) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 5))
	{
		Info_AddChoice( PC_KESSEL_PEACH , " Wild berry compote x 5(150 wild berries, 5 medicinal plants) " ,PC_KESSEL_PEACH_compote_00_X5);
	};
	if((Rezept_Compote_02 == TRUE) && (Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1))
	{
		Info_AddChoice( PC_KESSEL_PEACH , " Wild Berries Compote (30 Wild Berries, Medicinal Plant) " , PC_KESSEL_PEACH_compote_00);
	};
};

func void PC_KESSEL_PEACH_info()
{
	B_Kessel_Peach();
};

func void PC_KESSEL_PEACH_compote_00()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Forestberry,30);
	Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,1);
	CreateInvItems(hero,itfo_compote_00,1);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Peach();
};

func void PC_KESSEL_PEACH_compote_00_X5()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Forestberry,150);
	Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,5);
	CreateInvItems(hero,itfo_compote_00,5);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Peach();
};

func void PC_KESSEL_PEACH_compote_01()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Planeberry,20);
	Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,1);
	CreateInvItems(hero,itfo_compote_01,1);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Peach();
};

func void PC_KESSEL_PEACH_compote_01_X5()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Planeberry,100);
	Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,5);
	CreateInvItems(hero,itfo_compote_01,5);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Peach();
};

func void pc_kettle_fishsoup_back()
{
	Info_ClearChoices(pc_kettle_fishsoup);
};

instance PC_KESSEL_FISH SOUP (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_kettle_fishsoup_condition;
	information = pc_kettle_fishsoup_info;
	permanent = 1;
	important = 0;
	description = " Cook soups " ;
};

func int pc_kettle_fishsoup_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_KESSEL)
	{
		return TRUE;
	};
};

func void B_Kessel_Supp()
{
	Info_ClearChoices(pc_kettle_fishsoup);
	Info_AddChoice(pc_kettle_fishsoup,Dialog_Back,pc_kettle_fishsoup_back);


	if((Edda_Soup_00 == TRUE) && (Npc_HasItems(hero,ItPl_Beet) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Use all turnips for soup " ,pc_kessel_fischsuppe_Beet_all);
	};
	if((Edda_Soup_00 == TRUE) && (Npc_HasItems(hero,ItPl_Beet) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Turnip Soup (Requires: 1 Turnip) " ,pc_kessel_fischsuppe_Beet);
	};
	if((Edda_Soup_01 == TRUE) && (Npc_HasItems(hero,ItFo_Fish) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Use all fish for soup " ,pc_kessel_fischsuppe_fish_all);
	};
	if((Edda_Soup_01 == TRUE) && (Npc_HasItems(hero,ItFo_Fish) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Fish Soup (Requires: 1 Fish) " ,pc_kessel_fischsuppe_fish);
	};
	if((Edda_Soup_02 == TRUE) && (Npc_HasItems(hero,itfoschildkroeteraw) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Use All Turtle Meat for Soup " ,pc_kessel_shildkroetesoup_all);
	};
	if((Edda_Soup_02 == TRUE) && (Npc_HasItems(hero,itfoschildkroeteraw) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Turtle Soup (Requires: 1 Piece of Turtle Meat) " ,pc_kessel_shildkroetesoup);
	};
	if((Edda_Soup_03 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_02) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Use all meat mushrooms for soup " ,pc_kessel_pilzsuppe_all);
	};
	if((Edda_Soup_03 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_02) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Mushroom Soup (Requires: 1 meat mushroom) " ,pc_kessel_pilzsuppe);
	};
	if((Edda_Soup_04 == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Use all meat for soup " ,pc_kessel_meet_all);
	};
	if((Edda_Soup_04 == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe, " Meat Soup (Requires: 1 Piece of Meat) " ,pc_kessel_meet);
	};
};

func void pc_kettle_fishsoup_info()
{
	B_Kessel_Supp();
};

func void pc_kettle_fishsoup_beet()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Beet,1);
	CreateInvItems(hero, ItFo_BeetSoup, 1 );
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	B_Kessel_Supp();
};

func void pc_kettle_fishsoup_fish()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItFo_Fish,1);
	CreateInvItems(hero,ItFo_FishSoup,1);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Supp();
};

func void pc_kessel_meet()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
	CreateInvItems(hero, ItFo_MeetSoup, 1 );
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Supp();
};

func void pc_kessel_shildkroetesoup()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,itfoschildkroeteraw,1);
	CreateInvItems(hero,itfo_schildkroetesoup, 1 );
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Supp();
};

func void pc_kessel_pilzsuppe()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_02,1);
	CreateInvItems(hero,itfo_pilzsuppe,1);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Supp();
};

func void pc_kessel_meet_all()
{
	var int CountMeet;
	var string concatText;

	AI_Wait(hero,1);
	CountMeet = Npc_HasItems(self,ItFoMuttonRaw);
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));
	CreateInvItems(hero,ItFo_MeetSoup,CountMeet);
	RankPoints = RankPoints + 1;

	if(CountMeet == 1)
	{
		concatText = ConcatStrings("Сварен ",IntToString(CountMeet));
		concatText = ConcatStrings(concatText," мясной суп!");
	}
	else if((CountMeet > 1) && (CountMeet < 5))
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountMeet));
		concatText = ConcatStrings(concatText," мясных супа!");
	}
	else if(CountMeet >= 5)
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountMeet));
		concatText = ConcatStrings(concatText, " meat soups! " );
	};

	AI_PrintClr(concatText,83,152,48);
	B_Kessel_Supp();
};

func void pc_kettle_fishsoup_beet_all()
{
	var int countBeet;
	var string concatText;

	AI_Wait(hero,1);
	CountBeet = Npc_HasItems(self,ItPl_Beet);
	Npc_RemoveInvItems(hero,ItPl_Beet,Npc_HasItems(self,ItPl_Beet));
	CreateInvItems(hero,ItFo_BeetSoup,CountBeet);
	RankPoints = RankPoints + 1;

	if(CountBeet == 1)
	{
		concatText = ConcatStrings("Сварен ",IntToString(CountBeet));
		concatText = ConcatStrings(concatText, " turnip soup! " );
	}
	else if((CountBeet > 1) && (CountBeet < 5))
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountBeet));
		concatText = ConcatStrings(concatText, " turnip soup! " );
	}
	else if(CountBeet >= 5)
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountBeet));
		concatText = ConcatStrings(concatText, " turnip soup! " );
	};

	AI_PrintClr(concatText,83,152,48);
	B_Kessel_Supp();
};

func void pc_kessel_fischsuppe_fish_all()
{
	var int CountFish;
	var string concatText;

	AI_Wait(hero,1);
	CountFish = Npc_HasItems(self,ItFo_Fish);
	Npc_RemoveInvItems(hero,ItFo_Fish,Npc_HasItems(self,ItFo_Fish));
	CreateInvItems(hero,ItFo_FishSoup,CountFish);
	RankPoints = RankPoints + 1;

	if(CountFish == 1)
	{
		concatText = ConcatStrings("Сварен ",IntToString(CountFish));
		concatText = ConcatStrings(concatText, " fish soup! " );
	}
	else if((CountFish > 1) && (CountFish < 5))
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountFish));
		concatText = ConcatStrings(concatText," рыбных супа!");
	}
	else if(CountFish >= 5)
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountFish));
		concatText = ConcatStrings(concatText, " fish soups! " );
	};

	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Supp();
};

func void pc_kessel_shildkroetesoup_all()
{
	var int CountSchildMeat;
	var string concatText;

	AI_Wait(hero,1);
	CountSchildMeat = Npc_HasItems(self,itfoschildkroeteraw);
	Npc_RemoveInvItems(hero,itfoschildkroeteraw,Npc_HasItems(self,itfoschildkroeteraw));
	CreateInvItems(hero,itfo_schildkroetesoup,CountSchildMeat);
	RankPoints = RankPoints + 1;

	if(CountSchildMeat == 1)
	{
		concatText = ConcatStrings("Сварен ",IntToString(CountSchildMeat));
		concatText = ConcatStrings(concatText, " turtle soup! " );
	}
	else if((CountSchildMeat > 1) && (CountSchildMeat < 5))
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountSchildMeat));
		concatText = ConcatStrings(concatText, " черепаших супа! " );
	}
	else if(CountSchildMeat >= 5)
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountSchildMeat));
		concatText = ConcatStrings(concatText, " turtle soup! " );
	};

	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Supp();
};

func void pc_kessel_pilzsuppe_all()
{
	var int CountPilz;
	var string concatText;

	AI_Wait(hero,1);
	CountPilz = Npc_HasItems(self,ItPl_Mushroom_02);
	Npc_RemoveInvItems(hero,ItPl_Mushroom_02,Npc_HasItems(self,ItPl_Mushroom_02));
	CreateInvItems(hero,itfo_pilzsuppe,CountPilz);
	RankPoints = RankPoints + 1;

	if(CountPilz == 1)
	{
		concatText = ConcatStrings("Сварен ",IntToString(CountPilz));
		concatText = ConcatStrings(concatText, " mushroom soup! " );
	}
	else if((CountPilz > 1) && (CountPilz < 5))
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountPilz));
		concatText = ConcatStrings(concatText," грибных супа!");
	}
	else if(CountPilz >= 5)
	{
		concatText = ConcatStrings("Сварено ",IntToString(CountPilz));
		concatText = ConcatStrings(concatText, " mushroom soups! " );
	};

	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Supp();
};

func void pc_kessel_soup_back()
{
	Info_ClearChoices(pc_kessel_soup);
};

instance PC_KESSEL_SOUP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_KESSEL_SOUP_condition;
	information = PC_KESSEL_SOUP_info;
	permanent = 1;
	important = 0;
	description = " Cook stews " ;
};

func int PC_KESSEL_SOUP_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_KESSEL)
	{
		return TRUE;
	};
};

func void B_Kessel_Soup()
{
	Info_ClearChoices(PC_KESSEL_SOUP);
	Info_AddChoice(PC_KESSEL_SOUP,Dialog_Back,PC_KESSEL_SOUP_back);

	if((Snaf_Meal_02 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_02) >= 250) && (Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 5))
	{
		Info_AddChoice( PC_KESSEL_SOUP , " Seasoned Mushroom Stew x5 (250 Meat Mushrooms, 5 Fire Roots) " ,PC_KESSEL_SOUP_mana_x5);
	};
	if((Snaf_Meal_02 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_02) >= 50) && (Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 1))
	{
		Info_AddChoice( PC_KESSEL_SOUP , " Seasoned Mushroom Stew (50 Meat Mushrooms, Fireroot) " ,PC_KESSEL_SOUP_mana);
	};
	if((Snaf_Meal_01 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_01) >= 250) && (Npc_HasItems(hero,ItPl_Mana_Herb_02) >= 5))
	{
		Info_AddChoice( PC_KESSEL_SOUP , " Black Mushroom Stew x5 (250 Dark Mushrooms, 5 Fire Herbs) " ,PC_KESSEL_SOUP_magic_x5);
	};
	if((Snaf_Meal_01 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_01) >= 50) && (Npc_HasItems(hero,ItPl_Mana_Herb_02) >= 1))
	{
		Info_AddChoice( PC_KESSEL_SOUP , " Black Mushroom Stew (50 Dark Mushrooms, Fire Herb) " ,PC_KESSEL_SOUP_magic);
	};
	if((Snaf_Meal_03 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_01) >= 10) && (Npc_HasItems(hero,ItAt_Meatbugflesh) >= 5))
	{
		Info_AddChoice( PC_KESSEL_SOUP , " Meat Stew x5 (10 Dark Mushrooms, 5 Beetle Meat) " ,PC_KESSEL_SOUP_fleischwanzenragout_x5);
	};
	if((Snaf_Meal_03 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_01) >= 2) && (Npc_HasItems(hero,ItAt_Meatbugflesh) >= 1))
	{
		Info_AddChoice( PC_KESSEL_SOUP , " Meat Stew (2 Dark Mushrooms, Piece of Beetle Meat) " ,PC_KESSEL_SOUP_fleischwanzenragout);
	};
};

func void PC_KESSEL_SOUP_info()
{
	B_Kessel_Soup();
};

func void PC_KESSEL_SOUP_mana()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_02,50);
	Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
	CreateInvItems(hero,itfo_pottage_mushroom,1);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Soup();
};

func void PC_KESSEL_SOUP_magic()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_01,50);
	Npc_RemoveInvItems(hero,ItPl_Mana_Herb_02,1);
	CreateInvItems(hero,itfo_pottage_mushroom_black,1);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Soup();
};


func void PC_KESSEL_SOUP_fleischwanzenragout()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_01,2);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,1);
	CreateInvItems(hero,itfo_fleischwanzenragout,1);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Soup();
};

func void PC_KESSEL_SOUP_mana_x5()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_02,250);
	Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,5);
	CreateInvItems(hero,itfo_pottage_mushroom,5);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Soup();
};

func void PC_KESSEL_SOUP_magic_x5()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_01,250);
	Npc_RemoveInvItems(hero,ItPl_Mana_Herb_02,5);
	CreateInvItems(hero,itfo_pottage_mushroom_black,5);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Soup();
};


func void PC_KESSEL_SOUP_fleischwanzenragout_x5()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_01,10);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,5);
	CreateInvItems(hero,itfo_fleischwanzenragout,5);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
	B_Kessel_Soup();
};

instance PC_KESSEL_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_kessel_exit_condition;
	information = pc_kessel_exit_info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE_WORK;
};

func int pc_kessel_exit_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_KESSEL)
	{
		return TRUE;
	};
};

func void pc_kessel_exit_info()
{
	b_endproductiondialog();
};


// -------------------bonfire---------------------- ----------

func void herw_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_HERD;
		CampfirePan = TRUE;
		AI_ProcessInfos(her);
	};
};

instance PC_HERW_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_herw_exit_condition;
	information = pc_herw_exit_info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE_WORK;
};

func int pc_herw_exit_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE))
	{
		return TRUE;
	};
};

func void pc_herw_exit_info()
{
	CampfirePan = FALSE;
	HerwFish = FALSE;
	HerwMeat = FALSE;
	HerwBug = FALSE;
	CheckCampfireMeat = TRUE;
	b_endproductiondialog();
};

instance PC_Herw_Meat(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herw_Meat_Condition;
	information = PC_Herw_Meat_Info;
	permanent = TRUE;
	description = " Fry the meat " ;
};

func int PC_Herw_Meat_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herw_Meat_Info()
{
	HerwMeat = TRUE;
};

instance PC_Herw_Fish(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herw_Fish_Condition;
	information = PC_Herw_Fish_Info;
	permanent = TRUE;
	description = " Fry the fish " ;
};

func int PC_Herw_Fish_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herw_Fish_Info()
{
	HerwFish = TRUE;
};

instance PC_Herw_Bug(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herw_Bug_Condition;
	information = PC_Herw_Bug_Info;
	permanent = TRUE;
	description = " Fry beetle meat " ;
};

func int PC_Herw_Bug_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herw_Bug_Info()
{
	HerwBug = TRUE;
};

instance PC_Herw_Meat_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herw_Meat_BACK_Condition;
	information = PC_Herw_Meat_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herw_Meat_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == TRUE) && (HerwBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herw_Meat_BACK_Info()
{
	HerwMeat = FALSE;
};

instance PC_Herw_Fish_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herw_Fish_BACK_Condition;
	information = PC_Herw_Fish_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herw_Fish_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == TRUE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herw_Fish_BACK_Info()
{
	HerwFish = FALSE;
};

instance PC_Herw_Bug_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herw_Bug_BACK_Condition;
	information = PC_Herw_Bug_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herw_Bug_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == TRUE))
	{
		return TRUE;
	};
};

func void PC_Herw_Bug_BACK_Info()
{
	HerwBug = FALSE;
};

instance PC_HERW_FISCHBRATEN (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herw_fischbraten_condition;
	information = pc_herw_fischbraten_info;
	permanent = 1;
	important = 0;
	description = " Fry fish (1 serving) " ;
};

func int pc_herw_fischbraten_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (HerwFish == TRUE) && (Npc_HasItems(hero,ItFo_Fish) >= 1))
	{
		return TRUE;
	};
};

func void pc_herw_fischbraten_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFo_Fish,1);
	CreateInvItems(hero,itfo_fish_gebraten,1);
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_HERW_FISCHBRATEN_10X (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herw_fischbraten10x_condition;
	information = pc_herw_fischbraten10x_info;
	permanent = 1;
	important = 0;
	description = " Fry fish (5 servings) " ;
};

func int pc_herw_fischbraten10x_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (HerwFish == TRUE) && (Npc_HasItems(hero,ItFo_Fish) >= 5))
	{
		return TRUE;
	};
};

func void pc_herw_fischbraten10x_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFo_Fish,5);
	CreateInvItems(hero,itfo_fish_gebraten,5);
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_HERW_FLEISCHROTEN (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herw_fleischbraten_condition;
	information = pc_herw_fleischbraten_info;
	permanent = 1;
	important = 0;
	description = " Fry meat (1 piece) " ;
};

func int pc_herw_fleischbraten_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (HerwMeat == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void pc_herw_fleischbraten_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
	CreateInvItems(hero,ItFoMutton,1);
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_HERW_FLEISCHBRATEN_10X (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herw_fleischbraten10x_condition;
	information = pc_herw_fleischbraten10x_info;
	permanent = 1;
	important = 0;
	description = " Fry meat (5 pieces) " ;
};

func int pc_herw_fleischbraten10x_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (HerwMeat == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 5))
	{
		return TRUE;
	};
};

func void pc_herw_fleischbraten10x_info()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,5);
	CreateInvItems(hero,ItFoMutton,5);
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_HERW_BUG MEAT ROAST (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herw_wanzenfleischbraten_condition;
	information = pc_herw_wanzenfleischbraten_info;
	permanent = 1;
	important = 0;
	description = " Roast beetle meat (1 piece) " ;
};

func int pc_herw_bug meat roast_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (HerwBug == TRUE) && (Npc_HasItems(hero,ItAt_Meatbugflesh) >= 1))
	{
		return TRUE;
	};
};

func void pc_herw_bug meat roast_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,1);
	CreateInvItems(hero,itat_meatbugflesh_fried, 1 );
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_HERW_BUG MEAT ROAST_10X (C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herw_wanzenfleischbraten10x_condition;
	information = pc_herw_wanzenfleischbraten10x_info;
	permanent = 1;
	important = 0;
	description = " Roast beetle meat (5 pieces) " ;
};

func int pc_herw_wanzenfleischbraten10x_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (HerwBug == TRUE) && (Npc_HasItems(hero,ItAt_Meatbugflesh) >= 5))
	{
		return TRUE;
	};
};

func void pc_herw_wanzenfleischbraten10x_info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,5);
	CreateInvItems(hero,itat_meatbugflesh_fried, 5 );
	RankPoints = RankPoints + 1;
	AI_PrintClr( " Done! " , 83 , 152 , 48 );
	//B_Say(self,self,"$ITEMREADY");
};

instance PC_Herw_CampfireRest(C_Info)
{
	npc = PC_Hero;
	nr = 900;
	condition = PC_Herw_CampfireRest_Condition;
	information = PC_Herw_CampfireRest_Info;
	permanent = TRUE;
	description = " Rest... " ;
};

func int PC_Herw_CampfireRest_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herw_CampfireRest_Info()
{
	CampfireRest = TRUE;
};

instance PC_Herw_CampfireRest_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herw_CampfireRest_BACK_Condition;
	information = PC_Herw_CampfireRest_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herw_CampfireRest_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == TRUE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herw_CampfireRest_BACK_Info()
{
	CampfireRest = FALSE;
};

instance PC_HERW_CampfireRest_1H(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herw_CampfireRest_1H_condition;
	information = pc_herw_CampfireRest_1H_info;
	permanent = 1;
	important = 0;
	description = "...1 час";
};

func int pc_herw_CampfireRest_1H_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == TRUE) && (RestPool >= 1))
	{
		return TRUE;
	};
};

func void pc_herw_CampfireRest_1H_info()
{
	var int bHour;
	var int bMinute;

	if(SBMODE == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + 1;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
	};

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 10) / 100);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;

	RestPool = RestPool -  1 ;
	bHour = Wld_GetTimeHour();
	bMinute = Wld_GetTimeMin();
	bHour +=  1 ;
	Wld_SetTime(bHour,bMinute);
	CampfireRest = FALSE;
};

instance PC_HERW_CampfireRest_2H(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_herw_CampfireRest_2H_condition;
	information = pc_herw_CampfireRest_2H_info;
	permanent = 1;
	important = 0;
	description = "...2 часа";
};

func int pc_herw_CampfireRest_2H_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == TRUE) && (RestPool >= 2))
	{
		return TRUE;
	};
};

func void pc_herw_CampfireRest_2H_info()
{
	var int bHour;
	var int bMinute;

	if(SBMODE == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + 2;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
		if(Hero_Hunger > 1)
		{
			Hero_Hunger -= 1;
		}		
		else
		{
			Hero_Hunger = FALSE ;
		};	
		if(Hero_Thirst > 1)
		{
			Hero_Thirst -= 1;
		}		
		else
		{
			Hero_Thirst = FALSE;
		};	
	};

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 20) / 100);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;

	RestPool = RestPool -  2 ;
	bHour = Wld_GetTimeHour();
	bMinute = Wld_GetTimeMin();
	bHour +=  2 ;
	Wld_SetTime(bHour,bMinute);
	CampfireRest = FALSE;
};

instance PC_HERW_CampfireRest_3H(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_herw_CampfireRest_3H_condition;
	information = pc_herw_CampfireRest_3H_info;
	permanent = 1;
	important = 0;
	description = "...3 часа";
};

func int pc_herw_CampfireRest_3H_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == TRUE) && (RestPool >= 3))
	{
		return TRUE;
	};
};

func void pc_herw_CampfireRest_3H_info()
{
	var int bHour;
	var int bMinute;

	if(SBMODE == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + 3;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
		if(Hero_Hunger > 2)
		{
			Hero_Hunger -= 2;
		}		
		else
		{
			Hero_Hunger = FALSE ;
		};	
		if(Hero_Thirst > 2)
		{
			Hero_Thirst -= 2;
		}		
		else
		{
			Hero_Thirst = FALSE;
		};	
	};

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 30) / 100);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;

	RestPool = RestPool -  3 ;
	bHour = Wld_GetTimeHour();
	bMinute = Wld_GetTimeMin();
	bHour +=  3 ;
	Wld_SetTime(bHour,bMinute);
	CampfireRest = FALSE;
};
