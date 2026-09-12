extends ColorRect

const DAMAGE_TYPE=Globals.DAMAGE_TYPE
const DEATH_MESSAGES={
	DAMAGE_TYPE.timeout:"You ran out of time...",
	DAMAGE_TYPE.arrow:"You were shot by an arrow...",
	DAMAGE_TYPE.unknown:"You were lost to time..."
}

func appear(damage_type:=DAMAGE_TYPE.unknown):
	$Label.text=DEATH_MESSAGES[damage_type]
	$AnimationPlayer.play("appear")

func restart():
	Globals.restarting=true
	#ProjectSettings.set_setting("rendering/environment/defaults/default_clear_color",Color.BLACK)
	RenderingServer.set_default_clear_color(Color.BLACK)
	await Globals.main.screen_wipe.wipe_in()
	get_tree().reload_current_scene()
