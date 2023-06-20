*** Settings ***
Library  SeleniumLibrary
Resource    config.resource
*** Variables ***
${Browser}        firefox
${SearchInput}    class=aws-search-field
${SearchButton}   class=aws-search-btn
${SearchKeyword}  fliki      #replace fliki with search key
${SearchKeyword2}  abcdefg

*** Test Cases ***
Open site
    Open Browser  ${URL}  ${BROWSER}
Input search text
    Input Text  ${SearchInput}  ${SearchKeyword}
    Click Element  ${SearchButton}
Search result test
    Page Should Contain  ${SearchKeyword}
    Close Browser
No result Case
    Open Browser  ${URL}  ${BROWSER}
    Input Text  ${SearchInput}  ${SearchKeyword2}
    Click Element  ${SearchButton}
    Page Should Contain  No products were found matching your selection.
    Close Browser
    
