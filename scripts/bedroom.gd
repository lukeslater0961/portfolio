extends Node2D
@onready var fade_transition: ColorRect = $FadeTransition

func _ready() -> void:
	$FadeTransition.hide
	print_debug("hid transition")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_pressed("ui_cancel")):
		get_tree().quit()
