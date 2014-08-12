#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout","_marketprice"];
if((lbCurSel 2401) == -1) exitWith {hint "Vous devez sélectionner un élément à acheter."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
////Marktsystem Anfang////
_marketprice = [_type] call life_fnc_marketGetBuyPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
		////Marktsystem Ende////
if(!([_amount] call fnc_isnumber)) exitWith {hint "Vous n'avez pas entrer de nombre";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "Vous n'avez plus de place pour ceci!"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > life_cash && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint "Vous n'avez pas assez d'argent!"};
if((_price * _amount) > life_cash) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Vous n'avez pas assez d'argent!";};

_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format["Le gang a assez d'argent pour payez ceci, voulez-vous payez ceci avec<br/><br/>Fonds du Gang: <t color='#8cff9b'>%1$</t><br/>Votre Argent: <t color='#8cff9b'>%2$</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[life_cash] call life_fnc_numberText
			],
			"Payer avec votre argent ou l'argent du Gang ?",
			"Fonds du Gang",
			"Mon argent"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format["Vous achetez %1 %2 pour %3$ avec les fonds du Gang.",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
		} else {
			if((_price * _amount) > life_cash) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "You don't have that much money!";};
			hint format["Vous achetez %1 %2 pour %3$",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			__SUB__(life_cash,(_price * _amount));
		};
	} else {
                if((_price * _amount) > life_cash) exitWith {hint "Vous n'avez pas assez d'argent!"; [false,_type,_amount] call life_fnc_handleInv;};
		hint format["Vous achetez %1 %2 pour %3$",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		__SUB__(life_cash,(_price * _amount));
	};
	if(_marketprice != -1) then 
		{ 
			//##94
			[_type, _amount] spawn
			{
				sleep 120;
				[_this select 0,_this select 1] call life_fnc_marketBuy;
			};			
		};
	[] call life_fnc_virt_update;
};
