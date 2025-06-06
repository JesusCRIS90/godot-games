extends Control

@onready var score_label: Label = $ScoreLabel


func _ready():
	SignalManager.on_score_updated.connect(Slot_on_score_updated)

func Slot_on_score_updated(score: int) -> void:
	score_label.text = str(score)
