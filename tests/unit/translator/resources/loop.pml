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
      MyInteger_assign_value(global_state.complexsdl.x, 0);
      MyInteger_assign_value(global_state.complexsdl.y, 1);
      loop_start:
      if
      ::((global_state.complexsdl.x < global_state.complexsdl.tmp) == false)->
        skip;
      ::((global_state.complexsdl.x < global_state.complexsdl.tmp) == true)->
        MyInteger_assign_value(global_state.complexsdl.y, (global_state.complexsdl.y * global_state.complexsdl.x));
        MyInteger_assign_value(global_state.complexsdl.x, (global_state.complexsdl.x + 1));
        goto loop_start;
      fi;
      Complexsdl_0_RI_0_response(global_state.complexsdl.y);
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
