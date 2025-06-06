extends Control

@onready var game_over_label: Label = $GameOverLabel
@onready var space_label: Label = $SpaceLabel
@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer = $Sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_plane_died.connect(Slot_on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if( can_move_2_main_scene() == true ):
		GameManager.load_main_scene()

func can_move_2_main_scene() -> bool:
	if( space_label.visible == false ): return false
	if( Input.is_action_just_pressed("fly") == false ): return false
	
	return true
	
func Slot_on_plane_died() -> void:
	show()
	timer.start()
	sound.play()
	ScoreManager.save_high_score_to_file()
	

func _on_timer_timeout():
	game_over_label.hide()
	space_label.show()
	pass # Replace with function body.
