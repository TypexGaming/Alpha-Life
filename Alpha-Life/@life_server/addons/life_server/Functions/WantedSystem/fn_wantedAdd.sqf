/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
    case "187V": {_type = ["Homicide involontaire (véhicule)",6500]};
    case "187": {_type = ["Homicide involontaire",6000]};
    case "901": {_type = ["Evasion de Prison",4500]};
    case "261": {_type = ["Viol",5000]};
    case "261A": {_type = ["Tentative de viol",3000]};
    case "215": {_type = ["Tentative de Car-Jacking",2000]};
    case "213": {_type = ["Utilisation d'explosifs illégaux",10000]};
    case "211": {_type = ["Vol",1000]};
    case "207": {_type = ["Kidnapping",3500]};
    case "207A": {_type = ["Tentative de kidnapping",2000]};
    case "487": {_type = ["Grande infraction",1500]};
    case "488": {_type = ["Petite Infraction",700]};
    case "480": {_type = ["Délit de fuite",1300]};
    case "481": {_type = ["Possession de drogue",1000]};
    case "482": {_type = ["Deal",5000]};
    case "483": {_type = ["Traffic de drogue",9500]};
    case "503": {_type = ["Handel mit exotischen Gütern",25000]};
	case "390": {_type = ["Intoxication Publique",15000]};
    
    case "1": {_type = ["Tueur en série",150000]}; //name and price
	case "2": {_type = ["Tentative de vol de véhicule",2500]};
	case "3": {_type = ["Vol de véhicule",5000]};
	case "4": {_type = ["Conduite sans phares",1000]};
	case "5": {_type = ["Excès de vitesse",1500]};
	case "6": {_type = ["Conduite dangereuse",5000]};
	case "7": {_type = ["Tentative de vol véhicule de police",15000]};
	case "8": {_type = ["Vol de véhicules de police",30000]};
	case "9": {_type = ["Atterrissage non autorisé",25000]};
	case "10": {_type = ["Conduite d'un véhicule rebel",20000]};
	case "11": {_type = ["Délit de fuite majeur",25000]};
	case "12": {_type = ["Délit de fuite mineur",7000]};
	case "13": {_type = ["Tir sur un habitant d'Alpha-Life",75000]};
	case "14": {_type = ["Racket",20000]};
	case "15": {_type = ["Complicité de meurte",5000]};
	case "16": {_type = ["Troll abusif",20000]};
	case "17": {_type = ["Insulte / Provocation (x2)",5000]};
	case "18": {_type = ["Harcèlement d'un agent de police",8000]};
	case "19": {_type = ["Violeur en série",40000]};
	case "20": {_type = ["Dégradation de bien public",600]};
	case "21": {_type = ["Meurtre",100000]};
	case "22": {_type = ["Destruction de biens de la police",35000]};
	case "23": {_type = ["Dealer",15000]};
	case "24": {_type = ["Port d'arme légale en ville",7500]};
	case "25": {_type = ["Port d'arme illégale",2000]};
	case "26": {_type = ["Absence de permis de conduire",1000]};
    case "27": {_type = ["Utilisation d'armes à feu dans la ville",10000]};
    case "28": {_type = ["Prise d'otage",30000]};
    case "29": {_type = ["Attaque sur personnes / véhicules",10000]};
    case "30": {_type = ["Vol de banque",200000]};
    case "31": {_type = ["Assassinat",60000]};
    case "34": {_type = ["Assault/siège de capitales",25000]};
    //case "35": {_type = ["Vers.Landung in einer Flugverbotszone",1500]};
    case "36": {_type = ["Vol en dessous de 150 mètres",2000]};
    //case "37": {_type = ["Ausbruch aus dem Gefaengnis",25000]};
    case "38": {_type = ["Voler sans permis de vol",3200]};
    case "39": {_type = ["Klaxon en permanence",1000]};
    case "40": {_type = ["Commerce des marchandises exotiques",25000]};
    default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call fnc_index;

if(_index != -1) then
{
    _data = life_wanted_list select _index;
    _crimes = _data select 2;
    _crimes set[count _crimes,(_type select 0)];
    _val = _data select 3;
    life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
    else
{
    life_wanted_list set[count life_wanted_list,[_name,_uid,[(_type select 0)],(_type select 1)]];
};