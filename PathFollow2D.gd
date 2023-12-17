extends PathFollow2D

var t:float
var direction:bool
var speedFactor := 200

# Called when the node enters the scene tree for the first time.
func _ready():
	t = randf()*self.get_parent().get_curve().get_baked_length()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (direction):
		t -= delta * speedFactor
		if (t < 0):
			t = 0
			direction = !direction
	else:
		t += delta * speedFactor
		if (t > self.get_parent().get_curve().get_baked_length()):
			t = self.get_parent().get_curve().get_baked_length()
			direction = !direction
	self.progress = t
