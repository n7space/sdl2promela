#include "dataview.pml"
#include "controller.pml"
#include "env_inlines.pml"
typedef system_state {
    Controller_Context controller;
}

int inited;
chan controller_tc_channel = [1] of {int};
chan gui_tm_channel = [1] of {int};
system_state global_state;
chan controller_lock = [1] of {int};
inline Gui_0_RI_0_tc()
{
    int dummy;
    controller_tc_channel!dummy;
}
inline Controller_0_RI_0_tm()
{
    int dummy;
    gui_tm_channel!dummy;
}
active proctype controller_tc() priority 1
{
    inited;
    int token;
    do
    ::  atomic {
        controller_tc_channel?_;
        controller_lock?token;
        Controller_0_PI_0_tc();
        controller_lock!token;
    }
    od;
}
active proctype gui_tm() priority 1
{
    inited;
    do
    ::  atomic {
        gui_tm_channel?_;
    }
    od;
}
active proctype gui_tc()
{
    inited;
    do
    ::  atomic {
        Gui_0_RI_0_tc();
    }
    od;
}
init
{
    atomic {
        int init_token = 1;
        Controller_0_init();
        controller_lock!init_token;
        inited = 1;
    }
}

#include "scl.pml"