extends CharacterBody3D

var speed : float = 20

func _physics_process(delta):
	position += transform.basis * Vector3(0,0,-speed) * delta
