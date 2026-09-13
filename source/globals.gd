#class_name globals

extends Node

enum DAMAGE_TYPE{
	timeout,
	arrow,
	unknown,
	bomb,
	pit
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

func format_time(time_ms:int)->String:
	@warning_ignore_start("integer_division")
	var minutes:=time_ms/60000
	var seconds:=(time_ms/1000)%60
	var hundreths:=(time_ms/10)%100
	@warning_ignore_restore("integer_division")
	return "%2d:%02d.%02d" % [minutes,seconds,hundreths]
