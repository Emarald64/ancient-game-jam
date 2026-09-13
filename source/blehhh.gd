extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	var tween = create_tween()
	tween.tween_property(self, "color:a", 0.0, 0.25).set_delay(0.1)
	pass
