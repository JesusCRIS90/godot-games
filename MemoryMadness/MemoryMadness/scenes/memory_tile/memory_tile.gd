extends TextureButton

class_name MemoryTile

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage

var _item_name: String
var _can_select_me: bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_selection_enable.connect(SLOT_on_selection_enable)
	SignalManager.on_selection_disable.connect(SLOT_on_selection_disable)
	
func reveal(r: bool) -> void:
	frame_image.visible = r
	item_image.visible = r
	
func get_item_name() -> String:
	return _item_name

func setup(image: ItemImage, frame: Texture2D) -> void:
	frame_image.texture = frame
	item_image.texture = image.get_texture()
	_item_name = image.get_item_name()
	reveal(false)
	
func matches_other_tile(other: MemoryTile) -> bool:
	return other != self and other.get_item_name() == _item_name

func make_kill_animation() -> void:
	var tween:Tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "disabled", true, 0)
	tween.tween_property(self, "rotation_degrees", 720, 0.5)
	tween.tween_property(self, "scale", Vector2(1.5, 1.5), 0.5)
	tween.set_parallel(false)
	tween.tween_interval(0.6)
	tween.tween_property(self, "scale", Vector2.ZERO, 0)

func kill_on_success() -> void:
	z_index = 1
	make_kill_animation()



func SLOT_on_selection_enable() -> void:
	_can_select_me = true
	
func SLOT_on_selection_disable() -> void:
	_can_select_me = false

func _on_pressed():
	if _can_select_me == true and frame_image.visible == false:
		SignalManager.on_tile_selected.emit(self)
