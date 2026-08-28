extends Node3D

@onready var door_closing: AudioStreamPlayer3D = $door_closing

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	door_closing.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dead_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://Scenes/control.tscn")
