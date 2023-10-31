extends GoapGoal

class_name HasTwig

func is_valid(state):
	print(state)
	return state.get('see_Twigs',false)
	
func priority() -> int:
	return 1

func get_desired_state() -> Dictionary:
	return {
		'has_log':true
	}
