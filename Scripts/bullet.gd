extends CharacterBody3D

var speed : float = 20

func _physics_process(delta):
	position += transform.basis * Vector3(0,0,-speed) * delta


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("box"):
		print("box entered")
