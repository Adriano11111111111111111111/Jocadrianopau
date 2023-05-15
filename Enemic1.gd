 extends KinematicBody2D
const gravity = 100
var objectiu :KinematicBody2D = null
var velocitat = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if objectiu != null:
		var direccio = global_position.direction_to(objectiu.global_position)
		move_and_slide(direccio * velocitat)
		
func _on_Area2D_body_entered(body:KinematicBody2D):
	objectiu = body



func _on_Area2D_body_exited(body):
	objectiu = null
