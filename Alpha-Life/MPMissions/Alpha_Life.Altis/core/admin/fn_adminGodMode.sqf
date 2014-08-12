#include <macro.h>
/*
File: fn_adminGodMode.sqf
Author: Tobias 'Xetoxyc' Sittenauer
 
Description: Enables God mode for Admin
*/

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.05;
  };
};
 
if(life_god) then {
	life_god = false;
	titleText ["Godmod désactivé","PLAIN"]; titleFadeOut 2;
	player allowDamage true;
} else {
	life_god = true;
	titleText ["Godmod activé","PLAIN"]; titleFadeOut 2;
	player allowDamage false;
};