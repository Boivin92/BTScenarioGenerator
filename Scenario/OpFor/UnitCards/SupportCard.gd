extends UnitCard
class_name SupportCard

var Quantity : int = 1
var Elite := false

func _init(supUnit, qte, isElite):
	unit = supUnit
	Quantity = qte
	Elite = isElite

func Print_Details() -> String:
	return "%s x %s%s" % [Quantity, ("Elite " if Elite else ""), unit.UnitName]

func _recalculate_Effective_Value() -> int:
	return Quantity * unit.BattleValueElite if Elite else Quantity * unit.BattleValueRegular

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

func Is_Same_As(other) -> bool:
	if other is SupportUnit:
		return unit.UnitName == other.UnitName
	else:
		return false
