extends UnitCard
class_name SupportUnit

var UnitName : String
var Quantity : int = 1
var Elite := false
var BattleValueRegular : int
var BattleValueElite : int

func _init(_name, bvReg, bvElite):
	UnitName = _name
	BattleValueRegular = bvReg
	BattleValueElite = bvElite

func Print_Details() -> String:
	return "%s x %s%s" % [Quantity, ("Elite " if Elite else ""), UnitName]

func _recalculate_Effective_Value() -> int:
	return Quantity * BattleValueElite if Elite else Quantity * BattleValueRegular

func Upgrade() -> void: #Oui c'est normal que ça puisse "rien" faire
	if randi() % 2:
		Elite = true
	else:
		Quantity += 1

func Downgrade() -> void: #Oui c'est normal que ça puisse "rien" faire
	if randi() % 2:
		Elite = false
	else:
		Quantity = clampi(Quantity - 1, 1, 1000)

func Is_Same_As(unit : UnitCard) -> bool:
	if unit is SupportUnit:
		return UnitName == unit.UnitName
	else:
		return false
