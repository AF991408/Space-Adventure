extends Sprite2D
var flicker=0.5
var time_acum=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_acum+=delta
	if time_acum >= flicker:
		visible=!visible
		time_acum
	pass
