extends Node2D

var active_escada

var top_limit    := 0
var bottom_limit := WINDOW_HEIGHT

const WINDOW_WIDTH   := 513
const WINDOW_HEIGHT  := 586


@onready var escadas = $Escadas.get_children()
@onready var _Player = $MyPlayer


func _ready():
	$Camera.position = Vector2(WINDOW_WIDTH/2,WINDOW_HEIGHT/2)
	$Camera.limit_left   = 0
	$Camera.limit_right  = WINDOW_WIDTH
	$Camera.limit_bottom = WINDOW_HEIGHT
	
	for e in escadas:
		e.scale_set()
	
	$Spawners/bat_spawner4.start_time()


func _physics_process(delta):
	if _Player.position.y < top_limit:
		var tween = get_tree().create_tween()
		tween.tween_property($Camera, "global_position:y", $Camera.global_position.y-WINDOW_HEIGHT, 0.5)
		top_limit    -= WINDOW_HEIGHT
		bottom_limit -= WINDOW_HEIGHT
	elif _Player.position.y > bottom_limit+30:
		_Player.die()

	if Input.is_action_just_pressed("reset"):
		SceneTransition.change_scene("res://scenes/main_scene.tscn")


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


func _on_my_player_player_is_dead():
	SceneTransition.change_scene("res://scenes/main_scene.tscn")


func _on_trigger_player_entered():
	$Spawners/bat_spawner.start_time()
	$Spawners/bat_spawner.spawn_bat()
	$Spawners/bat_spawner2.start_time()
	$Spawners/bat_spawner2.spawn_bat()


func _on_trigger_2_player_entered():
	$Spawners/bat_spawner3.spawn_bat()
	$Spawners/bat_spawner3.start_time()
	$Spawners/bat_spawner5.spawn_bat()
	$Spawners/bat_spawner5.start_time()


func _on_trigger_3_player_exited():
	$MyPlayer.get_node("AnimatedSprite2D").play("idle")
	if $MyPlayer.scale.x >= 0:
		$MyPlayer.scale.x = $MyPlayer.scale.y * 1
	$MyPlayer.set_physics_process(false)
	
	animate_something()


func animate_something():
	$AnimationPlayer.play("final")
	await $AnimationPlayer.animation_finished
	var monster = load("res://sprites/monstro.png")
	$Final/Sereia_Monstro.global_position.y -= 40
	$Final/Sereia_Monstro.texture = monster
	$AnimationPlayer.play("open_eyes")
	$ScreamTimer.start()
	await $AnimationPlayer.animation_finished
	$OtoTimer.start()






func _on_scream_timer_timeout():
	$Scream.play()


func _on_timer_timeout():
	SceneTransition.change_scene("res://scenes/GameCredits.tscn")
