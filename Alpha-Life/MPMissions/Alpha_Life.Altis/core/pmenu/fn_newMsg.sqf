#include <macro.h>
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Message à: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Aucune personne sélectionnée."];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Vous devez saisir un message à envoyer!";ctrlShow[88885, true];};
		[[life_smartphoneTarget,_msg,player,0],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Vous envoyez un message à %1 : %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["La police n'est actuellement pas accessible. S'il vous plaît réessayer plus tard."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Vous devez saisir un message à envoyer!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "The Police";
		hint format["Vous envoyez un message a %1 : %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Vous devez saisir un message à envoyer!";ctrlShow[888896,true];};
		[[ObjNull,_msg,player,2],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "The Admins";
		hint format["Vous envoyez un message a %1 : %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Actuellement, il n'y a pas de médecin de garde. S'il vous plaît essayer de nouveau plus tard."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Vous devez saisir un message à envoyer!";ctrlShow[888899,true];};
		[[ObjNull,_msg,player,3],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Vous avez envoyé un message à tout les médecins.",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Vous n'êtes pas Admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Aucune personne sélectionnée."];};
		if(_msg == "") exitWith {hint "Vous devez saisir un message à envoyer!";};
		[[life_smartphoneTarget,_msg,player,4],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Message admin envoyé à: %1 - Message: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Vous n'êtes pas Admin!";};
		if(_msg == "") exitWith {hint "Vous devez saisir un message à envoyer!";};
		[[ObjNull,_msg,player,5],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Message Admin pour tous: %1",_msg];
		closeDialog 887890;
	};
};
