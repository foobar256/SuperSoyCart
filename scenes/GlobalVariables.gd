extends Node

signal checkpoint_count_changed(count)
signal lap_count_changed(count)

var checkpoint_count = 0
var lap_count = 0
var max_checkpoint_count = 1
var max_lap_count = 3

func increment_checkpoint_count():
	checkpoint_count += 1
	emit_signal("checkpoint_count_changed", checkpoint_count)

func reset_checkpoint_count():
	checkpoint_count = 0
	emit_signal("checkpoint_count_changed", checkpoint_count)

func increment_lap_count():
	lap_count += 1
	emit_signal("lap_count_changed", lap_count)
