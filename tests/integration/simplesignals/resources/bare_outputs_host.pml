#define Bare_outputs_States_state_1 1

typedef Bare_Outputs_Context {
  int state;
}

typedef system_state {
    Bare_Outputs_Context bare_outputs;
}

system_state global_state;

// Include the inlines generated from SDL

#include "bare_outputs.pml"

typedef signal_in_data {
    int dummy;
};

typedef signal_out_data {
    int dummy;
};

int inited;

chan signal_in_channel = [1] of {signal_in_data};
chan signal_out_channel = [1] of {signal_out_data};

inline bare_outputs_0_RI_0_signal_out()
{
    signal_out_data var0;
    signal_out_channel!var0;
}

// This represents the provided interface's thread
active proctype proc_bare_outputs_singnal_in()
{
    inited;
    signal_in_data var1;
    end: do
    ::signal_in_channel?var1 ->
        printf("Received signal in\n")
        Bare_outputs_0_PI_0_signal_in()
    od;
}

// This simulates some external process or environment
active proctype proc_bare_outputs_singnal_out()
{
    inited;
    signal_out_data var2;
    end: do
    ::signal_out_channel?var2 ->
        printf("Received signal out\n")
    od;
}

// This simulates the environment
active proctype proc_environment()
{
    inited;
    signal_in_data var3;
    printf("Sending signal from environment\n")
    signal_in_channel!var3;
}

init {
    printf("Initializing the system\n")
    Bare_outputs_0_init();
    printf("Starting the system\n")
    inited = 1
}
