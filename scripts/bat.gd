extends Area2D

@onready var _Animations = $AnimatedSprite2D

@export var speed: int = 140

var dir := 1

var outside_screen := true

var to_die

func _ready():
	$AnimatedSprite2D.play("flying")
	pass


func _physics_process(delta): #TODOIF: Make this better
	global_position.x += dir*speed*delta
	
	if to_die == -50:
		if global_position.x <= to_die:
			queue_free()
	else:
		assert(to_die == 513+50)
		if global_position.x >= 513+50:
			queue_free()


func _process(delta):
	pass
