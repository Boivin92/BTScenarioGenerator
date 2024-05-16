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
	
	#FIXME: J'ai fait une erreur pi ça me tente pas de tout corriger pour l'instant
	#Faudrait séparé le Mech de la UnitCard, pareil pour les support
	#Ça nous permettrait de créer des unitcards en injectant une unit, plutôt que de devoir reloader
	#Oops I guess
	#Workaround en attendant que la motivation revienne
	FactionLoader.reload()
	
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
				func(u: UnitCard) : return u is SupportUnit
				).reduce(
					func(accum, u : SupportUnit) : return accum + u.EffectiveValue, 0)
	
	
	# REGION : MECHS
	
	pass

func _upgrade_random_support():
	Units.filter(func(u : UnitCard) : return u is SupportUnit).pick_random().Upgrade()

func _add_random_support(maxValue : int):
	Units.append(Loyalty.PossibleSupportAssets.filter(
					func(a : SupportUnit): return not Units.any(
						func(u : UnitCard) : return u.Is_Same_As(a))).filter(
							func(a : SupportUnit):return a.BattleValueRegular < maxValue).pick_random())

func _remove_random_support(maxValue : int):
	Units.remove_at(Units.find(
		Units.filter(
			func(u) : return u is SupportUnit).filter(
				func(u : SupportUnit) : return u.EffectiveValue < maxValue).pick_random()))

func _downgrade_random_support():
	Units.filter(func(u : UnitCard) : return u is SupportUnit).pick_random().Downgrade()
