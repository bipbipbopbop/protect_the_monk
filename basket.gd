extends RigidBody2D

signal leaf_entered_bucket

func _physics_process(delta):
	pass
#	set_inertia(45000.0)
	
	#PhysicsServer2D
#	1/ PhysicsServer2D.body_get_direct_state(get_rid()).inverse_inertia

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var max_angle = deg_to_rad(30)
	var min_angle = deg_to_rad(-30)
	
	angular_velocity *= 0.9
	
	if rotation > max_angle:
		rotation = max_angle
		angular_velocity = 0
	elif rotation < min_angle:
		rotation = min_angle
		angular_velocity = 0

func _on_inside_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("leafs"):
		emit_signal("leaf_entered_bucket")
		body.queue_free()
