//--------------------------------------------------------------------------------------- 
//  FILE:    X2Effect_GrazingFire
//  AUTHOR:  John Lumpkin (Pavonis Interactive)
//  PURPOSE: Sets up Grazing Fire -- enemy must make saving throw versus dodge to avoid
// being grazed on a miss
//--------------------------------------------------------------------------------------- 

class X2Effect_TemplarGrazingFire extends X2Effect_Persistent;

var int GrazeMinFocus, SuccessChance, GrazePerFocusChance;

function bool ChangeHitResultForAttacker(XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult)
{
	local int FocusLevel, randroll, hitchance;

	//`LOG ("Grazing Fire 1");
	if (AbilityState.GetSourceWeapon() == Attacker.GetItemInSlot(eInvSlot_SecondaryWeapon))
	{
		//`LOG ("Grazing Fire 2");
		if (class'XComGameStateContext_Ability'.static.IsHitResultMiss(CurrentResult))
		{
			FocusLevel = Attacker.GetTemplarFocusLevel();
			if (FocusLevel >= GrazeMinFocus)
			{
			//	Chance = default.DeflectBaseChance + ((FocusLevel - 1) * default.DeflectPerFocusChance);
			//	RandRoll = `SYNC_RAND(100);
			//	if (RandRoll <= Chance)
				
				//`LOG ("Grazing Fire 3");
				RandRoll = `SYNC_RAND(100);
				HitChance = SuccessChance + ((FocusLevel - 1) * GrazePerFocusChance) - TargetUnit.GetCurrentStat(eStat_Dodge);
				if (Randroll <= HitChance)
				{
					//`LOG ("Grazing Fire 4");
					NewHitResult = eHit_Graze;
					return true;
				}
			}
		}
	}
	return false;
}
