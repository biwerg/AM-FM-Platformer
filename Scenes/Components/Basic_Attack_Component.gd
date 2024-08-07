class_name BasicAttackComponent
extends Node

@export_subgroup("Nodes")
var attackTimer: Timer

@export_subgroup("Settings")

var isAttacking: bool = false
var canAttack: bool = false

func handle_basic_attack(body: CharacterBody2D, attack: bool):
	if body.is_on_floor() and attackTimer.is_stopped():
		canAttack = true
	
	if canAttack and attack:
		canAttack = false
		attackTimer.start()
		print("rahh I'm attacking")
