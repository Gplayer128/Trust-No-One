extends OmniLight3D

var test : bool
var ending_pos : Vector3 = Vector3(0.0, 0.0, -2.0)
var starting_light = 0.0
var ending_light = 2.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ending_pos = Vector3(global_position) - Vector3(ending_pos)
	test = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.is_equal_approx(ending_pos):
		queue_free()
	if test:
		position = position.lerp(ending_pos, 0.01)
		light_energy = lerpf(starting_light, ending_light, 0.01)
