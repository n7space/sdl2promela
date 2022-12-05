inline Bare_outputs_0_transition(id)
{
  int bare_outputs_transition_id;
  bare_outputs_transition_id = id;
  do
  ::if
    ::(bare_outputs_transition_id == -1)->
      break;
    ::(bare_outputs_transition_id == 0)->
      bare_outputs_transition_id = -1;
      global_state.bare_outputs.state = Bare_outputs_States_state_1;
      goto bare_outputs_continuous_signals;
    ::(bare_outputs_transition_id == 1)->
      Bare_outputs_0_RI_0_signal_out();
      bare_outputs_transition_id = -1;
      global_state.bare_outputs.state = Bare_outputs_States_state_1;
      goto bare_outputs_continuous_signals;
    fi;
    bare_outputs_continuous_signals:
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
    Bare_outputs_0_PI_0_signal_in_unhandled_input();
  fi;
}
