extends Node


var state = {
}


func get_state(state_name, default = null):
	return state.get(state_name, default)


func set_state(state_name, value):
	state[state_name] = value


func clear_state():
	state = {}


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
	if currentDis < 2:
		return true
	return false

	
