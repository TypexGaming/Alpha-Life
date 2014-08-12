/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.

if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(life_cash < life_ticket_val) exitWith
{
	if(life_atmcash < life_ticket_val) exitWith 
	{
		hint "Vous n'avez pas assez d'argent dans votre banque ou sur vous pour payer l'amende.";
		[[1,format["%1 ne peut pas payer l'amende car il n'a pas assez d'argent.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
		closeDialog 0;
	};
	hint format["Vous avez payé votre amende de %1$",[life_ticket_val] call life_fnc_numberText];
	life_atmcash = life_atmcash - life_ticket_val;
	life_ticket_paid = true;
	[[0,format["%1 a payé l'amende de %2$",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	closeDialog 0;
};

life_cash = life_cash - life_ticket_val;
life_ticket_paid = true;

[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
[[0,format["%1 a payé l'amende de %2$",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
closeDialog 0;
[[1,format["%1 a payé l'amende.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
[[[life_ticket_val],{life_atmcash = life_atmcash + (_this select 0);}],"BIS_fnc_call",life_ticket_cop,false] spawn life_fnc_MP;*/
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pays the ticket.
*/
/*
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(life_cash < life_ticket_val) exitWith
{
	if(life_atmcash < life_ticket_val) exitWith 
	{
		hint "Vous n'avez pas assez d'argent dans votre banque ou sur vous pour payer l'amende.";
		[[1,format["%1 ne peut pas payer l'amende car il n'a pas assez d'argent.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
		closeDialog 0;
	};
	hint format["Vous avez payé votre amende de %1$",[life_ticket_val] call life_fnc_numberText];
	life_atmcash = life_atmcash - life_ticket_val;
	life_ticket_paid = true;
	[[0,format["%1 a payé l'amende de %2$",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	closeDialog 0;
	[[1,format["%1 a payé l'amende.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	[[[life_ticket_val],{life_atmcash = life_atmcash + (_this select 0);}],"BIS_fnc_call",life_ticket_cop,false] spawn life_fnc_MP;
};

life_cash = life_cash - life_ticket_val;
life_ticket_paid = true;


[[0,format["%1 a payé l'amende de %2$",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
closeDialog 0;
[[1,format["%1 a payé l'amende.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
[[[life_ticket_val],{life_atmcash = life_atmcash + (_this select 0);}],"BIS_fnc_call",life_ticket_cop,false] spawn life_fnc_MP;*/

/*
File: fn_ticketPay.sqf
Author: Marco Rieger "ins0"
Description:
Handle the PayTicket processing. Remove the Player from the Wanted List and give the Cop a Promo
*/
private["_promoValue"];
if(isNil {life_ticket_val} || isNil {life_ticket_cop}) exitWith {};
if((life_atmcash < life_ticket_val) && (life_cash < life_ticket_val)) exitWith
{
// cant pay the ticket
hint "Vous n'avez pas assez d'argent dans votre banque ou sur vous pour payer l'amende.";
[[1,format["%1 ne peut pas payer l'amende car il n'a pas assez d'argent.",name player]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
closeDialog 0;
};
if(life_atmcash >= life_ticket_val) then
{
// pay from atm
life_atmcash = life_atmcash - life_ticket_val;
} else {
// pay from pocket
life_cash = life_cash - life_ticket_val;
};
// ticket paid
life_ticket_paid = true;
// remove from wanted
[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
// broadcast message
[[0,format["%1 a payé l'amende de %2$",name player,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
closeDialog 0;
// info to cop
[[1,format["%1 a payé l'amende.",name player]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
// give cop percent ticket val
if(call(life_cop_ticket_promo)) then
{
_promoValue = ceil(((_this select 0)/100)*(call life_cop_ticket_percent));
[[1,format["Bon travail! vous avez eu %1$ de promotion!", _promoValue]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
[[[life_ticket_val],{life_atmcash = life_atmcash + _promoValue;}],"BIS_fnc_call",life_ticket_cop,false] spawn life_fnc_MP;
}