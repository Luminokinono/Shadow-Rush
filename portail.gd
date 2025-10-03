extends Area2D

signal portal_entered

@onready var sound = $SoundPortail

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Player":
		print("🌀 Le joueur est entré dans le portail !")
		sound.play()  # ← lance le son du portail
		emit_signal("portal_entered")
		body.set_physics_process(false)
