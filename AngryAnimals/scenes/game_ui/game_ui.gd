extends Control

const MAIN = preload("res://scenes/main/main.tscn")

@onready var level_label = $MarginContainer/VB/LevelLabel
@onready var attempts_level = $MarginContainer/VB/AttemptsLevel
@onready var game_sound = $GameSound
@onready var vb_2 = $MarginContainer/VB2


# Called when the node enters the scene tree for the first time.
func _ready():
	level_label.text = "LEVEL %s" % ScoreManager.get_level_selected()
	update_attemps(0)
	SignalManager.on_score_updated.connect(update_attemps)
	SignalManager.on_level_complete.connect(slot_on_level_complete)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("menu") == true:
		get_tree().change_scene_to_packed(MAIN)


func update_attemps(attempts: int) -> void:
	attempts_level.text = "Attemps %s" % attempts

func slot_on_level_complete() -> void:
	vb_2.show()
	game_sound.play()

