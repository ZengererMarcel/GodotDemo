extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cube = preload("res://Cube.tscn")
var location = Vector3(0, 3, 0)
var string = ""
var cubes = 0
var timer = Timer.new()
var isSpawning = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.wait_time = 5
	timer.one_shot = true
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.start()

func _process(delta):
	if isSpawning:
		var scene = cube.instance()
		scene.set_translation(location)
		add_child(scene)
		cubes += 1
		var fps = Performance.get_monitor(Performance.TIME_FPS);
		string = string + str(cubes) + ":" + str(fps) + "\n"
		
		get_node("FPSLabel").text = str(cubes) + ":" + str(fps)
		
		if fps < 60:
			save(string)
			isSpawning = false

func save(content):
	var file = File.new()
	file.open("user://save_game.dat", File.WRITE)
	file.store_string(content)
	file.close()

func _on_timer_timeout():
	isSpawning = true
