inline test()
{
    do
    :: atomic {
        (state == idle)->
        skip;
    }
    :: atomic {
        (state == running)->
        skip;
    }
    od;
}
