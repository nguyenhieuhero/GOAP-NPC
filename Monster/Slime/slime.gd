extends CharacterBody2D
@onready var player = preload("res://Player/player.tscn")
@export var speed = 20
@export var limit = 0.5
var startPosition 
var endPosition
@export var endPoint: Marker2D
@onready var animation = $AnimatedSprite2D
func _ready():
	startPosition = position
	endPosition = endPoint.global_position
func changeDirection(): 
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd	
func updateVelocity():
	var moveDirection = endPosition - position
	if moveDirection.length() < limit: 
		position = endPosition
		changeDirection()
		moveDirection = Vector2(0,0)
	velocity = moveDirection
func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	updateAnimation()
func updateAnimation(): 
	var animationString = "walkUp"
	if  velocity.y > 0: 
		animationString = "walkDown"
	animation.play(animationString)
	
func knockback(vectorDame: Vector2):
	var knockbackDirection = vectorDame * 1000
	velocity = knockbackDirection
	move_and_slide()
#
#func see_player():
#	var _player = player.instantiate()
#	print("player", _player.position)




