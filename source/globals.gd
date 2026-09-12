#class_name globals

extends Node

enum DAMAGE_TYPE{
	timeout,
	arrow,
	unknown,
	bomb
}

var main:Main
var restarting:=false
var money : int = 0

func format_money(value:int)->String:
	var result=str(value)
	var i=((result.length()-1)%3)+1
	while i<result.length():
		result=result.insert(i,",")
		i+=4
	return result
