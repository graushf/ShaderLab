#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;

float diff_line = 0.01;

float plot(vec2 st, float pct){
 return  smoothstep( pct-diff_line, pct, st.y) -
         smoothstep( pct, pct+diff_line, st.y);
}

float evaluate_function(int option, float disp, vec2 st)
{
    float function_eval = 0.0;
   if (option == 0) {
       function_eval = st.x - disp;
   }
   if (option == 1) {
       function_eval = pow(st.x - disp, 2.0);
   }
   if (option == 2) {
       function_eval = pow(st.x - disp, 3.0);
   }
   if (option == 3) {
       function_eval = exp(st.x - disp) - 1.0;
   }
   if (option == 4) {
       function_eval = exp(st.x - disp) - PI;
   }
   if (option == 5) {
       function_eval = log(st.x - disp) + 2.0;
   }
   if (option == 6) {
       function_eval = pow(st.x - disp, 1.0/4.0);
   }
   if (option == 7) {
       function_eval = 0.5 * sin((st.x - disp + (u_time/20.0)) * 4.0 * PI) + 0.5;
   }
   if (option == 8) {
       function_eval = 0.5 * sin((st.x - disp + (u_time/2.0)) * 1.0 * PI * u_time) + 0.5;
   }

    return function_eval;
}


void main() {
   vec2 st= gl_FragCoord.xy/u_resolution;

   float y = 0.4;
   float d_portion = 1.0;
   float diff = 0.001;
   float diff_y = 0.003;
   float center = 0.5;
   float quarter = 0.25;
   float three_quarter = 0.75;

   if ((st.x > quarter - diff) && (st.x < quarter + diff)) {
       y = 0.7;
   }

   if ((st.x > center - diff) && (st.x < center + diff)) {
       y = 0.7;
   }

   if ((st.x > three_quarter - diff) && (st.x < three_quarter + diff)) {
       y = 0.7;
   }

   if ((st.y < center + diff_y) && (st.y > center - diff_y)) {
       y = 0.7;
   }



   //if ((st.y < 0.95 + diff_y) && (st.y > 0.80 - diff_y)) {
   //    y = 0.0;
   //}


   gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);

   float function_eval;



   function_eval =  evaluate_function(8, 0.0, st);

   if (((st.x > 0.80 - diff) && (st.x < 1.0 + diff)) && ((st.y < 1.0 + diff_y) && (st.y > 0.80 - diff_y))) {

       vec3 b_section = vec3(evaluate_function(8, 0.80, st));
       gl_FragColor = vec4(b_section, 1.0);

   } else {

       float ans = plot(st, function_eval);
       vec3 color_bg = vec3(y);

       vec3 aux = ans*vec3(0.0, 1.0, 0.0);

       vec3 color = (1.0 - ans)*color_bg + aux;

       gl_FragColor = vec4(color, 1.0);
   }

}
