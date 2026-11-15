extends Parallax2D

@onready var camera = get_viewport().get_camera_2d()

var original_y: float

func _ready():
	original_y = global_position.y

func _process(delta):
	if camera:
		global_position.x = camera.global_position.x
		global_position.y = original_y
