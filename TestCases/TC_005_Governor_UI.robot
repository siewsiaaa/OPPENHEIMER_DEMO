*** Settings ***
Library     SeleniumLibrary
Library           Selenium2LibraryExtension
Resource    ../Resources/Common.robot

*** Variables ***
${dispense_url}     http://localhost:8080/dispense

*** Test Cases ***
TC005 Governor UI

    Start Browser
    #AC1: Verify button color and text
    #${style}=   Get Element Attribute   css==a.btn.btn-danger   style
    #Log To Console  Style ${style}

    @{background_color}=  Element Background Color Should Be    id=.btn-danger    rgba(220, 53, 69, 1)
    Log To Console  background_color ${background_color}

    #AC2: Check Dispense Now button
    Page Should Contain Element     xpath=//a[text()='Dispense Now']

    #AC3: Verify Button Link
    ${url}=  get element attribute   xpath=//a[text()='Dispense Now']  href
    Should Be Equal         ${url}      ${dispense_url}
    Click Element           xpath://a[text()='Dispense Now']
    Page Should Contain     Cash dispensed
    Sleep   3

    #Close Browser