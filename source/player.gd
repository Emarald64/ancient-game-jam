extends CharacterBody2D

const SPEED = 400.0
const DAMAGE_TYPE=Globals.DAMAGE_TYPE

var health:=5
var is_dying:=false
@export var main:Main
signal collected_money(amount:int)

func _physics_process(delta: float) -> void:
	if not is_dying:
		var movement=Input.get_vector("move_left","move_right","move_up","move_down")
		velocity=movement*SPEED

		move_and_slide()

func _on_pickup(pickup: Area2D) -> void:
	if pickup is MoneyPickup:
		print("got pickup worth ",pickup.value)
		collected_money.emit(pickup.value)
	if pickup is HealthPickup:
		heal(pickup.heals_for)
	if pickup is Pickup:
		pickup.queue_free()

func heal(amount:int):
	health+=amount
	update_health()

func hurt(amount:int):
	health-=amount
	if health<=0:
		health=0
	update_health()

func die(display_death_screen:=true,damage_type:=DAMAGE_TYPE.unknown):
	is_dying=true
	if display_death_screen:
		main.dealth_screen.appear()

func update_health():
	pass
