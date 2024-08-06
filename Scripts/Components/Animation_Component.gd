class_name AnimationComponent
extends Node

@export_subgroup("Nodes")
@export var sprite: AnimatedSprite2D

func handle_horizontal_flip(moveDirection: float) -> void:
	if moveDirection == 0:
		return
	sprite.flip_h = false if moveDirection > 0 else true

func handle_move_animation(moveDirection: float) -> void:
	handle_horizontal_flip(moveDirection)

	if moveDirection != 0:
		sprite.play("Idle")
	else:
		sprite.play("Idle")

func handle_jump_animation(isJumping: bool, isFalling: bool) -> void:
	if isJumping:
		sprite.play("Idle")
	elif isFalling:
		sprite.play("Idle")
