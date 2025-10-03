extends Area2D

@onready var anim = $AnimatedSprite2D
@export var speed := 350
@onready var start_position = $PatrolStart.global_position
@onready var end_position = $PatrolEnd.global_position

var target_position : Vector2

func _ready():
	target_position = end_position
	anim.play("walk")

func _process(delta):
	var direction = (target_position - global_position).normalized()
	position += direction * speed * delta
	anim.flip_h = direction.x < 0

	if global_position.distance_to(target_position) < 5:
		target_position = start_position if target_position == end_position else end_position

func _on_body_entered(body):
	if body.name == "Player":
		print("🟥 Ennemi touché par le joueur !")
		get_parent().player_hit()
