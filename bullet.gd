extends Sprite

func _ready():
	scale = Vector2(.1, .1)

func _physics_process(delta):
	position.x += 100


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
