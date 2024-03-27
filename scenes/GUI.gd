extends Control

@onready var checkpoint_label = $CheckpointLabel
@onready var lap_label = $LapLabel

func _ready():
	GlobalVariables.connect("checkpoint_count_changed", Callable(self, "_on_checkpoint_count_changed"))
	GlobalVariables.connect("lap_count_changed", Callable(self, "_on_lap_count_changed"))
	update_labels()

func _on_checkpoint_count_changed(_count):
	update_labels()

func _on_lap_count_changed(_count):
	update_labels()

func update_labels():
	checkpoint_label.text = "Checkpoints: " + str(GlobalVariables.checkpoint_count) + "/" + str(GlobalVariables.max_checkpoint_count)
	lap_label.text = "Laps: " + str(GlobalVariables.lap_count) + "/" + str(GlobalVariables.max_lap_count)

