extends Control

@export var inventory: InventoryResource
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

func getExistedItems():
	var items: Dictionary = {}
	for slot in inventory.slots:
		if !slot.itemResource:
			continue
		items[slot.itemResource.name]=true
	return items

func useItem(itemName):
	for slot in inventory.slots:
		if(slot.itemResource && slot.itemResource.name == itemName):
			if(slot.quanity > 0):    
				slot.quanity -=1;
			if(slot.quanity == 0): 
				slot.itemResource = null;
	update_slots()

func insert(item: ItemResource):
	inventory.insert(item)
