#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define MY_HIGHP_OR_MEDIUMP highp
#else
	#define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP number spin_time;
extern MY_HIGHP_OR_MEDIUMP vec4 colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 colour_2;
extern MY_HIGHP_OR_MEDIUMP vec4 colour_3;
extern MY_HIGHP_OR_MEDIUMP number contrast;
extern MY_HIGHP_OR_MEDIUMP number spin_amount;

#define PIXEL_SIZE_FAC 700.
#define SPIN_EASE 0.5

vec2 rotate(vec2 v, float a) {
	float s = sin(a);
	float c = cos(a);
	mat2 m = mat2(c, s, -s, c);
	return m * v;
}

float apply(float v, float s) {
    if (s > 0) {
    if (v > 0.5) {
        v = (v - 1)/s + 1;
    } else {
        v = v/s;
    }
    }

    return v;
}

vec4 contrasted(vec4 c, float s) {
    
    c.r = apply(c.r, s);
    c.g = apply(c.g, s);
    c.b = apply(c.b, s);

    return c;
}

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{

    MY_HIGHP_OR_MEDIUMP number pixel_size = length(love_ScreenSize.xy)/PIXEL_SIZE_FAC;
    MY_HIGHP_OR_MEDIUMP vec2 uv = (floor(screen_coords.xy*(1./pixel_size))*pixel_size - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy) - vec2(0.12, 0.);

    number dist = distance(uv, vec2(0,0)) * 2.;
    vec2 norm = rotate(normalize(uv),-spin_time);
    norm = rotate(norm, dist * -3.);
    norm *= 20.;

    for (int i = 1; i < spin_amount + 5; i++) {
        dist += sin((-i * norm.x + time + i * time) + (-i * spin_time * 0.93) + (i * cos(time/6. - spin_time))) / (i * sqrt(i) * 30.);
        dist -= cos((i * norm.y + time + -i * time) + (i * spin_time * 1.32) + (-i * sin(time/7. + spin_time))) / (i * (30. + i/2.));
    }
    dist = abs(dist);

    MY_HIGHP_OR_MEDIUMP vec4 ret_col;
    ret_col += colour_2 * min(1,abs(dist * 2 - 1));
    ret_col += colour_1 * max(0,-abs(dist * 2 - 1) + 1);

    vec4 fake_3 = colour_3 - vec4(dist);
    ret_col += fake_3 * (sin(100 * dist) + 1)/2;

    return contrasted(ret_col, contrast/contrast);
}