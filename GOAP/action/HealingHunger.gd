extends GoapAction
class_name HealingHunger

func get_action():
	return "HealingHungerAction"

func get_cost(state: Dictionary):
	return 1

func get_preconditions() -> Dictionary:
	return {
		"has_beaf": true,
	}

func get_effects() -> Dictionary:
	return {
		"is_hunger": true
	}

func perform(actor: Actor, delta):
	actor.set_idle()
	await actor.animationPlayer.play('craft_axe');
	actor.inventory.useItem('beaf')
	actor.currentHunger += 10
