extends Label

var custom_font = preload("res://font.otf")

func _ready():
	# Set the background color of the Label
	add_theme_font_override("font", custom_font)
	set("theme_override_colors/font_color", Color(1, 1, 1))  # Set the text color to white
	set("theme_override_colors/font_outline_color", Color(0, 0, 0))  # Set the text outline color to black
	set("theme_override_constants/outline_size", 5)  # Set the text outline size
