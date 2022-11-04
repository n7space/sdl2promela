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
        DataItem_assign_value(global_state.complexassignment.x, global_state.complexassignment.cmd.data.goToOperational.threshold2);
        {
          global_state.complexassignment.cmd.selection = SystemCommand_goToOperational_PRESENT;
          DataItem_assign_value(global_state.complexassignment.cmd.data.goToOperational.threshold1, global_state.complexassignment.x);
          DataItem_assign_value(global_state.complexassignment.cmd.data.goToOperational.threshold2, 1);
        }
      }
      transition_id = -1;
      goto continuous_signals;
    fi;
    continuous_signals: 
  od;
}
inline Complexassignment_0_init()
{
  Complexassignment_0_transition(0);
}
inline Complexassignment_0_PI_0_tc(input_param)
{
  if
  ::(global_state.complexassignment.state == Complexassignment_States_idle)->
    SystemCommand_assign_value(global_state.complexassignment.cmd, input_param);
    Complexassignment_0_transition(1);
  ::else->
    skip;
  fi;
}
