extends Node2D

const PIPES: PackedScene = preload("res://scenes/pipes/pipes.tscn")

@onready var spawn_upper_mark: Marker2D = $SpawnUpperMark
@onready var spawn_lower_mark: Marker2D = $SpawnLowerMark
@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipes_holder: Node = $PipesHolder


# Called when the node enters the scene tree for the first time.
func _ready():
	ScoreManager.set_score(0)
	SignalManager.on_plane_died.connect(_on_plane_died)
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var ypos: float = randf_range(spawn_upper_mark.position.y, spawn_lower_mark.position.y)
	new_pipes.position = Vector2(spawn_lower_mark.position.x, ypos)
	pipes_holder.add_child(new_pipes)

#func stop_pipes() -> void:
	#spawn_timer.stop()
	#for pipe in pipes_holder.get_children():
		#pipe.set_process(false)
	
	

func _on_spawn_timer_timeout():
	spawn_pipes()


func _on_plane_died() -> void:
	#stop_pipes()
	spawn_timer.stop()
