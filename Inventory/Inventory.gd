extends Control

@onready var inventory: InventoryResource = preload("res://Player/Inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
var isOpen: bool = false

func _ready():
	inventory.updated.connect(update_slots)
	update_slots()
	visible = isOpen
	self.z_index=10

func update_slots():
	for i in range(min(inventory.slots.size(),slots.size())):
		slots[i].update_slot(inventory.slots[i])

func toggle():
	isOpen = !isOpen
	visible = isOpen


