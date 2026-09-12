class_name ScreenWipe
extends NinePatchRect

@onready var anim_player=$AnimationPlayer

func cover():
	size=Vector2(606,324)

func wipe_in():
	anim_player.play("wipe_in")
	await anim_player.animation_finished
	
func wipe_out():
	anim_player.play("wipe_out")
	await anim_player.animation_finished
