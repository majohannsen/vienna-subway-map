extends PathFollow2D

var t:float
var direction:bool
var speedFactor := 200
var pathLength:float

# Called when the node enters the scene tree for the first time.
func _ready():
	pathLength = self.get_parent().get_curve().get_baked_length()
	t = randf() * pathLength


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (direction):
		t -= delta * speedFactor
		if (t < 0):
			t = 0
			direction = !direction
	else:
		t += delta * speedFactor
		if (t > pathLength):
			t = pathLength
			direction = !direction
	self.progress = t
