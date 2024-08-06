class_name MovementComponent
extends Node

@export_subgroup("Settings")
@export var speed: float = 100
@export var groundAccelSpeed: float = 6.0
@export var groundDecelSpeed: float = 8.0
@export var groundBoostDecelSpeed: float = 16.0
@export var airAccelSpeed: float = 10.0
@export var airDecelSpeed: float = 3.0
@export var airBoostDecelSpeed: float = 10.0

func handle_horizontal_movement(body: CharacterBody2D, direction: float) -> void:
	var velocityChangeSpeed: float = 0.0
	if body.is_on_floor():
		if abs(body.velocity.x) >= speed:
			velocityChangeSpeed = groundBoostDecelSpeed
		else:
			velocityChangeSpeed = groundAccelSpeed if (direction != 0) else groundDecelSpeed
	else:
		if abs(body.velocity.x) >= speed:
			velocityChangeSpeed = airBoostDecelSpeed
		else:
			velocityChangeSpeed = airAccelSpeed if (direction != 0) else airDecelSpeed

	body.velocity.x = move_toward(body.velocity.x, direction * speed, velocityChangeSpeed)
