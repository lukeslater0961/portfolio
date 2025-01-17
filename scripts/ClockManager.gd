extends Control
@onready var label: Label = $Label

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(Globals.time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	time +=  delta
	if (time > 1 and Globals.ChangingTime == false ):
		_increment_time()
		label.text = str(Globals.time)
		time = 0
	 
func _increment_time() -> void:
	if(Globals.current_minutes >= 60 or (Globals.current_minutes + 5) >= 60):
		Globals.current_minutes = 0
		Globals.current_hours = Globals.current_hours + 1
		if(Globals.current_hours == 24):
			Globals.current_hours = 0
	else:
			Globals.current_minutes = Globals.current_minutes + 5
	if (Globals.current_minutes < 10):
		Globals.time = str(Globals.current_hours) + ":" + "0" + str(Globals.current_minutes)
	else:
		Globals.time = str(Globals.current_hours) + ":" + str(Globals.current_minutes)
	
