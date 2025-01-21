extends CanvasLayer

signal on_transition_finished
var is_transitioning = false

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var control: Control = $Control
@onready var label: Label = $Control/Container/Label

func _ready() -> void:
	color_rect.visible = false
	control.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name: String) -> void:
	if is_transitioning:
		return
	if anim_name == "fade_in":
		OS.delay_msec(1000)
		animation_player.play("fade_out")
		control.visible = false
		is_transitioning = true
		on_transition_finished.emit()
	elif anim_name == "fade_out":
		is_transitioning = false
		color_rect.visible = false
		control.visible = false

func _transition() -> void:
	if is_transitioning:
		return
	color_rect.visible = true
	if (Globals.transitonType == 0):
		control.visible = true
	animation_player.play("fade_in")
	label.text = str(Globals.time)
	Do_Clock_Animation()  


##Handle clock changing animation___________________________

func Do_Clock_Animation()->void:
	if (Globals.TimeChange):
		label_time(6)
	else :
		label_time(21)

func label_time(hours)->void:
	if (Globals.current_minutes < 10):
		label.text = str(hours) + ":" + "0" + str(Globals.current_minutes)
	else:
		label.text = str(hours) + ":" + str(Globals.current_minutes)
