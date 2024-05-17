inline Actuator_0_transition(id)
{
  int actuator_transition_id;
  actuator_transition_id = id;
  do
  ::if
    ::(actuator_transition_id == -1)->
      break;
    ::(actuator_transition_id == 0)->
      actuator_transition_id = -1;
      global_state.actuator.state = Actuator_States_wait;
      goto actuator_continuous_signals;
    ::(actuator_transition_id == 1)->
      actuator_transition_id = -1;
      global_state.actuator.state = Actuator_States_wait;
      goto actuator_continuous_signals;
    ::(actuator_transition_id == 2)->
      Actuator_0_RI_0_pong();
      actuator_transition_id = 3;
    ::(actuator_transition_id == 3)->
      actuator_transition_id = -1;
      global_state.actuator.state = Actuator_States_nested_0_a;
      goto actuator_continuous_signals;
    ::(actuator_transition_id == 4)->
      Actuator_0_RI_0_pong();
      actuator_transition_id = 1;
    ::(actuator_transition_id == 5)->
      Actuator_0_RI_0_pong();
      actuator_transition_id = -1;
      global_state.actuator.state = Actuator_States_nested_0_b;
      goto actuator_continuous_signals;
    fi;
    actuator_continuous_signals:
  od;
}
inline Actuator_0_init()
{
  MyInteger_assign_value(global_state.actuator.param, 3);
  MySeq__x_assign_value(global_state.actuator.seq.x, 1);
  MySeq__y_assign_value(global_state.actuator.seq.y, 2);
  MyInteger_assign_value(global_state.actuator.nested_0_z, 3);
  Actuator_0_transition(0);
}
inline Actuator_0_PI_0_ping()
{
  if
  ::(global_state.actuator.state == Actuator_States_nested_0_a)->
    Actuator_0_transition(5);
  ::(global_state.actuator.state == Actuator_States_nested_0_b)->
    Actuator_0_transition(4);
  ::(global_state.actuator.state == Actuator_States_wait)->
    Actuator_0_transition(2);
  ::else->
    Actuator_0_PI_0_ping_unhandled_input();
  fi;
}
