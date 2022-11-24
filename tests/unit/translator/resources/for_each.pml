inline Taskwithloop_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::if
    ::(transition_id == -1)->
      break;
    ::(transition_id == 0)->
      transition_id = -1;
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      goto continuous_signals;
    ::(transition_id == 1)->
      MyInteger_assign_value(global_state.taskwithloop.result_param, 0);
      {
        MyInteger each;
        int i0;
        for(i0 : 0 .. (global_state.taskwithloop.variable_param.length - 1))
        {
          MyInteger_assign_value(each, global_state.taskwithloop.variable_param.data[i0]);
          MyInteger_assign_value(global_state.taskwithloop.result_param, (global_state.taskwithloop.result_param + each));
        };
      }
      Taskwithloop_0_RI_0_result(global_state.taskwithloop.result_param);
      transition_id = -1;
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      goto continuous_signals;
    ::(transition_id == 2)->
      MyInteger_assign_value(global_state.taskwithloop.result_param, 0);
      {
        MyInteger each;
        int i0;
        for(i0 : 0 .. 9)
        {
          MyInteger_assign_value(each, global_state.taskwithloop.fixed_param.data[i0]);
          MyInteger_assign_value(global_state.taskwithloop.result_param, (global_state.taskwithloop.result_param + each));
        };
      }
      Taskwithloop_0_RI_0_result(global_state.taskwithloop.result_param);
      transition_id = -1;
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      goto continuous_signals;
    ::(transition_id == 3)->
      MyInteger_assign_value(global_state.taskwithloop.result_param, 0);
      {
        MyInteger each;
        int i0;
        for(i0 : 0 .. 9)
        {
          MyInteger_assign_value(each, global_state.taskwithloop.child_param.data.data[i0]);
          MyInteger_assign_value(global_state.taskwithloop.result_param, (global_state.taskwithloop.result_param + each));
        };
      }
      Taskwithloop_0_RI_0_result(global_state.taskwithloop.result_param);
      transition_id = -1;
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      goto continuous_signals;
    ::(transition_id == 4)->
      MyInteger_assign_value(global_state.taskwithloop.result_param, 0);
      {
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[0], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[1], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[2], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[3], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[4], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[5], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[6], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[7], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[8], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[0].data[9], 2);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[0], 3);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[1], 3);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[2], 3);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[3], 3);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[4], 3);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[5], 3);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[6], 3);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[7], 3);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[8], 3);
        MyInteger_assign_value(global_state.taskwithloop.nested_param.data[1].data[9], 3);
      }
      {
        MyArray a;
        int i0;
        for(i0 : 0 .. 1)
        {
          MyArray_assign_value(a, global_state.taskwithloop.nested_param.data[i0]);
          {
            MyInteger b;
            int i1;
            for(i1 : 0 .. 9)
            {
              MyInteger_assign_value(b, a.data[i1]);
              MyInteger_assign_value(global_state.taskwithloop.result_param, (global_state.taskwithloop.result_param + b));
            };
          }
        };
      }
      Taskwithloop_0_RI_0_result(global_state.taskwithloop.result_param);
      transition_id = -1;
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      goto continuous_signals;
    fi;
    continuous_signals:
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
    Taskwithloop_0_PI_0_check_variable_unhandled_input(input_param);
  fi;
}
inline Taskwithloop_0_PI_0_check_fixed(input_param)
{
  if
  ::(global_state.taskwithloop.state == Taskwithloop_States_wait)->
    MyArray_assign_value(global_state.taskwithloop.fixed_param, input_param);
    Taskwithloop_0_transition(2);
  ::else->
    Taskwithloop_0_PI_0_check_fixed_unhandled_input(input_param);
  fi;
}
inline Taskwithloop_0_PI_0_check_child(input_param)
{
  if
  ::(global_state.taskwithloop.state == Taskwithloop_States_wait)->
    MyRecord_assign_value(global_state.taskwithloop.child_param, input_param);
    Taskwithloop_0_transition(3);
  ::else->
    Taskwithloop_0_PI_0_check_child_unhandled_input(input_param);
  fi;
}
inline Taskwithloop_0_PI_0_nested()
{
  if
  ::(global_state.taskwithloop.state == Taskwithloop_States_wait)->
    Taskwithloop_0_transition(4);
  ::else->
    Taskwithloop_0_PI_0_nested_unhandled_input();
  fi;
}
