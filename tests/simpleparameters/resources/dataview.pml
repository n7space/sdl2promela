#define Actuator_States int
#define Actuator_Context_state Actuator_States
#define Actuator_Context_init_done bool
#define Actuator_Context_wparam TestParam
#define Actuator_Context_wresult TestInteger
#define Controller_States int
#define Controller_Context_state Controller_States
#define Controller_Context_init_done bool
#define Controller_Context_pint TestInteger
#define Controller_Context_pparam TestParam
#define TestInteger int
#define TestParam_valueA TestInteger
#define TestParam_valueB TestInteger
#define TestX TestParam
#define T_Int32 int
#define T_UInt32 int
#define T_Int8 int
#define T_UInt8 int
#define T_Boolean bool
#define Actuator_States_wait 0
#define Controller_States_operation 0
#define Controller_States_wait 1

typedef TestParam_exist {
    bool valueB;
}

typedef TestParam {
    TestParam_valueA valueA;
    TestParam_valueB valueB;
    TestParam_exist exist;
}

typedef T_Null_Record {
    bit dummy;
}

typedef Actuator_Context {
    Actuator_Context_state state;
    Actuator_Context_init_done init_done;
    Actuator_Context_wparam wparam;
    Actuator_Context_wresult wresult;
}

typedef Controller_Context {
    Controller_Context_state state;
    Controller_Context_init_done init_done;
    Controller_Context_pint pint;
    Controller_Context_pparam pparam;
}
