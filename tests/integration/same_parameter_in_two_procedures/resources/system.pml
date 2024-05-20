#include "dataview.pml"
#include "actuator.pml"

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
