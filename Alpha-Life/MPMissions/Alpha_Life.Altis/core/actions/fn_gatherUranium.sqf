/*
	File: fn_gatherUranium.sqf
	
	Description:
	Gathers Uranium?
*/
private["_sum","_rndm"];

_rndm = [1,2,3,4] call BIS_fnc_selectRandom; _sum = ["uranium1",_rndm,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_gather = true;
	titleText["R�colte des d�chets d'Uranium...","PLAIN"];
	titleFadeOut 6;
	sleep 6;
	if(([true,"uranium1",_sum] call life_fnc_handleInv)) then
	{
		titleText[format["Tu as ramass� %1 d�chets d'Uranium.",_sum],"PLAIN"];
	};
};

life_action_gather = false;