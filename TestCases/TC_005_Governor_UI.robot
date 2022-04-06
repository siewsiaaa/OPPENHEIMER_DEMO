*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Common.robot

*** Variables ***
${dispense_url}     http://localhost:8080/dispense

*** Test Cases ***
TC005 Governor UI

    Start Browser
    #AC1: Verify button color and text

    #AC2: Check Dispense Now button
    Page Should Contain Element     xpath=//a[text()='Dispense Now']

    #AC3: Verify Button Link
    ${url}=  get element attribute   xpath=//a[text()='Dispense Now']  href
    Should Be Equal         ${url}      ${dispense_url}
    Click Element           xpath://a[text()='Dispense Now']
    Page Should Contain     Cash dispensed
    Sleep   3

    Close Browser