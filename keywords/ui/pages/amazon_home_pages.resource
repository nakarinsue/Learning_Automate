*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource

*** keywords ***
Click popup don't change if visible
    [Documentation]    เปิดเว็บไซต์ Amazon และจัดการกับ Popup หากมีแสดงขึ้นมา
    ${popup_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${amazon_homepages.btn_popup_dont_change}    timeout=10s
    IF    ${popup_visible}
        common.click element    ${amazon_homepages.btn_popup_dont_change}
        Log To Console    \n[INFO] พบแถวแจ้งเตือนเปลี่ยนที่อยู่: ทำการคลิก 'Don't Change' เรียบร้อยแล้ว
    ELSE
        Log To Console    \n[INFO] ไม่พบ Popup เปลี่ยนที่อยู่จัดส่งในครั้งนี้
    END

Search on amazon
    [Documentation]    ทำการค้นหาสินค้าบนเว็บไซต์ Amazon โดยใช้คำว่า "speaker" และแสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหา
    [Arguments]    ${keyword}
    common.input text    ${amazon_homepages.txt_search_input}    ${keyword}
    common.click element    ${amazon_homepages.btn_search_submit}

Show list products
    [Documentation]    แสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหาบนเว็บไซต์ Amazon
    ${product_names}=    common.Show item list from search results    ${amazon_homepages.txt_product_titles}    //h2//span    timeout=10s
    RETURN    ${product_names}