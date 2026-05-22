*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource

*** keywords ***
Click popup don't change if visible
     [Documentation]    เปิดเว็บไซต์ Amazon และจัดการกับ Popup หากมีแสดงขึ้นมา
     wait until page contains element    ${amazon_homepages.btn_popup_dont_change}    timeout=5s
     ${popup_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${amazon_homepages.btn_popup_dont_change}    timeout=5s
     IF    ${popup_visible}
         common.click element    ${amazon_homepages.btn_popup_dont_change}
         Log To Console    \n[INFO] พบแถวแจ้งเตือนเปลี่ยนที่อยู่: ทำการคลิก 'Don't Change' เรียบร้อยแล้ว
     ELSE
         Log To Console    \n[INFO] ไม่พบ Popup เปลี่ยนที่อยู่จัดส่งในครั้งนี้
     END


Search speaker on amazon
    [Documentation]    ทำการค้นหาสินค้าบนเว็บไซต์ Amazon โดยใช้คำว่า "speaker" และแสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหา
    [Arguments]    ${keyword}
    SeleniumLibrary.Input Text      ${amazon_homepages.txt_search_input}    ${keyword}
    SeleniumLibrary.Click Element    ${amazon_homepages.btn_search_submit}

Show list products
    [Documentation]    แสดงชื่อสินค้าทั้งหมดที่พบในผลการค้นหาบนเว็บไซต์ Amazon
    Wait Until Element Is Visible    ${amazon_homepages.txt_product_titles}    timeout=10s
    ${elements}=    Get WebElements    ${amazon_homepages.txt_product_titles}

    Log To Console    \n================ รายชื่อสินค้าทั้งหมด ================"
    ${count}=    Set Variable    1
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        # ตรวจสอบเพื่อไม่พิมพ์บรรทัดว่าง (บางครั้งอาจมี Element ซ่อนอยู่)
        IF    '${text}' != ''
            Log To Console    ${count}. ${text}
            ${count}=    Evaluate    ${count} + 1
        END
    END
    Log To Console    ==================================================
