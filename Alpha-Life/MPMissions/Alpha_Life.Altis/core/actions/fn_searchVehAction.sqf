/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	//if(isNil {_owners}) exitWith {hint "Ce véhicule dispose d'aucune information, il a probablement été engendré par un tricheur. \n\nVéhicule supprimé.";}; //deleteVehicle _vehicle;};
	life_action_inUse = true;
	hint "Fouille du véhicule ...";
	sleep 3;
	life_action_inUse = false;
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint "Impossible de fouiller le véhicule";};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call life_fnc_vehicleOwners;
	
	if(_owners == "Aucun<br/>") then
	{
		_owners = "Pas de propriétaires, mise en fourrière.<br/>";
	};
	hint parseText format["<t color='#FF0000'><t size='2'>Info du Véhicule</t></t><br/><t color='#FFD700'><t size='1.5'>Propriétaire</t></t><br/> %1",_owners];
};