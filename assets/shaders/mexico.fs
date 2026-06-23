// This is what actually changes the look of card
vec4 effect( vec4 colour, Image texture, vec2 tc, vec2 screen_coords )
{
    vec4 tex = Texel(texture, tc);
    vec3 tint = vec3(240./255., 173./255., 41./255.);
    tint.r += sin(screen_coords.x/50 + screen_coords.y/35)/20;
    tint.g += sin(screen_coords.x/-45 + screen_coords.y/60)/20;
    tint.b += sin(screen_coords.x/40 + screen_coords.y/-35)/20;
    tex.rgb *= 1.5;
    tex.rgb -= vec3(0.1, 0.1, 0.1);
    tex.rgb *= tint;

    return tex;
}



#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
   return transform_projection * vertex_position;
}
#endif