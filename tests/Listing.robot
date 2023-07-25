*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary
*** Variables ***
#${URL}                  http://d2.gptfu.com:6080
${Browser}              firefox
${tagButton}            class=tag-button
${catButton}            class=cat-button
${ImageAnchorTag}       class=item-thumbnail
${apps}                 xpath=//a[@href="/product-category/apps/" and contains(@class, 'bi-grid-fill')]


*** Test Cases ***
Open site
    Open Browser   ${URL}    ${Browser}
    Click Element    ${apps} 
Title redirect test
    Click Element           class=main-color-1-hover
    Page should contain     Summary
    Click Element           ${apps}
Image redirect test 
    Click Element           ${ImageAnchorTag} 
    Page should contain     Summary
    Click Element           ${apps}
Category redirect test
    Click Element           ${catButton} 
    Page should contain     Apps 
    Click Element           ${apps}
Tag redirect test
    Click Element           ${tagButton} 
    Page should contain     Showing
    Click Element           ${apps}


