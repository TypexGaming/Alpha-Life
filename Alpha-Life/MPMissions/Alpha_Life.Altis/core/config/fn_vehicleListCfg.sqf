#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",35000],
			["C_Kart_01_Fuel_F",35000],
			["C_Kart_01_Red_F",35000],
			["C_Kart_01_Vrana_F",35000]
		];
	};
	case "med_shop":
	{
		if(__GETC__(life_mediclevel) == 1) then
			{
			_return set[count _return,["C_Offroad_01_F",10000]];
			_return set[count _return,["C_SUV_01_F",25000]];
			_return set[count _return,["I_Truck_02_medical_F",35000]];
			};
		if(__GETC__(life_mediclevel) == 2) then
			{
			_return set[count _return,["C_Offroad_01_F",10000]];
			_return set[count _return,["C_SUV_01_F",25000]];
			_return set[count _return,["C_Van_01_box_F",40000]];
			_return set[count _return,["I_Truck_02_medical_F",35000]];
			_return set[count _return,["O_Truck_03_medical_F",45000]];
			_return set[count _return,["B_Truck_01_medical_F",60000]];
			};
		if(__GETC__(life_mediclevel) == 5) then
		{
			_return set[count _return,["C_Offroad_01_F",10000]];
			_return set[count _return,["C_SUV_01_F",25000]];
			_return set[count _return,["C_Hatchback_01_sport_F",30000]];
			_return set[count _return,["C_Van_01_box_F",40000]];
			_return set[count _return,["I_Truck_02_medical_F",35000]];
			_return set[count _return,["O_Truck_03_medical_F",45000]];
			_return set[count _return,["B_Truck_01_medical_F",60000]];
		};	
	};
	
	case "med_air_hs": 
	{
		if(__GETC__(life_mediclevel) == 1) then
		{
			_return set[count _return,["B_Heli_Light_01_F",12000]];
		};
		if(__GETC__(life_mediclevel) == 2) then
		{
			_return set[count _return,["B_Heli_Light_01_F",12000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",25000]];
		};
		if(__GETC__(life_mediclevel) == 5) then
		{
			_return set[count _return,["B_Heli_Light_01_F",12000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",25000]];
			_return set[count _return,["I_Heli_Transport_02_F",150000]];
		};
	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",11000],
			["C_Offroad_01_F",14000],
			["C_SUV_01_F",50000],
			["C_Van_01_transport_F",40000]
		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_covered_F",200000], //zamak
			["B_Truck_01_transport_F",350000], //HMTT
			["B_Truck_01_covered_F",390000],
			["B_Truck_01_box_F",500000] //HMTT
		];	
	};
	
	
	case "reb_car":
	{
		_return set[count _return,
		["B_Quadbike_01_F",2500]];
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",500000]];
			_return set[count _return,
			["O_MRAP_02_hmg_F",1200000]];
			_return set[count _return,
			["B_G_Offroad_01_F",15000]];
			_return set[count _return,
			["O_MRAP_02_F",150000]];
			_return set[count _return,
			["B_Heli_Light_01_F",500000]];
			_return set[count _return,
			["B_Heli_Light_01_armed_F",1600000]];
			_return set[count _return,
			["I_MRAP_03_F",220000]];
			_return set[count _return,
			["O_Truck_03_transport_F",420000]];
			_return set[count _return,
			["O_Truck_03_covered_F",450000]];
		};
	};
	
	 case "donator_1":
	{

		if(__GETC__(life_donator) == 1) then
		{
			_return set[count _return,["C_Kart_01_Blu_F",32500]];
			_return set[count _return,["C_Kart_01_Fuel_F",32500]];
			_return set[count _return,["C_Kart_01_Red_F",32500]];
			_return set[count _return,["C_Kart_01_Vrana_F",32500]];
			_return set[count _return,["C_Hatchback_01_sport_F",45000]];
			_return set[count _return,["I_MRAP_03_F",198000]];
			_return set[count _return,["I_MRAP_03_hmg_F",1450000]];
			_return set[count _return,["O_Truck_03_device_F",550000]];
		};
		if(__GETC__(life_donator) == 2) then
		{
			_return set[count _return,["C_Kart_01_Blu_F",29750]];
			_return set[count _return,["C_Kart_01_Fuel_F",29750]];
			_return set[count _return,["C_Kart_01_Red_F",29750]];
			_return set[count _return,["C_Kart_01_Vrana_F",29750]];
			_return set[count _return,["C_Hatchback_01_sport_F",38250]];
			_return set[count _return,["I_MRAP_03_F",187000]];
			_return set[count _return,["I_MRAP_03_hmg_F",1450000]];
			_return set[count _return,["I_Heli_Transport_02_F",1300000]];
			_return set[count _return,["O_APC_Wheeled_02_rcws_F",1500000]];
			_return set[count _return,["O_Truck_03_device_F",550000]];
		};
		if(__GETC__(life_donator) == 3) then
		{
			_return set[count _return,["C_Kart_01_Blu_F",28000]];
			_return set[count _return,["C_Kart_01_Fuel_F",28000]];
			_return set[count _return,["C_Kart_01_Red_F",28000]];
			_return set[count _return,["C_Kart_01_Vrana_F",28000]];
			_return set[count _return,["C_Hatchback_01_sport_F",36000]];
			_return set[count _return,["O_Truck_03_device_F",450000]];
			_return set[count _return,["I_MRAP_03_F",176000]];
			_return set[count _return,["I_MRAP_03_hmg_F",1400000]];
			_return set[count _return,["I_Heli_light_03_unarmed_F",600000]];
			_return set[count _return,["O_APC_Wheeled_02_rcws_F",1500000]];
			_return set[count _return,["I_Heli_Transport_02_F",1100000]];
		};
		if(__GETC__(life_donator) == 4) then
		{
			_return set[count _return,["C_Kart_01_Blu_F",35000]];
			_return set[count _return,["C_Kart_01_Fuel_F",35000]];
			_return set[count _return,["C_Kart_01_Red_F",35000]];
			_return set[count _return,["C_Kart_01_Vrana_F",35000]];
			_return set[count _return,["C_Hatchback_01_sport_F",30000]];
			_return set[count _return,["I_MRAP_03_F",220000]];
			_return set[count _return,["I_MRAP_03_hmg_F",1500000]];
			_return set[count _return,["I_Heli_Transport_02_F",1200000]];
		};
		if(__GETC__(life_donator) == 5) then
		{
			_return set[count _return,["C_Kart_01_Blu_F",28000]];
			_return set[count _return,["C_Kart_01_Fuel_F",28000]];
			_return set[count _return,["C_Kart_01_Red_F",28000]];
			_return set[count _return,["C_Kart_01_Vrana_F",28000]];
			_return set[count _return,["B_Quadbike_01_F",2000]];
			_return set[count _return,["C_Offroad_01_F",11200]];
			_return set[count _return,["C_SUV_01_F",20000]];
			_return set[count _return,["C_Hatchback_01_sport_F",36000]];
			_return set[count _return,["C_Van_01_box_F",48000]];
			_return set[count _return,["I_Truck_02_covered_F",160000]]; //zamak
			_return set[count _return,["B_Truck_01_transport_F",280000]]; //HMTT
			_return set[count _return,["B_Truck_01_covered_F",312000]];
			_return set[count _return,["B_Truck_01_box_F",400000]]; //HMTT
			_return set[count _return,["O_Truck_03_transport_F",420000]];
			_return set[count _return,["O_Truck_03_covered_F",450000]];
			_return set[count _return,["O_Truck_03_device_F",450000]];
			_return set[count _return,["B_MRAP_01_F",176000]];
			_return set[count _return,["I_MRAP_03_F",176000]];
			_return set[count _return,["I_MRAP_03_hmg_F",1200000]];
			_return set[count _return,["B_G_Offroad_01_armed_F",400000]];
			_return set[count _return,["O_MRAP_02_F",120000]];
			_return set[count _return,["O_MRAP_02_hmg_F",960000]];
			_return set[count _return,["O_APC_Wheeled_02_rcws_F",2500000]];
			_return set[count _return,["B_Heli_Light_01_F",400000]];
			_return set[count _return,["B_Heli_Light_01_armed_F",1280000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",480000]];
			_return set[count _return,["I_Heli_light_03_unarmed_F",600000]];
			_return set[count _return,["I_Heli_Transport_02_F",960000]];
			_return set[count _return,["O_Heli_Light_02_F",960000]];
		};
	};
	
	case "cop_car":
	{
		if(__GETC__(life_coplevel) == 1) then
		{
			_return set[count _return,
			["B_Quadbike_01_F",3000]];
			_return set[count _return,
			["C_Hatchback_01_F",7000]];
			_return set[count _return,
			["C_Kart_01_Blu_F",10000]];
			_return set[count _return,
			["C_Kart_01_Fuel_F",10000]];
			_return set[count _return,
			["C_Kart_01_Red_F",10000]];
			_return set[count _return,
			["C_Kart_01_Vrana_F",10000]];
		};
		if(__GETC__(life_coplevel) == 2) then
		{
			_return set[count _return,
			["B_Quadbike_01_F",3000]];
			_return set[count _return,
			["C_Hatchback_01_F",7000]];
			_return set[count _return,
			["C_Kart_01_Blu_F",10000]];
			_return set[count _return,
			["C_Kart_01_Fuel_F",10000]];
			_return set[count _return,
			["C_Kart_01_Red_F",10000]];
			_return set[count _return,
			["C_Kart_01_Vrana_F",10000]];
			_return set[count _return,
			["C_Offroad_01_F",10000]];
		};
		if(__GETC__(life_coplevel) == 3) then
		{
			_return set[count _return,
			["B_Quadbike_01_F",3000]];
			_return set[count _return,
			["C_Hatchback_01_F",7000]];
			_return set[count _return,
			["C_Kart_01_Blu_F",10000]];
			_return set[count _return,
			["C_Kart_01_Fuel_F",10000]];
			_return set[count _return,
			["C_Kart_01_Red_F",10000]];
			_return set[count _return,
			["C_Kart_01_Vrana_F",10000]];
			_return set[count _return,
			["C_Offroad_01_F",10000]];
			_return set[count _return,
			["C_SUV_01_F",35000]];
			_return set[count _return,
			["B_MRAP_01_F",60000]];
		};
		if(__GETC__(life_coplevel) == 4) then
		{
			_return set[count _return,
			["B_Quadbike_01_F",3000]];
			_return set[count _return,
			["C_Hatchback_01_F",7000]];
			_return set[count _return,
			["C_Kart_01_Blu_F",10000]];
			_return set[count _return,
			["C_Kart_01_Fuel_F",10000]];
			_return set[count _return,
			["C_Kart_01_Red_F",10000]];
			_return set[count _return,
			["C_Kart_01_Vrana_F",10000]];
			_return set[count _return,
			["C_Offroad_01_F",10000]];
			_return set[count _return,
			["C_SUV_01_F",35000]];
			_return set[count _return,
			["B_MRAP_01_F",60000]];
			_return set[count _return,
			["B_MRAP_01_hmg_F",150000]];
			_return set[count _return,
			["C_Hatchback_01_sport_F",70000]];
		};
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return set[count _return,
			["B_Quadbike_01_F",3000]];
			_return set[count _return,
			["C_Hatchback_01_F",7000]];
			_return set[count _return,
			["C_Kart_01_Blu_F",10000]];
			_return set[count _return,
			["C_Kart_01_Fuel_F",10000]];
			_return set[count _return,
			["C_Kart_01_Red_F",10000]];
			_return set[count _return,
			["C_Kart_01_Vrana_F",10000]];
			_return set[count _return,
			["C_Offroad_01_F",10000]];
			_return set[count _return,
			["C_SUV_01_F",35000]];
			_return set[count _return,
			["B_MRAP_01_F",60000]];
			_return set[count _return,
			["B_MRAP_01_hmg_F",150000]];
			_return set[count _return,
			["C_Hatchback_01_sport_F",70000]];
			_return set[count _return,
			["I_MRAP_03_F",120000]];
			_return set[count _return,
			["I_MRAP_03_hmg_F",150000]];
			_return set[count _return,
			["B_APC_Wheeled_01_cannon_F",250000]];
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",400000],
			["O_Heli_Light_02_unarmed_F",600000]
		];
	};
	
	case "cop_air":
	{
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",75000]];
		};
		if(__GETC__(life_coplevel) >= 4) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];
		};
	};
	
	case "cop_airhq":
	{
		if(__GETC__(life_coplevel) >= 2) then
		{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		};
		if(__GETC__(life_coplevel) >= 4) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",130000]];
		};
		if(__GETC__(life_coplevel) >= 6) then
		{
			_return set[count _return,
			["B_Heli_Light_01_armed_F",280000]];
		};
		if(__GETC__(life_coplevel) >= 7) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",150000]];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_Boat_Armed_01_minigun_F",75000],
			["B_SDV_01_F",100000]
		];
	};
};

_return;
