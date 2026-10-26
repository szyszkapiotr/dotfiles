#version 300 es
precision highp float;

in vec2 v_texcoord;
out vec4 fragColor;
uniform sampler2D tex;

void main() {
    vec4 color = texture(tex, v_texcoord);

    // Calculates the grayscale/brightness (Luminance)
    vec3 lumaWeights = vec3(0.2126, 0.7152, 0.0722);
    float luminance = dot(color.rgb, lumaWeights);
    vec3 gray = vec3(luminance);

    // Saturation value: 1.0 is normal, 1.5 is high, 2.0(1.9) is extreme
    float saturation = 1.9; 

    // Blend the image with the new saturation
    fragColor = vec4(mix(gray, color.rgb, saturation), color.a);
}
