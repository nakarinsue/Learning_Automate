*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource

*** keywords ***
Input text and show list products
    [Documentation]    แสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหาบนเว็บไซต์ Amazon
    [Arguments]    ${search_text}
    amazon_home_pages.Click popup don't change if visible
    amazon_home_pages.Search on amazon    ${search_text}
    ${product_elements}=    amazon_home_pages.Show list products