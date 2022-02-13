*Settings*
Documentation       Sessions route test suite

Resource            ${EXECDIR}/resources/Base.robot

*Variables*
&{inv_pass}             email=kate@hotmail.com          password=abc123
&{inv_email}            email=kate.com.br               password=abc123
&{email_404}            email=kate@404.com              password=abc123
&{empty_email}          email=${EMPTY}                  password=abc123
&{without_email}        password=abc123
&{empty_password}       email=kate@hotmail.com          password=${EMPTY}
&{without_password}     email=kate@hotmail.com

*Test Cases*
User session

    ${payload}          Factory User Session    signup
    POST User           ${payload}

    ${payload}          Factory User Session    login
    
    ${response}         POST Session            ${payload}

    Status Should Be    200                 ${response}
    ${size}             Get Length          ${response.json()}[token]
    Should Be True      ${size} > 0
    Should Be Equal     10d                 ${response.json()}[expires_in]

Should Not Get token
    [Template]          Attempt POST Session

    ${inv_pass}             401             Unauthorized
    ${inv_email}            400             Incorrect email
    ${email_404}            401             Unauthorized
    ${empty_email}          400             Required email
    ${without_email}        400             Required email      
    ${empty_password}       400             Required pass
    ${without_password}     400             Required pass

*Keywords*
Attempt POST Session
    [Arguments]     ${payload}          ${status_code}      ${error_message}

    ${response}         POST Session        ${payload}

    Status Should Be    ${status_code}      ${response}
    Should Be Equal     ${error_message}    ${response.json()}[error]     