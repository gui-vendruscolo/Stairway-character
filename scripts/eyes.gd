extends Node2D

var interval = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	interval = randf_range(3, 10)
	blink()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func blink():
	await get_tree().create_timer(interval).timeout
	$TextureRect/AnimationPlayer.play("blinking")
	blink()
	
