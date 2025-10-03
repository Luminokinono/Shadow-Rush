extends CharacterBody2D

const SPEED = 1300
const JUMP_VELOCITY = -1750
var gravity = 1800
var respawn_position = Vector2()

@onready var sprite = $AnimatedSprite2D

func _ready():
	respawn_position = global_position

func _physics_process(delta):
	var velocity = self.velocity

	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		sprite.flip_h = false
		sprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		sprite.flip_h = true
		sprite.play("walk")
	else:
		velocity.x = 0
		if is_on_floor():
			sprite.play("idle")

	# Gestion de la chute avec flèche bas
	if not is_on_floor():
		sprite.play("jump")
		if Input.is_action_pressed("ui_down"):
			velocity.y += gravity * 3 * delta  # 🡻 descend plus vite
		else:
			velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY

	self.velocity = velocity
	move_and_slide()

func respawn():
	print("🔄 Respawn déclenché !")
	global_position = respawn_position
