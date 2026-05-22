*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource

*** keywords ***

show list products from search results
    [Documentation]    แสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหาบนเว็บไซต์ Amazon
    [Arguments]    ${search_text}
    amazon_home_pages.click popup don't change if visible
    ${product_elements}=    amazon_home_pages.show list products
    amazon_home_pages.search speaker on amazon        ${search_text}
    amazon_home_pages.show list products