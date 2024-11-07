extends Node

func _process(_delta: float) -> void:
	if (Input.is_action_pressed("ui_cancel")):
		get_tree().quit()    
	else: if (Input.is_action_pressed("ui_accept")):
		Globals.change_scene(Globals.Bedroom, "MainMenu")
