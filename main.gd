extends Node2D





func _on_btnquit_pressed():
	get_tree (). quit()


func _on_btnplay_pressed():
	get_tree(). change_scene_to_file("res://world.tscn")
