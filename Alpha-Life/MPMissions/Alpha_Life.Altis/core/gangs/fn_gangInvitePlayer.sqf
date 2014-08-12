#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint "Vous devez sélectionner une personne à inviter!"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Vous ne pouvez pas vous virer vous même."};
if(!isNil {(group _unit) getVariable "gang_name"}) exitWith {hint "This player is already in a gang"};

if(count(grpPlayer getVariable ["gang_members",8]) == (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint "Votre gang a atteind la limite de personne."};

_action = [
	format["Vous êtes sur le point d'inviter %1 dans votre gang, si il accepte, il auras accès au fond du gang.",_unit getVariable ["realname",name _unit]],
	"Tranferer le lead ?",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
        _members = grpPlayer getVariable "gang_members";
        _members set[count _members,getPlayerUID _unit];
        grpPlayer setVariable["gang_members",_members,true];
	hint format["Vous avez envoyer une invitation pour votre gang a %1",_unit getVariable["realname",name _unit]];
} else {
	hint "Invitation annulée";
};