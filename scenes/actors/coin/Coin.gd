class_name Coin extends Node

@export var idCoin: String

func _on_body_entered(body):
	if body is Player:
		SaveManager.current_game_state.coins.append(idCoin)
		Global.gameControler.addCoin()
		queue_free()
