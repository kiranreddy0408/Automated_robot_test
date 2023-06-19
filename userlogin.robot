*** Settings ***
Documentation     My First Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}                  https://s.gptfu.com/my-account/
${Browser}              Chrome
${UsernameInput}        id=username
${EmailaddressInput}    id=username
${PasswordInput}        id=password
${loginButton}          name=login
${logoutButton}         class=woocommerce-MyAccount-navigation-link--customer-logout

#verified user
${UsernameKeyword0}      prasad@vellanki.net
${EmailaddressKeyword0}   prasad@vellanki.net
${PasswordKeyword0}       12Gol@conda
#existed non-verified user details
${UsernameKeyword}       santhoshkiran
${EmailaddressKeyword}   santhoshkiran2344@gmail.com
${PasswordKeyword}       santhoshkiran2344@
#unknown user
${UsernameKeyword1}      saikiran10
${EmailaddressKeyword1}  saikiranveerbhadrappasai@gmail.com
${PasswordKeyword1}      saikiran@123
#Invalid password with email
${EmailaddressKeyword3}  prasad@vellanki.net
${PasswordKeyword3}      ghjgfsd67t873jhb
          
*** Test Cases ***
Open site
    Open Browser   ${URL}    ${Browser}
 
Test with username & password
    Input Text    ${UsernameInput}   ${UsernameKeyword}  
    Input Text    ${PasswordInput}      ${PasswordKeyword}
    Click Element   ${loginButton}
    Page should contain  Your account has to be activated before you can login. You can resend the email with verification link by clicking here.
Test with email & password
    Input Text    ${UsernameInput}   ${EmailaddressKeyword} 
    Input Text    ${PasswordInput}      ${PasswordKeyword}
    Click Element   ${loginButton}
	Page should contain  Unknown email address. Check again or try your username.

Unknown user with email
    Input Text   ${Emailaddressinput}   ${EmailaddressKeyword1}
    Input Text    ${PasswordInput}      ${PasswordKeyword1}
    Click Element   ${loginButton}
	Page should Contain    Unknown email address. Check again or try your username.
 
Unknown user with username
    Input Text   ${UsernameInput}   ${UsernameKeyword1}
    Input Text    ${PasswordInput}      ${PasswordKeyword1}
    Click Element   ${loginButton}
	Page should Contain    Error: The username saikiran10 is not registered on this site. If you are unsure of your username, try your email address instead.
 
Invalid password with email
    Input Text    ${EmailaddressInput}  ${EmailaddressKeyword3}
    Input Text    ${PasswordInput}      ${PasswordKeyword3}
    Click Element   ${loginButton}
	Page Should Contain    Error: The password you entered for the email address prasad@vellanki.net is incorrect. Lost your password?

No password with email
    Input Text    ${EmailaddressInput}  ${EmailaddressKeyword0}  
    Click Element   ${loginButton}
	Page Should Contain    Error: The password field is empty.


No password with username
    Input Text    ${UsernameInput}   ${UsernameKeyword0}
    Click Element   ${loginButton}
	Page Should Contain     Error: The password field is empty.
Invalid password with username
    Input Text    ${UsernameInput}   ${UsernameKeyword0}
    Input Text    ${PasswordInput}      ${PasswordKeyword3}
    Click Element   ${loginButton}
	Page Should Contain     Error: The password you entered for the email address prasad@vellanki.net is incorrect. Lost your password?
verifed user
    Input Text   ${Emailaddressinput}   ${EmailaddressKeyword0}
    Input Text    ${PasswordInput}      ${PasswordKeyword0}
    Click Element   ${loginButton}
	Page should Contain   Hello admin (not admin? Log out) 
Logout test
   Click Element   ${logoutButton}
   Page should Contain   My account
