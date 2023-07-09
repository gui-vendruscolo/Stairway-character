extends Control

var audio_bus_name = "Master"
var _bus = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var _bus = AudioServer.get_bus_index(audio_bus_name)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_h_slider_changed(value):
	AudioServer.set_bus_volume_db(_bus, linear_to_db(value))
