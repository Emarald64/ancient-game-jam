extends Node2D

var tween:Tween
var camera_offset=Vector2(0,-128)

func _ready():
	%PathHighlights.modulate=Color.TRANSPARENT

func highlight_path():
	tween=create_tween()
	tween.set_parallel()
	tween.tween_property(%PathHighlights,"modulate",Color(1,1,1,.5),.5)
	tween.tween_property(Globals.main.camera,"zoom",Vector2(1.5,1.5),.5)
	tween.tween_property(Globals.main.camera,"offset",camera_offset,.5)

func unhighlight_path():
	tween=create_tween()
	tween.set_parallel()
	tween.tween_property(%PathHighlights,"modulate",Color(1,1,1,0),.5)
	tween.tween_property(Globals.main.camera,"zoom",Vector2(2,2),.5)
	tween.tween_property(Globals.main.camera,"offset",Vector2.ZERO,.5)

func on_escape_start():
	camera_offset=Vector2(0,128)
	$ShowPaths/CollisionShape2D_escape.set_deferred("disabled",false)
	$ShowPaths/CollisionShape2D.set_deferred("disabled",true)
	$SpikePit.respawn_target=$RespawnPos2
	$SpikePit2.respawn_target=$RespawnPos3
