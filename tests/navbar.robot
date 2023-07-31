*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}            http://dev4.gptfu.com:6080
${Browser}         firefox

*** Test Cases ***
Open Site
    Open Browser  ${URL}/  ${BROWSER}  
Verify Apps Link
    Click Element  xpath=//a[@href="/product-category/apps/" and contains(@class, 'bi-grid-fill')]
    Page Should Contain  Apps 
Verify Papers link
    Click Element  xpath=//a[@href="/product-category/papers/" and contains(@class,'bi bi-newspaper')]
     Page Should Contain  Papers 
Verify News link

    Click Element  xpath=//a[@href="/product-category/news/" and contains(@class,'bi bi-globe2')]
     Page Should Contain  News 
Verify Blogs link

    Click Element  xpath=//a[@href="/blogger/"]
     Page Should Contain  blogger
#Verify Prompts link

    #Click Element  xpath=//a[@href="/prompts"]
    # Page Should Contain  Prompts  
Verify Addlisting link

    Click Element  xpath=//a[@href="/my-account/createproduct/" and contains(@class,'bi bi-list-ul')]
     Page Should Contain  Add New Listing 
Verify logo link

    Click Element  xpath=//a[@href="${URL}/" and contains(@class,'logo')]
    Page Should Contain  Latest Listings 
    Close Browser
