extends Node2D

@export var fuse_time:=2.0

func _ready():
	$Timer.wait_time=fuse_time

func _on_found_in_chest():
	$Timer.start()

func explode():
	$Explosion.monitorable=true
	var tween=create_tween()
	tween.tween_property($Explosion/CollisionShape2D.shape,"radius",256,.1)
	tween.tween_callback(queue_free)
	

func _process(_delta: float) -> void:
	$BombFlash.color.a=(sin(((fuse_time-$Timer.time_left)**2)*10)+1)/10
