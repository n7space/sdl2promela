inline MyInteger_generate_value(MyInteger_gv)
{
    int MyInteger_tmp;
    if
    ::  atomic {
        select (MyInteger_tmp : 0 .. 3);
    }
    fi;
    MyInteger_gv = MyInteger_tmp;
}
