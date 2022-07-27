inline MyTestInteger_generate_value(MyTestInteger_gv)
{
    int MyTestInteger_tmp;
    if
    ::  atomic {
        select (MyTestInteger_tmp : 0 .. 8);
    }
    fi;
    MyTestInteger_gv = MyTestInteger_tmp;
}
