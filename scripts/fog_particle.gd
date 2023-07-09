extends TextureRect

var minMoveInterval = 1.0
var maxMoveInterval = 3.0
var moveSpeed = 100.0
var moveTimer = 0.0

func _ready():
	randomize()
	moveTimer = randf_range(minMoveInterval, maxMoveInterval)
	
func _process(delta):
	moveTimer -= delta
	
	if moveTimer <= 0:
		randomize_movement()
		moveTimer = randf_range(minMoveInterval, maxMoveInterval)
	
func randomize_movement():
	var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	set_global_position(get_global_position() + direction * moveSpeed * get_process_delta_time())
