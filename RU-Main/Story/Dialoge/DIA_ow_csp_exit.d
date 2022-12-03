

instance DIA_OW_CSP_EXIT(C_Info)
{
	nr = 999;
	condition = dia_ow_csp_exit_condition;
	information = dia_ow_csp_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_ow_csp_exit_condition()
{
	return TRUE;
};

func void dia_ow_csp_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OW_CSP_PEOPLE(C_Info)
{
	nr = 3;
	condition = dia_ow_csp_people_condition;
	information = dia_ow_csp_people_info;
	permanent = TRUE;
	description = " Who is your commander? " ;
};


func int dia_ow_csp_people_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_ow_csp_people_info()
{
	AI_Output(other,self, " DIA_OW_CSP_People_15_00 " );	// Who is your commander?
	AI_Output(self,other, " DIA_OW_CSP_People_04_01 " );	// Our squad is now led by paladin Albert.
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") > 1000)
	{
		AI_Output(self,other, " DIA_OW_CSP_People_04_02 " );	// You will find him deep in this cave.
	}
	else
	{
		AI_Output(self,other, " DIA_OW_CSP_People_04_03 " );	// You'll find him in the cave where we camped.
	};
};


instance DIA_OW_CSP_LOCATION(C_Info)
{
	nr = 2;
	condition = dia_ow_csp_location_condition;
	information = dia_ow_csp_location_info;
	permanent = TRUE;
	description = " What can you tell us about the area? " ;
};


func int dia_ow_csp_location_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_ow_csp_location_info()
{
	AI_Output(other,self, " DIA_OW_CSP_Location_15_00 " );	// What can you tell us about the area?
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") > 1000)
	{
		AI_Output(self,other, " DIA_OW_CSP_Location_04_01 " );	// Above us is a camp of former convicts.
		AI_Output(self,other, " DIA_OW_CSP_Location_04_02 " );	// Although they do not revere Innos, they can still be dealt with.
		AI_Output(self,other, " DIA_OW_CSP_Location_04_03 " );	// Across the river is a rather dangerous forest, but there are no orcs in it.
		AI_Output(self,other, " DIA_OW_CSP_Location_04_04 " );	// They're all down on the coast - they kind of have a camp there.
	}
	else
	{
		AI_Output(self,other, " DIA_OW_CSP_Location_04_05 " );	// In the east behind the fence - orcs. It is also dangerous in the west - there are trolls, a lot of bloodthirsty creatures!
		AI_Output(self,other, " DIA_OW_CSP_Location_04_06 " );	// In the south there is a passage behind the fence - it is also guarded by orcs.
		AI_Output(self,other, " DIA_OW_CSP_Location_04_07 " );	// And in the north in the rock is the cave in which our group is located.
		AI_Output(self,other, " DIA_OW_CSP_Location_04_08 " );	// You can always find protection there.
	};
};


instance DIA_OW_CSP_LOCATION2(C_Info)
{
	nr = 2;
	condition = dia_ow_csp_location2_condition;
	information = dia_ow_csp_location2_info;
	permanent = TRUE;
	description = " What can you tell us about the area? " ;
};


func int dia_ow_csp_location2_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_ow_csp_location2_info()
{
	AI_Output(other,self, " DIA_OW_CSP_Location2_15_00 " );	// What can you tell us about the area?
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") > 1000)
	{
		AI_Output(self,other, " DIA_OW_CSP_Location2_04_01 " );	// Above us is a camp of former convicts.
		AI_Output(self,other, " DIA_OW_CSP_Location2_04_02 " );	// Across the river is a rather dangerous forest, but there are no orcs there.
		AI_Output(self,other, " DIA_OW_CSP_Location2_04_03 " );	// They're all down on the coast - they kind of have a camp there.
	}
	else
	{
		AI_Output(self,other, " DIA_OW_CSP_Location2_04_05 " );	// In the east, behind the fence - orcs. It is also dangerous in the west - there are trolls, a lot of bloodthirsty creatures!
		AI_Output(self,other, " DIA_OW_CSP_Location2_04_06 " );	// In the south there is a passage behind the fence - it is also guarded by orcs.
		AI_Output(self,other, " DIA_OW_CSP_Location2_04_07 " );	// And in the north in the rock is the cave in which our group is located.
		AI_Output(self,other, " DIA_OW_CSP_Location2_04_08 " );	// You can always find protection there.
	};
};


instance DIA_OW_CSP_STANDARD(C_Info)
{
	nr = 1;
	condition = dia_ow_csp_standard_condition;
	information = dia_ow_csp_standard_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_ow_csp_standard_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_ow_csp_standard_info()
{
	AI_Output(other,self, " DIA_OW_CSP_Standard_15_00 " );	// How setting?
	if (chapter <=  3 )
	{
		AI_Output(self,other, " DIA_OW_CSP_Standard_04_01 " );	// All is quiet for now! But our thoughts are now with those who remained in the fortress.
	};
	if (chapter ==  4 )
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other, " DIA_OW_CSP_Standard_04_02 " );	// Dragons have almost stopped flying here, but there are even more orcs.
		}
		else
		{
			AI_Output(self,other, " DIA_OW_CSP_Standard_04_05 " );	// Now those fire-breathing beasts will no longer threaten the castle! This is good news.
		};
	};
	if (Chapter >=  5 )
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other, " DIA_OW_CSP_Standard_04_06 " );	// The orcs don't seem to be too impressed by the death of the dragons.
		}
		else
		{
			AI_Output(self,other, " DIA_OW_CSP_Standard_04_07 " );	// For some reason, I became especially anxious for the paladins in the castle.
		};
	};
};


instance DIA_OW_CSP_SEAPOST(C_Info)
{
	nr = 1;
	condition = dia_ow_csp_seapost_condition;
	information = dia_ow_csp_seapost_info;
	permanent = TRUE;
	description = " What are you doing here? " ;
};


func int dia_ow_csp_seapost_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") < 1000)
	{
		return TRUE;
	};
};

func void dia_ow_csp_seapost_info()
{
	AI_Output(other,self, " DIA_OW_CSP_SeaPost_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_OW_CSP_SeaPost_04_01 " );	// But they seem to be the least interested in us right now.
};

func void b_assignambientinfos_csp(var C_Npc slf)
{
	dia_ow_csp_exit.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_people.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_location.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_standard.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_seapost.npc = Hlp_GetInstanceID(slf);
};

