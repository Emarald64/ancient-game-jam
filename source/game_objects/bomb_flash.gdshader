shader_type canvas_item;

void fragment() {
	COLOR.a-=float(distance(UV,vec2(0.5,0.5))>.5);
}