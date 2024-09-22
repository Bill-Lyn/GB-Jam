extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	Global.candies_collected = Global.candies_collected + 1
	queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interaction_area_body_entered(body):
	pass # Replace with function body.
