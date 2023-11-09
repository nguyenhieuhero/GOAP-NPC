extends GoapGoal

class_name ChopTreeGoal

func get_goal():
	return "ChopTreeGoal"

func is_valid(state):
	return state.get('see_Trees',false)
	
func priority(state: Dictionary) -> int:
	return 1

func get_desired_state() -> Dictionary:
	return {
		'has_log':true
	}
