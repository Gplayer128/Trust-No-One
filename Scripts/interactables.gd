extends StaticBody3D

class_name Interactable

signal interacted()

@export var prompt_message = "Interactable"
@export var prompt_action = "interact"
@export var key_name = "E"


func get_prompt():
	return prompt_message + "\n" +"[" + key_name + "]"

func interact():
	emit_signal("interacted")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
