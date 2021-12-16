inline bare_outputs_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::(transition_id == -1)->
    break;
  ::(transition_id == 0)->
    bare_outputs_0_state = bare_outputs_States_state_1;
    transition_id = -1;
  ::(transition_id == 1)->
    bare_outputs_0_RI_0_signal_out();
    bare_outputs_0_state = bare_outputs_States_state_1;
    transition_id = -1;
  od;
}
inline bare_outputs_0_init()
{
  bare_outputs_0_transition(0);
}
inline bare_outputs_0_PI_0_signal_in()
{
  if
  ::(bare_outputs_0_state == bare_outputs_States_state_1)->
    bare_outputs_0_transition(1);
  ::else->
    break;
  fi;
}
