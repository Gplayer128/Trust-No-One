extends Control

var from_game : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	from_game = Global.options_from_game


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_check_button_toggled(toggled_on: bool) -> void:
	Global.headbob_enab = toggled_on
	print(toggled_on)
	print(Global.headbob_enab)


func _on_back_pressed() -> void:
	if from_game:
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
