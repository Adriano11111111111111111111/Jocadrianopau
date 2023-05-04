extends KinematicBody2D

onready var bullet = preload("res://Bullet.tscn")
var b 

var velocity = Vector2(0,0)
const SPEED = 300
const GRAVITY = 15
const JUMPFORCE = -1100
var jet_pack_speed = 35
var fuel = 100

func _physics_process(delta):
		$Labe2.text = "Fuel:" + str(fuel)
		velocity.y = velocity.y + GRAVITY	
		if Input.is_action_pressed("right"):
			velocity.x = SPEED
			
			$AnimatedSprite.flip_h = false
			if is_on_floor():
				$AnimatedSprite.play("Correr")
		elif Input.is_action_pressed("left"):
			velocity.x = -SPEED
			$AnimatedSprite.flip_h = true
			if is_on_floor():
				$AnimatedSprite.play("Correr")
		elif not is_on_floor():
			$AnimatedSprite.play("Volar")
		else:
			velocity.x = 0
			$AnimatedSprite.play("Idle")
		
		if fuel > 0:
			if Input.is_action_pressed("jump"):
				velocity.y -= jet_pack_speed
				fuel -= 1

		velocity = move_and_slide(velocity, Vector2.UP)


func shoot():
	if Input.is_action_just_pressed('shoot'):
		b = bullet.instance()
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position
func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://level 1.tscn")


func _on_Area2D2_body_entered(body):
	get_tree().change_scene("res://WIN.tscn")



func _on_Timer_timeout():
	if fuel < 100 and is_on_floor():
		fuel += 10
		if fuel > 100:
			fuel = 100
