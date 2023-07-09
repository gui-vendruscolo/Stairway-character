extends Node2D


@onready var escadas = $Escadas.get_children()

var active_escada

var top_limit    := 0
var bottom_limit := 1280

const WINDOW_HEIGHT := 1280
const WINDOW_WIDTH  := 1120

@onready var _Player = $MyPlayer

var health := 1


func _ready():
	$Camera.position = Vector2(WINDOW_WIDTH/2,WINDOW_HEIGHT/2)
	



func _physics_process(delta):
	if health <= 0:
		die()
	
	if _Player.position.y < top_limit:
		var tween = get_tree().create_tween()
		tween.tween_property($Camera, "global_position:y", $Camera.global_position.y-WINDOW_HEIGHT, 0.5)
		top_limit    -= WINDOW_HEIGHT
		bottom_limit -= WINDOW_HEIGHT
	elif _Player.position.y > bottom_limit:
		var tween = get_tree().create_tween()
		tween.tween_property($Camera, "global_position:y", $Camera.global_position.y+WINDOW_HEIGHT, 0.5)
		bottom_limit += WINDOW_HEIGHT
		top_limit    += WINDOW_HEIGHT



func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos := get_global_mouse_position()
		for e in escadas:
			var texture_size = e.texture_get_size() # TODO: Might need scale
			var center = e.global_position
			if (
				(mouse_pos.x >= center.x-texture_size.x/2 and mouse_pos.x <= center.x+texture_size.x/2) and
				(mouse_pos.y >= center.y-texture_size.y/2 and mouse_pos.y <= center.y+texture_size.y/2) and
				!e.active
			):
				e.active = true
				if active_escada != null: active_escada.active = false
				active_escada = e



func die():
	# TODO: Death animation
	get_tree().change_scene_to_file("res://main_scene.tscn")







