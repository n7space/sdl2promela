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
      LongSequence__long_name_assign_value(global_state.complexsdl.param.long_name, global_state.complexsdl.tmp);
      {
        SequenceWithOptional__mandatory_field_assign_value(global_state.complexsdl.with_optional.mandatory_field, 2);
        global_state.complexsdl.with_optional.exist.optional_field = 0;
      }
      {
        SequenceWithOptional__mandatory_field_assign_value(global_state.complexsdl.with_optional.mandatory_field, 2);
        SequenceWithOptional__optional_field_assign_value(global_state.complexsdl.with_optional.optional_field, 100);
        global_state.complexsdl.with_optional.exist.optional_field = 1;
      }
      complexsdl_transition_id = -1;
      global_state.complexsdl.state = Complexsdl_States_wait;
      goto complexsdl_continuous_signals;
    fi;
    complexsdl_continuous_signals: 
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
    Complexsdl_0_PI_0_impulse_unhandled_input(input_param);
  fi;
}
