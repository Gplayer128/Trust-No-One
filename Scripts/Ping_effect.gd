extends OmniLight3D

var test : bool
var ending_pos : Vector3 = Vector3(0.0, 0.0, 2.0)
var starting_light = 1.0
var ending_light = 2.5

@onready var timer: Timer = $Timer
@onready var impact: AudioStreamPlayer3D = $impact

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	impact.play()
	ending_pos = Vector3(global_position) - Vector3(ending_pos)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.is_equal_approx(ending_pos):
		queue_free()
	position = position.lerp(ending_pos, 1 * delta)
	light_energy = lerpf(starting_light, ending_light, 1 * delta)


func _on_timer_timeout() -> void:
	queue_free()
