extends CharacterBody2D

class_name Tappy

const GRAVITY: float = 1000.0
const POWER: float = -350.0


@onready var animation_sprite: AnimatedSprite2D = $Animation
@onready var animation_player = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $Sound


# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(0, POWER)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY * delta
	fly()
	
	move_and_slide()
	
	if is_on_floor() == true:
		die()


func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animation_player.play("power")

func die() -> void:
	animation_sprite.stop()
	sound.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()
	
