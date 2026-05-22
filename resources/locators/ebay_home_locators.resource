*** Settings ***
Resource    ${CURDIR}/../import.resource

*** Variables ***

&{ebay_homepages}
...    txt_search_box=id=gh-ac
...    btn_search=id=gh-search-btn
...    txt_product_name=//div[@id="srp-river-results"]//*[contains(., "Speaker")]
