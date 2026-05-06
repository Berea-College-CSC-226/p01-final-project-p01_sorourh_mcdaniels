extends Control

## When the start button is pressed, go to the world scene where the actual gameplay is
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://World/world.tscn")

## When the exit button is pressed, quit the program
func _on_exit_pressed() -> void:
	get_tree().quit()
