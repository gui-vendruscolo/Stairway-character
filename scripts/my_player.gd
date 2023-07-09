extends CharacterBody2D


@onready var _Animations = $AnimatedSprite2D

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_climbing = false

var x_direction = 1

var y_direction

var health := 1

signal player_is_dead

func _physics_process(delta):
	if health <= 0:
		die()

	# Add the gravity.
	if not is_on_floor() and !is_climbing:
		velocity.y += gravity * delta

	if is_on_wall():
		x_direction = -x_direction

	if is_climbing:
		velocity.y = y_direction * SPEED
		velocity.x = 0
	else:
		if x_direction:
			velocity.x = x_direction * SPEED
			_Animations.play("walking")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _process(delta):
	turn_on_move()

func turn_on_move():
	if velocity.x > 0:
		scale.x = scale.y * 1
	elif velocity.x < 0:
		scale.x = scale.y * -1

func die():
	# TODO: Death animation
	player_is_dead.emit()
