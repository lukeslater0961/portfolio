extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

func _physics_process(_delta: float) -> void:
	# Get input direction (horizontal and vertical)
	var input_direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),  # Horizontal movement (left-right)
		Input.get_axis("ui_up", "ui_down")     # Vertical movement (up-down)
	)
	
	if input_direction != Vector2.ZERO:
		input_direction = input_direction.normalized()
		var iso_direction = Vector2(input_direction.x + input_direction.y, input_direction.y - input_direction.x)
		velocity = iso_direction.normalized() * SPEED
	else:
		velocity = Vector2.ZERO
	move_and_slide()
