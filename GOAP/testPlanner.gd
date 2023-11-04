extends Node

class_name TestGoapActionPlanner

var actions: Array[GoapAction]
var max_depth = 4

func set_actions(_actions: Array[GoapAction]):
	print("set action success")
	actions = _actions

func discovered_actions(state: Dictionary) -> Array[GoapAction]:
	var available_actions: Array[GoapAction] = []
	for action in actions:
		var is_valid = true
		var conditions = action.get_preconditions()
		for condition in conditions:
			if state.get(condition,false) != conditions.get(condition,false):
				is_valid = false
		if is_valid:
			available_actions.push_back(action)
	return available_actions

func create_plans(step: PlannerStep,state: Dictionary) -> PlannerStep:
	var actions = discovered_actions(state)
	for action in actions:
		var _step = PlannerStep.new()
		var new_state = state.duplicate()
		_step.init_state = state.duplicate()
		var effects = action.get_effects()
		var _should_go = true
		for condition in effects:
			if step.desired_state.get(condition) != effects.get(condition):
				_should_go = false
			new_state[condition] = effects[condition]
		_step.desired_state = step.desired_state
		_step.action = action
		_step.depth = step.depth + 1
		_step.new_state = new_state
		_step.should_go = _should_go
		if(max_depth>step.depth):
			step.children.append(create_plans(_step,new_state))
	return step
func get_plan(goal: GoapGoal, state: Dictionary):
	var root: PlannerStep = PlannerStep.new()
	root.desired_state = goal.get_desired_state()
	root.depth = 0
	root = create_plans(root,state)
	root = update_path(root)
	print_action_tree(root)
#	for r0 in root.children:
#		print(r0.action.get_action()," ",r0.depth," ",r0.should_go)
#		for r1 in r0.children:
#			print(r1.action.get_action()," ",r1.depth," ",r1.should_go)
#			for r2 in r1.children:
#				print(r2.action.get_action()," ",r2.depth," ",r2.should_go)
#				for r3 in r2.children:
#					print(r3.action.get_action()," ",r3.depth," ",r3.should_go)
#					for r4 in r3.children:
#						print(r4.action.get_action()," ",r4.depth," ",r4.should_go)
#						for r5 in r4.children:
#							print(r5.action.get_action()," ",r5.depth," ",r5.should_go)
	print("=======")

func tree_to_array(root: PlannerStep):
	var actions : Array[GoapAction] = []
	if root.action and root.should_go:
		print(root.action.get_action()," ",root.depth," ",root.should_go)
	for r in root.children:
		print_action_tree(r)
	return actions
	
#func tree_to_array(p):
#	var plans = []
#
#	if p.children.size() == 0:
#		plans.push_back(p.action)
#		return plans
#	for c in p.children:
#		for child_plan in tree_to_array(c):
#			child_plan.actions.push_back(p.action)
#			plans.push_back(child_plan)
#	return plans

func update_path(root: PlannerStep) -> PlannerStep:
	for r in root.children:
		update_path(r)
	for r in root.children:
		if r.should_go:
			root.should_go = true
	return root

func print_action_tree(root: PlannerStep):
	if root.action and root.should_go:
		print(root.action.get_action()," ",root.depth," ",root.should_go)
	for r in root.children:
		print_action_tree(r)
	return

#for r0 in root.children:
#		print(r0.action.get_action()," ",r0.depth," ",r0.should_go)
#		for r1 in r0.children:
#			print(r1.action.get_action()," ",r1.depth," ",r1.should_go)
#			for r2 in r1.children:
#				print(r2.action.get_action()," ",r2.depth," ",r2.should_go)
#				for r3 in r2.children:
#					print(r3.action.get_action()," ",r3.depth," ",r3.should_go)
#					for r4 in r3.children:
#						print(r4.action.get_action()," ",r4.depth," ",r4.should_go)
#						for r5 in r4.children:
#							print(r5.action.get_action()," ",r5.depth," ",r5.should_go)
