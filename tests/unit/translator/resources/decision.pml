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
      if
      ::(global_state.complexsdl.tmp == 0)->
        MyInteger_assign_value(global_state.complexsdl.result, 1);
        global_state.complexsdl.state = Complexsdl_States_wait;
      ::((global_state.complexsdl.tmp == 1) || (global_state.complexsdl.tmp == 2))->
        MyInteger_assign_value(global_state.complexsdl.result, 2);
        global_state.complexsdl.state = Complexsdl_States_wait;
      ::((global_state.complexsdl.tmp >= 10) && (global_state.complexsdl.tmp <= 15))->
        MyInteger_assign_value(global_state.complexsdl.result, 3);
        global_state.complexsdl.state = Complexsdl_States_wait;
      ::(((global_state.complexsdl.tmp >= 20) && (global_state.complexsdl.tmp <= 30)) || ((global_state.complexsdl.tmp >= 60) && (global_state.complexsdl.tmp <= 70)))->
        MyInteger_assign_value(global_state.complexsdl.result, 4);
        global_state.complexsdl.state = Complexsdl_States_wait;
      ::else->
        MyInteger_assign_value(global_state.complexsdl.result, 5);
        global_state.complexsdl.state = Complexsdl_States_wait;
      fi;
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
