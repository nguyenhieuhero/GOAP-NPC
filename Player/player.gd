extends CharacterBody2D
class_name Actor
@export var maxHealth: int = 100
var currentHealth: int = maxHealth
@export var SPEED: float = 50
@export var direction: Vector2 = Vector2(0, 1)
@onready var animation_tree = $AnimationTree
@onready var inventory = $Inventory
@onready var isAction = false
@onready var nav: NavigationAgent2D = $"./NavigationAgent2D"
@onready var agent = GoapAgent.new()
@onready var planner= TestGoapActionPlanner.new()
@onready var animationPlayer = $AnimationPlayer

func _ready():
	animation_tree.active = true
	agent.init(self,[
		HasTwig.new(),
		ChopTreeGoal.new(),
		HasRock.new()
		])
	add_child(agent)
	planner.set_actions([
		PickUpLifepot.new(),
		PickUpLog.new(),
		PickUpTwig.new(),
		PickUpRock.new(),
		CreateAxe.new(),
		ChopTree.new(),
		KillSlime.new()
	])
func _physics_process(_delta):
	update_animation_direction(velocity)
	move_and_slide()
func _process(delta):
	var root = PlannerStep.new()
	var _t1 = planner.get_plan(ChopTreeGoal.new(),agent.state)
#	var _t2 = []
#	for action in _t1:
#		_t2.push_back(action.get_action())
#	print(_t2)
#	for action in _t1:
#		action.perform(self,delta)
#	if _t1.size() == 0:
#		velocity = Vector2.ZERO
	update_state()
#	direction = Input.get_vector("left","right","up","down")
#	if isAction:
#		return
#	if direction != Vector2.ZERO:
#		update_animation_direction(direction)	
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
	velocity = Vector2.ZERO
	animation_tree.set("parameters/conditions/is_walk", false)
	animation_tree.set("parameters/conditions/is_idle", true)
	
func goTo(objName):
	var nearNode: Node = WorldState.get_closest_element(self,objName)
	if not isAction and not WorldState.isNear(self,nearNode):
		nav.target_position = nearNode.global_position
		var dir = to_local(nav.get_next_path_position()).normalized()
		velocity = dir * SPEED
	




