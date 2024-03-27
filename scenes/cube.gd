extends Node3D

var respawn_timer = 5.0
var cube_visible = true

@onready var area_3d = $Area3D
@onready var mesh_instance = $Area3D/MeshInstance3D
@onready var collision_shape = $Area3D/CollisionShape3D

func _ready():
	print("Cube ready!")

func _on_area_3d_body_entered(body):
	print("Collision detected with body:", body.name)
	
	if body.is_in_group("vehicles"):
		print("Cube collided with vehicle:", body.name)
		cube_visible = false
		mesh_instance.visible = false
		call_deferred("set_collision_shape_disabled", true)
		print("Starting respawn timer...")
		$RespawnTimer.start(respawn_timer)
	else:
		print("Collided body is not in the 'vehicles' group")

func _on_respawn_timer_timeout():
	print("Respawn timer timeout!")
	cube_visible = true
	mesh_instance.visible = true
	call_deferred("set_collision_shape_disabled", false)
	print("Cube respawned!")

func set_collision_shape_disabled(value):
	collision_shape.disabled = value
