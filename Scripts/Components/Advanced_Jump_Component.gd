class_name AdvancedJumpComponent
extends Node

@export_subgroup("Nodes")
@export var jumpBufferTimer: Timer
@export var coyoteTimer: Timer

@export_subgroup("Settings")
@export var jumpVelocity: float = -400

var isGoingUp: bool = false
var isJumping: bool = false
var lastFrameOnFloor: bool = false

func has_just_landed(body: CharacterBody2D) -> bool:
	return body.is_on_floor() and not lastFrameOnFloor and isJumping

func is_allowed_to_jump(body: CharacterBody2D, isJump: bool) -> bool:
	return isJump and (body.is_on_floor() or not coyoteTimer.is_stopped())

func handle_jump(body: CharacterBody2D, isJump: bool, jumpReleased: bool) -> void:
	if has_just_landed(body):
		isJumping = false

	if is_allowed_to_jump(body, isJump):
		jump(body)

	handle_coyote_time(body)
	handle_jump_buffer(body, isJump)
	handle_variable_jump_height(body, jumpReleased)

	isGoingUp = body.velocity.y < 0 and not body.is_on_floor()
	lastFrameOnFloor = body.is_on_floor()

func handle_jump_buffer(body: CharacterBody2D, isJump: bool) -> void:
	if isJump and not body.is_on_floor():
		jumpBufferTimer.start()

	if body.is_on_floor() and not jumpBufferTimer.is_stopped():
		jump(body)

func handle_variable_jump_height(body: CharacterBody2D, jumpReleased: bool) -> void:
	if jumpReleased and isGoingUp:
		body.velocity.y = 0

func has_just_stepped_off_ledge(body: CharacterBody2D) -> bool:
	return not body.is_on_floor() and lastFrameOnFloor and not isJumping

func handle_coyote_time(body: CharacterBody2D) -> void:
	if has_just_stepped_off_ledge(body):
		coyoteTimer.start()
	if not coyoteTimer.is_stopped() and not isJumping:
		body.velocity.y = 0

func jump(body: CharacterBody2D) -> void:
	body.velocity.y = jumpVelocity
	jumpBufferTimer.stop()
	isJumping = true
	coyoteTimer.stop()
