inline Taskwithloop_0_transition(id)
{
  int transition_id;
  transition_id = id;
  do
  ::(transition_id == -1)->
    break;
  ::(transition_id == 0)->
    global_state.taskwithloop.state = Taskwithloop_States_wait;
    transition_id = -1;
  ::(transition_id == 1)->
    global_state.taskwithloop.y = 0;
    {
      global_state.taskwithloop.x = 0;
      do
      ::(global_state.taskwithloop.x < 10)->
        global_state.taskwithloop.y = (global_state.taskwithloop.y + global_state.taskwithloop.x);
        global_state.taskwithloop.y = (global_state.taskwithloop.y * 2);
        global_state.taskwithloop.x = (global_state.taskwithloop.x + 2);
      ::else->
        break;
      od;
    }
    ;
    global_state.taskwithloop.state = Taskwithloop_States_wait;
    transition_id = -1;
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
    break;
  fi;
}
