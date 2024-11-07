extends Node

#preloads the scenes so redude lag when switching
var Bedroom = preload("res://assets/scenes/Bedroom.tscn").instantiate()
var ProjectWorld = preload("res://assets/scenes/ProjectWorld.tscn").instantiate()

#changes current scene to one entered as parameter
func change_scene(scene_name: Node, current_scene : String) -> void:
	var scene_path = "/root/" + current_scene
	get_tree().root.add_child(scene_name)
	get_node(scene_path).free()
