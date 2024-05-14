extends Node
class_name Faction

var FactionName : String
var PossibleMechs : Array
var PossibleSupportAssets : Array
var Logo : Texture2D

func _init(fname : String, logo : Texture2D) -> void:
	FactionName = fname
	Logo = logo
	
func load_mechs(mechArray : CsvData):
	for mech in mechArray.records:
		var m := Mech.new()
		m.Chassis = mech[0]
		m.Tonnage = mech[1]
		m.BattleValue = mech[2]
		m.Role = mech[3]
		m.Gunnery = 4
		m.Piloting = 5
		PossibleMechs.append(m)

func load_support_assets(assetsArray : CsvData):
	for asset in assetsArray.records:
		PossibleSupportAssets.append(SupportUnit.new(asset[0], asset[1], asset[2]))
