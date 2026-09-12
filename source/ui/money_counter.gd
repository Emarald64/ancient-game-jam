extends HBoxContainer

var displayed_money:int
var count_speed:float

func _process(delta: float) -> void:
	if displayed_money<Globals.money:
		displayed_money=mini(Globals.money,displayed_money+maxi(int(count_speed*delta),1))
		%Label.text=Globals.format_money(displayed_money)

func add_money(amount:int):
	#var new_money_length=format_money(total_money+amount).length()
	#if format_money(total_money).length()!=new_money_length:
		#var tween=create_tween()
		#tween.set_ease(Tween.EASE_OUT)
		#tween.tween_property(%Label,"custom_minimum_size",Vector2(new_money_length*29,0),.2)
	Globals.money+=amount
	count_speed=maxf(Globals.money-displayed_money,50.0)
	$AnimationPlayer.play("collect")
