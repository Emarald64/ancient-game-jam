class_name SpikePit
extends Area2D

@export var respawn_target:Node2D

func _init() -> void:
	set_collision_layer_value(3,true)
