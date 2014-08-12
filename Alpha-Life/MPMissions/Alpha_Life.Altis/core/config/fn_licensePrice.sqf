/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {2000}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {50000}; //Pilot/air license cost
	case "gun": {30000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {25500}; //Oil processing license cost
	case "cair": {30000}; //Cop Pilot License cost
	case "swat": {200000}; //Swat License cost
	case "cg": {15000}; //Coast guard license cost
	case "heroin": {120000}; //Heroin processing license cost
	case "marijuana": {100000}; //Marijuana processing license cost
	case "medmarijuana": {15000}; //Medical Marijuana processing license cost
	case "gang": {300000}; //Gang license cost
	case "rebel": {300000}; //Rebel license cost
	case "truck": {50000}; //Truck license cost
	case "diamond": {50000};
	case "salt": {35000};
	case "cocaine": {200000};
	case "sand": {30000};
	case "iron": {20000};
	case "copper": {10000};
	case "cement": {6500};
	case "mair": {20000};
	case "home": {250000};
	case "arme": {150000};
    case "silver": {40000};
    case "vin": {4000};
    case "alcoolcontre": {25000};
    case "cigarette": {35000};
    case "cigare": {40000};
    case "depanneur": {10000};
	case "donator": {1000000};
	case "uranium": {2000000};
	case "stiller":{50000};
	case "liquor":{100000};
	case "bottler":{100000};
	case "mash":{100000};
};