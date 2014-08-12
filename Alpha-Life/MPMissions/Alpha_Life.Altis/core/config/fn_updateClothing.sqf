/*

	Updates player clothing by replacing vanilla by custom ones
        by Audacious

*/

private["_uniform","_backpack"];

///Uniform
////////////////

_uniform = uniform player;

switch(true) do
{
	case (playerSide == west && _uniform == "U_Rangemaster"):
	{
		if( (call life_coplevel) > 1) then
		{
			player setObjectTextureGlobal  [0, "textures\cloth_cop\police_shirt.paa"]; 
		}
		else
		{
			player setObjectTextureGlobal  [0, "textures\cloth_cop\police_uniform.paa"]; 
		};
		
		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
	
	case (playerSide == independent && _uniform == "U_I_HeliPilotCoveralls"):
	{
		if( (call life_medicLevel) > 1) then
		{
			player setObjectTextureGlobal  [0, "textures\cloth_med\medic_uniform.jpg"];
		}
		else
		{
			player setObjectTextureGlobal  [0, "textures\cloth_med\medic_uniform1.jpg"]; 
		};
		
		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
};

///backpack
////////////////