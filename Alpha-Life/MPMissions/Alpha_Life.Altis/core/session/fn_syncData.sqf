/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {hint "Vous avez déjà utilisé l'option de synchronisation, vous ne pouvez utiliser cette fonction qu'une fois toutes les 5 minutes.";};

switch (typeName life_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count life_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};
	
	default {_exit = true;};
};

if(!isNil "_exit") exitWith {hint "Because of some cheater corrupting the BIS MP Framework they have stopped you from enjoying our mission.\n\nYou can try this again in a minute if you feel it is a mistake.";};

[] call SOCK_fnc_updateRequest;
hint "Synchronisation des informations de joueur sur le serveur.\n\nVeuillez patienter jusqu'à 20 secondes avant de quitter.";
[] spawn
{
	life_session_time = true;
	sleep (5 * 60);
	life_session_time = false;
};
	