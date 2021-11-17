inline test()
{
    do
    ::(state == idle)->
        skip;
    ::(state == running)->
        skip;
    od;
}
