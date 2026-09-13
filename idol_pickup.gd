extends Pickup
class_name IdolPickup

func _on_body_entered(_body: Node2D) -> void:
	Globals.main.start_escape()
	pass # Replace with function body.
