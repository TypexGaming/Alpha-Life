/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule." };
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",1200,"Traitement du pétrole"];};
	case "diamond": {["diamond","diamondc",1350,"Traitement du diamant"]};
	case "heroin": {["heroinu","heroinp",2100,"Traitement de l'héroïne"]};
	case "copper": {["copperore","copper_r",750,"Traitement du cuivre"]};
	case "iron": {["ironore","iron_r",1120,"Traitement du Fer"]};
	case "sand": {["sand","glass",650,"Traitement du sable"]};
	case "salt": {["salt","salt_r",450,"Traitement du sel"]};
	case "cocaine": {["cocaine","cocainep",1500,"Traitement de la cocaïne"]};
	case "marijuana": {["cannabis","marijuana",500,"Traitement de la Marijuana"]};
	case "medmari": {["cannabis","medmari",500,"Traitement de la Marijuana"]};
	case "heroin": {["heroinu","heroinp",1720,"Traitement de l'héroïne"]};
	case "cement": {["rock","cement",350,"Mélange du ciment"]};
	case "arme" : {["arme","armer",12000,"Restauration d'arme"]};
    case "vin" : {["raisin","vin",500,"Préparation du Vin"]};
    case "alcool" : {["pommedeterre","alcoolcontre",100,"Préparation de l'alcool"]};
    case "silver" : {["silverore","silver_r",1200,"Traitement de l'Argent"]};
    case "bois" : {["bois","charbon",200,"Brulage du Bois"]};
    case "cigarette" : {["tabac","cigarette",700,"Traitement du Tabac"]};
    case "cigare" : {["tabac","cigare",800,"Traitement du Tabac"]};
	case "heroin": {["heroinu","heroinp",1800,"Traiter l'héroine"]};
	case "cocaine": {["cocaine","cocainep",1650,"Traiter la cocaine"]};
	case "uranium1": {["uranium1","uranium2",5000,"Nettoyage de l'Uranium"]};
	case "uranium4": {["uranium4","uranium",15000,"Sécher l'Uranium"]};
	case "mash": {["water","mash",100,"Mixing Grain Mash",true,"cornmeal"]};//new
	case "whiskey": {["yeast","whiskey",1000,"Fermenting Whiskey",true,"rye"]};//new
	case "beer": {["yeast","beerp",1500,"Brewing Beer",true,"hops"]};//new
	case "moonshine": {["yeast","moonshine",250,"Moonshining",true,"mash"]};//new
	case "bottledshine": {["moonshine","bottledshine",500,"Bootle Moonshine",true,"bottles"]};//new
	case "bottledbeer": {["beerp","bottledbeer",500,"Bottle Beer",true,"bottles"]};//new
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,"Bottle Whiskey",true,"bottles"]};//new
	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {hint "Tu n'as pas les ingrédients nécessaires"};

//Setup vars.
_2var = _itemInfo select 4;
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

//2vars
if(_2var) then { _oldItem2 = _itemInfo select 5; }; //set Itemname if (processing with 2 Items = true) 

_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

//2vars
if(_2var) then { _oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle); }; //calculate the amount of the second Item (for example Iron)

if(_2var) then { 
       if(_oldVal !=_oldVal2) then {
              _error = true; // True if amount of Item1 =! amount of Item 2 to prevent processing 20 FuelF with 20x oilp  and 1x iron_r)
       };
};
if(_error) exitWith{hint "please use equal amounts"};

_cost = _cost * _oldVal;

/*if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

_cost = _cost * _oldVal;*/
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint "Vous devez rester a 10m du traitement."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	//2vars
if(_2var) then 
{
([false,_oldItem2,_oldVal2] call life_fnc_handleInv); //delete the second items (for example Iron)
};
if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
5 cutText ["","PLAIN"];
titleText[format["Vous avez traiter %1 en %2.",_oldVal,_itemName],"PLAIN"];
life_is_processing = false;

}
else
{
if(life_cash < _cost) exitWith {hint format["Vous avez besoin de %1$ pour traiter sans licence!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

while{true} do
{
sleep  0.9;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
if(_cP >= 1) exitWith {};
if(player distance _vendor > 10) exitWith {};
};

if(player distance _vendor > 10) exitWith {hint "Vous devez rester a 10m du traitement."; 5 cutText ["","PLAIN"]; life_is_processing = false;};

if(life_cash < _cost) exitWith {hint format["Vous avez besoin de %1$ pour traiter sans licence!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
//2vars
if(_2var) then 
{
([false,_oldItem2,_oldVal2] call life_fnc_handleInv); //delete the second items (for example Iron)
};

if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
5 cutText ["","PLAIN"];
titleText[format["Vous avez traiter %1 en %2 pour %3$",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
life_cash = life_cash - _cost;
life_is_processing = false;
};
	/*if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Vous avez traiter %1 en %2",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
}
	else
{
	if(life_cash < _cost) exitWith {hint format["Vous avez besoin de %1$ pour traiter sans licence!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint "Vous devez rester a 10m du traitement."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_cash < _cost) exitWith {hint format["Vous avez besoin de %1$ pour traiter sans licence!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Vous avez traiter %1 en %2 pour %3$",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash - _cost;
	life_is_processing = false;
};*/	