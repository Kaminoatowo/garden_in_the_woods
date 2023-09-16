extends Node2D

var cur_date : String = "00-00-0000"
var cur_time : String = "00:00"
var player_hp #unused
var player_mp #unused

var Selected = 1

# in-game dictionaries
var Player = {
	"Name" : "",
	"Position" : null,
}
var Plot = []
var Harvests = []

# loading dictionaries
var Curr_plot = []
var Curr_Harvests = []


#{
#	"Seed" : "",
#	"TimeLeft" : 0,
#	"Stage": 0,
#	"Position": Vector2(),
#}
