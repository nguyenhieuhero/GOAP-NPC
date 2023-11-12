extends GoapGoal

class_name HasFireGoal

func get_goal():
	return "HasFireGoal"

func is_valid(state):
	return state.get('see_Fires') == false
	
func priority(state: Dictionary) -> int:
	if !state.get("is_day",false):
		return 100
	return 1

func get_desired_state() -> Dictionary:
	return {
		"see_Fires": true
	}
