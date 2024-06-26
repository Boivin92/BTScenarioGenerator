extends Node
class_name OpForConfig

var ExpectedBV : int = 4000 # Target BV2 for whole force
var Tolerance : float = 0.05 # % of possible deviation over or below the target
var MinMechs : int = -1
var MaxMech : int = -1
var Roles : Dictionary = { #Number of mechs expected in each role. -1 to ignore
	"Ambusher" : -1, 
	"Brawler" : -1,
	"Juggernaut" : -1,
	"Missile Boat" : -1,
	"Scout" : -1,
	"Skirmisher" : -1,
	"Striker" : -1,
	"Sniper" : -1}
var Weights : Dictionary = { #Number of mechs expected in each class. -1 to ignore
	"Light" : -1, 
	"Medium" : -1, 
	"Heavy" : -1, 
	"Assault" : -1}
var PilotingRange : Array = range(7) #0 to 6
var GunneryRange : Array = range(7) #0 to 6
var AllowSupport : bool = false
var ShareAllowedToSupport : float = 0.4 # % of Force, in BV2, that will be taken by support units
