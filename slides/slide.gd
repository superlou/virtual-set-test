extends Node2D
class_name Slide


@export var num_steps := 0
var step_index = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func enter() -> void:
	pass


func exit() -> void:
	pass


func reset() -> void:
	position = Vector2.ZERO


func step() -> void:
	pass


func is_start() -> bool:
	return true


func is_done() -> bool:
	return true