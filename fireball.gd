extends Area2D

@onready var anim = $AnimationPlayer

func _ready():
	anim.play("feu_loop")
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Player":
		print("🔥 Le joueur a touché la boule de feu !")
		get_tree().current_scene._on_death_zone_body_entered(body) 
