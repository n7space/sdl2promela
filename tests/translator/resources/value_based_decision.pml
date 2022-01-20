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
    if
    ::(global_state.complexsdl.tmp > 0)->
      global_state.complexsdl.state = Complexsdl_States_wait;
    ::(global_state.complexsdl.tmp == 0)->
      global_state.complexsdl.state = Complexsdl_States_wait;
    fi;
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
