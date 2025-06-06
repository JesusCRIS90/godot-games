extends Control

@onready var moves_label:Label = $NinePatchRect/MC/VB/MovesLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_game_over.connect(SLOT_on_game_over)
	SignalManager.on_game_exit_pressed.connect(SLOT_on_game_exit_pressed)


func SLOT_on_game_over(moves: int) -> void:
	moves_label.text = "You took %d moves" % moves
	show()

func SLOT_on_game_exit_pressed() -> void:
	hide()
	
