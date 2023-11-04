extends Node

class_name GoapGoal

func get_goal() -> String:
	return ""

func is_valid(state: Dictionary) -> bool:
	return true
	
func priority(state: Dictionary) -> int:
	return 1

func get_desired_state() -> Dictionary:
	return {}
