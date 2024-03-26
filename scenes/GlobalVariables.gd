extends Node

signal checkpoint_count_changed(count)

var checkpoint_count = 0
var lap_count = 0

func increment_checkpoint_count():
	checkpoint_count += 1
	print("Checkpoint count:", checkpoint_count)
	emit_signal("checkpoint_count_changed", checkpoint_count)

func reset_checkpoint_count():
	checkpoint_count = 0
	emit_signal("checkpoint_count_changed", checkpoint_count)
