extends Node

var candies_collected;
var countdown
var game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	candies_collected = 0
	countdown = 30
	game_over = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
