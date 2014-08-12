/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint "L'amende est nul"};
if(isNull life_ticket_unit) exitWith {hint "La personne donnant le ticket n'existe pas."};
_val = ctrlText 2652;
if(!([_val] call fnc_isnumber)) exitWith {hint "Vous n'avez pas saisis un nombre."};
if((parseNumber _val) > 100000) exitWith {hint "L'amende ne peut pas excéder 100,000$!"};
[[0,format["%1 a mis une amende de %2$ à %3",profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,(parseNumber _val)],"life_fnc_ticketPrompt",life_ticket_unit,false] spawn life_fnc_MP;
closeDialog 0;