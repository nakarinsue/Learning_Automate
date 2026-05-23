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

Get item name results
    [Documentation]    ดึงชื่อสินค้าจากผลการค้นหาบนเว็บไซต์ Ebay
    [Arguments]    ${search_text}
    ${product_names}=    common.Show item list from search results    ${ebay_homepages.txt_product_name}//*[contains(., "${search_text}")]
    RETURN    ${product_names}