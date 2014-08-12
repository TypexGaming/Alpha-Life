/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText"];
if(life_action_inUse) exitWith {hint "Vous faites déjà une action. S'il vous plait attendez qu'elle se termine."};
_search = nearestObjects[getPos air_sp, ["Air"],5];
if(count _search == 0) exitWith {hint "Il n'y a pas d'hélico sur l'héliport!"};
if(life_cash < 1000) exitWith {hint "Vous avez besoin de 1000$ pour entretenir votre hélicoptère."};
life_cash = life_cash - 1000;
life_action_inUse = true;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Entretien de l'hélicoptère (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	sleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Entretien de l'hélicoptère (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1) exitWith {};
};

if(!alive (_search select 0) || (_search select 0) distance air_sp > 10) exitWith {life_action_inUse = false; hint "Le véhicule a disparus ou n'est plus sur l'héliport"};
if(!local (_search select 0)) then
{
	[{(_search select 0) setFuel 1;},"BIS_fnc_spawn",(_search select 0),false] spawn life_fnc_MP;
}
	else
{
	(_search select 0) setFuel 1;
};
(_search select 0) setDamage 0;

5 cutText ["","PLAIN"];
titleText ["Votre hélico est maintenant réparé et le plein a été fait.","PLAIN"];
life_action_inUse = false;