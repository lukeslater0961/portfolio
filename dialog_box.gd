extends Node2D

@onready var label: Label = $"../Label"


var ObjectType: String 
var isentered : bool  = false

func _ready() -> void:
	ObjectType = str(get_parent().name)
	print(ObjectType)
	label.visible = false

func _process(_delta: float) -> void:
	if isentered and Input.is_key_pressed(KEY_E):
		doInteract()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print_debug("showing")
		label.visible = true
		isentered = true

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		print_debug("hiding")
		label.visible = false
		isentered = false

func doInteract() -> void:
	if (ObjectType == "Bed"):
		Globals.DoSleepCycle()
		isentered = false
	else: if (ObjectType == "Portal"):
		print("boo")
		Globals.DoTransition("Bedroom", Globals.ProjectWorld)
		isentered = false 
