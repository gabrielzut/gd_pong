extends CharacterBody2D

var speed := 600

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1	
	
	velocity = direction.normalized() * speed
	move_and_slide()

	var screen_size = get_viewport_rect().size
	position.y = clamp(position.y, 75, screen_size.y - 75)
