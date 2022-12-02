inline Bare_signals_0_transition(id)
{
  int bare_signals_transition_id;
  bare_signals_transition_id = id;
  do
  ::if
    ::(bare_signals_transition_id == -1)->
      break;
    ::(bare_signals_transition_id == 0)->
      bare_signals_transition_id = -1;
      global_state.bare_signals.state = Bare_signals_States_state_1;
      goto bare_signals_continuous_signals;
    ::(bare_signals_transition_id == 1)->
      bare_signals_transition_id = -1;
      global_state.bare_signals.state = Bare_signals_States_state_2;
      goto bare_signals_continuous_signals;
    ::(bare_signals_transition_id == 2)->
      bare_signals_transition_id = -1;
      global_state.bare_signals.state = Bare_signals_States_state_1;
      goto bare_signals_continuous_signals;
    fi;
    bare_signals_continuous_signals:
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
    Bare_signals_0_PI_0_signal_1_unhandled_input();
  fi;
}
inline Bare_signals_0_PI_0_signal_2()
{
  if
  ::(global_state.bare_signals.state == Bare_signals_States_state_2)->
    Bare_signals_0_transition(2);
  ::else->
    Bare_signals_0_PI_0_signal_2_unhandled_input();
  fi;
}
