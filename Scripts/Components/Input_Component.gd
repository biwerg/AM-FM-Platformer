class_name InputComponent
extends Node

var inputHorizontal: float = 0.0

func _process(_delta: float) -> void:
	inputHorizontal = Input.get_axis("movement_left", "movement_right")

func get_jump_input()-> bool:
	return Input.is_action_just_pressed("movement_jump")

func get_dash_input() -> bool:
	return Input.is_action_just_pressed("movement_skill")

func get_jump_input_released() -> bool:
	return Input.is_action_just_released("movement_jump")
