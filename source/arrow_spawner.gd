extends Node2D

@export var arrow_cooldown:=1.0
@export var arrow_scene:PackedScene
@export var arrow_velocity:=Vector2(1000,0)
@export var arrow_lifetime:=1.0

func _ready() -> void:
	$Timer.wait_time=arrow_cooldown

func shoot_arrow() -> void:
	var arrow=arrow_scene.instantiate()
	arrow.velocity=arrow_velocity
	arrow.time_limit=arrow_lifetime
	add_child(arrow)
