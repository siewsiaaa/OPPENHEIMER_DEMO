*** Settings ***
Documentation   Suite Description

*** Variables ***
${SERVER}   localhost:8080
${BROWSER}  Chrome
${DELAY}    0
${URL}      http://${SERVER}/


*** Test Cases ***
Test title
    [Tags]  DEBUG
    Provided precondition
    When action
    Then check expectations

*** Keywords ***
Start Browser
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}

