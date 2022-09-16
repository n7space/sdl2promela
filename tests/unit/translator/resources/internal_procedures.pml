inline Host_0_multireturn(multireturn_param_returns, multireturn_param_a)
{
  MyInteger multireturn_r;
  MyInteger multireturn_a;
  MyInteger_assign_value(multireturn_a, multireturn_param_a);
  if
  ::(multireturn_a > 10)->
    MyInteger_assign_value(multireturn_r, (multireturn_a * 2));
    MyInteger_assign_value(multireturn_param_returns, multireturn_r);
    goto Host_0_multireturn_0_end;
  ::(multireturn_a <= 10)->
    MyInteger_assign_value(multireturn_r, (multireturn_a + 1));
    MyInteger_assign_value(multireturn_param_returns, (multireturn_a * multireturn_r));
    goto Host_0_multireturn_0_end;
  fi;
  Host_0_multireturn_0_end:
}
inline Host_0_proc()
{
  MyInteger_assign_value(global_state.host.y, (global_state.host.a + global_state.host.b));
  Host_0_proc_0_end:
}
inline Host_0_procWithArguments(procwitharguments_param_returns, procwitharguments_param_p1, procwitharguments_param_p2, procwitharguments_r)
{
  MyInteger procwitharguments_p1;
  MyInteger_assign_value(procwitharguments_p1, procwitharguments_param_p1);
  MyInteger procwitharguments_p2;
  MyInteger_assign_value(procwitharguments_p2, procwitharguments_param_p2);
  MyInteger_assign_value(procwitharguments_r, (procwitharguments_p1 + procwitharguments_p2));
  MyInteger_assign_value(procwitharguments_param_returns, procwitharguments_r);
  goto Host_0_procWithArguments_0_end;
  Host_0_procWithArguments_0_end:
}
inline Host_0_procWithLocalVariables()
{
  MyInteger procwithlocalvariables_l1;
  MyInteger procwithlocalvariables_l2;
  MyInteger_assign_value(procwithlocalvariables_l1, global_state.host.a);
  MyInteger_assign_value(procwithlocalvariables_l2, global_state.host.b);
  MyInteger_assign_value(global_state.host.y, (procwithlocalvariables_l1 + procwithlocalvariables_l2));
  Host_0_procWithLocalVariables_0_end:
}
inline Host_0_procWithOutput()
{
  Host_0_RI_0_action(global_state.host.y);
  Host_0_procWithOutput_0_end:
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
      transition_id = -1;
      global_state.host.state = Host_States_wait;
      goto continuous_signals;
    ::(transition_id == 1)->
      Host_0_proc();
      Host_0_procWithArguments(global_state.host.r, 1, global_state.host.b, global_state.host.y);
      Host_0_procWithLocalVariables();
      Host_0_procWithOutput();
      Host_0_multireturn(global_state.host.r, global_state.host.a);
      transition_id = -1;
      global_state.host.state = Host_States_wait;
      goto continuous_signals;
    fi;
    continuous_signals:
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
