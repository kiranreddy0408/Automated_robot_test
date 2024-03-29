*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary
*** Keywords ***
Test With Viewport
    [Arguments]    ${width}    ${height}
    Set Window Size    ${width}    ${height}
*** Variables ***
${URL}            https://s2.gptfu.com
${URL2}                 ${URL}/wp-admin/
${Browser}              firefox
${TitleInput}        id=product-name
${WebURLInput}       id=web-url
${VideoLinkInput}        id=video-link
${DescriptionInput}      id=product-description
${summaryInput}        id=product-summary
${authorsInput}        id=authors-name
${tagsInput}        id=tag_inp_section


${Title}        vozy
${weburl}       https://www.vozy.co/
${VideoLink}    https://www.vozy.co/
${summary}    id=myCheck
${Description}   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
${authors}    kiran




${UsernameInput}        id=user_login
${PasswordInput}        id=user_pass
${loginButton}          id=wp-submit

${UsernameKeyword}       dkmadhu115
${PasswordKeyword}       GPTfu!Rocks

@{IDs}        listing_app    listing_paper    listing_news   listing_tutorial    listing_misc      
# ${TextToCheck}    Title*    Website Link      
${blog_id}    listing_blog
${prompt_id}    listing_prompt

# @{blog-IDs}        product-name    website_link_section    video_link_section    appSummarySection   product-description     author_section    image_section
@{TextToCheck}    Tite*    Website Link    Video Link    Description*    Summary    Use ChatGPT 3.5 to automatically generate a three point summary:     Tags*    Authors Name*
@{TextToCheck}    Tite*    Website Link    Video Link    Description*    Summary    Use ChatGPT 3.5 to automatically generate a three point summary:     Tags*    Authors Name*
*** Test Cases ***
wp-login
    Open Browser    ${URL2}    ${Browser}
Test Buttons with Different Viewports
    [Documentation]    Test the buttons on the website with different viewports
    Test With Viewport   1820    1080 
    # Add more test cases with different resolutions as needed
    Input Text    ${UsernameInput}   ${UsernameKeyword}  
    Input Text    ${PasswordInput}      ${PasswordKeyword}
    Click Element   ${loginButton}
    Click Element    xpath=//a[@href="${URL}/"]
    Click Element    xpath=//a[@href="/my-account/createproduct/"]
Check Variables for Radio Buttons(all except blogs)

   FOR    ${radio_button_id}    IN    @{IDs}
      Page Should Contain   Title*
      Page Should Contain   Website Link
      Page Should Contain   Video Link
      Page Should Contain   Description*
      Page Should Contain   Summary
      Page Should Contain   Use ChatGPT 3.5 to automatically generate a three point summary:
      Page Should Contain   Tags*
      Page Should Contain   Authors Name
      Page Should Contain   Image
   END
Add listing
    Input Text    ${TitleInput}    ${Title}      
    Input Text    ${WebURLInput}    ${weburl} 
    Input Text    ${VideoLinkInput}    ${VideoLink}
    Input Text    ${DescriptionInput}     ${Description}
    Input Text    ${authorsInput}     ${authors}
    Click Element    ${summary}
    Click Element    class=select2
    Click Element    class=select2-results__option
    Click Element    class=select2-selection__choice
    Click Button     name=create_product
    Page Should Contain Element   class=error-message
# Check Variables for blog button 
#     Click Element    ${blog_id}
#     Page Should Contain    Title*
#     Page Should Contain   Website Link
#     Page Should Contain    Description*
Check Variables for prompt-to-text button
    Click Element    ${prompt_id}
    Click Element   id=out_text
    Page Should Contain   Prompt Input*
    Page Should Contain   Prompt Title
    Page Should Contain   Prompt Input Image (Optional)
    Page Should Contain   Provider Name*
    Page Should Contain   Model Name (Optional)
    Page Should Contain   Model Settings (Optional)
    Page Should Contain   Prompt Input Types*
    Page Should Contain   Prompt Output Types*
    Page Should Contain   Prompt Output*
    Page Should Contain   Prompt Flag*
Check Variables for prompt-to-image button
    Click Element    id=out_image
    Page Should Contain   Prompt Input*
    Page Should Contain   Prompt Title
    Page Should Contain   Prompt Input Image (Optional)
    Page Should Contain   Provider Name*
    Page Should Contain   Model Name (Optional)
    Page Should Contain   Model Settings (Optional)
    Page Should Contain   Prompt Input Types*
    Page Should Contain   Prompt Output Types*
    Page Should Contain   Prompt Output*
    Page Should Contain   Prompt Flag*


    Close Browser

    
    

