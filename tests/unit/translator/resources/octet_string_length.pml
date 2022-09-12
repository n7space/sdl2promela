inline Complexsdl_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_wait;
      goto continuous_signals;
    ::(transition_id == 1)->
      {
        global_state.complexsdl.octfix.data[0] = 0;
        global_state.complexsdl.octfix.data[1] = 0;
      }
      ;
      {
        global_state.complexsdl.octvar.length = 1;
        global_state.complexsdl.octvar.data[0] = 1;
        global_state.complexsdl.octvar.data[1] = 0;
      }
      ;
      MyInteger_assign_value(global_state.complexsdl.tmp, 2);
      MyInteger_assign_value(global_state.complexsdl.tmp, global_state.complexsdl.octvar.length);
      Complexsdl_0_RI_0_response(global_state.complexsdl.tmp);
      transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_wait;
      goto continuous_signals;
    fi;
    continuous_signals:
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
    skip;
  fi;
}
