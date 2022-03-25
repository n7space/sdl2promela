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
      if
      ::((global_state.complexsdl.tmp > 0) == true)->
        global_state.complexsdl.state = Complexsdl_States_wait;
      ::((global_state.complexsdl.tmp > 0) == false)->
        global_state.complexsdl.state = Complexsdl_States_wait;
      fi;
      transition_id = -1;
    fi;
  od;
}
inline Complexsdl_0_init()
{
  Complexsdl_0_transition(0);
}
inline Complexsdl_0_PI_0_impulse(tmp_param_in)
{
  MyInteger_assign_value(global_state.complexsdl.tmp, tmp_param_in);
  if
  ::(global_state.complexsdl.state == Complexsdl_States_wait)->
    Complexsdl_0_transition(1);
  ::else->
    break;
  fi;
}
