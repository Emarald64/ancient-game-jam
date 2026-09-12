class_name Main
extends Node2D

@onready var player=%Player
@onready var death_screen=%DeathScreen
@onready var screen_wipe=%ScreenWipe

func _ready() -> void:
	Globals.main=self
	if Globals.restarting:
		#screen_wipe.cover()
		#RenderingServer.set_default_clear_color()
		screen_wipe.wipe_out()
		Globals.restarting=false
		await get_tree().process_frame
		RenderingServer.set_default_clear_color(Color("4d4d4d"))
		#ProjectSettings.set_setting("rendering/environment/defaults/default_clear_color",Color("4d4d4d"))
