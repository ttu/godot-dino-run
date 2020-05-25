extends KinematicBody2D

const UP = Vector2.UP
const SPEED = 140
const GRAVITY = 500
const JUMPFORCE = -400

var velocity = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMPFORCE
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = JUMPFORCE * 2
	else:
		velocity.y += GRAVITY * delta
	
	velocity = move_and_slide(velocity, UP)

	if not is_on_floor():
		$AnimatedSprite.play("jump")
	else:
		$AnimatedSprite.play("walk")
