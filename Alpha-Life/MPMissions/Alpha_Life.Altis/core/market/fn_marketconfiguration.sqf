/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
		
	["oilp", 2800, 1800, 3800, 3, 1, 
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["silver_r",1],
			["cigarette",1]
		] 
	],
	
	["iron_r", 1800, 800, 2800, 3, 1,  
		[ 
			["diamondc",1], 
			["oilp",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["silver_r",1],
			["cigarette",1]
		] 
	],
	
	["diamondc", 1700, 700, 2700, 5, 2, 
		[ 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["silver_r",1],
			["cigarette",1]
		] 
	],
	
	["copper_r", 1400, 400, 2400, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["silver_r",1],
			["cigarette",1]
		] 
	],
	
	["salt_r", 1050, 50, 2050, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["cement",1],
			["glass",1],
			["silver_r",1],
			["cigarette",1]
		] 
	],
	
	["glass", 1100, 100, 2100, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["silver_r",1],
			["cigarette",1]
		] 
	],
	
	["cement", 2100, 1100, 3100, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["silver_r",1],
			["cigarette",1]
		] 
	],
	
	["silver_r", 2100, 1100, 3100, 4, 2, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["cement",1],
			["cigarette",1]
		] 
	],
	
	["cigarette", 1500, 500, 2500, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["cement",1],
			["silver_r",1]
		] 
	],
	
	///////////////////////////////////
	
	["turtle", 6000, 5000, 7000, 20, 18,  
		[ 
			["marijuana",1], 
			["cocainep",1],
			["heroinp",1],
			["cigare",1],
			["arme",1]
		] 
	],
	
	["marijuana", 2000, 1000, 3000, 7, 5,   
		[ 
			["turtle",1], 
			["cocainep",1],
			["heroinp",1],
			["cigare",1],
			["arme",1]
		] 
	],
	
	["cocainep", 4200, 3200, 5200, 11, 8,   
		[ 
			["marijuana",1], 
			["turtle",1],
			["heroinp",1],
			["cigare",1],
			["arme",1]
		] 
	],
	
	["heroinp", 3150, 2150, 4150, 11, 8,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1],
			["cigare",1],
			["arme",1]
		] 
	],
	
	["cigare", 2000, 1000, 3000, 11, 8,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1],
			["heroinp",1],
			["arme",1]
		] 
	],
	
	["armer", 7050, 6050, 8050, 11, 8,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1],
			["heroinp",1],
			["cigare",1]
		] 
	]
];
publicVariable "life_market_resources";

////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Prix du marché générer!";
//};