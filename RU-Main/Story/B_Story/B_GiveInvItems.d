

func int B_GiveInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	var string concatText;
	var string itemName;

	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,itemInstance))
		{
			return  FALSE ;
		};
	};
	if(amount == 0)
	{
		return TRUE;
	};

	Npc_RemoveInvItems(giver,itemInstance,amount);
	CreateInvItems(taker,itemInstance,amount);
	itemname = item.name;

	if(Npc_IsPlayer(giver))
	{
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldGegeben);
			AI_Print(concatText);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_Addon_given);
			AI_Print(concatText);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			AI_Print(concatText);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldErhalten);
			AI_Print(concatText);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_Addon_received);
			AI_Print(concatText);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsErhalten);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			AI_Print(concatText);
		};
	};

	return TRUE;
};

func int B_GiveInvItemsManyThings(var C_Npc giver,var C_Npc taker)
{
	var string concatText;

	if(Npc_IsPlayer(giver))
	{
		concatText = " You gave away some items... " ;
		AI_Print(concatText);
	}
	else if(Npc_IsPlayer(taker))
	{
		concatText = " You received several items... " ;
		AI_Print(concatText);
	};
	return TRUE;
};

