extends Node

@onready var timer = $Timer
@onready var timerdisplay = $CanvasLayer/Control/VBoxContainer/Label


func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.start()


func _process(_delta: float) -> void:
	var time_left = int(ceil(timer.time_left))
	var minutes = floori(float(time_left) / 60.0)
	var seconds = time_left % 60

	timerdisplay.text = "%02d:%02d" % [minutes, seconds]


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://REALend_scene.tscn")
	
