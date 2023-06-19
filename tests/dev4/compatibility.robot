*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}            http://dev4.gptfu.com:6080/
${Browser}        firefox


*** Test Cases ***
Browser test
    Open Browser  ${URL}  ${BROWSER}
    Title Should Be    gptfu-transform yourself
    Close Browser


