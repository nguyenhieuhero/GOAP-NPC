extends GoapAction
class_name CreateAxe
@onready var axeRes = preload("res://Items/ItemResources/axe.tres")

func get_action():
	return "CreateAxeAction"

func get_cost(state: Dictionary):
	return 1

func get_preconditions() -> Dictionary:
	return {
		"has_rock": true,
		"has_twig": true,
		"has_axe": false
	}

func get_effects() -> Dictionary:
	return {
		"has_axe": true
	}

func perform(actor: Actor, delta):
	actor.set_idle()
	actor.inventory.useItem('rock')
	actor.inventory.useItem('twig')
	actor.animationPlayer.play('craft_axe');
	actor.inventory.insert(load("res://Items/ItemResources/axe.tres"))
	return true
