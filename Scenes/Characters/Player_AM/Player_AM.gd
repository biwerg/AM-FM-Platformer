extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Dash Variables
var dashDirection = Vector2(1,0)
var canDash = false
var dashing = false

func dash():
	if is_on_floor():
		canDash = true
		
	# Get the direction for the dash
	if Input.is_action_pressed("movement_right"):
		dashDirection = Vector2(1,0)
	if Input.is_action_pressed("movement_left"):
		dashDirection = Vector2(-1,0)
		
	if Input.is_action_just_pressed("movement_skill") and canDash:
		velocity = dashDirection.normalized() * 2000
		canDash = false
		dashing = true
		await get_tree().create_timer(0.2).timeout
		dashing = false
	

func _physics_process(delta):
	dash()
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("movement_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("movement_left", "movement_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
