extends Camera2D

onready var timer = $Timer
onready var tween = $Tween

var amount
var default_offset = offset

func _ready():
#	self.position.x = OS.get_window_size().x/2
#	self.position.y = OS.get_window_size().y/2
#	ResponsiveMaker.set_pos_center(self)
	set_process(false)

func _process(delta):
	var rand_x = rand_range(-1,1)*amount
	var rand_y = rand_range(-1, 1)*amount
	offset = Vector2(rand_x, rand_y)

func shake(amt, time=1):
	timer.wait_time = time
	amount =amt
	set_process(true)
	timer.start()


func _on_Timer_timeout():
	set_process(false)
	tween.interpolate_property(self, "offset", self.offset, default_offset, 1)
	tween.start()
	pass # Replace with function body.
