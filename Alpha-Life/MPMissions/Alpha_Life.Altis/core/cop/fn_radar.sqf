/*
	File: fn_radar.sqf
	Author: Silly Aussie kid named Jaydon
	
	Description:
	Looks like weird but radar?

if(playerSide != west) exitWith {};
private ["_speed","_vehicle"];
_vehicle = cursorTarget;
_speed = round speed _vehicle;

if((_vehicle isKindOf "Car") && (currentWeapon player) == "hgun_P07_snds_F") then
{
	switch (true) do 
	{
		case ((_speed > 33 && _speed <= 80)) : 
		{	
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#33CC33'><t align='center'><t size='1'>Vitesse Véhicule %1 km/h",round  _speed];
		};
		
		case ((_speed > 80)) : 
		{	
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#FF0000'><t align='center'><t size='1'>Vitesse Véhicule %1 km/h",round  _speed];
		};
	};
};*/

if(playerSide != west) exitWith {};
private ["_speed","_vehicle","_owners"];
_vehicle = cursorTarget;
_owners = _vehicle getVariable "vehicle_info_owners";
_distance = player distance _vehicle;
_speed = round speed _vehicle;

if((_vehicle isKindOf "Car") && (currentWeapon player) in ["hgun_P07_snds_F","Binocular","Rangefinder"]) then
{
	switch (true) do
	{
		case ((_speed > 33 && _speed <= 51)) :
		{
			_owners = [_owners] call life_fnc_vehicleOwners; //get vehicle owner from vehicle information.
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#33CC33'><t align='center'><t size='1'>Vitesse du véhicule: %1 km/h<br/><t color='#33CC33'><t align='center'><t size='1'>Distance: %2 m<br/><t color='#FFD700'><t size='1.5'>Propriétaire du véhicule</t></t><br/> %3", round _speed, round _distance, _owners];
		};

		case ((_speed > 51)) :
		{
			_owners = [_owners] call life_fnc_vehicleOwners; //get vehicle owner from vehicle information.
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#FF0000'><t align='center'><t size='1'>Vitesse du véhicule: %1 km/h<br/><t color='#33CC33'><t align='center'><t size='1'>Distance: %2 m<br/><t color='#FFD700'><t size='1.5'>Propriétaire du véhicule</t></t><br/> %3", round _speed, round _distance, _owners];
		};
	};
};