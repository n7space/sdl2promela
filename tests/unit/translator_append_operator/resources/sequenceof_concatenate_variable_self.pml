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
        global_state.complexsdl.source_data.length = 3;
        MyInteger_assign_value(global_state.complexsdl.source_data.data[0], 3);
        MyInteger_assign_value(global_state.complexsdl.source_data.data[1], 4);
        MyInteger_assign_value(global_state.complexsdl.source_data.data[2], 5);
      }
      {
        int i0;
        MyIntegerSequence _tmp_0;
        _tmp_0.length = 0;
        for(i0 : 0 .. global_state.complexsdl.source_data.length)
        {
          MyInteger_assign_value(_tmp_0.data[_tmp_0.length], global_state.complexsdl.source_data.data[i0]);
          _tmp_0.length = (_tmp_0.length + 1);
        };
        for(i0 : 0 .. global_state.complexsdl.data.length)
        {
          MyInteger_assign_value(_tmp_0.data[_tmp_0.length], global_state.complexsdl.data.data[i0]);
          _tmp_0.length = (_tmp_0.length + 1);
        };
        MyIntegerSequence_assign_value(global_state.complexsdl.data, _tmp_0);
      }
      MyInteger_assign_value(global_state.complexsdl.param, global_state.complexsdl.data.data[0]);
      Complexsdl_0_RI_0_response(global_state.complexsdl.param);
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
