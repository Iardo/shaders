#pragma language glsl3

#ifdef GL_ES
precision mediump float;
#endif

uniform number u_time;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
{
    return vec4((1.0 + sin(u_time))/2.0, abs(cos(u_time)), abs(sin(u_time)), 1.0);
}
