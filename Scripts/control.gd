extends Control

@onready var timer: Timer = $Timer
var cooldown : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	cooldown = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed() and cooldown:
		get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_timer_timeout() -> void:
	cooldown = true
