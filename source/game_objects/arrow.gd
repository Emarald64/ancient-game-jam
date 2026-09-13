extends Area2D

@export var velocity_magnitude : float = 1000.0
@export var time_limit:=1.0
var velocity_dir : Vector2
var age:=0.0

func _ready() -> void:
	velocity_dir = Vector2(1, 0 + randf_range(-0.075, 0.075))
	velocity_dir = velocity_dir.normalized()

func _physics_process(delta: float) -> void:
	position+=velocity_dir * velocity_magnitude * delta
	age += delta
	if age > time_limit:
		queue_free()


func _on_body_entered(_body : Node2D) -> void:
	if age > 0.05:
		velocity_magnitude = 0.0
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(0.01, 0.01), 0.25)
	pass # Replace with function body.
