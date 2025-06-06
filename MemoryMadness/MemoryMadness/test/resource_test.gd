extends Node2D

@export var weapon: Weapon

@onready var sprite_2d: Sprite2D = $Sprite2D



# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_2d.texture = weapon.texture
	print( weapon.weapon_name )

