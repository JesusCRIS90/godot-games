extends Node2D

class_name  Pipes

const OFF_SCREEN: float = -500.0

@onready var score_sound: AudioStreamPlayer = $ScoreSound
@onready var von: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(subs_on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * GameManager.SCROLL_SPPED
	check_off_screen()

func check_off_screen() -> void:
	#if position.x < OFF_SCREEN:
	if von.global_position.x < get_viewport_rect().position.x:
		#print("VonPos", position)
		queue_free()

func _on_screen_exited():
	queue_free()

func subs_on_plane_died() -> void:
	set_process(false)


func _on_pipe_body_entered(body: Node2D) -> void:
	#print('Pipe ', body)
	if body is Tappy:
		body.die()
	#if body.is_in_group(GameManager.GROUP_PLANE) == true:
		#if body.has_method('die') == true:
			#body.die()


func _on_laser_body_entered(body):
	if body is Tappy:
		score_sound.play()
		ScoreManager.increment_score()
