#define Actuator_Context_state int
#define Actuator_Context_init_done bool
#define Actuator_Context_param int
#define Actuator_Context_tmp int
#define Actuator_Context_auxilary int
#define Actuator_States_wait 0
#define MyInteger int

typedef MyData {
    MyInteger left;
    MyInteger right;
}

#include "actuator.pml"

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_param param;
    Actuator_Context_tmp tmp;
    Actuator_Context_auxilary auxilary;
}

inline MyData_assign_value(dst, src)
{
    dst.left = src.left;
    dst.right = src.right;
}

inline MyInteger_assign_value(dst, src)
{
    dst = src;
}

inline Actuator_0_RI_0_response(p1)
{
    printf("Result: %d\n", p1);
}

inline Actuator_0_PI_0_impulse_unhandled_input(input_param)
{
    skip;
}

typedef system_state {
    Actuator_Context actuator;
}

system_state global_state;

init {
    Actuator_0_init();
    Actuator_0_PI_0_impulse(7);
}