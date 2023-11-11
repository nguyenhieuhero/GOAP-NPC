extends GoapGoal

class_name DefaultGoal

func get_goal():
	return "DefaultGoal"

func is_valid(state):
	return true
	
func priority(state: Dictionary) -> int:
	return 10

func get_desired_state() -> Dictionary:
	return {
	}
