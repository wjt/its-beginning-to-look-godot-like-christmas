shader_type canvas_item;

void fragment() {
	COLOR.rgb *= 1.0 + (sin(TIME / 10.0) / 100.0);
}