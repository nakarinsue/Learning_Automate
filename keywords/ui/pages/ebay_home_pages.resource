*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource

*** keywords ***
Input text to search box
    [Documentation]    ทำการกรอกคำค้นหาลงในช่องค้นหาของเว็บไซต์ Ebay
    [Arguments]    ${search_text}
    common.Input text    ${ebay_homepages.txt_search_box}    ${search_text}

Click search box
    [Documentation]    ทำการคลิกช่องค้นหาบนเว็บไซต์ Ebay
    common.Click element    ${ebay_homepages.txt_search_box}

Click search button
    [Documentation]    ทำการคลิกปุ่มค้นหาบนเว็บไซต์ Ebay
    common.Click element    ${ebay_homepages.btn_search}

Get tab results header
    [Documentation]    ดึงข้อความหัวข้อผลการค้นหาบนเว็บไซต์ Ebay
    ${result_header}=    common.Get text contains of element    ${ebay_homepages.txt_result_header}
    RETURN    ${result_header}

Get item search results
    [Documentation]    ดึงชื่อสินค้าจากผลการค้นหาบนเว็บไซต์ Ebay
    [Arguments]    ${search_text}=Speaker
    ${product_elements}=    common.Get text of list element    ${ebay_homepages.txt_product_name}//*[contains(., "${search_text}")]
    RETURN    ${product_elements}