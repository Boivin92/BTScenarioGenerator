extends Node

const LIAO = "Liao"
const MARIK = "Marik"
const PIRATES = "Pirates"

var Factions := {
	LIAO : Faction.new(LIAO, preload("res://Factions/liao.png")), 
	MARIK : Faction.new(MARIK, preload("res://Factions/marik.png")), 
	PIRATES: Faction.new(PIRATES, preload("res://Factions/pirates.png"))}

func _ready() -> void:
	reload()
	
func reload():
	Factions.Liao.load_mechs(preload("res://Factions/Liao.csv"))
	Factions.Marik.load_mechs(preload("res://Factions/marik.csv"))
	Factions.Pirates.load_mechs(preload("res://Factions/pirates.csv"))

	Factions.Liao.load_support_assets(preload("res://Factions/support.csv"))
	Factions.Marik.load_support_assets(preload("res://Factions/support.csv"))
	Factions.Pirates.load_support_assets(preload("res://Factions/support.csv"))
