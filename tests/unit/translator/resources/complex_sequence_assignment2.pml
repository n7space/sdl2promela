inline Sharedmemory_0_transition(id)
{
  int sharedmemory_transition_id;
  sharedmemory_transition_id = id;
  do
  ::if
    ::(sharedmemory_transition_id == -1)->
      break;
    ::(sharedmemory_transition_id == 0)->
      sharedmemory_transition_id = -1;
      global_state.sharedmemory.state = Sharedmemory_States_idle;
      goto sharedmemory_continuous_signals;
    ::(sharedmemory_transition_id == 1)->
      T_UInt8_assign_value(global_state.sharedmemory.membuffer.data[global_state.sharedmemory.writeaccess.write_address], global_state.sharedmemory.writeaccess.write_value);
      sharedmemory_transition_id = -1;
      global_state.sharedmemory.state = Sharedmemory_States_idle;
      goto sharedmemory_continuous_signals;
    ::(sharedmemory_transition_id == 2)->
      T_UInt8_assign_value(global_state.sharedmemory.membuffer.data[global_state.sharedmemory.writeaccess.write_address], global_state.sharedmemory.writeaccess.write_value);
      sharedmemory_transition_id = -1;
      global_state.sharedmemory.state = Sharedmemory_States_idle;
      goto sharedmemory_continuous_signals;
    fi;
    sharedmemory_continuous_signals:
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
