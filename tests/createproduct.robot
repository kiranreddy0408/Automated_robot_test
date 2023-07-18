*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary
*** Variables ***
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

@{IDs}        listing_app    listing_paper    listing_news   listing_tutorial    listing_misc       # Replace with actual radio button IDs
# ${TextToCheck}    Title*    Website Link       # Replace with actual field variables
${blog_id}    listing_blog
# @{blog-IDs}        product-name    website_link_section    video_link_section    appSummarySection   product-description     author_section    image_section
@{TextToCheck}    Tite*    Website Link    Video Link    Description*    Summary    Use ChatGPT 3.5 to automatically generate a three point summary:     Tags*    Authors Name*
@{TextToCheck}    Tite*    Website Link    Video Link    Description*    Summary    Use ChatGPT 3.5 to automatically generate a three point summary:     Tags*    Authors Name*
*** Test Cases ***
wp-login
    Open Browser    ${URL2}    ${Browser}
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
      Page Should Contain   ummary
      Page Should Contain   Use ChatGPT 3.5 to automatically generate a three point summary:
      Page Should Contain   Tags*
      Page Should Contain   Authors Name*
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
    Click Element    class=selection
    Click Element    id=select2-tag_inp_section-result-abjs-AI Ethics
    # Click Element    class=select2-selection__choice
    Click Button    class=btn
    Page Should Contain Element   class=error-message
Check Variables for blog button 
    Click Element    ${blog_id}
    Page Should Contain    Title*
    Page Should Contain    Description
    Page Should Contain    Website Link
    Page Should Contain    PDF docs
    Close Browser
    
    



