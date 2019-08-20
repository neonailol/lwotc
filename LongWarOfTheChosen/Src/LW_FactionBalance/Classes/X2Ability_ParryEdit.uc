//from AngelRane
class X2Ability_ParryEdit extends X2AbilityTemplate;


static function EditParry(X2AbilityTemplate Template)
{
	local X2AbilityTemplate						ParryTemplate;
	local X2Effect_Persistent                   PersistentEffect;

	ParryTemplate = Template;
	ParryTemplate.AbilityTargetEffects.Length = 0;

//	ParryTemplate.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
//	ParryTemplate.Hostility = eHostility_Neutral;
//	ParryTemplate.AdditionalAbilities.AddItem('ParryActivate');
//BEGIN AUTOGENERATED CODE: Template Overrides 'Parry'
//	ParryTemplate.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_parry";
//	ParryTemplate.AbilitySourceName = 'eAbilitySource_Psionic';
//END AUTOGENERATED CODE: Template Overrides 'Parry'

//	ParryTemplate.AbilityToHitCalc = default.DeadEye;
//	ParryTemplate.AbilityTargetStyle = default.SelfTarget;
//	ParryTemplate.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentEffect = new class'X2Effect_ParryNew';
	PersistentEffect.BuildPersistentEffect(1, true, false);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, ParryTemplate.LocFriendlyName, ParryTemplate.GetMyHelpText(), ParryTemplate.IconImage, true, , ParryTemplate.AbilitySourceName);
	ParryTemplate.AddTargetEffect(PersistentEffect);

//	ParryTemplate.BuildNewGameStateFn = TypicalAbility_BuildGameState;
//	ParryTemplate.BuildVisualizationFn = none;

//	return ParryTemplate;
}


static function EditDeflect(X2AbilityTemplate Template)
{
	local X2AbilityTemplate						DeflectTemplate;
	local X2Effect_Persistent                   Effect;
	
	DeflectTemplate = Template;
	DeflectTemplate.AbilityTargetEffects.Length = 0;

//	DeflectTemplate.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
//	DeflectTemplate.Hostility = eHostility_Neutral;

//BEGIN AUTOGENERATED CODE: Template Overrides 'Deflect'
//	DeflectTemplate.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_deflectshot";
//	DeflectTemplate.AbilitySourceName = 'eAbilitySource_Psionic';
//END AUTOGENERATED CODE: Template Overrides 'Deflect'
//	DeflectTemplate.AbilityToHitCalc = default.DeadEye;
//	DeflectTemplate.AbilityTargetStyle = default.SelfTarget;
//	DeflectTemplate.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	Effect = new class'X2Effect_DeflectNew';
	Effect.BuildPersistentEffect(1, true, false);
	Effect.SetDisplayInfo(ePerkBuff_Passive, DeflectTemplate.LocFriendlyName, DeflectTemplate.GetMyHelpText(), DeflectTemplate.IconImage, true, , DeflectTemplate.AbilitySourceName);
	DeflectTemplate.AddTargetEffect(Effect);

//	DeflectTemplate.BuildNewGameStateFn = TypicalAbility_BuildGameState;
//	DeflectTemplate.BuildVisualizationFn = none;

//	return DeflectTemplate;
}