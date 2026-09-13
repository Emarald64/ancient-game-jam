extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"..".canMove = false
	position.y = -330.0
	
	var tween = create_tween()
	tween.tween_property(self, "position:y", 0.0, 3).set_trans(Tween.TRANS_SINE).set_delay(0.5)
	
	var tween2 = create_tween()
	tween2.tween_method(set_idle_sprite, 0, 14, 2).set_delay(1.4)
	tween2.set_parallel()
	
	var tween3 = create_tween()
	tween3.set_parallel()
	$CatSprite2.modulate.a = 0.0
	tween3.tween_property($CatSprite2, "modulate:a", 0.482, 1).set_delay(2.0)
	
	await tween.finished
	give_player_control()
	$rope.reparent(Globals.main)
	var tween4 = create_tween()
	tween4.tween_property(Globals.main.get_node("rope"), "position:y", -350, 1).set_trans(Tween.TRANS_BACK)
	
func give_player_control() -> void:
	$"..".canMove = true

func set_idle_sprite(index : int) -> void:
	index = wrap(index, 0, 8)
	#print(index)
	animation = "idle_sprites_2"
	frame = index
	
	$CatSprite2.animation = "idle_sprites_2"
	$CatSprite2.frame = index
