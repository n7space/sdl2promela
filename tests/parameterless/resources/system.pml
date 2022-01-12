#include "dataview.pml"
#include "controller.pml"
#include "actuator.pml"
typedef system_state {
    Controller_Context controller;
    Actuator_Context actuator;
}

int inited;
chan controller_success_channel = [1] of {int};
chan controller_fail_channel = [1] of {int};
chan actuator_test_channel = [1] of {int};
system_state global_state;
inline Actuator_0_RI_0_success()
{
    int dummy;
    controller_success_channel!dummy;
}
inline Actuator_0_RI_0_fail()
{
    int dummy;
    controller_fail_channel!dummy;
}
inline Controller_0_RI_0_test()
{
    int dummy;
    actuator_test_channel!dummy;
}
active proctype controller_success() priority 1
{
    inited;
    int var0;
    do
    ::  controller_success_channel?var0;
        printf("Received signal success\n");
        Controller_0_PI_0_success();
    od;
}
active proctype controller_fail() priority 1
{
    inited;
    int var0;
    do
    ::  controller_fail_channel?var0;
        Controller_0_PI_0_fail();
    od;
}
active proctype actuator_test() priority 1
{
    inited;
    int var0;
    do
    ::  actuator_test_channel?var0;
        printf("Received signal test\n");
        Actuator_0_PI_0_test();
    od;
}
active proctype environment() priority 1
{
    inited;
    printf("Sending signal from environment\n");
    int dummy;
    actuator_test_channel!dummy;
}
init
  {
    printf("Initializing the system\n");
    Controller_0_init();
    Actuator_0_init();
    printf("Starting the system\n");
    inited = 1;
}
