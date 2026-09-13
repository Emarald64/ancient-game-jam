extends Label

var time_startup=.5
@export var time_left:=1.0
const START_FLASING:=15
var sent_time_up:=false
var running:=false

signal time_up

func start():
	running=true
	show()

func stop():
	running=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if running:
		if time_startup>0:
			time_startup-=delta
		else:
			time_left-=delta
		#@warning_ignore("narrowing_conversion")
		text=Globals.format_time(maxi(int(time_left*1000),0))
		var flash_progress:=0.0
		if time_left<START_FLASING:
			flash_progress=(sin((((START_FLASING-time_left)/2)**2)*3)+1)/2
		if time_left<=0:
			flash_progress=1.0
			if not sent_time_up:
				time_up.emit()
				sent_time_up=true
		modulate=Color(1,1-flash_progress,1-flash_progress)
