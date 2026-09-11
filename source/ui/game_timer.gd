extends Label

var time_startup=.5
var time_left:=20.0
const START_FLASING:=15
var sent_time_up:=false

signal time_up

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if time_startup>0:
		time_startup-=delta
	else:
		time_left-=delta
	@warning_ignore("narrowing_conversion")
	text=format_time(maxi(time_left*1000,0))
	var flash_progress:=0.0
	if time_left<START_FLASING:
		flash_progress=sin((((START_FLASING-time_left)/2)**2)*3)
	if time_left<=0:
		flash_progress=1.0
		if not sent_time_up:
			time_up.emit()
			sent_time_up=true
	modulate=Color(1,1-flash_progress,1-flash_progress)

static func format_time(time_ms:int)->String:
	@warning_ignore_start("integer_division")
	var minutes=time_ms/60000
	var seconds=(time_ms/1000)%60
	var hundreths=(time_ms/10)%100
	@warning_ignore_restore("integer_division")
	return "%2d:%02d.%02d" % [minutes,seconds,hundreths]
