class_name MoneyPickup
extends Pickup

@export var value:=1000
var sprite : AnimatedSprite2D = null

var r : RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	super()
	sprite = get_node_or_null("AnimatedSprite2D")
	
	if sprite == null:
		printerr("cant find animatedsprite for the coin :c i hope you can find it")
		pass
	
	var bound : int = sprite.sprite_frames.get_animation_names().size();
	var animIndex : int = r.randi_range(0, bound-1)
	var animName : StringName = sprite.sprite_frames.get_animation_names()[animIndex]
	sprite.play(animName)
