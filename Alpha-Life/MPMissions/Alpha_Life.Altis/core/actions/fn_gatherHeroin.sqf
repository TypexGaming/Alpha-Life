/*
	File: fn_gatherHeroin.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers heroin?
*/
private["_sum","_rndm"];
_rndm = [1,2,3,4] call BIS_fnc_selectRandom; _sum = ["heroinu",_rndm,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_gather = true;
	//life_action_inUse = true;
	titleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_Heroin"],"PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"heroinu",_sum] call life_fnc_handleInv)) then
	{
		titleText[format[localize "STR_NOTF_Collected",_sum,localize "STR_Item_Heroin"],"PLAIN"];
	};
        }
	else
{
	hint localize "STR_NOTF_InvFull";
};

//life_action_inUse = false;
life_action_gather = false;