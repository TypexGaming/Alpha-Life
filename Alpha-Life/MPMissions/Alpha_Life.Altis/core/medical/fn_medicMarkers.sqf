/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks downed players on the map when it's open.

private["_markers","_units"];
_markers = [];
_units = [];

sleep 0.25;
if(visibleMap) then {
	{
		_name = _x getVariable "name";
		_down = _x getVariable ["Revive",false];
		if(!isNil "_name" && !_down) then {
			_units set[count _units,_x];
		};
	} foreach allDeadMen;
	
	//Loop through and create markers.
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
		_markers set[count _markers,_marker];
	} foreach _units;
	
	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _markers;
};*/

/*
	File: fn_medicMarkers.sqf
	Author: by LordNaikon (Keep Calm and Roleplay
	
	Description:
	Marks Team Medic players on the map when it's open.
*/
private["_markers","_medic"];
_markers = [];
_medic = [];

sleep 0.5;
if(visibleMap) then {
	{if(side _x == independent) then {_medic set[count _medic,_x];}} foreach playableUnits; //Fetch list of Medics
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
	
		_markers set[count _markers,[_marker,_x]];
	} foreach _medic;
		
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_medic = [];
};