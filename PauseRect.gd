extends ColorRect


func _physics_process(delta):
	pass

func pause():
	get_tree().paused = !get_tree().paused

func _on_tween_finished():
	pause()
