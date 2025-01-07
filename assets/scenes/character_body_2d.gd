extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	var input_direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),  # Horizontal movement
		Input.get_axis("ui_up", "ui_down")     # Vertical movement
	)
	if input_direction != Vector2.ZERO:
		velocity = input_direction.normalized() * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()
