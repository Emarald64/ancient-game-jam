extends CharacterBody2D
class_name Player

var SPEED = 250.0
@export var playerSprite : AnimatedSprite2D
@export var hole_scene:PackedScene
var curAnim : int = 0
const DAMAGE_TYPE=Globals.DAMAGE_TYPE

var canMove : bool = true
var health:=5
var max_health:=5
var dying:=false
var animating:=false
@export var main:Main
@export var health_counter:HealthCounter
signal collected_money(amount:int)

func _physics_process(_delta: float) -> void:
	if not dying and not animating && canMove:
		var movement=Input.get_vector("move_left","move_right","move_up","move_down")
		SpriteDirectionDecider(movement)
		
		if Input.is_action_pressed("sprint"):
			SPEED = 400
			playerSprite.speed_scale = 14
			$CatSprite/CatSprite2.speed_scale = 14
		else:
			SPEED = 200
			playerSprite.speed_scale = 8
			$CatSprite/CatSprite2.speed_scale = 8
		
		velocity=movement*SPEED

		move_and_slide()
	elif canMove:
		SpriteDirectionDecider(Vector2.ZERO)
	
func SpriteDirectionDecider(movement : Vector2) -> void:
	#ts kinda sucks ngl but i dont wanna sit here and think abt how to do it better
	if movement == Vector2(0,-1):
		curAnim = 0
		playerSprite.play("walk_up")
		$CatSprite/CatSprite2.play("walk_up")
	elif movement == Vector2(0,1):
		curAnim = 1
		playerSprite.play("walk_down")
		$CatSprite/CatSprite2.play("walk_down")
	elif movement == Vector2(1,0):
		curAnim = 2
		playerSprite.play("walk_right")
		$CatSprite/CatSprite2.play("walk_right")
	elif movement == Vector2(-1,0):
		curAnim = 3
		playerSprite.play("walk_left")
		$CatSprite/CatSprite2.play("walk_left")
	elif movement.is_equal_approx(Vector2(0.707107,-0.707107)):
		curAnim = 4
		playerSprite.play("walk_up_right")
		$CatSprite/CatSprite2.play("walk_up_right")
	elif movement.is_equal_approx(Vector2(-0.707107,-0.707107)):
		curAnim = 5
		playerSprite.play("walk_up_left")
		$CatSprite/CatSprite2.play("walk_up_left")
	elif movement.is_equal_approx(Vector2(0.707107,0.707107)):
		curAnim = 6
		playerSprite.play("walk_down_right")
		$CatSprite/CatSprite2.play("walk_down_right")
	elif movement.is_equal_approx(Vector2(-0.707107,0.707107)):
		curAnim = 7
		playerSprite.play("walk_down_left")
		$CatSprite/CatSprite2.play("walk_down_left")
		
	elif movement == Vector2.ZERO:
		# atm this does not account for the fact that unless you release both diagonal movements
		# at the same time you will end up holding just one input for a couple frames
		# kinda odd feeling but wtv i'll fix it later if we have time for polish
		playerSprite.stop()
		playerSprite.animation = "idle_sprites"
		playerSprite.frame = curAnim
		$CatSprite/CatSprite2.stop()
		$CatSprite/CatSprite2.animation = "idle_sprites"
		$CatSprite/CatSprite2.frame = curAnim

func _on_pickup(pickup: Area2D) -> void:
	if pickup is MoneyPickup:
		print("got pickup worth ",pickup.value)
		collected_money.emit(pickup.value)
	if pickup is HealthPickup:
		if health>=max_health:
			return
		heal(pickup.heals_for)
	if pickup is Pickup:
		pickup.queue_free()

func heal(amount:int):
	health=mini(amount,max_health)
	update_health()

func hurt(amount:int,damage_type:=DAMAGE_TYPE.unknown):
	health-=amount
	$GPUParticles2D.emitting = true
	if health<=0:
		die(true,damage_type)
	update_health()

func die(display_death_screen:=true,damage_type:=DAMAGE_TYPE.unknown):
	dying=true
	health=0

	update_health()
	if display_death_screen:
		main.time_out_animation.play()
		main.death_screen.death_reason=damage_type

func update_health():
	health_counter.update_health(health)

func hit(area:Area2D):
	if not dying:
		if area is SpikePit:
			var hole:Node2D=hole_scene.instantiate()
			main.add_child(hole)
			hole.global_position=global_position
			animating=true
			var tween=create_tween()
			tween.set_parallel(true)
			tween.tween_property(playerSprite,"scale",Vector2.ZERO,1)
			tween.tween_property(playerSprite,"position",Vector2(0,25),1)
			tween.set_parallel(false)
			tween.tween_callback(hurt.bind(1,DAMAGE_TYPE.pit))
			if health>1:
				tween.tween_property(playerSprite,"position",Vector2.ZERO,0)
				tween.tween_property(self,"global_position",area.respawn_target.global_position,0)
				tween.tween_property(playerSprite,"scale",Vector2.ONE,0)
				tween.tween_interval(.5)
				tween.tween_property(self,"animating",false,0)
		else:
			var damage=area.get_meta("damage",1)
			var damage_type=area.get_meta("damage_type",DAMAGE_TYPE.unknown)
			hurt(damage,damage_type)
			if area.get_meta("remove_on_hit",false):
				area.queue_free()
