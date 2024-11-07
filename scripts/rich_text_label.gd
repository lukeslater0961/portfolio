extends RichTextLabel

func _ready() -> void:
	self.text = "[wave amp=90 freq=5] press space[/wave]"
	await get_tree().create_timer(3)
