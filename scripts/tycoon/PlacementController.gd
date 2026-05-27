extends Node2D

@export var player: Node2D
@export var placement_radius: float = 150.0
@export var amogus_scene: PackedScene

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_try_place_amogus()

func _try_place_amogus() -> void:
	if GameManager.inventory_item != GameManager.ITEM_AMOGUS:
		return

	var world_pos := get_global_mouse_position()
	if player.global_position.distance_to(world_pos) > placement_radius:
		return

	var plant := amogus_scene.instantiate()
	plant.global_position = world_pos
	get_tree().current_scene.add_child(plant)
	GameManager.clear_inventory()
