inline Bare_signals_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      transition_id = -1;
      global_state.bare_signals.state = Bare_signals_States_state_1;
      goto continuous_signals;
    ::(transition_id == 1)->
      transition_id = -1;
      global_state.bare_signals.state = Bare_signals_States_state_2;
      goto continuous_signals;
    ::(transition_id == 2)->
      transition_id = -1;
      global_state.bare_signals.state = Bare_signals_States_state_1;
      goto continuous_signals;
    fi;
    continuous_signals:
  od;
}
inline Bare_signals_0_init()
{
  Bare_signals_0_transition(0);
}
inline Bare_signals_0_PI_0_signal_1()
{
  if
  ::(global_state.bare_signals.state == Bare_signals_States_state_1)->
    Bare_signals_0_transition(1);
  ::else->
    skip;
  fi;
}
inline Bare_signals_0_PI_0_signal_2()
{
  if
  ::(global_state.bare_signals.state == Bare_signals_States_state_2)->
    Bare_signals_0_transition(2);
  ::else->
    skip;
  fi;
}
