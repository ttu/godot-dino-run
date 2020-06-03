extends KinematicBody2D

signal collision

const UP = Vector2.UP
const GRAVITY = 2000
const JUMPFORCE = -1000

var velocity = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMPFORCE
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = JUMPFORCE * 2
	else:
		velocity.y += GRAVITY * delta
	
	velocity = move_and_slide(velocity, UP, false, 4, 0.78, false)

	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "enemy":
			$AnimatedSprite.play("hurt")
			emit_signal("collision")
			return
	
	if not is_on_floor():
		$AnimatedSprite.play("jump")
	else:
		$AnimatedSprite.play("walk")
