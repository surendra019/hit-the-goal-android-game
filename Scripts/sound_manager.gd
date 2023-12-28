extends Node

var bg_music
signal saves_loaded
var btn_sound

var is_bg_music
var is_sound
var is_vibrate

var FILE_NAME = "user://game_save.tres"
var save_script = SAVE.new()



func _ready():
	load_data()
	bg_music = AudioStreamPlayer2D.new()
	bg_music.stream = preload("res://Sounds/bensound-hipjazz.mp3")
	self.add_child(bg_music)
	btn_sound = AudioStreamPlayer2D.new()
	btn_sound.stream = preload("res://Sounds/button2.mp3")
	self.add_child(btn_sound)
	

func load_data():
	if ResourceLoader.exists(FILE_NAME):
		
		save_script = ResourceLoader.load(FILE_NAME)
		is_bg_music = save_script.is_music_enabled
		is_sound = save_script.is_sound_enabled
		is_vibrate = save_script.is_vibration_enabled
#		print(is_sound)
		
	elif !ResourceLoader.exists(FILE_NAME):
		save_script.best_score = 0
		save_script.is_music_enabled = true
		save_script.is_sound_enabled = true
		save_script.is_vibration_enabled = true
		ResourceSaver.save(FILE_NAME, save_script)
	emit_signal("saves_loaded")
	
func save():
#	print("jjdsfdf")
#	print(save_script.best_score)
	save_script.is_music_enabled = is_bg_music
	save_script.is_sound_enabled = is_sound
	save_script.is_vibration_enabled = is_vibrate
#	print(is_sound)
	ResourceSaver.save(FILE_NAME, save_script)
	pass
	
func play_bg_music():
	if is_bg_music:
		bg_music.play()

func play_btn_sound():
	if is_sound:
		btn_sound.play()
		yield(get_tree().create_timer(btn_sound.stream.get_length()), "timeout")
		btn_sound.playing = false

func stop_bg_music():
	bg_music.stop()

func stop_btn_sound():
	btn_sound.stop()

func _exit_tree():
	save()
