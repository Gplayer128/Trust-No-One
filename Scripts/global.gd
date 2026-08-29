extends Node

var headbob_enab : bool
var options_from_game : bool

var BG_MUSIC_NODE: AudioStreamPlayer = null

func _ready() -> void:
	BG_MUSIC_NODE = AudioStreamPlayer.new()
	BG_MUSIC_NODE. stream = load("res://Assets/Audio/deuslower-dark-fantasy-ambient-dungeon-synthpiano-verse-248214.mp3")
	BG_MUSIC_NODE.autoplay = true
	add_child(BG_MUSIC_NODE)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
