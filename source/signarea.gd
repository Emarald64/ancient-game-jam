extends Area2D

@export var label : Label

func _on_body_entered(_body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(label, "modulate:a", 1.0, 0.25)
	pass # Replace with function body.


func _on_body_exited(_body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(label, "modulate:a", 0.0, 0.25)
	pass # Replace with function body.
