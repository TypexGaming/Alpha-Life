#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end", "_donatorlevel"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in [])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

// Set donor pay check increase
switch (__GETC__(life_donator)) do 
			{
				case 1: { _donatorlevel = 1500; }; //Level 1
				case 2: { _donatorlevel = 2500; }; //Level 2
				case 3: { _donatorlevel = 3500; }; //Level 3
				case 4: { _donatorlevel = 4500; }; //Level 4
				case 5: { _donatorlevel = 5500; }; //Level 5
				default { _donatorlevel = 0; }; //default for non donators they get nada!
			};

// Set Paycheck for Police
switch (__GETC__(life_coplevel)) do 
			{
				case 1: { life_paycheck = ((1500) + (_donatorlevel)); }; //Cadet
				case 2: { life_paycheck = ((2000) + (_donatorlevel)); }; //Officer
				case 3: { life_paycheck = ((2500) + (_donatorlevel)); }; //Caporall
				case 4: { life_paycheck = ((3000) + (_donatorlevel)); }; //Sergent
				case 5: { life_paycheck = ((3500) + (_donatorlevel)); }; //Lt
				case 6: { life_paycheck = ((4000) + (_donatorlevel)); }; //Captain
				case 7: { life_paycheck = ((4500) + (_donatorlevel)); }; //chef adjoint
				case 8: { life_paycheck = ((5000) + (_donatorlevel)); }; //chef police
				default { life_paycheck = ((1500) + (_donatorlevel)); }; //default in-case anything goes tits up
			};

//Show Ranks
player setVariable["coplevel", __GETC__(life_coplevel), true];
player setVariable["mediclevel", __GETC__(life_medicLevel), true];
player setVariable["adminlevel", __GETC__(life_adminlevel), true];

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn
{
while {(uniform player) == "U_Rangemaster"} do
    {
	switch (__GETC__(life_coplevel)) do 
		{
			case 1: {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_shirt.paa"];
			};
			
			case 2: {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_shirt.paa"];
			};
			
			case 3: {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_shirt.paa"];
			};
			
			case 4: {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_shirt.paa"];
			};
			
			case 5: {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_uniform.paa"];
			};
			
			case 6: {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_uniform.paa"];
			};
			
			case 7: {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_uniform.paa"];
			};
			
			case 8: {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_uniform.paa"];
			};
			
			case 9: {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_uniform.paa"];
			};
			
			default {
			player setObjectTextureGlobal [0,"textures\cloth_cop\police_shirt.paa"];
			};
		};
    if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
    sleep 30;
    };
};