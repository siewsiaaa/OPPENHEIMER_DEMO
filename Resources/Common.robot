#contains the common utilities or keywords
*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Start Browser
    Open Browser  http://localhost:8080/  Chrome
    Maximize Browser Window
