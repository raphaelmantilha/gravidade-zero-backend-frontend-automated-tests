*Settings*
Documentation       Authentication actions

*Variables*
${INPUT_EMAIL}      id=email
${INPUT_PASSWORD}   id=password      

*Keywords*
Go To Login Page
    Go To   ${BASE_URL}

    Wait For Elements State     css=.login-form     visible     5

Fill Credentials
    [Arguments]     ${user}        

    Fill Text       ${INPUT_EMAIL}        ${user}[email]
    Fill Text       ${INPUT_PASSWORD}     ${user}[password]

Submit Credentials
    Click           css=.submit-button >> text=Entrar

User Should Be Logged In
    [Arguments]     ${user}

    ${element}              Set Variable    css=a[href="/profile"]     
    ${expected_fullname}    Set Variable    ${user}[name] ${user}[lastname]

    Wait For Elements State         ${element}      visible     5
    Get Text                        ${element}      equal       ${expected_fullname}

Should Be Type Email

    Get Property        ${INPUT_EMAIL}        type        equal       email   


Validate One Empty Field
    [Arguments]     ${message}

    ${element}      Get Element     css=.error    
    
    Get Text        ${element}      equal       ${message}      

Validate Two Empty Fields
    [Arguments]     ${message1}     ${message2}

    ${elements}     Get Elements    css=.error    
    
    Get Text            ${elements}[0]      equal       ${message1}
    Get Text            ${elements}[1]      equal       ${message2}             

