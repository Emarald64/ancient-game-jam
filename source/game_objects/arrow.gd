extends Area2D

@export var velocity:Vector2=Vector2(1000,0)
@export var time_limit:=1.0
var age:=0.0

func _physics_process(delta: float) -> void:
	position+=velocity*delta
	age+=delta
	if age>time_limit:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if age > 0.05:
		queue_free()
	pass # Replace with function body.
