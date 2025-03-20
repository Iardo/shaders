#pragma language glsl3

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

float plot(vec2 st)
{    
    return smoothstep(0.02, 0.0, abs(st.y - st.x));
}

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
{
    vec2 st = pixel_coords.xy/u_resolution;
    float y = st.x;
    float pct = plot(st);
    color = (1.0 - pct) * color + pct * vec4(0.0, 1.0, 0.0, 0.0);
	return vec4(color);
}
