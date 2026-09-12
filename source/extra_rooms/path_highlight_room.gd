extends Node2D

var tween:Tween

func _ready():
	%PathHighlights.modulate=Color.TRANSPARENT

func highlight_path():
	tween=create_tween()
	tween.tween_property(%PathHighlights,"modulate",Color(1,1,1,.5),.5)

func unhighlight_path():
	tween=create_tween()
	tween.tween_property(%PathHighlights,"modulate",Color(1,1,1,0),.5)
