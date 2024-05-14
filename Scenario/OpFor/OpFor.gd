extends Node
class_name OpFor

var ExpectedBV : int
var Units : Array = []
var Loyalty : Faction
var AllowSupports : bool = false
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

func Build(limits : Array) -> void:
	pass

##GOAL: The API should eventually allow for something like this:
##	opFor.Build([
##		ExpectedBv.new(4000, 0.95, 1.05), #BV, lower acceptable %, higher acceptable %
##		AtLeast.new(1, LIGHT), #Combine Max + Min to force a certain mech type
##		AtMost.new(2, ASSAULT), 
##		LanceSize.new(1, 4), #LanceSize only counts 'Mechs, not support vehicles
##		RolesMustInclude.new(1, "Skirmisher"),
##		RolesExclude.new("Scout"),
##		GunneryRange.new(3,6),
##		PilotingRange.new(0,5),
##		SupportShareOfBv.new(0.6) #if set to 0, add no support units
##		])
