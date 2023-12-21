extends PathFollow2D

var t:float
var direction:bool
var speedFactor := 200
var curve:Curve2D
var pathLength:float
var points:PackedVector2Array
var paused:bool
var lastPoint:Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	curve = self.get_parent().get_curve()
	pathLength = curve.get_baked_length()
	t = randf() * pathLength
	points = curve.tessellate(0,90)
	print(points)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if paused: 
		delta = 0
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
	var position = self.position
	for i in range(points.size()):
		var point = points[i]
		var distance = position.distance_to(point)
		if (distance < 5 && !paused && lastPoint != point):
			self.position = point
			print(distance)
			pauseForOneSecond(point)

func pauseForOneSecond(point:Vector2):
	paused = true
	await get_tree().create_timer(1).timeout
	lastPoint = point
	paused = false


func _on_check_button_toggled(button_pressed):
	paused = button_pressed
