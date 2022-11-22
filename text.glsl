@vs vs
in vec3 Position;
in vec2 RawUV;
out vec2 UV;

void main() {
    gl_Position = vec4(Position, 1.0);
    UV = RawUV;
}

@end

@fs fs
in vec2 UV;
out vec4 Color;

uniform sampler2D msdf;
uniform PassFragment {
  vec4 bgColor;
  vec4 fgColor;
};

float median(float r, float g, float b) {
    return max(min(r, g), min(max(r, g), b));
}

float screenPxRange() {
  return 1.0;
}

void main() {
    vec3 msd = texture(msdf, UV).rgb;
    float sd = median(msd.r, msd.g, msd.b);
    float screenPxDistance = screenPxRange()*(sd - 0.5);
    float opacity = clamp(screenPxDistance + 0.5, 0.0, 1.0);
    Color = mix(bgColor, fgColor, opacity);
}

@end

@program text vs fs
