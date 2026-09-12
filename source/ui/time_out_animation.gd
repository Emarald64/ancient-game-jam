extends Control

signal show_death_screen

func play():
	$AnimationPlayer.play(&"time_out")
	await $AnimationPlayer.animation_finished
	show_death_screen.emit()
