extends Control

const MEMORY_TILE = preload("res://scenes/memory_tile/memory_tile.tscn")

@onready var tiles_container: GridContainer = $HB/MC/TilesContainer
@onready var scorer: Scorer = $Scorer
@onready var label_moves: Label = $HB/MC2/VB/HB/LabelMoves
@onready var label_pairs: Label = $HB/MC2/VB/HB2/LabelPairs
@onready var sound: AudioStreamPlayer = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_level_selected.connect(SLOT_on_level_selected)


func _process(delta):
	label_moves.text = scorer.get_moves_made_str()
	label_pairs.text = scorer.get_pairs_made_str()


func add_memory_tile(image: ItemImage, frame: Texture2D) -> void:
	var new_tile: MemoryTile = MEMORY_TILE.instantiate()
	tiles_container.add_child(new_tile)
	new_tile.setup(image, frame)

func SLOT_on_level_selected(level_num: int) -> void:
	var ld: SelectedLevelData = GameManager.get_level_selection(level_num)
	var frame: Texture2D = ImageManager.get_random_frame_image()
	
	tiles_container.columns = ld.get_num_cols()
	
	for im in ld.get_selected_level_images():
		add_memory_tile(im, frame)
		
	scorer.clear_new_game(ld.get_target_pairs())

func _on_exit_button_pressed():
	for tile in tiles_container.get_children():
		tile.queue_free()
	SoundManager.play_button_click(sound)
	SignalManager.on_game_exit_pressed.emit()
