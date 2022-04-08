#contains the common utilities or keywords
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${server}   localhost:8080
${browser}  Chrome
${url}      http://${server}/

*** Keywords ***
Start Browser
    Open Browser  ${url}  ${browser}
    Maximize Browser Window