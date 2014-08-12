#include <macro.h>
/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Edited by: [noLife]casp0or
	
	Description:
	Master configuration file for Donator Clothing Store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Donator Clothing Store"];
_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(__GETC__(life_donator) > 1) then 
		{
		_ret set[count _ret,["U_C_Poloshirt_blue","Poloshirt Blue",250]];
		_ret set[count _ret,["U_C_Poloshirt_burgundy","Poloshirt Burgundy",275]];
		_ret set[count _ret,["U_C_Poloshirt_redwhite","Poloshirt Red/White",150]];
		_ret set[count _ret,["U_C_Poloshirt_salmon","Poloshirt Salmon",175]];
		_ret set[count _ret,["U_C_Poloshirt_stripped","Poloshirt stripped",125]];
		_ret set[count _ret,["U_C_Poloshirt_tricolour","Poloshirt Tricolor",350]];
		_ret set[count _ret,["U_C_Poor_2","Rag tagged clothes",250]];
		_ret set[count _ret,["U_IG_Guerilla2_2","Green stripped shirt & Pants",650]];
		_ret set[count _ret,["U_IG_Guerilla3_1","Brown Jacket & Pants",735]];
		_ret set[count _ret,["U_IG_Guerilla2_3","The Outback Rangler",1200]];
		_ret set[count _ret,["U_C_HunterBody_grn","The Hunters Look",1500]];
		_ret set[count _ret,["U_C_WorkerCoveralls","Mechanic Coveralls",2500]];
		_ret set[count _ret,["U_OrestesBody","Surfing On Land",1100]];
		_ret set[count _ret,["U_B_Protagonist_VR","V.R. Suit Blue",5000]];
		_ret set[count _ret,["U_O_Protagonist_VR","V.R. Suit Red",5000]];
		_ret set[count _ret,["U_I_Protagonist_VR","V.R. Suit Green",5000]];
		};
	};
	
	//Hats
	case 1:
	{
			if(__GETC__(life_donator) > 1) then 
			{
			_ret set[count _ret,["H_Bandanna_camo","Camo Bandanna",120]];
			_ret set[count _ret,["H_Bandanna_surfer","Surfer Bandanna",130]];
			_ret set[count _ret,["H_Bandanna_gry","Grey Bandanna",150]];
			_ret set[count _ret,["H_Bandanna_cbr",nil,165]];
			_ret set[count _ret,["H_Bandanna_surfer",nil,135]];
			_ret set[count _ret,["H_Bandanna_khk","Khaki Bandanna",145]];
			_ret set[count _ret,["H_Bandanna_sgg","Sage Bandanna",160]];
			_ret set[count _ret,["H_StrawHat","Straw Fedora",225]];
			_ret set[count _ret,["H_BandMask_blk","Hat & Bandanna",300]];
			_ret set[count _ret,["H_Booniehat_tan",nil,425]];
			_ret set[count _ret,["H_Hat_blue",nil,310]];
			_ret set[count _ret,["H_Hat_brown",nil,276]];
			_ret set[count _ret,["H_Hat_checker",nil,340]];
			_ret set[count _ret,["H_Hat_grey",nil,280]];
			_ret set[count _ret,["H_Hat_tan",nil,265]];
			_ret set[count _ret,["H_Cap_blu",nil,150]];
			_ret set[count _ret,["H_Cap_grn",nil,150]];
			_ret set[count _ret,["H_Cap_grn_BI",nil,150]];
			_ret set[count _ret,["H_Cap_oli",nil,150]];
			_ret set[count _ret,["H_Cap_red",nil,150]];
			_ret set[count _ret,["H_Cap_tan",nil,150]];
			};
	};
	
	//Glasses
	case 2:
	{
			if(__GETC__(life_donator) > 1) then 
			{
			_ret set[count _ret,["G_Shades_Black",nil,25]];
			_ret set[count _ret,["G_Shades_Blue",nil,20]];
			_ret set[count _ret,["G_Sport_Blackred",nil,20]];
			_ret set[count _ret,["G_Sport_Checkered",nil,20]];
			_ret set[count _ret,["G_Sport_Blackyellow",nil,20]];
			_ret set[count _ret,["G_Sport_BlackWhite",nil,20]];
			_ret set[count _ret,["G_Squares",nil,10]];
			_ret set[count _ret,["G_Aviator",nil,100]];
			_ret set[count _ret,["G_Lady_Mirror",nil,150]];
			_ret set[count _ret,["G_Lady_Dark",nil,150]];
			_ret set[count _ret,["G_Lady_Blue",nil,150]];
			_ret set[count _ret,["G_Lowprofile",nil,30]];
			_ret set[count _ret,["G_Combat",nil,55]];
			_ret set[count _ret,["G_Balaclava_blk",nil,55]];
			_ret set[count _ret,["G_Balaclava_lowprofile",nil,55]];
			_ret set[count _ret,["G_Balaclava_combat",nil,55]];
			_ret set[count _ret,["G_Balaclava_oli",nil,55]];
			_ret set[count _ret,["G_Bandanna_aviator",nil,55]];
			_ret set[count _ret,["G_Bandanna_tan",nil,55]];
			_ret set[count _ret,["G_Bandanna_sport",nil,55]];
			_ret set[count _ret,["G_Bandanna_blk",nil,55]];
			_ret set[count _ret,["G_Bandanna_oli",nil,55]];
			_ret set[count _ret,["G_Goggles_VR",nil,55]];
			};
	};
	
	//Vest
	case 3:
	{

		if(__GETC__(life_donator) > 1) then 
		{
		_ret set[count _ret,["V_HarnessOGL_gry","Bombe",2000000]];
		};
	};
	
	//Backpacks
	case 4:
	{
			if(__GETC__(life_donator) > 1) then 
			{
			_ret set[count _ret,["B_AssaultPack_cbr",nil,2500]];
			_ret set[count _ret,["B_Kitbag_mcamo",nil,4500]];
			_ret set[count _ret,["B_TacticalPack_oli",nil,3500]];
			_ret set[count _ret,["B_FieldPack_ocamo",nil,3000]];
			_ret set[count _ret,["B_Bergen_sgg",nil,4500]];
			_ret set[count _ret,["B_Kitbag_cbr",nil,4500]];
			_ret set[count _ret,["B_Carryall_oli",nil,5000]];
			_ret set[count _ret,["B_Carryall_khk",nil,5000]];
			_ret set[count _ret,["B_Parachute",nil,15000]];
			};
	};
};

_ret;