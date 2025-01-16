extends Node2D

@onready var box: Sprite2D = $"../Box"

var isentered : bool  = false

func _ready() -> void:
	$"../Box".visible = false

func _process(delta: float) -> void:
	if isentered and Input.is_key_pressed(KEY_E):
		Globals.DoSleepCycle()
		isentered = false 

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print_debug("showing")
		$"../Box".visible = true
		isentered = true

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		print_debug("hiding")
		$"../Box".visible = false
		isentered = false
