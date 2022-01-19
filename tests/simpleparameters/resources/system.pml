#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan controller_result_channel = [2] of {TestInteger};
chan controller_error_channel = [1] of {int};
chan actuator_work_channel = [2] of {TestParam};
system_state global_state;
inline Actuator_0_RI_0_result(controller_result_p1)
{
    controller_result_channel!controller_result_p1;
}
inline Actuator_0_RI_0_error()
{
    int dummy;
    controller_error_channel!dummy;
}
inline Controller_0_RI_0_work(actuator_work_p1)
{
    actuator_work_channel!actuator_work_p1;
}
active proctype controller_result() priority 2
{
    inited;
    TestInteger var0;
    do
    ::  controller_result_channel?var0;
        printf("Received signal result\n");
        Controller_0_PI_0_result(var0);
    od;
}
active proctype controller_error() priority 10
{
    inited;
    int var0;
    do
    ::  controller_error_channel?var0;
        Controller_0_PI_0_error();
    od;
}
active proctype actuator_work() priority 4
{
    inited;
    TestParam var0;
    do
    ::  actuator_work_channel?var0;
        printf("Received signal work\n");
        Actuator_0_PI_0_work(var0);
    od;
}
active proctype environment() priority 1
{
    inited;
    printf("Sending signal from environment\n");
    TestParam request_data;
    actuator_work_channel!request_data;
}
init
{
    printf("Initializing the system\n");
    Controller_0_init();
    Actuator_0_init();
    printf("Starting the system\n");
    inited = 1;
}
