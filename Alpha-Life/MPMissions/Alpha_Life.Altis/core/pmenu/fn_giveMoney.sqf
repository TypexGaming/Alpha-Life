/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Personne n'a été sélectionné!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Vous avez récemment volé la banque! Vous ne pouvez pas donner de l'argent pour l'instant.";ctrlShow[2001,true];};
if(!([_amount] call fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Vous devez entrer un montant réel que vous voulez donner.";ctrlShow[2001,true];};
if(parseNumber(_amount) > life_cash) exitWith {hint "You don't have that much to give!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Le joueur sélectionné est hors de portée";};
hint format["Vous avez donné %1$ to %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
life_cash = life_cash - (parseNumber(_amount));
[] call SOCK_fnc_updateRequest;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];