inline Complexsdl_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::(transition_id == -1)->
    break;
  ::(transition_id == 0)->
    global_state.complexsdl.state = Complexsdl_States_wait;
    transition_id = -1;
  ::(transition_id == 1)->
    global_state.complexsdl.x = 0;
    global_state.complexsdl.y = 1;
    label loop_start: ;
    if
    ::((global_state.complexsdl.x < global_state.complexsdl.tmp) == false)->
      skip;
    ::((global_state.complexsdl.x < global_state.complexsdl.tmp) == true)->
      global_state.complexsdl.y = (global_state.complexsdl.y * global_state.complexsdl.x);
      global_state.complexsdl.x = (global_state.complexsdl.x + 1);
      goto loop_start;
      ;
    fi;
    Complexsdl_0_RI_0_response(global_state.complexsdl.y);
    global_state.complexsdl.state = Complexsdl_States_wait;
    transition_id = -1;
  od;
}
inline Complexsdl_0_init()
{
  Complexsdl_0_transition(0);
}
inline Complexsdl_0_PI_0_impulse(tmp)
{
  if
  ::(global_state.complexsdl.state == Complexsdl_States_wait)->
    Complexsdl_0_transition(1);
  ::else->
    break;
  fi;
}
