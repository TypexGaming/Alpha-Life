/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","rabbit","apple","redgull","tbacon","lockpick","fuelF","peach","pickaxe","boltcutter","storagesmall","storagebig","vin"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","redgull","tbacon","lockpick","fuelF","peach","pickaxe","boltcutter","blastingcharge","zipties","ipuranium"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","redgull","tbacon","lockpick","fuelF","peach","pickaxe","blastingcharge","boltcutter","zipties"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit","barricade","barrier","cone"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "medic": {["Marché Médecin",["water","rabbit","redgull","tbacon","fuelF"]]};
	case "arme": {["Acheteur d'arme",["armer"]]};
    case "tabac": {["Marchand de Tabac",["cigarette","cigare"]]};
    case "contrebande": {["Marchand d'alcool Ill�gale",["alcoolcontre"]]};
    case "charbon": {["Marchand de Charbon",["charbon"]]};
    case "outils": {["Vendeur d'Outils",["pelle","pickaxe","hache"]]};
    case "silver": {["Silver Trader",["silver_r"]]};
	case "medmari": {["Achat de Marijuana",["medmari"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
	case "uranium": {["Marchand Uranium",["uranium","puranium"]]};
};