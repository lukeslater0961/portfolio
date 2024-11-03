extends Node

var Player: Node
@onready var space: Control = $house/Space

func _ready() -> void:
	Player = get_node("Player")

func _process(_delta: float) -> void:
	if (Input.is_action_pressed("ui_cancel")):
		get_tree().quit()
