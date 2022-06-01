inline Bare_outputs_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      global_state.bare_outputs.state = Bare_outputs_States_state_1;
      transition_id = -1;
    ::(transition_id == 1)->
      bare_outputs_0_RI_0_signal_out();
      global_state.bare_outputs.state = Bare_outputs_States_state_1;
      transition_id = -1;
    fi;
  od;
}
inline Bare_outputs_0_init()
{
  Bare_outputs_0_transition(0);
}
inline Bare_outputs_0_PI_0_signal_in()
{
  if
  ::(global_state.bare_outputs.state == Bare_outputs_States_state_1)->
    Bare_outputs_0_transition(1);
  ::else->
    skip;
  fi;
}
