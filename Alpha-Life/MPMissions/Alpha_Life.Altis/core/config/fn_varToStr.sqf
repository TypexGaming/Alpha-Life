/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {"Pétrole Brut"};
	case "life_inv_oilp": {"Pétrole Raffiné"};
	case "life_inv_heroinu": {"Graine blanche de Pavot"};
	case "life_inv_heroinp": {"Héroïne Pure"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_medmari": {"Mari Médicale"};
	case "life_inv_apple": {"Pomme"};
	case "life_inv_rabbit": {"Viande de Lapin"};
	case "life_inv_salema": {"Chaire de Saumon"};
	case "life_inv_ornate": {"Chaire de Rouget"};
	case "life_inv_mackerel": {"Chaire de Maquereau"};
	case "life_inv_tuna": {"Chaire de Thon"};
	case "life_inv_mullet": {"Chaire de Mullet"};
	case "life_inv_catshark": {"Chaire de Poisson-Chat"};
	case "life_inv_turtle": {"Viande de tortue"};
	case "life_inv_fishingpoles": {"Canne a Pêche"};
	case "life_inv_water": {"Bouteille d'Eau"};
	case "life_inv_coffee": {"Thermos de Café"};
	case "life_inv_turtlesoup": {"Soupe de Tortue"};
	case "life_inv_donuts": {"Beignets"};
	case "life_inv_fuelE": {"Jerrican Vide"};
	case "life_inv_fuelF": {"Jerrican d'Essence"};
	case "life_inv_pickaxe": {"Pioche"};
	case "life_inv_copperore": {"Minerai de Cuivre"};
	case "life_inv_ironore": {"Minerai de Fer"};
	case "life_inv_ironr": {"Lingot de Fer"};
	case "life_inv_copperr": {"Lingot de Cuivre"};
	case "life_inv_sand": {"Sable"};
	case "life_inv_salt": {"Sel"};
	case "life_inv_saltr": {"Sel Raffinné"};
	case "life_inv_glass": {"Verre"};
	case "life_inv_diamond": {"Diamant Brut"};
	case "life_inv_diamondr": {"Diamant Taillé"};
	case "life_inv_tbacon": {"Sandwich au Thon"};
	case "life_inv_redgull": {"Boisson Énergisante"};
	case "life_inv_lockpick": {"Outils de crochetage"};
	case "life_inv_peach": {"Pêche"};
	case "life_inv_coke": {"Feuille de Coca"};
	case "life_inv_cokep": {"Cocaïne Pure"};
	case "life_inv_spikeStrip": {"Herse"};
	case "life_inv_rock": {"Pierre"};
	case "life_inv_cement": {"Sac de Ciment"};
	case "life_inv_goldbar": {"Lingot d'Or"};
	case "life_inv_blastingcharge": {"Dynamite"};
	case "life_inv_boltcutter": {"Pince Coupante"};
	case "life_inv_defusekit": {"Kit de diffusion de Bombe"};
	case "life_inv_storagesmall": {"Petite boite de stockage"};
	case "life_inv_storagebig": {"Grande boite de stockage"};
	case "life_inv_zipties": {"Serre-Cable"};
	case "life_inv_barricade": {"Barricade"};
	case "life_inv_barrier": {"Barriere"};
	case "life_inv_cone": {"Cône Sécurité"};
	case "life_inv_arme": {"Arme Rouillée"};
	case "life_inv_armer": {"Arme Restaurée"};
    case "life_inv_raisin": {"Raisin"};
    case "life_inv_vin": {"vin"};
    case "life_inv_pommedeterre": {"Pomme de Terre"};
    case "life_inv_alcoolcontre": {"Alcool de contrabande"};
    case "life_inv_silverore": {"Minerai d'Argent"};
    case "life_inv_silverr": {"Lingot d'Argent"};
    case "life_inv_bois": {"Bois"};
    case "life_inv_charbon": {"Charbon"};
    case "life_inv_hache": {"Hache"};
    case "life_inv_tabac": {"Tabac"};
    case "life_inv_cigarette": {"Cigarette"};
    case "life_inv_cigare": {"Cigare"};
    case "life_inv_pelle": {"Pelle"};
	case "life_inv_puranium": {"Produit Uranium"}; // Add This
	case "life_inv_ipuranium": {"Produit Ill Uranium"}; // Add This
	case "life_inv_uranium1": {"Déchets d'Uranium"}; // Add This
	case "life_inv_uranium2": {"Uranium Brut"}; // Add This
	case "life_inv_uranium3": {"Uranium Purifié"}; // Add This
	case "life_inv_uranium4": {"Uranium Concentré"}; // Add This
	case "life_inv_uranium": {"Uranium"}; // Add This
	
	//License Block
	case "license_civ_driver": {"Permis de conduire (véhicule léger)"};
	case "license_civ_air": {"Brevet de Pilote"};
	case "license_civ_heroin": {"Producteur d'Héroïne"};
	case "license_civ_gang": {"Licence de Gang"};
	case "license_civ_oil": {"Raffinage du Pétrole"};
	case "license_civ_dive": {"Permis de Plongée"};
	case "license_civ_boat": {"Permis Bateau"};
	case "license_civ_gun": {"Permis de port d'armes"};
	case "license_cop_air": {"Brevet de Pilote de la Police"};
	case "license_cop_swat": {"Diplôme des Forces Spéciales"};
	case "license_cop_cg": {"Garde Côtes"};
	case "license_civ_rebel": {"Entrainnement Rebelle"};
	case "license_civ_truck": {"Permis Poids Lourd"};
	case "license_civ_diamond": {"Joallier"};
	case "license_civ_copper": {"Fondeur de Cuivre"};
	case "license_civ_iron": {"Fondeur de Fer"};
	case "license_civ_sand": {"Souffleur de Verre"};
	case "license_civ_salt": {"Rafinnage du Sel"};
	case "license_civ_coke": {"Producteur de Cocaïne"};
	case "license_civ_marijuana": {"Producteur de Marijuana"};
	case "license_med_medmarijuana": {"Marijuana Médicale"};
	case "license_civ_cement": {"Producteur de Ciment"};
	case "license_med_air": {"Brevet de Pilote (Ambulance)"};
	case "license_civ_home": {"Propriétaire"};
	case "license_civ_arme": {"Permis de Restauration D'armes"};
    case "license_civ_silver": {"Fondeur d'Argent"};
    case "license_civ_vin": {"Fabriquant de Vin"};
    case "license_civ_alcoolcontre": {"Licence d'Alcool de contrebande"};
    case "license_civ_cigarette": {"Producteur de Cigarette"};
    case "license_civ_cigare": {"Producteur de Cigare"};
	case "license_civ_donator": {"Licence Donateur"};
	case "license_civ_uranium": {"Formation Uranium"};
};
