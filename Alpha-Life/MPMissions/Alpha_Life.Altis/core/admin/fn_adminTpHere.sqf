#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_Admin_Error";};

_unit setPos (getPos player);
hint format["Vous avez téléporter %1 sur votre position",_unit getVariable["realname",name _unit]];