*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource

*** keywords ***

Show list products from search results
    [Documentation]    แสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหาบนเว็บไซต์ Amazon
    [Arguments]    ${search_text}
    amazon_home_pages.Click popup don't change if visible
    ${product_elements}=    amazon_home_pages.Show list products
    amazon_home_pages.Search speaker on amazon        ${search_text}
    amazon_home_pages.Show list products