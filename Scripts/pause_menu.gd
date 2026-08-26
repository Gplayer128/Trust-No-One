extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	visible = false
	get_tree().paused = false


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			visible = false
			get_tree().paused = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			visible = true
			get_tree().paused = true

func _on_options_pressed() -> void:
	Global.options_from_game = true
	get_tree().change_scene_to_file("res://Scenes/options.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
