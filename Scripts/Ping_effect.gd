class_name Ping_effect extends Node

var test : bool
var starting_pos = Vector3(0.0, 0.0, -1.67)
var ending_pos = Vector3(0.0, 0.0, -2.57)
var starting_light = 0.0
var ending_light = 1.0

var light_inst = preload("res://Scenes/ping_effect.tscn")
var instance = light_inst.instantiate()
var light = get_child(0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(instance)
	light.light_energy = 0
	light.position = starting_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var light = get_child(0)
	if light.position.is_equal_approx(ending_pos):
		light.position = starting_pos
		light.light_energy = starting_light
		test = false
	if Input.is_action_just_pressed("m1"):
		light.position = starting_pos
		light.light_energy = starting_light
		test = true
	if test:
		light.position = light.position.lerp(ending_pos, 0.15)
		light.light_energy = lerpf(starting_light, ending_light, 0.15)
