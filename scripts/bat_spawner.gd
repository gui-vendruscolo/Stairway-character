extends Marker2D

@export var time: float = 2


const WINDOW_WIDTH := 513

var bat_scene := preload("res://scenes/bat.tscn")

var main_scene


func _ready():
	main_scene = get_tree().root.get_node("MainScene")
	assert(WINDOW_WIDTH == get_viewport_rect().size.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawn_bat()


func spawn_bat():
	var bat = bat_scene.instantiate()
	bat.global_position = self.global_position
	if bat.global_position.x >= WINDOW_WIDTH:
		bat.dir = -1
		bat.to_die = -50
	else: # x < 0
		bat.dir = 1
		bat.to_die = WINDOW_WIDTH+50
	main_scene.add_child(bat)
