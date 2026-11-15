extends Node

const NEW_SCENE_PATH := "res://level_scene.tscn"
const END_SCENE_PATH := "res://REALend_scene.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = get_node("HBoxContainer/YES")
	button.connect("pressed", _on_button_pressed)
	var button2 = get_node("HBoxContainer/NOT RN")
	button2.connect("pressed", _on_button_pressed2)
	
func _on_button_pressed() -> void:
	if ResourceLoader.exists(NEW_SCENE_PATH):
		get_tree().change_scene_to_file(NEW_SCENE_PATH)
	else:
		print("Error: Scene not found: ", NEW_SCENE_PATH)


func _on_button_pressed2() -> void:
	if ResourceLoader.exists(END_SCENE_PATH):
		get_tree().change_scene_to_file(END_SCENE_PATH)
	else:
		print("Error: Scene not found: ", END_SCENE_PATH)
