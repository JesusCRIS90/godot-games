extends Node2D

const OBJECT_SCENES: Dictionary = {
	Constants.ObjectType.BULLET_PLAYER: 
		preload("res://scenes/bullet_base/bullet_player.tscn"),
	Constants.ObjectType.BULLET_ENEMY:
		preload("res://scenes/bullet_base/bullet_enemy.tscn"),
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_create_bullet.connect(SLOT_on_create_bullet)
	pass # Replace with function body.


func SLOT_on_create_bullet(
	pos: Vector2,
	dir: Vector2,
	life_span: float,
	speed: float,
	object_type: Constants.ObjectType
) -> void:
	if !OBJECT_SCENES.has(object_type):
		return
		
	var newBullet: Bullet = OBJECT_SCENES[object_type].instantiate()
	newBullet.setup(pos, dir, speed, life_span)
	call_deferred("add_child", newBullet)
