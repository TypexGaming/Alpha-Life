/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 10500;};
if(!isNil "life_canpay_bail") exitWith {hint "Vous devez attendre au moins 3 minutes en prison avant de payer une caution."};
if(life_atmcash < life_bail_amount) exitWith {hint format["Vous n'avez pas 1%$ sur votre compte en banque pour payer la caution.",life_bail_amount];};

life_atmcash = life_atmcash - life_bail_amount;
life_bail_paid = true;
[[0,format["%1 a payé sa caution!", _unit getVariable ["realname",name _unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;