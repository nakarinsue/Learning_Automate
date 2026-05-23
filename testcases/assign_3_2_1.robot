*** Settings ***
Resource    ${CURDIR}/../resources/import.resource

*** Test Cases ***
Check current second status
    [documentation]    This test case checks the current second and logs its status.
    [Tags]    second_status    assign_1   all    assignments
    ${second}=    Get current second
    Check second status    ${second}