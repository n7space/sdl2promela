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
      MyInteger_assign_value(global_state.taskwithloop.y, 0);
      {
        int x;
        x = 0;
        do
        ::(x < 10)->
          MyInteger_assign_value(global_state.taskwithloop.y, (global_state.taskwithloop.y + x));
          MyInteger_assign_value(global_state.taskwithloop.y, (global_state.taskwithloop.y * 2));
          x = (x + 2);
        ::else->
          break;
        od;
      }
      {
        int x;
        x = 1;
        do
        ::(x < 3)->
          MyInteger_assign_value(global_state.taskwithloop.y, (global_state.taskwithloop.y + x));
          x = (x + 1);
        ::else->
          break;
        od;
      }
      {
        int x;
        x = 0;
        do
        ::(x < 4)->
          MyInteger_assign_value(global_state.taskwithloop.y, (global_state.taskwithloop.y + x));
          x = (x + 1);
        ::else->
          break;
        od;
      }
      {
        int x;
        x = 0;
        do
        ::(x < 10)->
          MyInteger_assign_value(global_state.taskwithloop.my_arr.data[x], global_state.taskwithloop.y);
          x = (x + 1);
        ::else->
          break;
        od;
      }
      {
        global_state.taskwithloop.my_data.length = 4;
        MyInteger_assign_value(global_state.taskwithloop.my_data.data[0], 1);
        MyInteger_assign_value(global_state.taskwithloop.my_data.data[1], 2);
        MyInteger_assign_value(global_state.taskwithloop.my_data.data[2], 1);
        MyInteger_assign_value(global_state.taskwithloop.my_data.data[3], 2);
      }
      {
        int x;
        x = 0;
        do
        ::(x < global_state.taskwithloop.my_data.length)->
          MyInteger_assign_value(global_state.taskwithloop.y, (global_state.taskwithloop.y + x));
          x = (x + 1);
        ::else->
          break;
        od;
      }
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
inline Taskwithloop_0_PI_0_trigger()
{
  if
  ::(global_state.taskwithloop.state == Taskwithloop_States_wait)->
    Taskwithloop_0_transition(1);
  ::else->
    skip;
  fi;
}
