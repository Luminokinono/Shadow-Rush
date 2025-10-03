extends Control  # ou extends Control selon ton setup

func _ready():
	visible = false  # Le Game Over est caché au lancement

func show_game_over():
	visible = true  # Affiche l’écran Game Over

func _on_recommencer_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
