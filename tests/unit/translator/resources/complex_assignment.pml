SystemCommand ComplexAssignment_0_cmd;
inline Complexassignment_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      transition_id = -1;
      global_state.complexassignment.state = Complexassignment_States_idle;
      goto continuous_signals;
    ::(transition_id == 1)->
      {
        ComplexAssignment_0_cmd.selection = SystemCommand_goToOperational_PRESENT;
        DataItem_assign_value(ComplexAssignment_0_cmd.data.goToOperational.threshold1, 1);
        DataItem_assign_value(ComplexAssignment_0_cmd.data.goToOperational.threshold2, 1);
      }
      transition_id = -1;
      goto continuous_signals;
    fi;
    continuous_signals: 
  od;
}
inline Complexassignment_0_init()
{
  PID_assign_value(global_state.complexassignment.sender, PID_env);
  Complexassignment_0_transition(0);
}
inline Complexassignment_0_PI_0_tc(input_param)
{
  if
  ::(global_state.complexassignment.state == Complexassignment_States_idle)->
    SystemCommand_assign_value(ComplexAssignment_0_cmd, input_param);
    Complexassignment_0_transition(1);
  ::else->
    skip;
  fi;
}
