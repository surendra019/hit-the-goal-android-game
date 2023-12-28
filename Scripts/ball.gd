extends KinematicBody2D

signal ball_destroyed

var ball_container
var fired = false

var fire_ball = false
var direction

onready var area = $Area2D
onready var arrow = $arrow

onready var current_score_label
var camera

func destroy_ball():
	emit_signal("ball_destroyed")
	self.queue_free()
	pass

func _ready():
	arrow.visible = false
	if get_tree().has_group("current_score"):
		current_score_label = get_tree().get_nodes_in_group("current_score")[0]
	if get_tree().has_group("camera"):
		camera = get_tree().get_nodes_in_group("camera")[0]
	if get_tree().has_group("ball_container"):
		ball_container = get_tree().get_nodes_in_group("ball_container")[0]
#	ResponsiveMaker.set_scale(self)

func _input(event):
#	print(Manager.pause)
	if ! Manager.pause:
		
		if event is InputEventScreenDrag:
			if ball_container!=null and not fired:
				arrow.visible = true
				if ball_container.get_child_count()!=0:
					var rot = ((event.position.x -self.global_position.x)/(302/2))*90
					self.rotation_degrees =-rot
		if event is InputEventScreenTouch:
			if ball_container!=null:
				if not fired:
					if not event.pressed:
						direction = global_position.direction_to(get_node("pointing").global_position)
						arrow.visible = false
						fire_ball = true
						fired = true
func _physics_process(delta):
	if fire_ball == true:
		fire_the_ball()
	if fired:
		var overlapping_areas = area.get_overlapping_areas()
		for i in overlapping_areas:
			if i.is_in_group("goal"):
				if SoundManager.is_vibrate:
					Input.vibrate_handheld(50)
				camera.shake(2)
				ScoreManager.inc_score(current_score_label)
				destroy_ball()
		
func fire_the_ball():
	var collision = self.move_and_collide(direction*10)
	if collision!=null:
		direction = direction.bounce(collision.normal)
	pass
