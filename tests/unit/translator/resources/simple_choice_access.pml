inline Simplechoiceaccess_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      global_state.simplechoiceaccess.state = Simplechoiceaccess_States_wait;
      transition_id = -1;
    ::(transition_id == 1)->
      if
      ::(global_state.simplechoiceaccess.my_data.selection == MyUnion_packet_PRESENT)->
        MyInteger_assign_value(global_state.simplechoiceaccess.my_int, global_state.simplechoiceaccess.my_data.data.packet);
      ::(global_state.simplechoiceaccess.my_data.selection == MyUnion_dummy_PRESENT)->
        MyInteger_assign_value(global_state.simplechoiceaccess.my_int, 0);
      fi;
      Simplechoiceaccess_0_RI_0_pong(global_state.simplechoiceaccess.my_int);
      global_state.simplechoiceaccess.state = Simplechoiceaccess_States_wait;
      transition_id = -1;
    fi;
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
    skip;
  fi;
}
