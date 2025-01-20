extends Node2D


@onready var label: Label = $Label
var isentered : bool  = false

func _ready() -> void:
	label.visible = false

func _process(_delta: float) -> void:
	if isentered and Input.is_key_pressed(KEY_E):
		Globals.DoSleepCycle()
		isentered = false 

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
