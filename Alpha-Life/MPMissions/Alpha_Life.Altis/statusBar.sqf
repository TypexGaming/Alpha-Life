/*waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "statusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["statusBar","PLAIN"];
systemChat format["*Bienvenue* %1!", _rscLayer];

[] spawn {
	sleep 5;
	_statusText = "Welcome";
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		_statusText = "Alpha-Life";
		((uiNamespace getVariable "statusBar")displayCtrl 1000)ctrlSetText format["%3 | FPS: %1 | Joueurs : %2 | TS3 : 5.39.62.14:10194   ", round diag_fps, count playableUnits, _statusText, _counter];
	};
};*/

waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
File: fn_statusBar.sqf
Author: Some French Guy named Osef I presume, given the variable on the status bar
Edited by: [midgetgrimm]
Description: Puts a small bar in the bottom right of screen to display in-game information
*/
_rscLayer = "statusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["statusBar","PLAIN"];
systemChat format["[GL v3.1.4] Chargement des paramètres ...", _rscLayer];
[] spawn {
sleep 5;
_counter = 180;
_timeSinceLastUpdate = 0;
while {true} do
{
sleep 1;
_counter = _counter - 1;
((uiNamespace getVariable "statusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | Cops: %2 | Civs: %3 | Medics: %4 | Argent: %5 | Banque: %6 | GRIDREF: %7", round diag_fps, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[life_cash] call life_fnc_numberText,[life_atmcash] call life_fnc_numberText,mapGridPosition player, _counter];
};
};
