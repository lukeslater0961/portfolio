extends Node

#preloads the scenes so redude lag when switching
var Bedroom = preload("res://assets/scenes/Bedroom.tscn").instantiate()
var ProjectWorld = preload("res://assets/scenes/ProjectWorld.tscn").instantiate()

var current_hours: int
var current_minutes: int
var time: String 

var TimeChange

var ChangingTime
	
##Sets all values (for the minute the time) for the game__________________
func _ready()->void:
	ChangingTime = false
	Globals.current_hours = randi_range(00, 23)
	Globals.current_minutes = randi_range(00, 59)
	if (Globals.current_minutes < 10):
		Globals.time = str(current_hours) + ":" + "0" + str(current_minutes)
	else:
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
	Change_Time_of_day()
	ChangingTime = false
	print("time changed to = ",time)

func Change_Time_of_day() ->void:
	ChangingTime = true
	if (Globals.current_hours >= 21 or Globals.current_hours < 06):
		Globals.current_hours = 06
		Globals.TimeChange = false
	else  :
		Globals.current_hours = 21
		Globals.TimeChange = true
	if (Globals.current_minutes < 10):
		Globals.time = str(Globals.current_hours) + ":" + "0" + str(Globals.current_minutes)
	else:
		Globals.time = str(Globals.current_hours) + ":" + str(Globals.current_minutes)
