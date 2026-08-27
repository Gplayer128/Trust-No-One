extends Node

@onready var first_w_note: Control = $"../Notes/First W note"

var first_w_note_p = load("res://Scenes/Notes/First_W_note.tscn")
var first_w_note_i = first_w_note_p.instantiate()

func _on_ground_paper_interacted() -> void:
	get_parent().add_child(first_w_note_i)
	print("button_pressed")
	
