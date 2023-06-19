*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}            https://dev4.gptfu.com:6080/
${Browser}        chrome


*** Test Cases ***
firefox test
    Open Browser  ${URL}  ${BROWSER}
    Title Should Be    gptfu-transform yourself
    Close Browser


