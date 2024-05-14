extends Node
class_name UnitCard

var EffectiveValue : int:
	get:
		return _recalculate_Effective_Value()

func Print_Details() -> String:
	return ""

func _recalculate_Effective_Value() -> int:
	return 0

func Upgrade() -> void:
	pass

func Downgrade() -> void:
	pass

func Is_Same_As(unit : UnitCard) -> bool:
	return false
