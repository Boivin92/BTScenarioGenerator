extends Node
class_name UnitCard

var EffectiveValue : int:
	get:
		Recalculate_Effective_Value()
		return EffectiveValue
	set(value):
		EffectiveValue = value

func Print_Details() -> String:
	return ""

func Recalculate_Effective_Value() -> void:
	pass

func Upgrade() -> void:
	pass

func Downgrade() -> void:
	pass

func Is_Same_As(unit : UnitCard) -> bool:
	return false
