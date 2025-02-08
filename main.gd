extends Node2D


func toggle_fullscreen() -> void:
	var mode := DisplayServer.window_get_mode()
	
	if mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_fullscreen"):
		toggle_fullscreen()
