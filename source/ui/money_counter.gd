extends HBoxContainer

var total_money:int
var displayed_money:int
var count_speed:float

func _process(delta: float) -> void:
	if displayed_money<total_money:
		displayed_money=mini(total_money,int(displayed_money+count_speed*delta))
		%Label.text=format_money(displayed_money)

func add_money(amount:int):
	total_money+=amount
	count_speed=maxf(total_money-displayed_money,50.0)
	$AnimationPlayer.play("collect")

static func format_money(money:int)->String:
	var result=str(money)
	var i=((result.length()-1)%3)+1
	while i<result.length():
		result=result.insert(i,",")
		i+=4
	return result
