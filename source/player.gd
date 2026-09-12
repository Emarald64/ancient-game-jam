extends CharacterBody2D

const SPEED = 400.0
@export var playerSprite : AnimatedSprite2D
var curAnim : int = 0
const DAMAGE_TYPE=Globals.DAMAGE_TYPE

var health:=5
var is_dying:=false
@export var main:Main
signal collected_money(amount:int)

func _physics_process(_delta: float) -> void:
	if not is_dying:
		var movement=Input.get_vector("move_left","move_right","move_up","move_down")
		SpriteDirectionDecider(movement)

		velocity=movement*SPEED

		move_and_slide()
	else:
		SpriteDirectionDecider(Vector2.ZERO)
	
func SpriteDirectionDecider(movement : Vector2) -> void:
	#ts kinda sucks ngl but i dont wanna sit here and think abt how to do it better
	if movement == Vector2(0,-1):
		curAnim = 0
		playerSprite.play("walk_up")
	elif movement == Vector2(0,1):
		curAnim = 1
		playerSprite.play("walk_down")
	elif movement == Vector2(1,0):
		curAnim = 2
		playerSprite.play("walk_right")
	elif movement == Vector2(-1,0):
		curAnim = 3
		playerSprite.play("walk_left")
	elif movement.is_equal_approx(Vector2(0.707107,-0.707107)):
		curAnim = 4
		playerSprite.play("walk_up_right")
	elif movement.is_equal_approx(Vector2(-0.707107,-0.707107)):
		curAnim = 5
		playerSprite.play("walk_up_left")
	elif movement.is_equal_approx(Vector2(0.707107,0.707107)):
		curAnim = 6
		playerSprite.play("walk_down_right")
	elif movement.is_equal_approx(Vector2(-0.707107,0.707107)):
		curAnim = 7
		playerSprite.play("walk_down_left")
		
	elif movement == Vector2.ZERO:
		# atm this does not account for the fact that unless you release both diagonal movements
		# at the same time you will end up holding just one input for a couple frames
		# kinda odd feeling but wtv i'll fix it later if we have time for polish
		playerSprite.stop()
		playerSprite.animation = "idle_sprites"
		playerSprite.frame = curAnim

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
		main.dealth_screen.appear(damage_type)

func update_health():
	pass
