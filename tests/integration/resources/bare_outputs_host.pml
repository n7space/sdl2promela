#define bare_outputs_0_state_1 1

int bare_outputs_0_state;

// Include the inlines generated from SDL

#include "bare_outputs.pml"

typedef signal_in_data {
    int dummy;
};

typedef signal_out_data {
    int dummy;
};

chan signal_in_channel = [1] of {signal_in_data};
chan signal_out_channel = [1] of {signal_out_data};

inline bare_outputs_0_RI_0_signal_out()
{
    signal_out_data data;
    signal_out_channel!data;
}

// This represents the provided interface's thread
proctype proc_bare_outputs_singnal_in()
{
    signal_in_data data;
    do
    ::signal_in_channel?data ->
        printf("Received signal in")
        bare_outputs_0_PI_0_signal_in()
    od;
}

// This simulates some external process or environment
proctype proc_bare_outputs_singnal_out()
{
    signal_out_data data;
    do
    ::signal_out_channel?data ->
        print("Received signal out\n")
    od;
}

// This simulates the environment
proctype proc_environment()
{
    signal_in_data data;
    // Send the signal once
    signal_in_channel!data;
}

init {
    // Initialize state machines
    bare_outputs_0_init();
    // Start threads for provided interfaces
    run proc_bare_outputs_singnal_in();
    run proc_bare_outputs_singnal_out();
    // Start environment
    run proc_environment();
}
