extends EnemyBase

@onready var floor_detection: RayCast2D = $FloorDetection
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var speed: float = 50.0

func _ready() -> void:
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
	if( !is_on_floor() ):
		velocity.y += _gravity * delta
	else:
		velocity.x = setSpeed()
		
	move_and_slide()
	
	checkingFlip()
			
		
func checkingFlip():
	if is_on_floor():
		if( IsReadyToFlip() ): flip_me()

func IsReadyToFlip() -> bool:
	if ( is_on_wall() ): return true
	if ( !floor_detection.is_colliding() ): return true
	return false

func flip_me() -> void:
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
	floor_detection.position.x = -floor_detection.position.x
	
func setSpeed() -> float:
	if animated_sprite_2d.flip_h:
		return speed
	return -speed
