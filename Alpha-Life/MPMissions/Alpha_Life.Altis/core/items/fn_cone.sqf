/*
	File: fn_cone.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de
	
	Description:
	Creates a cone.
*/
private["_position","_cone"];
_cone = "RoadCone_F" createVehicle [0,0,0];
_cone attachTo[player,[0,5.5,0]];
_cone setDir 90;
_cone setVariable["item","coneDeployed",true];

life_action_coneDeploy = player addAction["Placer Cône",{if(!isNull life_cone) then {detach life_cone; life_cone = ObjNull;}; player removeAction life_action_coneDeploy; life_action_coneDeploy = nil;},"",999,false,false,"",'!isNull life_cone'];
life_cone = _cone;
waitUntil {isNull life_cone};
if(!isNil "life_action_coneDeploy") then {player removeAction life_action_coneDeploy;};
if(isNull _cone) exitWith {life_cone = ObjNull;};
_cone setPos [(getPos _cone select 0),(getPos _cone select 1),0];
_cone setDamage 1;
//life_action__conePickup = player addAction["Ranger Cône",life_fnc_packupCone,"",0,false,false,"",
//' _cone = nearestObjects[getPos player,["RoadCone_F"],8] select 0; !isNil "_cone" && !isNil {(_cone getVariable "item")}'];
[[_cone],"TON_fnc__cone",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.