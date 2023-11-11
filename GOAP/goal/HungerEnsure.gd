extends GoapGoal

class_name HungerEnsure
func get_goal():
	return "HungerEnsureGoal"

func is_valid(state):
	return true
	
func priority(state: Dictionary) -> int:
	return 100

func get_desired_state() -> Dictionary:
	return {
		"is_hunger": true
	}
