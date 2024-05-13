extends Node

# Level : BV per 50 tons
const DIFFICULTIES := {
	"Easy" : 950, 
	"Normal" : 1100, 
	"Hard" : 1250,
	"Suicide" : 1500}

const LIMITATIONS := [
	"No light 'Mech",
	"No Assault 'Mech",
	"Single Lance Drop"
] #TODO: Add more potential limitations

var Mission : MissionType
var OpposingForce := OpFor.new()
var Difficulty #TODO: Pick a difficulty, maybe based on a flipped squareroot curve or something

var Payouts := [] #of Payouts
var Limitations := [] #pick 0..n from LIMITATIONS
var SideMission : SecondaryObjective
var SecondaryPayout : Payout
var Twist : MissionTwist
var TerrainType := [] #of TerrainFeature

var Employer : Faction
var Target : Faction

var PayoutHidden : bool
var SecondaryHidden : bool
var TwistHidden : bool
var TerrainTypeHidden : bool

func _ready() -> void:
	pass
