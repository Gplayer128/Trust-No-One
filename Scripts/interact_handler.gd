extends Node


var first_w_note_p = load("res://Scenes/Notes/First_W_note.tscn")
var first_w_note_i = first_w_note_p.instantiate()

var second_w_note_p = load("res://Scenes/Notes/second_w_note.tscn")
var second_w_note_i = second_w_note_p.instantiate()

var third_w_note_p = load("res://Scenes/Notes/third_w_note.tscn")
var third_w_note_i = third_w_note_p.instantiate()

var fourth_w_note_p = load("res://Scenes/Notes/fourth_w_note.tscn")
var fourth_w_note_i = fourth_w_note_p.instantiate()

var fifth_w_note_p = load("res://Scenes/Notes/fifth_w_note.tscn")
var fifth_w_note_i = fifth_w_note_p.instantiate()

var sixth_w_note_p = load("res://Scenes/Notes/sixth_w_note.tscn")
var sixth_w_note_i = sixth_w_note_p.instantiate()

var seventh_w_note_p = load("res://Scenes/Notes/seventh_w_note.tscn")
var seventh_w_note_i = seventh_w_note_p.instantiate()

var eighth_w_note_p = load("res://eighth_w_note.tscn")
var eighth_w_note_i = eighth_w_note_p.instantiate()

func _on_ground_paper_interacted() -> void:
	get_parent().add_child(first_w_note_i)


func _on_ground_paper_2_interacted() -> void:
	get_parent().add_child(second_w_note_i)
	

func _on_ground_paper_3_interacted() -> void:
	get_parent().add_child(third_w_note_i)


func _on_ground_paper_5_interacted() -> void:
	get_parent().add_child(fourth_w_note_i)


func _on_ground_paper_6_interacted() -> void:
	get_parent().add_child(fifth_w_note_i)


func _on_ground_paper_7_interacted() -> void:
	get_parent().add_child(sixth_w_note_i)


func _on_ground_paper_8_interacted() -> void:
	get_parent().add_child(seventh_w_note_i)


func _on_ground_paper_9_interacted() -> void:
	get_parent().add_child(eighth_w_note_i)
