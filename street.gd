extends Node2D

var candies_collected;
var candies_location: Array[bool] = []
var pickup = preload("res://pickup.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.candies_collected = 0
	Global.game_over = false
	Global.countdown = 30
	var random = RandomNumberGenerator.new()
	random.randomize()
	candies_collected = 0
	for n in 50:
		#now create all of the candy objects based on is the coordinate is true or false.
		var candy = pickup.instantiate()
		#set the position
		candy.position.x = randi() % 1000 - 500;
		candy.position.y = randi() % 1000 - 500;
		add_child(candy)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_score_timer_timeout():
	Global.countdown = Global.countdown - 1
	if(Global.countdown == 0):
		Global.game_over = true
		get_tree().change_scene_to_file("res://TheEnd.tscn")
