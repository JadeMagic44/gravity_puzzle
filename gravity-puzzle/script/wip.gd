extends Node2D


func _on_main_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
