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
      global_state.complexsdl.state = Complexsdl_States_idle;
      goto continuous_signals;
    ::(transition_id == 1)->
      Complexsdl_0_frametimer_set(1000);
      transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_wait;
      goto continuous_signals;
    ::(transition_id == 2)->
      Complexsdl_0_RI_0_response(global_state.complexsdl.tmp);
      transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_idle;
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
  ::(global_state.complexsdl.state == Complexsdl_States_idle)->
    MyInteger_assign_value(global_state.complexsdl.tmp, input_param);
    Complexsdl_0_transition(1);
  ::else->
    skip;
  fi;
}
inline Complexsdl_0_PI_0_frametimer()
{
  if
  ::(global_state.complexsdl.state == Complexsdl_States_wait)->
    Complexsdl_0_transition(2);
  ::else->
    skip;
  fi;
}
