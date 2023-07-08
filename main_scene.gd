extends Node2D


@onready var escadas = $Escadas.get_children()

var active_escada


func _ready():
	pass


func _physics_process(delta):
	pass


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos := get_global_mouse_position()
		for e in escadas:
			var texture_size = e.texture_get_size() # TODO: Might need scale
			var center = e.global_position
			if (
				(mouse_pos.x >= center.x-texture_size.x/2 and mouse_pos.x <= center.x+texture_size.x/2) and
				(mouse_pos.y >= center.y-texture_size.y/2 and mouse_pos.y <= center.y+texture_size.y/2)
			):
				e.active = true
				if active_escada != null: active_escada.active = false
				active_escada = e











