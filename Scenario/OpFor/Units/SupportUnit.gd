extends Node
class_name SupportUnit

var UnitName : String
var BattleValueRegular : int
var BattleValueElite : int

func _init(n, bvr, bve) -> void:
	UnitName = n
	BattleValueRegular = bvr
	BattleValueElite = bve
