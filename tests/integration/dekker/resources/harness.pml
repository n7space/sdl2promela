#include "dataview.pml"
#include "lock.pml"
typedef system_state {
    Lock_Context lock;
}

system_state global_state;


// NOPs, just for compilation
inline Lock_check_queue(){
    skip;
}
inline Lock_0_RI_0_MemWrite(SharedMemory_MemWriteA_p1){
    skip;
}
inline Lock_0_RI_0_WriteAck(){
    skip;
}
inline Lock_0_RI_0_WantToEnter(LockB_RemoteWantsToEnter_p1) {
    skip;
}
inline Lock_0_RI_0_SetTurn(LockB_RemoteSetsTurn_p1) {
    skip;
}

init
{
    Lock_0_init();
    T_WriteRequest signal_parameter_request;
    T_Boolean signal_parameter_bool;
    T_ProcID signal_parameter_proc;
    Lock_0_PI_0_WriteRequest(signal_parameter_request);
    Lock_0_PI_0_RemoteWantsToEnter(signal_parameter_bool);
    Lock_0_PI_0_RemoteSetsTurn(signal_parameter_proc);
}
