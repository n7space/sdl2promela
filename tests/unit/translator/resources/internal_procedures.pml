inline Host_0_multireturn(param_returns, param_a)
{
  MyInteger r;
  MyInteger a;
  MyInteger_assign_value(a, param_a);
  if
  ::(a > 10)->
    MyInteger_assign_value(r, (a * 2));
    MyInteger_assign_value(param_returns, r);
    goto Host_0_multireturn_0_end;
    ;
  ::(a <= 10)->
    MyInteger_assign_value(r, (a + 1));
    MyInteger_assign_value(param_returns, (a * r));
    goto Host_0_multireturn_0_end;
    ;
  fi;
  Host_0_multireturn_0_end: ;
}
inline Host_0_proc()
{
  MyInteger_assign_value(global_state.host.y, (global_state.host.a + global_state.host.b));
  Host_0_proc_0_end: ;
}
inline Host_0_procWithArguments(param_returns, param_p1, param_p2, r)
{
  MyInteger p1;
  MyInteger_assign_value(p1, param_p1);
  MyInteger p2;
  MyInteger_assign_value(p2, param_p2);
  MyInteger_assign_value(r, (p1 + p2));
  MyInteger_assign_value(param_returns, r);
  goto Host_0_procWithArguments_0_end;
  ;
  Host_0_procWithArguments_0_end: ;
}
inline Host_0_procWithLocalVariables()
{
  MyInteger l1;
  MyInteger l2;
  MyInteger_assign_value(l1, global_state.host.a);
  MyInteger_assign_value(l2, global_state.host.b);
  MyInteger_assign_value(global_state.host.y, (l1 + l2));
  Host_0_procWithLocalVariables_0_end: ;
}
inline Host_0_procWithOutput()
{
  Host_0_RI_0_action(global_state.host.y);
  Host_0_procWithOutput_0_end: ;
}
inline Host_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      global_state.host.state = Host_States_wait;
      transition_id = -1;
    ::(transition_id == 1)->
      Host_0_proc();
      Host_0_procWithArguments(global_state.host.r, 1, global_state.host.b, global_state.host.y);
      Host_0_procWithLocalVariables();
      Host_0_procWithOutput();
      Host_0_multireturn(global_state.host.r, global_state.host.a);
      global_state.host.state = Host_States_wait;
      transition_id = -1;
    fi;
  od;
}
inline Host_0_init()
{
  Host_0_transition(0);
}
inline Host_0_PI_0_trigger(input_param)
{
  if
  ::(global_state.host.state == Host_States_wait)->
	MyInteger_assign_value(global_state.host.x, input_param);
    Host_0_transition(1);
  ::else->
    skip;
  fi;
}
