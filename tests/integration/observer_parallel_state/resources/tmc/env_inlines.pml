inline MyTestInteger_generate_value(MyTestInteger_gv)
{
    int MyTestInteger_tmp;
    if
    ::  atomic {
        select (MyTestInteger_tmp : 0 .. 3);
    }
    fi;
    MyTestInteger_gv = MyTestInteger_tmp;
}
