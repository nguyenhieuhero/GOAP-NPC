extends Node
class_name GoapAction

func get_cost(state) -> int:
	return 1000

func get_preconditions() -> Dictionary:
	return {}
	
func get_effects() -> Dictionary:
	return {}

func perform(_actor, _delta) -> bool:
	return false
