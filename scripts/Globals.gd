extends Node

#preloads the scenes so redude lag when switching
var Bedroom = preload("res://assets/scenes/Bedroom.tscn").instantiate()
var ProjectWorld = preload("res://assets/scenes/ProjectWorld.tscn").instantiate()
@onready var fade_transition: ColorRect = $FadeTransition

#changes current scene to one entered as parameter
func change_scene(scene_name: Node, current_scene : String) -> void:
	var scene_path = "/root/" + current_scene
	get_tree().root.add_child(scene_name)
	get_node(scene_path).free()

func DoSleepCycle() ->void:
	if $FadeTransition:
		$FadeTransition.show()  # Make FadeTransition visible
		$FadeTransition/AnimationPlayer.play("fadein")  # Play the fade-in animation
		$FadeTransition/AnimationPlayer.connect("animation_finished", _on_fade_finished)
	else:
		print("Error: FadeTransition node not found.")

func _on_fade_finished()->void:
	$FadeTransition.hide
