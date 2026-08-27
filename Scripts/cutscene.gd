extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var camera_3d: Camera3D = $Camera3D
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player_2.play("thinking")
	camera_3d.position = Vector3(9.016, 0.644, -12.26)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	animation_player.play("entering")
