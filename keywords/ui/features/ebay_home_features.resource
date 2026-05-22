*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource

*** keywords ***

Input text and click search button
    [Documentation]    ทำการกรอกคำค้นหาลงในช่องค้นหาของเว็บไซต์ Ebay และคลิกปุ่มค้นหา
    [Arguments]    ${search_text}
    ebay_home_pages.Input text to search box    ${search_text}
    ebay_home_pages.Click search button

Get search results header
    [Documentation]    ดึงข้อความหัวข้อผลการค้นหาบนเว็บไซต์ Ebay
    [Arguments]    ${search_text}
    ${result_header}=    ebay_home_pages.Get tab results header
    common.Show contains text of element    ${search_text}    ${result_header}

Get item name from search results
    [Documentation]    ดึงชื่อสินค้าจากผลการค้นหาบนเว็บไซต์ Ebay
    [Arguments]    ${search_text}
    Wait Until Element Is Visible    xpath=${ebay_homepages.txt_product_name}    timeout=15s
    ${count}=    Get Element Count    xpath=${ebay_homepages.txt_product_name}
    ${product_names}=    BuiltIn.Create List
    FOR    ${i}    IN RANGE    5    ${count}    7
        ${element}=    SeleniumLibrary.Get Webelement    xpath=(${ebay_homepages.txt_product_name})[${i} + 1]
        ${product_name}=    SeleniumLibrary.Get Text    ${element}
        IF    $product_name
            Append To List    ${product_names}    ${product_name}
            Log to console    \nProduct ${i + 1}: ${product_name}
            log    Product ${i + 1}: ${product_name}
        END
    END
    RETURN    ${product_names}