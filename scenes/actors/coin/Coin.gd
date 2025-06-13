class_name Coin extends Node

@export var idCoin: String

func _on_body_entered(body):
	if body is Player:
		$AudioStreamPlayer.play()
		$Sprite2D.hide()
		$CollisionShape2D.disabled = true
		await $AudioStreamPlayer.finished
		SaveManager.current_game_state.coins.append(idCoin)
		Global.gameControler.addCoin()
		queue_free()
