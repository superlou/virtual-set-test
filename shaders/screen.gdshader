shader_type canvas_item;

uniform sampler2D contentSampler;

void fragment() {
	vec4 map = texture(TEXTURE, UV);
	vec4 content = texture(contentSampler, map.rg);

	content.a *= map.a;

	COLOR = content;
}