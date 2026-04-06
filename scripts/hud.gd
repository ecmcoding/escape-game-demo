extends CanvasLayer

signal start_game

func _ready() -> void:
	GameManager.hud = self

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.wait_time = 2 
	$MessageTimer.start()

func show_game_over():
	$YouWinSound.play()
	show_message("You escaped!")
	await $MessageTimer.timeout
	
	$Message.text = "Congratulations!"
	$Message.show()
	await get_tree().create_timer(4.0).timeout
	
	
func you_lose():
	$GameOverSound.play()
	GameManager.disable_player_movement()
	show_message("GAME OVER")
	await $MessageTimer.timeout
	show_message("The monster got you!")
	await $MessageTimer.timeout


func update_score(score):
	$ScoreLabel.text = str(int(score))
	

func _on_start_button_pressed() -> void:
	$StartButton.hide()
	show_message("Go!")
	GameManager.startGame()
	


func _on_message_timer_timeout() -> void:
	$Message.hide()
