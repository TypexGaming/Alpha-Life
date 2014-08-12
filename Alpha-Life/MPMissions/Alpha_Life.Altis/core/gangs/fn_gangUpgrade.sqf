#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Determinds the upgrade price and blah
*/
private["_maxMembers","_slotUpgrade","_upgradePrice"];
_maxMembers = grpPlayer getVariable ["gang_maxMembers",8];
_slotUpgrade = _maxMembers + 4;
_upgradePrice = round(_slotUpgrade * (__GETC__(life_gangUpgradeBase)) / (__GETC__(life_gangUpgradeMultipler)));

_action = [
	format["Vous êtes sur le point de mettre à niveau le nombre maximale autorisées pour votre gang.<br/><br/>Actuellement: %1<br/>Upgraded Max: %2<br/>Prix: <t color='#8cff9b'>%3$</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText],
	"Mise à niveau maximum admis de membres de gangs",
	"Acheter",
	"Annuler"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_atmcash < _upgradePrice) exitWith {
		hint parseText format[
			"Vous n'avez pas assez d'argent sur votre compte en banque pour mettre à niveau le nombre limite de membre maximale.<br/><br/>Actuellement: <t color='#8cff9b'>%1$</t><br/>Manquant: <t color='#FF0000'>%2$</t>",
			[life_atmcash] call life_fnc_numberText,
			[_upgradePrice - life_atmcash] call life_fnc_numberText
		];
	};
	__SUB__(life_atmcash,_upgradePrice);
	grpPlayer setVariable["gang_maxMembers",_slotUpgrade,true];
	hint parseText format["You have upgraded from %1 to %2 maximum slots for <t color='#8cff9b'>%3$</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText];
	[[2,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
	hint "Upgrade cancelled.";
};