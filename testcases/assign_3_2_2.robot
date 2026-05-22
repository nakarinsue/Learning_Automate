
*** Settings ***
Resource    ${CURDIR}/../resources/import.resource
test setup    Open web browser    ${data_open_ebay['url']}    ${data_open_ebay['browser']}
test teardown    Close all system browsers
*** Test Cases ***
Search speaker on ebay and show list products
    [Documentation]    ทำการค้นหาสินค้าบนเว็บไซต์ Ebay โดยใช้คำว่า "speaker" และแสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหา
    [Tags]    ebay_search    assign_2   all    workshop
    
    ebay_home_features.Input text and click search button    ${data_open_ebay['search_text']}
    ebay_home_features.Get item name from search results    ${data_open_ebay['search_text']}    
    

