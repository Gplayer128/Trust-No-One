extends Node3D

var door_start = load("res://Scenes/objects/door_start.tscn")
var door_start_instance = door_start.instantiate()

@onready var doors_node: Node3D = $"../Doors"
@onready var _3_rd_door: Timer = $"3rd door"

var final_3rd_door_pos = Vector3(-2.35, 1.107, -20.01)

func _on_after_start_body_exited(body: Node3D) -> void:
	if not body.is_in_group("box") or not body.is_in_group("bullet"):
		door_start_instance.position = Vector3(-1.13, 1.169, -10.1)
		doors_node.add_child(door_start_instance)


func _on_area_3d_body_exited(body: Node3D) -> void:
	if not body.is_in_group("box") or not body.is_in_group("bullet"):
		door_start_instance.scale = Vector3(1.2, 1.2, 1.2)
		door_start_instance.position = Vector3(-1.13, 0.528, -6.25)


func _on_area_3d_2_body_exited(body: Node3D) -> void:
	if not body.is_in_group("box") or not body.is_in_group("bullet"):
		door_start_instance.rotation = Vector3(0.0, 90.0, 0.0)
		door_start_instance.scale = Vector3(1.15, 0.8, 1.0)
		door_start_instance.position = Vector3(-2.35, 1.107, -5.01)


func _on_area_3d_3_body_exited(body: Node3D) -> void:
	if not body.is_in_group("box") or not body.is_in_group("bullet"):
		door_start_instance.rotation = Vector3(0.0, 89.5, 0.0)
		door_start_instance.scale = Vector3.ONE
		door_start_instance.position = Vector3(-0.01, 1.052, -5.0)


func _on_area_3d_4_body_exited(body: Node3D) -> void:
	if not body.is_in_group("box") or not body.is_in_group("bullet"):
		doors_node.get_child(0).queue_free()
		var door_start = load("res://Scenes/objects/door_start.tscn")
		var door_start_instance = door_start.instantiate()
		door_start_instance.rotation = Vector3.ONE
		door_start_instance.scale = Vector3(1.71, 0.75, 1.1)
		door_start_instance.position = Vector3(13.08, 1.132, -3.68)
		get_parent().add_child(door_start_instance)
