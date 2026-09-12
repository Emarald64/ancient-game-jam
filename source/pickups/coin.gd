extends MoneyPickup

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:	
	sprite.play(Array(sprite.sprite_frames.get_animation_names()).pick_random())
