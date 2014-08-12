private ["_smoke"];

_smoke = "SmokeShell" createVehicle position player;

// in Car?
if (vehicle player != player) then {
	_smoke attachTo [vehicle player, [0,-1,0]];
} else {
	_smoke attachTo [player, [0,0,1]];
};

hint "Fumer peut tuer !";
sleep 5;
titleFadeOut 3.5;
hint "La fumée contient du benzène, des nitrosamines, du formaldéhyde et du cyanure d'hydrogène!";
sleep 5;
titleFadeOut 3.5;
hint "Fumer nuit gravement à votre santé et à celle de votre entourage";
sleep 5;
titleFadeOut 3.5;
