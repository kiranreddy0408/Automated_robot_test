*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}            https://d.gptfu.com:6082
${Browser}        firefox


*** Test Cases ***
firefox test
    Open Browser  ${URL}  ${BROWSER}
    Close Browser


