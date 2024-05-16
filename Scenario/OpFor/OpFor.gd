extends Node
class_name OpFor

var Units : Array = []
var Loyalty : Faction
var EffectiveBV : int :
	get:
		return EffectiveBV
	set(value):
		EffectiveBV = value

func Try_Add_Unit(new_unit : UnitCard) -> bool:
	for i in Units:
		if not validate_different(i, new_unit):
			return false
	Units.append(new_unit)
	return true
	
func validate_different(unit1 : UnitCard, unit2 : UnitCard) -> bool:
	return not unit1.Is_Same_As(unit2)


# NOTE: Pour l'instant j'ai pas l'intention de mettre une méchanique qui check si la config se peux
# Have fun avec une config impossible qui cause une infinite loop, fucker
func Build(config : OpForConfig) -> void:
	
	# REGION : SUPPORT
	if config.AllowSupport:
		var lower = config.ExpectedBV * config.ShareAllowedToSupport * (1-config.Tolerance)
		var upper = config.ExpectedBV * config.ShareAllowedToSupport * (1+config.Tolerance)
		var effectiveSupport = 0
		
		while not (lower < effectiveSupport and effectiveSupport < upper):
			var possibleStrategies := []
			if effectiveSupport < lower:
				possibleStrategies.append(_upgrade_random_support)
				possibleStrategies.append(func(): _add_random_support(upper - effectiveSupport))
			else:
				possibleStrategies.append(_downgrade_random_support)
				possibleStrategies.append(func() : _remove_random_support(effectiveSupport - lower))
			
			possibleStrategies.pick_random().call()
			
			#recalculate EBV2 for supports
			effectiveSupport = Units.filter(
				func(u: UnitCard) : return u is SupportCard
				).reduce(
					func(accum, u : SupportUnit) : return accum + u.EffectiveValue, 0)
	
	
	# REGION : MECHS
	
	pass

func _upgrade_random_support():
	Units.filter(func(u : UnitCard) : return u is SupportCard).pick_random().Upgrade()

func _add_random_support(maxValue : int):
	var newUnit : SupportUnit = Loyalty.PossibleSupportAssets.filter(
		func(possibleUnit): return not Units.any(
			func(registeredUnit : UnitCard): return registeredUnit.Is_Same_As(possibleUnit))).filter(
				func(possibleUnit : SupportUnit): return possibleUnit.BattleValueRegular < maxValue).pick_random()
	Units.append(SupportCard.new(newUnit, 1, false))

func _remove_random_support(maxValue : int):
	Units.remove_at(Units.find(
		Units.filter(
			func(u) : return u is SupportCard).filter(
				func(u : SupportCard) : return u.EffectiveValue < maxValue).pick_random()))

func _downgrade_random_support():
	Units.filter(func(u : UnitCard) : return u.unit is SupportUnit).pick_random().Downgrade()
