//from Udaya
class X2Ability_TemplarAbilitySet_SupremeFocus extends X2Ability_TemplarAbilitySet config(LW_FactionBalance);

var config int FOCUS4MOBILITY;
var config int FOCUS4DODGE;
var config int FOCUS4RENDDAMAGE;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(TemplarFocus());
	Templates.AddItem(SupremeFocus());
	return Templates;
}

static function X2AbilityTemplate TemplarFocus()
{
	local X2AbilityTemplate		Template;
	local X2Effect_TemplarFocus	FocusEffect;
	local array<StatChange>		StatChanges;
	local StatChange			NewStatChange;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TemplarFocus');

//BEGIN AUTOGENERATED CODE: Template Overrides 'TemplarFocus'
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_InnerFocus";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
//END AUTOGENERATED CODE: Template Overrides 'TemplarFocus'
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	FocusEffect = new class'X2Effect_TemplarFocus';
	FocusEffect.BuildPersistentEffect(1, true, false);
	FocusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false, , Template.AbilitySourceName);
	FocusEffect.EffectSyncVisualizationFn = FocusEffectVisualization;
	FocusEffect.VisualizationFn = FocusEffectVisualization;

	//	focus 0
	StatChanges.Length = 0;
	FocusEffect.AddNextFocusLevel(StatChanges, 0, 0);
	//	focus 1
	StatChanges.Length = 0;
	NewStatChange.StatType = eStat_Mobility;
	NewStatChange.StatAmount = default.FOCUS1MOBILITY;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_Dodge;
	NewStatChange.StatAmount = default.FOCUS1DODGE;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.FOCUS1RENDDAMAGE);
	//	focus 2
	StatChanges.Length = 0;
	NewStatChange.StatType = eStat_Mobility;
	NewStatChange.StatAmount = default.FOCUS2MOBILITY;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_Dodge;
	NewStatChange.StatAmount = default.FOCUS2DODGE;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.FOCUS2RENDDAMAGE);
	//	focus 3
	StatChanges.Length = 0;
	NewStatChange.StatType = eStat_Mobility;
	NewStatChange.StatAmount = default.FOCUS3MOBILITY;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_Dodge;
	NewStatChange.StatAmount = default.FOCUS3DODGE;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.FOCUS3RENDDAMAGE);
	//	focus 4
	StatChanges.Length = 0;
	NewStatChange.StatType = eStat_Mobility;
	NewStatChange.StatAmount = default.FOCUS4MOBILITY;
	StatChanges.AddItem(NewStatChange);
	NewStatChange.StatType = eStat_Dodge;
	NewStatChange.StatAmount = default.FOCUS4DODGE;
	StatChanges.AddItem(NewStatChange);
	FocusEffect.AddNextFocusLevel(StatChanges, 0, default.FOCUS4RENDDAMAGE);
	
	Template.AddTargetEffect(FocusEffect);

	Template.AdditionalAbilities.AddItem('FocusKillTracker');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	return Template;
}

static function X2AbilityTemplate SupremeFocus()
{
	local X2AbilityTemplate Template;

	Template = PurePassive('SupremeFocus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_SupremeFocus", false, 'eAbilitySource_Psionic', false);
	Template.PrerequisiteAbilities.AddItem('DeepFocus');

	return Template;
}
