extends Node2D

@export var arrow_cooldown:=1.0
@export var delay : float = 0.0
@export var arrow_scene:PackedScene
@export var arrow_velocity : float = 1000.0
@export var arrow_lifetime:=1.0

func _ready() -> void:
	await get_tree().create_timer(delay).timeout
	$Timer.wait_time=arrow_cooldown
	$Timer.start()

func shoot_arrow() -> void:
	$CrossbowSprite.play("shoot")
	$CrossbowSprite2.play("shoot")
	var arrow=arrow_scene.instantiate()
	arrow.velocity_magnitude = arrow_velocity
	arrow.time_limit=arrow_lifetime
	add_child(arrow)
