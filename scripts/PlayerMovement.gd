extends CharacterBody2D

@onready var player: CharacterBody2D = $"."
@onready var space: Control = $"../house/Space"
var target_position = Vector2(-1.5, -20)
const SPEED = 270.0

func _physics_process(_delta: float) -> void: #player movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _process(_delta) -> void: #moves player to center and changes scene
	if Input.is_action_pressed("ui_accept") && !Globals.inhouse:
		var tween = create_tween()
		tween.tween_property(self, "position", target_position, 3.6)
		await tween.finished
		get_tree().root.add_child(Globals.Bedroom)
		get_node("/root/MainMenu").free()
	elif Input.is_action_just_pressed("ui_accept") && Globals.inhouse:
		get_tree().root.add_child(Globals.Bedroom)
		get_node("/root/MainMenu").free()        

func _on_house_body_entered(_body: Node2D) -> void:
	space.visible = true
	Globals.inhouse = true

func _on_house_body_exited(_body: Node2D) -> void:
	space.visible = false
	Globals.inhouse = false
