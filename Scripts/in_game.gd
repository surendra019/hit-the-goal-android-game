extends Node2D

onready var bg = $bg
onready var pause_btn = $UI/pause_btn
var score_lbl
onready var goal = $goal
onready var ball_spawn_position = $ball_spawn_position
onready var ball_container = $ball_container
onready var lines = $lines
onready var line_spawner = $line_spawner

onready var pause_screen = $screens/Pause
var ball_scn = preload("res://Scenes/ball.tscn")

var rng = RandomNumberGenerator.new()

func _ready():
	pause_screen.visible = false
	if get_tree().has_group("current_score"):
		score_lbl = get_tree().get_nodes_in_group("current_score")[0]
	score_lbl.text += "0"
	rng.randomize()
	

	
	for i in lines.get_children():
		i.global_position = goal.global_position
		i.scale = Vector2(i.scale.x, 0)
		
		i.visible = false

	spawn_ball()
	SoundManager.play_bg_music()
	

func spawn_ball():
	var ball = ball_scn.instance()
	ball.connect("ball_destroyed", self, "spawn_ball")
	ball.position = ball_spawn_position.position
	ball_container.add_child(ball)
	pass

func make_line_visible():
	var invisible_lines = []
	for i in lines.get_children():
		if not i.visible:
			invisible_lines.append(i)
	if invisible_lines.size()!=0:
		var rand_no = rng.randi_range(0, invisible_lines.size()-1)
		var rand_line = invisible_lines[rand_no]
		var line_original_scale = Vector2((rand_line.default_scale.x), (rand_line.default_scale.y))
		rand_line.scale = Vector2(line_original_scale.x, 0)
		var twn = Tween.new()
		rand_line.visible = true
		twn.interpolate_property(rand_line, "scale", rand_line.scale, line_original_scale,1, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
		self.add_child(twn)
		twn.start()



func _on_line_spawner_timeout():
	line_spawner.wait_time = rand_range(5, 10)
	make_line_visible()
	pass # Replace with function body.




func _on_pause_btn_button_down():
	SoundManager.play_btn_sound()
	Manager.pause = true
	pause_screen.visible = true
	pass # Replace with function body.

func _exit_tree():
#	SoundManager.save()
	ScoreManager.save()
