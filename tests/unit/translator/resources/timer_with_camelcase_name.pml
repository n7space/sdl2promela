inline Complexsdl_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      global_state.complexsdl.state = Complexsdl_States_wait;
      transition_id = -1;
    ::(transition_id == 1)->
      Complexsdl_0_RI_0_response(global_state.complexsdl.tmp);
      global_state.complexsdl.state = Complexsdl_States_wait;
      transition_id = -1;
    ::(transition_id == 2)->
      Complexsdl_0_mytimer_set(1000);
      global_state.complexsdl.state = Complexsdl_States_wait;
      transition_id = -1;
    fi;
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
    Complexsdl_0_transition(2);
  ::else->
    skip;
  fi;
}
inline Complexsdl_0_PI_0_mytimer()
{
  if
  ::(global_state.complexsdl.state == Complexsdl_States_wait)->
    Complexsdl_0_transition(1);
  ::else->
    skip;
  fi;
}
