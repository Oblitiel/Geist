extends Control

func update():
	$CoinsLabel.text = "X%s" % SaveManager.current_game_state.coins.size()
