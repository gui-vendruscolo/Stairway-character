extends CharacterBody2D

const SPEED = 300.0

var active := false

enum Dir {UP = -1, DOWN = 1}
@export var dir: Dir = Dir.UP

var step := 10.0

func _ready():
	pass


func _physics_process(delta):
	if active:
		var dir_x = Input.get_axis("ui_left", "ui_right")
		if dir_x:
			velocity.x = dir_x * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		high_light(true)
		
		var dir_y = Input.get_axis("ui_up", "ui_down")
		if dir_y:
			velocity.y = dir_y * SPEED
	else:
		velocity = Vector2.ZERO
		high_light(false)

	move_and_slide()


func texture_get_size() -> Vector2:
	return $Sprite.get_texture().get_size()


func high_light(b: bool):
	if b:
		modulate = Color.RED
	else:
		modulate = Color.WHITE


func _on_area_body_entered(body):
	if !body.is_climbing:
		body.y_direction = dir
		body.set_collision_mask_value(2, false)
		body.is_climbing = true


func _on_area_body_exited(body):
	if body.is_climbing:
		body.set_collision_mask_value(2,true)
		body.is_climbing = false
