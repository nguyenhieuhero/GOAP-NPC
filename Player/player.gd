extends CharacterBody2D
class_name Actor

@export var SPEED: float = 50
@export var direction: Vector2 = Vector2(0, 1)
@onready var animation_tree = $AnimationTree
@onready var inventory = $Inventory
@onready var isAction = false
@onready var nav:NavigationAgent2D = $NavigationAgent2D

func _ready():
	animation_tree.active=true
func _physics_process(_delta):
	if isAction:
		velocity = Vector2.ZERO
	move_and_slide()
func _process(delta):
	pass
#	direction = Input.get_vector("left","right","up","down")
#	if isAction:
#		return
#	if direction != Vector2.ZERO:
#		update_animation_direction(direction)	
#
#	update_state()

	
	
	
	
	
func update_animation_direction(input: Vector2):
	if input != Vector2.ZERO:
		animation_tree.set("parameters/idle/blend_position", input)
		animation_tree.set("parameters/walk/blend_position", input)
		animation_tree.set("parameters/axe/blend_position", input)
		animation_tree.set("parameters/pick/blend_position", input)
		
func update_state():
	if velocity == Vector2.ZERO:
		set_idle()
	else:
		animation_tree.set("parameters/conditions/is_walk", true)
		
func action_started():
	isAction=true

func action_finished():
	isAction=false

func set_idle():
	animation_tree.set("parameters/conditions/is_walk", false)
	animation_tree.set("parameters/conditions/is_idle", true)
	


	
	




