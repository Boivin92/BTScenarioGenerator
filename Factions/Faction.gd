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
	PossibleMechs.clear()
	for mech in mechArray.records:
		var m := Mech.new(mech[0], int(mech[1]), int(mech[2]), mech[3])
		PossibleMechs.append(m)

func load_support_assets(assetsArray : CsvData):
	PossibleSupportAssets.clear()
	for asset in assetsArray.records:
		PossibleSupportAssets.append(SupportUnit.new(asset[0], asset[1], asset[2]))
