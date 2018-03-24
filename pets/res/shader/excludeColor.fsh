#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
	vec4 c = texture2D(CC_Texture0, v_texCoord);
    if (c.g > 30.0 / 250.0) {
        c = vec4(0.0);
    }
    
    gl_FragColor = v_fragmentColor * c;
}