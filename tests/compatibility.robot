*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}            https://d2.gptfu.com:6082
${Browser}        firefox


*** Test Cases ***
firefox test
    Open Browser  ${URL}  ${BROWSER}
    Title Should Be    gptfu-transform yourself
    Close Browser


