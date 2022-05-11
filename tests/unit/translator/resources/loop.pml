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
      MyInteger_assign_value(global_state.complexsdl.x, 0);
      MyInteger_assign_value(global_state.complexsdl.y, 1);
      loop_start: ;
      if
      ::((global_state.complexsdl.x < global_state.complexsdl.tmp) == false)->
        skip;
      ::((global_state.complexsdl.x < global_state.complexsdl.tmp) == true)->
        MyInteger_assign_value(global_state.complexsdl.y, (global_state.complexsdl.y * global_state.complexsdl.x));
        MyInteger_assign_value(global_state.complexsdl.x, (global_state.complexsdl.x + 1));
        goto loop_start;
        ;
      fi;
      Complexsdl_0_RI_0_response(global_state.complexsdl.y);
      global_state.complexsdl.state = Complexsdl_States_wait;
      transition_id = -1;
    fi;
  od;
}
inline Complexsdl_0_init()
{
  Complexsdl_0_transition(0);
}
inline Complexsdl_0_PI_0_impulse(p1_param_in)
{
  if
  ::(global_state.complexsdl.state == Complexsdl_States_wait)->
    MyInteger_assign_value(global_state.complexsdl.tmp, p1_param_in);
    Complexsdl_0_transition(1);
  ::else->
    skip;
  fi;
}
