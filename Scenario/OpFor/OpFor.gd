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

func Build(config : OpForConfig) -> void:
	
	#Strategy pattern example
	var available_strategies := []
	available_strategies.append(func(): _add_mech_strategy(20,100,"skirmisher"))
	available_strategies.append(func(): _remove_mech_strategy("Heaviest"))
	available_strategies.append(func(): _upgrade_strategy("MECH"))
	available_strategies.pick_random().call()
	#End of example
	pass

func _add_mech_strategy(min,max,role):
	pass

func _remove_mech_strategy(weight):
	pass

func _upgrade_strategy(what):
	pass
