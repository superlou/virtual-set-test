shader_type canvas_item;

uniform sampler2D contentSampler;

void fragment() {
	vec4 map = texture(TEXTURE, UV);
	
	if (map.a != 0.0) {
		map.r /= map.a;
		map.g /= map.a;	
	}

	vec4 content = texture(contentSampler, map.rg);
	content.a *= map.a;
	COLOR = content;
}