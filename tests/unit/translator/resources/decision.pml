inline Complexsdl_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_wait;
      goto continuous_signals;
    ::(transition_id == 1)->
      if
      ::(global_state.complexsdl.tmp == 0)->
        MyInteger_assign_value(global_state.complexsdl.result, 1);
        transition_id = -1;
        global_state.complexsdl.state = Complexsdl_States_wait;
        goto continuous_signals;
      ::((global_state.complexsdl.tmp == 1) || (global_state.complexsdl.tmp == 2))->
        MyInteger_assign_value(global_state.complexsdl.result, 2);
        transition_id = -1;
        global_state.complexsdl.state = Complexsdl_States_wait;
        goto continuous_signals;
      ::((global_state.complexsdl.tmp >= 10) && (global_state.complexsdl.tmp <= 15))->
        MyInteger_assign_value(global_state.complexsdl.result, 3);
        transition_id = -1;
        global_state.complexsdl.state = Complexsdl_States_wait;
        goto continuous_signals;
      ::(((global_state.complexsdl.tmp >= 20) && (global_state.complexsdl.tmp <= 30)) || ((global_state.complexsdl.tmp >= 60) && (global_state.complexsdl.tmp <= 70)))->
        MyInteger_assign_value(global_state.complexsdl.result, 4);
        transition_id = -1;
        global_state.complexsdl.state = Complexsdl_States_wait;
        goto continuous_signals;
      ::else->
        MyInteger_assign_value(global_state.complexsdl.result, 5);
        transition_id = -1;
        global_state.complexsdl.state = Complexsdl_States_wait;
        goto continuous_signals;
      fi;
    fi;
    continuous_signals:
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
