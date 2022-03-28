#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_param CustomInteger
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define CustomInteger int
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Controller_States_wait 0
#define Controller_States_init 1
#define Controller_States_error 2
#define Controller_States_success 3
typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_param param;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
}

typedef T_Null_Record {
    bit dummy;
}

