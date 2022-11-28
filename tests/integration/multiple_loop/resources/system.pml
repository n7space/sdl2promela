#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_tmp int
#define Actuator_States_wait 0
#define MyInteger int

#include "actuator.pml"

inline MyInteger_assign_value(dst, src)
{
    dst = src;
}

inline Actuator_0_RI_0_response(param)
{
    printf("Result: %d\n", param);
}

inline Actuator_0_PI_0_impulse_unhandled_input(input_param)
{
    skip;
}

typedef Actuator_Context_auxilary {
    byte data[5];
    int length;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_tmp tmp;
    Actuator_Context_auxilary auxilary;
}

typedef system_state {
    Actuator_Context actuator;
}

system_state global_state;

init {
    Actuator_0_init();
    Actuator_0_PI_0_impulse(8);
}