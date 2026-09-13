extends Node2D
## Drops should be a child of the chest, be invisisble and have monitarable set to false

var opened:=false
@export var drop_radius_minimum:float=16
@export var drop_radius_maximum:float=64
@export_range(0,360,1,"radians_as_degrees") var drop_angle_minimum:float=0
@export_range(0,360,1,"radians_as_degrees") var drop_angle_maximum:float=PI

func open():
	if not opened:
		opened = true
		$ChestSprite.play("open")
		for drop in get_children():
			if not drop.is_in_group("not_dropped_from_chest"):
				var drop_target=randf_range(drop_radius_minimum,drop_radius_maximum)*Vector2.from_angle(randf_range(drop_angle_minimum,drop_angle_maximum))
				var tween=create_tween()
				var tween2 = create_tween()
				var tween3 = create_tween()
				tween.set_ease(Tween.EASE_OUT)
				tween.tween_property(drop,"position",drop_target,.5)
			
				tween2.tween_property(drop, "scale", (drop as Node2D).scale * 1.50, .25)
				tween2.tween_property(drop, "scale", (drop as Node2D).scale, .25)
				
				if drop is Area2D:
					tween.tween_property(drop, "monitorable", true, 0)
					if drop is MoneyPickup:
						print("doing this!")
						tween3.tween_callback(drop.onAnimFinish).set_delay(0.5)
				drop.show()
				if drop.has_method("_on_found_in_chest"):
					drop._on_found_in_chest()
