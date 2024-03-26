extends Area3D


func _on_body_entered(body):
	if body.is_in_group("vehicles"):
		GlobalVariables.increment_checkpoint_count()
		visible = false
		$CollisionShape3D.disabled = true

func reappear():
	visible = true
	$CollisionShape3D.disabled = false
