extends Node
class_name Mech

var Chassis : String
var Tonnage : int
var BattleValue : int
var Role : String

func _init(chassis, tonnage, bv, role):
	Chassis = chassis
	Tonnage = tonnage
	BattleValue = bv
	Role = role
