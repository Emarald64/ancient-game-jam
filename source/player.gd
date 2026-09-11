extends CharacterBody2D

const SPEED = 400.0

signal collected_money(amount:int)

func _physics_process(delta: float) -> void:
	var movement=Input.get_vector("move_left","move_right","move_up","move_down")

	velocity=movement*SPEED

	move_and_slide()

func _on_pickup(pickup: Area2D) -> void:
	if pickup is MoneyPickup:
		print("got pickup worth ",pickup.value)
		collected_money.emit(pickup.value)
		pickup.queue_free()
