extends Control

## when the restart button is pressed, go to the main menu scene.
func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")

## when the exit button is pressed, quit the program
func _on_exit_pressed() -> void:
	get_tree().quit()
