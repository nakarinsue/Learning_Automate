*** Settings ***
Resource    ${CURDIR}/../import.resource

*** Variables ***

&{amazon_homepages}
...    btn_popup_dont_change=xpath=//*[contains(@class, 'a-button-input')][@data-action-type='DISMISS']
...    txt_search_input=id=twotabsearchtextbox
...    btn_search_submit=id=nav-search-submit-text
...    txt_product_titles=xpath://h2[contains(@class, 'a-size-mini')]//span
