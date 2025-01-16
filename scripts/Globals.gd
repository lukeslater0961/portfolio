extends Node

#preloads the scenes so redude lag when switching
var Bedroom = preload("res://assets/scenes/Bedroom.tscn").instantiate()
var ProjectWorld = preload("res://assets/scenes/ProjectWorld.tscn").instantiate()

var current_hours: int
var current_minutes: int

var time: String 
	
##Sets all values (for the minute the time) for the game__________________
func _ready()->void:
	Globals.current_hours = randi_range(00, 24)
	Globals.current_minutes = randi_range(00, 59)
	Globals.time = str(current_hours) + ":" + str(current_minutes)
	print("time set to = ", time)

func change_scene(scene_name: Node, current_scene : String) -> void:
	var scene_path = "/root/" + current_scene
	get_tree().root.add_child(scene_name)
	get_node(scene_path).free()



## Handles the sleeping animation and the time changing__________________
func DoSleepCycle() ->void:
	TransitionScreen._transition()
	await TransitionScreen.on_transition_finished
	TransitionScreen.is_transitioning = false
	Change_Time_of_day(current_hours)
	print("time changed to = ",time)

func Change_Time_of_day(current_hours) ->void:
	if (current_hours >= 21 or current_hours < 06):
		Globals.current_hours = 06
	else  :
		Globals.current_hours = 21
	Globals.time = str(Globals.current_hours) + ":" + str(Globals.current_minutes)
