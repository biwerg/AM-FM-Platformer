class_name DashComponent
extends Node

@export_subgroup("Nodes")
@export var dashTimer: Timer

@export_subgroup("Settings")
@export var dashVelocity: float = 500

var isDashing: bool = false
var canDash: bool = false
var touchedGround: bool = false

func handle_dash(body: CharacterBody2D, direction: float, dash: bool) -> void:
	if body.is_on_floor():
		touchedGround = true

	if touchedGround and dashTimer.is_stopped():
		canDash = true

	if canDash and dash:
		canDash = false
		touchedGround = false
		dashTimer.start()
		body.velocity.x += direction * dashVelocity

	isDashing = body.velocity.x > 400
