# cmd_record

A sample command-line application.


## Quick test

### out record test

    bin/cmd_record.dart example/echo.dart --stdout out
    
should give in `cmd_record.log` something like:

    00:00.165 > out

### err record test

    bin/cmd_record.dart example/echo.dart --stderr err
    
should give in `cmd_record.log` something like:

    00:00.165 > out
    
    
