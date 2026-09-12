class_name HealthCounter
extends Control

@export var current_health:=4
@export var max_health:=4

@onready var anim_player=$AnimationPlayer

func update_health(new_health:int):
	if new_health<current_health:
		anim_player.play("decrease_health")
	elif new_health>current_health:
		anim_player.play("increase_health")
	current_health=new_health

func update_displayed_health():
	%Label.text="%s/%s" % [current_health,max_health]
