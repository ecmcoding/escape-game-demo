extends Node3D


var start_time = 0
var running = false
var game_over: bool = false
var game_not_started: bool = true

var hud: CanvasLayer

func disable_player_movement():
	var player = get_tree().current_scene.get_node("ProtoController") 
	if player:
		player.can_move = false

func restartGame():
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()

func startGame():
	print("Game has started")
	game_not_started = false
	start_time = Time.get_ticks_msec()
	running = true
	
	if hud:
		hud.update_score(0)

func die():
	var elapsed = Time.get_ticks_msec() - start_time
	print(elapsed / 1000.0)
	running = false

func endGame():
	var elapsed = Time.get_ticks_msec() - start_time
	print(elapsed / 1000.0)
	running = false
	game_over = true
	
	if hud:
		hud.show_game_over()
		disable_player_movement()
		await get_tree().create_timer(5.0).timeout
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		game_over = false
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _process(delta: float) -> void:
	if running and hud:
		var elapsed = Time.get_ticks_msec() - start_time
		var seconds = elapsed / 1000.0
		hud.update_score(seconds)
