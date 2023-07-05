extends Node2D

var score

export (PackedScene) var Coin

func _ready():
	$TileItem.hide()
	spawn_coins()
	score = 0
	$HUD/LabelGameOver.visible = false
	

func spawn_coins():
	for cell in $TileItem.get_used_cells():
		var moneda = Coin.instance()
		moneda.position = $TileItem.map_to_world(cell) * 1.5 + $TileItem.cell_size / 2
		add_child(moneda)


func _on_GameOver_body_entered(body):
	$HUD/LabelGameOver.visible = true
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://main/Main.tscn")
	
