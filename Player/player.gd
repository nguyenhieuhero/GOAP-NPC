extends CharacterBody2D
class_name Actor
@export var maxHealth: int = 100
var currentHealth: int = maxHealth
@export var maxSanity: int = 100
var currentSanity: int = maxSanity
@export var maxHunger: int = 100 
@onready var currentHunger: int = maxHunger
@export var SPEED: float = 50

@export var direction: Vector2 = Vector2(0, 1)
@onready var animation_tree = $AnimationTree
@onready var inventory = $Inventory
@onready var isAction = false
@onready var nav: NavigationAgent2D = $"./NavigationAgent2D"
@onready var agent = GoapAgent.new()
@onready var planner= GoapPlanner.new()
@onready var animationPlayer = $AnimationPlayer

func _ready():
	animation_tree.active = true
	agent.init(self,[
		HasFireGoal.new(),
		SanityEnsure.new(),
		DefaultGoal.new(),
		KILLSLIME.new(),
		HungerEnsure.new(),
		HealthyEnsure.new()
		],[
		PickUpLifepot.new(),
		PickUpLog.new(),
		PickUpTwig.new(),
		PickUpRock.new(),
		PickUpBeaf.new(),
		CreateAxe.new(),
		ChopTree.new(),
		KillSlime.new(),
		CreateFire.new(),
		HealingHealth.new(),
		HealingSanity.new(),
		KillChicken.new(),
		HealingHunger.new(),		
	])
	add_child(agent)
func _physics_process(_delta):
	update_animation_direction(velocity)
	move_and_slide()
func _process(delta):
	update_state()
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
	



