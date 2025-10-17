extends "res://scripts/comet_script.gd"

#overwrites the explode function from the bigger comet's script
#this removes the ability to spawn other comets on impact
func explode():
	#Checks if function has already been called;
	#If it has, don't free the queue
	#This prevents a glitch where 2 lasers collide with the same comet
	if is_exploded:
		return
	#Turns on the boolean
	is_exploded = true
	#spawns particles for explosion
	spawn_explosion_particles(1)
	#plays the explosion sound 
	play_small_sound()
	#Removes the comet from the game
	get_parent().remove_child(self)
	queue_free()

#plays the sound 
func play_small_sound():
	#loads the comet sound scene
	var comet_sound_scene = load("res://scenes/comet_small_sound.tscn")
	var comet_sound = comet_sound_scene.instantiate()
	#adds it to the weapon
	get_tree().current_scene.add_child(comet_sound)
