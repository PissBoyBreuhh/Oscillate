float contrast(float val)
{
    if (0.8 < val) {
        return 1;
    } else if (val < 0.2) { return 1; }
    return 0;
}

vec4 effect( vec4 colour, Image texture, vec2 tc, vec2 screen_coords )
{
    vec4 tex = Texel(texture, tc);
    if (tex.rgb == vec3(1,1,1)) { return tex;}

    tex.r = contrast(tex.r);
    tex.g = contrast(tex.g);
    tex.b = contrast(tex.b);
    if (tex.rgb == vec3(1,1,1)) { tex.rgb = vec3(0,0,0); }

    return tex;
}



#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
   return transform_projection * vertex_position;
}
#endif