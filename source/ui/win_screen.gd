extends ColorRect

@onready var anim_player=$AnimationPlayer

func appear():
	anim_player.play("appear")
	$MoneyLabel.text="You made $%s!" % Globals.format_money(Globals.money)
	$TotalTime.text="Total Time: %s"%Globals.format_time(Time.get_ticks_msec()-Globals.main.start_time)
	$EscapeTime.text="Remaining Escape Time: %s" % Globals.format_time(int(Globals.main.game_timer.time_left*1000))


func restart() -> void:
	Globals.restarting=true
	Globals.money = 0
	await Globals.main.screen_wipe.wipe_in()
	RenderingServer.set_default_clear_color(Color.BLACK)
	get_tree().reload_current_scene()
