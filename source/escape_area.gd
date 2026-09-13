extends Area2D



func _on_body_entered(player: Node2D) -> void:
	if Globals.main.escaping:
		Globals.main.game_timer.stop()
		player.play_win_animation()
