*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}            https://s.gptfu.com
${Browser}        firefox


*** Test Cases ***
firefox test
    Open Browser  ${URL}  ${BROWSER}
    Close Browser


