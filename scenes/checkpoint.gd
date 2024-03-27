extends Area3D

func _on_body_entered(body):
	if body.is_in_group("vehicles"):
		GlobalVariables.increment_checkpoint_count()
		visible = false
		call_deferred("set_collision_shape_disabled", true)

func reappear():
	visible = true
	call_deferred("set_collision_shape_disabled", false)

func set_collision_shape_disabled(value):
	$CollisionShape3D.disabled = value
