class_name Main
extends Node2D

@onready var player=%Player
@onready var death_screen=%DeathScreen
@onready var screen_wipe=%ScreenWipe

func _ready() -> void:
	Globals.main=self
	if Globals.restarting:
		screen_wipe.cover()
		screen_wipe.wipe_out()
		Globals.restarting=false
		await get_tree().process_frame
		RenderingServer.set_default_clear_color(Color("4d4d4d"))
