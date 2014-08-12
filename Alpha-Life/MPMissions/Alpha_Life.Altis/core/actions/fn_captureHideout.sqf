#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture"];
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText["You must create a gang first before capturing it!","PLAIN"];};
if(_group == grpPlayer) exitWith {titleText["Your gang already has control over this hideout!","PLAIN"]};
if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint"Only one person shall capture at once";};
if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format["Cette cachette est contr�l�e par %1<br/>Etes-vous s�r que vous voulez prendre en charge leur zone de gang?",_gangName],
		"La cachette est actuellement sous contr�le ..",
		"Oui",
		"Non"
	] call BIS_fnc_guiMessage;
	
	_cpRate = 0.0045;
} else {
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText["Capture annul�","PLAIN"];};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Capture de la cachette ...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_hideout setVariable["inCapture",true,true];
        if(_cP >= 1 OR !alive player) exitWith {_hideout setVariable["inCapture",false,true];};
        if(life_istazed) exitWith {_hideout setVariable["inCapture",false,true];}; //Tazed
        if(life_interrupted) exitWith {_hideout setVariable["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annul�","PLAIN"]; life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
life_action_inUse = false;

titleText["La cachette a �t� captur�.","PLAIN"];
_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;
[[[0,1],format["%1 et son gang: %2 - ont pris le contr�le d'un repaire locale",name player,(group player) getVariable "gang_name" ]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
_hideout setVariable["inCapture",false,true];
_hideout setVariable["gangOwner",grpPlayer,true];