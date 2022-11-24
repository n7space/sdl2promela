#include "dataview.pml"
#include "flowcontrol.pml"

typedef system_state {
    FlowControl_Context flowcontrol;
}

int inited;
chan environment_result_channel = [2] of {TestInteger};
chan flowcontrol_work_channel = [2] of {TestInteger};
system_state global_state;

inline Flowcontrol_0_RI_0_result(controller_result_p1)
{
    environment_result_channel!controller_result_p1;
}

inline Flowcontrol_0_PI_0_work_unhandled_input(input_param)
{
    skip;
}

active proctype environment_result() priority 2
{
    inited;
    TestInteger var0;
    do
    ::  environment_result_channel?var0;
        printf("Received signal result - %d\n", var0);
    od;
}

active proctype FlowControl_work() priority 4
{
    inited;
    TestInteger var0;
    do
    ::  flowcontrol_work_channel?var0;
        printf("Received signal work - %d\n", var0);
        Flowcontrol_0_PI_0_work(var0);
    od;
}
active proctype environment() priority 1
{
    inited;
    printf("Sending signal from environment\n");
    TestInteger request_data;
    request_data = 5;
    flowcontrol_work_channel!request_data;
}
init
{
    printf("Initializing the system\n");
    Flowcontrol_0_init();
    printf("Starting the system\n");
    inited = 1;
}
