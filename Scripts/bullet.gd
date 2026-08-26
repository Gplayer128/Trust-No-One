extends CharacterBody3D

var speed : float = 20
var ping = load("res://Scenes/ping_effect.tscn")

func _physics_process(delta):
	position += transform.basis * Vector3(0,0,-speed) * delta


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("box"):
		var instance = ping.instantiate()
		instance.position = global_position
		instance.transform.basis = global_transform.basis
		get_parent().add_child(instance)
		print("box entered")
	queue_free()
