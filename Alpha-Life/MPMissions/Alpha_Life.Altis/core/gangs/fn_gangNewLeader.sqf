#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint "You need to select a person first!"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "You are already the leader!"};

_action = [
	format["Vous êtes sur le point de transfèrer le lead a %1<br/>Si vous le transfèrer, vous ne contrôlerez plus le gang, sauf si on vous le redonne.",_unit getVariable ["realname",name _unit]],
	"Transferer lead ?",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	_unitID = getPlayerUID _unit;
	if(_unitID == "") exitWith {hint "Bad UID?"}; //Unlikely?
	grpPlayer setVariable["gang_owner",_unitID,true];
	grpPlayer selectLeader _unit;
	[[_unit,grpPlayer],"clientGangLeader",_unit,false] spawn life_fnc_MP; //Boot that bitch!
	[[3,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.
} else {
	hint "Transfert du lead annulé.";
};
[] call life_fnc_gangMenu;