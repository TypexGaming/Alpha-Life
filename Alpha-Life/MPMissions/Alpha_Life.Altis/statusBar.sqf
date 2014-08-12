waitUntil {!(isNull (findDisplay 46))};
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
};
