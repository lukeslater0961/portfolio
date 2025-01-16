extends Control
@onready var label: Label = $Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(Globals.time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	label.text = str(Globals.time)
	
