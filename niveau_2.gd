extends Node2D

var score = 0
var lives = 3

@onready var score_label = $CanvasLayer/ScoreLabel
@onready var lives_label = $CanvasLayer/LivesLabel
@onready var game_over_screen = $CanvasLayer/GameOverScreen
@onready var respawn_point = $RespawnPoint

func _ready():
	update_score()
	update_lives()
	game_over_screen.visible = false
	

func _on_death_zone_body_entered(body):
	if body.name == "Player":
		lives -= 1
		update_lives()

		if lives > 0:
			body.global_position = respawn_point.global_position
		else:
			game_over()

func _on_fireball_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		lives -= 1
		update_lives()

		if lives > 0:
			body.global_position = respawn_point.global_position
		else:
			game_over()

func _on_fireball_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		lives -= 1
		update_lives()

		if lives > 0:
			body.global_position = respawn_point.global_position
		else:
			game_over()

func update_score():
	score_label.text = "Score : %d" % score

func update_lives():
	lives_label.text = "Vies : %d" % lives

func add_score(amount):
	score += amount
	update_score()

func game_over():
	print("💀 GAME OVER")
	$Player.hide()
	game_over_screen.visible = true

func _on_portail_portal_entered():
	print("✅ Portail touché, chargement du niveau suivant…")
	$Player.hide()
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
