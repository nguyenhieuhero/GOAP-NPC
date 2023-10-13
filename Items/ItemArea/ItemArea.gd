extends Area2D
@export var itemRes: ItemResource

func collect(inventory: InventoryResource):
	if inventory.isSlotAvailabel(itemRes):
		inventory.insert(itemRes)
		queue_free()
