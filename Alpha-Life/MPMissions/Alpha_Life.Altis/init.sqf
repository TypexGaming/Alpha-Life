enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.5";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
//[] execVM "statusBar.sqf";

if(isDedicated && isNil("life_market_prices")) then
{
	[] call life_fnc_marketconfiguration;
	diag_log "Prix du marché générer!";
	
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Prix du marché mis a jour! %1", _this select 1];
	};
	//Start server fsm
[] execFSM "core\fsm\server.fsm";
diag_log "Server FSM executed";
//["load"] call life_fnc_bourse;
};

StartProgress = true;

onPlayerDisconnected { [_id, _name, _uid] call compile preProcessFileLineNumbers "core\functions\fn_onPlayerDisconnect.sqf" };