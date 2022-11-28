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
      MyInteger_assign_value(global_state.complexsdl.param, ((global_state.complexsdl.tmp == 0) -> 1 : 0));
      Complexsdl_0_RI_0_response(global_state.complexsdl.param);
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
    Complexsdl_0_PI_0_impulse_unhandled_input(input_param);
  fi;
}
