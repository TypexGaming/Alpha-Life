private["_unit","_sum","_endeZeit"];

_endeZeit = time + 60;
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

liafu = true;
Flare = "SmokeShellPurple" createVehicle position player;
if (vehicle player != player) then {
	Flare attachTo [vehicle player,[0,0,0.]];
}
else {
	Flare attachTo [player,[0,0,0.]];
};

while {time < _endeZeit} do {
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
	"colorCorrections" ppEffectCommit 1;
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [0.01,0.01,true];
	"chromAberration" ppEffectCommit 1;
	player enableFatigue false;
	sleep 3;
};

"colorInversion" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [0.5,0.5,0.5,0], [0.5,0.5,0.5,0]];
"colorCorrections" ppEffectCommit 10;
waitUntil {ppEffectCommitted "colorCorrections"};
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
player enableFatigue true;