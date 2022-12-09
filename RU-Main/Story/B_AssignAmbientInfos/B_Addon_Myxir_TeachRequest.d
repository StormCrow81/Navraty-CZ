

func void B_DIA_Addon_Myxir_TeachRequest()
{
	AI_Output(other,self, " DIA_Addon_Myxir_TeachRequest_15_00 " );	// Teach me this language.
};

func void B_DIA_Addon_Myxir_TeachL1()
{
	AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_00 " );	// Well, let's start with something simple. Let us first deal with the language of the peasants.
	AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_01 " );	// As a rule, texts written in the language of peasants are connected with our world, with such concepts as work, love, food production.
	AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_02 " );	// This is the main language of the city. You can read most of the texts you find here if you master it.
};

func void B_DIA_Addon_Myxir_TeachL2()
{
	AI_Output(self,other, " DIA_Addon_Myxir_TeachL2_12_00 " );	// You are already familiar with the language of the peasants. The language of the warriors is a bit more complex.
	AI_Output(self,other, " DIA_Addon_Myxir_TeachL2_12_01 " );	// Texts written in the language of warriors mainly deal with wars and weapons. You will learn something useful.
};

func void B_DIA_Addon_Myxir_TeachL3()
{
	AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_00 " );	// The high calm of the priests is hard to understand. But I'll gladly teach it to you.
	AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_01 " );	// Among other things, the sacred books that describe the history and magic of the creators are written in the language of the priests.
	AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_02 " );	// Each of these texts is a real treasure, if, of course, you can understand it.
};

func void B_DIA_Addon_Myxir_TeachNoMore()
{
	AI_Output(self,other, " DIA_Addon_Myxir_TeachNoMore_12_00 " );	// I have nothing more to show you. You have learned the language of architects.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X()
{
	AI_Output(self,other, " DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00 " );	// Go and try out your new knowledge. You will see that the sacred books of the architects are no longer a secret to you.
};

