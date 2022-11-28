inline Sharedmemory_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      transition_id = -1;
      global_state.sharedmemory.state = Sharedmemory_States_idle;
      goto continuous_signals;
    ::(transition_id == 1)->
      T_UInt8_assign_value(global_state.sharedmemory.membuffer.data[global_state.sharedmemory.writeaccess.write_address], global_state.sharedmemory.writeaccess.write_value);
      transition_id = -1;
      global_state.sharedmemory.state = Sharedmemory_States_idle;
      goto continuous_signals;
    ::(transition_id == 2)->
      T_UInt8_assign_value(global_state.sharedmemory.membuffer.data[global_state.sharedmemory.writeaccess.write_address], global_state.sharedmemory.writeaccess.write_value);
      transition_id = -1;
      global_state.sharedmemory.state = Sharedmemory_States_idle;
      goto continuous_signals;
    fi;
    continuous_signals:
  od;
}
inline Sharedmemory_0_init()
{
  Sharedmemory_0_transition(0);
}
inline Sharedmemory_0_PI_0_MemWriteA(input_param)
{
  if
  ::(global_state.sharedmemory.state == Sharedmemory_States_idle)->
    T_WriteAccess_assign_value(global_state.sharedmemory.writeaccess, input_param);
    Sharedmemory_0_transition(2);
  ::else->
    Sharedmemory_0_PI_0_MemWriteA_unhandled_input(input_param);
  fi;
}
inline Sharedmemory_0_PI_0_MemWriteB(input_param)
{
  if
  ::(global_state.sharedmemory.state == Sharedmemory_States_idle)->
    T_WriteAccess_assign_value(global_state.sharedmemory.writeaccess, input_param);
    Sharedmemory_0_transition(1);
  ::else->
    Sharedmemory_0_PI_0_MemWriteB_unhandled_input(input_param);
  fi;
}
