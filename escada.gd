extends Area2D



var active := false

var dir := -1 # -1 or 1


var step := 10.0

func _ready():
	pass


func _physics_process(delta):
	if active:
		var dir = Input.get_axis("ui_left", "ui_right")
		print(global_position.x)
		global_position.x += dir * step


func _on_body_entered(body):
	if !body.climbing:
		body.climbing = true



func _on_body_exited(body):
	if body.climbing:
		body.climbing = false


func texture_get_size() -> Vector2:
	return $Sprite.get_texture().get_size()




