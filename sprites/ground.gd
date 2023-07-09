extends StaticBody2D


@export_file var texture_path


func _ready():
	$Sprite2D.texture = load(texture_path)
