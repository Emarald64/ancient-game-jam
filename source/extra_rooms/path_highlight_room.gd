extends Node2D

var tween:Tween

func _ready():
	%PathHighlights.modulate=Color.TRANSPARENT

func highlight_path():
	tween=create_tween()
	tween.set_parallel()
	tween.tween_property(%PathHighlights,"modulate",Color(1,1,1,.5),.5)
	tween.tween_property(Globals.main.camera,"zoom",Vector2(1.5,1.5),.5)
	tween.tween_property(Globals.main.camera,"offset",Vector2(0,-128),.5)
	
	

func unhighlight_path():
	tween=create_tween()
	tween.set_parallel()
	tween.tween_property(%PathHighlights,"modulate",Color(1,1,1,0),.5)
	tween.tween_property(Globals.main.camera,"zoom",Vector2(2,2),.5)
	tween.tween_property(Globals.main.camera,"offset",Vector2.ZERO,.5)
