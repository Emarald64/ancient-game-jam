class_name Main
extends Node2D

var camera_shake_intencity:=0.0
var start_time=Time.get_ticks_msec()
var escaping:=false

@onready var player=%Player
@onready var time_out_animation=%TimeOutAnimation
@onready var death_screen=%DeathScreen
@onready var screen_wipe=%ScreenWipe
@onready var game_timer=%GameTimer
@onready var money_counter=%MoneyCounter
@onready var camera=%playerCam
@onready var win_screen=%WinScreen

func _ready() -> void:
	Globals.main=self
	if Globals.restarting:
		screen_wipe.cover()
		screen_wipe.wipe_out()
		Globals.restarting=false
		await get_tree().process_frame
		RenderingServer.set_default_clear_color(Color("4d4d4d"))
	#start_game()

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_Y):
		start_escape()
	if Input.is_action_just_pressed("debug_hurt"):
		player.hurt(1)
	if Input.is_action_just_pressed("debug_heal"):
		player.heal(1)
	if camera_shake_intencity>0:
		camera.offset=50*Vector2(randf(),randf())*camera_shake_intencity
		camera_shake_intencity-=delta
#
#func start_game():
	#game_timer.running=true

func shake_camera():
	camera_shake_intencity=1

func start_escape():
	shake_camera()
	game_timer.start()
	escaping=true
	get_tree().call_group("has_on_escape_start","on_escape_start")
