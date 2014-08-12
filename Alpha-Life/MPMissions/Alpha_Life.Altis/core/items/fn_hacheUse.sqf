/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	Modifié par : Linxy
	Description:
	Fonctionement principal de la hache.
*/
closeDialog 0;
private["_coupe","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "bois_1") < 30): {_coupe = "bois"; _val = 1;};
	default {_coupe = "";};
};
//Mine check
if(_coupe == "") exitWith {hint "Vous n'êtes pas dans un bois!"};
if(vehicle player != player) exitWith {hint "Vous ne pouvez pas couper du bois a partir de votre vehicule!";};

_diff = [_coupe,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Votre inventaire est plein."};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_coupe,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_coupe,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Vous avez couper %2 %1",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;