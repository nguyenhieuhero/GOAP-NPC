extends Node2D
@export var actor: Actor 
@onready var inventory: InventoryResource = preload("res://Player/Inventory.tres")
@onready var nav:NavigationAgent2D = $"../NavigationAgent2D"
@onready var neartNode: Node

func _process(delta):
	goTo('LifePots')
	if(InNodeRange(actor, neartNode)):
		pick()




func _input(event):	
	if(Input.is_action_pressed("toggle_inventory")):
			actor.inventory.toggle()
			
			
func chop():
	actor.set_idle()
	actor.animation_tree.set("parameters/conditions/is_axe", true)
func pick():
	actor.set_idle()
	actor.animation_tree.set("parameters/conditions/is_pick", true)
	
func findNearestNodeByName(objName)->Node:
	var nodes:Array[Node] = get_tree().get_nodes_in_group(objName);
	var minDistance = 99999999;
	var nearestNode:Node
	
	if(nodes):
		for node in nodes:
			var currentDis = actor.global_position.distance_to(node.global_position)
			if(currentDis < minDistance):
				minDistance = currentDis
				nearestNode = node
		return nearestNode
	else:
		return actor

func goTo(objName):
	actor.action_finished()
	neartNode = findNearestNodeByName(objName)
	if not actor.isAction:
		nav.target_position = neartNode.global_position
		var dir = to_local(nav.get_next_path_position()).normalized()
		actor.velocity = dir * actor.SPEED
	if(InNodeRange(actor, neartNode)):
		actor.action_started()

func InNodeRange(actor: Node, node: Node):
	var currentDis = actor.global_position.distance_to(node.global_position)
	if(currentDis < 2): return true
	return false
	

	
