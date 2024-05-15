extends Node
class_name OpForConfig

var ExpectedBV : int = 4000
var Tolerance : float = 0.05
var MinMechs : int = -1
var MaxMech : int = -1
var Roles : Dictionary = {
	"Ambusher" : -1, 
	"Brawler" : -1,
	"Juggernaut" : -1,
	"Missile Boat" : -1,
	"Scout" : -1,
	"Skirmisher" : -1,
	"Striker" : -1,
	"Sniper" : -1}
var Weights : Dictionary = { 
	"Light" : -1, 
	"Medium" : -1, 
	"Heavy" : -1, 
	"Assault" : -1}
var PilotingRange : Array = range(7) #0 to 6
var GunneryRange : Array = range(7) #0 to 6
var AllowSupport : bool = false
var ShareAllowedToSupport : float = 0.4
