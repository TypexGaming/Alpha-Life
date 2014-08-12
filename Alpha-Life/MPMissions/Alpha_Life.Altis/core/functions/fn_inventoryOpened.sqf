/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if((_isPack == 1) && playerSide != west) then {
	hint "Vous n'êtes pas autoriser a regarder dans le sac de quelqu'un d'autre.";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint "Vous ne pouvez pas accedez a ce conténaire sans que le propriétaire ne l'ai dévérouiller.";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
    if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
         hint "Vous n'êtes pas autoriser a acceder à ce véhicule car il est vérouiller.";
        [] spawn {
            waitUntil {!isNull (findDisplay 602)};
            closeDialog 0;
        };
    };
};