/*

	Some random and dynamical stuff for market

*/

private["_rand","_modifier","_price", "_globalchange","_defaultprice","_shortname","_difference"];

_rand = [0,200] call life_fnc_randomRound; //0-200

/*

	HINWEIS: obige Zahl in random erhöhen, um alle ereignisse seltener zu machen!
	
*/

diag_log "[MARKET] Modification dans la bourse.";

switch(true) do
{
	case (_rand <= 30): //30% default market change value (strong version)
	{
		{
			if(random(10) <= 4) then //Random for each resource
			{
				/*_price = _x select 1;
				_globalchange = _x select 2;*/
				
				_modifier = [-20,20] call life_fnc_randomRound; //Verkaufte/Gekaufte Items
				/*_modifier = _price * _modifier;
				
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				
				life_market_prices set [_forEachIndex, [_x select 0, _price, _globalchange, _modifier] ];*/
				
				if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call life_fnc_marketSell; 
				}
				else
				{
					[_x select 0, _modifier, true] call life_fnc_marketBuy; 
				};
			};
		}
		foreach life_market_prices;
	};
	case (_rand <= 45): //15% de chance, interpol arrete des trafiquants
	{
		[[0,"News: Interpol a arrêté un groupe de trafiquants de drogue!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["marijuana",200, true] call life_fnc_marketBuy;
		["heroinp",200, true] call life_fnc_marketBuy;
		["cocainep",200, true] call life_fnc_marketBuy; 
		//["heroinu", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		//["cocaine",200, true] call life_fnc_marketBuy; 
		//["froglsd", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "Event Bourse, dealer interpol";
	};
	case (_rand <= 55): //10% Crise pétrolière
	{
		[[0,"News: Un pétrolier vient de couler!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["oilp",200, true] call life_fnc_marketBuy; 
		
		diag_log "Event Bourse, pétrole";
	};
	case (_rand <= 70): //15% World-China-Center Ciment, fer et vitres
	{
		[[0,"News: La chine lance le chantier du World-China-Center!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["cement", 200, true] call life_fnc_marketBuy; 
		["iron_r", 100, true] call life_fnc_marketBuy; 
		["glass", 150, true] call life_fnc_marketBuy; 
		
		diag_log "Event Bourse, ciment, fer, vitre";
	};
	/* case (_rand <= 60): //4% Goldpreis sinkt
	{
		[[0,"News: Les traders perdent confiance dans l'or!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["gold", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["goldr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		
		diag_log "+Market+ Event goldm";
	}; */
	case (_rand <= 80): //10% Industrie a besoin de Cuivre
	{
		[[0,"News: L'industrie électronique a besoin de cuivre !"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		/* ["gold", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["goldr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["silver", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; */
		["silverr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["copper_r", 200, true] call life_fnc_marketBuy;
		diag_log "Bourse Event, cuivre";
	};
	/* case (_rand <= 74): //6% Goldpreis erhöht sich
	{
		[[0,"News: Les investisseurs perdent confiance aux dollars!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["gold", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["goldr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "+Market+ Event goldp";
	}; 
	case (_rand <= 90): //10% Marijuana médicinale
	{
		[[0,"News: La marijuana médicinale est de plus en plus rare!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", 300, true] call life_fnc_marketSell;
		
 		["cocainep", 200, true] call life_fnc_marketSell; 
		["heroinp", 200, true] call life_fnc_marketSell; 
		["froglsd", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["cocaine", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["heroinu", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		diag_log "Bourse Event, marijuana";
	};*/
	case (_rand <= 100): //10% La chine veux des tortues 
	{
		[[0,"News: La Chine a découvert les tortues comme un nouveau médicament!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		//Erhöhe Marktpreis mit marketSell
		["turtle", 150, true] call life_fnc_marketBuy; 	
		
		diag_log "Bourse Event tortue";
	};
	default //market change: default version
	{
		//diag_log format["[MARKET] marketChange did nothing. Rand=%1", _rand];
		{
			//Get default price
			_defaultprice = 0;
			_shortname = _x select 0;
			_price = _x select 1;
			_globalchange = _x select 2;
		
			{
				if((_x select 0) == _shortname) exitWith
				{
					_defaultprice = _x select 1;
				};
			}
			foreach life_market_resources;
			
			if(_defaultprice > 0) then
			{
			
				//Get difference
				_difference = _defaultprice - _price; //Defaultprice - current price
			
				_modifier = _difference * (random 0.4);
				_modifier = round _modifier;
			
				//Protecting hard caps
				/*if( _modifier < -700) then {_modifier = -700;};
				if( _modifier > 700) then {_modifier = 700;};*/
			
				//_modifier = [-15,25] call life_fnc_randomRound; //Verkaufte/Gekaufte Items
				
				/*if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call life_fnc_marketSell; 
				}
				else
				{
					[_x select 0, _modifier, true] call life_fnc_marketBuy; 
				};*/
				
				diag_log format["+Market+ Correcting market value of %1 from %2 to %3 by %4", _shortname, _price, (_price + _modifier), _modifier];
				
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				
				
				
				//New price arr
				life_market_prices set [_forEachIndex, [_shortname, _price,_globalchange,_modifier] ]; //set raw values
			
			}
			else
			{
				diag_log format["+Market+ Cannot correct market value of %1", _shortname];
			};
		}
		foreach life_market_prices;
	};
};

publicVariable "life_market_prices";