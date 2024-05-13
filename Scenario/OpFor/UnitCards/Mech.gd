extends UnitCard
class_name Mech

var Chassis : String
var BattleValue : int
var Gunnery : int
var Piloting : int

#Piloting / Gunnery
const BV_MULT_TABLE := [
	[2.42, 2.21, 1.93, 1.66, 1.38, 1.31, 1.24],
	[2.31, 2.11, 1.85, 1.58, 1.32, 1.19, 1.12],
	[2.21, 2.02, 1.76, 1.15, 1.26, 1.13, 1.07],
	[2.10, 1.92, 1.68, 1.44, 1.20, 1.08, 1.02],
	[1.93, 1.76, 1.54, 1.32, 1.10, 0.99, 0.94],
	[1.75, 1.60, 1.40, 1.20, 1.00, 0.90, 0.85],
	[1.68, 1.54, 1.35, 1.16, 0.95, 0.86, 0.81]
]

func Print_Details() -> String:
	return Chassis + " (" + str(Gunnery) + " / " + str(Piloting) + ")"

func Recalculate_Effective_Value() -> void:
	EffectiveValue = BattleValue * BV_MULT_TABLE[Piloting][Gunnery]

func Upgrade() -> void: #Oui c'est normal que ça puisse "rien" faire
	if randi() % 2:
		Gunnery = clampi(Gunnery - 1, 0, 6)
	else:
		Piloting = clampi(Piloting - 1, 0, 6)

func Downgrade() -> void: #Oui c'est normal que ça puisse "rien" faire
	if randi() % 2:
		Gunnery = clampi(Gunnery + 1, 0, 6)
	else:
		Piloting = clampi(Piloting + 1, 0, 6)

func Is_Same_As(unit : UnitCard) -> bool:
	if unit is Mech:
		var selfChassis = Chassis.split(" ")
		var otherChassis = Chassis.split(" ")
		for i in selfChassis.size()-1:
			if otherChassis[i] != selfChassis[i]:
				return false
		return true
	return false
