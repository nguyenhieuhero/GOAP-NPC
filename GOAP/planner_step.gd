class_name PlannerStep

var desired_state: Dictionary = {}
var init_state: Dictionary
var new_state: Dictionary
var should_go: bool = false
var is_end: bool = false
var action: GoapAction
var children: Array[PlannerStep] = []
var depth: int
