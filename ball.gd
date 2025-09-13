extends CharacterBody2D

var speed := 400
var direction := Vector2(0.707, -0.707).normalized()

signal player1_lost
signal player2_lost

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		direction = direction.bounce(collision.get_normal()).normalized()
	
	var screen_size = get_viewport_rect().size
	if position.y <= 0 or position.y >= screen_size.y:
		direction.y = -direction.y
	if position.x <= 0:
		emit_signal("player1_lost")
		queue_free()
	elif position.x >= screen_size.x:
		emit_signal("player2_lost")
		queue_free()
