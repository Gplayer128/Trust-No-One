extends Control

@onready var timer: Timer = $Timer
var close_cooldown : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_cooldown = false
	timer.start()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed() and close_cooldown:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		queue_free()


func _on_timer_timeout() -> void:
	close_cooldown = true
