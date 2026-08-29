extends Node



func _on_good_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Cutscenes/good_ending.tscn")


func _on_bad_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Cutscenes/bad_ending.tscn")
