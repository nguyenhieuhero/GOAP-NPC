extends GoapGoal

class_name HasFireGoal

func get_goal():
	return "HasFireGoal"

func is_valid(state):
	return state.get('has_axe',false)
	
func priority(state: Dictionary) -> int:
	return 1

func get_desired_state() -> Dictionary:
	return {
		"see_Fires": true
	}
