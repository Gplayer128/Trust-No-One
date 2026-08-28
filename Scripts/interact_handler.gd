extends Node


var first_w_note_p = load("res://Scenes/Notes/First_W_note.tscn")
var first_w_note_i = first_w_note_p.instantiate()

var second_w_note_p = load("res://Scenes/Notes/second_w_note.tscn")
var second_w_note_i = second_w_note_p.instantiate()

var third_w_note_p = load("res://Scenes/Notes/third_w_note.tscn")
var third_w_note_i = third_w_note_p.instantiate()


func _on_ground_paper_interacted() -> void:
	get_parent().add_child(first_w_note_i)


func _on_ground_paper_2_interacted() -> void:
	get_parent().add_child(second_w_note_i)
	

func _on_ground_paper_3_interacted() -> void:
	get_parent().add_child(third_w_note_i)
