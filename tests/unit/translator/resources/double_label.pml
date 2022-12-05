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
      if
      ::((global_state.complexsdl.tmp == 1) == true)->
        goto right_action;
      ::((global_state.complexsdl.tmp == 1) == false)->
        goto leftaction;
      fi;
    ::(complexsdl_transition_id == 2)->
      if
      ::((global_state.complexsdl.tmp == 0) == true)->
        goto leftaction;
      ::((global_state.complexsdl.tmp == 0) == false)->
        goto right_action;
      fi;
    fi;
    complexsdl_continuous_signals:
    goto next_transition;
    right_action:
    Complexsdl_0_RI_0_response(1);
    complexsdl_transition_id = -1;
    global_state.complexsdl.state = Complexsdl_States_wait;
    goto complexsdl_continuous_signals;
    goto next_transition;
    leftaction:
    Complexsdl_0_RI_0_response(0);
    complexsdl_transition_id = -1;
    global_state.complexsdl.state = Complexsdl_States_one;
    goto complexsdl_continuous_signals;
    goto next_transition;
    next_transition:
  od;
}
inline Complexsdl_0_init()
{
  Complexsdl_0_transition(0);
}
inline Complexsdl_0_PI_0_impulse(input_param)
{
  if
  ::(global_state.complexsdl.state == Complexsdl_States_one)->
    MyInteger_assign_value(global_state.complexsdl.tmp, input_param);
    Complexsdl_0_transition(1);
  ::(global_state.complexsdl.state == Complexsdl_States_wait)->
    MyInteger_assign_value(global_state.complexsdl.tmp, input_param);
    Complexsdl_0_transition(2);
  ::else->
    Complexsdl_0_PI_0_impulse_unhandled_input(input_param);
  fi;
}
