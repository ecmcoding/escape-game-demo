extends Node

func _ready() -> void:
	MusicPlayer.get_node("AudioStreamPlayer").play()


var game_scene = preload("res://main.tscn")
var tutorial_scene = preload("res://scenes/tutorial_screen.tscn")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_packed(tutorial_scene)
