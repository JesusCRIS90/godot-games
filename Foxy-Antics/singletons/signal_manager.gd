extends Node

signal on_create_bullet(
	pos: Vector2,
	dir: Vector2,
	life_span: float,
	speed: float,
	object_type: Constants.ObjectType
)
