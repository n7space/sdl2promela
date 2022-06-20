inline Taskwithloop_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      transition_id = -1;
    ::(transition_id == 1)->
      MyInteger_assign_value(global_state.taskwithloop.result_param, 0);
      {
        MyInteger each;
        int i;
        for(i : 0 .. (global_state.taskwithloop.variable_param.length - 1))
        {
          MyInteger_assign_value(each, global_state.taskwithloop.variable_param.data[i]);
          MyInteger_assign_value(global_state.taskwithloop.result_param, (global_state.taskwithloop.result_param + each));
        };
      }
      ;
      Taskwithloop_0_RI_0_result(global_state.taskwithloop.result_param);
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      transition_id = -1;
    ::(transition_id == 2)->
      MyInteger_assign_value(global_state.taskwithloop.result_param, 0);
      {
        MyInteger each;
        int i;
        for(i : 0 .. 9)
        {
          MyInteger_assign_value(each, global_state.taskwithloop.fixed_param.data[i]);
          MyInteger_assign_value(global_state.taskwithloop.result_param, (global_state.taskwithloop.result_param + each));
        };
      }
      ;
      Taskwithloop_0_RI_0_result(global_state.taskwithloop.result_param);
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      transition_id = -1;
    ::(transition_id == 3)->
      MyInteger_assign_value(global_state.taskwithloop.result_param, 0);
      {
        MyInteger each;
        int i;
        for(i : 0 .. 9)
        {
          MyInteger_assign_value(each, global_state.taskwithloop.child_param.data.data[i]);
          MyInteger_assign_value(global_state.taskwithloop.result_param, (global_state.taskwithloop.result_param + each));
        };
      }
      ;
      Taskwithloop_0_RI_0_result(global_state.taskwithloop.result_param);
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      transition_id = -1;
    fi;
  od;
}
inline Taskwithloop_0_init()
{
  Taskwithloop_0_transition(0);
}
inline Taskwithloop_0_PI_0_check_variable(input_param)
{
  if
  ::(global_state.taskwithloop.state == Taskwithloop_States_wait)->
    MyData_assign_value(global_state.taskwithloop.variable_param, input_param);
    Taskwithloop_0_transition(1);
  ::else->
    skip;
  fi;
}
inline Taskwithloop_0_PI_0_check_fixed(input_param)
{
  if
  ::(global_state.taskwithloop.state == Taskwithloop_States_wait)->
    MyArray_assign_value(global_state.taskwithloop.fixed_param, input_param);
    Taskwithloop_0_transition(2);
  ::else->
    skip;
  fi;
}
inline Taskwithloop_0_PI_0_check_child(input_param)
{
  if
  ::(global_state.taskwithloop.state == Taskwithloop_States_wait)->
    MyRecord_assign_value(global_state.taskwithloop.child_param, input_param);
    Taskwithloop_0_transition(3);
  ::else->
    skip;
  fi;
}
