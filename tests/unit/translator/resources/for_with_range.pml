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
      ;
      global_state.taskwithloop.state = Taskwithloop_States_wait;
      transition_id = -1;
    fi;
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
