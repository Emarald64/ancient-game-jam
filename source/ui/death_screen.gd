extends ColorRect

const DAMAGE_TYPE=Globals.DAMAGE_TYPE

const DEATH_MESSAGES={
	DAMAGE_TYPE.timeout:"You ran out of time...",
	DAMAGE_TYPE.arrow:"You were shot by an arrow...",
	DAMAGE_TYPE.unknown:"Your death was lost to time..."
}

func appear(damage_type:=DAMAGE_TYPE.unknown):
	$Label.text=DEATH_MESSAGES[damage_type]
	$AnimationPlayer.play("appear")
