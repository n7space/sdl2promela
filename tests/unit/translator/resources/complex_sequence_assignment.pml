inline Complexsdl_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      global_state.complexsdl.state = Complexsdl_States_wait;
      transition_id = -1;
    ::(transition_id == 1)->
      {
        SmallInteger_assign_value(global_state.complexsdl.value4.value, 2);
        global_state.complexsdl.value4.version.selection = MyChoice_small_PRESENT;
        SmallInteger_assign_value(global_state.complexsdl.value4.version.data.small, 2);
      }
      ;
      {
        SmallInteger_assign_value(global_state.complexsdl.value1.data[0].value, 1);
        global_state.complexsdl.value1.data[0].version.selection = MyChoice_big_PRESENT;
        BigInteger_assign_value(global_state.complexsdl.value1.data[0].version.data.big, 4);
      }
      ;
      Complexsdl_0_RI_0_response(global_state.complexsdl.tmp);
      global_state.complexsdl.state = Complexsdl_States_wait;
      transition_id = -1;
    fi;
  od;
}
inline Complexsdl_0_init()
{
  Complexsdl_0_transition(0);
}
inline Complexsdl_0_PI_0_impulse(input_param)
{
  if
  ::(global_state.complexsdl.state == Complexsdl_States_wait)->
    MyInteger_assign_value(global_state.complexsdl.tmp, input_param);
    Complexsdl_0_transition(1);
  ::else->
    skip;
  fi;
}
