inline Simplechoiceaccess_0_transition(id)
{
  int simplechoiceaccess_transition_id;
  simplechoiceaccess_transition_id = id;
  do
  ::if
    ::(simplechoiceaccess_transition_id == -1)->
      break;
    ::(simplechoiceaccess_transition_id == 0)->
      simplechoiceaccess_transition_id = -1;
      global_state.simplechoiceaccess.state = Simplechoiceaccess_States_wait;
      goto simplechoiceaccess_continuous_signals;
    ::(simplechoiceaccess_transition_id == 1)->
      if
      ::(global_state.simplechoiceaccess.my_data.selection == Simplechoiceaccess_Myunion_Selection_packet_present)->
        MyInteger_assign_value(global_state.simplechoiceaccess.my_int, global_state.simplechoiceaccess.my_data.data.packet);
      ::(global_state.simplechoiceaccess.my_data.selection == Simplechoiceaccess_Myunion_Selection_dummy_present)->
        MyInteger_assign_value(global_state.simplechoiceaccess.my_int, 0);
      fi;
      Simplechoiceaccess_0_RI_0_pong(global_state.simplechoiceaccess.my_int);
      simplechoiceaccess_transition_id = -1;
      global_state.simplechoiceaccess.state = Simplechoiceaccess_States_wait;
      goto simplechoiceaccess_continuous_signals;
    fi;
    simplechoiceaccess_continuous_signals:
  od;
}
inline Simplechoiceaccess_0_init()
{
  Simplechoiceaccess_0_transition(0);
}
inline Simplechoiceaccess_0_PI_0_ping(input_param)
{
  if
  ::(global_state.simplechoiceaccess.state == Simplechoiceaccess_States_wait)->
    MyUnion_assign_value(global_state.simplechoiceaccess.my_data, input_param);
    Simplechoiceaccess_0_transition(1);
  ::else->
    Simplechoiceaccess_0_PI_0_ping_unhandled_input(input_param);
  fi;
}
