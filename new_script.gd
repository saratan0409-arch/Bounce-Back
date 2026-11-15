extends Node

const NEW_SCENE_PATH := "res://level_scene.tscn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = get_node("VBoxContainer/Start")
	button.connect("pressed", _on_button_pressed)	

func _on_button_pressed() -> void:
	if ResourceLoader.exists(NEW_SCENE_PATH):
		get_tree().change_scene_to_file(NEW_SCENE_PATH)
	else:
		print("Error: Scene not found: ", NEW_SCENE_PATH)
