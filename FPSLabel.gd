extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text("FPS " + String(Engine.get_frames_per_second()))
