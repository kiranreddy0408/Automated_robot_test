*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}            http://dev4.gptfu.com:6080/
${Browser}        firefox

*** Test Cases ***
Open site
    Open Browser  ${URL}  ${BROWSER}  
Verify Apps Link
    Click Element  xpath=//a[@href="/product-category/apps/" and contains(@class, 'bi-grid-fill')]
    Page Should Contain  Apps 
Verify Home link
    Click Element  xpath=//a[@href="http://dev4.gptfu.com:6080/"]
     Page Should Contain  Latest Listings 
Verify Papers link
    Click Element  xpath=//a[@href="/product-category/papers/" and contains(@class,'bi bi-newspaper')]
     Page Should Contain  Papers
     Title Should Be    Paper Archives - gptfu
Verify News link

    Click Element  xpath=//a[@href="/product-category/news/" and contains(@class,'bi bi-globe2')]
     Page Should Contain  News 
Verify Addlisting link

    Click Element  xpath=//a[@href="/my-account/createproduct/" and contains(@class,'bi bi-list-ul')]
     Page Should Contain  Add New Listing 
Verify logo link

    Click Element  xpath=//a[@href="http://dev4.gptfu.com:6080/" and contains(@class,'logo')]
    Page Should Contain  Latest Listings 
