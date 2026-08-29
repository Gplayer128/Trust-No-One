extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var anim_finished : bool

func _ready() -> void:
	anim_finished = false
	animation_player.play("good_ending")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	anim_finished = true

func _process(delta: float) -> void:
	if anim_finished:
		if Input.is_anything_pressed():
			get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
