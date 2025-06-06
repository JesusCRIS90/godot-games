extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(subs_on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= GameManager.SCROLL_SPPED * delta

func subs_on_plane_died() -> void:
	set_process(false)
