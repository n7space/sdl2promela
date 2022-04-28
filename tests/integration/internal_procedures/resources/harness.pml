#define MyInteger int
#define Host_States int
#define Host_Context_state Host_States
#define Host_Context_init_done bool
#define Host_States_wait 0
#define Host_Context_x MyInteger
#define Host_Context_y MyInteger

typedef Host_Context {
    Host_Context_state state;
    Host_Context_init_done init_done;
    Host_Context_x x;
    Host_Context_y y;
}

inline MyInteger_assign_value(dst, src)
{
    dst = src;
}

typedef system_state {
    Host_Context host;
}

system_state global_state;

#include "host.pml"

MyInteger last_result;

inline Host_0_RI_0_action(x)
{
    last_result = x;
}

active proctype test()
{
    last_result = 0;
    Host_0_init();

    Host_0_PI_0_trigger(5);
    assert(last_result == 6 * 5);
    Host_0_PI_0_trigger(20);
    assert(last_result == 2 * 20);
}
