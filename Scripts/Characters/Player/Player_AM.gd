extends CharacterBody2D

@export_subgroup("Nodes")
@export var gravityComponent: GravityComponent
@export var inputComponent: InputComponent
@export var movementComponent: MovementComponent
@export var animationComponent: AnimationComponent
@export var jumpComponent: AdvancedJumpComponent
@export var dashComponent: DashComponent

var prevVelocity: float

func _physics_process(delta: float) -> void:
	gravityComponent.handle_gravity(self,delta)
	movementComponent.handle_horizontal_movement(self, inputComponent.inputHorizontal)
	animationComponent.handle_move_animation(inputComponent.inputHorizontal)
	jumpComponent.handle_jump(self, inputComponent.get_jump_input(), inputComponent.get_jump_input_released())
	animationComponent.handle_jump_animation(jumpComponent.isGoingUp, gravityComponent.isFalling)
	dashComponent.handle_dash(self, inputComponent.inputHorizontal, inputComponent.get_dash_input())

	if prevVelocity != self.velocity.x:
		print(self.velocity.x)
	prevVelocity = self.velocity.x

	move_and_slide()
