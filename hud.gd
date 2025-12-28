extends CanvasLayer

signal start_game

func _ready():
	show_message("DODGE THE ENEMIES!!")
	$StartButton.show()

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("GAME OVER!")
	await $MessageTimer.timeout

	$Message.text = "DODGE THE ENEMIES!!"
	$Message.show()

	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func update_best_score(score):
	$BestScoreLabel.text = "BEST SCORE: " + str(score)

func _on_start_button_pressed():
	$StartButton.hide()
	show_message("GET READY")
	await $MessageTimer.timeout
	$Message.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
