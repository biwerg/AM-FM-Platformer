class_name JumpComponent
extends Node

@export_subgroup("Settings")
@export var jumpVelocity: float = -350.0

var isJumping: bool = false

func handle_jump(body: CharacterBody2D, isJump: bool) -> void:
	if isJump and body.is_on_floor():
		body.velocity.y = jumpVelocity

	isJumping = body.velocity.y < 0 and not body.is_on_floor()
