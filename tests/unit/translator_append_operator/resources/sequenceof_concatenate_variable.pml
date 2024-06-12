inline Complexsdl_0_transition(id)
{
  int complexsdl_transition_id;
  complexsdl_transition_id = id;
  do
  ::if
    ::(complexsdl_transition_id == -1)->
      break;
    ::(complexsdl_transition_id == 0)->
      complexsdl_transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_wait;
      goto complexsdl_continuous_signals;
    ::(complexsdl_transition_id == 1)->
      {
        global_state.complexsdl.initial_data.length = 3;
        MyInteger_assign_value(global_state.complexsdl.initial_data.data[0], 1);
        MyInteger_assign_value(global_state.complexsdl.initial_data.data[1], 2);
        MyInteger_assign_value(global_state.complexsdl.initial_data.data[2], 3);
      }
      {
        global_state.complexsdl.source_data.length = 3;
        MyInteger_assign_value(global_state.complexsdl.source_data.data[0], 3);
        MyInteger_assign_value(global_state.complexsdl.source_data.data[1], 4);
        MyInteger_assign_value(global_state.complexsdl.source_data.data[2], 5);
      }
      {
        int i0;
        global_state.complexsdl.data.length = 0;
        for(i0 : 0 .. global_state.complexsdl.initial_data.length)
        {
          MyInteger_assign_value(global_state.complexsdl.data.data[global_state.complexsdl.data.length], global_state.complexsdl.initial_data.data[i0]);
          global_state.complexsdl.data.length = (global_state.complexsdl.data.length + 1);
        };
        for(i0 : 0 .. global_state.complexsdl.source_data.length)
        {
          MyInteger_assign_value(global_state.complexsdl.data.data[global_state.complexsdl.data.length], global_state.complexsdl.source_data.data[i0]);
          global_state.complexsdl.data.length = (global_state.complexsdl.data.length + 1);
        };
      }
      MyInteger_assign_value(global_state.complexsdl.param, global_state.complexsdl.data.data[0]);
      Complexsdl_0_RI_0_response(global_state.complexsdl.param);
      complexsdl_transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_wait;
      goto complexsdl_continuous_signals;
    fi;
    complexsdl_continuous_signals: 
  od;
}
inline Complexsdl_0_init()
{
  Complexsdl_0_transition(0);
}
inline Complexsdl_0_PI_0_impulse(input_param)
{
  if
  ::(global_state.complexsdl.state == Complexsdl_States_wait)->
    MyInteger_assign_value(global_state.complexsdl.tmp, input_param);
    Complexsdl_0_transition(1);
  ::else->
    Complexsdl_0_PI_0_impulse_unhandled_input(input_param);
  fi;
}
