class_name Coin extends Node

@export var idCoin: String

func _on_body_entered(body):
	if body is Player:
		SaveManager.current_game_state.coins.append(idCoin)
		Global.gameControler.addCoin()
		$CollisionShape2D.set_deferred("disabled", true) 
		$Sprite2D.hide()
		$AudioStreamPlayer.play()
		await $AudioStreamPlayer.finished
		queue_free()
