extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 3000

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	steering = move_toward(steering, Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right"), delta * 2.5) * MAX_STEER
	engine_force = (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")) * ENGINE_POWER
	pass
