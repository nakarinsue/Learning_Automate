*** Settings ***
Resource    ${CURDIR}/../resources/import.resource
test setup    Open web browser    ${data_open_amazon['url']}    ${data_open_amazon['browser']}
test teardown    Close all system browsers

*** Test Cases ***
Search speaker on amazon and show list products
    [Documentation]    ทำการค้นหาสินค้าบนเว็บไซต์ Amazon โดยใช้คำว่า "speaker" และแสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหา
    [Tags]    amazon_search    assign_2   all    workshop
    amazon_home_features.Input text and show list products    ${data_open_amazon['search_text']}