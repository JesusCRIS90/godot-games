extends Node

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN: PackedScene = preload("res://scenes/main/main.tscn")
const SIMPLE_TRANSITION: PackedScene = preload("res://scenes/simple_transition/simple_transition.tscn")
const COMPLEX_TRANSITION: PackedScene = preload("res://scenes/complex_transition/complex_transition.tscn")

const SCROLL_SPPED: float = 120.0
const GROUP_PLANE: String = "Plane"

var next_scene: PackedScene

func load_next_scene(ns: PackedScene) -> void:
	next_scene = ns
	var cxt = COMPLEX_TRANSITION.instantiate()
	add_child(cxt)
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func load_game_scene() -> void:
	load_next_scene(GAME)
	#get_tree().change_scene_to_packed(GAME)

func load_main_scene() -> void:
	load_next_scene(MAIN)
	#get_tree().change_scene_to_packed(MAIN)
