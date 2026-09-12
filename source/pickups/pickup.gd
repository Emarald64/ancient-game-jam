class_name Pickup
extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_layer = 0
	set_collision_layer_value(2,true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
