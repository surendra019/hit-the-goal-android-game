extends Node


var current_score = 0
var best_score

var FILE_NAME = "user://game_save.tres"
var save_script = SAVE.new()

func _ready():

	load_data()

func load_data():
	if ResourceLoader.exists(FILE_NAME):
		save_script = ResourceLoader.load(FILE_NAME)
		best_score = save_script.best_score
	elif !ResourceLoader.exists(FILE_NAME):
		save_script.best_score = 0
		ResourceSaver.save(FILE_NAME, save_script)
	
func save():
	if current_score>save_script.best_score:
		save_script.best_score = current_score
		
		ResourceSaver.save(FILE_NAME, save_script)
	pass
	
func inc_score(label):
	current_score+=1
	label.text = str(current_score)

func _exit_tree():
	save()
