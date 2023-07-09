extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func change_scene(target):
	$AnimationPlayer.play("dissolve")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("dissolve")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
