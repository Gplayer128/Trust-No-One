class_name Projectile extends Area3D

@export var damage : int = 1


@onready var hit_sound: AudioStreamPlayer3D = $hit_sound


func _ready() -> void:
	pass

#collision on body
func _on_body_entered(body : PhysicsBody3D) -> void:
	if body.is_in_group("box"):
		hit_reaction()
	
	hit_reaction()

#collision on object
func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("box"):
		hit_reaction()

func hit_reaction() -> void:

	hit_sound.play()

	queue_free()
