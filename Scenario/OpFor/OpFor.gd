extends Node
class_name OpFor

var Units : Array = []
var Loyalty : Faction

func Try_Add_Unit(new_unit : UnitCard) -> bool:
	for i in Units:
		if not validate_different(i, new_unit):
			return false
	Units.append(new_unit)
	return true
	
func validate_different(unit1 : UnitCard, unit2 : UnitCard) -> bool:
	return not unit1.Is_Same_As(unit2)
