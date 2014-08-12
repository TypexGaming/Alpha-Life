#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls up the menu and creates the gang?
*/
private["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_gangName = ctrlText (getControl(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {hint "Vous ne pouvez pas avoir un nom de gang plus long que 32 caractères."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint "Vous avez des caractères non valides dans le nom de votre gang.";};
if(life_atmcash < (__GETC__(life_gangPrice))) exitWith {hint format["Vous n'avez pas assez d'argent sur votre compte bancaire.\n\nIl vous manques: %1$",[((__GETC__(life_gangPrice))-life_atmcash)] call life_fnc_numberText];};

[[player,getPlayerUID player,_gangName],"TON_fnc_insertGang",false,false] spawn life_fnc_MP;
hint "Envoi d'informations au serveur s'il vous plait patienter .....";
closeDialog 0;
life_action_gangInUse = true;