#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;
uniform vec2 u_mouse;

float distance_from_sphere(in vec3 p, in vec3 c, float r)
{
    return length(p - c) - r;
}

float map_the_world(in vec3 p)
{
    //float displacement = sin(5.0 * p.x) * sin(5.0 * p.y) * sin(5.0 * p.z) * 0.25;
    //float displacement = sin(p.x * u_mouse.x* 5.0) * sin(p.y * u_mouse.y*5.0) * cos(p.z * u_mouse.x * 5.0);
    float displacement = sin(5.0 * p.x * u_time/2.0) * sin(5.0 * p.y * u_time/2.0) * sin(5.0 * p.z * u_time/2.0) * 0.25;
    float sphere_0 = distance_from_sphere(p, vec3(0.0), 1.0);

    // Later we might have sphere_1, sphere_2, cube_3, etc...

    return sphere_0 + displacement;
}

vec3 calculate_normal(in vec3 p)
{
    const vec3 small_step = vec3(0.001, 0.0, 0.0);

    float gradient_x = map_the_world(p + small_step.xyy) - map_the_world(p - small_step.xyy);
    float gradient_y = map_the_world(p + small_step.yxy) - map_the_world(p - small_step.yxy);
    float gradient_z = map_the_world(p + small_step.yyx) - map_the_world(p - small_step.yyx);

    vec3 normal = vec3(gradient_x, gradient_y, gradient_z);

    return normalize(normal);
}

vec3 ray_march(in vec3 ro, in vec3 rd)
{
    float total_distance_traveled = 0.0;
    const int NUMBER_OF_STEPS = 32;
    const float MINIMUM_HIT_DISTANCE = 0.001;
    const float MAXIMUM_TRACE_DISTANCE = 1000.0;
   // vec3 color = vec3(1.0);
    for (int i = 0; i < NUMBER_OF_STEPS; ++i)
    {
        //color = color = vec3(0.01, 0.01, 0.01);
        vec3 current_position = ro + total_distance_traveled * rd;

        float distance_to_closest = map_the_world(current_position);

        if (distance_to_closest < MINIMUM_HIT_DISTANCE)
        {
            vec3 normal = calculate_normal(current_position);

            // For now, hard-code the light's position in our scene
            vec3 light_position = vec3(2.0, -5.0, 3.0);

            // Calculate the unit direction vector that points from
            // the point of intersecion to the light source
            vec3 direction_to_light = normalize(current_position - light_position);

            float diffuse_intensity = max(0.0, dot(normal, direction_to_light));

            return vec3(1.0, 0.0, 0.0) * diffuse_intensity;

            // Remember, each component of the normal will be in
            // the range -1..1, so for the purposes of visualizing
            // it as an RGB color, let's remap ti to the range
            // 0..1
            //return normal * 0.5 + 0.5;
        }

        if (total_distance_traveled > MAXIMUM_TRACE_DISTANCE)
        {
            break;
        }

        total_distance_traveled += distance_to_closest;
    }

    return vec3(1.0);
}

vec3 debug()
{
    return vec3(0.0, 1.0, 0.0);
}

void main()
{
    vec2 uv = (gl_FragCoord.xy/u_resolution)*2.0 - 1.0;
    vec2 uv_aux = (gl_FragCoord.xy/u_resolution);
    // TODO UV

    vec3 camera_position = vec3(0.0, 0.0, -2.0);
    vec3 ro = camera_position;
    vec3 rd = vec3(uv, 1.0);

    vec3 shaded_color = ray_march(ro, rd);
    //shaded_color = debug();

    gl_FragColor = vec4(shaded_color, 1.0);
}
