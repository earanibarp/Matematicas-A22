extends Node2D

export (PackedScene) var Coin

func _ready():
	$TileItem.hide()
	spawn_coins()
	

func spawn_coins():
	for cell in $TileItem.get_used_cells():
		var moneda = Coin.instance()
		moneda.position = $TileItem.map_to_world(cell) * 1.5 + $TileItem.cell_size / 2
		add_child(moneda)
