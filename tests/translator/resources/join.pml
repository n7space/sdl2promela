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
      goto jump;
      ;
      transition_id = -1;
    fi;
    goto next_transition;
    ;
    label jump: ;
    Complexsdl_0_RI_0_response(global_state.complexsdl.tmp);
    global_state.complexsdl.state = Complexsdl_States_wait;
    transition_id = -1;
    goto next_transition;
    ;
    label next_transition: ;
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