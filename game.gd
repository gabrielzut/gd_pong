extends Node2D

var ball_scene := preload("res://ball.tscn")

var player1_score := 0
var player2_score := 0

func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_cancel'):
		get_tree().quit(0)

func spawn_new_ball():
	var ball = ball_scene.instantiate()
	add_child(ball)
	
	ball.connect("player1_lost", _on_player1_lost)
	ball.connect("player2_lost", _on_player2_lost)

func _ready() -> void:
	spawn_new_ball()

func show_restart_menu(message: String):
	$RestartMenu/RestartLabel.text = message
	$Player1ScoreLabel.text = str(player1_score)
	$Player2ScoreLabel.text = str(player2_score)
	$RestartMenu.visible = true

func _on_player1_lost():
	player2_score = player2_score + 1
	show_restart_menu("Player 1 lost!")

func _on_player2_lost():
	player1_score = player1_score + 1
	show_restart_menu("Player 2 lost!")

func _on_restart_button_pressed() -> void:
	$RestartMenu.visible = false
	$Player1.position = Vector2(50, 340)
	$Player2.position = Vector2(1230, 340)
	spawn_new_ball()
