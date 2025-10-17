extends Node2D

#imports the menu node
@onready var pause_menu = $CanvasLayer/pause_menu
#will be used after a new camera has been assigned
@onready var camera = null
#imports the player node
var player_scene = preload("res://scenes/player.tscn")

var paused = false
var is_game_over = false

#checks every frame if the "pause" key has been pressed
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		#checks if the camera is still there; if it isn't, don't show the menu
		camera = get_node_or_null("Player/Camera2D")
		if camera != null:
			show_pause_menu()

#if the game is not paused, pause it, and vice-versa
func show_pause_menu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

#stops the game and switches it to a game over state 
func _on_player_player_died() -> void:
	#stops the game music
	$music.stop()
	#stops new comets from spawning
	$Comet_spawner/spawn_timer.stop()
	#starts the game over timer
	$game_over_timer.start()

#shows game over screen
func _on_game_over_timer_timeout() -> void:
	#plays game over sound
	$death_sound.play()
	#shows game over screen
	$game_over_label.visible = true
	#game is over
	is_game_over = true

#checks if restart key has been pressed
#removes confusion over which event is used with the space key
func _unhandled_input(event: InputEvent) -> void:
	if is_game_over and event.is_action_released("restart"):
		restart_game()

#restarts the game
func restart_game():
	is_game_over = false
	#hides the game over screen
	$death_sound.stop()
	$game_over_label.visible = false
	
	$music.play(0)
	#respawns the player
	var player = player_scene.instantiate()
	player.position = Vector2(615, 673)
	player.player_died.connect(_on_player_player_died)
	add_child(player)
	
	$Comet_spawner.respawn_comets()
