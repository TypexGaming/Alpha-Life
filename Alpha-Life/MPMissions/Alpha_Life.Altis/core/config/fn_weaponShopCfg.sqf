#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Vous n'êtes pas Médecin."};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};
	
	case "cop_cadet":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier!"};
			default
			{
				["Magasin Cadet",
					[
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemGPS",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2500],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["16Rnd_9x21_Mag",nil,50]	
					]
				];
			};
		};
	};
	
	case "cop_officier":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 2): {"Vous n'avez pas le rang d'Officier!"};
			default
			{
				["Magasin Officier",
					[
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemGPS",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2500],
						["HandGrenade_Stone","Flashbang",1700],
						["optic_Holosight",nil,2000],
						["optic_Arco",nil,2000],
						["optic_Aco",nil,1000],
						["optic_Aco_smg",nil,1000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F",nil,4000],
						["30Rnd_9x21_Mag",nil,50],
						["SMG_01_F",nil,4000],
						["30Rnd_45ACP_Mag_SMG_01",nil,50],
						["arifle_SDAR_F",nil,3000],
						["30Rnd_556x45_Stanag",nil,50],
						["30Rnd_65x39_caseless_mag",nil,200],
						["30Rnd_65x39_caseless_mag_Tracer",nil,400]
					]
				];
			};
		};
	};

	case "cop_caporal":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 3): {"Vous n'avez pas le rang de Caporal!"};
			default
			{
				["Magasin Caporal",
					[
						["B_Parachute",nil,100],
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemGPS",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,2000],
						["NVGoggles",nil,2500],
						["HandGrenade_Stone","Flashbang",1700],
						["optic_Holosight",nil,2000],
						["optic_Arco",nil,2000],
						["optic_Aco",nil,1000],
						["optic_Aco_smg",nil,1000],
						["optic_MRCO",nil,3000],
						["acc_flashlight",nil,750],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F",nil,4000],
						["30Rnd_9x21_Mag",nil,50],
						["SMG_01_F",nil,4000],
						["30Rnd_45ACP_Mag_SMG_01",nil,50],
						["arifle_SDAR_F",nil,3000],
						["30Rnd_556x45_Stanag",nil,50],
						["arifle_MX_F",nil,7000],
						["arifle_MXC_F",nil,7000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["30Rnd_65x39_caseless_mag_Tracer",nil,400]
					]
				];
			};
		};
	};
	
	case "cop_sergent":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 4): {"Vous n'avez pas le rang de Sergent!"};
			default
			{
				["Magasin Sergent",
					[
						["B_Parachute",nil,100],
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemGPS",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,2000],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000],
						["Rangefinder",nil,3400],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["optic_Hamr",nil,3000],
						["optic_Holosight",nil,2000],
						["optic_Arco",nil,2000],
						["optic_Aco",nil,1000],
						["optic_Aco_smg",nil,1000],
						["optic_MRCO",nil,3000],
						["acc_flashlight",nil,750],
						["muzzle_snds_H",nil,1000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F",nil,4000],
						["30Rnd_9x21_Mag",nil,50],
						["SMG_01_F",nil,4000],
						["30Rnd_45ACP_Mag_SMG_01",nil,50],
						["arifle_SDAR_F",nil,3000],
						["30Rnd_556x45_Stanag",nil,50],
						["arifle_MX_F",nil,7000],
						["arifle_MXC_F",nil,7500],
						["arifle_MX_SW_F",nil,8000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["30Rnd_65x39_caseless_mag_Tracer",nil,400],
						["100Rnd_65x39_caseless_mag_Tracer",nil,1000]
					]
				];
			};
		};
	};
	
	case "cop_lieutenant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 5): {"Vous n'avez pas le rang de Lieutenant!"};
			default
			{
				["Magasin Lieutenant",
					[
						["B_Parachute",nil,100],
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemGPS",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,2000],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000],
						["Rangefinder",nil,3400],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["optic_Hamr",nil,3000],
						["optic_Holosight",nil,2000],
						["optic_Arco",nil,2000],
						["optic_Aco",nil,1000],
						["optic_Aco_smg",nil,1000],
						["optic_MRCO",nil,3000],
						["acc_flashlight",nil,750],
						["muzzle_snds_H",nil,1000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F",nil,4000],
						["30Rnd_9x21_Mag",nil,50],
						["SMG_01_F",nil,4000],
						["30Rnd_45ACP_Mag_SMG_01",nil,50],
						["arifle_SDAR_F",nil,3000],
						["30Rnd_556x45_Stanag",nil,50],
						["arifle_MX_F",nil,7000],
						["arifle_MXC_F",nil,7500],
						["arifle_MX_SW_F",nil,8000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["30Rnd_65x39_caseless_mag_Tracer",nil,400],
						["100Rnd_65x39_caseless_mag_Tracer",nil,1000],
						["LMG_Mk200_F",nil,15000],
						["200Rnd_65x39_cased_Box_Tracer",nil,2000]
					]
				];
			};
		};
	};
	
	case "cop_capitaine":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 6): {"Vous n'avez pas le rang de Capitaine!"};
			default
			{
				["Magasin Capitaine",
					[
						["B_Parachute",nil,100],
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemGPS",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,2000],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000],
						["Rangefinder",nil,3400],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["optic_Hamr",nil,3000],
						["optic_Holosight",nil,2000],
						["optic_Arco",nil,2000],
						["optic_Aco",nil,1000],
						["optic_Aco_smg",nil,1000],
						["optic_MRCO",nil,3000],
						["optic_LRPS",nil,3000],
						["optic_DMS",nil,3500],
						["optic_SOS",nil,4000],
						["acc_flashlight",nil,750],
						["muzzle_snds_H",nil,1000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F",nil,4000],
						["30Rnd_9x21_Mag",nil,50],
						["SMG_01_F",nil,4000],
						["30Rnd_45ACP_Mag_SMG_01",nil,50],
						["arifle_SDAR_F",nil,3000],
						["30Rnd_556x45_Stanag",nil,50],
						["arifle_MX_F",nil,7000],
						["arifle_MXC_F",nil,7500],
						["arifle_MX_SW_F",nil,8000],
						["arifle_MXM_F",nil,12000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["30Rnd_65x39_caseless_mag_Tracer",nil,400],
						["100Rnd_65x39_caseless_mag_Tracer",nil,1000],
						["LMG_Mk200_F",nil,15000],
						["200Rnd_65x39_cased_Box_Tracer",nil,2000],
						["srifle_LRR_F",nil,20000],
						["7Rnd_408_Mag",nil,1000]
					]
				];
			};
		};
	};
	
	case "cop_chef_adjoint":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 7): {"Vous n'avez pas le rang de Chef Adjoint!"};
			default
			{
				["Magasin Chef Ajoint",
					[
						["B_Parachute",nil,100],
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemGPS",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,2000],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000],
						["Rangefinder",nil,3400],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["optic_Hamr",nil,3000],
						["optic_Holosight",nil,2000],
						["optic_Arco",nil,2000],
						["optic_Aco",nil,1000],
						["optic_Aco_smg",nil,1000],
						["optic_MRCO",nil,3000],
						["optic_LRPS",nil,3000],
						["optic_DMS",nil,3500],
						["optic_SOS",nil,4000],
						["acc_flashlight",nil,750],
						["muzzle_snds_H",nil,1000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F",nil,4000],
						["30Rnd_9x21_Mag",nil,50],
						["SMG_01_F",nil,4000],
						["30Rnd_45ACP_Mag_SMG_01",nil,50],
						["arifle_SDAR_F",nil,3000],
						["30Rnd_556x45_Stanag",nil,50],
						["arifle_MX_F",nil,7000],
						["arifle_MXC_F",nil,7500],
						["arifle_MX_SW_F",nil,8000],
						["arifle_MXM_F",nil,12000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["30Rnd_65x39_caseless_mag_Tracer",nil,400],
						["100Rnd_65x39_caseless_mag_Tracer",nil,1000],
						["LMG_Mk200_F",nil,15000],
						["200Rnd_65x39_cased_Box_Tracer",nil,2000],
						["srifle_LRR_F",nil,20000],
						["7Rnd_408_Mag",nil,1000]
					]
				];
			};
		};
	};
	
	case "cop_chef_police":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 8): {"Vous n'avez pas le rang de Chef de la Police!"};
			default
			{
				["Magasin Chef de Police",
					[
						["B_Parachute",nil,100],
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemGPS",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,2000],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000],
						["Rangefinder",nil,3400],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["optic_Hamr",nil,3000],
						["optic_Holosight",nil,2000],
						["optic_Arco",nil,2000],
						["optic_Aco",nil,1000],
						["optic_Aco_smg",nil,1000],
						["optic_MRCO",nil,3000],
						["optic_LRPS",nil,3000],
						["optic_DMS",nil,3500],
						["optic_SOS",nil,4000],
						["acc_flashlight",nil,750],
						["muzzle_snds_H",nil,1000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["16Rnd_9x21_Mag",nil,50],
						["SMG_02_F",nil,4000],
						["30Rnd_9x21_Mag",nil,50],
						["SMG_01_F",nil,4000],
						["30Rnd_45ACP_Mag_SMG_01",nil,50],
						["arifle_SDAR_F",nil,3000],
						["30Rnd_556x45_Stanag",nil,50],
						["arifle_MX_F",nil,7000],
						["arifle_MXC_F",nil,7500],
						["arifle_MX_SW_F",nil,8000],
						["arifle_MXM_F",nil,12000],
						["30Rnd_65x39_caseless_mag",nil,200],
						["30Rnd_65x39_caseless_mag_Tracer",nil,400],
						["100Rnd_65x39_caseless_mag_Tracer",nil,1000],
						["LMG_Mk200_F",nil,15000],
						["200Rnd_65x39_cased_Box_Tracer",nil,2000],
						["srifle_LRR_F",nil,20000],
						["7Rnd_408_Mag",nil,1000]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas civil!"};
			case (!license_civ_rebel): {"Vous n'avez pas la licence Rebelle!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["hgun_Rook40_F",nil,19500],
						["hgun_ACPC2_F",nil,30000],
						["hgun_PDW2000_F",nil,35000],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75],
						["SMG_01_F",nil,40000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["arifle_TRG20_F",nil,60000],
						["arifle_TRG21_F",nil,60000],
						["arifle_Mk20_F",nil,75000],
						["30Rnd_556x45_Stanag",nil,700],
						["arifle_Katiba_F",nil,90000],
						["30Rnd_65x39_caseless_green",nil,750],
						["LMG_Zafir_F",nil,350000],
						["150Rnd_762x51_Box",nil,30000],
						["srifle_DMR_01_F",nil,120000],
						["10Rnd_762x51_Mag",nil,15000],
						["srifle_EBR_F",nil,135000],
						["20Rnd_762x51_Mag",nil,1000],
						["srifle_LRR_F",nil,900000],
						["7Rnd_408_Mag",nil,10000],
						["launch_RPG32_F",nil,700000],
						["HandGrenade",nil,25000],
						["SmokeShell",nil,3000],
						["optic_LRPS",nil,5000],
						["optic_DMS",nil,5000],
						["optic_SOS",nil,10000],
						["optic_Holosight",nil,3000],
						["optic_Hamr",nil,3000],
						["optic_Arco",nil,3000],
						["optic_MRCO",nil,4500],
						["optic_Aco",nil,3000],
						["optic_ACO_grn_smg",nil,3000],
						["acc_flashlight",nil,3000],
						["NVGoggles_INDEP",nil,3000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas Civil!"};
			case (!license_civ_gun): {"Vous n'avez pas le permis d'arme!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,7500],
						["hgun_ACPC2_F",nil,10500],
						["hgun_PDW2000_F",nil,35000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75],
						["arifle_SDAR_F",nil,13000],
						["30Rnd_556x45_Stanag",nil,150],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas Civil!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,7500],
						["hgun_ACPC2_F",nil,10500],
						["hgun_PDW2000_F",nil,35000],
						["optic_ACO_grn_smg",nil,1500],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75],
						["RPG32_HE_F",nil,100000],
						["NVGoggles",nil,2500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["ItemMap",nil,50],
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"Vous n'êtes pas Donateur!"};
			case (__GETC__(life_donator) == 1):
			{
				["Magasin Donateur Rang 1",
					[
						["hgun_Pistol_heavy_02_F",nil,17000],
						["optic_Yorris",nil,1000],
						["6Rnd_45ACP_Cylinder",nil,400],
						["hgun_Rook40_F",nil,6750],
						["hgun_ACPC2_F",nil,9450],
						["hgun_PDW2000_F",nil,31500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75],
						["SMG_01_F",nil,36000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["arifle_TRG20_F",nil,54000],
						["arifle_TRG21_F",nil,54000],
						["arifle_Mk20_F",nil,67500],
						["30Rnd_556x45_Stanag",nil,700],
						["arifle_Katiba_F",nil,81000],
						["30Rnd_65x39_caseless_green",nil,750],
						["LMG_Zafir_F",nil,315000],
						["150Rnd_762x51_Box",nil,27000],
						["srifle_DMR_01_F",nil,108000],
						["10Rnd_762x51_Mag",nil,13500],
						["srifle_EBR_F",nil,135000],
						["20Rnd_762x51_Mag",nil,900],
						["srifle_LRR_F",nil,810000],
						["7Rnd_408_Mag",nil,9000],
						["launch_RPG32_F",nil,630000],
						["RPG32_HE_F",nil,90000],
						["HandGrenade",nil,22500],
						["SmokeShell",nil,2700],
						["optic_LRPS",nil,4500],
						["optic_DMS",nil,4500],
						["optic_SOS",nil,9000],
						["optic_Holosight",nil,2700],
						["optic_Hamr",nil,2700],
						["optic_Arco",nil,2700],
						["optic_MRCO",nil,4050],
						["optic_Aco",nil,2700],
						["optic_ACO_grn_smg",nil,2700],
						["acc_flashlight",nil,2700],
						["NVGoggles_INDEP",nil,2700],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
			
	case "uranium":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Tu n'es pas civil!"};
			case (!license_civ_uranium): {"Tu n'as pas la formation Uranium!"};
			default
			{
				["Objet Traitement Uranium",
					[
						["ToolKit",nil,200],
						["FirstAidKit",nil,100],
						["U_C_Scientist","Combinaison Antiradiation",100000]
					]
				];
			};
		};
	};

			case (__GETC__(life_donator) == 2):
			{
				["Magasin Donateur Rang 2",
					[
						["hgun_Pistol_heavy_02_F",nil,17000],
						["optic_Yorris",nil,1000],
						["6Rnd_45ACP_Cylinder",nil,400],
						["hgun_Rook40_F",nil,6750],
						["hgun_ACPC2_F",nil,9450],
						["hgun_PDW2000_F",nil,31500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75],
						["SMG_01_F",nil,36000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["arifle_TRG20_F",nil,51000],
						["arifle_TRG21_F",nil,51000],
						["arifle_Mk20_F",nil,63750],
						["30Rnd_556x45_Stanag",nil,700],
						["arifle_Katiba_F",nil,76500],
						["30Rnd_65x39_caseless_green",nil,750],
						["LMG_Zafir_F",nil,300000],
						["150Rnd_762x51_Box",nil,24000],
						["srifle_DMR_01_F",nil,100000],
						["10Rnd_762x51_Mag",nil,10500],
						["srifle_EBR_F",nil,114750],
						["20Rnd_762x51_Mag",nil,900],
						["srifle_LRR_F",nil,780000],
						["7Rnd_408_Mag",nil,8000],
						["launch_RPG32_F",nil,595000],
						["RPG32_HE_F",nil,85000],
						["HandGrenade",nil,20500],
						["SmokeShell",nil,2500],
						["optic_LRPS",nil,4000],
						["optic_DMS",nil,4000],
						["optic_SOS",nil,7500],
						["optic_Holosight",nil,2500],
						["optic_Hamr",nil,2500],
						["optic_Arco",nil,2500],
						["optic_MRCO",nil,3750],
						["optic_Aco",nil,2500],
						["optic_ACO_grn_smg",nil,2500],
						["acc_flashlight",nil,2500],
						["NVGoggles_INDEP",nil,2500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};

			case (__GETC__(life_donator) == 3):
			{
				["Magasin Donateur Rang 3",
					[
						["hgun_Pistol_heavy_02_F",nil,15000],
						["optic_Yorris",nil,8000],
						["6Rnd_45ACP_Cylinder",nil,400],
						["hgun_Rook40_F",nil,5750],
						["hgun_ACPC2_F",nil,8450],
						["hgun_PDW2000_F",nil,28500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75],
						["SMG_01_F",nil,34000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["arifle_TRG20_F",nil,48000],
						["arifle_TRG21_F",nil,48000],
						["arifle_Mk20_F",nil,60750],
						["30Rnd_556x45_Stanag",nil,700],
						["arifle_Katiba_F",nil,72500],
						["30Rnd_65x39_caseless_green",nil,750],
						["LMG_Zafir_F",nil,285000],
						["150Rnd_762x51_Box",nil,20000],
						["srifle_DMR_01_F",nil,80000],
						["10Rnd_762x51_Mag",nil,9500],
						["srifle_EBR_F",nil,108750],
						["20Rnd_762x51_Mag",nil,900],
						["srifle_LRR_F",nil,740000],
						["7Rnd_408_Mag",nil,7000],
						["launch_RPG32_F",nil,560000],
						["RPG32_HE_F",nil,80000],
						["HandGrenade",nil,18500],
						["SmokeShell",nil,2300],
						["optic_LRPS",nil,3500],
						["optic_DMS",nil,3500],
						["optic_SOS",nil,6750],
						["optic_Holosight",nil,2300],
						["optic_Hamr",nil,2300],
						["optic_Arco",nil,2300],
						["optic_MRCO",nil,3250],
						["optic_Aco",nil,2300],
						["optic_ACO_grn_smg",nil,2300],
						["acc_flashlight",nil,2300],
						["NVGoggles_INDEP",nil,2300],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
			
			case (__GETC__(life_donator) == 4):
			{
				["Magasin Donateur Rang 4",
					[
						["hgun_Pistol_heavy_02_F",nil,15000],
						["optic_Yorris",nil,8000],
						["6Rnd_45ACP_Cylinder",nil,400],
						["hgun_Rook40_F",nil,5750],
						["hgun_ACPC2_F",nil,8450],
						["hgun_PDW2000_F",nil,28500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75],
						["SMG_01_F",nil,34000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["arifle_TRG20_F",nil,48000],
						["arifle_TRG21_F",nil,48000],
						["arifle_Mk20_F",nil,60750],
						["30Rnd_556x45_Stanag",nil,700],
						["arifle_Katiba_F",nil,72500],
						["30Rnd_65x39_caseless_green",nil,750],
						["LMG_Zafir_F",nil,285000],
						["150Rnd_762x51_Box",nil,20000],
						["srifle_DMR_01_F",nil,80000],
						["10Rnd_762x51_Mag",nil,9500],
						["srifle_EBR_F",nil,108750],
						["20Rnd_762x51_Mag",nil,900],
						["srifle_LRR_F",nil,740000],
						["7Rnd_408_Mag",nil,7000],
						["launch_RPG32_F",nil,560000],
						["RPG32_HE_F",nil,80000],
						["HandGrenade",nil,18500],
						["SmokeShell",nil,2300],
						["optic_LRPS",nil,3500],
						["optic_DMS",nil,3500],
						["optic_SOS",nil,6750],
						["optic_Holosight",nil,2300],
						["optic_Hamr",nil,2300],
						["optic_Arco",nil,2300],
						["optic_MRCO",nil,3250],
						["optic_Aco",nil,2300],
						["optic_ACO_grn_smg",nil,2300],
						["acc_flashlight",nil,2300],
						["NVGoggles_INDEP",nil,2300],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]	
					]
				];
			};
			
			case (__GETC__(life_donator) == 5):
			{
				["Magasin Donateur Rang 5",
					[
						["hgun_Pistol_heavy_02_F",nil,7000],
						["optic_Yorris",nil,500],
						["6Rnd_45ACP_Cylinder",nil,200],
						["hgun_Rook40_F",nil,4750],
						["hgun_ACPC2_F",nil,5450],
						["hgun_PDW2000_F",nil,15500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75],
						["SMG_01_F",nil,20000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["arifle_TRG20_F",nil,34000],
						["arifle_TRG21_F",nil,34000],
						["arifle_Mk20_F",nil,37500],
						["30Rnd_556x45_Stanag",nil,700],
						["arifle_Katiba_F",nil,41000],
						["30Rnd_65x39_caseless_green",nil,750],
						["LMG_Zafir_F",nil,165000],
						["150Rnd_762x51_Box",nil,17000],
						["srifle_DMR_01_F",nil,70000],
						["10Rnd_762x51_Mag",nil,7500],
						["srifle_EBR_F",nil,70000],
						["20Rnd_762x51_Mag",nil,900],
						["srifle_LRR_F",nil,510000],
						["7Rnd_408_Mag",nil,9000],
						["launch_RPG32_F",nil,400000],
						["RPG32_HE_F",nil,50000],
						["HandGrenade",nil,10500],
						["SmokeShell",nil,1700],
						["optic_LRPS",nil,2500],
						["optic_DMS",nil,2500],
						["optic_SOS",nil,4000],
						["optic_Holosight",nil,1700],
						["optic_Hamr",nil,1700],
						["optic_Arco",nil,1700],
						["optic_MRCO",nil,2050],
						["optic_Aco",nil,1700],
						["optic_ACO_grn_smg",nil,1700],
						["acc_flashlight",nil,1700],
						["NVGoggles_INDEP",nil,1700],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
};
