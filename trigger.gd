extends Area2D


var can_activate := true

signal player_entered
signal player_exited

func _ready():
	pass
	
	
func _process(delta):
	pass


func _on_area_entered(area):
	if can_activate:
		can_activate = false
		player_entered.emit()


func _on_area_exited(area):
	player_exited.emit()
