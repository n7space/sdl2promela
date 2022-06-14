inline Actuator_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      global_state.actuator.state = Actuator_States_wait;
      transition_id = -1;
    ::(transition_id == 1)->
      global_state.actuator.state = Actuator_States_wait;
      transition_id = -1;
    ::(transition_id == 2)->
      Actuator_0_RI_0_pong();
      transition_id = 3;
    ::(transition_id == 3)->
      global_state.actuator.state = Actuator_States_nested_0_a;
      transition_id = -1;
    ::(transition_id == 4)->
      Actuator_0_RI_0_pong();
      transition_id = 1;
    ::(transition_id == 5)->
      Actuator_0_RI_0_pong();
      global_state.actuator.state = Actuator_States_nested_0_b;
      transition_id = -1;
    fi;
  od;
}
inline Actuator_0_init()
{
  MyInteger_assign_value(global_state.actuator.param, 3);
  MyInteger_assign_value(global_state.actuator.seq.x, 1);
  MyInteger_assign_value(global_state.actuator.seq.y, 2);
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
    skip;
  fi;
}
