class_name Coin extends Node

@export var idCoin: String

func _on_body_entered(body):
	if body is Player:
<<<<<<< Updated upstream
		$AudioStreamPlayer.play()
		$Sprite2D.hide()
		$CollisionShape2D.disabled = true
=======
		$CollisionShape2D.set_deferred("disabled", true)
		$Sprite2D.hide()
		$AudioStreamPlayer.play()
>>>>>>> Stashed changes
		await $AudioStreamPlayer.finished
		SaveManager.current_game_state.coins.append(idCoin)
		Global.gameControler.addCoin()
		queue_free()
