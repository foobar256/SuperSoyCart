extends Area3D

var max_checkpoint_count = 1

func _ready():
	GlobalVariables.connect("checkpoint_count_changed", Callable(self, "_on_checkpoint_count_changed"))
	_update_finish_visibility()

func _on_body_entered(body):
	print("Vehicle entered finish and check point count %d, max_check_point %d ", GlobalVariables.checkpoint_count, max_checkpoint_count)
	if body.is_in_group("vehicles") and GlobalVariables.checkpoint_count == max_checkpoint_count:
		GlobalVariables.lap_count += 1
		print("Lap count:", GlobalVariables.lap_count)
		GlobalVariables.reset_checkpoint_count()
		get_tree().call_group("checkpoints", "reappear")

func _on_checkpoint_count_changed(count):
	print("Changing checkpoint_count ",count)
	_update_finish_visibility()

func _update_finish_visibility():
	visible = GlobalVariables.checkpoint_count == max_checkpoint_count #Seems okay, 1 if it should work
	print("Visible = ", visible)
	$CollisionShape3D.disabled = visible 
