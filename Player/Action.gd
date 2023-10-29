extends Node2D
@export var actor: Actor 
@onready var inventory: InventoryResource = preload("res://Player/Inventory.tres")
@onready var axeRes = preload("res://Items/ItemResources/axe.tres")
@onready var neartNode: Node

func _process(delta):
	chop()

func craftAxe():
	if(!inventory.checkItemExist('rock')):
		pick('Rocks')
	if(!inventory.checkItemExist('twig')):
		pick('Twigs')
	
	if(inventory.checkItemExist('rock') && inventory.checkItemExist('twig')):
		inventory.useItem('rock')
		inventory.useItem('twig')
		actor.set_idle()
		actor.animationPlayer.play('craft_axe');
		inventory.insert(axeRes)

func _input(event):	
	if(Input.is_action_pressed("toggle_inventory")):
			actor.inventory.toggle()
			
func createFire(): 
	inventory.useItem('log')
	GlobalTileMap.addFire(actor.position)
				
func chop():
	if(inventory.checkItemExist('axe')):
		var closest_tree = WorldState.get_closest_element(actor,'Trees')
		if closest_tree:
			if WorldState.isNear(actor,closest_tree):
				actor.set_idle()
				actor.animation_tree.set("parameters/conditions/is_axe", true)
			else:
				goTo('Trees')
	else:
		craftAxe();

func pick(groupName: String):
	var closest_tree = WorldState.get_closest_element(actor,groupName)
	if closest_tree:
		if WorldState.isNear(actor,closest_tree):
			actor.set_idle()
			actor.animation_tree.set("parameters/conditions/is_pick", true)
		else:
			goTo(groupName)
	
#func findNearestNodeByName(objName)->Node:
#    var nodes:Array[Node] = get_tree().get_nodes_in_group(objName);
#    var minDistance = 99999999;
#    var nearestNode:Node
#
#    if(nodes):
#        for node in nodes:
#            var currentDis = actor.global_position.distance_to(node.global_position)
#            if(currentDis < minDistance):
#                minDistance = currentDis
#                nearestNode = node
#        return nearestNode
#    else:
#        return actor

func goTo(objName):
	return actor.goTo(objName)


	

	
