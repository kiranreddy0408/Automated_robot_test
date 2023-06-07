*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}            https://s.gptfu.com
${Browser}        firefox
${SearchInput}    id=64778240e8901
${SearchButton}   class=aws-search-btn
${SearchKeyword}  fliki      #replace fliki with search key
${SearchKeyword2}  abcdefg

*** Test Cases ***
Open site
    Open Browser  ${URL}  ${BROWSER}
Input test
    Input Text  ${SearchInput}  ${SearchKeyword}
    Click Element  ${SearchButton}
    Page Should Contain  ${SearchKeyword}
    Close Browser
No result Case
    Open Browser  ${URL}  ${BROWSER}
    Input Text  ${SearchInput}  ${SearchKeyword2}
    Click Element  ${SearchButton}
    Page Should Contain  No products were found matching your selection.
    Close Browser
    