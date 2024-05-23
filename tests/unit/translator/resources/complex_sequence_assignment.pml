inline Complexsdl_0_transition(id)
{
  int complexsdl_transition_id;
  complexsdl_transition_id = id;
  do
  ::if
    ::(complexsdl_transition_id == -1)->
      break;
    ::(complexsdl_transition_id == 0)->
      complexsdl_transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_wait;
      goto complexsdl_continuous_signals;
    ::(complexsdl_transition_id == 1)->
      {
        MySequence__value_assign_value(global_state.complexsdl.value4.value, 2);
        global_state.complexsdl.value4.version.selection = MyChoice_small_PRESENT;
        MyChoice__small_assign_value(global_state.complexsdl.value4.version.data.small, 2);
      }
      {
        MySequence__value_assign_value(global_state.complexsdl.value1.data[0].value, 1);
        global_state.complexsdl.value1.data[0].version.selection = MyChoice_big_PRESENT;
        MyChoice__big_assign_value(global_state.complexsdl.value1.data[0].version.data.big, 4);
      }
      Complexsdl_0_RI_0_response(global_state.complexsdl.tmp);
      complexsdl_transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_wait;
      goto complexsdl_continuous_signals;
    fi;
    complexsdl_continuous_signals:
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
    Complexsdl_0_PI_0_impulse_unhandled_input(input_param);
  fi;
}
