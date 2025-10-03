extends Area2D

@onready var collect_sound = $CollectSound
@onready var sparkle = $Sparkle

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().get_root().get_node("Main").add_score(1)

		# Joue le son
		collect_sound.play()

		# Lance les particules
		sparkle.restart()

		# Crée l’animation de disparition
		var tween := create_tween()
		tween.tween_property(self, "scale", Vector2.ZERO, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

		await tween.finished
		queue_free()
