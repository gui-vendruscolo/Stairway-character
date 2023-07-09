extends Area2D


var can_activate := true

signal player_entered

func _ready():
	pass
	
	
func _process(delta):
	pass


func _on_area_entered(area):
	if can_activate:
		pass
	can_activate = false
	player_entered.emit()
