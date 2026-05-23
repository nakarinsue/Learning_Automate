*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource

*** keywords ***
Get current second
    [documentation]    This keyword retrieves the current second from the system time and returns it as an integer.
    ${second}=    BuiltIn.Evaluate    datetime.datetime.now().second    modules=datetime
    ${second}=    BuiltIn.Convert To Integer    ${second}
    BuiltIn.Log To Console    \nCurrent second is: ${second}
    RETURN    ${second}

Check second status
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

Open web browser
    [Arguments]    ${url}    ${browser_name}=chrome    ${mode}='unheadless'
    ${chrome_options}=    BuiltIn.Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_argument}=    BuiltIn.Set Variable    --disable-blink-features=AutomationControlled
    BuiltIn.Call Method    ${chrome_options}    add_argument    --${mode}
    BuiltIn.Call Method    ${chrome_options}    add_argument    ${chrome_argument}
    BuiltIn.Call Method    ${chrome_options}    add_argument    --start-maximized
    BuiltIn.Call Method    ${chrome_options}    add_argument    --disable-extensions   
    BuiltIn.Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage    
    BuiltIn.Call Method    ${chrome_options}    set_capability    pageLoadStrategy    eager
    SeleniumLibrary.Open Browser    ${url}    ${browser_name}    options=${chrome_options}

Close all system browsers
    SeleniumLibrary.Close All Browsers

Wait for element
    [Documentation]    รอจนกว่า Element จะแสดงบนหน้าจอ (Visible) และพร้อมให้คลิก (Enabled)
    [Arguments]    ${locator}    ${timeout}=10s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}
    SeleniumLibrary.Wait Until Element Is Enabled    ${locator}    ${timeout}

Click element
    [Documentation]    รอจนกว่าปุ่มหรือ Element จะพร้อม แล้วจึงทำการคลิก
    [Arguments]    ${locator}    ${timeout}=10s
    common.Wait for element   ${locator}    ${timeout}
    SeleniumLibrary.Click Element    ${locator}

Input text
    [Documentation]    รอจนกว่าช่องกรอกข้อมูลจะพร้อม ทำการลบข้อมูลเดิม (Clear) และกรอกข้อมูลใหม่
    [Arguments]    ${locator}    ${text_value}    ${timeout}=10s    ${clear}=True
    common.Wait for element   ${locator}    ${timeout}
    SeleniumLibrary.Input Text    ${locator}    ${text_value}    ${clear}

Get count of element
    [Documentation]    ทำการดึงจำนวนองค์ประกอบบนเว็บไซต์
    [Arguments]    ${locator}    ${timeout}=10s
    common.Wait for element   ${locator}    ${timeout}
    ${count}=    SeleniumLibrary.Get Element Count    ${locator}
    RETURN    ${count}

Get text of element
    [Documentation]    ดึงข้อความจาก Element บนเว็บไซต์
    [Arguments]    ${locator}    ${timeout}=10s
    common.Wait for element   ${locator}    ${timeout}    
    ${text}=    SeleniumLibrary.Get Text    ${locator}
    RETURN    ${text}

Get text contains of element
    [Documentation]    ดึงข้อความจาก Element บนเว็บไซต์ที่มีข้อความบางส่วนตรงกับที่กำหนด
    [Arguments]    ${locator}    ${expected_text}    ${timeout}=10s
    common.Wait for element   ${locator}    ${timeout}
    ${text}=    SeleniumLibrary.Get Text    ${locator}
    Should Contain    ${text}    ${expected_text}
    RETURN    ${text}  

Show item list from search results
    [Documentation]    แสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหาบนเว็บไซต์
    [Arguments]    ${locator}    ${digit}=${EMPTY}    ${timeout}=10s
    ${product_names}=    BuiltIn.Create List
    ${product_count}=    common.Get count of element    ${locator}    ${timeout}
    FOR    ${index}    IN RANGE    1    ${product_count} + 1
        ${product_name}=    common.Get text of element    xpath=(${locator})[${index}]${digit}    ${timeout}
        IF    $product_name
            Append To List    ${product_names}    ${product_name}
            Log to console    \nProduct ${index}: ${product_name}
        END
    END
    RETURN    ${product_names}