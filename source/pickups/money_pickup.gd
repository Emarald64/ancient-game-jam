class_name MoneyPickup
extends Pickup

@export var value:=1000


func onAnimFinish() -> void:
	var space : PhysicsDirectSpaceState2D = get_world_2d().direct_space_state
	var query : PhysicsShapeQueryParameters2D = PhysicsShapeQueryParameters2D.new()
	var collisionShape : CollisionShape2D = $CollisionShape2D
	
	query.shape = collisionShape.shape
	query.transform = collisionShape.global_transform
	# Collision mask is 4
	query.collision_mask = 0b00000000_00000000_00000000_00000010
	query.collide_with_areas = true
	query.collide_with_bodies = false
	
	var result = space.intersect_shape(query)
	if result:
		for dict : Dictionary in result:
			print("i see you twin")
			var collider : Area2D = dict.collider
			collider.emit_signal("area_entered", self)
	else:
		print("i dont see you twin")
		
	
