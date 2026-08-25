class_name VelocityComponent extends Node

@export var parent : Projectile

@export_range(20, 250, 10) var speed : float

var cur_gravity : float = 0
@export_range(0, 100, 10) var gravity : float = 20

@export_range(100, 600, 20) var max_range : int = 300

var direction : Vector3
var previous_position : Vector3
@export var facing_velocity : bool = false


var start_pos : Vector3
var end_pos : Vector3

func _ready() -> void:
	await get_tree().physics_frame
	parent.rotation.z = randi_range(-90,90)

	start_pos = parent.global_position

	direction = -parent.transform.basis.z
	previous_position = parent.global_position

func _physics_process(delta : float) -> void:
	apply_speed(delta)

	apply_gravity(delta)

	face_velocity(delta)

	check_max_range()


func apply_speed(delta : float) -> void:
	parent.global_position += (direction * speed) * delta

func apply_gravity(delta : float) -> void:
	parent.position.y -= cur_gravity * delta

	cur_gravity += gravity * delta

func face_velocity(delta : float) -> void:
	if facing_velocity:
		var velocity = (parent.global_position - previous_position) / delta

		if Engine.get_physics_frames() % 2 == 0:
			previous_position = parent.global_position

		if velocity.length() > 1:
			var new_basis = Basis. looking_at(velocity, Vector3.UP)
			parent. transform.basis = new_basis

func check_max_range():
	if Engine.get_physics_frames() % 4 == 0:
		end_pos = parent.global_position

	if (start_pos - end_pos). length() > max_range:
		parent.queue_free()
