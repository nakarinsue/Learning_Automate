*** Settings ***
Library    BuiltIn

*** keywords ***

get current second
    [documentation]    This keyword retrieves the current second from the system time and returns it as an integer.
    ${second}=    Evaluate    datetime.datetime.now().second    modules=datetime
    ${second}=    BuiltIn.Convert To Integer    ${second}
    BuiltIn.Log To Console    \nCurrent second is: ${second}
    [Return]    ${second}

check second status
    [documentation]    This keyword checks the status of the given second and logs the appropriate message.
    [Arguments]    ${second}
    IF    ${second} == 0
        BuiltIn.Log To Console    Jackpot
    ELSE IF    ${second} >= 1 and ${second} <= 30
        BuiltIn.Log To Console    Low
    ELSE IF    ${second} >= 31 and ${second} <= 59
        BuiltIn.Log To Console    High
    ELSE
        BuiltIn.Log To Console    Invalid second value: ${second}
    END

*** Test Cases ***
Check current second status
    [documentation]    This test case checks the current second and logs its status.
    ${second}=    get current second
    check second status    ${second}
