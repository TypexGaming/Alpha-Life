/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	Modifié par : Linxy
	Description:
	Fonctionement principal de la hache.
*/
closeDialog 0;
private["_creuse","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "pdt_1") < 30): {_creuse = "pommedeterre"; _val = 1;};
	default {_creuse = "";};
};
//Mine check
if(_creuse == "") exitWith {hint "Vous n'êtes pas sur un champ de pomme de terre!"};
if(vehicle player != player) exitWith {hint "Vous ne pouvez pas ramassé des pommes de terre a partir de votre véhicule!";};

_diff = [_creuse,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Votre inventaire est plein."};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_creuse,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_creuse,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Vous avez ramassé %2 %1",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;