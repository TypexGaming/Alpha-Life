/*
    File: fn_packupbarrier.sqf
    Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de

    Description:
    Packs up a deployed barrier.
*/
private["_cone"];
_cone = nearestObjects[getPos player,["RoadCone_F"],8] select 0;
if(isNil "_cone") exitWith {};
if(playerSide == civilian) exitWith {};

if(([true,"cone",1] call life_fnc_handleInv)) then
{
    titleText["Vous avez enlevé le cône.","PLAIN"];
    player removeAction life_action_conePickup;
    life_action_conePickup = nil;
    deleteVehicle _cone;
};