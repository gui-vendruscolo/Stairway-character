extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	SceneTransition.change_scene("res://scenes/main_scene.tscn")
	$VBoxContainer/StartButton.set_focus_mode(Control.FOCUS_NONE)
	
	
func _on_options_button_pressed():
	pass

func _on_quit_button_pressed():
	get_tree().quit()
