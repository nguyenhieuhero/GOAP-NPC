extends Node

var existed_group = ['Trees','LifePots','Rocks','Twigs', 'Logs', 'Slimes', 'Fires', 'Beafs', 'Chickens']

var world_state = {
}

func _process(delta):
	for group in existed_group:
		if get_elements(group):
			set_state('see_'+group,true)
		else:
			set_state('see_'+group,false)
	
	
func get_state(state_name, default = false):
	return world_state.get(state_name, default)


func set_state(state_name, value):
	world_state[state_name] = value


func clear_state():
	world_state = {}


func get_elements(group_name):
	return self.get_tree().get_nodes_in_group(group_name)


func get_closest_element(reference,group_name):
	var elements = get_elements(group_name)
	var closest_element
	var closest_distance = 10000000

	for element in elements:
		var distance = reference.position.distance_to(element.position)
		if  distance < closest_distance:
			closest_distance = distance
			closest_element = element

	return closest_element

func isNear(actor: CharacterBody2D, node2: Node):
	if(actor == null or node2 == null):
		return false
	var currentDis = actor.global_position.distance_to(node2.global_position)
	if currentDis < 5:
		return true
	return false

	
