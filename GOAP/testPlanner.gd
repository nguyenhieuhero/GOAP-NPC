extends Node

class_name TestGoapActionPlanner

var actions: Array[GoapAction]
var max_depth = 7

func set_actions(_actions: Array[GoapAction]):
	actions = _actions

func discovered_actions(state: Dictionary) -> Array[GoapAction]:
	var available_actions: Array[GoapAction] = []
	for action in actions:
		var is_valid = true
		var conditions = action.get_preconditions()
		for condition in conditions:
			if state.get(condition,false) != conditions.get(condition):
				is_valid = false
		if is_valid:
			available_actions.push_back(action)
	return available_actions

func create_plans(step: PlannerStep,state: Dictionary) -> PlannerStep:
	if contain_dic(state,step.desired_state):
		return step
	var actions = discovered_actions(state)
	for action in actions:
		var _step = PlannerStep.new()
		var new_state = state.duplicate()
		_step.init_state = state.duplicate()
		var effects = action.get_effects()
		var _is_end = true
		for condition in effects:
			if step.desired_state.get(condition) != effects.get(condition):
				_is_end = false
			new_state[condition] = effects[condition]
		_step.desired_state = step.desired_state
		_step.action = action
		_step.depth = step.depth + 1
		_step.new_state = new_state
		_step.is_end = _is_end
		_step.should_go = _is_end
		if(max_depth > step.depth):
			step.children.append(create_plans(_step,new_state))
	return step
	
func contain_dic(source: Dictionary,target: Dictionary)->bool:
	var _is_end = true
	for condition in target:
		if target.get(condition) != source.get(condition,false):
			_is_end = false
	return _is_end
func get_plan(goal: GoapGoal, state: Dictionary):
	var root: PlannerStep = PlannerStep.new()
	root.desired_state = goal.get_desired_state()
	root.depth = 0
#	state = {"has_rock":true, "is_day": true, "see_Trees": true, "see_LifePots": true, "see_Rocks": true, "see_Twigs": true, "see_Logs": false, "see_Slimes": true }
	root = update_path(create_plans(root,state))
#	print_action_tree(root)
	var cheapeast_plan = get_cheapeast_plan(tree_to_array(root))
#	print(goal.get_goal())
#	for plan in cheapeast_plan:
#		print(plan.get_action())
	return cheapeast_plan
	
func tree_to_array(root: PlannerStep):
	var plans: Array = []
	if root.is_end:
		plans.push_back({"actions_name":[root.action.get_action()],"cost":root.action.get_cost(root.new_state),"actions":[root.action], "depth":[root.depth]})
		return plans
	
	for r in root.children:
		if r.action and r.should_go:
			for child_plan in tree_to_array(r):
				if !r.is_end:
					child_plan["actions_name"].push_front(r.action.get_action())
					child_plan["actions"].push_front(r.action)
					child_plan["depth"].push_front(r.depth)
					child_plan.cost += r.action.get_cost(r.new_state)
				plans.push_back(child_plan)
	return plans
	


func get_cheapeast_plan(plans: Array):
	if plans.size() == 0:
		return []
	var cheapeast_plan
	for p in plans:
		if cheapeast_plan == null or p.cost < cheapeast_plan.cost:
			cheapeast_plan = p
	return cheapeast_plan.actions

func update_path(root: PlannerStep) -> PlannerStep:
	for r in root.children:
		update_path(r)
	for r in root.children:
		if r.should_go:
			root.should_go = true
	return root

func print_action_tree(root: PlannerStep):
	if root.action and root.should_go:
		print(root.action.get_action()," ",root.depth," ",root.should_go," ",root.is_end)
	for r in root.children:
		print_action_tree(r)
	return

