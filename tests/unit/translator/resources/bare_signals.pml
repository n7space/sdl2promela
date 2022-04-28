inline bare_signals_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      global_state.bare_signals.state = bare_signals_States_state_1;
      transition_id = -1;
    ::(transition_id == 1)->
      global_state.bare_signals.state = bare_signals_States_state_2;
      transition_id = -1;
    ::(transition_id == 2)->
      global_state.bare_signals.state = bare_signals_States_state_1;
      transition_id = -1;
    fi;
  od;
}
inline bare_signals_0_init()
{
  bare_signals_0_transition(0);
}
inline bare_signals_0_PI_0_signal_1()
{
  if
  ::(global_state.bare_signals.state == bare_signals_States_state_1)->
    bare_signals_0_transition(1);
  ::else->
    skip;
  fi;
}
inline bare_signals_0_PI_0_signal_2()
{
  if
  ::(global_state.bare_signals.state == bare_signals_States_state_2)->
    bare_signals_0_transition(2);
  ::else->
    skip;
  fi;
}
