extends PathFollow2D

var t := 0.0
var direction = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (direction):
		t -= delta /10
		if (t < 0):
			t = 0
			direction = !direction
	else:
		t += delta /10
		if (t > 1):
			t = 1
			direction = !direction
	self.progress_ratio = t
