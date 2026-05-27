extends Node

signal coins_changed(new_total: int)
signal inventory_changed(item_id: String)
signal shop_stock_refreshed
signal shop_notification_changed(has_notification: bool)

const ITEM_AMOGUS := "amogus"
const STOCK_REFRESH_SECONDS := 20.0

var coins: int = 0
var inventory_item: String = ""
var shop_has_notification: bool = false
var shop_stock_available: bool = false

var _stock_timer: Timer

func _ready() -> void:
	_stock_timer = Timer.new()
	_stock_timer.one_shot = false
	_stock_timer.wait_time = STOCK_REFRESH_SECONDS
	_stock_timer.timeout.connect(_on_stock_refresh_timeout)
	add_child(_stock_timer)
	_stock_timer.start()
	coins_changed.emit(coins)
	inventory_changed.emit(inventory_item)
	_emit_shop_notification_changed()

func add_coins(amount: int) -> void:
	coins += amount
	coins_changed.emit(coins)

func set_inventory_item(item_id: String) -> void:
	inventory_item = item_id
	inventory_changed.emit(inventory_item)

func clear_inventory() -> void:
	set_inventory_item("")

func buy_amogus() -> bool:
	if not shop_stock_available:
		return false
	set_inventory_item(ITEM_AMOGUS)
	shop_stock_available = false
	shop_has_notification = false
	_emit_shop_notification_changed()
	return true

func _on_stock_refresh_timeout() -> void:
	shop_stock_available = true
	shop_has_notification = true
	_emit_shop_notification_changed()
	shop_stock_refreshed.emit()

func _emit_shop_notification_changed() -> void:
	shop_notification_changed.emit(shop_has_notification)
