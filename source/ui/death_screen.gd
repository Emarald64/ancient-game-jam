extends ColorRect

const DAMAGE_TYPE=Globals.DAMAGE_TYPE
const DEATH_MESSAGES={
	DAMAGE_TYPE.timeout:"You ran out of time...",
	DAMAGE_TYPE.arrow:"You were shot by an arrow...",
	DAMAGE_TYPE.unknown:"You were lost to time...",
	DAMAGE_TYPE.bomb:"You were blown up by a bomb...",
	DAMAGE_TYPE.pit:"You fell into a bottomless pit..."
}
var death_reason:=DAMAGE_TYPE.unknown

func appear():
	$Label.text=DEATH_MESSAGES[death_reason]
	$Label2.text = "You had $" + Globals.format_money(Globals.money)
	$AnimationPlayer.play("appear")

func restart():
	Globals.restarting=true
	Globals.money = 0
	#ProjectSettings.set_setting("rendering/environment/defaults/default_clear_color",Color.BLACK)
	await Globals.main.screen_wipe.wipe_in()
	RenderingServer.set_default_clear_color(Color.BLACK)
	get_tree().reload_current_scene()
