inline TestInteger_generate_value(TestInteger_gv)
{
    int TestInteger_tmp;
    if
    ::  atomic {
        select (TestInteger_tmp : 0 .. 10);
    }
    fi;
    TestInteger_gv = TestInteger_tmp;
}
