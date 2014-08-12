/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.

*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if ( life_cash < 250000 ) exitWith { systemChat "Vous devez payer 250 000$ pour un message!"; }; // Hint if person haves no 6000 dollar
if ( playerSide != civilian ) exitWith { systemChat "Vous devez être un civil pour envoyer un message!"; }; // Hint if not civilian
if !( life_channel_send ) exitWith { systemChat "Vous devez attendre 10 minutes avant d'envoyer un autre message."; }; //Gives Player the Hint to Wait 10 mins
life_cash = life_cash - 250000;

_message = ctrlText 9001;
[[3,format ["%1 a envoyer un message a Channel7 pour tout le monde: %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
life_channel_send = false;

[] spawn
{
	sleep 600;
	life_channel_send = true;
};