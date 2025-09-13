shader_type canvas_item;

uniform float radius = 0.5;

void fragment() {
    vec2 uv = UV - vec2(0.5);
    float dist = length(uv);
    if (dist > radius) {
        discard;
    }
    COLOR = texture(TEXTURE, UV);
}
