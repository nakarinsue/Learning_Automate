*** Settings ***
Library    Collections
Library    Process
Library    String
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn
Library    yaml

# common
Resource    ${CURDIR}/../keywords/common/common.resource

# variables
Variables    ${CURDIR}/datatests/data_tests.yaml

# locators
Resource    ${CURDIR}/locators/ebay_home_locators.resource
Resource    ${CURDIR}/locators/amazon_home_locators.resource

# features    
Resource    ${CURDIR}/../keywords/ui/features/ebay_home_features.resource
Resource    ${CURDIR}/../keywords/ui/features/amazon_home_features.resource

# pages
Resource    ${CURDIR}/../keywords/ui/pages/ebay_home_pages.resource
Resource    ${CURDIR}/../keywords/ui/pages/amazon_home_pages.resource