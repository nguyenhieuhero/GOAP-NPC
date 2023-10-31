extends GoapGoal

class_name ChopTreeGoal

func is_valid(state):
	return state.get('has_axe',false)
	
func priority() -> int:
	return 1

func get_desired_state() -> Dictionary:
	return {
		'has_log':true
	}
